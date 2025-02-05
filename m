Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD0F214239
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 19:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738782779; cv=none; b=gbtUNetfIWLVidXQvbirplQRKtZe0RfcKeedGO8T6AjdLsW8HkZ/bi3Z0D860BTRE8nsJuJDDTcFUKzBAZO5yiVXcXhlX4+VzmcZvKQiZ6BouahQC5XJnwuxDEc1AID6LwmfFPpSfbqMH3JyEzfNYufXDPlQfJts0FQGER8q4ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738782779; c=relaxed/simple;
	bh=emQr1WRfTCyFVdLp/d2GBD9ikd08vqQkCZbU50KHAFI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gb5PmV7vAD1NQShP3n0hGlCRDKD2Rv8f4svZey2XVr6kNWUx/SiGZMy6m6ojPke2eVrYFLK6kKqd0qhrH6psEurrR6MZhLrd9OfedhJhDSj97J9+hnJNk8K5WsBDcngAotWbO0xytfsTIcO5oaDAM+KmrwgQEnassDLJMN4ZQo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=HSv45CGI; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="HSv45CGI"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2f9cb23d22cso64503a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 11:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1738782777; x=1739387577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FyxoQmP+DrPfyNDFU6zDEUm+WeVsHxsrhuRbOaUfCms=;
        b=HSv45CGI4Ea/sVTKiWPO4a1fFgb16sYlmeXa3im+0zas5xWxvtSsIpSzxB7MBVaf67
         LPOSeq14W5qHUVwsa1s9iM4Iin+3NCCmoqr//zfjNLs9tjbZskgxmplAMV/wMKFgRG/7
         1CkuMMK+foScvUgPApFlcgGxZ8wRQn82P4+bE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738782777; x=1739387577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FyxoQmP+DrPfyNDFU6zDEUm+WeVsHxsrhuRbOaUfCms=;
        b=ENM5lZveGEgchAAKyH9v+EPgySWuBX4Zb4HiKEnZONuKOvF5UXyZR5rz5KvZBB9RJs
         PaAuwrZQRKaeYb16JtCn5hxUoJzsTbCS72ZhUtYGQv/91MqVX0ofWmG+T5vZ2LaWDcqA
         p9s15OO0qj1IrAGSK3YC64b95KNTIfygDJjK7RYeWWlbi6qbbw0f47pVJyxvaM/DpNy8
         wbGjdhodlpLE6eZl6wi/iJyQ1DSmkrcDYAQL/bsAlKRkriNi27iK/oi87dMB4hK5U8LJ
         0khhqwiqdQGPxqWFnIbraYmBtwAcwLDR9ewS+7oPL5ShyZEbso0dIxokMRJA17A6+Ktm
         vWEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZNLcmU3wl3jinbi35+yFjo6bJ1qN07Yl4ZcT3/lCOzJ0OgEGCbYRrGP4v6wxCwubWifRLgjUxM3o0XcY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm/dr8WyQza+kSKeS0E2ddXhkzf/+qXzeooR8GWNPQNIBZDlX2
	wqphce78tb4U6sfqV5Fqz2Haq4xUbVxSgUsObaxoxwdSZqwO8Xa9xJN/GP/0Ag==
X-Gm-Gg: ASbGnctsOuX/k633xx0tF5cV9K6hPpViAYIZK4xj1gXHtzkISl3MwxMROcyBPoFB90z
	GDJPB52iGsA11I0Io11B408FzaQY7gtPUsw5j8kZIplJOAnxt8tZiX96kNGSp3Jd2cRYzfgjLeb
	q2PasfZ3fW8USdzdO0eF+e4ouqtW6EIo9yAjmiz3ws0RHW1YvyNROToAzwMTQKYB9fW0VGAVP/K
	t/Lahk+nkl3JMNDGVLsqXtCcnpcSDb5QHotP2IBvXfiD7MeSj7SOItMliu6dLXK8yVbNJigTlTg
	MdfM6ticku5lLEyL0ykwd28iEXM4QhKwwe/8Jep1gcdeGU6ic6VK4ihpQTxS6RlPFSaZkC0=
