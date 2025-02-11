Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A01770807
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 11:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739272159; cv=none; b=uwwAGrD02HE51d3HNaE/yjO5hkmxCCL0w+vfhKmVPxj9uoY6MIOQXS6cZYG7in+dct+iML7eqsRkqHNQVzgtsNG53ND4bVGc12AIVjXaaF28mKcXtJwK1Tb4eDUet2EbHV+JItSmfM9BIljmll0vM9ItFwZwyMSK4IlAVc/E/Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739272159; c=relaxed/simple;
	bh=jOQUxWT3nNOTCEozgGGMycJTkju8Tm/0bhH2HvC9zGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RKla/xFucYshA/lkslUBK+4z2R0rpIugYtAmdSZVW+FPjfYmm8fvaAxP5CtkY8bR1H89/itvslclspREeb0jB9hnsv7fobF9U3TxBA5Xss4VojKOdW/x76fsrOuYPFOP5f+ERmo4nFJhVUrJqc1f2mnxLAASNlZFK4yGvXPFBJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iA29LR53; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iA29LR53"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-439473da55aso11896755e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 03:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739272156; x=1739876956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L7gqXwFpCNctPSEOM96giwgtciAwtvgEJKRMz2rTR+E=;
        b=iA29LR534vJN6k4n43ti+rOukECgx2qtMDIKvQdgDhxHep728hbzuK+IHcEyj/NI6K
         FRVCA6sv2IRdywuhlFENvWjr2VLcDDcWEyV5IgXSnsUiFmE5LoDl2FelceXN1xec5mQk
         PNzjrsOfpbIGGRL53WsTcub/H20HlQ0GRFtFAyha/JXgIxXvmjjO3onUmaDGv+y+In92
         nfr5A6ZUj7/0WqPZb23lCZ7vsQVd6chq8ovQAluqO7FR0bGUE3pFFBmmaLTOVf/+mgtT
         V/VXs14/CzsLRdoh+xDz0Adr/WTkFv8mLpiY2DE2er6L3cUXed/ZkklPsXGaRfJElqaR
         Aw9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739272156; x=1739876956;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L7gqXwFpCNctPSEOM96giwgtciAwtvgEJKRMz2rTR+E=;
        b=GkCI3eTNq7q3saevbsBN6sH8eXqarSaVK399lpffn92cFZ3/l5p4dcNa0MDLPCYvV3
         0dy6beVhU0J4oQFx6S8tq1/03w5sESVJcJKukb6P2CEvp7sgrgXjR97dT+k7j+UjRkWb
         zVKjkpjfK6CsDSbAWbeqi4qSYK0P/td5fmrGNZj+8P9a8bTfOe8fCXyHQ6LkJBFyO+U2
         Om8j+qns+iOS9Hh47rQZ0MiZTvd0ej5mmMM3XXne6m7HdbDJtw9f1QJaLypWMvxZz2dr
         YOrnwlO1d5xZ9x9coXhTxiEM1fIHBk+sQIrQpgJTNDCiTwHrJIFkzicmVuD4nAlhiK1l
         8gZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOba1slRnmXbiCTJs+WAsVq6uthDUD8/9UrXcuFa/XzB35yCGG2ohYHfQZHdKZMY4r9fJ9Xl62+KoX0k8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxfjnc8bMJJmnFzSNEW3Br7UYayRf5NRTOCSpMXxbd4LstcNQLB
	B/rvPTRvAdvuMYAAMJvHN5uZbwxwBb5WoywrpInYyb+zUxHCLMMC
X-Gm-Gg: ASbGncs+a+6aXl35nbxF1Syfc4miA7CN/DjNiyJvqYdkyJjfTnofgxOjKKzj69HNu48
	6VcvaC6OfMVuy1kgqXioiXsiYf0FILsSQ0cw4utN9QZG+jl30NFVnA0tR162E9f9Ezh13TNMPZC
	mVdZ6B1RLVhLKNlcG43xPMajJvyY0v2afskC4X63XvdgH2p0w86Cg37s4FgcazWIEm66ffsSGxX
	ZdIs6jgFv9MHWIyUV6GxIK7/4bmPI+xLhKAVrBI8Swg+anwlPlU4+g4+lWhdBiQ5TNvCqQV4urQ
	SGUIFStZTXkVCXdr
