Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4052425B692
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151132; cv=none; b=ctN6TAIZx2LVF8B9USMFklHIvoY++uzRkhYTCrirWpnFFRASZVr5Vb6B27g1byziOdzmSPclNn5iQnNl7V2yOcKVKb8Fxf5gVnzm84m/ks+XLCp5mhFGmxCOPhIeybOMD9G2iBjEgq5mSRJS/y4q+9Wx8o/+U8aMSZhwMLD6odI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151132; c=relaxed/simple;
	bh=IV33bcMgVBe5I6EM7iwIC0bbwdNio1NkiOrIO9AbCT8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ClyjgM7zB58glliJd/NqkaossL2B6ooT0JBEwdvy2Jyj4NlnwB2Z27wtd0OgYLcrfXCyh71jCtmuD4F4EJhaudIGP5WZdiUEipYN3j3yhwVOFfGx5yRlM06g7J9z76ThvKCa+1xUZqTxQzbIZa/FI9ihBrnHc708ckIhsk5FNSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=ZeEMGw3g; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="ZeEMGw3g"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ff85fec403so117638a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151130; x=1744755930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9abTSO9nZ3GBHkjnW8Fgqsuv8V0aGDcD6sa8F+6ju9w=;
        b=ZeEMGw3gKItlErqgprWDXjJqFTbI3xZ0TN9xAl8TyAMeshkX9MTxTf52vhUGw3XeaC
         aeAAfY3koRTEBcD1nVXG/sMJhpOQz2T200w9IyvAPYgeY+pC9ijbEyTjylh84jNb5z0j
         DXKiLbp7Lo8e/LqtqP0wCGoIUFxBnWyaO7LOCqC2drzjLvjy+mZYt2uqL0ErWtw/gb+K
         EdEdi0yFMguWwH4zlK7Xu++JQP1uCKdQMx+zHj21ve/dvSGdAOpUp3E1QrAFgBOOMC9k
         Ovpgvy3z6P7cbSA2KlbzlYjkHNqHqTchtnXMghzF/rETAW3ASmYcR+fbaQASKGL1r7xI
         fOOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151130; x=1744755930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9abTSO9nZ3GBHkjnW8Fgqsuv8V0aGDcD6sa8F+6ju9w=;
        b=FnLJOtKfF1X0/TNfjztNDfj65Zpnd5kiNd111MCMVwDM8EpCWDC9Ux9c9Lmcbbox+v
         GdTZROsQ6oJj6NHib0HjrU5RorCTB9XTMroOAcjamHls0w6mNFtl9F7EgovFH5O1pXTO
         rMQ4afMKQa0gf7f/meZy655idueBspStEOOmkfZvs/XVZa4sN+mzTRpAoEiUWjl0LHWD
         AIMcC+3BFB3/EyQ9ijtVBc/7gRHHOqSb+nP0cjvPOW2iyR1ynzFoviE9eqBC2sKlBEPw
         phGXgXImQoT1o060h+lFDieWEYE9nllffe1ASx8Jjhf2D6tSCVv8vVSZe1GZeGE4qhui
         N3pQ==
X-Forwarded-Encrypted: i=1; AJvYcCU664JhN30OBzVhHjdruGq7p/Nbx9RxAhbIOZeBvPptLklGnorkgcZJQvy8FTQWP634yE3kPKg1y9MzjXU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpLSGJ44XT9ATaZH7Z0dH7hnflg8LVhE2mMYYC7dZKktyIvAx+
	o7UQKQ+IbWlUSSJfftWzBe4KVmlpLLr4r5b7IEFR4fogOL6mpcmV7OnBjuAASA==
X-Gm-Gg: ASbGncvvOiBQUqbiw58nECFMEAIoXMd3TfKaFpOjZL1Q0FY4UxAwOXZshpiS/2Vg+uT
	4OPv2V5eYzUvZifXztsCWCigzzoMiFGbYJBLSarS3OwJ6fI9NHu3oGseqduxKSjsozdTuFa7ZVw
	GMd8cd95bv6HMENlCwWEL4MSnvtM154ZucDDPSRqMG/qVloqAukf7nr8lHiPV5nRfi/XcCeewWx
	NCdSrm3LPbFGYaahjhxGFgltIky1wofbhwvwLrxAxGtM1xXtE3hGuPr9OhGc0gvQjBAfCg9uPvH
	jvB+a7b6feSMN1y3eRUkMPFEzAyfMdTKsjYwqJkXNYTMS1WH+lu0Yxk+q9+jth1/fMBHds44bz5
	Gdyymak5ROA==
X-Google-Smtp-Source: AGHT+IHMn1TPpOHHBZRpWsG38siKEoVe+9cV6YunkxSqefSZsDaEv+3mbT22wiTe0ySfjGWQ7y8VSw==
X-Received: by 2002:a17:90b:2d88:b0:2e2:c2b0:d03e with SMTP id 98e67ed59e1d1-306dc0452dfmr964780a91.5.1744151130434;
        Tue, 08 Apr 2025 15:25:30 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-305983b9924sm11542551a91.39.2025.04.08.15.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:25:30 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 18/18] staging: gpib: Removing typedef gpib_interface_t
Date: Tue,  8 Apr 2025 22:25:04 +0000
Message-ID: <20250408222504.186992-19-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408222504.186992-1-matchstick@neverthere.org>
References: <20250408222504.186992-1-matchstick@neverthere.org>
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
index 10d8776ef425..a5c21ac6affc 100644
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
 typedef struct gpib_interface_list_struct {
 	struct list_head list;
-	gpib_interface_t *interface;
+	struct gpib_interface *interface;
 	struct module *module;
 } gpib_interface_list_t;
 
@@ -222,7 +221,7 @@ typedef struct gpib_interface_list_struct {
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

