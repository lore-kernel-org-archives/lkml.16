Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FD6255E31
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744150851; cv=none; b=oH4vPr/l/djZhQSK0xYUcaX1tBfTSRJOc+os1ciGpWGVA7x2m8wKFwFmlYL68mmBAGa5+bJge5ZDBwn96gBJYmX9UDNdtJaiaYXwIPJB0icIy01NjQ128pc4t3l6UBjnOl8SGyprtC6602o6a5Ky4QhWne8KzSuxEPZKov/so2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744150851; c=relaxed/simple;
	bh=KRCyOiCnfMB6DmzNznNaSnaXxvzd7/NRTC8KizHmU9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q74ZFYvdrP/mtQUhqbi6TDXKZhr+BHOG4botuM6YBUUw+Yu2VgqKl38YsFXXSLcnICeYVBIpuq+/ArQhueyg0SNcnSkr5ndpNtU1smJaow1NVG5iE2GCGKfXESBT0CJWtJLKD+OnldI0ggh5mf4tnEke4ZAar3+/oKbNFZGCsX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=OPOszall; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="OPOszall"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7399838db7fso136171b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744150849; x=1744755649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AmfBcj4SMkVq55nUBWDQARkSK+7rsSdCFgt9mDe+mU0=;
        b=OPOszalltwPmfsK+YUSFQbzoTJYtXlfrGW2ZJffn24u8eY35POTGxSAO+RGznyXaCa
         OEvhPnubrqcs7DfhQv3QVt75pwKML1AP7tDJfUUFxSB7mZJ33oFe/rMenBME8PbC8rbz
         OONu51CrKyI2IBV56hwBsBXUE0R9mqa4soMz0ZcY8AEHSp42tslx7GNVZmpnyqMa9OAO
         f037t7UodPgjHHrM9NA6n4Ih0++9OAPoNrxNJYmVwmoc3TwROI4gW7/pZWgfmxbkkKeR
         T1LvxfjhlkV3d5ufMpmFAaOdzDLjngFvYxD+ZLH6/ccLR4G8zKUZoxYvnpr8nQXwUCpY
         +Sgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744150849; x=1744755649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AmfBcj4SMkVq55nUBWDQARkSK+7rsSdCFgt9mDe+mU0=;
        b=ol1Qo5wxjVRi2/DOinjSNFJaNG5LkyL7qgpESGsm2Z83Bp8+HjqpJ1aXIen0ULbuj2
         cYtxJYVWE3pSadQYf3uZiAm/LgTxg4yACBRM6SHKrjNWoWSOhJDukfLR4FvM8zlBy6e9
         A1qLrKTZXkfWqD9jYZxG3j12Htk+3B2sPKi6w043QBJSOd0Z2I3CI6LXvCKto9aeXTuM
         n0BHdHVb9e4OYvfa7HD7PRDyV5gksIGPFgSgRO2NKSRJnxVmKG5r6RHQJUcFb6S7dfQV
         7DiMiKeWrEcsy0sg85BMHCvN+OHp4IrsLMcYYO15at63r/E/PLcxLT6tmwL0WBS05bQO
         v66A==
X-Forwarded-Encrypted: i=1; AJvYcCXOsXLBBHTyHNNHUF4CdX7W1jWs4Jq6w80sGDLsmppRRzt8slu7v8jivMO8ciMO21wSz2+x8uXv1kSJucg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+LCaRalBxyRqs63Kdb86c6VqtGuVAR5hNBcQeTolkp/RECEdQ
	gSFxhtZhiluGI9MHaTM//8YQ2hpLj8zZwsOZLeuNtt2egSgj7EfpAd2I37UKnw==
