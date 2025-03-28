Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E91B17BCE
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 14:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743172255; cv=none; b=XMbfKfZSt7oHvRAn+OxvMkAo/jwP0GjyFyjt73nxL2F6W0iv8Y+cL4q/3yNm+gxtkOQx4Z1ZLdvglgAtdsgZMZdEbV6ZNCAE8Ndjp7iyPEBrBt9JlfUXqKi+B7jhGVq2E2c6iNCNZwohFkl+2vWLoCI7cxSqHuLN82+c9BlxSl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743172255; c=relaxed/simple;
	bh=r69myt5CYJDUUxJ5eZ651vr//FxFOh0JfBQxRjDjfyk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HxjHMafqlczqCaYQyGWT5f1IsCgu84uAMM458LqKHYCAT74rEyvcoNyohuRlu86xdkguM4mCWqkSWvVkWbmJSHLPJO9oYqPJhF2fTWojy0Azhv4fUNEDcP9xsWIyrdYDrUBtj/NvDQogSUD/XQquP0NiutnbgCXMIdCAUxldoCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ZEYjmRP+; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ZEYjmRP+"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39129fc51f8so1642391f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 07:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743172252; x=1743777052; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xY2G9dr/4ekvZx7BFTEs3c751w4Nf1CQJqhKZMVEU4o=;
        b=ZEYjmRP+KgxRSgG3Klf5kTIFMr7IGRgQzSNRuvCnMWdN3KHbCkJdhygggiUewwetLd
         zwhX9UcLP2182klbfZYlZzwE22vA6EHWeHHDbMjOujy8PYJjGLfTvJ8sn10JUhhH1l/2
         I/OncZpgj1Fqsfr6Mi/NUpcxo02/x5wKsi0Qaj1JX7BQQ3vmLPAgcyngypjsyPyiSTP2
         d629LAlD2zky6JMG2VIj9ZPihi4zdxf2xrQJWDySa5SgQyxV54oL3dTpx7mF/ifHF8jB
         XvrlItqg3BPpeWDMDy/6b1IqFYIkgyg2nKWXip5LdNKPRUELGI4n/Cue13yBTXDbij+C
         A/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743172252; x=1743777052;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xY2G9dr/4ekvZx7BFTEs3c751w4Nf1CQJqhKZMVEU4o=;
        b=sFc1sk9P0r11O5tiJGxKI3LZLVCD2jER9rL0pOAKFC7r40FYtXXjDP70cX/b497Q4K
         z98MFtN8RgvNkznhWObI3tQiH6xO+kUs5Q5McadD3YY7Pn/ZoAMDN+tw+TVWFylimkh2
         zP/Bcel0S4pIcQ7bWMx+0L358S3FMluqJ7uDu0TNxpFe459tsaDldY60O23IvBvXkpDU
         One3hDlH+Tmrv5F67Bu6KSco0McdLxt4ecHZADc8ZTl9nr6rUDA2XCvu7yCxd8J69Nly
         IfWHmtLBxXql4GkUIcMLMHNtT5SJd/3RLgn35ByygMUZzE8bTiDo4iPtwhqgRaKoJoVW
         xryA==
X-Forwarded-Encrypted: i=1; AJvYcCXopCbWeb2vzkw+C2Wp/Lo/RJi0g0x8WJJm5SmDp7yu2ljBJd9KYtQVPZNDf29iPFLZxBtJCNr9rM0B5p0=@vger.kernel.org
X-Gm-Message-State: AOJu0YybAoxqLjQiLTj0th0voq2l7aXFwsIpp39wi68Xdy46VIF6aTMT
	uZD6S/che99R6FnlhjBHoKcDUr4kyCwWWJ4xVF0xHkGiZMOMRfQDpuvSQnAgsHk=
X-Gm-Gg: ASbGnctp/Rv5Il6HIhRkGEnZ8/3zGgoirFIc8RJM5DQJz/dhpJ2YhsJhf8Zw+E17xBh
	2Cdq29X9yd4beP08XMqk+2crV0AR2eFC/Gne1PofH8rwwCWZPl8YjKMlwSSSrbhEK/JoRlJmkWP
	EN/EACO+jDbSUV5sVVg14CVS9htNH5hsr1yz6yw5xu2w3P982NfnLns2skVnAHKr9gbBDKP3WqQ
	IPMQdZh1BRo05ujQoviIkEGsuXU2ojPrOUMjj8AcNv3ZNRRWspyvwP/7d4tLsEar8fezCLxSx/j
	3Ft0Beqn2DINNswWQIyTAqPesEmw+jCADrMdwdHoeUaMOx6dsCmB5/tlHKs=
