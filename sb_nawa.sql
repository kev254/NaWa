-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 07, 2023 at 04:56 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sb$nawa`
--

-- --------------------------------------------------------

--
-- Table structure for table `nanwa_disputes`
--

CREATE TABLE `nanwa_disputes` (
  `dispute_id` int(11) NOT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `sender` int(11) DEFAULT NULL,
  `recipient` int(11) DEFAULT NULL,
  `txid` varchar(255) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `escalate_review` int(11) DEFAULT NULL,
  `escalate_message` text DEFAULT NULL,
  `escalate_issued_by` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created` int(11) DEFAULT NULL,
  `updated` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nawa_activity`
--

CREATE TABLE `nawa_activity` (
  `activity_id` int(11) NOT NULL,
  `txid` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `deposit_via` int(11) DEFAULT NULL,
  `withdrawal_via` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created` int(11) DEFAULT NULL,
  `updated` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nawa_admin_logs`
--

CREATE TABLE `nawa_admin_logs` (
  `admin_log_id` int(11) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `u_field_1` varchar(255) DEFAULT NULL,
  `u_field_2` varchar(255) DEFAULT NULL,
  `u_field_3` varchar(255) DEFAULT NULL,
  `u_field_4` varchar(255) DEFAULT NULL,
  `u_field_5` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nawa_deposits`
--

