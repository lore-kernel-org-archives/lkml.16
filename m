Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F031F09A1;
	Mon, 26 May 2025 11:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748259866; cv=none; b=ZDGgYlaWqgy0pcZOYlqE6Ot87o7OL8Qnu/6dhqwuDOjHe+AS7dpYW/Zln1V4lWppV4jkvGqo6p09XQ6s/Ny4ItKAR02h6No72IX5RXE+KNkM2DtJBoGckoiKsIWVEAtif2G5wqhTnAImleC+eMdfCFhNtiMXkiosJas+AIJGnwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748259866; c=relaxed/simple;
	bh=UbXGIfiPR5kfYlJIk/TBOAQZKPAS/pho9YQIdNowK+U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uAgOBoHS0jfTdJu7x+kehqghed4/+nSo4MUKyovYnkARiSfhSvefYIp3p9mS0iIxEjGOFis5d0L1taGJemMeKBR9wUgUixrn9ubOkgRoS1GXgFXJlYUKZtT4X6lIVaMxfl1iiYlze223eesbynOeSQqz2nnD7M/SXepz3g8CsXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GHSUrC1F; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GHSUrC1F"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6020ff8d51dso3258375a12.2;
        Mon, 26 May 2025 04:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748259863; x=1748864663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EAIaiM17e9vEsXi6JQZ3zU1G6+zswjSGbk11YUFfR5E=;
        b=GHSUrC1F/7Rs6iOWgvvuNAgG6MxSMOo5/48xDIKLZybKgPBDuN4btZFYVc7FqC/kAK
         SSYXPbAU3Esu8Vqvx/hsaV1POeXi0gSyGRFR5k3AHgHMZKxQTlxouKw2wb43bEw16iYN
         7d2Dp8gBtKPdXxmvSQN+OGjyhl2UuJ6sxpccWVd0T+mrZ9vz3z6sk0Yv9ZRhpgCo0ZAW
         02xlQfuFpJIIspmJGF5Qer4tVDVES0TWreh9Z4LawE7+P7mDTdsEdcQRsNdLsQyv+Jwv
         Cow2ay+44scBIj9hcOELkZWbLP+mHuijS1ld2WIcm0czwGiCcW2lCq5OhQkYSPgC3M57
         LGow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748259863; x=1748864663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EAIaiM17e9vEsXi6JQZ3zU1G6+zswjSGbk11YUFfR5E=;
        b=mCRIg7z+hfNp7fgNQd+qwYpQFlCIvRtJoFRQkEmelwSbKFKmXTBr9RKn6Ow8Lj0c9o
         p5rtM0TbYZw81vhclEGrLQ7B4avUAGO4HdIca2C91O6K/EI6iX9BP8gT9t58OKaC0fS7
         92T24ByAIuq6n0YpUsCWV2plygHNW0Isdw8keokkSTbz3UTLCvSyPWn1ifX17AMjDn/4
         OPG1eiuPEHtXS60VQ/qflJ0HAoqo3XKsIhAf+VHtrHgDHe/wrD7Ii+ZeXpWxoX9zLSej
         a4WSSvjXgQPpkRY9LWr0QSSSzAjICGCFl5E2i817wl5REXy7K645N62O5yDSvhddESBv
         mZzA==
X-Forwarded-Encrypted: i=1; AJvYcCUz/UgkUrvdEv2TSarqpipNjc/PPPSCdhKYGiNtlSsFR+7+KJr4s4tchKJBByh9rAvWyCjqD3ERg3otYZmb@vger.kernel.org, AJvYcCX9qp6ehBacMkRBCFTTzLEg12AXQoOH7RLUzs/1WyGnHS7SYN/MxAH0q2SlOpkChWkUYoFE0eO1d20x@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7jPX0/QCK+IMfW2b+u6bISMeZoiSd9xFQoRbymP5P/VmpkvSl
	iCrzkXeW6V3dX9qUtSfy2knJhFf11yg0ig36NOXrvU+0mPRby4poRcnF
X-Gm-Gg: ASbGncvNtixge9spe7lQes9kxDITBP0PxSrfmy9KOwuZWmkqp+u0u94NlqTz3IkmIG+
	OPIFaL2bCAJlNRETYgUE0YA2FbUZ33Kl99zx0ygMXoCcNtbFH2SV9igOI0IKKK8wRbINYKS+8CA
	B1yWAD6IAG0FZ9sNr3dK4iWZyzdpJLoOGAWoUBbiUZxKeihLszDrlKgWeDL9dr5iWvV0c25LC+6
	kIBKhcINSCEYBwbMPtXZrzBFH76D4w35ALhn1bq/Zzs+KDFkApEhjsRx/OBX6m6xwearxfPIgjS
	6DZtnuZY5eZJv/BAATCsYfv4SdwBYOKIRhpGHzFst5o=
X-Google-Smtp-Source: AGHT+IFeDKj2wwKjk7FZaDOe+mf9EF9EwY6Pnj5HmbLPqahaPtLmowD8Q0xEX/SgcvIJNbpNPRuTqg==
X-Received: by 2002:a05:6402:2789:b0:5fb:f31a:df83 with SMTP id 4fb4d7f45d1cf-602d8e4e90dmr7578503a12.3.1748259863301;
        Mon, 26 May 2025 04:44:23 -0700 (PDT)
Received: from xeon.. ([188.163.112.65])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6004d4f1be3sm16270716a12.5.2025.05.26.04.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 04:44:22 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/2] drm: bridge: add ssd2825 RGB/DSI bridge support
Date: Mon, 26 May 2025 14:43:51 +0300
Message-ID: <20250526114353.12081-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Solomon SSD2825 is a RGB to MIPI DSI bridge used in LG Optimus 4D P880
and LG Optimus Vu P895

---
Changes on switching from v5 to v6:
- set correct module name in Kconfig help
- return error if spi sync failed for reading

Changes on switching from v4 to v5:
- rebased on top of drm-misc-next with adjustments to fit

Changes on switching from v3 to v4:
- no changes, resend

Changes on switching from v2 to v3:
- added mutex guard
- configuration register flags parametrized using panel flags
- removed unneded debug messages
- removed unimplemented modes checks
- added check for maximum pixel row length
- use types header
- remove ssd2825_to_ns
- shift bridge setup into atomic pre-enable
- cleaned default values of hzd and hpd

Changes on switching from v1 to v2:
- added description for clock
- removed clock-names
- added boundries for hs-zero-delay-ns and hs-prep-delay-ns
- added mutex lock for host transfers
- converted to atomic ops
- get drm_display_mode mode with atomic helpers
- parameterized INTERFACE_CTRL_REG_6 configuration
- added video mode validation and fixup
- removed clock name
- switched to devm_regulator_bulk_get_const
- added default timings
---

Svyatoslav Ryhel (2):
  dt-bindings: display: bridge: Document Solomon SSD2825
  drm: bridge: Add support for Solomon SSD2825 RGB/DSI bridge

 .../display/bridge/solomon,ssd2825.yaml       | 141 +++
 drivers/gpu/drm/bridge/Kconfig                |  13 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/ssd2825.c              | 814 ++++++++++++++++++
 4 files changed, 969 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/solomon,ssd2825.yaml
 create mode 100644 drivers/gpu/drm/bridge/ssd2825.c

-- 
2.48.1

