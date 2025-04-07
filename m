Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914351F8BCC
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 14:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744036772; cv=none; b=Shb46T/IDKNVbjWnWAvr9vOn3fK+4NgFKZxybcsgeZDk/+p1Bxh+kXPVP/qxD0TWJ7dE3poK3wkiC9ApquUQiiaogF+CXh5jir7wxurSPOI5AP/JFuamEN3Dnzqsun1wkCietma4Dj+KKDpeTR27y8J3a3OAwMqT9YpTmdT1Dxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744036772; c=relaxed/simple;
	bh=n0KkujYCmFsi6TCmOtVdMu0bbfrL6UkgnMn4aw3JxJA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tDg2SvmCXMAcUTWlxBzftFrIGbO2wnj+RrTmD/wwxHrARvTYGxVX9OHcGgeocfPC2AqFvwpzoxbvbZcTUh97Uhc7hcNlkm24oB9YYU2jB2BUcxupSl3CiKfoKEq3GOccSOofIRzYFHqfCl9J7nCTIxq+ok3A6PyeheMybZChSLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=K+nvT7YF; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="K+nvT7YF"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3995ff6b066so2403647f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 07:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744036768; x=1744641568; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y7eFcTw1BBmLsXfJBPUwIPNdKPEmqoZIDDhrBsVYvns=;
        b=K+nvT7YFxhEAhsSYsMdvO9GRgyH7rBqMQ3xOKZV9jFqd0LBiY/L0JMW92qZ68suQtM
         qTjupBjdTsxlDuI3rf9UgXMHIFWtPPrj1r8Vj20fB3Qvn25O0ARjab2I2U7Sal7RjDwj
         5HOOi68tysp3Cjz/mAFriRCRWYxlYQcIAWJd7p8+vNXT3kKZcNolpNw18BfUucLARM71
         mkWv5N2qEwC3qd+Ww0NzdP2w5546S4ocQMpQWmlaGvT30DWhlk9lTYLiJysJUGXLEwtL
         CYVDSHrtHM4voY6J2+HICdzCj4g+0BB8/HaJ+epbJZNmfIxLrdVXH2crLKWt5LOkkJCX
         68lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744036768; x=1744641568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y7eFcTw1BBmLsXfJBPUwIPNdKPEmqoZIDDhrBsVYvns=;
        b=h3cp65vlnlqO75ld+UAMqOq7uzFLKCLAZ4SAfKyYW9ohQW6Wdav0pV3x3YERIkI0yN
         aScAmWhe3Bt/SsFJToD227B7d0PFHlBQNuKhj4ihCOF8Le06/NBIQTYYpeBqcSLDCMJp
         p9eYi7ZrfBwmBSgK5fRA1a91K0VmGKy31BlmkUn8vtwDrEkmdbPg8Q2b7wv8asHSYyvn
         6BVHjady9Z+7s0KjXxpytNEvVoWbw7cS+xYb/c6E5JWe1xN6lkh7Zu2y4XbkGbRWD+MF
         IJ0acR/zuXRETJz4eUtzO+swBLBFL2la0m2gZUsm/8weXnJSquleXn14JqLVy3pZ9q5H
         R/gw==
X-Forwarded-Encrypted: i=1; AJvYcCWGQnVQjIP109IPuJwEz091++Qn/mpz25BrYXA3C8iY6CjBc2x8g6tY5ZQjpyf2gwuoaroCwmbfGodfN2E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyneTy7vSA0kott0/cva4QbNjRhgU6e3fo6iQdzciNmPQokDJqd
	hT5hb0DYrrPg/LhZkgXY0TZ93jy6Ou/ANctXXjt77uMkWf5R0y6qzBfod/ogCdk=
