Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918C119006B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 17:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748970247; cv=none; b=WVesJQ2BTHnZmQ9aZK63BwyIuDYIWxOY+MRgqPCldc3FliZgFlL++cIYPelgHkx2LDozv4P8df/If3kvf1MM6exmgQZ77x7NDDZgzInD82FpiPkrgU7bmpTcQzHvbwCs5aeu8jY1UeeRevbh39vtQBohyhTqetQ1g6eYrOmAItI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748970247; c=relaxed/simple;
	bh=4r+5Eof096MZjRh8tpVi37f6nJMhY0833cfm9C9HdL0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pZlWgj+bJKNEdx+WMX+kFJGqLka8O+etEdVt8aBQGvWqQdgGUHdmr3xQBu7NyyJOuvR/hGZDVTks0FcQaNA3fiVjU/+UGsyg0htyU+hvgfaQW1fx2Lkh32Z2j0DdVc28VMHRg0grbtqLa6k3wj9QyodBqRTeqW+1H/khhoq6zT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=2b7cSReR; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="2b7cSReR"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so54251f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 10:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748970244; x=1749575044; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z9KctMIkbgxYBp8QVwwNbz+2eDOalPhBXgUZIQWSTmo=;
        b=2b7cSReRtXT0uSW84ykQaUZH0gPMRasYIx6cwaadLeBmyvLv96BHM9K8FYF/OD+S9U
         DMzzJcQ8yeBC+7xuWyvaoRQSCdBNOt0CI9wdPiisC+k1MiNnSD1BL44DM3nvsSkLBogA
         8CZk2QB7IgorONpNGZSCwarJlaSpV2e/b0WzTvSktUYTzyuU0OZXFlydTgHKtqqMrOTi
         WlpgAcACamRdhk2P2iKgaXVL+asi14KQMrPXiWj+D9uNC4moIj1G/Mjzx2HPhRgpxcMl
         kP+5N3ObyOLvvfR+2mo5QSJn3SV0wGV5WtFbvTnvj5ve+Dn1xvYD6kZVhUp/g/dG885v
         7TtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748970244; x=1749575044;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z9KctMIkbgxYBp8QVwwNbz+2eDOalPhBXgUZIQWSTmo=;
        b=V7KhHCs6SC2lFndIm5daFRk9T1FwRLF3lYtPeLSAbl0F9gLsyfLDyM50I2Ugdxa0T7
         idj7z6kXJHingCL4yv+Q8tlyNtVzyXvXGNU8N869GSWe3e1LGlQY/7PO6Nz1SlIpeYkB
         QV1JEPMCY0FKSCbYZCNOZpIVcp4Rjuw7uhA+gKTKFCFUrG3UQleRBkBYoFRDGiKX3NcE
         F1fT7Lp1RzuHxCj7aB6mgLx8idl6BuQLjCMO+Oo0MQ4mJPVmlxxyT02imUlV2xo3IZ40
         eO6dQpgozQntu1wIIr28LrxrCQFaYCZG+Zqhl38r+RKzI0gc930sYDf322O1HBuBf6ia
         YdOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkEbpdHnqBVDQQY4MDoTibjm427dcJiTFI4E/YawOoruRLBtWWCyBaPrQgPGkwqAa25bImb8GBEcx32sk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCIzEIoUKWY8WYagvCn4S5RfWpx/aVLCUPd/G3aI9EaFn/3skx
	o84kVc7xypQV8mwTj4czXApUTPKLp2xCu3cO078aaLkJgjwDW6q87uV9UCMd11ivLP0=
X-Gm-Gg: ASbGnctg1FufWAAuKzSBu7jfLioZFVppkd35Non0fag/gZK5WnlbI7g63+uVQhj/JpD
	H63fkk8uvGwsMe9H840yWJqyQL8IjP6RG+Yq4PI2sjcRV3uM5vt6zwIsFTphhEiboUuK8drSV7T
	c6BQLU+S4lltgQbY9yphMfLf6ZooobajfiY8P8USgugFSNTFsBvGdhw5GMHR25IFlynp/oDr6qk
	ozGFVzYTsz9ZT5/YFMYKo/GPA5RbJXK2c+V/ljSNYaPyCVCZ2QkutRBf/q6BUg5AF7CLZzSLbA7
	DCAYd/3aSoJS2IMEkHeRTchUzx09ULU1dnEgq+dj/HszvEP1SvxANLGD2GeD++XfYA==
