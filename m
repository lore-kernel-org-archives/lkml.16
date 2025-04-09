Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9CD1D86DC
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 05:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744178349; cv=none; b=KoCyOvhF4jKBwwiaQ5/gOkY/zm5Pg61raJPyqeKydWNryc4B6RztWVAwOg7cr+azHyQe9CEBtkMqDhRL0ua4G2fT3wTpG6SOHXvj+VgTBxNSWF/dZWncYhSi9C0+BbNsmpFuGNFHJb78BI4dazsOjYc2Z6ZaEnlGhf0FmYcnm5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744178349; c=relaxed/simple;
	bh=nmZxXpYGtNpYNOhj5UOGoXLASWCzFprIfKCP3NbhVDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QBRM1jhSfqllhdXEdUdJ2Scrn8fSol5CytTyYEAlwbLK4YlFIVFQxhKxbqjhGUhVY1fjj1vQjODmESxux7JsCX37XsUJuIpt0dFAgHuDb2ZdjtBz5Yav8StEXr3S9P9TEbV55oSAtm0EeMHOx9xoQ3XtVJhXiU7D6WbFKaTDXg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=USFF2+XP; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="USFF2+XP"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2295d78b433so63345205ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 22:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744178347; x=1744783147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C29l0P6mM8oN5IR0sSrgm0hjHh5+2F3vS6hbJExkJEA=;
        b=USFF2+XP4qA6B/a/1pBCA7gl8X/5PiIVDTeZ2OkP6tCRkdkcLqHJO8DICqdBLLLryr
         +x2U8k4PgO8gMulQ3K+Nf7Igr30k1xpYG41vP+lzIC8Ye1BcMUvoK2W04T/LameguydL
         XEmCgJxfsNE+QvpIAyw1yoTKahVjNFkZz7Ai5Y7sY5erwbCdz1/rkiZjMHH3SmD2Rtoo
         4Ag9LoeEwQXPdtStxpYh0x8urxLEicrzwY9t8u9iXsMsJw7nUPQf76+JTTkrziGl2Ypx
         NeVeUgC6cgiFXAd6Ps2poy6sLL7QhUGXW944fSzLpWcMXLudEG049xDailqHoED7XpcF
         tJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744178347; x=1744783147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C29l0P6mM8oN5IR0sSrgm0hjHh5+2F3vS6hbJExkJEA=;
        b=SZUaKQWHfpN7GwLBEFjvQaWQt5LpjkcHAMu4FXM9yv+FhIpGD7tEQzzYQwgD3uIfy4
         0JLcYYp7vAuqxiWxN9SPbqs6/JIGqBHR9Ytdwj60CFnCcZL90QtrQ3vsTjdJxXEQvXE/
         5SRC4ITu8jwpfD3c6QpjqTyAfGrto/0qD2pG+yhY9aDYQ+KrAWX571FYyAMX4M82TCeR
         h7PGC1I8qyD7uvDH0cmTZU/HwJ8zLDPDWdtdSdvuJxLepB0qINoZs59licEK6lPGrELw
         MTA2ygnYXdfxmNAoiBwD0YfyGpXk/rWzsM37hhfYSImOkyzOt8Qbjc44A55ZUTal43O7
         Kv4A==
X-Forwarded-Encrypted: i=1; AJvYcCX3LRYVMddq3NG9LFfwZzsBIEf9Y5SxAGPIjz6OkBG+dT9gozpY3klsGrzN5IDvTDzf8vxURaLF28hou8w=@vger.kernel.org
X-Gm-Message-State: AOJu0YynXLHoxU93hnBuzUbl7077C8b5YDCjk+pUPQ7Qu3Njlef1YQIJ
	JQBaxCRjeEw/H6elTPsraFLMJaWSFyR/LJ/F4b7zAGGNx1S2SGZ5ayR1RyMv1g==