X-Gm-Gg: ASbGncunXocs1PX3I3Te8QIItPT1lJ672YyRSdf1MyqUcQdXVXi30DW5Tx+SGuB8qbV
	TBHOCMS56NkTDPqLrsZtrfCKG5yXbWc5aQoWExNJxj7vIHyElbiCdpVjEOJXAwYy03Aay4gYOD2
	dIvLJBgNQqg5dlfTF3bZ5wRNac3FgfncR5gXf52z6Afh8u1nPrDwAT+mvZUf2ovkCR4ilwyUb5G
	Kf7MmY0cI2MhP2wLlLonp+/zmmR+P/CU/7LfDKe/2PIVlTix5Vj7SECfwnrOnQVBpCStcypWJ02
	X5q0jfJ5EvxYbfbGuV4ikqtsxTGfTmD0feQqu71ZACgXsMGIuRw6A4kVzm0=
X-Google-Smtp-Source: AGHT+IHz+UHcCsUtEEJhgEfJlAKbScYm9TcMULxn6JxZWVz6GKeQRERIZCltbN3u7HtrlOzoRjNl/A==
X-Received: by 2002:a05:6000:188f:b0:391:3915:cfea with SMTP id ffacd0b85a97d-39cba93329amr10771859f8f.38.1744036767753;
        Mon, 07 Apr 2025 07:39:27 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:1122:cb29:d776:d906])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43ec16602bbsm135003705e9.9.2025.04.07.07.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 07:39:27 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 07 Apr 2025 16:39:08 +0200
Subject: [PATCH v3 2/3] PCI: endpoint: improve fixed_size bar handling when
 allocating space
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-pci-ep-size-alignment-v3-2-865878e68cc8@baylibre.com>
References: <20250407-pci-ep-size-alignment-v3-0-865878e68cc8@baylibre.com>
In-Reply-To: <20250407-pci-ep-size-alignment-v3-0-865878e68cc8@baylibre.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Jon Mason <jdmason@kudzu.us>, 
 Dave Jiang <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
 Chaitanya Kulkarni <kch@nvidia.com>
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>, linux-pci@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ntb@lists.linux.dev, 
 linux-nvme@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3212; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=n0KkujYCmFsi6TCmOtVdMu0bbfrL6UkgnMn4aw3JxJA=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBn8+ObiJpvdYB8bsZnZVvwp+QDS1VlGg2pjvZVF
 AG6RByUfqeJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ/PjmwAKCRDm/A8cN/La
 hb2MD/0YQhJLrOZ76T9VTuUia/wCoGBX5EMJnYssupmfuh6Sv5QSaTs5/1bOLyHR64hwp4rgcm+
 NQQxKNgHWHakJNxR5lQGikqtiYKuaVwsAaso6mWmgNsIhumgjAeOhSfpL/arH0zfBIImA/h5Orf
 0YlfqljnT1Ap7yO6n+CLEUK1KkeH0fsk3Hs2O/AD9gtT+ZAMceneheK4VD64dcSWLNU+tT12nX2
 3WcV+F8Oe6eRpjIsyIF56/yFrgAkzM1B/k8ZFqOXDgFqb0aDMH6COVKwSGkdbMyZ1wV/e3mvI6c
 1kZUS1LgH3ESB5Cak1EG+0JZehGnJsbAecqLXxhYNYfyctcDx7cKjk16L+8z3G53VdIHWuTjP8s
 ZxV9TLG9f2U1DZqtudDIwqXX61MNL9Igqvv3co8jizpNIcjM0kTjdFDUas0OZ+nWL9bWtwkohu0
 sXb7xs1tIVyZQ6O3YD22HbpKfpVknQ81WZ3KicMRZOfJ22FHxHxF/alKA0DaNVFBu8efVH6S18/
 pB9RFpc7R8STCGyUpw5u/7UTiXBftL8XarGnrqvwWJ2B8OBg+te82ctgTKFJGGlrBMRHSnnpIY0
 szjPrQuaWsLGEXgGozut/BhnEuMKPPETZnH0PUVrGeGY2cezR2MemHr/dQmI15mSXO7s0iEihfB
 NCY/lGk981j6SYA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

