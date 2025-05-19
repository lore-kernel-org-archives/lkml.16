Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6741CAA6E
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 06:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747636184; cv=none; b=s2skKbg7iq6NJzMwlTGZkfMXHAT9LAyz0bfwHFrsfVoEwNfShynZPydqQu/8mF4Ko9Q2+C5av3m+hTJ1C5DWF2i5k/Wo9unxq4yxWlfTjzJUUx/dGtFc8o2YypZuMc1tPO2F+XXz9F7z4gUkp1bgQ/Wi2QlBSiMCSXh1B6Juzak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747636184; c=relaxed/simple;
	bh=yxZ88PlFUaMu5h3WE1La2O/dnFUz0ysTS6gH8WEt05o=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AfZFtj2em424DqfD3uYHeZWK2qD+/EVnDj7oTNF3svi0KjwcVrY55T535I3SfiKQHHrvFuDvJKv1+CwotaiFRYYN48t3TM40FFeMksibDsuUl9GVPwFISdFulEiZRd5KV3bysWs5joodsQBX2MpMSepl1GltGaSiJQzPV8/5j60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=beBdmgxQ; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="beBdmgxQ"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so3200810b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 23:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747636182; x=1748240982; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pCTXTihQyq4BkMSwWx91CaD+PF/k+pQgDBveUp2EsO4=;
        b=beBdmgxQknXcYmk2ymKj7qoa8rUN4jkcFi0gJmu1bYDRNhZbNbHrKu0UkRBXr1UD5b
         C8XBaOPiGqUHjCdd2ZzcZJUgP3eBGVIxFM+1PzgiABs08vRNXt2PQQ1oYngsnLPtTaZK
         C+Ss9jD7bilcNkQepbsGpu0tcXnenQN7YFgDg/b57nVc4jLXsuHD/9m8PHGXa/kGzT5F
         oa/FvRo6OUb/IkbSTrq+4mTHdEuUunoMQvrCFKm34cl+dx6pG5mvbpyLnwv93GyOpLqp
         FIAZBeBhySF7dD9E9d419Hg13I/UXCgx02tROfP1s4D3oW8RTasDsH3A7HcfG3zD3rym
         gfKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747636182; x=1748240982;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pCTXTihQyq4BkMSwWx91CaD+PF/k+pQgDBveUp2EsO4=;
        b=KiqXabRFLzRl7NkaWUGv3NznxdZXZb4vT+mpHtLmTVE2ouhrWPZPhynESxrMnOvBaG
         +YxXitzcA22Bt29r08Dcqy5D6FJ6OoUAcV2yQj3tSX4w+Dqx/OSkpmIvnyr2Q5ZazSf1
         7EqlCcAizHxaef6HjTJ6pdNNvA3ltznvpgiEQTBtZVOeeUGogKI770RLcv3ofPKeCLAj
         17bH7x0zJj/BO/FyN+brWFe2kZiAPnEaeHCrz/dwrM/is+vX7DSZgA51Yj46N8iJ/UC6
         7ZGKMf5ZHCX6/K3vRZSxv75AA+Qqik0GmXAzmvhcxfkkWc3ctBwqu2drcz4sAlu5UPh7
         KIBw==
X-Forwarded-Encrypted: i=1; AJvYcCU3wblbY/k7P0rd5dianwHXFdHw2lspnXaGepVS1EeIBVV0ThGK23LY6DpjU8DG5IqMwzsp6LNELZxg8xM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtQ0PfH3rhxnNttUkLJ12lyrnz7DUV6Ji9murLf8IuB1ujOu2a
	OMpXpEuU7VKSeAE7MAorsP8AZdcgiexNZD1BDvG4LFbewafynQVYcVIk
