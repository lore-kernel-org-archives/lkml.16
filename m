Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB54202C5A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 21:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749590529; cv=none; b=iHyhXn+MxFGo2W41tB0rlKynkb3xnnu6MikRh2Fx4mMLE7Vo5sES5+qtb361WMNmtMOgMm1dBJuOQ4eEzTxHg+cBr+N6KRsYBM465BPWm/mHZH+8hbGVdCGFeTM1Kr69cuLjoAlytoc/hhck/q2/O60J7fpwff2dtuS+ApcN6CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749590529; c=relaxed/simple;
	bh=K16Y7M17FCfdH67j0aqX4gnJYQ1fLn29xqSjn945hvo=;
	h=Subject:Date:Message-Id:MIME-Version:Cc:From:To; b=WYrPWwDN7rEecjXh5ceGe5qMjZK/2nGaDy35VNGeKEPN2SyhiGSuzWbAioUJBTxbap3fOvgIXjrzjRu4i/SvwiHliJoNJUEH0RB+8CHA6QJGW5a9vg3+QlaBOu0fuO1pC0NXu7F9hmxKZHrW8z7WPtLcQTyS1aVglYfDa9y56qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=k1WgTNYf; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="k1WgTNYf"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-234b9dfb842so53484165ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 14:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1749590527; x=1750195327; darn=vger.kernel.org;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=ltRg+v/yp8EdLDcNG6KLLiNgJ14XsdfIIIkgnAoB4zk=;
        b=k1WgTNYfHJEUIrITB83iXl76K5LNItkGLLSJIvIMZO1EFWP2yUax5h6U1gNo8EP0sA
         UNk62dmOtkmQfjJpbm/+Z+SaLBGQxSZ/w3sWWpLFNTe4suhHNKxNIWGhLkbczYtGHqiG
         262CpDxYe6abmowBuIHXyFXSY+grVHDNxYO2i0KPgpiSpv/Yr0iP6jewSuUB5VwmlmN6
         xa8OSHttdS2QWIrQP6iM3sO1Pg0ENa/3xR9ugZZgVkcuuijnUIqnTU8iYuv2BLoZXf59
         +OugSD9Lde+ZNgwWBjPw1HGylnQ8tHwdZw4QyzDYdmE124oSk9/5zQbYZSu1F0+iq2PS
         YwjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749590527; x=1750195327;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ltRg+v/yp8EdLDcNG6KLLiNgJ14XsdfIIIkgnAoB4zk=;
        b=GJ21KWYJ6A0e72VBS8tclEr7b/JTgEy4lr1Cp/Em34I+k17ZXjvwqxU9l8YaJmu1pM
         AunXMryGO6/MOIsyEf/V9PQbcM+R5PjJuYmOIyO3kG7AQKlctIysdr4p+3C6BbDfQQaA
         Td3bqWhaLldcWX53ydpPYAivnbIsVpMnCuDTNkY5bV5Ms9GeHiJrz3nci1b+3JUngHsY
         uogK+1wi1HCWLenWBvs1Od6BKW6g2DDuGugANxz9/g/v80kPdfwWdXVEcgbsxHk4d4ZX
         Uun42aQ+vt82A7C4haevfsyl9zsodwRpXFQO9snc3PwUViZi708YIXw2vf152P87mkxJ
         XZsA==
X-Forwarded-Encrypted: i=1; AJvYcCWSeihTsa/CJ9QS9qADqF97MljC5QkvUkKbG6nkfl/1rhdUSLiwo/lOLKKGx1bJIr/kzB6RgeJfqH3C5G0=@vger.kernel.org
X-Gm-Message-State: AOJu0YztbO3IoaN3OgJx3EOYkad1/kMr/g8ka83wQ/aC9qjdzyJkcV69
	zfKIRSJTSz1zjbYQk1PWlO8DEERJakqebxAqKxOlZrYHP2uD0DvYN1CK8rFQ/i92svCzpa0qE//
	QABt3
