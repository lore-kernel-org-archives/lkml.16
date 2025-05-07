Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BE52820AC
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 13:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746626078; cv=none; b=o0o2Y8YI5N2zqYIbbk+fXVrhS2jEcFcuZGhNPK/hnDjOr0S5Au+CsjI61E1hs5Q3QEkRXErv7UjYxJHIqoEkZ9F+86qJizfw/SaXz3t4FBJ8f+890T+Am6pj4UkkvdxrT9XWOZc1o9cPiwmo+uenNacPk4yiOuACg47OjEF1EJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746626078; c=relaxed/simple;
	bh=itAt5ZYEvM4Nq+DHO9tQKvflggHXi84k7N5HQprzLdI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=r6UDpfacYxErsgmZDHxzFjBA8dCOLH3S2oYUe2Ekdt4dygc7Nm1waNe4ijXwcRDF6IXBlVdUUGUz+FJ5tO/J1oGVCTKEs5oQ3AvElAk5JnMIz0rVGAc8jiivOuisjnTwb5AtNlcz3mlHX0sD6aP8ZiFNzI8YPfzLaVHJxBj3ugU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B0Zp/SH5; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B0Zp/SH5"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso4687960f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 06:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746626075; x=1747230875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ska3QXhckdX3yExfYXkXUCA/LUNKWcEWdZm2KwgYfJw=;
        b=B0Zp/SH5V3y6WEIItgsnZGcemdWtI7HRqR/fQUptcGRmEBPlFQBilLB7NQ4s21XgLO
         QEuLo5+AZDXuNmUcfpSGLHvv2z9RGhntaZKJioCExndWaOiKL6wxi571ZE1XpDT4zL+1
         8iJo8DCt+qI1VrHvPF/9tmv0fFjfYyr4zWOzAH/r/NJdvwmPUM+1rwVgnk0HZPhEj1Ge
         HBV3gQeSlPaGJux+69HySfb4AirP8v92MIsHcHtBm++LyoDByBxsFSnfS1X/+IEzSQ4A
         7+HSibJnfng+0LOSix/sHyqypaFZXJY6mwTA8K2bwEseTGXFhcJJQBZspzktJry6kqr1
         kkvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746626075; x=1747230875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ska3QXhckdX3yExfYXkXUCA/LUNKWcEWdZm2KwgYfJw=;
        b=P6xSK7a0IOBVhlwL6UNfxXivS+FCCIW1QdhD7uQbf3ZqfoZWrqgigkcGu8zn/li6sn
         nEoDrCrga2BcHPezWf1VqKtLodoyMIttkG2z1R7fIUq3Lgapf4JvNMWEsEL4DCSDPcft
         MYCfh+Ox9Y5pSssyNOqyRdlcazahSGKA1C0+vosILBQWzvFY3wLdGo+uHSde6u3ow3GX
         db/Nw1MSzJxAkWg+Uwdek+KWJsUW8oMXQx0vmV+G54nRkadFzljFsYHHd5TZxHz/E2jm
         WlZzyfwy3Y15mWEIlZOamzt65lSASCWtrucHd33cFHtKclehC5xRiVyoI4QNenzWQcZg
         khBA==
X-Forwarded-Encrypted: i=1; AJvYcCWLMzpsTkYy5AbWclCF9/MifXKknei8LR1EeDq0LpLL2l+RbMRECOKBP+3E4W3AXi2VVKC0sx78Z/bNPfs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8WxOUeCPEH9a5akwC5h2+GcQjj7VMUxz6MUIASW/egIly74ID
	n2VdBWa1S5XjC1YbGsM2MDdRny7yMnAlyvChI/lHXVBCjAbJl1hJ
X-Gm-Gg: ASbGnctGgaiDreHvwFkgH8Gnzw3Vk/S37ZegJUxnBR7YtjfGAw21HV02m9w1CYZF/XT
	ptCMwByZ3OwaVQ+tYIXTHgiQf55o5t8hC+bdqkOmJ6IdQ4QAKfuYboCDC2RKG+HLLzC9NbrWMTn
	NjLojp7ymBosHRx87XJfOXAjsPn4oljyCEggGX3Qngzr4CvUr5RcVsEnW92h/BASkfJJzrEabLB
	Ij7toJI6emYBnZPELlp+l8cRYUEgILTOLge1eJ53o1VNge9t2lWQPBTgM/AyHchK2xQa/12cKfO
	36SOCh5W7xNlLe9IjmJPbAccP19rMDecsxZul3EGtg==
