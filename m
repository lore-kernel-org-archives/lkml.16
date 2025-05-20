Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FAC1E835B
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 05:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747719294; cv=none; b=m6grg+mMx8q+vaH3kYz/xySVV5UgjW1EK6Xv0qCJYr2x7uSChy4nSIgK3YDzEJqVDTvBGBjWTdPi7N8nxBlN8TKytlD0yYBtpWI4MmA+q45PG0JSEFugBgnS1o/7GP5cEWdnhZyZrVsB7lf3RgOYX5nyxyldfC768RHQvdQBKFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747719294; c=relaxed/simple;
	bh=URKVuzMn08IfAGrd6Euk8GdP5Mk+qwh0+VyqTvfI+XA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rbrt+S30WSnjGWIRnhplVXWZVh+H36aVHgz/X8FF4hec6ENABKMXYAlPU4EHPcAzoiVI3rDQOjl+sIf86CMSOYQK4tfiSBEbgdSvI8qc2JjHkxX42FbntSIBOWI8EQL0tyNXY53ujVun4e3ewwqM4I1UzQ7/VHE09g1XodWzeWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QkIKVmZJ; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QkIKVmZJ"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7376dd56f8fso6008273b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 22:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747719292; x=1748324092; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sJMPUCs8VQyw0KTGePcn7YJkU6n6luiSoyPxP0fVYvg=;
        b=QkIKVmZJ5zDXck8BCbsx6xLdAfhWmG/qejXD6QjqTEHuk+1sXHDJWgowItAEC/zqZ+
         /Cw+4BsYXAWDJ7Lv6TOTlUOH+eSayoi753xmm4hirjejhUSTu53/qmWk15C6Q8TY/J+f
         1ZNT8ClZrbNePoZXiGzEWjdpezjKXR2EIwb+WzUD/opB6orLpCiIuhBNKBo0pAsZ5N84
         MCQKk9c71L6JVKXf+m4VWBJEgYo6TWvsXnm86BYtlI+poWBwsOtN5JEbx+N9hlpZLqVw
         wKaBhAZ2mh+JVtEMyZ2yNlJXHkATxsEUS+IyrK6pmXVxTMSIDQEy1hf+BFvTJoYqgoBr
         a4Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747719292; x=1748324092;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sJMPUCs8VQyw0KTGePcn7YJkU6n6luiSoyPxP0fVYvg=;
        b=iccdQMsIwKKtFkzqsm8gbSiscJMQr02bng2Z5k/ZUI54uztYlAoj8g/EIvjAze8sg1
         TKQ7nd8apeg42cLYElHL6ru9w+ES0EyVuIOOcSmQTJzK7MYod0nFN74bgj+i6VZbuFk4
         dOQ240GgP/p1Yz4CXYP1ZJydVxzMqXds6D+nqU8cD3SpvNzN8hor+0g15C6oG4Pvwhv2
         HdqHES5t7KA6L/c967kRPFXLzWPw5XXGvt4Y4kYFHDENOVjdlclSVjwGuhDd+tG7lowz
         AuOmYwOzjaye2yOZMQupl7EXbse+deplwxeEeO9yHBMEzjwuWk94d5+sGdkurp9znuUN
         jxbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVh+mi1KvvbssGBLPR9SvqerZyx/UOJEp3ZTMZvzRYsonHv6ckxqoy2ZzuYPTbKKHc3BZbTx0N5/ehHB+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNm+Pcl9X/FW34Q7REuLeiSwJ2aKeNlbaiQi14r/q3aUzeUN7Y
	6bSaYfVKyqNyPGbnf6iNFwAHeggtR6t3XZT1sO2S4z4yGBjbor85Ta+6oghrhHft5ZY=
X-Gm-Gg: ASbGncvdQWeqyVNKA9RK9/TQpIBR8nmgYbh3LzwAYS8r9M1vZS3ImYI/xv36iAsAyEd
	zpPF6nneZwQijqlBfa0jE15nZr3NUIVUta4rT8xK6HyqYoBcuoHnZk77Srgjylkvf81Pvul0hr7
	KLakqh79ImFo/7NbFJUT1vgma0RX1aEpanWYPfHx3tLM4+8dYCQSEX9cEETIf6cBp890imFHfp0
	2+qoRsqCfcrvF2L0Yn9J1RCZ9RBwj0gkwuFmF0fCaUhM1iRxHglBdAR8qko/+MiERbmBOnkLw0a
	PFCUnoA+WFYHGzbHNVPtZSp57HbnDd7dIyrcq7Eqkx9P
X-Google-Smtp-Source: AGHT+IGDSBX5UeCRSKppT5cT/QW7MYqZuCm3dSGXytsHQKowz1AiXvPyBTU8dOaySiQ5bOo2c0b+Kg==
X-Received: by 2002:a05:6a00:2e9b:b0:73e:1e21:b653 with SMTP id d2e1a72fcca58-742a978e6a3mr20622144b3a.5.1747719291986;
        Mon, 19 May 2025 22:34:51 -0700 (PDT)
Received: from debian ([1.238.22.220])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9876d51sm7377811b3a.141.2025.05.19.22.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 22:34:51 -0700 (PDT)
Date: Mon, 19 May 2025 22:34:47 -0700
From: Sunghun Son <thswpvm1111@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: octeon: remove typedef declaration
Message-ID: <aCwUd0JNdav9BH6h@debian>
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
This is my first time contributing to the kernel.
I now understand how to enable modules through menuconfig.
The reason why 'my previous build' is not working is because I didn't enable the module in menuconfig.
Please let me know if there are any issues.
Thank you.

 drivers/staging/octeon/ethernet.c     |  6 ++--
 drivers/staging/octeon/octeon-stubs.h | 49 +++++++++++++--------------
 2 files changed, 27 insertions(+), 28 deletions(-)

diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index eadb74fc14c8..2f58a6c0e2e7 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -201,8 +201,8 @@ EXPORT_SYMBOL(cvm_oct_free_work);
  */
 static struct net_device_stats *cvm_oct_common_get_stats(struct net_device *dev)
 {
-	cvmx_pip_port_status_t rx_status;
-	cvmx_pko_port_status_t tx_status;
+	struct cvmx_pip_port_status rx_status;
+	struct cvmx_pko_port_status_t tx_status;
 	struct octeon_ethernet *priv = netdev_priv(dev);
 
 	if (priv->port < CVMX_PIP_NUM_INPUT_PORTS) {
@@ -798,7 +798,7 @@ static int cvm_oct_probe(struct platform_device *pdev)
 
 	num_interfaces = cvmx_helper_get_number_of_interfaces();
 	for (interface = 0; interface < num_interfaces; interface++) {
-		cvmx_helper_interface_mode_t imode =
+		enum cvmx_helper_interface_mode imode =
 		    cvmx_helper_interface_get_mode(interface);
 		int num_ports = cvmx_helper_ports_on_interface(interface);
 		int port;
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

