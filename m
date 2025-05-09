Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E36221293;
	Fri,  9 May 2025 06:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746773582; cv=none; b=IeATxfIzE0YF2tpoj1qrhXBFp5LfaXbXkbhASQha+H0OSM1be5iV4SPSfP4YzsmBh1DIwtPcMDU4F6pXpY6HlsraVGmSopSqgydEnj/nEIC6LxR3OsoSzX8AMWjxS3k+bfwOLmRCL7yajCAA+74bH8gyyRys9CsFSjihUUEil+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746773582; c=relaxed/simple;
	bh=N2JPicMZJ48nTjhPXP2aBy4vJsxIvWM1IuvmEwdncto=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f99apnRZdABsWV+ZFotoW4/EitfjJSWg4EuYijhdIZF67DfzXe0WE1GNPtEsdHect1BCpk1e8V9W2hwqS78i8yISf/PISKXsJvRCXAkdxwPw5dS/zTCIxJ+qRBHAtxoglFWocm9mKR9nvChPxgyDPcHRFfuoOQ8GKMxhMaWbaLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cEEc/DTt; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cEEc/DTt"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso10806445e9.0;
        Thu, 08 May 2025 23:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746773578; x=1747378378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vtStDkpT6pNDiic3cMI+Uakg3PJcpZiL4B68M7mfzz4=;
        b=cEEc/DTt0NZWKpFbqh1M0f/JgD8X2qHpWt7dbYIaBHOOJsaCcS/zlW74O0rOXwtRpt
         UiDPsRMvNUVd/JVQwqABx8n9C01yWdZAygo2DQ8aSLKu9ZvGhfFabhKjUAycMFPxrMoO
         Cv/I8JyFNET95f5irYDJh44MVEkpIOJ9Ng+AkCxH9VUFqeQ1tgWQUeOxdYX28oYe82Fz
         oYrVfqXwI6YZO38D3F1gRWoGg4YomDV/rJCXgFRyyC3DpJ6dlGh2/XqZCYp3ffcAV/wD
         xN7CWyzIybLFM52FMG263Q4GfmBeIF7+fQksrhoQBMySwQ2CFaOkoJqkEDvVVOr+8V0i
         rCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746773578; x=1747378378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vtStDkpT6pNDiic3cMI+Uakg3PJcpZiL4B68M7mfzz4=;
        b=X150O4YqPLH1ehOad6q88/cSh2IsvkMaNw+VCNIFXSvjA2gDmDtgNyrgetaLGYSYZO
         oQZ07VuS4qL2/SGaqNMTHSSbs0AM/heRn4CH7kEnKwGnNwN//E87aTUDfCeXo3m5TuKr
         blyYUk65kcpaNmyckCiVcQGcvfDrDBl9iVQ0DNzvAElnqyEVLSXiUhHFCjL5WOEE1MyM
         TRSPFIyrWMIAIzd9l+lHVTmwBrCJ1n/2+o4/bZFMZvkMPMZ/yDpWc7rnHBMP8Urefvi0
         735C/poV4QvB8VW4D3trHpMz+bckkHjKT155MrzL7u69AhWyDfVIfIXZ0TIEefpNrti6
         CeAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJbIR/LXeSSob4A6HZ1BejGoV47eMA6mJu7tt+gv27zCX/JyqzSeLfSOS03uN4ynqEDYeyLY/6/Frr@vger.kernel.org, AJvYcCVRoOS9eTX+fTCUmpeNjmsbhDzKENNFALHSJ/rOB+Of3TiEMdaneG8iAqEPA05mCnhLcW6DRvc16x82@vger.kernel.org, AJvYcCXW4T6DPMtrtSbW34aDoHt0cf1t65ZNVW/pRIok3SQTO9NAFAHL79/lgBBhQ38uDXhF26HH7+bTIg8DG585@vger.kernel.org
X-Gm-Message-State: AOJu0YxaCDeybqyR2UM98PXt901hAjNK9omrzu0En1/fWNRfEEA627uN
	zYS5wt+89Is8pLX1rzwD8Z7OxRzH4R65Hxn5yH4Xm7rhDES11W0LsQPi9vGl
X-Gm-Gg: ASbGnctBEXvdfDCzD2c/IZXKXc+hg5RW3D9ytCYjkfsl3gRlnj31kRGVfw1Qd5dnzgD
	ZHC9fZPaXFeD1s4xenAkuP4q1ymZHn/wGNuJIY62nIT5+5k0L5bcjAPZS1pHzshwGQu0Jr4BfN1
	3rPBatzylpX5mPUvDuD0R5jcwWFzIN8LD2bCfj6t+2/tGQxp8P007axw7e80W8WAjziKh6SW4WZ
	tjK00LcfxGwLI/YnMjktbHv4Ah1P5xlpd+QE34OhanjNysRhFm1bOf8LJfLb5pS+bm10LMjcB92
	H7Y6V5eX4OqVifuFhQMARk5+cl6WETKVQ8nP5F3B8V9tuFm8JXuS944NRReIYh5PLjWbUQFCtH7
	2
X-Google-Smtp-Source: AGHT+IH+lDwJzQJ52g2YzQjDD6Ljm0EDeMicZ/Qy53fT3bDPT7CtF2hR3CTDpU4k/VUa376kgkfukw==
X-Received: by 2002:a05:600c:4443:b0:43c:fd72:f028 with SMTP id 5b1f17b1804b1-442d6ddd612mr16731135e9.29.1746773578410;
        Thu, 08 May 2025 23:52:58 -0700 (PDT)
Received: from tempest2.110.lan (xt27dd.stansat.pl. [83.243.39.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67d5c2asm19276315e9.1.2025.05.08.23.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 23:52:58 -0700 (PDT)
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
Subject: [PATCH v2 0/5] hwmon: pmbus: Add support for MPM82504 and MPM3695 family
Date: Fri,  9 May 2025 08:51:04 +0200
Message-ID: <20250509065237.2392692-1-paweldembicki@gmail.com>
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
matching. It also introduces an optional "mps,vout-fb-divider-ratio-permille"
property to configure the VOUT_SCALE_LOOP PMBus register, which adjusts
reported output voltages depending on the external feedback divider.

Device tree bindings are updated accordingly.

Changes have been tested on hardware with device-tree based matching
using the MPM82504 and MPM3695-10.

Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>

Pawel Dembicki (5):
  hwmon: pmbus: mpq8785: Prepare driver for multiple device support
  hwmon: pmbus: mpq8785: Add support for MPM82504
  hwmon: pmbus: mpq8785: Add support for MPM3695 family
  hwmon: pmbus: mpq8785: Implement VOUT feedback resistor divider ratio
    configuration
  dt-bindings: hwmon: Add bindings for mpq8785 driver

 .../bindings/hwmon/pmbus/mps,mpq8785.yaml     | 88 ++++++++++++++++++
 .../devicetree/bindings/trivial-devices.yaml  |  2 -
 Documentation/hwmon/mpq8785.rst               | 27 ++++--
 drivers/hwmon/pmbus/mpq8785.c                 | 93 +++++++++++++++++--
 4 files changed, 194 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml

-- 
2.43.0