X-Google-Smtp-Source: AGHT+IExbIFQjaVmp5loFH6GIiYgPa+YqsZli/oD2AgI0l1LNnu//2mp8pgD7S/LhBOcaNIASVqiUw==
X-Received: by 2002:a5d:64ab:0:b0:3a0:b6b7:d06b with SMTP id ffacd0b85a97d-3a0b6b7d327mr1662314f8f.28.1746626075202;
        Wed, 07 May 2025 06:54:35 -0700 (PDT)
Received: from fedora.. ([94.73.35.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32f1eesm1894295e9.9.2025.05.07.06.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 06:54:34 -0700 (PDT)
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
Subject: [PATCH v5 00/16] drm/vkms: Add configfs support
Date: Wed,  7 May 2025 15:54:15 +0200
Message-ID: <20250507135431.53907-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi everyone,

This series allow to configure one or more VKMS instances without having
to reload the driver using configfs.

The series is structured in 3 blocks:

  - Patches 1..11: Basic device configuration. For simplicity, I kept the
    available options as minimal as possible.

  - Patches 12 and 13: New option to skip the default device creation and to-do
    cleanup.

  - Patches 14, 15 and 16: Allow to hot-plug and unplug connectors. This is not
    part of the minimal set of options, but I included in this series so it can
    be used as a template/example of how new configurations can be added.

The process of configuring a VKMS device is documented in "vkms.rst".

Finally, the code is thoroughly tested by a collection of IGT tests [1].

Best wishes,
José Expósito

[1] https://lists.freedesktop.org/archives/igt-dev/2025-February/086071.html

Changes in v5:

  - Added Reviewed-by tags, thanks Louis!
  - Rebased on top of drm-misc-next
  - Link to v4: https://lore.kernel.org/dri-devel/20250407081425.6420-1-jose.exposito89@gmail.com/

Changes in v4:

  - Since Louis and I worked on this together, set him as the author of some of
    the patches and me as co-developed-by to reflect this joint effort.
  - Rebased on top of drm-misc-next
  - Link to v3: https://lore.kernel.org/all/20250307163353.5896-1-jose.exposito89@gmail.com/

Changes in v3:

  - Applied review comments by Louis Chauvet: (thanks!!)
    - Use scoped_guard() instead of guard(mutex)(...)
    - Fix a use-after-free error in the connector hot-plug code
  - Rebased on top of drm-misc-next
  - Link to v2: https://lore.kernel.org/all/20250225175936.7223-1-jose.exposito89@gmail.com/

Changes in v2:

  - Applied review comments by Louis Chauvet:
    - Use guard(mutex)(...) instead of lock/unlock
    - Return -EBUSY when trying to modify a enabled device
    - Move the connector hot-plug related patches to the end
  - Rebased on top of drm-misc-next
  - Link to v1: https://lore.kernel.org/dri-devel/20250218170808.9507-1-jose.exposito89@gmail.com/T/

José Expósito (6):
  drm/vkms: Expose device creation and destruction
  drm/vkms: Allow to configure the default device creation
  drm/vkms: Remove completed task from the TODO list
  drm/vkms: Allow to configure connector status
  drm/vkms: Allow to update the connector status
  drm/vkms: Allow to configure connector status via configfs

Louis Chauvet (10):
  drm/vkms: Add and remove VKMS instances via configfs
  drm/vkms: Allow to configure multiple planes via configfs
  drm/vkms: Allow to configure the plane type via configfs
  drm/vkms: Allow to configure multiple CRTCs via configfs
  drm/vkms: Allow to configure CRTC writeback support via configfs
  drm/vkms: Allow to attach planes and CRTCs via configfs
  drm/vkms: Allow to configure multiple encoders via configfs
  drm/vkms: Allow to attach encoders and CRTCs via configfs
  drm/vkms: Allow to configure multiple connectors via configfs
  drm/vkms: Allow to attach connectors and encoders via configfs

 Documentation/gpu/vkms.rst                    | 100 ++-
 drivers/gpu/drm/vkms/Kconfig                  |   1 +
 drivers/gpu/drm/vkms/Makefile                 |   3 +-
 drivers/gpu/drm/vkms/tests/vkms_config_test.c |  24 +
 drivers/gpu/drm/vkms/vkms_config.c            |   8 +-
 drivers/gpu/drm/vkms/vkms_config.h            |  26 +
 drivers/gpu/drm/vkms/vkms_configfs.c          | 833 ++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_configfs.h          |   8 +
 drivers/gpu/drm/vkms/vkms_connector.c         |  35 +
 drivers/gpu/drm/vkms/vkms_connector.h         |   9 +
 drivers/gpu/drm/vkms/vkms_drv.c               |  18 +-
 drivers/gpu/drm/vkms/vkms_drv.h               |  20 +
 12 files changed, 1072 insertions(+), 13 deletions(-)
 create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.h


base-commit: a6c0a91ccb257eaec2aee080df06863ce7601315
-- 
2.49.0