X-Gm-Gg: ASbGncugjGzy+H1lCW//tdGqdSgCwBqCVHekCLRdYbNp3IKtSVOr8JC7R1n618aozqT
	NVXvyC/G09GLn52Eez8aRT254byalVCLnaUt0ez6pFGCBOkNN7DXe3CYhrfNuzCFVQtP3YQ+Vvr
	j8pt6WNszUEaLcXKgb4bewCNpdhT0yGK6rY17g39rqLQHTxSjKiCZ/vYyut0qU5VzVE5JeMNYQF
	8uIAdkrT61tu/DPL7LVF/01G9jlb+IWm/LTs7QzRPdgKV0c8hdsHKaHCVgcO6boRNmbcE/I5/jR
	L91lemiZ6kDXy+afv/0YWi8FhVIjRVrJLJ0Log3Qfcrg
X-Google-Smtp-Source: AGHT+IGTLBWuPgk8PzYM4BOq5NZjGjQoSW7DZzjjughF4jDj0fSpTahO6VPitIDdQlDm9ier2vX44w==
X-Received: by 2002:a05:6a21:900c:b0:1f5:790c:947 with SMTP id adf61e73a8af0-216218f7a98mr15697115637.19.1747636181748;
        Sun, 18 May 2025 23:29:41 -0700 (PDT)
Received: from debian ([1.238.22.220])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e7d58eee2sm5835889a91.40.2025.05.18.23.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 23:29:41 -0700 (PDT)
Date: Sun, 18 May 2025 23:29:38 -0700
From: Sunghun Son <thswpvm1111@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: octeon: remove typedef declaration
Message-ID: <aCrP0mBkFxfZKUZT@debian>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove typedef declaration from several structs.
Also replace related function signatures to reflect these changes.
Issue found by checkpatch.pl

Signed-off-by: Sunghun Son <thswpvm1111@gmail.com>
---
 drivers/staging/octeon/octeon-stubs.h | 49 +++++++++++++--------------
 1 file changed, 24 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
index 44cced319c11..5de94792ccf2 100644
--- a/drivers/staging/octeon/octeon-stubs.h
+++ b/drivers/staging/octeon/octeon-stubs.h
@@ -213,14 +213,14 @@ enum cvmx_fau_op_size {
 	CVMX_FAU_OP_SIZE_64 = 3
 };
 
-typedef enum {
+enum cvmx_spi_mode {
 	CVMX_SPI_MODE_UNKNOWN = 0,
 	CVMX_SPI_MODE_TX_HALFPLEX = 1,
 	CVMX_SPI_MODE_RX_HALFPLEX = 2,
 	CVMX_SPI_MODE_DUPLEX = 3
-} cvmx_spi_mode_t;
+};
 
