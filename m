Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB8025743A
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744150858; cv=none; b=jlgxqMFT6APEaqLLaLtXce0CE+1AmYVbK222xAAHnkEdEEAIRwzrC3sqaeIUaRxFjiogDU3yfiq5mblPZKtrCGDjs6M7wPt2bVqT7WtW8btManxJF3y8HIpe9/TNKl6BFDrHN5Bi4X1fT9zDVMxO46InBF+oUShM31OBHhhnbjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744150858; c=relaxed/simple;
	bh=9MoYSy+i6KAZhpILjMy1L1BRjlM996c5bRCz4EBRL14=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nTKJnsSAHrjEZWv8fO4b+76pfWj+4cN0UBOwWTQRCspY9OMkl0r+63XdnexX8BY8bZjzELzg9DV85OzyfMKb138VoU+dLxdRgxDz323J8LBUPOMXWAWHWxnkl02OxIfpT/X2PdYIlqtBJWnfdGAFsh140kv2il7pE7HYbxXpKh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=XCXCCR3/; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="XCXCCR3/"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22622ddcc35so82605115ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744150856; x=1744755656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bj7aeiZmrkJPreyeHTYcjpGxFgUS2pxAs3IkhIasNDc=;
        b=XCXCCR3/S9kbPd0p3dGMBbOG9IrGiFr8F0F/p/8b7qbSUILWCc3YKA7chYeyXJrLvY
         Xt4tCT5cZdaJF5vuaJGMNJvIrf2H/BhNcyFD8OvNbBWv7Azt4dvRFfbymjJ9nHoXRFCs
         3UPEKGoo7llMjbuHDHgehQDnPlM2QRmQq7tcjC2ZMn98uiFnnF3GJp0PKiw4z2+QxsSl
         uwNNIzU3mLsiqEE7wXrWj5Q/MeBtT7zQEM/EnnaS7gBGMBBmxy7Q8TcOCKIgzCVxDtGA
         uHQMolVQ9nh4/ZbXByAmn5b5spPT4h2BiXIVEzNCXV8J6hUAKYQUaB8vg4fQpwYHx2Md
         6FYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744150856; x=1744755656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bj7aeiZmrkJPreyeHTYcjpGxFgUS2pxAs3IkhIasNDc=;
        b=an5ynM5c31iosGKlBdLvh4O+Z2z1PzljyAdEiUHaaUhr4ZOTUCMP6p/6EgXUQasZF3
         fRJeujnJVWEOfkkrf+EYDN4gbvB5MKgo8WbhjQMw2FJRBy+lrGPIqSsOxoVO7eQJje3K
         ZxrrG6aBa9OJfmLvQl4RikUCGEHSCBHj878cymd7lErNPktVjYVab2GMtqzorGV0JJvM
         2R3KuzMU66XuZL3rJAqz8a1rAG4b4rFefvDtzuKG+Bq4XHvoz8D/9mNhv4aHDhbcCouK
         7SJ2PEioYOJPezTxS3QJX3Cks5SD/Oa0hcqRx+CflsojXVH3c6+a0bVidRbIo1pWF4mV
         +vgQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4UKvXhaSs2cOwn+wdGzW5PUZF5oxBuKdNY5GtmO6DO+IwRQ7G87qQawDB6B0/K4iZbOE/7lW2337bxY8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ1qZocx5UWjV6rI78WVbSESxPlDJM9numFINevQcwrqFRY8h5
	tfhkkwxKntdeo7YbSBvWa7eJIXe88VZi692au5rWFHBYmachq21JjFKjivJA0A==
X-Gm-Gg: ASbGnctcddkmtivZfFvtxjnfESpa7ZzxjPphdFP2n0gx4UM8S3maj2pr6Se4dUxeg0O
	7d3klJS2h8nlBklrx/X/V2CWhJ0HuTvTLys92nxE2dq/XdMeoazxct3NH5ua/bxL0/4l4M2nJ4E
	Md7PsX9M5Sb2bk9qMywGupekcQFjYHisqgtGqJLX4XonJElkyyMkwaBKY2kwlEysvCZhjYxMfzA
	YCKpcaxiij4VWBTnzm3B47iykFh28kEztZZC2EFCVqni1OB2wddOwLd59mT1+v8yD7W7fw/WpUD
	ysOUNYUGxYrovHreQZ43KSSNBJ8IWAga253IT9p7daEjT5Cw7mjS7EmpgTgFCSwn7+hJipPPUay
	X3feceiPt0A==
X-Google-Smtp-Source: AGHT+IHJQsYnkDlPjG+SnVvIKi+ZRS5hRzX9ZAJr0r8knqb7BsSR2a7FOCMN8XF9PE0LXQx/O9k7+g==
X-Received: by 2002:a17:903:32cb:b0:220:c164:6ee1 with SMTP id d9443c01a7336-22ac2a1df5cmr11766275ad.32.1744150856306;
        Tue, 08 Apr 2025 15:20:56 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229787780b6sm106086545ad.258.2025.04.08.15.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:20:56 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 10/14] staging: gpib: uapi: Fix CamelCase and IBA Dup