CREATE TABLE `nawa_deposits` (
  `deposit_id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `txid` varchar(255) DEFAULT NULL,
  `method` int(11) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `requested_on` int(11) DEFAULT NULL,
  `processed_on` int(11) DEFAULT NULL,
  `gateway_txid` varchar(255) DEFAULT NULL,
  `reference_number` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nawa_gateways`
--

CREATE TABLE `nawa_gateways` (
  `gateway_id` int(11) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `reserve` varchar(255) DEFAULT NULL,
  `min_amount` varchar(255) DEFAULT NULL,
  `max_amount` varchar(255) DEFAULT NULL,
  `exchange_type` int(11) DEFAULT NULL,
  `include_fee` int(11) DEFAULT NULL,
  `extra_fee` varchar(255) DEFAULT NULL,
  `fee` varchar(255) DEFAULT NULL,
  `allow_send` int(11) DEFAULT NULL,
  `allow_receive` int(11) DEFAULT NULL,
  `default_send` int(11) DEFAULT NULL,
  `default_receive` int(11) DEFAULT NULL,
  `allow_payouts` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `external_gateway` int(11) NOT NULL DEFAULT 0,
  `external_icon` text DEFAULT NULL,
  `process_type` int(11) DEFAULT NULL,
  `process_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nawa_knowledge_articles`
--

CREATE TABLE `nawa_knowledge_articles` (
  `knowledge_article_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated` int(11) DEFAULT NULL,
  `added_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nawa_loan_request`
--

CREATE TABLE `nawa_loan_request` (
  `request_id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `fromu` int(11) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `requested_on` int(11) DEFAULT NULL,
  `processed_on` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nawa_payments`
--

CREATE TABLE `nawa_payments` (
  `payment_id` int(11) NOT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `txid` varchar(255) DEFAULT NULL,
  `merchant_account` varchar(255) DEFAULT NULL,
  `item_number` varchar(255) DEFAULT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `item_price` varchar(255) DEFAULT NULL,
  `item_currency` varchar(255) DEFAULT NULL,
  `return_success` varchar(255) DEFAULT NULL,
  `return_fail` varchar(255) DEFAULT NULL,
  `return_cancel` varchar(255) DEFAULT NULL,
  `payment_time` int(11) DEFAULT NULL,
  `payment_status` int(11) DEFAULT NULL,
  `payee_account` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nawa_settings`
--

CREATE TABLE `nawa_settings` (
  `settings_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `infoemail` varchar(255) DEFAULT NULL,
  `supportemail` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `default_language` varchar(255) DEFAULT NULL,
  `default_template` varchar(255) DEFAULT NULL,
  `default_currency` varchar(255) DEFAULT NULL,
  `logo` text DEFAULT NULL,
  `require_email_verify` int(11) DEFAULT NULL,
  `require_document_verify` int(11) DEFAULT NULL,
  `limit_maxamount_sent` int(11) DEFAULT NULL,
  `limit_maxtxs_sent` int(11) DEFAULT NULL,
  `payfee_type` int(11) DEFAULT NULL,
  `payfee_side` int(11) DEFAULT NULL,
  `payfee_percentage` int(11) DEFAULT NULL,
  `enable_recaptcha` int(11) DEFAULT NULL,
  `recaptcha_publickey` varchar(255) DEFAULT NULL,
  `recaptcha_privatekey` varchar(255) DEFAULT NULL,
  `enable_curcnv` int(11) DEFAULT NULL,
  `curcnv_api` varchar(255) DEFAULT NULL,
  `curcnv_fee_percentage` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nawa_transactions`
--

CREATE TABLE `nawa_transactions` (
  `trans_id` int(11) NOT NULL,
  `txid` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `sender` int(11) DEFAULT NULL,
  `recipient` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `fee` varchar(255) DEFAULT NULL,
  `deposit_via` int(11) DEFAULT NULL,
  `withdrawal_via` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created` int(11) DEFAULT NULL,
  `updated` int(11) DEFAULT NULL,
  `item_id` varchar(255) DEFAULT NULL,
  `item_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nawa_users`
--

CREATE TABLE `nawa_users` (
  `user_id` int(11) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `password_recovery` varchar(255) DEFAULT NULL,
  `document_verified` int(11) DEFAULT NULL,
  `email_verified` int(11) DEFAULT NULL,
  `email_hash` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `account_type` int(11) DEFAULT NULL,
  `account_level` int(11) DEFAULT NULL,
  `account_user` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `last_login` int(11) DEFAULT NULL,
  `signup_time` int(11) DEFAULT NULL,
  `2fa_auth` int(11) DEFAULT NULL,
  `2fa_auth_login` int(11) DEFAULT NULL,
  `2fa_auth_send` int(11) DEFAULT NULL,
  `2fa_auth_withdrawal` int(11) DEFAULT NULL,
  `googlecode` varchar(255) DEFAULT NULL,
  `wallet_passphrase` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(36) NOT NULL,
  `id_number` int(12) NOT NULL,
  `business_name` varchar(255) DEFAULT NULL,
  `merchant_api_key` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `birthday_date` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nawa_users_convertions`
--

CREATE TABLE `nawa_users_convertions` (
  `converstions_id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `from_wallet` int(11) DEFAULT NULL,
  `to_wallet` int(11) DEFAULT NULL,
  `from_amount` varchar(255) DEFAULT NULL,
  `from_currency` varchar(5) DEFAULT NULL,
  `to_amount` varchar(255) DEFAULT NULL,
  `to_currency` varchar(5) DEFAULT NULL,
  `from_rate` varchar(255) DEFAULT NULL,
  `to_rate` varchar(255) DEFAULT NULL,
  `fee` varchar(255) DEFAULT NULL,
  `created` int(11) DEFAULT NULL,
  `updated` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nawa_users_documents`
--

CREATE TABLE `nawa_users_documents` (
  `user_document_id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `document_type` int(11) DEFAULT NULL,
  `document_path` text DEFAULT NULL,
  `uploaded` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nawa_users_wallets`
--

CREATE TABLE `nawa_users_wallets` (
  `user_wallet_id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `user_id` int(36) NOT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `currency` varchar(5) DEFAULT NULL,
  `updated` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nawa_user_earnings`
--

CREATE TABLE `nawa_user_earnings` (
  `earnings_id` int(11) NOT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `created` int(11) DEFAULT NULL,
  `updated` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nawa_withdrawals`
--

CREATE TABLE `nawa_withdrawals` (
  `withdrwal_id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `txid` varchar(255) DEFAULT NULL,
  `method` int(11) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `fee` varchar(255) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `requested_on` int(11) DEFAULT NULL,
  `processed_on` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nawa_withdrawals_values`
--

CREATE TABLE `nawa_withdrawals_values` (
  `withdrawals_value_id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `withdrawal_id` int(11) DEFAULT NULL,
  `gateway_id` int(11) DEFAULT NULL,
  `field_id` int(11) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pw_disputes_messages`
--

CREATE TABLE `pw_disputes_messages` (
  `message_id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `dispute_id` int(11) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `attachment` text DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `is_admin` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wallet_source`
--

CREATE TABLE `wallet_source` (
  `wallet_source_id` int(11) NOT NULL,
  `wallet_source_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `source_limit` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wallet_source_type`
--

CREATE TABLE `wallet_source_type` (
  `wallet_source_type_id` int(11) NOT NULL,
  `source_name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wallet_source_type`
--

INSERT INTO `wallet_source_type` (`wallet_source_type_id`, `source_name`, `created_at`, `updated_at`) VALUES
(1, 'Income', '2023-12-07 03:46:40', '2023-12-07 03:46:40'),
(2, 'Expense', '2023-12-07 03:46:40', '2023-12-07 03:46:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `nanwa_disputes`
--
ALTER TABLE `nanwa_disputes`
  ADD PRIMARY KEY (`dispute_id`),
  ADD KEY `sender_fk` (`sender`),
  ADD KEY `recepient_fk` (`recipient`);

--
-- Indexes for table `nawa_activity`
--
ALTER TABLE `nawa_activity`
  ADD PRIMARY KEY (`activity_id`);

--
-- Indexes for table `nawa_admin_logs`
--
ALTER TABLE `nawa_admin_logs`
  ADD PRIMARY KEY (`admin_log_id`);

--
-- Indexes for table `nawa_deposits`
--
ALTER TABLE `nawa_deposits`
  ADD PRIMARY KEY (`deposit_id`);

--
-- Indexes for table `nawa_gateways`
--
ALTER TABLE `nawa_gateways`
  ADD PRIMARY KEY (`gateway_id`);

--
-- Indexes for table `nawa_knowledge_articles`
--
ALTER TABLE `nawa_knowledge_articles`
  ADD PRIMARY KEY (`knowledge_article_id`);

--
-- Indexes for table `nawa_loan_request`
--
ALTER TABLE `nawa_loan_request`
  ADD PRIMARY KEY (`request_id`);

--
-- Indexes for table `nawa_payments`
--
ALTER TABLE `nawa_payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `nawa_settings`
--
ALTER TABLE `nawa_settings`
  ADD PRIMARY KEY (`settings_id`);

--
-- Indexes for table `nawa_transactions`
--
ALTER TABLE `nawa_transactions`
  ADD PRIMARY KEY (`trans_id`);

--
-- Indexes for table `nawa_users`
--
ALTER TABLE `nawa_users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `nawa_users_convertions`
--
ALTER TABLE `nawa_users_convertions`
  ADD PRIMARY KEY (`converstions_id`);

--
-- Indexes for table `nawa_users_documents`
--
ALTER TABLE `nawa_users_documents`
  ADD PRIMARY KEY (`user_document_id`);

--
-- Indexes for table `nawa_users_wallets`
--
ALTER TABLE `nawa_users_wallets`
  ADD PRIMARY KEY (`user_wallet_id`),
  ADD KEY `user_fk` (`user_id`);

--
-- Indexes for table `nawa_user_earnings`
--
ALTER TABLE `nawa_user_earnings`
  ADD PRIMARY KEY (`earnings_id`);

--
-- Indexes for table `nawa_withdrawals`
--
ALTER TABLE `nawa_withdrawals`
  ADD PRIMARY KEY (`withdrwal_id`);

--
-- Indexes for table `nawa_withdrawals_values`
--
ALTER TABLE `nawa_withdrawals_values`
  ADD PRIMARY KEY (`withdrawals_value_id`);

--
-- Indexes for table `pw_disputes_messages`
--
ALTER TABLE `pw_disputes_messages`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `wallet_source`
--
ALTER TABLE `wallet_source`
  ADD PRIMARY KEY (`wallet_source_id`),
  ADD KEY `wallet_source_type_id` (`wallet_source_type_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `wallet_source_type`
--
ALTER TABLE `wallet_source_type`
  ADD PRIMARY KEY (`wallet_source_type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nanwa_disputes`
--
ALTER TABLE `nanwa_disputes`
  MODIFY `dispute_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nawa_activity`
--
ALTER TABLE `nawa_activity`
  MODIFY `activity_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nawa_admin_logs`
--
ALTER TABLE `nawa_admin_logs`
  MODIFY `admin_log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nawa_deposits`
--
ALTER TABLE `nawa_deposits`
  MODIFY `deposit_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nawa_gateways`
--
ALTER TABLE `nawa_gateways`
  MODIFY `gateway_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nawa_knowledge_articles`
--
ALTER TABLE `nawa_knowledge_articles`
  MODIFY `knowledge_article_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nawa_loan_request`
--
ALTER TABLE `nawa_loan_request`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nawa_payments`
--
ALTER TABLE `nawa_payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nawa_settings`
--
ALTER TABLE `nawa_settings`
  MODIFY `settings_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nawa_transactions`
--
ALTER TABLE `nawa_transactions`
  MODIFY `trans_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nawa_users`
--
ALTER TABLE `nawa_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nawa_users_convertions`
--
ALTER TABLE `nawa_users_convertions`
  MODIFY `converstions_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nawa_users_documents`
--
ALTER TABLE `nawa_users_documents`
  MODIFY `user_document_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nawa_users_wallets`
--
ALTER TABLE `nawa_users_wallets`
  MODIFY `user_wallet_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nawa_user_earnings`
--
ALTER TABLE `nawa_user_earnings`
  MODIFY `earnings_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nawa_withdrawals`
--
ALTER TABLE `nawa_withdrawals`
  MODIFY `withdrwal_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nawa_withdrawals_values`
--
ALTER TABLE `nawa_withdrawals_values`
  MODIFY `withdrawals_value_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pw_disputes_messages`
--
ALTER TABLE `pw_disputes_messages`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wallet_source`
--
ALTER TABLE `wallet_source`
  MODIFY `wallet_source_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wallet_source_type`
--
ALTER TABLE `wallet_source_type`
  MODIFY `wallet_source_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `nanwa_disputes`
--
ALTER TABLE `nanwa_disputes`
  ADD CONSTRAINT `recepient_fk` FOREIGN KEY (`recipient`) REFERENCES `nawa_users` (`user_id`),
  ADD CONSTRAINT `sender_fk` FOREIGN KEY (`sender`) REFERENCES `nawa_users` (`user_id`);

--
-- Constraints for table `nawa_users_wallets`
--
ALTER TABLE `nawa_users_wallets`
  ADD CONSTRAINT `user_fk` FOREIGN KEY (`user_id`) REFERENCES `nawa_users` (`user_id`);

--
-- Constraints for table `wallet_source`
--
ALTER TABLE `wallet_source`
  ADD CONSTRAINT `wallet_source_ibfk_1` FOREIGN KEY (`wallet_source_type_id`) REFERENCES `wallet_source_type` (`wallet_source_type_id`),
  ADD CONSTRAINT `wallet_source_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `nawa_users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
