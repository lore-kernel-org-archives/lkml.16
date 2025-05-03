Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662CA3C465;
	Sat,  3 May 2025 09:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746265655; cv=none; b=otFVH2/ycggftllW3Vz2D4847XjJ1nlsnEIGst+ohA7WSq8u1zU6P4epRD9QYkxUdoUVGkGPAa1VHgb/Bfv8xtcmMEEGl6ISa27e53eO4tOnoaJz9NsqbdDImOvAoFh2oDcRPxBPvKGkxXtB15DRJNkOoWqh9l3hFmalnFFob70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746265655; c=relaxed/simple;
	bh=17N1YMbN/G0IDY3P2q5sUHU05NldRrC0TzWm5uuJ4vA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rSpIedBCh6hbTOoUOSd0YZHDj1r5F28/OqKYLGdUg3LSROCxkIwf1LjoZ9EPO5UJHkLDotT7F0++gXwowmcdpFIbt5H4+Xbm05HE0CxSP92L43TlB5bEa74Nyf3ykB2xJZY+kLKcNDxvQ2FzaoKx9AZxe+m4jODbgHHNK7/HaQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XMm/c16w; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XMm/c16w"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac6e8cf9132so517519566b.2;
        Sat, 03 May 2025 02:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746265651; x=1746870451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9I+WuMxG+yM19m/Xo/oViiJ4PvSxtCjT+rihYnJXMW4=;
        b=XMm/c16wOtNweSLYQ5+/joQs+sfaFOpdYP746537iXkPPKetN/kH6iDOVcJJiciDnP
         AXW7Mq5Zd1BtrBFwWgspId8xtY/ZgrzkhlLUhH1RMcEgxWPWIOEL3Xxljf7GmeKXdhyH
         Ax7ezsaYbSFdtErv9aku/lFLQd4HZOchNHnhl6S2Vgy+cbT7XcwyNS8l5iTAJHkXXSWE
         QkUMgQH2+YqS6vmPvmOJcprkAMtf8NH/9txk5iJiQwOuJ0z8NWPIqtTIjVX9AJu12q+k
         0e06oHR7MF8FNXVyWXfjbV6JbfWtx6aEgxunpg7sGtWg/USEsZ8s6EuqDGjmVN4UURd8
         JSsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746265651; x=1746870451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9I+WuMxG+yM19m/Xo/oViiJ4PvSxtCjT+rihYnJXMW4=;
        b=rTlfbGyYJbpAbfQrdsev4NzkECNna0pQZ27/ODqnp4p+CfofHQRcPnp4GjSrW+awsr
         KOrOhA/kO4nM+Bz8LRzEOzsjfwpxSyKJ75eiz6BD2X3v+fCvMwv9U6saTIs0DCoAxlkH
         lTPGRQ+FNILhwDOu9hHOJkGySpY2amZcBs0MCP+RCkSUU4Fcp/iFGXcbc9ck3FoF6Aod
         +7VmnMC6VPTX5DbjlfiUBLhIGTxro7yeevZKIrjXLXnQcEF6VqY3GtjffQuL7v0ZTFO/
         dODO9H9mWvzwJkBr1oQ73+dp4O02HKmUjer2E3Htd/PMnCTg6ZxyAMfpErwBf5cM8SRZ
         7iBA==
X-Forwarded-Encrypted: i=1; AJvYcCV00gBqbioNfMNjOY2M2IBc2D+ZhHDClffGwzoIrkexSxdDxY42Gzfp0Pr5+rnoi3/WNWkjEJ2GJh2T9IxG@vger.kernel.org, AJvYcCWURa0jvCVCmQjOvMUcPRdPjhKhzo/oh7r1QIGHu3gZX8wbgJ541NYdq/7/xPP7dnnk2LgMov+fy8FB@vger.kernel.org
X-Gm-Message-State: AOJu0YwiW6WRZ5yCG43WIgEN/O8fqOU1/38GA2M2UmDvZzb5qV/szAJx
	z7/0GIYre97rSm4OhiClKpPmWqrIhzraiuYUMlYMbbyCrUIa05OA
X-Gm-Gg: ASbGncuRh/uBBXGenjjRHaW/ZwIcl1NDsU/A7zChfzx/irPNWpQ9rvVQ/Tbe1JCbtZW
	Vy2cYi3rH6WvYPZjUuqJFEhOsATE5Zrxwv3ZY794bsKp1vUZprX7IsPU4LwWgoe8rf+YGxVNI+u
	5MXsjj5IECBWFD8NNSUTn4h7Vq2IHiV4DIv4mNwkZHcic8v4PVshvF9ndAo6xNtu4SodNF7tPgQ
	l28GUL3aB3+0fHHCZyLdrKV5ZXSiuCfH+HfGllsND6A/qeRkdioq6WqL/4znOFJSkm+GEANd6g8
	xOgVoE/77QmY3I8qgTefc1l5IlXhQwwV
X-Google-Smtp-Source: AGHT+IEob68icKGhCLKpOzZkwnmbURPV97UnwtKQJjFLj2dXSi0jDN7gPZJwVDO+ZP5fftTLN++1gg==
X-Received: by 2002:a17:907:6ea2:b0:acb:6eb9:b488 with SMTP id a640c23a62f3a-ad17b832445mr579628966b.41.1746265651496;
        Sat, 03 May 2025 02:47:31 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad188ea7f41sm174732066b.0.2025.05.03.02.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 02:47:31 -0700 (PDT)
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
Subject: [PATCH v4 0/2] drm: bridge: add ssd2825 RGB/DSI bridge support
Date: Sat,  3 May 2025 12:47:18 +0300
Message-ID: <20250503094721.29572-1-clamor95@gmail.com>
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
 drivers/gpu/drm/bridge/ssd2825.c              | 813 ++++++++++++++++++
 4 files changed, 968 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/solomon,ssd2825.yaml
 create mode 100644 drivers/gpu/drm/bridge/ssd2825.c

-- 
2.48.1