X-Gm-Gg: ASbGncuLmbdW0xsvS7dFWV3nUyDn8+otMCvtUxd5CqD/oWp7JPDVCVntTZ8BTYaqYxv
	0ZD+5GqpofFrYolCBefPho5xxcnfGYfIWqTt+XxqmRANom7aFG7OMCuT6mwhlayhC1kdfTgddpq
	TZgWKJfRJX3ZlogUDigZcvUtNE5QlQwq9L9FWdFpXEubSpo1RitAbROewxEcCSLPcA7Ju+WoTUx
	KynhsjojckcMOhre8FaBDzDLrSmzGQ55qwGoIHdcLFVkxj0CZjbvfKcbPA3tOSjyIb8rIO1XRNZ
	63gII7SACsB/cLot8SeeoI+8P3rkklSClCY4iS57sRG1Ldowiq7m8PFFRc0cMZ6SbTZwLC86/gz
	Y4c8yBQ==
X-Google-Smtp-Source: AGHT+IHo6HMz82o6Ejey7aqKjvSwU8H+RJ9gcTvRcf1DGffCn2lIbToSTUUZE8jzXuEnGFk881+JlQ==
X-Received: by 2002:a17:902:f552:b0:224:c47:cb7 with SMTP id d9443c01a7336-22ac3e0ff99mr18324395ad.0.1744178347245;
        Tue, 08 Apr 2025 22:59:07 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b90d99sm3461165ad.99.2025.04.08.22.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 22:59:07 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 01/21] staging: gpib: Using struct gpib_board_type_ioctl
Date: Wed,  9 Apr 2025 05:58:43 +0000
Message-ID: <20250409055903.321438-2-matchstick@neverthere.org>
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

Using Linux code style for 'struct gpib_board_type_ioctl' to remove typedef.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/common/gpib_os.c  | 5 +++--
 drivers/staging/gpib/uapi/gpib_ioctl.h | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index a1992a2b06a0..e12a9e56d808 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -813,7 +813,7 @@ static int board_type_ioctl(struct gpib_file_private *file_priv,
 			    struct gpib_board *board, unsigned long arg)
 {
 	struct list_head *list_ptr;
-	board_type_ioctl_t cmd;
+	struct gpib_board_type_ioctl cmd;
 	int retval;
 
 	if (!capable(CAP_SYS_ADMIN))
@@ -821,7 +821,8 @@ static int board_type_ioctl(struct gpib_file_private *file_priv,
 	if (board->online)
 		return -EBUSY;
 
-	retval = copy_from_user(&cmd, (void __user *)arg, sizeof(board_type_ioctl_t));
+	retval = copy_from_user(&cmd, (void __user *)arg,
+				sizeof(struct gpib_board_type_ioctl));
 	if (retval)
 		return retval;
 
diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
index 6202865278ea..4ddcbc2a81b0 100644
--- a/drivers/staging/gpib/uapi/gpib_ioctl.h
+++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
@@ -12,9 +12,9 @@
 
 #define GPIB_CODE 160
 
-typedef struct {
+struct gpib_board_type_ioctl {
 	char name[100];
-} board_type_ioctl_t;
+};
 
 /* argument for read/write/command ioctls */
 typedef struct {
@@ -143,7 +143,7 @@ enum gpib_ioctl {
 	CFCBASE = _IOW(GPIB_CODE, 21, uint64_t),
 	CFCIRQ = _IOW(GPIB_CODE, 22, unsigned int),
 	CFCDMA = _IOW(GPIB_CODE, 23, unsigned int),
-	CFCBOARDTYPE = _IOW(GPIB_CODE, 24, board_type_ioctl_t),
+	CFCBOARDTYPE = _IOW(GPIB_CODE, 24, struct gpib_board_type_ioctl),
 
 	IBMUTEX = _IOW(GPIB_CODE, 26, int),
 	IBSPOLL_BYTES = _IOWR(GPIB_CODE, 27, spoll_bytes_ioctl_t),
-- 
2.43.0

