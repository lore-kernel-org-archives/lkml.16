Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325EF276058
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 22:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748644844; cv=none; b=pdwo5RCEbbkamHTPD30VAaM1rYFwSwDkiFcv+HwQAvi2kgzgtRmOYgjMsQ/7JEE4+O+iQThQuH+OVqIHVPdYZRZ1RkbZ9u2uxh7Bt0nfN+UyHVHKyHyNI53ucBYWquYia8FejjqTvQEVcX0R1qGl8QdOcKIG87C0frJ8KlNG0L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748644844; c=relaxed/simple;
	bh=v9IOZt9qHGKgp78Ef+68zRxwUDTcYE0bI2uCER1pMZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qXT4uBtyQoC1OT4ePq+yEcNAOywzeOYpZmXgwNs+c8/JJkvMiXhfGTQs14Rc8ghBfl40cEbsGwqtR8yELbXPieQ8gccEEeSnfjseZRKRQACXTptgyGTXAJGyN8FHQK1LWko3x/4Np929JOoy3eXaMXCjQP2MoR+vWHevflSBGSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=L2F9PIFq; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="L2F9PIFq"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2351ffb669cso18604285ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 15:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1748644841; x=1749249641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m1drmllmtmwtWNasJJpvTqgcFCz1TJ/ySV8IFsfDlfk=;
        b=L2F9PIFqDmX7zjxhYLVjMP3i0DnXLzT/sNR7sg3aftg1OFCL2VBrAVAwqwOgv+D1TE
         k243xCvis+Bs8c8Ne2dWEeg8oU3Rj9lbNGfd4EVDGnsWtYjzHhVgnG+IBfX33TUfeUBu
         arbGrGmi2cZV/gv2uLK/JzU8WRc0GyEEWqZlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748644841; x=1749249641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m1drmllmtmwtWNasJJpvTqgcFCz1TJ/ySV8IFsfDlfk=;
        b=L7ZwkH0rntOgNz56I1Gj4DHnzXQvzL1EzuUt9nouINlag/Aiya1S3sfn4QbkWA2VVa
         6J7v48UbX/tOLk++mOkXiCWGmhotMvf0yb2o/FXvmRuYzEXI5+hH5dqw5kWTs2BKKezO
         lYk6+Vk/5GjIUqtuIP6gqlKFowRsT75WPRW5aIjkfa85rqr4yq+V7D2YKuIjIWMm8bUq
         DJuw01Jgch5SXJs3YukZwVnJlgQNxmCTwDzjuFTmKm7HmeyADef/ChAa4yioRcPb49u8
         DvIYRhGldKOGgiGvc/iyGCGMXrCZEveHLO0HJOIsM4VHrzVrheXlNYfJ+accpASK+v7c
         dRMw==
X-Forwarded-Encrypted: i=1; AJvYcCV6NSseXiNqMxbPc8ONPpPN0ZZo5LZcwRZw7ZfrHukOx6mTDLoGlGwP2/OTSpXR5YG07re6/8v4JI3dClw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSMZc8dvhjFB/0op4DGLCZvdV/Cfh92suHvspQIUnq4pJuuQe4
	WnzZEsI3cXen9qCIaf75XRYQTR9cqqxkUVhbzZUpaNNCtqjwdOCTp1aFR6dVNnlvRw==
X-Gm-Gg: ASbGnct3DxQmifVXf8exVL110qsganVnSdE/JwLawcfScC0mfsqz9pguONUrVXFjNqt
	z18OGPGkfet5fPTd15kMM2E0zk7yNvZplQOCuzFOla1ZpT5Z8jwWs0490jouNEqarMaOEp5c5nK
	anvf36+FY9rV88YbpyqdwmXZOw+pabm/aj9cUN5ybYi+a0BIO5qzdswfl72ObU+jS6hRgZYL+ZL
	BIWMUUQFIU3h/vZxWAnnMeCbdtPaEGe05ItRwwmKuubyciTACSLHq4hLVrG7yFvjVAiU23hByqD
	8mQolx3zFormv6hROnMxEIhkluDens8dMwDj9CMzjM0zWReKQs3jI3GKdU+2zmaX+eywnqjnPSp
	MTAB5J+nL3EwQSio8RVLoaYbd5L4kDyc=
X-Google-Smtp-Source: AGHT+IEjX5DIunGuGQempttaCvqzE5hKj7Lhn61f4N914bLVvv2ywe+jCdSk6DPyHm6F+JX3bD1s6A==
X-Received: by 2002:a17:903:b0e:b0:234:eadc:c0b4 with SMTP id d9443c01a7336-2352a08997fmr77984725ad.44.1748644841428;
        Fri, 30 May 2025 15:40:41 -0700 (PDT)
Received: from stbsrv-and-02.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf523esm33109385ad.170.2025.05.30.15.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 15:40:40 -0700 (PDT)
From: Jim Quinlan <james.quinlan@broadcom.com>
To: linux-pci@vger.kernel.org,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	bcm-kernel-feedback-list@broadcom.com,
	jim2101024@gmail.com,
	james.quinlan@broadcom.com
Cc: Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE)
Subject: [PATCH 0/2] PCI: brcmstb: Use "num-lanes" DT property if present
Date: Fri, 30 May 2025 18:40:31 -0400
Message-ID: <20250530224035.41886-1-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v2:
  -- DT bindings: Add default, maximum values for 'num-lanes' (Rob)
  -- Add 'if' clause to clamp maximum requested num-lanes


v1: original

Jim Quinlan (2):
  dt-bindings: PCI: brcm,stb-pcie: Add num-lanes property
  PCI: brcmstb: Use "num-lanes" DT property if present

 .../bindings/pci/brcm,stb-pcie.yaml           |  4 +++
 drivers/pci/controller/pcie-brcmstb.c         | 26 ++++++++++++++++++-
 2 files changed, 29 insertions(+), 1 deletion(-)


base-commit: 01f95500a162fca88cefab9ed64ceded5afabc12
-- 
2.43.0

