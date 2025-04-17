Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0C11D63E2
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744849979; cv=none; b=fy/uAMh9f4TnsqxPi1MNIshS+amWFVUJV7AcO7Tav/MhTCUGdCB2vUz76bIWmWCYEFTzHuehJ96A1b0IzSjczskDmOtqcifig5qmkrsJnAnUflsP17Zf06IwPtb+fcqFyhmSXSspC46mjQ6Bhrx2y72wvxwDPiab94hYmlCCOKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744849979; c=relaxed/simple;
	bh=KQ+QquYMBIqqRibT0ze5+kVkj49lKLUsMiQ1kpVHVo8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bxiqn7XCyVi2cW6Zz3peruNRj3w6/J4AzfP0gff0HfB4AkFJhnZ5zyjm7GVZdwPLdaXuyKJx/kjQ0fdEpn7+C7z5SU1Vl1P7TVDLS3ZjekCmJS4M48N1p2DFwM+0darWqIJTawpHHW+P2R7XuJ+8t9hxa6vRS8uYEfZbpSVyoLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=SBgZh6X+; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="SBgZh6X+"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-224100e9a5cso2612005ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 17:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744849977; x=1745454777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J13uXJRWM0moEsklwKwSqEYQ8UWHeXvw7Ls9WCbeq70=;
        b=SBgZh6X+8frX7vhbd38J1HDiImME+eL7Jv43AfDCsscKN12xbrZLiWo7s/FIdABdDi
         KSUQcZBjaUQCQqXhu8Bs8BTh+RLTcSWGpbwDEMubULNxFCpJWwblgpC504MToFg2Y/2o
         D1N1WjWKYRdX0AbpOGUccPNUis7omVU6Ov433yNurXXVsyWb/7sdDDCocexM7ULtwLCY
         r8c552Qt+FfN3kmXTwVOp2ZcK+plSjHfKGaCcGhjkpXFGiYpZGbbfr+YbEbPauNtATYB
         X2xmfQEL696cGgtiMR57b+BX4KWnJkr1y056+ZQ/FwZu/Rz1WpB/JO2y9R02PZ4qKBOQ
         es0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744849977; x=1745454777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J13uXJRWM0moEsklwKwSqEYQ8UWHeXvw7Ls9WCbeq70=;
        b=FQqcczfU9Jk5mFk2Zhxyxs7pCBmFWZ5cwp7zzrCvZuVY5V8faKYyi3QWEW1f0nVgq2
         y9B2ha5rse49KNs9p9wODFdM3rcNrBd6+D91sordWDlgN5Gif1unyWhRIP9RAvRCJgFl
         sAibJFELybtU+vBquMUUgVLpQl1j8DclZL+UM3rywyL6lo9L4skF9PtNBlcERilL+cAP
         LNC6zy+xX9fM9KVi13ooT01VINRYcYvmhAhuhdsJswHUV0jfRw+t43tFt6a+2y/sgTGN
         YkptINOw7pH8+fAGuW4NNvpq6GzZhZDLauC83yheID217AD/zd37fA/onOir6MDRfkiK
         Ilug==
X-Forwarded-Encrypted: i=1; AJvYcCXK3eIV4gBiK8w45P3bA7I8JO2NGVt/NC8bvV2eSQ+aEpES48zNerOTMoxKSEk1f+jiuWlPKetIOKm2IrA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwX4CXtekr4GVtOaN35wAtlyzGc/EGgI6ZT4YW+igU+fYX+IAjp
	yIO0lxnV5G+IDN8rXvZ1oTcDAq/0dwqNgCykqkvJWXuMTPSpDWYCQ8Q08pp1Dw==
X-Gm-Gg: ASbGncsvo12hFTx3y0elQdWdBVEbGtdJl32/Q3f8ptO4nAacenOl3EC+PQ/7J4aY7UY
	3QDV8OzzN8Hie4e5IhMwH1DzKcLyAPJTqUUU3WI162mCLPTn8QLiHKKnHCKjrGn97pDT36BTvkG
	DXtl0qvGOhJ7/eOLU21jtn5SSb7Ugf15G0RRuyQ3PjQ4Q0+0KFgUqo92tFjmYOjJluXaVG21RCJ
	HkXAVEyxdf88CuFtQ3eVfPGWE6UHHOtc9bch6pcMpU3ujcRfGzEdEeh1+G0uqpSKZosoLd814t7
	rJYYCxT3ukFnLwsF5MecUL48ltwiHKI41EzOuYLGdG05999mJF4gDvjtWNUKzavEhGLVbmlmo8q
	PxzoYzA==
X-Google-Smtp-Source: AGHT+IELXGI5nfNb1JGGFd0TXtfxoydnNvgxQFjdrUy7B4TmFWpVuVQZuyyGeKtBcECtNET7gjACFA==
X-Received: by 2002:a17:902:d4c1:b0:223:4816:3e9e with SMTP id d9443c01a7336-22c358d7039mr47655315ad.13.1744849976841;
        Wed, 16 Apr 2025 17:32:56 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fc451fsm20855325ad.159.2025.04.16.17.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:32:56 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v3 07/18] staging: gpib: fluke: struct gpib_interface
Date: Thu, 17 Apr 2025 00:32:35 +0000
Message-ID: <20250417003246.84445-8-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417003246.84445-1-matchstick@neverthere.org>
References: <20250417003246.84445-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/eastwood/fluke_gpib.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.c b/drivers/staging/gpib/eastwood/fluke_gpib.c
index bca3bb8a3d28..a45befcf003d 100644
--- a/drivers/staging/gpib/eastwood/fluke_gpib.c
+++ b/drivers/staging/gpib/eastwood/fluke_gpib.c
@@ -712,7 +712,7 @@ static int fluke_accel_read(struct gpib_board *board, uint8_t *buffer, size_t le
 	return retval;
 }
 
-static gpib_interface_t fluke_unaccel_interface = {
+static struct gpib_interface fluke_unaccel_interface = {
 	.name = "fluke_unaccel",
 	.attach = fluke_attach_holdoff_all,
 	.detach = fluke_detach,
@@ -748,7 +748,7 @@ static gpib_interface_t fluke_unaccel_interface = {
  * register just as the dma controller is also doing a read.
  */
 
-static gpib_interface_t fluke_hybrid_interface = {
+static struct gpib_interface fluke_hybrid_interface = {
 	.name = "fluke_hybrid",
 	.attach = fluke_attach_holdoff_all,
 	.detach = fluke_detach,
@@ -775,7 +775,7 @@ static gpib_interface_t fluke_hybrid_interface = {
 	.return_to_local = fluke_return_to_local,
 };
 
-static gpib_interface_t fluke_interface = {
+static struct gpib_interface fluke_interface = {
 	.name = "fluke",
 	.attach = fluke_attach_holdoff_end,
 	.detach = fluke_detach,
-- 
2.43.0

