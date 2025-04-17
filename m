Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97131216E30
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744849993; cv=none; b=tBc1uxsDus+OYinVspV55bY5N0O+lRwfboYS6Ax8xnB/1LvrJ46U2zIibDQN6RhxP1Kd4VgcU4/xdLwzN0y8ULKB16SfI2XGHiGJ0hMtgGhrFoX0Xn7SBiQ+PtBpFWLx5nRjjib8HIGw5aXYt94MZdcJwfFB4ZEc3GjMFS2PisQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744849993; c=relaxed/simple;
	bh=1yv5YY4t0Wi3X/jvcxjgbarzHO5IICMFfCZkUFOWK6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MIEkuMPANzDV+44NFsQnAvvsg3clIHC736FlPBV2bLVmpFWG3PF9pS3bNa0+Qw1MFcB8BRzs80reMBn6uHXkZGP6SVKgDTatGhcqF+k6omcZDZlWVb90Hrb1PbMr9DFZ+ZVNgcVZsd2anEcmKCuojChsDPyLW/3usN59/7sZJAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=jsMxdm1U; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="jsMxdm1U"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-224100e9a5cso2613185ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 17:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744849990; x=1745454790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mNJv0lcmYb9f27nCiWvpiCIAVgYIbFQyGmxFaNMZD0I=;
        b=jsMxdm1Ukn6hsC+94BPnFfE0p0y3iljCjlWOwAoFOpFfwnTUN8IsGVVSx4sN8xYnLB
         2p9w6WdNRDHJrAbswzPtAexHx2V7u1ZizI3WgnPY4oF7pDxnxeFoap4Bw+uwzwCSTX0F
         nrc+u8ORWzbceWR/oZGCoFzduOddZIpH85CmnAsYznnm3iDSl1LGTMI4tKHNBtQgBWr8
         Un15y+LOoWRr+8JQLOYmsLHgF4+vXrbyBlv3pQv1XZHRfV2Sy7NdJqH9lvZ/xQ0m4eBx
         O00MCefTALhzyxKS11Z13Xw/E2uE62eYNTTAV16oSUZxt3aHAMEflKUhI1fbCxbQtEtq
         XQRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744849990; x=1745454790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mNJv0lcmYb9f27nCiWvpiCIAVgYIbFQyGmxFaNMZD0I=;
        b=eL/aaNCVTCvjDR0O+/kCr4wnoZmNlY2hJHZAr99DWPOKfNCJAW2C/J/EUvEgmlxldg
         JLdmaaMG0I/oJ+lJXkbkbMGS7EXv6xLYg8A1yRrGbZgn27CijyyHGze5KzCJ2Y1svmHC
         HPLUga86UNcrQB7Ap3iUrzrC1LunTnj0D5g7ty2pjl+MytXoaXdK/whFYeyQToHCFH/I
         ZF3iyBhMCKqF+9VVPEjuJXAbHFj8qiHX7r05p+UWvUJWPwJ5icmlsfqCzOpkVvge3fq9
         c/rLVduTTLQDqjB246Z2HOgNu3He6idJNpkdYhqzOlTPef0q80AAnZKvN03MT+CeJvSG
         QjHg==
X-Forwarded-Encrypted: i=1; AJvYcCXeLYuBJB5tbXaXjapNdPTGbea6dwyWttBZJK3Iz+j/GRJtt01/sedMead4NLnYMVN8FnWu3YDO1sRypUs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvqDOfhUxSGTeCL6ltWRcGL9vLqqfvaIi1SbVKx54buOrQc9Lq
	ZLeYWJr11Wb2tqZrE5/xwcy2mTPt+9bN5wCE6FgNgf618p7ROYqzyQgMDk5msA==
X-Gm-Gg: ASbGncsP5YkSurNvqHFkGMIYgbkAxqvOHDaXDHE9k/sKgPxY29PI/aP26Epoxmdpn6c
	ISRH4EXw+Pi89ZL0Ea4KCTqNKCyo9uHfO2BQcndfpqvrNABaO32ohR/5tbpd+tDe8im4mznhV4C
	5ov7f+LZUPiD+4dAmDPG4m5rzAKjsJeBxcrasGb/BTCYVCxfN3F3nDrgVVr99x8bRhnSqitK06T
	s5Cqx3+vmHo4JyHMLRkm0WfG6zHg9agl9IiU2kEnVBdyk4PQS5FmDcFdY3iSGJBUQwHHH7VgsvL
	ZuaapjUbafKU6RH3TgKhQXbg/YxMd/PmZCzcYLnh+HkQCs2H3gY39QHgpWj0u9xUJ3M41RoQagK
	6a+6PEw==
X-Google-Smtp-Source: AGHT+IFt5YbjpyD8D2gQOKv05BlHP4z3woA0O9Kc4hWd9HjFvBJUKUheFmrQ3NAFaHH4nieVN2A+aw==
X-Received: by 2002:a17:902:ecc6:b0:224:2715:bf44 with SMTP id d9443c01a7336-22c358d710amr58076925ad.19.1744849989906;
        Wed, 16 Apr 2025 17:33:09 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33ef0e6dsm20876565ad.52.2025.04.16.17.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:33:09 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v3 18/18] staging: gpib: Removing typedef gpib_interface_t
Date: Thu, 17 Apr 2025 00:32:46 +0000
Message-ID: <20250417003246.84445-19-matchstick@neverthere.org>
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

Removing gpib_interface_t to adhere to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/include/gpib_types.h | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/include/gpib_types.h b/drivers/staging/gpib/include/gpib_types.h
index 712987ca139f..0dbe45894884 100644
--- a/drivers/staging/gpib/include/gpib_types.h
+++ b/drivers/staging/gpib/include/gpib_types.h
@@ -8,7 +8,7 @@
 #define _GPIB_TYPES_H
 
 #ifdef __KERNEL__
-/* gpib_interface_t defines the interface
+/* gpib_interface defines the interface
  * between the board-specific details dealt with in the drivers
  * and generic interface provided by gpib-common.
  * This really should be in a different header file.
@@ -22,7 +22,6 @@
 #include <linux/timer.h>
 #include <linux/interrupt.h>
 
-typedef struct gpib_interface gpib_interface_t;
 struct gpib_board;
 
 /* config parameters that are only used by driver attach functions */
@@ -212,7 +211,7 @@ static inline void init_gpib_pseudo_irq(struct gpib_pseudo_irq *pseudo_irq)
 /* list so we can make a linked list of drivers */
 struct gpib_interface_list {
 	struct list_head list;
-	gpib_interface_t *interface;
+	struct gpib_interface *interface;
 	struct module *module;
 };
 
@@ -222,7 +221,7 @@ struct gpib_interface_list {
  */
 struct gpib_board {
 	/* functions used by this board */
-	gpib_interface_t *interface;
+	struct gpib_interface *interface;
 	/* Pointer to module whose use count we should increment when
 	 * interface is in use
 	 */
-- 
2.43.0

