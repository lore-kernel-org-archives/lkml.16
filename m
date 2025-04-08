Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FAFD257AC2
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744150859; cv=none; b=FnVSaQMivHYH3r9e+rA3b5F92GQ9V2yazwO/zS3FyU/c/CqA6z+LUrRNMsAdCvjZ4FdWlu8sAc7Up1vk86BEhVLrlDxXwDlB+fHz0Z7EuS0M9QgDGZCLGLOF5Zzwn+juObUwcY4SqKcc1NMjfMIFC9quNB4ToyuLSJXXbkQvHIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744150859; c=relaxed/simple;
	bh=XVlXgBarOpByMZ40cyRxIGU3F0ct0U+lW2mc3HyTQ/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NFU1xhlNnDDdqroXhcp/Myz9psLGma6YhhkmMtsGVVMuMStDiQahtIQBDWHH37ysUTOFENqImIJzxcg4wY9kJMiM0gsTDKHns9YWa+vIstrxP7J9pGa0mNXegXdERsVzGITfaS+QnO0ZhqR1wcsFw9Ay5eDVlmwWPifkfUaGSZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=bSdIiXwb; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="bSdIiXwb"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2255003f4c6so55492875ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744150857; x=1744755657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tOCJOouKRzWm4DusysfXTOFj97bZFWvP4soqnOkGANM=;
        b=bSdIiXwbKRHp3Sc2FJjWqXxLhL8VuLjDqR5YYmRKFeFp6OPBqMzponl8ZVGJ9v5p3q
         0Ww7Woic47JUC3rgrqrdJc8d+Fi3ywkwDTnx6eOBq/ZeOV3NNLyZPxTXh9NrpJCP0CUz
         44XnbptrEVdPz6UsL2i/itFpbogNi0sPb+1wRE8WK3/7iuOTfqrYpgIULUZSKZKFPu8U
         4jGQB2IS3ZGOA0xmRasFj5EhhBIpGxtQ0mAiIQo/KiopouH9cBg+LdMB9Bjve+Q8Pb+t
         4uWOzA56WtASPkwvWwJZL8Mn+KqfL3mDQXMxzzLvTuSuW3MD8kK7izbOEU4TXIdu3EmV
         wwjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744150857; x=1744755657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tOCJOouKRzWm4DusysfXTOFj97bZFWvP4soqnOkGANM=;
        b=uh+oGJASMxUn9fXrpFDUkunV4OexZ1gD3Jnvf6ovdjYuJ0S5XRKjGK8awBxUveABtO
         k+DeJtqWMetijUOYVHfpfzhY/8wJN8fxyNnnfE9DFw/LrZLRUEhTxiKvOyzjoelNnj8M
         Gdw8XROuBqbeTbn7kHeEpekpPgqMmp2/5N5exxoXU3eFtvzk9bJc5PA/DSyQLziZUZJQ
         7/M7k4ytB+FryWOJ7CHUWirM9ldkvfWNWgvIB92cUiSXKYgmeyQitIFeMtEnEpDViXCO
         sXc+hlHkhr2ocL6aWd1EIAQwF5QzKAAfnht4rchuZoR5qjR6/L9iHYucEBmNCpKaclFk
         +How==
X-Forwarded-Encrypted: i=1; AJvYcCX0szZDrCiJQIEnXuzyW6W6rlHysrNR8ypS3T4CnMTilcRNrhykQAXR1w9oBwkJ3AakFfhbUPbKIIeHOlg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3JMXcqI+Bcw+FQvABksgt2O84drRJQL3jkgBz/UriDZ9HEggE
	Xv1x/QNhjnbeqpXEsGDfF3wy2ZTEb8LLKz+mzXBT3D/1YTgNCTzYVA0BX5GA9A==
X-Gm-Gg: ASbGnctoMAtsiQ59gMVcNFBHm3pXv5gupuxnHBW5L2vhnraX8sPljHE7c5+mxp2PwrM
	6LEnrWg4M6UeqvUmpEfYvV0wDWAH4TpdgsZ/S/WLreWmvg77l0EM2opPngOZVUok4+5s+u7rfdk
	Bii+Ch16Lfu+R76ZxJXkP3C6Hwk3Xh/d80tNh59/Lh1DL+nPJlPjZhFfYfs8bNuCmSpCi+FgUKZ
	HZvTmjgKU4cEw2mxK9UUNcyAZEkH7hIcgXYQw+B9Se2B6rS3TKcjPsWQLt6XeyC9+3PdiUTwF9D
	Qn6FwEPeMKSUMjytuVhZSNnfKdXB0gUzzvIyz5AJujkSv5xoTY+vx/rateCSC4PKzU2ToZh+t+h
	ncHeykpaCMw==