-typedef enum {
+enum cvmx_helper_interface_mode {
 	CVMX_HELPER_INTERFACE_MODE_DISABLED,
 	CVMX_HELPER_INTERFACE_MODE_RGMII,
 	CVMX_HELPER_INTERFACE_MODE_GMII,
@@ -231,20 +231,20 @@ typedef enum {
 	CVMX_HELPER_INTERFACE_MODE_PICMG,
 	CVMX_HELPER_INTERFACE_MODE_NPI,
 	CVMX_HELPER_INTERFACE_MODE_LOOP,
-} cvmx_helper_interface_mode_t;
+};
 
-typedef enum {
+enum cvmx_pow_wait {
 	CVMX_POW_WAIT = 1,
 	CVMX_POW_NO_WAIT = 0,
-} cvmx_pow_wait_t;
+};
 
-typedef enum {
+enum cvmx_pko_lock {
 	CVMX_PKO_LOCK_NONE = 0,
 	CVMX_PKO_LOCK_ATOMIC_TAG = 1,
 	CVMX_PKO_LOCK_CMD_QUEUE = 2,
-} cvmx_pko_lock_t;
+};
 
-typedef enum {
+enum cvmx_pko_status {
 	CVMX_PKO_SUCCESS,
 	CVMX_PKO_INVALID_PORT,
 	CVMX_PKO_INVALID_QUEUE,
@@ -252,7 +252,7 @@ typedef enum {
 	CVMX_PKO_NO_MEMORY,
 	CVMX_PKO_PORT_ALREADY_SETUP,
 	CVMX_PKO_CMD_QUEUE_INIT_ERROR
-} cvmx_pko_status_t;
+};
 
 enum cvmx_pow_tag_type {
 	CVMX_POW_TAG_TYPE_ORDERED   = 0L,
@@ -384,7 +384,7 @@ union cvmx_ipd_sub_port_qos_cnt {
 	} s;
 };
 
-typedef struct {
+struct cvmx_pip_port_status {
 	uint32_t dropped_octets;
 	uint32_t dropped_packets;
 	uint32_t pci_raw_packets;
@@ -407,13 +407,13 @@ typedef struct {
 	uint32_t inb_packets;
 	uint64_t inb_octets;
 	uint16_t inb_errors;
-} cvmx_pip_port_status_t;
+};
 
-typedef struct {
+struct cvmx_pko_port_status_t {
 	uint32_t packets;
 	uint64_t octets;
 	uint64_t doorbell;
-} cvmx_pko_port_status_t;
+};
 
 union cvmx_pip_frm_len_chkx {
 	uint64_t u64;
@@ -1258,15 +1258,14 @@ static inline int octeon_is_simulation(void)
 }
 
 static inline void cvmx_pip_get_port_status(uint64_t port_num, uint64_t clear,
-					    cvmx_pip_port_status_t *status)
+					    struct cvmx_pip_port_status *status)
 { }
 
 static inline void cvmx_pko_get_port_status(uint64_t port_num, uint64_t clear,
-					    cvmx_pko_port_status_t *status)
+					    struct cvmx_pko_port_status_t *status)
 { }
 
-static inline cvmx_helper_interface_mode_t cvmx_helper_interface_get_mode(int
-								   interface)
+static inline enum cvmx_helper_interface_mode cvmx_helper_interface_get_mode(int interface)
 {
 	return 0;
 }
@@ -1342,11 +1341,11 @@ static inline unsigned int cvmx_get_core_num(void)
 }
 
 static inline void cvmx_pow_work_request_async_nocheck(int scr_addr,
-						       cvmx_pow_wait_t wait)
+						       enum cvmx_pow_wait wait)
 { }
 
 static inline void cvmx_pow_work_request_async(int scr_addr,
-					       cvmx_pow_wait_t wait)
+					       enum cvmx_pow_wait wait)
 { }
 
 static inline struct cvmx_wqe *cvmx_pow_work_response_async(int scr_addr)
@@ -1356,13 +1355,13 @@ static inline struct cvmx_wqe *cvmx_pow_work_response_async(int scr_addr)
 	return wqe;
 }
 
-static inline struct cvmx_wqe *cvmx_pow_work_request_sync(cvmx_pow_wait_t wait)
+static inline struct cvmx_wqe *cvmx_pow_work_request_sync(enum cvmx_pow_wait wait)
 {
 	return (void *)(unsigned long)wait;
 }
 
 static inline int cvmx_spi_restart_interface(int interface,
-					     cvmx_spi_mode_t mode, int timeout)
+					     enum cvmx_spi_mode mode, int timeout)
 {
 	return 0;
 }
@@ -1381,12 +1380,12 @@ static inline union cvmx_gmxx_rxx_rx_inbnd cvmx_spi4000_check_speed(int interfac
 }
 
 static inline void cvmx_pko_send_packet_prepare(uint64_t port, uint64_t queue,
-						cvmx_pko_lock_t use_locking)
+						enum cvmx_pko_lock use_locking)
 { }
 
-static inline cvmx_pko_status_t cvmx_pko_send_packet_finish(uint64_t port,
+static inline enum cvmx_pko_status cvmx_pko_send_packet_finish(uint64_t port,
 		uint64_t queue, union cvmx_pko_command_word0 pko_command,
-		union cvmx_buf_ptr packet, cvmx_pko_lock_t use_locking)
+		union cvmx_buf_ptr packet, enum cvmx_pko_lock use_locking)
 {
 	return 0;
 }
-- 
2.39.5