X-Gm-Gg: ASbGncsqy4QQLPhfrUJkj/rkWlxdP6QTXjCYQeBSiI9yDV5u0Ic3WotT9dKA8cVGFzc
	1eZqdWHiJhjcpeP08ER/geAFl04fp9F9ie7AF64s+htdhaICmyQPyqtRfmk3pKEjY+/94zdA8/o
	aYYly9NXiE6VjKz/IjbTzNbSyO4/RTBSPsohBQbn52xofGkFJprs7hjNlY4uPwhL5Sc+v5xohUq
	Lu385P/Ke7vBJQdP2bWBim0VQYrrD6V2q+KRaKTbTnjgbXv8e8bBI7QHg297O0+ubwXGzp5dLeU
	inkqbsua++B/DSdcdgDH+VVriSLqgAa+R7pvRfkHKxFcLwOJ28M8LiG2Bts+
X-Google-Smtp-Source: AGHT+IFwY/pTpiIL3M0yGU8xm4GvMzafomO0b0H11xHhVJH6uvNlNsGipFpdPVAVO6VcJAOc5TJEzw==
X-Received: by 2002:a17:903:94c:b0:234:ba37:879e with SMTP id d9443c01a7336-23641b14d3dmr10940325ad.38.1749590527026;
        Tue, 10 Jun 2025 14:22:07 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::7:116a])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23603077f2csm75418715ad.36.2025.06.10.14.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 14:22:06 -0700 (PDT)
Subject: [PATCH] drm/amd/pm: Avoid more large frame warnings
Date: Tue, 10 Jun 2025 14:21:41 -0700
Message-Id: <20250610212141.19445-1-palmer@dabbelt.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kenneth.feng@amd.com, christian.koenig@amd.com, airlied@gmail.com,
  simona@ffwll.ch, asad.kamal@amd.com, lijo.lazar@amd.com, Palmer Dabbelt <palmer@dabbelt.com>,
  amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alexander.deucher@amd.com

From: Palmer Dabbelt <palmer@dabbelt.com>

9KiB frames seem pretty big, but without this I'm getting some warnings
as of 6.16-rc1

      CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.o
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c: In function 'smu_v13_0_6_get_gpu_metrics':
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:2885:1: error: the frame size of 8304 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]
     2885 | }
          | ^
    cc1: all warnings being treated as errors

Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
---
 drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile b/drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile
index 51f1fa9789ab..9824b7f4827f 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile
@@ -23,9 +23,19 @@
 # Makefile for the 'smu manager' sub-component of powerplay.
 # It provides the smu management services for the driver.
 
+ifneq ($(CONFIG_FRAME_WARN),0)
+    frame_warn_limit := 9216
+    ifeq ($(call test-lt, $(CONFIG_FRAME_WARN), $(frame_warn_limit)),y)
+        frame_warn_flag := -Wframe-larger-than=$(frame_warn_limit)
+    endif
+endif
+
 SMU13_MGR = smu_v13_0.o aldebaran_ppt.o yellow_carp_ppt.o smu_v13_0_0_ppt.o smu_v13_0_4_ppt.o \
 	    smu_v13_0_5_ppt.o smu_v13_0_7_ppt.o smu_v13_0_6_ppt.o smu_v13_0_12_ppt.o
 
 AMD_SWSMU_SMU13MGR = $(addprefix $(AMD_SWSMU_PATH)/smu13/,$(SMU13_MGR))
 
 AMD_POWERPLAY_FILES += $(AMD_SWSMU_SMU13MGR)
+
+CFLAGS_$(AMD_SWSMU_PATH)/smu13/smu_v13_0_12_ppt.o := $(frame_warn_flag)
+CFLAGS_$(AMD_SWSMU_PATH)/smu13/smu_v13_0_6_ppt.o := $(frame_warn_flag)
-- 
2.39.5 (Apple Git-154)

