Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58195477F;
	Sat, 10 May 2025 09:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746868847; cv=none; b=c1eZinrjz2KnrLe0C9+9QKi0xH2uu+KEyKDZKm3PoI9fvhjvi10kJmpN7oHtTroOs7rktBWrIj0T7ax2WxBbO6sG3GvwnQ5klNlOGYGCr64Nqza9lmYH3xwlhWAMFZP2ZaahQ6u/y4qqX3D4YMhSAfOrL0GD10LX2M3pFVSxt8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746868847; c=relaxed/simple;
	bh=vCF/5xuRbFnc41DDoRuqpdTT8j5kjjqRrKLNDXa+R7o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dX4RSz40vk/z3cTKqH0EyPRKcU37uDljBSabt6AFfZWXLGbDirFwp0UxEDElFFyq7ayf2SnkPnOCry64aJ/iUEsjZvbT8RBBiaSfxuj8uMWusPohSGByDyZ2WEuO4cC+ruCz5Tl5lP7+hjwewesMhh4KOdS7jAOBcPEJKaQl/og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EFqxC+yY; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EFqxC+yY"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso28521055e9.2;
        Sat, 10 May 2025 02:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746868844; x=1747473644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1ERk94FJo2I+nhqkg3uZ4mky2ZS0le31BrUmfDAtnQw=;
        b=EFqxC+yYV5ZOnt1/JG2cpb27wy1n4EblLoVzoP0F5RPjO8yCKSbKTh/M8fPytYoly/
         5KRiUsmB35aErXhuZWki7UV9wyOApa4Rqhyn5t2NT4B6UYqaNL9m2Hu77B/5bmyQmZiQ
         i4s9RXmr9kLZllt+8hZWMQh/JQqhkPMhPs9Px7x+bYJZgxWmLu7aya3O5+598JevzoVM
         WoNz5Q4FbtIcha9RC8fUKXK9xSfH26eJzDY0/6C+HM2zAdxG4NV1Vdwlhxjcl0nSlj9U
         ZCu8gLOKoEUX/aKuqJAvZilaf0QVXoNBcBfQZ4dT0X0v2eEOEL5ejvJ3U5MQ/qx7AXa9
         iCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746868844; x=1747473644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ERk94FJo2I+nhqkg3uZ4mky2ZS0le31BrUmfDAtnQw=;
        b=w2C4VahuenbHgo0xd2RhO5f0uVsM1/q7pAIZl69ttE2X8gge00g0NDdFjkhZrmohKP
         zLyZN2QsfhtlRVoHu1GuvR9KOMyhAlejp1eYJ+radS1dBUIeJk2l4yqffCIr5o+55JFm
         9rIcv3ZQBsaH0UGgzJtNDKQMIQAXcRZYs3thaiKRd6Tzy6pjsOQpITgjIpuyBcgwoQqC
         9HM53Orcxbd6kJXk59/FWBEL6YQeZu71dWF3Z9SKAbk04167R+KfOctSM7xT1GZaWMaG
         xfSDNVBL63c7vpY8jkrlReMGNA9kXeS4NdJ3b2sBiw6Uilb8ET3eEYyIxrbVCU8iHl4a
         t8hQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7rg9dL549jhZq4vtKzznDuGZ1Wy0JtK38VXMqfXH/NaMdcVg0SYn0cVW8JhruL7w2oK22XKbgCwpj@vger.kernel.org, AJvYcCU8vBAn5Fvhfl2Wxn7+2ijOV8dTVWeWJ9AS01QdaZg2dpiMrKhbf1bYrvAOUeN64CYKvnb+8LOtM7ugK1FG@vger.kernel.org, AJvYcCWo0GeYbCxOmevE1FhBxaLB6cZ4rCEPhnNxmoTyDwdFmAxhPjtWYLGFvBpo7XnvqS1d1i2Ur8m2MSOk@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0Wx1TlvFedRV3twgDCytMpX+LzOFFitLVlw+c9Z+PGkWHJXXN
	vlPXQxX09HpAJqutMerZJ3BX9OOBsgIHF04AXF4gpl2L5LZkztHEtGLUWVHd
