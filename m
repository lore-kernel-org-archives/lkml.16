Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F22D1DC994
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 05:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744178351; cv=none; b=V1IhnbdvKVuoscA5Bq2PcL2ZprHiAaBeWZzm7mQOhy2LbPXSnPU1C48H3B6f1AdHp/qcRgZBErohQKNxM62ZBJPzCwnDlDpbh8COoe6fekcHyWAF46i0Yv5g8HAbiQ6B0WMn2p3u//Vvrw0uNmQ/fwH1kmL5QdRlc2m4KLoXBR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744178351; c=relaxed/simple;
	bh=2uVTnlkfRmi7jviGiaYvu7bTwwElCVFfDlGVzZ9llzA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q9jrW9c2S0bH3AudpOVB7nKDIQMOTpeMTFUWpIq7pzk8dRX66xksR7hxqV+iym/iUYUemKWUYBJJLHnta/2oACk0RaSl0RHSNn4Yg9ZWHalAZ8MQgqQ9kne0KSdFyphViwgrpZbfhz02K3HeJAq/+tQfindbRl7ayaH4I40BP+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=ju8f4ds7; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="ju8f4ds7"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-af5a4cd980dso4550261a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 22:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744178348; x=1744783148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wceHmgn6IqtL2iSeZHYJ/lyHWDm317e8g7Wc7VP6PSY=;
        b=ju8f4ds7G0i0H7kEU1VKzaTdRiE/XJzn7GJweHwzGIuqoVPel4/UXEZvuR6jz0eKiZ
         tq/3MpUtJnaKaw7KtXKgR4pEWPgYOgyxQTXOLx7X60NfOSRJnKA+CWpP2HWrLiBia0NX
         YuGK8qttMITR9JflvTc8kLcbfeJntT9sGCdw/fS+b7WZN2SMF+GtAOVaIOdqOyJy6MmZ
         5ZI6c9pP8BgIv3P1jC2DEQ4aIVTlvTDFbM5yfbJFcV7kyMiCW5sClkUVAgsmwUwWTYs7
         F24TvRSC1Rm2ILs5aPniNr3COp0T3hNaIUW6Hwncbra9uFBTFiL3JnCeCzw5Vea75Twz
         VnJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744178348; x=1744783148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wceHmgn6IqtL2iSeZHYJ/lyHWDm317e8g7Wc7VP6PSY=;
        b=ogrQaSUgUwD29oOzK4kFxe6ARg3+EWWDZD+6ar2+xEuH1vfjwjTMHxXUsZirwppYSc
         mn9BTKSUWoYvIWyEIb6mGeEOR0yIDtwlYLk1Bc5aobM2nNCV8jNAOqo/g7tOLGtbRnao
         9Sk1+Qnn+3kBIYz9YRsmKk9HjVRV2C4TH5cZN86QoA58fNbGNkCGBXvCAbBmS+3JDOPT
         PdibnX/6LLYguSrF9TzKalmS1kOW0zD0Yrbk8Qg6LgTrVB15MWK8drQVS0kQHl2Aiqoi
         nRiI3KH0DY7p6QIqX1Bm4nxWzidri92nfJI0iORm/nKq2eLyKxjVlp/3weht+LIx3HDu
         rcng==
X-Forwarded-Encrypted: i=1; AJvYcCXRP7KJkMin0YnQmBuBF6+dhjyc5tT1uwvW+5F/xMdILDhHUuzcEMbMICuQvFXT1v50OsgT4TwJeAwcm1Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YztGWBzHSbcRR552x0BdpWcKAmUNuqw2EmIfMalCTqeI8EjHiEp
	wIf8ScWimnRExcf27F0Uxc71RCPp7zcyGcAzLul3oQNOzMU2bHdT049U19JhP1Y5JcW9mvKqzj8
	=
X-Gm-Gg: ASbGncv/7B6GGaNPj/NHaKUy6J2A1EdiBa0nHhpsWqEKVS60XngVH+jFqITiKlxg1jm
	8FLyb6OeD2pcRxvzYvJYKcBnANLESCNlxVNov8kAyCVXQCYvgxQ8a468TCGP8OGq8IoGz4YhZf1
	/MoiLS77zgT9YxoDaKS2+r6p/ZZNhum+I6YqGJiC3QGJE34qzq7/DnM9rGrbrNu7eebtm2OOKi/
	KJyIVzLdgx7F8ufv7K1YjHXlRYz+baMgwCaKHohXD62jUKGloP9lwhPhBNGJbwx1xIEeuEbv+4v
	An+cwoiGVyeCp444opeKO4KGkzatWtedfI/YyrQxOYyUnwMRcJwdOivetccJKqPYc2s5Auedw82
	4URahtg==
