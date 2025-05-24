Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F286919D880
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 18:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748112796; cv=none; b=BlQBiFQ851n0d2u8u3sq0ESJz5bIqNseoOZa+WhqoajUWALnMUWr4bjm5rhHLnpqscJ7rdDynEVRqWXl8dwH3bxiO6J65fU79reZdJMx40oDyyDcJ7wzBByhV7tNS99N/IKPXxdpqIRneTetpgo82dG61WhwXuR1sVZlvHdjmWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748112796; c=relaxed/simple;
	bh=HocmR5sbq7EZCJ1kDDXQu3OSGvlDlIReoSFAC0t0UA8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=prDC2dIS/8/AqfQFLijQrlwg6MaAemkxI1aywJXmt2bYFc1Q8V6eVOLo7glV4RXF9QvPX8fwbU0V7m+CVnIuWmfheW0cm/BYa9FrRUD/TrvOE8EzJcBxsLkBxosdR0mVZo4POYopwjRT20uGTh1lXpNuhFAIQ9ls8BPsqCj7wjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YOG2VtLr; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YOG2VtLr"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-74019695377so659366b3a.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 11:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748112793; x=1748717593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ENV0GZc8pO3b3z0Hxm/yl9U58RTAOYD7uCyKalGX8M4=;
        b=YOG2VtLrv9uW3bpxhHy9uiiPMTu1JCP7q9VSGbbyJ47NcIbOSWr9S9WO8N0EPYNpLW
         ZdyJex/qxLUlMLfn9aYsNXe0S+4CCecadWLAdQrQNSGB9dKoOY8Ca910VU93A+UXdOE4
         2OTgLvsvT8/Y/EC5e69l2y1r7icYRK/Oa/QACKqG3Ztf0AMjE64okstDQ4j8Y3/ezkW8
         fCI2dN9sCtZUQ6eGcVZvffZR7Guku3bvBGFU2gvEMzgTbjD3Ods2/mR3xX8AWNmu25GO
         g+h2kvOjQWeo9bbpW7eru9Stky+/tPJVtQsX3Pk/1juo0M0zLxkIwKHEabLmKTnyxDZu
         Ew4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748112793; x=1748717593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ENV0GZc8pO3b3z0Hxm/yl9U58RTAOYD7uCyKalGX8M4=;
        b=gdseO5RC/Oofad9+8AU+aPL30aw3WPMjZkY3h2syYu0SI/OzK0JuRkv3u1K7Twk30K
         H/VWKhOiR76lNnY81TPgGEWcF88ELADLt2yepvid0UJ9dlQfLHkulNytyPHeDJ1dSUfz
         p1kNOd0mhZCm3CS99rZd0mOh5IPHehLKwyYCU76u8c7xVRAmtVfNoIIZwcFYH7DnA696
         G4c7Iluh2htMWbA12XAmGS1tsGRAl25pVKuUlmVO72/+yIeaAziPLLuHIbE1dKE1q0Ci
         UCQJiGMBlP4wkV4thC89ZMzXVXJx9GKnWQmcwtb0vsy/aH3NeWn1yCdtf/SFTcPGRI3+
         6e5w==
X-Forwarded-Encrypted: i=1; AJvYcCUkbHms7JUqqgkPtITmBTtdSU+vX1oy5ECg0FRVCGHJkgQU3MU+bXCUPWLyaJpwaOFbZdUHg4ScG7Aav5Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr6H8E160CL7c5G0y5avqNazsE5LLxZ4Irn3b55lfyfcpkuLu+
	hgOtc2oHcnPGoUNTYSoHv8B3X1Fvmy+8E293fKTdTNFAclJYgmp+TDtLHwuBE3IoeqO60CJ+h6F
	AU9k=
X-Gm-Gg: ASbGncsH8mTCGLNOLB3KuuKL7A1O+Iw+VVIExAWXkVWst7ie71UdEtiJwJ3ULqJ7l2G
	tGp7AfoViUob+QGwNxax7MX2du+QEmLcJ5fmwEsLqx8i+X775lU08AY/a0cTyxFx6tnMHaQOfrn
	azgfeWB7M0EvKwrrBnx8GrQWsTbpMcWqSJ3iYdwdSdvSda5qrbtC72otRFCVmO17MG1BLbMs9O4
	BgUBcQGHXvqA2q0ce14zUGyfNIAwd3hOkLGFYFzpWFWOtOljO6lBbSP/WBI6A1qaG2EZqpzJ0sH
	0RSKzdRNlK+1vVyPKOGV/EQ30vOoYwpDNBe56JECJjtDr0l2iBcDoUYozp1x+JIw
X-Google-Smtp-Source: AGHT+IGFar6sjxj18FKhtOHuDHKr3HTcfefMkgzVX+tcC4McjNSW4CY/RCO4SgrMLDuLMvzLBwBeeA==
X-Received: by 2002:a05:6a20:3d8c:b0:1f6:6539:e026 with SMTP id adf61e73a8af0-2188c267d37mr5899768637.15.1748112793165;
        Sat, 24 May 2025 11:53:13 -0700 (PDT)
Received: from thinkpad.. ([120.56.192.43])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb0a906bsm14532931a12.71.2025.05.24.11.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 11:53:12 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kw@linux.com
Cc: linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cassel@kernel.org,
	wilfred.mallawa@wdc.com,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/2] PCI: Slot reset fixes
Date: Sun, 25 May 2025 00:23:02 +0530
Message-ID: <20250524185304.26698-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series fixes the issues reported for the slot reset feature merged for
v6.16.

This series is on top of dw-rockchip branch where the slot reset patches are
merged. The patches in this series can be squashed into the respective commits
since they are not merged into mainline.

- Mani

Manivannan Sadhasivam (2):
  PCI: Save and restore root port config space in
    pcibios_reset_secondary_bus()
  PCI: Rename host_bridge::reset_slot() to
    host_bridge::reset_root_port()

 drivers/pci/controller/dwc/pcie-dw-rockchip.c |  8 ++++----
 drivers/pci/controller/dwc/pcie-qcom.c        |  8 ++++----
 drivers/pci/controller/pci-host-common.c      | 20 +++++++++----------
 drivers/pci/pci.c                             | 15 +++++++++++---
 include/linux/pci.h                           |  2 +-
 5 files changed, 31 insertions(+), 22 deletions(-)

-- 
2.43.0

