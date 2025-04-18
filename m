Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BC2218AA5
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 17:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744997697; cv=none; b=M7JwdvJZshyeJkhF+ToO9hEDJP2P3C+lS/v7p+HHj4eTYOAzMRxo5uQo2Zwjl9XiUg4t7zOESunlFurt+EoO+IPHowzhGstr1RoTe8CsQ6t/AN0CvYWFYh0RKyLxSNBybKpxK6E1w61lelKQi5rOuca4GQ5SdVDbJszPiRFOFcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744997697; c=relaxed/simple;
	bh=+Cfmlh/tFskvomgcuf43AocP180cBqSgLobstPW/aU0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QVJ1Igr6bMWXpOaYUV7fvfcS5hWyicVVRw9FiYRdBVC1nQ5NLOl1pAnCNKNAITexAPQ/oCxP/v7lVjGYZ4WA3bpLbibaRCFsIPlazzxNQEALddHEPt9AnP08dSUrVJNR9n9LnVuFEUvHq8aUrXEQTOxv3Ww2u6LKeN1B+zhhLiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iv0xDYXv; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iv0xDYXv"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so21497365e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 10:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744997694; x=1745602494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Eny/t4ZgpgtXxVb00JLrcfOtgOyKPjsxmDHcNqfqiQQ=;
        b=iv0xDYXvsvkZ+RMLLWbyW8Xm9E9DZGp1mT9/6UBoj40LP9zvrIOwGZJKouTVyd/gg/
         bgC1/zXAi9DZ9bgygnhJS1Ko9j+V3fPlpnifqv/uW2cC1oCUOgvcoW0WWBgSqCqWQFfb
         pETNo4bnruOA2uCRPUTbpL473kqGIiKErEQSfYycJD9yR5Atzm3ehc52L2BVgDlIYmeV
         MBzQ1Qkoffu4Rt6bS9094nrp7LBDm5Ew69LQi3TueA9UMywIRbvIXWSkC6HDc9XXJt4S
         HYIQQtaPJJgNQrEzc+r1EHWOoT2M9mTdjuZQOE2/T9ff4FDyTQgPT28LyNPLVVZz/BYE
         pJZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744997694; x=1745602494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eny/t4ZgpgtXxVb00JLrcfOtgOyKPjsxmDHcNqfqiQQ=;
        b=S2pUu4ghAUiHhSuzEHc+kxse0oJL7EZwyFFSvzgU7f+IBfsR3lLF6nu/Yl8LqvlPKG
         Pin/SIq4EOVKyk+UVUtDtqE8Uj5Dxo6q/pVdZf1bd3WvhOSPn9UHUJIA4+Vsab3u4jeK
         /KDWPdUcvqyIfLl1THN3I9fqcM7eH95RGMxIjYB9BPWYUIb+/eli9Pwp1SaJ9HmIVFW4
         dwL75YvEG4Kb1opCMVXSaQ+ZcVs0MaBSJHaZvpUCTh3pmLbpr0vqKpzLEX1INa0gqUTg
         UV0Lysjffqt1dv8E6kVuxkRM+JuFdBRsz6V8T4i1W5mUbWGHSQep3p9LoocCRvhdbvj7
         YNhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNb77tAobza7o0ZF4v0J7Hk2zLr7YFnYcWYpfhw7Ks6AlYy/pcpp2hxzsFIZcXcP46HAAqYNH9cCzTV5M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8lYPn+Sqdqh/yhnMrBpC7ojZGImM1EUhWFu9JEkAQGnYtUx7V
	HH4HmUNn+3tVDKabWWmko7kWEF9iDFzw5Dd12qX2KOsUtoU02hTI
X-Gm-Gg: ASbGncv+AawZXJtvN1tyHty6eCfUakEGNcayabtvwXfy653iHIti/q+dx1TViu3tIoE
	YmF41daeIINvxZ+Dn8SPyW8aW6X6zLNLRLY/HhVNphxNCfB1bUleWFs9P6mURnqzH4iUqa4bVm8
	IJcbJTI7/h3xSx0G1T6Pu23nhmajqNcp2cQcigCYWAuQmokFuqOAIznRtq4Or0cWaPC/bwUy8+M
	2xVtSODh3di99MVre2pYVMtdOyws7LuNfB2tNkcmR2FcYGPe5+0+lc+bJZNZJ1YvYB4CJB4kK94
	CyiRXPa2D1Cfolhu+ewmkKuTJb92/6/oFlS5nkjLZ51adMT9k62E5Tplk/+L81R3ToSEbyKSaCk
	p0qfNtdrcB1I=
X-Google-Smtp-Source: AGHT+IFXrAWBOqPlUUZP+RBiFOy3JVuCE+yAXQdvYnHWj4oxZYbr+Maj8YlJM8WlYKKMBWViZ1RPRA==
X-Received: by 2002:a05:600c:cc4:b0:43b:ce3c:19d0 with SMTP id 5b1f17b1804b1-4406ac176ecmr31651665e9.29.1744997693568;
        Fri, 18 Apr 2025 10:34:53 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4332f8sm3287320f8f.40.2025.04.18.10.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 10:34:51 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: marcello.carla@gmx.com,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 0/8] staging: gpib: Fixes and cleanup for gpio driver
Date: Fri, 18 Apr 2025 19:34:26 +0200
Message-ID: <20250418173434.2892-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This set of patches addresses a number of fixes and cleanups for
the gpio bitbang driver.

Patch 1 Fixes the faulty implementation of the request_system_control
        function.
Patch 2	Moves the code for setting the controller-in-charge to the
        correct function as per the standard.
Patch 3 Defers enabling the SRQ irq to when becoming system controller.
Patch 4 Removes need for cumbersome setup for the activity led with
        the yoga board.
Patch 5 Removes a no longer needed workaround for missed irqs.
Patch 6 Corrects the error return for no listeners so that the user
        library reports the appropriate user error code.
Patch 7 Improves the code for the allocate_gpios function
Patch 8 Fixes potential hangs due to undefined control line state
        on initialization.
        

Dave Penkler (8):
  staging: gpib: Fix request_system_control in gpio
  staging: gpib: Fix setting controller-in-charge
  staging: gpib: Enable SRQ irq on request_system_control
  staging: gpib: Remove dependency on LED subsystem
  staging: gpib: Remove atn_asserted global variable
  staging: gpib: Change error code for no listener
  staging: gpib: Cleanup allocate_gpios code
  staging: gpib: Set control lines in attach

 drivers/staging/gpib/gpio/gpib_bitbang.c | 102 +++++++++++------------
 1 file changed, 49 insertions(+), 53 deletions(-)

-- 
2.49.0

