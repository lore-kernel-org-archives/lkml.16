Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9303155A59
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 08:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744013677; cv=none; b=VyHDVp0uEIBc1mW8YaKgvB92nByN+4cu9kCXrGmSqJc7GLPXoWUHBbfnS9dG6kH/+MM1dYcjCLwNNbxnOqvasxAIhqjN3zDElL+SP+It9Ae8ZI88YOhCqIbUM6e6eLBcOppGRbP5qwvkEsASQHtWDD9QVsVQR6CgFnnKsBOhwx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744013677; c=relaxed/simple;
	bh=5YPa3/jcT7PaDKnKZDD3og9FdRutn2dw5tqdcZtwF8I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=W0HybYH8h+dCKi3aQwqbkPGa6Uk+61e/f6/eWb2pZZyV0adbl/nbgjuGCiA4kR8XvYHKJe5XbFIXGjjKwK/0AztH5lNSQxTx/q/KuaMvFTHcag492kUDOa+2twlOzNmoLKcE6FOi9X4z8q/oryF2UfT7F8Gc/OIogV4rpzC4yRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fFxiihFY; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fFxiihFY"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so24871285e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 01:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744013674; x=1744618474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Pf8NUjGnqVGatUmapm3BD+8BU/EOLUkc9mjZQ1ZC7o=;
        b=fFxiihFYgjzVcLFpnbx9woHzACGSWq5QTLcemeHEfSAa0M5I6gW3sx6HGg79T/wl0x
         gHY9HJn3Ozj5D93mKtvDsFcIWQ4oJ+8Kz7JUEqwIB/AdrBzX/nUMP9FvUYQmgIpnSdcr
         Jy2I6NJMOG6G6ICSPcdW/KvU4gl72PmHAfYWEaDABqaE6lDnRC/WYG0Db3Q4q84fWFN/
         X8MBODkUCXAoEa/et0iYaF50DWUi5bcntmwWrxJ3KXP9bB+FCEMFBdQBYhcS0IQAhnF/
         BcURgyxo8j2hn8orTOTVQxgzN8Pjg+0jTydUpbpZ5e9g9Nu2JQTd2NMEDwJEHw2IYFEi
         AUIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744013674; x=1744618474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Pf8NUjGnqVGatUmapm3BD+8BU/EOLUkc9mjZQ1ZC7o=;
        b=LGGIRYf6qb1bMzBdCOMr9EHUdtpC5h9BJM2CPEVOZhycnms1q/ZdTYKf+aENtIxgwl
         SHWXXkb124jwVNp0PiM/wwtTs5S91Li3Wla3CU9kl9BZG3T8fBS3E480Zkfn1s4w1f6X
         m9xphZW7u8Qyrj/e0wP5FG6Kyj/zb7UPHypsq+2XzClqRq4idI7uFYFbAgVl4BYWJaNb
         83GTlYz0OnBaSke173KTM7r2scPc4Ry0ak6Dh1koz3Hysg3nKxA4bdMOhqmT2skSNu2y
         eRH7ExxLjWhbBtp2rbtBYR6zHSC082cDqM6B/noLqFv1Sbl6i68oelOx7yucWPIPTzB2
         Wd2w==
X-Forwarded-Encrypted: i=1; AJvYcCUUh5TSD0+nSLiMb42Wkwrv3dywXuF5sfc//6/ZKQI2GY8FSZjBuhiLjb8xj+sbU3mcuYCnlqvJjKijobk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqFihfi2BJx7tmxuWmIBynxr5osrbXk0o/NDT61ZXllOsjyBe6
	Z1SUEMbhPDfnxUIOYPw5rq6GT00LS96e7Onu4a5GKaPLa80Ah9py
X-Gm-Gg: ASbGncszHiyy9ZjqkucJFGBQTpOn3PFRg5c98aFPLtcyNRZiPnPe2/luc5AnmqQsq1q
	rzudEHtAt2e5qJTL+V56REXX+HRlFWSHeO475yA+7C3VqNvq3e9C+vnhaoHZ9U1XgOL/8FbQxwL
	cx2RlhAiecuNSxQKbXxFXxaZCfCJI3s3sV8mZ4eLsLO8qtVOmxBkXa/i78Zcz9XpSRYlW0OjBNK
	5nnMTeS6LpjznCxDN2cfHLgQgkBSivwquexQI+Mzu8/LzQhtAN5n2vibSRit+96XKjcqRRSYwJo
	pX30e5O0Y+zd+YtcZDskoTor/XT9zapZQWnqYlwRhWIRl6IviOjT43o=
X-Google-Smtp-Source: AGHT+IFz2xl2mGOrFkHw5DfgJ09rmaMGfWiocFIlbYVszkx7ym+0QWe5dbfXxa9cPr8TQ61gM8fWjQ==
X-Received: by 2002:a05:600c:3587:b0:439:8490:d1e5 with SMTP id 5b1f17b1804b1-43ebee8dc60mr129865255e9.4.1744013673994;
        Mon, 07 Apr 2025 01:14:33 -0700 (PDT)
Received: from fedora.. ([94.73.34.87])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec16a3aefsm125473445e9.21.2025.04.07.01.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 01:14:33 -0700 (PDT)
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
Subject: [PATCH v4 00/16] drm/vkms: Add configfs support
Date: Mon,  7 Apr 2025 10:14:09 +0200
Message-ID: <20250407081425.6420-1-jose.exposito89@gmail.com>
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


base-commit: dd717762761807452ca25634652e180a80349cd8
-- 
2.48.1

