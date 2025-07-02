Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8EE2F365B;
	Wed,  2 Jul 2025 16:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751472848; cv=none; b=d5yRT+5NNa8ORWK7faTym/oI9bb1H2CzTEpT8Z+HaTy48JfHoXhjhwyClysQ29OQJ/6u/e6E8NgSoOPjlIjGkQQ7x9CazkUzxgYq6Pu65rSE2YXZNkg/vf/NTL8Z+50biRTxv1zMHTYPehzNZqEpuhiiZ46HVcgrAAFJbBw9i5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751472848; c=relaxed/simple;
	bh=9P/Pp8H05sTTonSNOeiD8PXpPn6itkrTXxZVOJmVe80=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RXT4zBNe90lSRYt9l+5NzVc/5AUF1zB2Lq0DH1d2Y2ntrCrzXT94qS6CYKS3rgIIT4ITYWHcKOt9eT3MMdNfPeiR4FJgmSXKrT4US8E7UIjxS2SVSBvPSvfCs635h3n3jk6zdovJ+jnDhULfw6jchDt7WTyzXoQyE20mE/wbayM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NRDsjv9c; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NRDsjv9c"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-74b50c71b0aso642705b3a.0;
        Wed, 02 Jul 2025 09:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751472846; x=1752077646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0c/84mBXTtb1I5DJ3f//CNcOZAIu4pgnp07Yr6FAASE=;
        b=NRDsjv9cKERfSlwXrrDW2QOY8hcAvPzsw2z0ZLgwhsT4J0mlmj8Sr0YoFTQ7ykFKXq
         CF1nRQHrd1SlpdBqXYXxkLNhezm5OLbkNnR0yZFtITrDX/FwVZnYyjageXi0tF3tu1Sj
         /2pzIa+AX1jcs+pAzvE2Fh3gKwS5zbOASimBfGtvaxdhNjmPACxOyoin44ZPqjOoMNBs
         EiPCfe66TiKFRAOUdKJDuWdVf8VaiVXCJlBhk4gt6dCkWYscyVEu4Xknr84c0WM7JTRY
         IQGzYqpkfzRSRsJOdOIbXmd8IlobJwwP/MRMsBXimo/xAnQrPr5CD5E5JfDqcZ4qOfxt
         +evQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751472846; x=1752077646;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0c/84mBXTtb1I5DJ3f//CNcOZAIu4pgnp07Yr6FAASE=;
        b=Ot5bNaT9um3WmcVxFTu2rkN8Jw5VvWlaJLwQttSjSIcERM1yBclRmwuMIutTQjyYV/
         XtTkk8SI+BZs80BRbOgojJrj2lYMFuHLbfHIWQvh/AHuofeflcF0chuAYL21uo9F85pA
         EYZhzz/lJISWJXJdmvDsoBlrcK/wcDvF1FxV2LBHhQB96qbLMDDvwK/miwnf0S2bHmhG
         o3JMyEZZCM848AFcWrAx6kDeP+54czCtzZScd8m3VAC1A64TW0p+x+69/HObBIwWPP0c
         bhcGJuVakshzbX30FaNvFJRBqA0FIAj4g7cH54tSrKm2/EyDXZxM8GXelWm+2gGjVJq+
         koWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjozXAB+8HMk2ToaBLhHrEAn35fLTswpajCDrZiMQ8cM+6xQpuaQ6P3VKpeLvPTwbbsHwsC3DLrFI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQpbp1dWa/zK3hqdy2ZeCGtEBxBk7iINgymuFETj4FzURTx35D
	D5o3yBq4hO/S/LlUXNddgBccVBIBgbzClEmrR5zRrkqas1Ht65upWxsP
