Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC5F24DD1F
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 14:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749737191; cv=none; b=jD4R6oAjEoX6YWKADo+j0aJ09oZlofSbawWThYyetR1PePyma443IffvlUUmuzj9g3GtyjVFJyLqKPiksD0u0yXy6QCU4D6np5NPKl2Kv/DEAEV0RwcMillMorCB0N5iZt5gC0GQUz5dhR2ilkJs+UT8+WySp3OiIg/49SO1lfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749737191; c=relaxed/simple;
	bh=rjkese1ZifOLjoOrKAvw4hTS2D4WjBORKNmfBqXMWsE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fUoeuEi9bLnEacTFcxIrqalzaMGPxkg+jTaKQIKkIgG3Hd5iY5qrGIMe1xvGe2ZPn4OZ3eyt4HGMyyuDA0U+VlfU759qR1JZXWqTaYkl5OXp1qmaWPmuaT4JpaxxaeHq7TOVlv9Xz9E4UCGI3BkiN6eud1iRzjTZdZFSSqo8cfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=Hlq6wljc; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="Hlq6wljc"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-450cea01b9cso5148355e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 07:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1749737187; x=1750341987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ttsYPqiggEy9hPbgSqnq/DvaBZU+dCuBO6mxXYZ0sE4=;
        b=Hlq6wljcJ6qGxYyy8qqJ7T27Wz5r/+oi3FvsPwfox4DXiUrgN4KGwevQZqn+EzSyuM
         kchcNXC+/dPy3DYyzLvEBAUEgS1WFSuvunewCoOg+bZwe0h/bUuH4FAt2XR/PxnkCNY1
         1pdSBj4rDvHsoVq7f2QLkECDood6rsN7bTL0gJxMWa7w9cv08e4+FNidW0tLJBqwlEO/
         lIKybsQNYTtpEKj3sMeMvvpXQ1gZX20yyFAKDFVHNLt6thHllT1IiFnc6RG6fpw8D943
         NOZDwvSkdNYXd+aN1EBdYtLoLmtjoQnxlE2te2LJlZodFMPgKHKCHJYHF5MksGLmx9EZ
         Wn9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749737187; x=1750341987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ttsYPqiggEy9hPbgSqnq/DvaBZU+dCuBO6mxXYZ0sE4=;
        b=hvHLSjNhyhIceGsYlCAzKWx6v5Mk/dZ8AVi5aq2bPHHIK7Cjafl24iPbnap1yJ6ajE
         9AVJyw+BqkT0XoWS/SCZvwkqP9dfpK9Ec3cYlUKRL0SZzQGZ/Ejg70U8oelzIMgbB1St
         MMLHQMYW+1N00T0gfSUDSWjsT9FEJ3CcPW5Cm7lc26VlLW9Hrfgrm62/MrMOegZoSiqq
         IhZo2WFswMuWEulB6DYw8QRkhAzRQQwut5MoGGdUC+5pSxTs7PXHVoLx3P3u7YvB+JEI
         kXyICs5kPlVL5cQ6X6gthVE0RrvspMJqeL3QY77t5+SXoEP8RmZ+U4glz6TfEaZSdwdx
         FZKg==
X-Forwarded-Encrypted: i=1; AJvYcCXpkUxIOZSHyGmFJCkEXiOa2Qaxg2cQaDuBBGxji8cceOu6s5msFlvx0vcsZQO3Ez8UbqHPk1Tw16xHUJo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5b22zYeGpWvMw9z+KqPZ/fJsS90KCjMdUzmX6DZgdzsQrur6q
	/yEJCDfk6EZkQnY+qXrSBwwqmy2oRBShnZrw4qaX3nsK3wj2E3c1Ie2E/u1JJgydyw==
X-Gm-Gg: ASbGncvJqQTaLNCxd5BgOkypirrcssm3UOCCkMFdkoicZ19tnc2x32RWQUXmvEz/vHt
	CRtRU/nP8B9t61nVhMkn2X0Fndbl7nJ4jkNjdHUokP1DOD4va2YgDL9JtPj7g9EWVFWGCZB8pxh
	VEoik/XsmS9s1c5Qb8LCiq9t9MWU9htakfWD7VPXhziXFvCLB/AcIbcqY63mUhofhjInqRQ6ezm
	qbt6dNLD/0ittCHa9DSb9jmLBC3d9gEBIapp5tjd9gNaoAlgOFRGMjk7MYKDjqEk1jy/ozoqG/F
	3r2ciwKuZLW1fBgUoC/ckTKFL7yawbuggIaZ78ku3OrSJFtYUiyQQufpdymVVKczNNxRgkn5nPT
	SZbT5FMzTUEEtvAkT2BrPBwh5I8gyyAvN9u2CqjbP4GeUgUty9NzfMF4XoisxFw==
