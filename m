Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1911278163
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 18:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744222208; cv=none; b=EP8BrlD+HkZfefnUuFnU8u3BeemWP21k9L1NceN0BD2jcr2qdoiy61B0KAo4K7B/DcaChHA99c+k3dnR0DwHSmqIzoGQdf4N4qxcwc1cFeBOuwRKzokfgPFeb5PP7c5+SQgfbhaxUpxsm3WkQiihyChaJUAmE4KwKIKOVeI/aco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744222208; c=relaxed/simple;
	bh=VetJwdVnmt9o+9NgFD12q9lF77Mr8AU8osE01DjUJQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Br5bobwRJwhtQxVT9l1ISPlraWtoNvaOt59bZkBFtB27Cp6aSlH46HUfPPRYn0GzcMwU7IIx4MWTgEaMgDhVoW2/kjwcDoLIggx3JBuEPex+s7JU0qEqbC/9lbMYCUHj3vztOhMi57JQoam8pw3PVatYpt+jCGRwaJyjILxdSoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=cXvB1Fp9; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="cXvB1Fp9"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-227aaa82fafso61777375ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 11:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744222205; x=1744827005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hBTWW1bMzl2CRoN9DxUuvCANdTsm/r2Yn73XwZqFoAs=;
        b=cXvB1Fp9ZCoN3ysP8abtSRWImqci91DBQnI7lhArIKiEBn8Q3A9YWOwjAr8y36c11e
         f0CpS/Q/HIwLX1WG3f/zsKJjfJaSbgghiPJ7qkREwzbg1QYmfD7GIKggkVfYV+Bed9X0
         PPhmC6qK4SYJOyjmxgpd0klJMacbgsmP/LuU8EpR2IOvGMpWMxLVaRB8jvqphl/RdiP9
         OL8jQUXHgr0KuG/BN/J0bYRQs8uC0ieti1f3beo6ZN2jCygHdIaS788muTdH9uIVdJvl
         GeOn9WECv8fhXPYiVGtZF8ebNg75vp6AAzZBeJcULd9aY1UDfTSJianBtKTnlJUxM5Be
         DDrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744222205; x=1744827005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hBTWW1bMzl2CRoN9DxUuvCANdTsm/r2Yn73XwZqFoAs=;
        b=ekJA630PYJqYMeHuT4y+72b6ojvYPDqsYkH1pub5OZylHA151K8L7yKjd0Gt94HK86
         13Mz1YZCfntggR6Y+MLwYBi440IScjgAMZFlai5zHnq61PmuDqUlQj0Gnifxtm91BrF4
         BmTYTu1XAIaM06+WMIj/TYpQvzGm/cDSWzZ1jDIHHIERgT+n55xq0/LXGcSR9G0fyrpn
         IoT3jFMukk3ife7kDuG2jg5cATPK990/kdI1TevSi98qjgoJzhzERZ8S/H/jt6TPnvRX
         SEgB8ajdwHEVOEUgfvhvn7NC3d0lMP1nav424njKLoQMnAq6JW2LlZPc7ADVOnIGnX8p
         t0TA==
X-Forwarded-Encrypted: i=1; AJvYcCVTTsF0zk4XzUZImNqcFBozjCvRhwdmKToKvwyJbcF8tnpidnRhhgqbEmzqR5f9DDGUzcBioAdFaeymMSc=@vger.kernel.org
X-Gm-Message-State: AOJu0YygQZoHP+xUGc8U1/sSlad3F6LaV1frATKEO5wibebcqpWjXSO0
	4q2957tkJb3rje9XTtd4Rjw9BxXwXviMsy43n64Axul+OLgQtu2SxTk+Z331Mw==
X-Gm-Gg: ASbGnct2bZgwuHscZrmNCWJ0f69TqmhG3uEkRmLYScc55afHMKlKn7IULX2xSaheVpA
	BHwNYkrzeqM4nZyb+h424LOSEhVW+mSODbww4/dgdBtknYqnHhOuPxOHJvVDrrWJx+cH8zQvkvE
	oEWMzVmLFOz6r9M3ikeiJJLcUnmeJb15h6rt2MUCMvvAQwdvWkHuMiLbE+4PZy5u87sJ8RtgI7+
	mf8Y6HNoEJDEBOStjoAUSvH/w8jXwa7mexhUuxll56a8jdnRmkyM7t4OeBsVVMc2ltgLTn0xuL1
	G3vyTpZNSB6jIcCgI144O//G89+Vw0OaJUPvioLzWno//gUUieXzwxPE8+xjhpvMa3sCZNGI3vP
	uFujuFh+2V7j2rI4h