X-Google-Smtp-Source: AGHT+IFQ4mga6ZpQOnpfxIJQb2eWoiJqInQW3qkdZiZ9oqXdEFGYy8VI+GYDFKLpm2n+vIAxaELDzA==
X-Received: by 2002:a05:6000:144d:b0:3a3:7ba5:9a68 with SMTP id ffacd0b85a97d-3a5144f8154mr3094893f8f.18.1748970243645;
        Tue, 03 Jun 2025 10:04:03 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:ce70:8503:aea6:a8ed])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a4f00972f3sm19165796f8f.69.2025.06.03.10.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 10:04:03 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 03 Jun 2025 19:03:38 +0200
Subject: [PATCH v2 1/3] PCI: endpoint: pci-epf-vntb: Return an error code
 on bar init
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-pci-vntb-bar-mapping-v2-1-fc685a22ad28@baylibre.com>
References: <20250603-pci-vntb-bar-mapping-v2-0-fc685a22ad28@baylibre.com>
In-Reply-To: <20250603-pci-vntb-bar-mapping-v2-0-fc685a22ad28@baylibre.com>
To: Jon Mason <jdmason@kudzu.us>, Dave Jiang <dave.jiang@intel.com>, 
 Allen Hubbe <allenbh@gmail.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: ntb@lists.linux.dev, linux-pci@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1100; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=4r+5Eof096MZjRh8tpVi37f6nJMhY0833cfm9C9HdL0=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoPyr/rF0NiI9WeluJ+asQYI6+4kWmycSeT3GUm
 2/aDNg8qiOJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaD8q/wAKCRDm/A8cN/La
 hSLjD/0Q4FwOh6ppUJJ2M+N/1SOee8kK5qxOadTEqWDaaMGNH51khNK0PPAiZMyEIsQQf855Js6
 EuEJcd77GsM3Ntm+F6UMQk9NQ+ZtPhwaGt7tRQ9jma5HTNRv/WHRy6m8qMCbH3nm5eKMRb3a0vL
 hP16eJ+EK2drKPfoOMWTQVyXTFHSasvW3MKH13GyM8yihB9CNcksyNl6+5yIbLPItRA/E+Gf9hP
 0zP/Wkrga6nAorbLUksBosPRVzCM/BSY/CV2dF1gosh2sBxgjwJFrPWisfTmssTMzi803WllYPs
 QnYTl2uullBc1Wucl+zMWEbEDDDYDTobNuHfv37GE94RlHVwumK2kMOSTC6AWJzDZYjUzIwedNY
 ZLnu/atJWd0ffYXGJ2brfXoA2vrvv8b/83LwneArAiKAmrL85Fl+GLsOjxXYXa4IhQN/Hfhp/kv
 VrFLsB7gG2U3eR2DT3JKdNXYiItVLS2OuaYoMGuLw+zKR/t0FeyVTHd0tz67ff0Yt+YQHmuAn1l
 gZoAq4N8RGeueybFK86+IV/eQAWyKEf6syYLlxYrC7lBHofKVa2cLQoktWlVt/gfFpsK88Nn4aY
 NfHplfXZuoXkq48afjQsQzdkE+460W8PcYU/B/afMGCI4qnd4GSGyKMu0wyXC1o+v39S26yeuTh
 wjDsFm/5vzqCmPA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

According the function documentation of epf_ntb_init_epc_bar(),
the function should return an error code on error. However, it
returns -1 when no BAR is available.

Return -EINVAL instead.

Fixes: e35f56bb0330 ("PCI: endpoint: Support NTB transfer between RC and EP")
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/pci/endpoint/functions/pci-epf-vntb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/endpoint/functions/pci-epf-vntb.c b/drivers/pci/endpoint/functions/pci-epf-vntb.c
index e4da3fdb000723e3adad01f0ddf230ecc0e572a7..35fa0a21fc91100a5539bff775e7ebc25e1fb9c1 100644
--- a/drivers/pci/endpoint/functions/pci-epf-vntb.c
+++ b/drivers/pci/endpoint/functions/pci-epf-vntb.c
@@ -680,7 +680,7 @@ static int epf_ntb_init_epc_bar(struct epf_ntb *ntb)
 		barno = pci_epc_get_next_free_bar(epc_features, barno);
 		if (barno < 0) {
 			dev_err(dev, "Fail to get NTB function BAR\n");
-			return barno;
+			return -EINVAL;
 		}
 		ntb->epf_ntb_bar[bar] = barno;
 	}

-- 
2.47.2

