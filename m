Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C6922B597
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 20:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744835586; cv=none; b=o304Ww+5Gc9l90IB3j9FXRaAkK5lfBdrOEtFIMkCvHK0+jY9jIo46qMj0ZIuRkJeHFBuuTbj2M2zVCOO8YfAg8RXxphhAHzEX1ZRsRKqDuasateZXuTNzYV0uDRNp2O29svu4TFx6i0c9bmJnWGXlqIomK3fJ++gq1dSHAJEb3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744835586; c=relaxed/simple;
	bh=gCn9wDu0xLD3oM32PN6Fuzizs59+OD/Pgihax6B632A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZqDLhDO7+7/3g3KQn6pYJwJtqCN3+fWPif5ek9Q6n0daQ0XuH2BOuslxaqJiFAhlvY+KZ1J6n1GqyILHn773qbHwwOb1+gWPlfTheMFiwd65wwf7CBZWd3Uk6XXv2EG8u/xeRcFSiGMbeaUmPNVoJ9jXrHAz1Rb9nn4ULrUCUCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=JevTmEjB; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="JevTmEjB"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22c33ac23edso1199405ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744835583; x=1745440383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1DXoGDvZGyLbH2+aIwdP9O6JxIXF+8VBI32a8Nw8pfU=;
        b=JevTmEjB3jDBW/SMOM3yL88VwgzZ2bHWMLQFL91Kcmv5a0dGBH0Z2QvXOVrcxGhFhc
         B27K3nulaKwxCQIBG/ZDQ8mq+65W7F0Lvui+5e8w64dibHgtuasqWe5NY/QMxx2psiXH
         49RgRavdCn4wOrgPqV1fQwHmzLAL/jhuMW1Hi+JM+Ln3RG89WlRJFB5SsW6IsykkB80J
         scosTsbJNFPsOcIcurNUBPwZytlhy/xmKeeLpAHAPNEp9eHK27zCm6xMzar4YGxzeVik
         0DMzwCijPxiH7BLDSAylp2SbUeqR1dDi8VFXDcUmsytE0EYkmS22R4c+Eu9oCg8lILzo
         DsmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744835583; x=1745440383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1DXoGDvZGyLbH2+aIwdP9O6JxIXF+8VBI32a8Nw8pfU=;
        b=VVvj1VVewkQrAW9mRcPbysdSEVYsWDsaUlX9J/bLDo7S24nc9EqaqqTRX60MpHbpFU
         ExuKzArUModWtlNxW/Aqn76VQleeY19XkVYRbWn7nrZkRz2O++8zbkmIWEYD/dGHojke
         vjLwhxZOTAopzx06YB6kN6A9fhiXF0nZFdS3YdNW9UcJMH3sZo9uhkzngg7EeV2WohnN
         TpvFmfcMjarMFTn/urVqRtyKZPukfvxfBHU76qi4BuDx2E9R8qMCkr+U7iLFNNwhFGGu
         +HCfkSSXpL7yf1jXkLzHAcesnH3PxZFZB3HinMVEEu2Z6u8XVwJZCLv3I2Oj2w2lIWVn
         VfQw==
X-Forwarded-Encrypted: i=1; AJvYcCX8c3RJ5FazsUF+YO0YJSZrAX8SuV4Fjuyvqa18lVMMFMUNcxwW80cNyAqfaP15LhK3LEYiJ4r/QF7dEIY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOfJwUBkH/ZkKaEs/+69dWuoaYtlvUT9eA5rBHwQhNABBkguCy
	TyZB1pG9HrCpTsvI+FWKjptUAp5GGp7VgIKvDOW+ozaIv+nU42J6DYJWtAQACg==
X-Gm-Gg: ASbGnctbaIsAmG2VfY9VOGX2mC3f6agQUkSmIT1eeptn8u1LpR1En11/8OuT2UZBzFM
	Ryf+RgpPI9sijRHhLa2UFZQFiwP9aC9EJC8Rig/X8nPBGX635q4dSV8IexpQzSw/Bm6uW2C6FvN
	wZm6m97Iaj8A6Y8oU9aAN96dHBhBwSNrTWDV6BcQdo2RJy/eX+hqrodC9LxRJrcDOvjP5jC4NPp
	ljBHrm8Irf5E8eKyoNlHhDdq3wJ6Nb0PcKGaMeTlJgtO47PBhDN3GhXKWi3fRY3JFnCfLXDtzZk
	HjdahHeuGfhMTNLpMQKZx4ClMKriJZSvy5Dl9gV7cLZzu3Pqt0ersAycmCLDLfNAJ1WB78+kQ/H
	BtDQz6g==
X-Google-Smtp-Source: AGHT+IF1rgbANcy3xraKnwKl/N0AbEb24Ewaky61VevbVWIUq2501P3ww4PGv4nFiekkm00UXVamvQ==
X-Received: by 2002:a17:902:f541:b0:223:fbc7:25f4 with SMTP id d9443c01a7336-22c358db642mr38322875ad.14.1744835583243;
        Wed, 16 Apr 2025 13:33:03 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33f1cd56sm18830875ad.83.2025.04.16.13.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 13:33:03 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 10/14 1/1] staging: gpib: uapi: Fix CamelCase and IBA Dup
Date: Wed, 16 Apr 2025 20:32:59 +0000
Message-ID: <20250416203259.7862-2-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416203259.7862-1-matchstick@neverthere.org>
References: <20250416203259.7862-1-matchstick@neverthere.org>
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
 drivers/staging/gpib/uapi/gpib_user.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/uapi/gpib_user.h b/drivers/staging/gpib/uapi/gpib_user.h
index 301083f287ad..58b996a8bd7f 100644
--- a/drivers/staging/gpib/uapi/gpib_user.h
+++ b/drivers/staging/gpib/uapi/gpib_user.h
@@ -285,7 +285,7 @@ enum ibask_option {
 	IBA_RSV = 0x21,	/* board only */
 	IBA_BNA = 0x200,	/* device only */
 	/* linux-gpib extensions */
-	IBA_7BitEOS = 0x1000	/* board only. Returns 1 if board supports 7 bit eos compares*/
+	IBA_7_BIT_EOS = 0x1000	/* board only. Returns 1 if board supports 7 bit eos compares*/
 };
 
 enum ibconfig_option {
-- 
2.43.0