X-Google-Smtp-Source: AGHT+IGu6hun4FwjJUr/ASi5VtU1r7KzOWGkU1swFqWYgTtfTk7Rzk7GNGUnU+ZBJXjxJW+oGt6ZSw==
X-Received: by 2002:a05:6a00:3002:b0:725:b201:2362 with SMTP id d2e1a72fcca58-7303511e562mr5701360b3a.11.1738782746930;
        Wed, 05 Feb 2025 11:12:26 -0800 (PST)
Received: from stbsrv-and-02.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69ceb1csm12670842b3a.151.2025.02.05.11.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 11:12:26 -0800 (PST)
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
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v1 1/6] PCI: brcmstb: Refactor max speed limit functionality
Date: Wed,  5 Feb 2025 14:12:01 -0500
Message-ID: <20250205191213.29202-2-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205191213.29202-1-james.quinlan@broadcom.com>
References: <20250205191213.29202-1-james.quinlan@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make changes to the code that limits the PCIe max speed.

(1) Do the changes before link-up, not after.  We do not want
    to temporarily rise to a higher speed than desired.
(2) Use constants from pci_reg.h when possible
(3) Use uXX_replace_bits(...) for setting a register field.
(4) Use the internal link capabilities register for writing
    the max speed, not the official config space register
    where the speed field is RO.  Updating this field is
    not necessary to limit the speed so this mistake was
    harmless.

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 546056f7f0d3..f8fc3d620ee2 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -47,6 +47,7 @@
 
 #define PCIE_RC_CFG_PRIV1_LINK_CAPABILITY			0x04dc
 #define  PCIE_RC_CFG_PRIV1_LINK_CAPABILITY_ASPM_SUPPORT_MASK	0xc00
+#define  PCIE_RC_CFG_PRIV1_LINK_CAPABILITY_MAX_LINK_SPEED_MASK	0xf
 
 #define PCIE_RC_CFG_PRIV1_ROOT_CAP			0x4f8
 #define  PCIE_RC_CFG_PRIV1_ROOT_CAP_L1SS_MODE_MASK	0xf8
@@ -413,12 +414,12 @@ static int brcm_pcie_set_ssc(struct brcm_pcie *pcie)
 static void brcm_pcie_set_gen(struct brcm_pcie *pcie, int gen)
 {
 	u16 lnkctl2 = readw(pcie->base + BRCM_PCIE_CAP_REGS + PCI_EXP_LNKCTL2);
-	u32 lnkcap = readl(pcie->base + BRCM_PCIE_CAP_REGS + PCI_EXP_LNKCAP);
+	u32 lnkcap = readl(pcie->base + PCIE_RC_CFG_PRIV1_LINK_CAPABILITY);
 
-	lnkcap = (lnkcap & ~PCI_EXP_LNKCAP_SLS) | gen;
-	writel(lnkcap, pcie->base + BRCM_PCIE_CAP_REGS + PCI_EXP_LNKCAP);
+	u32p_replace_bits(&lnkcap, gen, PCIE_RC_CFG_PRIV1_LINK_CAPABILITY_MAX_LINK_SPEED_MASK);
+	writel(lnkcap, pcie->base + PCIE_RC_CFG_PRIV1_LINK_CAPABILITY);
 
-	lnkctl2 = (lnkctl2 & ~0xf) | gen;
+	u16p_replace_bits(&lnkctl2, gen, PCI_EXP_LNKCTL2_TLS);
 	writew(lnkctl2, pcie->base + BRCM_PCIE_CAP_REGS + PCI_EXP_LNKCTL2);
 }
 
@@ -1324,6 +1325,10 @@ static int brcm_pcie_start_link(struct brcm_pcie *pcie)
 	bool ssc_good = false;
 	int ret, i;
 
+	/* Limit the generation if specified */
+	if (pcie->gen)
+		brcm_pcie_set_gen(pcie, pcie->gen);
+
 	/* Unassert the fundamental reset */
 	ret = pcie->cfg->perst_set(pcie, 0);
 	if (ret)
@@ -1350,9 +1355,6 @@ static int brcm_pcie_start_link(struct brcm_pcie *pcie)
 
 	brcm_config_clkreq(pcie);
 
-	if (pcie->gen)
-		brcm_pcie_set_gen(pcie, pcie->gen);
-
 	if (pcie->ssc) {
 		ret = brcm_pcie_set_ssc(pcie);
 		if (ret == 0)
-- 
2.43.0

