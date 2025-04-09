Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3501DF735
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 05:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744178354; cv=none; b=VR7FOpTqQeeSQZQlTv27m7CoPban8MaKjj9KXrTkyF9ISCCnn7khSxACtY0fo7vpMCE3Df7CMwfgfo9ancdWd796Jlxp8yf7Cpidbzx/yIo3FCk5xFc4YKU1/cPgNzEG8195ZdOp9eQQG6qBk6+ptVLZU2qQ7qcmQF3Jwo8A48U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744178354; c=relaxed/simple;
	bh=6/tEDWkyWZGqddA6x5CupLdQkjAI7dTnTj5CqszFug8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ciw4emQYIbnNHzmqfv+V3S11NwbUVmO4b2BBurQzwXTFa7H5/CZxziSHyUdVgxgqE5njhgSTRfeNpYWUoQXRFaFbhg1UEutU8m1fnamZiRtBcEHBPG4tEaCBN0EHeFclB8/UW4r2BWRgHRvn5yVnMOWRJtH3fbkHf7MbSoOONlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=I7UEFODs; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="I7UEFODs"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-72d3b48d2ffso6812600b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 22:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744178352; x=1744783152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NCoGYMLxCvRlHFRAlGxTbIygW8BXsW2zasxHkdR12QM=;
        b=I7UEFODsYh63E0H98CZrKBzRE/QwCY4PsOeSipn/gg7J4MwndQsOOJo5ZoOjSOfeAT
         4M2r082NIUm8GKFoPx5nUFPraxAxv9T7ZF0QCkuCGOT9p4ZOpKbgckHj6MOIBQZp/XfN
         aOkP7jtQ9bdXiBCwJqmMNSfJkrX8RqPt6SvXV5VIc9eeRYSiAU5GhGxsCUebeSLUqQsC
         CCw93EGO+FY2k9aOOqtgBd7luXvwwbHWBmnDZbOp/trpApmc+7lNpBSMBdQjn/sjv6SU
         Jh+FQO6W3Bc67r92vC92t7Uyuww0QFClDcdJoSdqDp/lqFOF/io86GkSYAttCKymn9oQ
         PhOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744178352; x=1744783152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NCoGYMLxCvRlHFRAlGxTbIygW8BXsW2zasxHkdR12QM=;
        b=QUL24xeBDQJC7or+y6hOrLHXdyeDkRR3bh7xPsL2xHnzPmV7bBpQQ+Iy0CDbvlzyzF
         akoDKObRk/+cPfu1ZyA7FeBK2Sik1HCFr0Au1A1fmlMJTLxIQrXhSdBA7t6gDYHx+wiR
         eeizS9RdOgvCHuvjHyPCbVWUsdJ9wFrrL6Pf4YBeBosZB/5sgLlqDUUhVE4YIgUz8pKk
         +4/url/neSpuMMumkwEuiFeeyg6G0/tHNUzkyozmPvxHgo9RRbyhhW7c4QrDcOFTfVPZ
         XFScsRSagi5sLSHwWVHYStw3wRsdBuKPK/yi0x8K3vkRobKTs4UeAOzUvBGWKL7QeGVC
         NGEA==
X-Forwarded-Encrypted: i=1; AJvYcCVbpRzFNXDTD2O7HzcqcW8Lauqv5GMnwk6I0EBpKYQLA9ngK17Spr6V3hvNAvaSGIOrStyCNOhOK4gPInU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv7A6hDyU8gB35Me07Fu/pxdEdl5PYFrqLG0E+08LxjX7KcVWG
	NxazIkieMQ8/palpcbzm6N2JEa5BjLlYPKi7Q2PHKOO2GwLjdxdySnw6ns3yFNX2tNc9TwADWs4
	=
X-Gm-Gg: ASbGncv2rOhy4auOWsn6wg2yq9nZpuJgrNXX28gUAeCor5m4NaSEApK4ZO0EXRCmX0F
	8wyIKSa+QFCZvyuQKhLERnKlyo9RrGrGNrXz1cg6jN+Nc5FLAjWw+O4qMqUGNJweCMtfpCRs0ip
	QGqROS9dSxxVWuES05UhrrkbAlpdz876uCOHtes1z98b1ZK3LhvDafF7CFMuehfyHpZiIUB57jZ
	hMXr7AVeXpnmylam+YO5gUKezi1R7E6NkRHR/R0ZDcf18VQ8cQVDESbazcD72s5bE8pVerUgGL4
	u4vM/HA2BCzb1TVxF2lOU24JCyfJM/P2rwyx7oyh3BKngdSZueUF+XYq0kJd439T7q3m7n5ndt+
	OwJkKlw==
X-Google-Smtp-Source: AGHT+IEnYb8oUAhH5Iqij3FjwEcu3Mi3oVa9qSFtB0jvgdjmC/mi3UyvnvAsRRmXp6OoQ75awHMGDQ==
X-Received: by 2002:a05:6a00:ad6:b0:736:7a00:e522 with SMTP id d2e1a72fcca58-73bafbc6364mr1740723b3a.2.1744178352232;
        Tue, 08 Apr 2025 22:59:12 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1d4945asm441176b3a.68.2025.04.08.22.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 22:59:12 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 05/21] staging: gpib: Using struct gpib_serial_poll_ioctl
Date: Wed,  9 Apr 2025 05:58:47 +0000
Message-ID: <20250409055903.321438-6-matchstick@neverthere.org>
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

Using Linux code style for 'struct gpib_serial_poll_ioctl' to remove typedef.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/common/gpib_os.c  | 2 +-
 drivers/staging/gpib/uapi/gpib_ioctl.h | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 4d105db18447..9f7becb09e60 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -1289,7 +1289,7 @@ static int close_dev_ioctl(struct file *filep, struct gpib_board *board, unsigne
 
 static int serial_poll_ioctl(struct gpib_board *board, unsigned long arg)
 {
-	serial_poll_ioctl_t serial_cmd;
+	struct gpib_serial_poll_ioctl serial_cmd;
 	int retval;
 
 	retval = copy_from_user(&serial_cmd, (void __user *)arg, sizeof(serial_cmd));
diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
index 6ea6114ae78a..9be3262271c5 100644
--- a/drivers/staging/gpib/uapi/gpib_ioctl.h
+++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
@@ -36,11 +36,11 @@ struct gpib_close_dev_ioctl {
 	unsigned int handle;
 };
 
-typedef struct {
+struct gpib_serial_poll_ioctl {
 	unsigned int pad;
 	int sad;
 	uint8_t status_byte;
-} serial_poll_ioctl_t;
+};
 
 typedef struct {
 	int eos;
@@ -137,7 +137,7 @@ enum gpib_ioctl {
 	IBPAD = _IOW(GPIB_CODE, 15, pad_ioctl_t),
 	IBSAD = _IOW(GPIB_CODE, 16, sad_ioctl_t),
 	IBTMO = _IOW(GPIB_CODE, 17, unsigned int),
-	IBRSP = _IOWR(GPIB_CODE, 18, serial_poll_ioctl_t),
+	IBRSP = _IOWR(GPIB_CODE, 18, struct gpib_serial_poll_ioctl),
 	IBEOS = _IOW(GPIB_CODE, 19, eos_ioctl_t),
 	IBRSV = _IOW(GPIB_CODE, 20, uint8_t),
 	CFCBASE = _IOW(GPIB_CODE, 21, uint64_t),
-- 
2.43.0