X-Gm-Gg: ASbGncsPxDJtynDO7fzJUpacIremvaM3t7AME1H/lvSyXfkt2nIQAG3XDPxvLjiz6xb
	4u+3/BKHFdKgA2hFRDRfpfvIZjwXDR2Q9t9MaQZYMIjPk+KlGEp+E+9icOTmo0L6mrZNlV3yEYn
	H+EthyAa5jeueeyIGTOytX2Q5gjOlaHDy2AFAkWL8IV3r9cVf+pZXt++AGbsJxOSvy7yuEydgWM
	LUkMmSdj9ByPNXese5thHOv/xpo7dRVV9PAT0WxQHI7ZLdhkAU9t0ym8VeI78flID27A1+dQQBk
	XVnw8TSZeX5Eek7ho+jOqdGBgdwgzHnZWqd63Zj9MTO5HXxr1cKC1pf/DuMogh2xli504txm+q9
	+
X-Google-Smtp-Source: AGHT+IFGOLjcCMtVhz1MxaltaMoTEbTdcOOSuwUxitdQ3lnKbTU8OCemlylfzPjg0tJcpC/HYRB8Ww==
X-Received: by 2002:a05:600c:348a:b0:43d:fa59:be39 with SMTP id 5b1f17b1804b1-442d6ddf515mr51214805e9.33.1746868843500;
        Sat, 10 May 2025 02:20:43 -0700 (PDT)
Received: from tempest2.110.lan (xt27dd.stansat.pl. [83.243.39.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d687ae5asm55901985e9.36.2025.05.10.02.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 02:20:43 -0700 (PDT)
From: Pawel Dembicki <paweldembicki@gmail.com>
To: linux-hwmon@vger.kernel.org
Cc: Pawel Dembicki <paweldembicki@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Noah Wang <noahwang.wang@outlook.com>,
	Fabio Estevam <festevam@gmail.com>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	Michal Simek <michal.simek@amd.com>,
	Grant Peltier <grantpeltier93@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Shen Lichuan <shenlichuan@vivo.com>,
	Charles Hsu <ythsu0511@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 0/5] hwmon: pmbus: Add support for MPM82504 and MPM3695 family
Date: Sat, 10 May 2025 11:18:43 +0200
Message-ID: <20250510091937.2298256-1-paweldembicki@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series extends the hwmon PMBus driver for the MPS MPQ8785 to support
two additional Monolithic Power Systems devices: the MPM82504 and
MPM3695 family.

The driver is restructured to support multiple devices using device tree
matching. It also introduces an optional
"mps,vout-fb-divider-ratio-permille" property to configure the
VOUT_SCALE_LOOP PMBus register, which adjusts reported output voltages
depending on the external feedback divider.

Device tree bindings are updated accordingly.

Changes have been tested on hardware with device-tree based matching
using the MPM82504 and MPM3695-10.

Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>
Pawel Dembicki (5):
  dt-bindings: hwmon: Add bindings for mpq8785 driver
  hwmon: pmbus: mpq8785: Prepare driver for multiple device support
  hwmon: pmbus: mpq8785: Implement VOUT feedback resistor divider ratio
    configuration
  hwmon: pmbus: mpq8785: Add support for MPM82504
  hwmon: pmbus: mpq8785: Add support for MPM3695 family

 .../bindings/hwmon/pmbus/mps,mpq8785.yaml     | 74 +++++++++++++++
 .../devicetree/bindings/trivial-devices.yaml  |  2 -
 Documentation/hwmon/mpq8785.rst               | 27 ++++--
 drivers/hwmon/pmbus/mpq8785.c                 | 95 +++++++++++++++++--
 4 files changed, 182 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml

-- 
2.43.0