Date: Tue,  8 Apr 2025 22:20:36 +0000
Message-ID: <20250408222040.186881-11-matchstick@neverthere.org>
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

Resolved duplicate entry for IbaSPollBit vs IbaSpollBit.
Correct CamelCase for IBA enums

Adhere to Linux kernel coding style.

Reported by checkpatch

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/uapi/gpib_user.h | 65 +++++++++++++--------------
 1 file changed, 32 insertions(+), 33 deletions(-)

diff --git a/drivers/staging/gpib/uapi/gpib_user.h b/drivers/staging/gpib/uapi/gpib_user.h
index ff5a257f9a01..e02323508245 100644
--- a/drivers/staging/gpib/uapi/gpib_user.h
+++ b/drivers/staging/gpib/uapi/gpib_user.h
@@ -253,40 +253,39 @@ static inline int gpib_address_equal(unsigned int pad1, int sad1, unsigned int p
 }
 
 enum ibask_option {
-	IbaPAD = 0x1,
-	IbaSAD = 0x2,
-	IbaTMO = 0x3,
-	IbaEOT = 0x4,
-	IbaPPC = 0x5,	/* board only */
-	IbaREADDR = 0x6,	/* device only */
-	IbaAUTOPOLL = 0x7,	/* board only */
-	IbaCICPROT = 0x8,	/* board only */
-	IbaIRQ = 0x9,	/* board only */
-	IbaSC = 0xa,	/* board only */
-	IbaSRE = 0xb,	/* board only */
-	IbaEOSrd = 0xc,
-	IbaEOSwrt = 0xd,
-	IbaEOScmp = 0xe,
-	IbaEOSchar = 0xf,
-	IbaPP2 = 0x10,	/* board only */
-	IbaTIMING = 0x11,	/* board only */
-	IbaDMA = 0x12,	/* board only */
-	IbaReadAdjust = 0x13,
-	IbaWriteAdjust = 0x14,
-	IbaEventQueue = 0x15,	/* board only */
-	IbaSPollBit = 0x16,	/* board only */
-	IbaSpollBit = 0x16,	/* board only */
-	IbaSendLLO = 0x17,	/* board only */
-	IbaSPollTime = 0x18,	/* device only */
-	IbaPPollTime = 0x19,	/* board only */
-	IbaEndBitIsNormal = 0x1a,
-	IbaUnAddr = 0x1b,	/* device only */
-	IbaHSCableLength = 0x1f,	/* board only */
-	IbaIst = 0x20,	/* board only */
-	IbaRsv = 0x21,	/* board only */
-	IbaBNA = 0x200,	/* device only */
+	IBA_PAD = 0x1,
+	IBA_SAD = 0x2,
+	IBA_TMO = 0x3,
+	IBA_EOT = 0x4,
+	IBA_PPC = 0x5,	/* board only */
+	IBA_READ_DR = 0x6,	/* device only */
+	IBA_AUTOPOLL = 0x7,	/* board only */
+	IBA_CICPROT = 0x8,	/* board only */
+	IBA_IRQ = 0x9,	/* board only */
+	IBA_SC = 0xa,	/* board only */
+	IBA_SRE = 0xb,	/* board only */
+	IBA_EOS_RD = 0xc,
+	IBA_EOS_WRT = 0xd,
+	IBA_EOS_CMP = 0xe,
+	IBA_EOS_CHAR = 0xf,
+	IBA_PP2 = 0x10,	/* board only */
+	IBA_TIMING = 0x11,	/* board only */
+	IBA_DMA = 0x12,	/* board only */
+	IBA_READ_ADJUST = 0x13,
+	IBA_WRITE_ADJUST = 0x14,
+	IBA_EVENT_QUEUE = 0x15,	/* board only */
+	IBA_SPOLL_BIT = 0x16,	/* board only */
+	IBA_SEND_LLO = 0x17,	/* board only */
+	IBA_SPOLL_TIME = 0x18,	/* device only */
+	IBA_PPOLL_TIME = 0x19,	/* board only */
+	IBA_END_BIT_IS_NORMAL = 0x1a,
+	IBA_UN_ADDR = 0x1b,	/* device only */
+	IBA_HS_CABLE_LENGTH = 0x1f,	/* board only */
+	IBA_IST = 0x20,	/* board only */
+	IBA_RSV = 0x21,	/* board only */
+	IBA_BNA = 0x200,	/* device only */
 	/* linux-gpib extensions */
-	Iba7BitEOS = 0x1000	/* board only. Returns 1 if board supports 7 bit eos compares*/
+	IBA_7BitEOS = 0x1000	/* board only. Returns 1 if board supports 7 bit eos compares*/
 };
 
 enum ibconfig_option {
-- 
2.43.0

