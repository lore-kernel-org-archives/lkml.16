Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A130F256C96
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151834; cv=none; b=NlwtFdeKmMzUXrCWpCmjtC3aaIiaxJDi1p/Y/bAII0ZS186kDDdTNjC/AucLLtT2Tq8SVKeqEFT25v/dDm6kRtQ2mpkHow4DWKOFc1chiDMWVdLj0Pj/pZzNUzqXZax4MoMOZH1Dd84YHaNhVztdUfGwhnjmD+9CajZ6kkdd2Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151834; c=relaxed/simple;
	bh=9jnj8JCPLNJB7Y8bWf2v76OtUtjBvHVIvX7+JBZZ3HU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K2BjiB3lNC0ok2MM5rSNh+96m7PjHR/b6HKQvA1bRmGC0u9BFW6x3xqVzAkhs8hNFZmAd0wO5lKEdTilF5/jdnwVaZkgZCD32gWdyi1hyVKa8EF93Yq9QE7YjaJt2PwMmkTrs0zY0C0vMNH2Ia3R077kxyarnlVwIVlTp8V9Gyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=HBs2bE76; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="HBs2bE76"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-aee773df955so111109a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151830; x=1744756630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XWMnH0Did5XyzW5jfPrUxbx63YMfVnoGAwbN881GRAA=;
        b=HBs2bE76HmgHlCQ2rPeqdDv8/VtrE0fzY2ZY1NJ54BYmPKUpa8/VpgAwqC1j9OzX8q
         rm/b3MCXt1kao35uPw4jtQbEsw9DNrvlQw9d7T5YnKV+ieCebhG11nbpWQFIRi8q1Pul
         kOoceTQUe9oFIKHz3Cm2jjKVpV0MTBMtxlo65CexDNqrNYYbfG8cbjG2E5IYRXrkxw98
         dapPjKeZsGt3glj/RuRwyUpOBXruBoUCj8cvfNqxknb2W9p6b8EDTTU/s/IgWwmEuvRZ
         l6aHHwbNZEY51L2eTtHLCPpN5oA3YVghQMKeFLujFfp9bgOrwT6umpmdmrcQqvax8KhC
         XuVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151830; x=1744756630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XWMnH0Did5XyzW5jfPrUxbx63YMfVnoGAwbN881GRAA=;
        b=dbG6Jp1u9dboA2FsyrczhYOe7UlH2iuNMoevR+6jJm2ryRuZ2Oh3wwsmzT/Xk2JL1G
         2xoew3c3sMFu4JmU7QJ9u+o1vMpZznDQsSgA+ZK6Q7VqynOwv9dY8wjMSZnPs9qiFJRR
         y37JkbbI0fNgqqE1PiuVOV8/pyxpnLkEY9MF51h8TKnCsFluWG471zvlbA9PMNyXdapV
         akHblmUAMMphLSDJPcKpcBYs+E2XrPYpK6UjL4m2Otz5+q8hImn6OISbF/XKEZiLponE
         BMYb2j502IBcnjrYJDNixn74WBGuA/4JiPUK43GKGF3DFdhCvgUUpDWlc3zjUd5xkvfl
         mCIg==
X-Forwarded-Encrypted: i=1; AJvYcCVrUYQQO9vYShI2cvdYvxiT2EQ0QD5ciJ995eIuFktLMJdaxZ4bW90p0tPggbscRe1AojZpYiAV8xdybWY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcr3Q1eW5Gsc2OrKBQeoigJMEdpyJgZv/JgKHxxJBdEjO9gJKQ
	luF03mJgB9PJmPYU6vIhszo+I+MgEv7ALDUiOZE5677B9ay3HAtt2HiF4RFzuQ==
X-Gm-Gg: ASbGncs2boCOrOcjupoCbyoMZTYuJBOWnqWBCJmpE4E2lMYPlbshp4mwgoHrgG0ctNf
	KCbRTfA9bTKCrmOnlztKTxrBcLMIBcT5qJ1mkPZgtGtSIE4wHcyG92ZJYhDM4r66ImXC6nj9O6I
	8WCNL9kAoyWv/NCUmTdBNHchs7oUTwDSUBdgMl7jGrkjNfVwQQj12yNTDC428Ek6roGkNySBMmt
	57Nx6ON/UItfe2XxZMz+3HI8M3+0gezI8FmUa/eGDFFGo4mCU9Uu2NTSQwg0kF7AyzdXKHXYJkX
	hOXOFz202Eoml9Q1ISfrgrIVxr7ogP0ZipB/BAxfPdA83VAXFD8bmxshWxlidJUx5kWmtAYOrC3
	fdjy418AaBA==
X-Google-Smtp-Source: AGHT+IHYwI5R9KBRqVHiDJeq7AElYZCltjRwDzA4lymP8T/15XjM0s5gRterfVSjI9Y2OBeLz0wGVg==
X-Received: by 2002:a17:90a:f944:b0:2ff:53d6:2b82 with SMTP id 98e67ed59e1d1-306d0d1d6e8mr7027966a91.11.1744151829879;
        Tue, 08 Apr 2025 15:37:09 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30584761e65sm11641716a91.13.2025.04.08.15.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:37:09 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 06/18] staging: gpib: common: struct gpib_board_config