X-Google-Smtp-Source: AGHT+IGRcG/0A9R895NyLY04xo7ZTyvvpe7D0pWZVZ+pOHxJpZpWUst5VA6hx9p/XlK8Wh57gi11HA==
X-Received: by 2002:a17:903:1a6b:b0:229:1717:8826 with SMTP id d9443c01a7336-22ac29b0e16mr14759815ad.28.1744150857638;
        Tue, 08 Apr 2025 15:20:57 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97ee2d9sm11141575b3a.39.2025.04.08.15.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:20:57 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 11/14] staging: gpib: uapi: Fix CamelCase and IBC Dup
Date: Tue,  8 Apr 2025 22:20:37 +0000
Message-ID: <20250408222040.186881-12-matchstick@neverthere.org>
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

Resolved duplicate entry for IbcSPollBit vs IbcSpollBit.
Correct CamelCase for IBC enums

Adhere to Linux kernel coding style.

Reported by checkpatch

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/uapi/gpib_user.h | 63 +++++++++++++--------------
 1 file changed, 31 insertions(+), 32 deletions(-)

diff --git a/drivers/staging/gpib/uapi/gpib_user.h b/drivers/staging/gpib/uapi/gpib_user.h
index e02323508245..7f343256c110 100644
--- a/drivers/staging/gpib/uapi/gpib_user.h
+++ b/drivers/staging/gpib/uapi/gpib_user.h
@@ -289,38 +289,37 @@ enum ibask_option {
 };
 
 enum ibconfig_option {
-	IbcPAD = 0x1,
-	IbcSAD = 0x2,
-	IbcTMO = 0x3,
-	IbcEOT = 0x4,
-	IbcPPC = 0x5,	/* board only */
-	IbcREADDR = 0x6,	/* device only */
-	IbcAUTOPOLL = 0x7,	/* board only */
-	IbcCICPROT = 0x8,	/* board only */
-	IbcIRQ = 0x9,	/* board only */
-	IbcSC = 0xa,	/* board only */
-	IbcSRE = 0xb,	/* board only */
-	IbcEOSrd = 0xc,
-	IbcEOSwrt = 0xd,
-	IbcEOScmp = 0xe,
-	IbcEOSchar = 0xf,
-	IbcPP2 = 0x10,	/* board only */
-	IbcTIMING = 0x11,	/* board only */
-	IbcDMA = 0x12,	/* board only */
-	IbcReadAdjust = 0x13,
-	IbcWriteAdjust = 0x14,
-	IbcEventQueue = 0x15,	/* board only */
-	IbcSPollBit = 0x16,	/* board only */
-	IbcSpollBit = 0x16,	/* board only */
-	IbcSendLLO = 0x17,	/* board only */
-	IbcSPollTime = 0x18,	/* device only */
-	IbcPPollTime = 0x19,	/* board only */
-	IbcEndBitIsNormal = 0x1a,
-	IbcUnAddr = 0x1b,	/* device only */
-	IbcHSCableLength = 0x1f,	/* board only */
-	IbcIst = 0x20,	/* board only */
-	IbcRsv = 0x21,	/* board only */
-	IbcBNA = 0x200	/* device only */
+	IBC_PAD = 0x1,
+	IBC_SAD = 0x2,
+	IBC_TMO = 0x3,
+	IBC_EOT = 0x4,
+	IBC_PPC = 0x5,	/* board only */
+	IBC_READDR = 0x6,	/* device only */
+	IBC_AUTOPOLL = 0x7,	/* board only */
+	IBC_CICPROT = 0x8,	/* board only */
+	IBC_IRQ = 0x9,	/* board only */
+	IBC_SC = 0xa,	/* board only */
+	IBC_SRE = 0xb,	/* board only */
+	IBC_EOS_RD = 0xc,
+	IBC_EOS_WRT = 0xd,
+	IBC_EOS_CMP = 0xe,
+	IBC_EOS_CHAR = 0xf,
+	IBC_PP2 = 0x10,	/* board only */
+	IBC_TIMING = 0x11,	/* board only */
+	IBC_DMA = 0x12,	/* board only */
+	IBC_READ_ADJUST = 0x13,
+	IBC_WRITE_ADJUST = 0x14,
+	IBC_EVENT_QUEUE = 0x15,	/* board only */
+	IBC_SPOLL_BIT = 0x16,	/* board only */
+	IBC_SEND_LLO = 0x17,	/* board only */
+	IBC_SPOLL_TIME = 0x18,	/* device only */
+	IBC_PPOLL_TIME = 0x19,	/* board only */
+	IBC_END_BIT_IS_NORMAL = 0x1a,
+	IBC_UN_ADDR = 0x1b,	/* device only */
+	IBC_HS_CABLE_LENGTH = 0x1f,	/* board only */
+	IBC_IST = 0x20,	/* board only */
+	IBC_RSV = 0x21,	/* board only */
+	IBC_BNA = 0x200	/* device only */
 };
 
 enum t1_delays {
-- 
2.43.0

