Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D5B1917FB
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 18:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745690926; cv=none; b=qUCdpDpgIue20AnLCiiRYcWVRx3PXHwXcDx35r0Fp8V5QBifIG9kfOhoTearfBuGCxJbIhT5IilkZU1jclPDWzNY5dwT0+sDElgTy4Ccl1nyGzkxw2SzEhueAFfxbHimN5I4BjJC27VHfJxaMnNzERvmN5HTtuPi9wIN8ghk+kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745690926; c=relaxed/simple;
	bh=y4ya+INrEVixoCif62MVtLyM7OQQtp5jHaZL/WHf6Rs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rT+1oK5DjhsYYbe9PfW2UJF7e9Jbc8ITnpzgPbV5d/eTR+c+yDRXFzZvGN8gPZ9FwAwkvGMc/VMcQp1bvYRx9EYKVrjfwKom0+rSM4N6NbevpgpISYNXcIitVNsyIOGyc7URsOwnW5DrWWonL56IWXevoruFBm0dxpUR+vsGqR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OY51rKhz; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OY51rKhz"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-736a7e126c7so3235416b3a.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 11:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745690925; x=1746295725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bhX60juYce9oJjVZnoa2KcWxhL21D5ai/fJlhe3KT5I=;
        b=OY51rKhzu1JdD3HnmHJV3ZKhzABV9dhA1TXaPLLqwipoDTrbLB5vwxsGo9qZb7dECU
         XCs3fDgVUtyGf9qjw9CRCB1m87ZU7pFlRne4LFVPCnew84WFwPJMQJwmazHoYi66J7aE
         YlaqkOQ1WnVzuwRGXQFcFWmawUxpQxvl9dAil7HMDS8IqyV/bHz+F0uN/9CbLvxswZFK
         FcLGntmFD7SpXf2glj7yj1Kjmmz784ocmf+6VdXnRwopmncOPMfpp2LXHJYy7TM7RzXz
         McY6Tj14jPSGXtKu7lAntw6QsLpGT5qVMvSa6wR6acKup7fyL2A/v/Ni0RKJ1908arBO
         sbHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745690925; x=1746295725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bhX60juYce9oJjVZnoa2KcWxhL21D5ai/fJlhe3KT5I=;
        b=VnQLVfqNU3j77b/nAVphSnxta5JijtCUvk15o5P5YFrk9Vcm0t7KP3gs23RbdmpgSb
         88OPbrTiwWlt6RKK6mvq7g8hEjUNIwfUdI+9/txCuE6Ju8je6StxXT8AYaBG37XrCCUH
         RfvutP9DmtWjn0kWz8jkHVmqnNdE4EAZyae5F+uqW1uqgS9sbhrdtDtQZNDa2QgAWxKS
         01NfvEwhV5wtxS9fYGhFqcsrMYY8u10FIq7Ueoe4us9hlm+ysdbpZappHDu71l2sLPnO
         oOyDlw7nfY/UyAseOVa77J/daGwoWwkzvfCfoA9JTnNrO+vNhM0zH5xrvaTIinSJrNoo
         bnEA==
X-Forwarded-Encrypted: i=1; AJvYcCVa0SIIhAqGw5GFCRzk98c30eQ6sHOt5FtIY08P+5NdWWXVE9cNIlI9hrtsMXmUKfeBkqYVXbJhk03NDNo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgXBsJB8r5xxhX5WxuNat6CxprahGDk4AoaZ1rAr2j4/lnztw1
	HWcIYFFwBX10Q9FoysI5eIzO1CfV/3qHaJpToidm4EyhxIAnSA5V
X-Gm-Gg: ASbGncubpyOFVQ/WsH6M/JJfUZz3w0kZE8ULqJZphonu8WIPGtNbd9Slxea1kwyDFjt
	s+WMmqgWUmXaqlrir6euoAXqLdOuptUPmEpss2kWxo2Lfhzys8IyL8Qd7Yt8gbNICvPggeRc1LQ
	2m4bDbVaNbCF0wn3hvnrvyM7cNHbx0q2VpZImla6TuPU7FuYQyLCKBU7oAGJnxUps8Jpz+Ig4no
	F4CghxtexCEGS2jf76Yin5Q4EG5sj0Kk5F9muwwLUAYmNBWM/6Wl7z9Qpe2g1TTlS2fMlbkcz5c
	PrdnDi2ze3siXjLwbG5V55S50sTNYOGvOTB4biXKew==
X-Google-Smtp-Source: AGHT+IHKYHk8tYB2+bPO+mVa5uOZOMvO77Bd8R7LCrZBAekBmdc86v0OFmQ6Z46ePtfA09/qISQZlQ==
X-Received: by 2002:a05:6a21:9984:b0:1f5:8d3b:e272 with SMTP id adf61e73a8af0-2046a404462mr4446789637.1.1745690924854;
        Sat, 26 Apr 2025 11:08:44 -0700 (PDT)
Received: from pop-os.. ([177.21.143.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a995a6sm5256274b3a.139.2025.04.26.11.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 11:08:44 -0700 (PDT)
From: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
To: akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	surenb@google.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>,
	Andrey Konovalov <andreyknvl@gmail.com>
Subject: [PATCH] mm: alloc_tag: change the KASAN_TAG_WIDTH for HW_TAGS
Date: Sat, 26 Apr 2025 15:08:37 -0300
Message-Id: <20250426180837.82025-1-trintaeoitogc@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

the KASAN_TAG_WIDTH is 8 bits for both (HW_TAGS and SW_TAGS), but for
HW_TAGS the KASAN_TAG_WIDTH can be 4 bits bits because due to the design
of the MTE the memory words for storing metadata only need 4 bits.
Change the preprocessor define KASAN_TAG_WIDTH for check if SW_TAGS is
define, so KASAN_TAG_WIDTH should be 8 bits, but if HW_TAGS is define,
so KASAN_TAG_WIDTH should be 4 bits.

Suggested-by: Andrey Konovalov <andreyknvl@gmail.com>
Signed-off-by: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
---
 include/linux/page-flags-layout.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/page-flags-layout.h b/include/linux/page-flags-layout.h
index 4f5c9e979bb9..760006b1c480 100644
--- a/include/linux/page-flags-layout.h
+++ b/include/linux/page-flags-layout.h
@@ -72,8 +72,10 @@
 #define NODE_NOT_IN_PAGE_FLAGS	1
 #endif
 
-#if defined(CONFIG_KASAN_SW_TAGS) || defined(CONFIG_KASAN_HW_TAGS)
+#if defined(CONFIG_KASAN_SW_TAGS)
 #define KASAN_TAG_WIDTH 8
+#elif defined(CONFIG_KASAN_HW_TAGS)
+#define KASAN_TAG_WIDTH 4
 #else
 #define KASAN_TAG_WIDTH 0
 #endif
-- 
2.34.1