X-Google-Smtp-Source: AGHT+IFkxe9opO3CgJBFTe03L1s40IzIr7bjzHIvjRy+8Hv/btGAmTqGwq7/h6IW7bgm5G5nDxRvrA==
X-Received: by 2002:a05:6000:401e:b0:3a5:2ec5:35a3 with SMTP id ffacd0b85a97d-3a5607e161amr3093935f8f.45.1749737186805;
        Thu, 12 Jun 2025 07:06:26 -0700 (PDT)
Received: from cyber-t14sg4.sec.9e.network (ip-078-094-000-050.um19.pools.vodafone-ip.de. [78.94.0.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561a3ce6bsm2078875f8f.49.2025.06.12.07.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 07:06:26 -0700 (PDT)
From: Michal Gorlas <michal.gorlas@9elements.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>
Cc: marcello.bauer@9elements.com,
	Michal Gorlas <michal.gorlas@9elements.com>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] firmware: coreboot: Support for System Management Interrupt (SMI) handling in coreboot payload (MM payload concept)
Date: Thu, 12 Jun 2025 16:05:47 +0200
Message-ID: <cover.1749734094.git.michal.gorlas@9elements.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This patchset adds support for MM payload when Linux is used as
coreboot's payload. The main idea is to delegate higher-level SMM
functions to the payload, limiting the coreboot's System Management
Mode (SMM) related responsibilities to the minimum of basic SMM setup [1]. This is 
done by loading a blob with SMI handler to the shared buffer, from 
which it is copied to SMRAM [2].

The MM payload is still in a Proof of Concept stage, and we are still 
working on getting the patches needed for coreboot upstreamed, but I would
appreciate any feedback that you may have.

Thanks,
Michal

[1]: https://github.com/9elements/LinuxBootSMM/wiki/Proposed-design#current-design-approach---mm-payload
[2]: https://github.com/9elements/LinuxBootSMM/wiki/Proof-of-Concept-(PoC)

Michal Gorlas (3):
  firmware: coreboot: support for parsing SMM related informations from
    coreboot tables
  firmware: coreboot: loader for Linux-owned SMI handler
  firmware: coreboot: Linux-owned SMI handler to be loaded by coreboot

 drivers/firmware/google/Kconfig               |  12 +
 drivers/firmware/google/Makefile              |  12 +
 drivers/firmware/google/coreboot_table.h      |  34 +-
 drivers/firmware/google/mm_blob.S             |  20 +
 drivers/firmware/google/mm_handler/Makefile   |  51 ++
 .../firmware/google/mm_handler/handler.lds.S  |  46 ++
 .../firmware/google/mm_handler/mm_handler.S   | 510 ++++++++++++++++++
 .../firmware/google/mm_handler/mm_handler.h   |  21 +
 .../firmware/google/mm_handler/mm_header.S    |  19 +
 drivers/firmware/google/mm_info.c             |  63 +++
 drivers/firmware/google/mm_loader.c           | 186 +++++++
 drivers/firmware/google/mm_payload.h          |  58 ++
 12 files changed, 1020 insertions(+), 12 deletions(-)
 create mode 100644 drivers/firmware/google/mm_blob.S
 create mode 100644 drivers/firmware/google/mm_handler/Makefile
 create mode 100644 drivers/firmware/google/mm_handler/handler.lds.S
 create mode 100644 drivers/firmware/google/mm_handler/mm_handler.S
 create mode 100644 drivers/firmware/google/mm_handler/mm_handler.h
 create mode 100644 drivers/firmware/google/mm_handler/mm_header.S
 create mode 100644 drivers/firmware/google/mm_info.c
 create mode 100644 drivers/firmware/google/mm_loader.c
 create mode 100644 drivers/firmware/google/mm_payload.h

-- 
2.49.0