X-Gm-Gg: ASbGncsf0A7OdqfJj4AVFfpvrX63H3/+/9OaT6B99Ckv40Di7XBi8eVMIaxEHE0z8s9
	9/m9EeffvmRoSYj13WI6FuRyD5kvtCBg64YwiQqQUsclanMG78kfgJe5mDXC06QzlhedQAGRE9Z
	8cH3ebNXCE1H5Nuzz6MvCR22TnUOueVkRGMB+T0XoSdGIFr/JocrE2KCtG/bv78XtVWGLLeRHoJ
	cS9CKbPgP4sfRDNrS9VhuSOI9MEs0b2Cd5f+t2Jz4jvxLZefSPROZkwyRAwnDVgGcZksXR1uzYX
	sGCbjH5qzMen7GgyrK8vKJ2TahjrP203ZhrcqtodY10C/4w1A+j9mCf8ZSN0IFfPT4uYrlJpffC
	fYldjIq17bw==
X-Google-Smtp-Source: AGHT+IGCYm3RnBPyNELvijsQmawFwLjN9JANvMZJ/jwrT9v88delcMRiaJndTvvJoOwt5eYI3z19uA==
X-Received: by 2002:a05:6a00:2e05:b0:736:476b:fccc with SMTP id d2e1a72fcca58-73bae4cc310mr996029b3a.8.1744150849090;
        Tue, 08 Apr 2025 15:20:49 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97d1a62sm11148336b3a.32.2025.04.08.15.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:20:48 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 04/14] staging: gpib: common: lines exceeded 100 columns
Date: Tue,  8 Apr 2025 22:20:30 +0000
Message-ID: <20250408222040.186881-5-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408222040.186881-1-matchstick@neverthere.org>
References: <20250408222040.186881-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adhere to Linux kernel coding style.

CHECK: line length exceeds 100 columns

Reported by checkpatch

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/common/gpib_os.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 8d2f2a663958..711e99b1581a 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -26,7 +26,8 @@ MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("GPIB base support");
 MODULE_ALIAS_CHARDEV_MAJOR(GPIB_CODE);
 
-static int board_type_ioctl(gpib_file_private_t *file_priv, struct gpib_board *board, unsigned long arg);
+static int board_type_ioctl(gpib_file_private_t *file_priv,
+			    struct gpib_board *board, unsigned long arg);
 static int read_ioctl(gpib_file_private_t *file_priv, struct gpib_board *board,
 		      unsigned long arg);
 static int write_ioctl(gpib_file_private_t *file_priv, struct gpib_board *board,
@@ -72,7 +73,8 @@ static int t1_delay_ioctl(struct gpib_board *board, unsigned long arg);
 
 static int cleanup_open_devices(gpib_file_private_t *file_priv, struct gpib_board *board);
 
-static int pop_gpib_event_nolock(struct gpib_board *board, gpib_event_queue_t *queue, short *event_type);
+static int pop_gpib_event_nolock(struct gpib_board *board,
+				 gpib_event_queue_t *queue, short *event_type);
 
 /*
  * Timer functions
@@ -258,8 +260,8 @@ gpib_status_queue_t *get_gpib_status_queue(struct gpib_board *board, unsigned in
 	return NULL;
 }
 
-int get_serial_poll_byte(struct gpib_board *board, unsigned int pad, int sad, unsigned int usec_timeout,
-			 uint8_t *poll_byte)
+int get_serial_poll_byte(struct gpib_board *board, unsigned int pad, int sad,
+			 unsigned int usec_timeout, uint8_t *poll_byte)
 {
 	gpib_status_queue_t *device;
 
@@ -806,7 +808,8 @@ long ibioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 	return retval;
 }
 
-static int board_type_ioctl(gpib_file_private_t *file_priv, struct gpib_board *board, unsigned long arg)
+static int board_type_ioctl(gpib_file_private_t *file_priv,
+			    struct gpib_board *board, unsigned long arg)
 {
 	struct list_head *list_ptr;
 	board_type_ioctl_t cmd;
@@ -1897,7 +1900,8 @@ int push_gpib_event(struct gpib_board *board, short event_type)
 }
 EXPORT_SYMBOL(push_gpib_event);
 
-static int pop_gpib_event_nolock(struct gpib_board *board, gpib_event_queue_t *queue, short *event_type)
+static int pop_gpib_event_nolock(struct gpib_board *board,
+				 gpib_event_queue_t *queue, short *event_type)
 {
 	struct list_head *head = &queue->event_head;
 	struct list_head *front = head->next;
-- 
2.43.0