X-Google-Smtp-Source: AGHT+IEbvJg/FKfqIDacdEXN8Xg2+4syugs3og5CrvGDawc3QHoqniEQpk8Om9Y2kzXyvpuSWvzc3Q==
X-Received: by 2002:a17:902:ccc8:b0:227:e7c7:d451 with SMTP id d9443c01a7336-22ac3f9a8fcmr61552775ad.29.1744222205228;
        Wed, 09 Apr 2025 11:10:05 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1d4490dsm1655851b3a.41.2025.04.09.11.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:10:05 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 08/23] staging: gpib: tms9914: u8 over uint8_t
Date: Wed,  9 Apr 2025 18:09:38 +0000
Message-ID: <20250409180953.398686-9-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409180953.398686-1-matchstick@neverthere.org>
References: <20250409180953.398686-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reported by checkpatch.pl.

CHECK: Prefer kernel type 'u8' over 'uint8_t'

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/include/tms9914.h | 24 +++++++++---------
 drivers/staging/gpib/tms9914/tms9914.c | 34 +++++++++++++-------------
 2 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/staging/gpib/include/tms9914.h b/drivers/staging/gpib/include/tms9914.h
index 08a40d84825f..d9ba11426ab1 100644
--- a/drivers/staging/gpib/include/tms9914.h
+++ b/drivers/staging/gpib/include/tms9914.h
@@ -79,11 +79,11 @@ enum {
 };
 
 // interface functions
