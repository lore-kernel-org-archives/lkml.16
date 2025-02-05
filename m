Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A91D1FF7BF
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 19:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738782775; cv=none; b=Jd2Yxi+re9FIKwdFas7fAcyqKtk3NSq22+k/WVv4iQCIyLtIVu7GFRyMi8Pw7kPwx6scEzcDnaBafH3niHnTcknSkgw99n1xd0Y+g9JVLMc+TwDO0U6cRJa3n+wiEMPlYthCVTA0DnuwdTZ2CZj2+7JV1wMk++q0xszAOukJLKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738782775; c=relaxed/simple;
	bh=ZOMqMG5fUMiH/uGKPF/PKnAEFx6wMoFRNCk+yrSLd9M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jzZ40Kg79WN57DWT03htd0bv3QsM9prjlRLHv4m8YoHlfJg8aIiv40ArVgIyGNO59XKuXjOAUlWFLkokUQYfyNBxUUyWMBC/Dre7/bv6mcQrRfBraRXTDTUTXgcZ+XWezH/0fJ/ELpDtBfUxjmJ0OFNTU2VKYFkX6JkVr2vBS1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Q2B3qDs9; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Q2B3qDs9"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2f9d17ac130so49322a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 11:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1738782773; x=1739387573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K3SR5rYqhar5HSluEhYKtptLhpVhd2aXLVfmSOkbzz8=;
        b=Q2B3qDs9YbasaDDvbk0Yld858jgx7htxqMAVtRiUDIKwK1QVw6otrZsHlBhc9J+rNh
         WNB5p9BEv5HzEM60aEYVivS5s/XTN1x+uURQIrG/ZPh6HWWFzHDYnH/9jGnbjC8dOrnf
         f8nqxXP4AMppcyU+cwUM3HFKWyRurGP5FFMM4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738782773; x=1739387573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K3SR5rYqhar5HSluEhYKtptLhpVhd2aXLVfmSOkbzz8=;
        b=cPF/3TCb793EeuY0TJ3cP9Si73RZq4imYYgDLIQL18+cLCugoucB7FVMzA70XjmgEH
         J2QHDlg3Xz312SFyxjzvmgDA5/NMOy6RXXvwo+bPA4vf/RLjJYmeKGKekAG/zIVRwgck
         U01Zyo+DRP+LMTGtRlNXcvBmlE10yeZ411p1EKcKW6a0gt3SLB3Vj5uxyqrC33OAkkS8
         9EuzILxX1u63LDfAJqozP8HwvJJaU7XhY9yS/mm16HNXHekJSFzeu7efz84vDEvi9Myq
         Fkt7W8MP/HYqDIaULwiJANqd+Nl+74Jdf+Zslo0cZOG/d3GSon1zyFM5HXbO8E8y8oI5
         YNzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBAg5dLYe6NFYj5p4tUhJt71t4ZkCUw0OU/OWDQwLSfQ8fNM/50+rs9+W2UplLYBhhO4UKjmbeZFoILBY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSjqbyhKWAVCr7k3i+enFjqa4zn/xU1r5paJJ4ugUrQfNpK6M9
	ODAnNNJKj3aAgAUcqgHR2gd6y+ZWJ6lhA6BSZiRMpRI2G3FadIXXGfAGipI6Ew==
X-Gm-Gg: ASbGncu+LNdMZHo3UxUtTmfEQQ5InkQFvxEAED4yAsuIWe2KoKcHRI+pv+dRBBRfOG3
	oZnYoYufRv+xL/iC/l7jIzbbz4g28dkEvuLU/oz9LnGPA7SkUffELSQhjgo8cfDBuVKK0cJHT6e
	4M5gQYIVbE9YmH8hY+jAtUnVQOwYs9fk2nEDgzcCWxND6qO18xEY4U1l+/xq5BeRe7Brm+aU23f
	qzbOTl23Y4CuNWmrl05biFzaTUajlPrNLG1zT6kgePaFF3CVfttZWT18k0Tqs7SNC1tDQRoejru
	q49EPqSlfW6lMs65xZSaoHti2OuS+LUVHgsu1Ufu50Tjv/QfLOGqcJb8Vc9Mz8wU8S32src=
X-Google-Smtp-Source: AGHT+IGXI/zeQKWdy9WGXNP0IFCmaXexbux+MNSbbXKXHNOnb9/pDSTNXOi7k9q65haUFvvYkJLYBA==
X-Received: by 2002:a05:6a00:9095:b0:72a:8f07:2bf2 with SMTP id d2e1a72fcca58-73035117eabmr6665165b3a.9.1738782743623;
        Wed, 05 Feb 2025 11:12:23 -0800 (PST)
Received: from stbsrv-and-02.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69ceb1csm12670842b3a.151.2025.02.05.11.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 11:12:23 -0800 (PST)
From: Jim Quinlan <james.quinlan@broadcom.com>
To: linux-pci@vger.kernel.org,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Cyril Brulebois <kibi@debian.org>,
	Stanimir Varbanov <svarbanov@suse.de>,
	bcm-kernel-feedback-list@broadcom.com,
	jim2101024@gmail.com,
	james.quinlan@broadcom.com
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE)
Subject: [PATCH v1 0/6] PCI: brcmstb: Misc small tweaks and fixes
Date: Wed,  5 Feb 2025 14:12:00 -0500
Message-ID: <20250205191213.29202-1-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Six small fixes and improvements for the driver.  This may be applied
before or after Stan's V5 [1] on pci-next (they should not conflict).

[1] https://lore.kernel.org/linux-pci/20250127113251.b2tqacoalcjrtcap@localhost.localdomain/T/#rfe31466507e3e540ad681278924e0ae4e0b8a727

Jim Quinlan (6):
  PCI: brcmstb: Refactor max speed limit functionality
  PCI: brcmstb: Fix error path upon call of regulator_bulk_get()
  PCI: brcmstb: Fix potential premature regluator disabling
  PCI: brcmstb: Use same constant table for config space access
  PCI: brcmstb: Make two changes in MDIO register fields
  PCI: brcmstb: Cast an int variable to an irq_hw_number_t

 drivers/pci/controller/pcie-brcmstb.c | 41 ++++++++++++++-------------
 1 file changed, 22 insertions(+), 19 deletions(-)


base-commit: 647d69605c70368d54fc012fce8a43e8e5955b04
prerequisite-patch-id: 17728ad3425bcbd72e06271f2537a5aeec9ec0f2
prerequisite-patch-id: fab98130bbf5ffc881704b02153e387aa4a08e87
prerequisite-patch-id: 0d2d8d02821ca742aed46f16e9ed60db2ead359d
prerequisite-patch-id: 8cddbbc69bd26c0284784d29f5abcc30db1c8327
prerequisite-patch-id: b5d9165e3627079a44c08faaa306c17ef735fc9f
prerequisite-patch-id: 95858e79f69b693a7955cf12549ff1ce8df27699
prerequisite-patch-id: cc66e7df1fc7acef4ce10f99033a39359b6d57ab
prerequisite-patch-id: af00ddbf164acf1742020616d8c0f05cbd5c1fa0
prerequisite-patch-id: e37b800216e856a32ec7e7231d5191f17026ebc9
prerequisite-patch-id: edeed902cf9a962e3431132dacbd95781b1cf970
prerequisite-patch-id: da4f731901ffc44f2f1a3e69c1c35213d531fcae
-- 
2.43.0