Date: Tue,  8 Apr 2025 22:36:46 +0000
Message-ID: <20250408223659.187109-7-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408223659.187109-1-matchstick@neverthere.org>
References: <20250408223659.187109-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_board_config

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/common/gpib_os.c | 28 +++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 940ea05ba478..f2216768d8bd 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -50,9 +50,9 @@ static int sad_ioctl(struct gpib_board *board, gpib_file_private_t *file_priv,
 static int eos_ioctl(struct gpib_board *board, unsigned long arg);
 static int request_service_ioctl(struct gpib_board *board, unsigned long arg);
 static int request_service2_ioctl(struct gpib_board *board, unsigned long arg);
-static int iobase_ioctl(gpib_board_config_t *config, unsigned long arg);
-static int irq_ioctl(gpib_board_config_t *config, unsigned long arg);
-static int dma_ioctl(gpib_board_config_t *config, unsigned long arg);
+static int iobase_ioctl(struct gpib_board_config *config, unsigned long arg);
+static int irq_ioctl(struct gpib_board_config *config, unsigned long arg);
+static int dma_ioctl(struct gpib_board_config *config, unsigned long arg);
 static int autospoll_ioctl(struct gpib_board *board, gpib_file_private_t *file_priv,
 			   unsigned long arg);
 static int mutex_ioctl(struct gpib_board *board, gpib_file_private_t *file_priv,
@@ -65,8 +65,8 @@ static int set_local_ppoll_mode_ioctl(struct gpib_board *board, unsigned long ar
 static int get_local_ppoll_mode_ioctl(struct gpib_board *board, unsigned long arg);
 static int query_board_rsv_ioctl(struct gpib_board *board, unsigned long arg);
 static int interface_clear_ioctl(struct gpib_board *board, unsigned long arg);
-static int select_pci_ioctl(gpib_board_config_t *config, unsigned long arg);
-static int select_device_path_ioctl(gpib_board_config_t *config, unsigned long arg);
+static int select_pci_ioctl(struct gpib_board_config *config, unsigned long arg);
+static int select_device_path_ioctl(struct gpib_board_config *config, unsigned long arg);
 static int event_ioctl(struct gpib_board *board, unsigned long arg);
 static int request_system_control_ioctl(struct gpib_board *board, unsigned long arg);
 static int t1_delay_ioctl(struct gpib_board *board, unsigned long arg);
@@ -1542,7 +1542,7 @@ static int request_service2_ioctl(struct gpib_board *board, unsigned long arg)
 		      request_service2_cmd.new_reason_for_service);
 }
 
-static int iobase_ioctl(gpib_board_config_t *config, unsigned long arg)
+static int iobase_ioctl(struct gpib_board_config *config, unsigned long arg)
 {
 	u64 base_addr;
 	int retval;
@@ -1561,7 +1561,7 @@ static int iobase_ioctl(gpib_board_config_t *config, unsigned long arg)
 	return 0;
 }
 
-static int irq_ioctl(gpib_board_config_t *config, unsigned long arg)
+static int irq_ioctl(struct gpib_board_config *config, unsigned long arg)
 {
 	unsigned int irq;
 	int retval;
@@ -1578,7 +1578,7 @@ static int irq_ioctl(gpib_board_config_t *config, unsigned long arg)
 	return 0;
 }
 
-static int dma_ioctl(gpib_board_config_t *config, unsigned long arg)
+static int dma_ioctl(struct gpib_board_config *config, unsigned long arg)
 {
 	unsigned int dma_channel;
 	int retval;
@@ -1793,7 +1793,7 @@ static int interface_clear_ioctl(struct gpib_board *board, unsigned long arg)
 	return ibsic(board, usec_duration);
 }
 
-static int select_pci_ioctl(gpib_board_config_t *config, unsigned long arg)
+static int select_pci_ioctl(struct gpib_board_config *config, unsigned long arg)
 {
 	select_pci_ioctl_t selection;
 	int retval;
@@ -1811,7 +1811,7 @@ static int select_pci_ioctl(gpib_board_config_t *config, unsigned long arg)
 	return 0;
 }
 
-static int select_device_path_ioctl(gpib_board_config_t *config, unsigned long arg)
+static int select_device_path_ioctl(struct gpib_board_config *config, unsigned long arg)
 {
 	select_device_path_ioctl_t *selection;
 	int retval;
@@ -2069,9 +2069,9 @@ void gpib_unregister_driver(struct gpib_interface *interface)
 }
 EXPORT_SYMBOL(gpib_unregister_driver);
 
-static void init_gpib_board_config(gpib_board_config_t *config)
+static void init_gpib_board_config(struct gpib_board_config *config)
 {
-	memset(config, 0, sizeof(gpib_board_config_t));
+	memset(config, 0, sizeof(struct gpib_board_config));
 	config->pci_bus = -1;
 	config->pci_slot = -1;
 }
@@ -2212,7 +2212,7 @@ int gpib_match_device_path(struct device *dev, const char *device_path_in)
 }
 EXPORT_SYMBOL(gpib_match_device_path);
 
-struct pci_dev *gpib_pci_get_device(const gpib_board_config_t *config, unsigned int vendor_id,
+struct pci_dev *gpib_pci_get_device(const struct gpib_board_config *config, unsigned int vendor_id,
 				    unsigned int device_id, struct pci_dev *from)
 {
 	struct pci_dev *pci_device = from;
@@ -2231,7 +2231,7 @@ struct pci_dev *gpib_pci_get_device(const gpib_board_config_t *config, unsigned
 }
 EXPORT_SYMBOL(gpib_pci_get_device);
 
-struct pci_dev *gpib_pci_get_subsys(const gpib_board_config_t *config, unsigned int vendor_id,
+struct pci_dev *gpib_pci_get_subsys(const struct gpib_board_config *config, unsigned int vendor_id,
 				    unsigned int device_id, unsigned int ss_vendor,
 				    unsigned int ss_device,
 				    struct pci_dev *from)
-- 
2.43.0