X-Google-Smtp-Source: AGHT+IFIhXnuW04WLdiWT4GUokoi4V5x2Z+gh4XvDhUkaTS4AbtEARWJsMxnN3G1skpWl9beNEtZbQ==
X-Received: by 2002:a17:90b:2e4e:b0:2ff:6e72:b8e2 with SMTP id 98e67ed59e1d1-306dbc2e945mr2581540a91.31.1744178348479;
        Tue, 08 Apr 2025 22:59:08 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd10c40dsm664351a91.5.2025.04.08.22.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 22:59:08 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 02/21] staging: gpib: Using struct gpib_read_write_ioctl
Date: Wed,  9 Apr 2025 05:58:44 +0000
Message-ID: <20250409055903.321438-3-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409055903.321438-1-matchstick@neverthere.org>
References: <20250409055903.321438-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for 'struct gpib_read_write_ioctl' to remove typedef.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/common/gpib_os.c  |  6 +++---
 drivers/staging/gpib/uapi/gpib_ioctl.h | 10 +++++-----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index e12a9e56d808..02ead46453a7 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -865,7 +865,7 @@ static int board_type_ioctl(struct gpib_file_private *file_priv,
 static int read_ioctl(struct gpib_file_private *file_priv, struct gpib_board *board,
 		      unsigned long arg)
 {
-	read_write_ioctl_t read_cmd;
+	struct gpib_read_write_ioctl read_cmd;
 	u8 __user *userbuf;
 	unsigned long remain;
 	int end_flag = 0;
@@ -940,7 +940,7 @@ static int read_ioctl(struct gpib_file_private *file_priv, struct gpib_board *bo
 static int command_ioctl(struct gpib_file_private *file_priv,
 			 struct gpib_board *board, unsigned long arg)
 {
-	read_write_ioctl_t cmd;
+	struct gpib_read_write_ioctl cmd;
 	u8 __user *userbuf;
 	unsigned long remain;
 	int retval;
@@ -1024,7 +1024,7 @@ static int command_ioctl(struct gpib_file_private *file_priv,
 static int write_ioctl(struct gpib_file_private *file_priv, struct gpib_board *board,
 		       unsigned long arg)
 {
-	read_write_ioctl_t write_cmd;
+	struct gpib_read_write_ioctl write_cmd;
 	u8 __user *userbuf;
 	unsigned long remain;
 	int retval = 0;
diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
index 4ddcbc2a81b0..15c924efe5bc 100644
--- a/drivers/staging/gpib/uapi/gpib_ioctl.h
+++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
@@ -17,13 +17,13 @@ struct gpib_board_type_ioctl {
 };
 
 /* argument for read/write/command ioctls */
-typedef struct {
+struct gpib_read_write_ioctl {
 	uint64_t buffer_ptr;
 	unsigned int requested_transfer_count;
 	unsigned int completed_transfer_count;
 	int end; /* end flag return for reads, end io suppression request for cmd*/
 	int handle;
-} read_write_ioctl_t;
+};
 
 typedef struct {
 	unsigned int handle;
@@ -121,9 +121,9 @@ typedef struct {
 
 /* Standard functions. */
 enum gpib_ioctl {
-	IBRD = _IOWR(GPIB_CODE, 100, read_write_ioctl_t),
-	IBWRT = _IOWR(GPIB_CODE, 101, read_write_ioctl_t),
-	IBCMD = _IOWR(GPIB_CODE, 102, read_write_ioctl_t),
+	IBRD = _IOWR(GPIB_CODE, 100, struct gpib_read_write_ioctl),
+	IBWRT = _IOWR(GPIB_CODE, 101, struct gpib_read_write_ioctl),
+	IBCMD = _IOWR(GPIB_CODE, 102, struct gpib_read_write_ioctl),
 	IBOPENDEV = _IOWR(GPIB_CODE, 3, open_dev_ioctl_t),
 	IBCLOSEDEV = _IOW(GPIB_CODE, 4, close_dev_ioctl_t),
 	IBWAIT = _IOWR(GPIB_CODE, 5, wait_ioctl_t),
-- 
2.43.0