X-Google-Smtp-Source: AGHT+IGxj+LY906+b+jBD9ED1pIzZ4XZPBrIxsZ3vcLaKH41Lg/0iLIs28BLCjkeSbAulKYs+0wHfQ==
X-Received: by 2002:a05:600c:458e:b0:434:9f81:76d5 with SMTP id 5b1f17b1804b1-439249abc43mr133180365e9.22.1739272156190;
        Tue, 11 Feb 2025 03:09:16 -0800 (PST)
Received: from fedora.. ([94.73.37.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dcb55b7a5sm11814417f8f.14.2025.02.11.03.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 03:09:15 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com,
	simona@ffwll.ch,
	melissa.srw@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v2 00/15] drm/vkms: Allow to configure device
Date: Tue, 11 Feb 2025 12:08:57 +0100
Message-ID: <20250211110912.15409-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi everyone,

In preparation for ConfigFS support, a flexible way to configure VKMS device(s)
is required.
This series adds the required APIs to create a configuration, the code changes
required to apply it and KUnit test validating the changes.

Louis Chauvet and I are working on ConfigFS support. In this series I tried to
merge his changes [1] with mine [2].
I kept his Signed-off-by to reflect that, even if I show up as the author of
some/most of the patches, this was a joint effort.

I'll send the the ConfigFS code [3] and its IGT tests [4] code this or next week.
Meanwhile, the IGT tests also exercise this series and can be used for additional
test coverage.

Best wishes,
José Expósito

[1] https://patchwork.kernel.org/project/dri-devel/cover/20250121-google-remove-crtc-index-from-parameter-v3-0-cac00a3c3544@bootlin.com/
[2] https://patchwork.kernel.org/project/dri-devel/cover/20240813105134.17439-1-jose.exposito89@gmail.com/
[3] https://github.com/JoseExposito/linux/commits/patch-vkms-configfs/
[4] https://gitlab.freedesktop.org/jexposit/igt-gpu-tools/-/commits/vkms-configfs

Changes in v2:

  - Applied review comments by Louis Chauvet (thanks!!):
    - Added Co-developped-by tags where required
    - Split the first patch in 2: vkms_connector.h/c creation and struct
      vkms_connector creation
    - Fixes a user after free/double free bug. The bug is already present
      in drm-misc-next and the fix could be merged independently
    - Implemented for_each macros for the config
    - Other naming fixes
  - Link to v1: https://lore.kernel.org/all/20250129110059.12199-1-jose.exposito89@gmail.com/

José Expósito (14):
  drm/vkms: Fix use after free and double free on init error
  drm/vkms: Extract vkms_connector header
  drm/vkms: Create vkms_connector struct
  drm/vkms: Add KUnit test scaffolding
  drm/vkms: Extract vkms_config header
  drm/vkms: Move default_config creation to its own function
  drm/vkms: Set device name from vkms_config
  drm/vkms: Allow to configure multiple planes
  drm/vkms: Allow to configure multiple CRTCs
  drm/vkms: Allow to attach planes and CRTCs
  drm/vkms: Allow to configure multiple encoders
  drm/vkms: Allow to attach encoders and CRTCs
  drm/vkms: Allow to configure multiple connectors
  drm/vkms: Allow to attach connectors and encoders

Louis Chauvet (1):
  drm/vkms: Add a validation function for VKMS configuration

 .clang-format                                 |   7 +
 drivers/gpu/drm/vkms/Kconfig                  |  15 +
 drivers/gpu/drm/vkms/Makefile                 |   5 +-
 drivers/gpu/drm/vkms/tests/.kunitconfig       |   4 +
 drivers/gpu/drm/vkms/tests/Makefile           |   3 +
 drivers/gpu/drm/vkms/tests/vkms_config_test.c | 826 ++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.c            | 606 +++++++++++++
 drivers/gpu/drm/vkms/vkms_config.h            | 429 +++++++++
 drivers/gpu/drm/vkms/vkms_connector.c         |  61 ++
 drivers/gpu/drm/vkms/vkms_connector.h         |  26 +
 drivers/gpu/drm/vkms/vkms_drv.c               |  60 +-
 drivers/gpu/drm/vkms/vkms_drv.h               |  19 +-
 drivers/gpu/drm/vkms/vkms_output.c            | 176 ++--
 13 files changed, 2089 insertions(+), 148 deletions(-)
 create mode 100644 drivers/gpu/drm/vkms/tests/.kunitconfig
 create mode 100644 drivers/gpu/drm/vkms/tests/Makefile
 create mode 100644 drivers/gpu/drm/vkms/tests/vkms_config_test.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_config.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_config.h
 create mode 100644 drivers/gpu/drm/vkms/vkms_connector.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_connector.h

-- 
2.48.1