-int tms9914_read(struct gpib_board *board, struct tms9914_priv *priv, uint8_t *buffer,
+int tms9914_read(struct gpib_board *board, struct tms9914_priv *priv, u8 *buffer,
 		 size_t length, int *end, size_t *bytes_read);
-int tms9914_write(struct gpib_board *board, struct tms9914_priv *priv, uint8_t *buffer,
+int tms9914_write(struct gpib_board *board, struct tms9914_priv *priv, u8 *buffer,
 		  size_t length, int send_eoi, size_t *bytes_written);
-int tms9914_command(struct gpib_board *board, struct tms9914_priv *priv, uint8_t *buffer,
+int tms9914_command(struct gpib_board *board, struct tms9914_priv *priv, u8 *buffer,
 		    size_t length, size_t *bytes_written);
 int tms9914_take_control(struct gpib_board *board, struct tms9914_priv *priv, int syncronous);
 /* alternate version of tms9914_take_control which works around buggy tcs
@@ -96,7 +96,7 @@ void tms9914_request_system_control(struct gpib_board *board, struct tms9914_pri
 				    int request_control);
 void tms9914_interface_clear(struct gpib_board *board, struct tms9914_priv *priv, int assert);
 void tms9914_remote_enable(struct gpib_board *board, struct tms9914_priv *priv, int enable);
-int tms9914_enable_eos(struct gpib_board *board, struct tms9914_priv *priv, uint8_t eos_bytes,
+int tms9914_enable_eos(struct gpib_board *board, struct tms9914_priv *priv, u8 eos_bytes,
 		       int compare_8_bits);
 void tms9914_disable_eos(struct gpib_board *board, struct tms9914_priv *priv);
 unsigned int tms9914_update_status(struct gpib_board *board, struct tms9914_priv *priv,
@@ -105,14 +105,14 @@ int tms9914_primary_address(struct gpib_board *board,
 			    struct tms9914_priv *priv, unsigned int address);
 int tms9914_secondary_address(struct gpib_board *board, struct tms9914_priv *priv,
 			      unsigned int address, int enable);
-int tms9914_parallel_poll(struct gpib_board *board, struct tms9914_priv *priv, uint8_t *result);
+int tms9914_parallel_poll(struct gpib_board *board, struct tms9914_priv *priv, u8 *result);
 void tms9914_parallel_poll_configure(struct gpib_board *board,
-				     struct tms9914_priv *priv, uint8_t config);
+				     struct tms9914_priv *priv, u8 config);
 void tms9914_parallel_poll_response(struct gpib_board *board,
 				    struct tms9914_priv *priv, int ist);
 void tms9914_serial_poll_response(struct gpib_board *board,
-				  struct tms9914_priv *priv, uint8_t status);
-uint8_t tms9914_serial_poll_status(struct gpib_board *board, struct tms9914_priv *priv);
+				  struct tms9914_priv *priv, u8 status);
+u8 tms9914_serial_poll_status(struct gpib_board *board, struct tms9914_priv *priv);
 int tms9914_line_status(const struct gpib_board *board, struct tms9914_priv *priv);
 unsigned int tms9914_t1_delay(struct gpib_board *board, struct tms9914_priv *priv,
 			      unsigned int nano_sec);
@@ -125,10 +125,10 @@ void tms9914_release_holdoff(struct tms9914_priv *priv);
 void tms9914_set_holdoff_mode(struct tms9914_priv *priv, enum tms9914_holdoff_mode mode);
 
 // wrappers for io functions
-uint8_t tms9914_ioport_read_byte(struct tms9914_priv *priv, unsigned int register_num);
-void tms9914_ioport_write_byte(struct tms9914_priv *priv, uint8_t data, unsigned int register_num);
-uint8_t tms9914_iomem_read_byte(struct tms9914_priv *priv, unsigned int register_num);
-void tms9914_iomem_write_byte(struct tms9914_priv *priv, uint8_t data, unsigned int register_num);
+u8 tms9914_ioport_read_byte(struct tms9914_priv *priv, unsigned int register_num);
+void tms9914_ioport_write_byte(struct tms9914_priv *priv, u8 data, unsigned int register_num);
+u8 tms9914_iomem_read_byte(struct tms9914_priv *priv, unsigned int register_num);
+void tms9914_iomem_write_byte(struct tms9914_priv *priv, u8 data, unsigned int register_num);
 
 // interrupt service routine
 irqreturn_t tms9914_interrupt(struct gpib_board *board, struct tms9914_priv *priv);
diff --git a/drivers/staging/gpib/tms9914/tms9914.c b/drivers/staging/gpib/tms9914/tms9914.c
index 4064320df4c1..7afd710a105c 100644
--- a/drivers/staging/gpib/tms9914/tms9914.c
+++ b/drivers/staging/gpib/tms9914/tms9914.c
@@ -193,7 +193,7 @@ void tms9914_release_holdoff(struct tms9914_priv *priv)
 }
 EXPORT_SYMBOL_GPL(tms9914_release_holdoff);
 
-int tms9914_enable_eos(struct gpib_board *board, struct tms9914_priv *priv, uint8_t eos_byte,
+int tms9914_enable_eos(struct gpib_board *board, struct tms9914_priv *priv, u8 eos_byte,
 		       int compare_8_bits)
 {
 	priv->eos = eos_byte;
@@ -210,7 +210,7 @@ void tms9914_disable_eos(struct gpib_board *board, struct tms9914_priv *priv)
 }
 EXPORT_SYMBOL(tms9914_disable_eos);
 
-int tms9914_parallel_poll(struct gpib_board *board, struct tms9914_priv *priv, uint8_t *result)
+int tms9914_parallel_poll(struct gpib_board *board, struct tms9914_priv *priv, u8 *result)
 {
 	// execute parallel poll
 	write_byte(priv, AUX_CS | AUX_RPP, AUXCR);
@@ -236,7 +236,7 @@ static void set_ppoll_reg(struct tms9914_priv *priv, int enable,
 }
 
 void tms9914_parallel_poll_configure(struct gpib_board *board,
-				     struct tms9914_priv *priv, uint8_t config)
+				     struct tms9914_priv *priv, u8 config)
 {
 	priv->ppoll_enable = (config & PPC_DISABLE) == 0;
 	priv->ppoll_line = (config & PPC_DIO_MASK) + 1;
@@ -253,7 +253,7 @@ void tms9914_parallel_poll_response(struct gpib_board *board,
 EXPORT_SYMBOL(tms9914_parallel_poll_response);
 
 void tms9914_serial_poll_response(struct gpib_board *board,
-				  struct tms9914_priv *priv, uint8_t status)
+				  struct tms9914_priv *priv, u8 status)
 {
 	unsigned long flags;
 
@@ -268,7 +268,7 @@ void tms9914_serial_poll_response(struct gpib_board *board,
 }
 EXPORT_SYMBOL(tms9914_serial_poll_response);
 
-uint8_t tms9914_serial_poll_status(struct gpib_board *board, struct tms9914_priv *priv)
+u8 tms9914_serial_poll_status(struct gpib_board *board, struct tms9914_priv *priv)
 {
 	u8 status;
 	unsigned long flags;
@@ -419,7 +419,7 @@ int tms9914_line_status(const struct gpib_board *board, struct tms9914_priv *pri
 }
 EXPORT_SYMBOL(tms9914_line_status);
 
-static int check_for_eos(struct tms9914_priv *priv, uint8_t byte)
+static int check_for_eos(struct tms9914_priv *priv, u8 byte)
 {
 	static const u8 seven_bit_compare_mask = 0x7f;
 
@@ -452,8 +452,8 @@ static int wait_for_read_byte(struct gpib_board *board, struct tms9914_priv *pri
 	return 0;
 }
 
-static inline uint8_t tms9914_read_data_in(struct gpib_board *board,
-					   struct tms9914_priv *priv, int *end)
+static inline u8 tms9914_read_data_in(struct gpib_board *board,
+				      struct tms9914_priv *priv, int *end)
 {
 	unsigned long flags;
 	u8 data;
@@ -484,7 +484,7 @@ static inline uint8_t tms9914_read_data_in(struct gpib_board *board,
 	return data;
 }
 
-static int pio_read(struct gpib_board *board, struct tms9914_priv *priv, uint8_t *buffer,
+static int pio_read(struct gpib_board *board, struct tms9914_priv *priv, u8 *buffer,
 		    size_t length, int *end, size_t *bytes_read)
 {
 	ssize_t retval = 0;
@@ -505,7 +505,7 @@ static int pio_read(struct gpib_board *board, struct tms9914_priv *priv, uint8_t
 	return retval;
 }
 
-int tms9914_read(struct gpib_board *board, struct tms9914_priv *priv, uint8_t *buffer,
+int tms9914_read(struct gpib_board *board, struct tms9914_priv *priv, u8 *buffer,
 		 size_t length, int *end, size_t *bytes_read)
 {
 	ssize_t retval = 0;
@@ -565,7 +565,7 @@ static int pio_write_wait(struct gpib_board *board, struct tms9914_priv *priv)
 	return 0;
 }
 
-static int pio_write(struct gpib_board *board, struct tms9914_priv *priv, uint8_t *buffer,
+static int pio_write(struct gpib_board *board, struct tms9914_priv *priv, u8 *buffer,
 		     size_t length, size_t *bytes_written)
 {
 	ssize_t retval = 0;
@@ -590,7 +590,7 @@ static int pio_write(struct gpib_board *board, struct tms9914_priv *priv, uint8_
 }
 
 int tms9914_write(struct gpib_board *board, struct tms9914_priv *priv,
-		  uint8_t *buffer, size_t length, int send_eoi, size_t *bytes_written)
+		  u8 *buffer, size_t length, int send_eoi, size_t *bytes_written)
 {
 	ssize_t retval = 0;
 
@@ -660,7 +660,7 @@ static void check_my_address_state(struct gpib_board *board,
 	}
 }
 
-int tms9914_command(struct gpib_board *board, struct tms9914_priv *priv,  uint8_t *buffer,
+int tms9914_command(struct gpib_board *board, struct tms9914_priv *priv,  u8 *buffer,
 		    size_t length, size_t *bytes_written)
 {
 	int retval = 0;
@@ -864,14 +864,14 @@ EXPORT_SYMBOL_GPL(tms9914_online);
 
 #ifdef CONFIG_HAS_IOPORT
 // wrapper for inb
-uint8_t tms9914_ioport_read_byte(struct tms9914_priv *priv, unsigned int register_num)
+u8 tms9914_ioport_read_byte(struct tms9914_priv *priv, unsigned int register_num)
 {
 	return inb(priv->iobase + register_num * priv->offset);
 }
 EXPORT_SYMBOL_GPL(tms9914_ioport_read_byte);
 
 // wrapper for outb
-void tms9914_ioport_write_byte(struct tms9914_priv *priv, uint8_t data, unsigned int register_num)
+void tms9914_ioport_write_byte(struct tms9914_priv *priv, u8 data, unsigned int register_num)
 {
 	outb(data, priv->iobase + register_num * priv->offset);
 	if (register_num == AUXCR)
@@ -881,14 +881,14 @@ EXPORT_SYMBOL_GPL(tms9914_ioport_write_byte);
 #endif
 
 // wrapper for readb
-uint8_t tms9914_iomem_read_byte(struct tms9914_priv *priv, unsigned int register_num)
+u8 tms9914_iomem_read_byte(struct tms9914_priv *priv, unsigned int register_num)
 {
 	return readb(priv->mmiobase + register_num * priv->offset);
 }
 EXPORT_SYMBOL_GPL(tms9914_iomem_read_byte);
 
 // wrapper for writeb
-void tms9914_iomem_write_byte(struct tms9914_priv *priv, uint8_t data, unsigned int register_num)
+void tms9914_iomem_write_byte(struct tms9914_priv *priv, u8 data, unsigned int register_num)
 {
 	writeb(data, priv->mmiobase + register_num * priv->offset);
 	if (register_num == AUXCR)
-- 
2.43.0

