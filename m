Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF602F2E;
	Sun, 11 May 2025 03:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746935833; cv=none; b=eHlzfk17nToZC/16FZwz8euktsQcNM4vsmHnVQFp6mYYAxqsxOGeltasFcDM9otSg1wAyvFLSM0kCGEzGR4IpymomP6Mc3ZSwH9l47GsH7/0kqwyVhhXfxqEYFyo6+UB1HA1uv9yZM4lKBy7Ad9XPGpkBz/kl1iv/CWalgZu8XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746935833; c=relaxed/simple;
	bh=BFWDG7x7PxyrK87vVrq1U1GU7n1/sZ65EzhbnGNGff0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ioTNCncnUrdQRqOesBkLKDkQbIVdTuaH2wstJyKEChQoZXJBRJJuF/IBEzvX16/+84GyyrnNAXAhFLlhvtOA9S5ikK8aSXp/7JrCBiNi+cF7mUwK6ec7VZ4So4XcNLY8vC7dJm0sJKDiOjn3/fDU0qK9DJCy9I1mBE+yDCkxiTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L/wFz/RD; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L/wFz/RD"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so24492235e9.1;
        Sat, 10 May 2025 20:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746935828; x=1747540628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SHEFdiF6nfDH2zTUJn06c/V9fo7ZCyft1hJ7/VuJE3I=;
        b=L/wFz/RDaDZr/u+TLu1KebCkF2FfJEGxpdSdsKNvmn9lokEmxJfgJ94GFGKpPbLi5J
         5r4Ytjmedjw/dV9hzEqAmrpesrUwD7DQIr5uC2jMQqsb7OmWUVbDyJ578cpcFg+8/Isk
         IjugUbHcFBjPi+oRIXDe3fKXX5B02cYgNOjpgTgMNNO+Thpstx9B2ffjln5OdBsGZazI
         UWd0DDsvBDglmlByGYjdLB72Svux8ToPPnqI6NiIw6KH4X6v21xZdtWvvgDuIYDZBvHx
         GuIhL5GbXPRWP4ron7GCTB7Q0FCRv7ZR0CVgs0nvc1bk1yJWcGxM9hCrWqedj3KI4DFe
         Qx/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746935828; x=1747540628;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SHEFdiF6nfDH2zTUJn06c/V9fo7ZCyft1hJ7/VuJE3I=;
        b=CQZJtSXL78o0uSeQ2z1IcWEezInEBpZogkudPA2nz5Ck0YTQE9rrqogXbjtOZ+5Ll5
         34YuobpyI+tUvcK96cxT6SU++809CNR0YVDjk7M66cgd+7rMxUiDFavo1Jp0IdOCAqew
         tv+AS9t2UY2hq3ZWVzDOOakwuztKvFsY4//MJfeCkWV8Tc1RJoeAjUAUr3Mul7yJVWnq
         tYPevOTafo6VbD+o/8zJ4+ooZh9jkiOJnaV81Ejy1dXSsZIegtbH5Hjv2e5J0ANnaJJ5
         XZI81xZrRkxmHRuIL7SOxqKxo9FC3LaqFiBuZjwpvjojBbLOHPSt5unayHUdY4G8XzK3
         QwRA==
X-Forwarded-Encrypted: i=1; AJvYcCURh6q3hzOikR6snK2HivVUDXeCpKHonFthQaDzpKIMIc0grPHruBuM738j9LvqQdHXQc/pKUUa1eVO@vger.kernel.org, AJvYcCV9XIl3uEbAf4aVwa/yXZQM0991UtTBUSc4mhPgreBs/rrizdja/EcDCON6VbhBpLF3oVAqoBFyZ6iMpmSd@vger.kernel.org, AJvYcCWVarnoZtzK3pGCKK1GAQXTxKQCHo7Y+a9lFpKxL9ZUCQg0Z3yelHgcX7vVI95coTnPI/DPUaVCvoRx@vger.kernel.org
X-Gm-Message-State: AOJu0YywonlYR027rm3PSO1cmzOk7FYUwIYHWLix4a3jDGbbX80mcKkm
	tqgE4/UQdZ1jeV7DgqypJFNioI/ItcBHE5DIctKYzO9Ebe+C2sCbkpSYim21
X-Gm-Gg: ASbGncsFar6/XiB7jhBEpt5d57zVdmbQizl6+O+lZoSWhnO9nm8EBSgQzC4VRe4kbWE
	z/wPdd1QOmYTFZTfftHw+UZlSxJNbXCV+v2nxhDuv8ZcG9Eri5xUnTjNbUDpdx0YmBmcq92BGU3
	GrT/zZHnnq5OTfkhrNrcBnYHDvBqhh+eavi0xN9ohcWeOVVpSSH4euYu1W6Stgt97DfQTvRKvqI
	8VOlfx1LDyLvxeOzm+ox8+1UoSR+sq6HK6jry5x2JljTX9HyfRALRAfdLlTVccoysMjYO402Sdr
	aDzey+4keUbR+esz1TSC5SVlocx8LGJFXQh7bsscw2xsIcQJseVLOQZ/hkgB8dWXEf/ffcJEZuo
	3
X-Google-Smtp-Source: AGHT+IG0HTz6bxAK+xcJs42AI1myp6Y5c6S5+NDyZdHDXX1hxf3FhP1qJKA43nP75LRB1FiCiMkAAQ==
X-Received: by 2002:a05:6000:402a:b0:3a0:a19f:2f47 with SMTP id ffacd0b85a97d-3a1f6487fa9mr7029885f8f.42.1746935827811;
        Sat, 10 May 2025 20:57:07 -0700 (PDT)
Received: from tempest2.110.lan (xt27dd.stansat.pl. [83.243.39.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4c76dsm8163963f8f.92.2025.05.10.20.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 20:57:07 -0700 (PDT)
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
	Naresh Solanki <naresh.solanki@9elements.com>,
	Fabio Estevam <festevam@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	Grant Peltier <grantpeltier93@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Shen Lichuan <shenlichuan@vivo.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Charles Hsu <ythsu0511@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v4 0/5] hwmon: pmbus: Add support for MPM82504 and MPM3695 family
Date: Sun, 11 May 2025 05:55:43 +0200
Message-ID: <20250511035701.2607947-1-paweldembicki@gmail.com>
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
 drivers/hwmon/pmbus/mpq8785.c                 | 91 +++++++++++++++++--
 4 files changed, 178 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml

-- 
2.43.0