X-Gm-Gg: ASbGncveCuVX8ErahJkGDcKuX8cKMT6BcNWSWylqhMlZY/Vu9sGXFcQO/xJzY5cxeX8
	rEOIfdL1CRCEw5n3AEImD7lHg3nmvQXNJVcLMSZCMOs6kUOFl/oUcVnEwbJHtwa4enQnKRcV34w
	2ROCCvnO05kNmgTXvYdpsaMWahEBnR0WEnh2YPa0Enw1Jc+mOjhDPcGOy6kt8cyaDNp9ysxE6py
	X5RrZgaD45gjJ3gNhq73+k9b09oSgNOpLoUYWF07+1QMRFyAs/g1n8Qvo6PPjEv6ILsRVejBZkX
	ev8Vz7uyBu9SA9loKbA4jICEFdxjWH5mEoUQXp+FDdNeGUcXePVCiX7BJTXay00ZJEbJ+pHgQVz
	wkIZYD3k=
X-Google-Smtp-Source: AGHT+IEVOoy1Wg3zr/ivZW5QJMDsut3/0p00VNy9N/gGgSjttY9YOrjPlh1fZzMAA62oF74U2z1nzQ==
X-Received: by 2002:a05:6a21:62c6:b0:220:82c7:309c with SMTP id adf61e73a8af0-222d7db195bmr6344370637.7.1751472845622;
        Wed, 02 Jul 2025 09:14:05 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c408:a02c:2fc6:2cad:e985:b61d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b35016ee1e0sm9385740a12.54.2025.07.02.09.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 09:14:05 -0700 (PDT)
From: Kevin Paul Reddy Janagari <kevinpaul468@gmail.com>
To: airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	corbet@lwn.net,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	kevinpaul468@gmail.com
Subject: [PATCH v3] workaround for Sphinx false positive preventing indexing
Date: Wed,  2 Jul 2025 21:43:37 +0530
Message-Id: <20250702161337.69943-1-kevinpaul468@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Functions drm_format_info, drm_modeset_lock, drm_ioctl_flags are not being
indexed in the documentation because there are structs with the same name
and sphinx is only indexing one of them, Added them to namespaces as a
workaround for suppressing the warnings and indexing the functions

This is a bug of Sphinx >=3.1, first reported by Mauro in September 2020
Link: https://github.com/sphinx-doc/sphinx/issues/8241
Open Pull Request
Link: https://github.com/sphinx-doc/sphinx/pull/8313

Signed-off-by: Kevin Paul Reddy Janagari <kevinpaul468@gmail.com>
---
 Documentation/gpu/drm-kms.rst  | 4 ++++
 Documentation/gpu/drm-uapi.rst | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
index abfe220764e1..b18a99869b6d 100644
--- a/Documentation/gpu/drm-kms.rst
+++ b/Documentation/gpu/drm-kms.rst
@@ -357,8 +357,10 @@ Format Functions Reference
 .. kernel-doc:: include/drm/drm_fourcc.h
    :internal:
 
+.. c:namespace-push:: gpu_drm
 .. kernel-doc:: drivers/gpu/drm/drm_fourcc.c
    :export:
+.. c:namespace-pop::
 
 .. _kms_dumb_buffer_objects:
 
@@ -473,8 +475,10 @@ KMS Locking
 .. kernel-doc:: include/drm/drm_modeset_lock.h
    :internal:
 
+.. c:namespace:: gpu_drm
 .. kernel-doc:: drivers/gpu/drm/drm_modeset_lock.c
    :export:
+.. c:namespace-pop::
 
 KMS Properties
 ==============
diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 69f72e71a96e..e9d7b7282a19 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -554,8 +554,10 @@ DRM specific patterns. Note that ENOTTY has the slightly unintuitive meaning of
 .. kernel-doc:: include/drm/drm_ioctl.h
    :internal:
 
+.. c:namespace-push:: gpu_drm
 .. kernel-doc:: drivers/gpu/drm/drm_ioctl.c
    :export:
+.. c:namespace-pop::
 
 .. kernel-doc:: drivers/gpu/drm/drm_ioc32.c
    :export:
-- 
2.39.5