X-Google-Smtp-Source: AGHT+IEqlAqw/EIsqm1BgyscIBxGUOeIxfC2lXTrnQ19OhlcGKYtCY+38uMpnMJk3wcdZrYVzV+TOA==
X-Received: by 2002:a5d:584c:0:b0:398:9e96:e798 with SMTP id ffacd0b85a97d-39ad17415a2mr7314079f8f.13.1743172246976;
        Fri, 28 Mar 2025 07:30:46 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:70c0:edf6:6897:a3f8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39c0b79e0dcsm2789859f8f.64.2025.03.28.07.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 07:30:46 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 28 Mar 2025 15:30:44 +0100
Subject: [PATCH] PCI: rcar-gen4: set ep BAR4 fixed size
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250328-rcar-gen4-bar4-v1-1-10bb6ce9ee7f@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAJOy5mcC/x3MPQqAMAxA4auUzAbsjyheRRxqm2qWKimIIL27x
 fEb3nuhkDAVmNULQjcXPnOD7hSEw+edkGMzmN4MvTUTSvCCO2WHmxeHMYSorRsT2QladAklfv7
 hstb6AfDmTqdgAAAA
X-Change-ID: 20250328-rcar-gen4-bar4-dccd1347fe38
To: Marek Vasut <marek.vasut+renesas@gmail.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Serge Semin <fancer.lancer@gmail.com>
Cc: =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1164; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=r69myt5CYJDUUxJ5eZ651vr//FxFOh0JfBQxRjDjfyk=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBn5rKU93EsfEvQqRKfYw9fYTj3oD6m4KNpZ84sz
 uxMinKIJd2JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ+aylAAKCRDm/A8cN/La
 hcPzEACgdAwbHl3qVRBYfJhEGKIBUUVbe3SP6v/HrFIig9GMe+v6Vh5MwjgOI8sSrJNPputEyDV
 LPk+aYT18SfUg0BK3Ji8plS6dtfAAKYqAF2NP7JQrkhFvLf15Wnp2gNSrI0cAvZTNAvc7fTSh2G
 G/FEe0tl80zU7/1p+jtzoN6RJjAI76zroHqREmJlWkELpfluQoDaKIjL56N+kbrCh3DyqqDBfQb
 NCZXUBtoRmw8AsBJquKGDdj8a9NgeGLmeFdxOuf4w2neq+6XEuxaYs/MtSaj+d2Boij8Ppsf91Y
 m/9fOePAM1dvizw3PcrOzzSoKu/oC78vptAYlehYHX6N7x94vl/+iBs4nRyyKUwXR9fgZeZ55M/
 JUuyAmaOQQ8Qr0ef0W1opD14erhPETY9o/9Z9s9wZ/zmb1y7uFVuV9l652kPjKY5eWxzoxrhkNm
 owPbGUdNWeSPockslN6cRjZUmDcJZNGJvLOJtEIGh7Fz+gbhJ6vZYT0U6lqcj1/jS961f9qaT78
 9FC8tNf+f3+zKbn7FUYlIukFgKwYjADEMUsc89sJbqsXqZKFWJqMoWQU0KO2MrMs2CyrTBYzI8l
 L4dmhkVNNTO/VI41+28MryVmwHl7rJbniok+Ucvthn1L1J2ig8sBGFt3K2DuNHm1yh1cG8QQIAI
 upkny4XrrLDWubw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On rcar-gen4, the ep BAR4 has a fixed size of 256B.
Document this constraint in the epc features of the platform.

Fixes: e311b3834dfa ("PCI: rcar-gen4: Add endpoint mode support")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
This was tested on rcar-gen4 r8a779f0-spider device.
---
 drivers/pci/controller/dwc/pcie-rcar-gen4.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
index fc872dd35029c083da58144dce23cd1ce80f9374..02638ec442e7012d61dfad70016077d9becf56a6 100644
--- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
+++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
@@ -403,6 +403,7 @@ static const struct pci_epc_features rcar_gen4_pcie_epc_features = {
 	.msix_capable = false,
 	.bar[BAR_1] = { .type = BAR_RESERVED, },
 	.bar[BAR_3] = { .type = BAR_RESERVED, },
+	.bar[BAR_4] = { .type = BAR_FIXED, .fixed_size = 256 },
 	.bar[BAR_5] = { .type = BAR_RESERVED, },
 	.align = SZ_1M,
 };

---
base-commit: dea140198b846f7432d78566b7b0b83979c72c2b
change-id: 20250328-rcar-gen4-bar4-dccd1347fe38

Best regards,
-- 
Jerome