When trying to allocate space for an endpoint function on a BAR with a
fixed size, the size saved in the 'struct pci_epf_bar' should be the fixed
size. This is expected by pci_epc_set_bar().

However, if the fixed_size is smaller that the alignment, the size saved
in the 'struct pci_epf_bar' matches the alignment and it is a problem for
pci_epc_set_bar().

To solve this, continue to allocate space that match the iATU alignment
requirement but save the size that matches what is present in the BAR.

Fixes: 2a9a801620ef ("PCI: endpoint: Add support to specify alignment for buffers allocated to BARs")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/pci/endpoint/pci-epf-core.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/endpoint/pci-epf-core.c b/drivers/pci/endpoint/pci-epf-core.c
index b7deb0ee1760b23a24f49abf3baf53ea2f273476..fb902b751e1c965c902c5199d57969ae0a757c2e 100644
--- a/drivers/pci/endpoint/pci-epf-core.c
+++ b/drivers/pci/endpoint/pci-epf-core.c
@@ -225,6 +225,7 @@ void pci_epf_free_space(struct pci_epf *epf, void *addr, enum pci_barno bar,
 	struct device *dev;
 	struct pci_epf_bar *epf_bar;
 	struct pci_epc *epc;
+	size_t size;
 
 	if (!addr)
 		return;
@@ -237,9 +238,12 @@ void pci_epf_free_space(struct pci_epf *epf, void *addr, enum pci_barno bar,
 		epf_bar = epf->sec_epc_bar;
 	}
 
+	size = epf_bar[bar].size;
+	if (epc_features->align)
+		size = ALIGN(size, epc_features->align);
+
 	dev = epc->dev.parent;
-	dma_free_coherent(dev, epf_bar[bar].size, addr,
-			  epf_bar[bar].phys_addr);
+	dma_free_coherent(dev, size, addr, epf_bar[bar].phys_addr);
 
 	epf_bar[bar].phys_addr = 0;
 	epf_bar[bar].addr = NULL;
@@ -266,7 +270,7 @@ void *pci_epf_alloc_space(struct pci_epf *epf, size_t size, enum pci_barno bar,
 			  enum pci_epc_interface_type type)
 {
 	u64 bar_fixed_size = epc_features->bar[bar].fixed_size;
-	size_t align = epc_features->align;
+	size_t aligned_size, align = epc_features->align;
 	struct pci_epf_bar *epf_bar;
 	dma_addr_t phys_addr;
 	struct pci_epc *epc;
@@ -287,12 +291,17 @@ void *pci_epf_alloc_space(struct pci_epf *epf, size_t size, enum pci_barno bar,
 			return NULL;
 		}
 		size = bar_fixed_size;
+	} else {
+		/* BAR size must be power of two */
+		size = roundup_pow_of_two(size);
 	}
 
-	if (align)
-		size = ALIGN(size, align);
-	else
-		size = roundup_pow_of_two(size);
+	/*
+	 * Allocate enough memory to accommodate the iATU alignment requirement.
+	 * In most cases, this will be the same as .size but it might be different
+	 * if, for example, the fixed size of a BAR is smaller than align
+	 */
+	aligned_size = align ? ALIGN(size, align) : size;
 
 	if (type == PRIMARY_INTERFACE) {
 		epc = epf->epc;
@@ -303,7 +312,7 @@ void *pci_epf_alloc_space(struct pci_epf *epf, size_t size, enum pci_barno bar,
 	}
 
 	dev = epc->dev.parent;
-	space = dma_alloc_coherent(dev, size, &phys_addr, GFP_KERNEL);
+	space = dma_alloc_coherent(dev, aligned_size, &phys_addr, GFP_KERNEL);
 	if (!space) {
 		dev_err(dev, "failed to allocate mem space\n");
 		return NULL;

-- 
2.47.2

