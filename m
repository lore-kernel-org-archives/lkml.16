Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558F11ADC6C
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744850746; cv=none; b=OsJJBsucQ7p6Eqn8nWlyc12kuBRuSAlDhyCtZi0md4oojXCQq54XCHawfVTxIEMDmaGGUISxvHWcGk2mBHGj3dQLjYfwyrXDZZB8pLfYMPdZbxbiwFsoPb0AHGBo7RUCDtFSL44qU0uBtWcmj5nHGSzSJZjcBhStwjt7SBElo4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744850746; c=relaxed/simple;
	bh=wB0+LV91DnXQQGNzqKR/BclsH5n95+e2l+fGurYx9zI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jof0dV5pepzH2DqSyXpc5GMKT5qp1+FYKrbfMJ7jCNrZG1UC9HZmtCxFNaTV7zKoW7xdntrEo532yiH/x2gE83PkZU8SCadHRCYkyemgJ4rTEUtklLTd6FAKPREpLuQJVzw28NIAqDoPKkrJGwdCJppJ5N6ktS2P0A+swoh2fUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=h2LPdEB6; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="h2LPdEB6"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22c3407a87aso3590655ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 17:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744850745; x=1745455545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TFrFNnlUmxoJuqsI1VEzyrbevotU4o2PIpnAF37A/EY=;
        b=h2LPdEB6nCGQ3KS/xZZC2jKYmGLK1048Re5Kl8Hlxw/cbLAJn+yZJ24MWxgMPRUiE9
         HATXxJo3SDItLGwRaRPzOu/4TbZ3xoG3eRG/aAOW/5xWEOsRnnZ6JA2SS/aoADkVSfAl
         qwNoJWsQNW+g4SeQy+iumVoX6mPFmc6d40xlxvq4Z+e09O5fwh++C/f1qO9yYq69kCBz
         jwHcItLxnFJnhifuhqzZoM3QfxfBpv1uPRLAcnz+hBqwosqrCGahTWaM4jcWjYO8EFbY
         KnWK5zVDiI88dcaOGldWwZES958lFHuBYfD9q2sg9BYA9xzxIHSwA7jnOd6NjZLapsRU
         kKsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744850745; x=1745455545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TFrFNnlUmxoJuqsI1VEzyrbevotU4o2PIpnAF37A/EY=;
        b=ETw1ckLS42cZP4NpyYCO7m2aSpmUS9obIsMve4SvHM8B4B+GsGwTwdLhBiU4jVtp7E
         BXiQeCaSa1yOK0lp5hI7HiG9AMEXbGOg9RVRjB4sWx3HggvgvJv13lBegpyBWCgjxC1T
         22ymwO+Pza1evjuT3soMc1ruGwX6sDnFn82LW1POfDZ2Sc8ZbkifxkTlzW65C8shVJdd
         nDky9b+Wt4jf9VKUbeq/Ka3MzPbbTcj296Ixp1K9Pghm+bXbBsOL6VxKz5OzztpaUcfv
         LwgFGIikOvdu+LZPmmFu8+TMogGy5QERl3drMh77yKnCj5kb8TDYAxNO8l+jHxc5vZJS
         AInw==
X-Forwarded-Encrypted: i=1; AJvYcCXfIGP0YSZbcf/UszxIRRJ9arsAfVY89JoXXvSf9tcCfz2excZvJxwkrnoiLvL+CUkNSmMMdc6w2tI3P+k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPX7WFYoXOmKbzTrz2eLlOsTt42w/OM21KXLsWzLeYUeXGIGKV
	KO+jX7bOfJW9JfKyN0EAFC7EMrTjn+QIPt9PgH1uRZhzck8htjNgaR4JZTRK/w==
X-Gm-Gg: ASbGnctTFL1nM4qjaO8ptoetLmpPOA7UMdILUyi1YAXfeK7Y/umGzDMsVxTRfX5HHgm
	z/QAukxcbwLTUwwQUgQ95vBiAbibHhMobc2CSSCptvaBt4GXa6Y2LgwuxE+wYbV50gKaAfvSJJ8
	+ccDmrmPVhGydQgwNu0RnjK152vpyKH1NfZx1MODZBG51inUGpVAb+qnwetfYlfRhDQ+ctIIIrL
	DcesRUUC+6HbaggbBSBMasmN7YMh3g61UPqfLfMLm5MzckSaRuTxUIjBBFtBHTpY6iedL/3oXTx
	RCmr/87FZ+OO8kcbWH5rPeDKcDJy9+ctGRsrAQqcqfCg7wgvw0eiwKkAUoyRDzPwd9PnG/T3Tw+
	xRS1CAg==
X-Google-Smtp-Source: AGHT+IHupqzfoJY9EqLHDGlcyjRAk88IbaBDb/wMwF/OcvBE0w1hJEg1mGy1VxOeddmY+TH6QHmQtg==
X-Received: by 2002:a17:902:d487:b0:220:f87d:9d5b with SMTP id d9443c01a7336-22c3591836amr56173735ad.24.1744850744760;
        Wed, 16 Apr 2025 17:45:44 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33f1d16bsm20981105ad.58.2025.04.16.17.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:45:44 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 06/14] staging: gpib: gpib_os: u8 over uint8_t
Date: Thu, 17 Apr 2025 00:45:25 +0000
Message-ID: <20250417004533.86765-7-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417004533.86765-1-matchstick@neverthere.org>
References: <20250417004533.86765-1-matchstick@neverthere.org>
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
 drivers/staging/gpib/common/gpib_os.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 87329d35ca47..163d9a64e7df 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -263,7 +263,7 @@ struct gpib_status_queue *get_gpib_status_queue(struct gpib_board *board, unsign
 }
 
 int get_serial_poll_byte(struct gpib_board *board, unsigned int pad, int sad,
-			 unsigned int usec_timeout, uint8_t *poll_byte)
+			 unsigned int usec_timeout, u8 *poll_byte)
 {
 	struct gpib_status_queue *device;
 
@@ -339,7 +339,7 @@ static int setup_serial_poll(struct gpib_board *board, unsigned int usec_timeout
 }
 
 static int read_serial_poll_byte(struct gpib_board *board, unsigned int pad,
-				 int sad, unsigned int usec_timeout, uint8_t *result)
+				 int sad, unsigned int usec_timeout, u8 *result)
 {
 	u8 cmd_string[8];
 	int end_flag;
@@ -410,7 +410,7 @@ static int cleanup_serial_poll(struct gpib_board *board, unsigned int usec_timeo
 }
 
 static int serial_poll_single(struct gpib_board *board, unsigned int pad, int sad,
-			      unsigned int usec_timeout, uint8_t *result)
+			      unsigned int usec_timeout, u8 *result)
 {
 	int retval, cleanup_retval;
 
@@ -475,7 +475,7 @@ int serial_poll_all(struct gpib_board *board, unsigned int usec_timeout)
  */
 
 int dvrsp(struct gpib_board *board, unsigned int pad, int sad,
-	  unsigned int usec_timeout, uint8_t *result)
+	  unsigned int usec_timeout, u8 *result)
 {
 	int status = ibstatus(board);
 	int retval;
-- 
2.43.0

