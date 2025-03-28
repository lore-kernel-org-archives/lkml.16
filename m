Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D0C1C84B4
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 14:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743173634; cv=none; b=ENCZPc84YFbUcJ5C+bLNTnKkZ9rgwKkQy0JEMemnacaud1tsaGOTBVLDp0qmI68rdrZ7N+n99hmj3FcZGjFeRVprFR6rSkJfvj5JDzEvgykbRWRr7fq8BhHlGU+H9k/XFTiWnmH63LNOs4caHFuh6nB4OJxHYfxr2B7z+zZ7FqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743173634; c=relaxed/simple;
	bh=5oAHlbTAcauldOWi9cMUgYioWN6gScafeHZfYPLkyRw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l6egzhqSfiwbKX6wbrzotSlmOI6D5PbB3yWXO+8RZAXVyZQA9p4y5HJvf9Mx3b6lCNArSA0r246mrec+G7ttaw5Pbdy8uWiU47c9Zb3AXlnESibX/pP6kgGFyKjl8oaWgwcdse2VykrghesUsYiPh3dJIkMPs9RoFV+9ibDJRas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=okOKEWfn; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="okOKEWfn"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso16665115e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 07:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743173629; x=1743778429; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=om5WJnI/3Srzz6KnBz+MWEytyGjHkNFH1uylSroKmIg=;
        b=okOKEWfnhIchaZtaYWp60UK0xpayqqgpB5D4b0i+I8ukqG/Sk8+XjXnMU5ZSXHHiWz
         d+g2HYuLBHn4gdO1t99+6/VlFsAG8+rpBzFqtPiXz5SGk2/0i6RQ1rOOCbJs6bsuyxoH
         7gtOPvckR+YJzU57+nMxEPPLKbxmeXtFd8F9IRCpGI9uhEZKSdJYU4vSQ1ALG/1LTIUc
         WhR9jfS0yWdziivczKntuGWlNSgvLfHnMrkbxpcZBZmjrR7HCUOqGoQesHaKT6AysUTz
         MTF2me2ZBw9HO20Hs6nTz1Rjm51UQmvK5r0MSnTi7suVo1vwTrdOlNyekhXtbPISj2Pp
         7N9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743173629; x=1743778429;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=om5WJnI/3Srzz6KnBz+MWEytyGjHkNFH1uylSroKmIg=;
        b=g6P+BbDmcyWKOka9mRG296ftEIOeDG5nmVkL6pL/8t0ch+gZCafEj/5pJDs1M68zAa
         4sVNBpb8M80YPFGiZ+chtot1bFDqbpYorREIpOelj6p23s2JSSeer86Xcyu9qYTkzXQj
         D4UNf8EnymJ63PJ8vVTTyt4bRCmd2EmyHiXdQbJ552XpgxnxI4ha27+0p2N+AY5/Rb3e
         R1KkLXnXkmk7R2nb1KKuNh/PaNkXyZYksRAMaExQTuP8eF+Y4RjkWZ1dictho9j8A9JG
         YuwwkDlIg6Bj7PrKpnXRqugv1M+B3LHbMTxmDM+blLAE+3vDBXYpL9kHRXl/fx+dUMdG
         Nzvw==
X-Forwarded-Encrypted: i=1; AJvYcCW/Asge2GypxQv5uuBklEWPKDwucCFjKlNhcaoxt0GV+Ygzddi6qeYfGma5LcGYxfHS8lDW0dWbcwEML84=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2YylAfiYQij5cKGQKn5d2UQeJ7jGq6tcnKd+tbKuH27nUx2+G
	aW24VKpVbDAmt2c9Pt0NVpDVlGiDuGB6sSJaabnLBSAMptGSkr/7MPPd5pfRCNU=
X-Gm-Gg: ASbGnctVYzrNSgj23njPgTM+/w6VVUZvH3JDyby5JHwh4fbtMYVdVSXD5OLR1RV8IOF
	QH3pyvN51L1YCSjQrctMYZzGu8IyUPrCTsCGkpKNCpQJkFPNKy7sfaaMTHXyDdx7Xz2uOXlrmLT
	MYPAS/ZN7hLnHZdZm/yi7lDgOVQNaVWqmLJHi32GTjHvy9vt+PXUCq+TIkQITA4HW7e4z+Yy772
	N3o/cioSeC2OUp4sV0z/qO9SVN0LQkYG2EEpwE9zReoEIloGXgNnhoeDkraHB6jMIkRgC8lC+Cb
	3sZiciSbdot0n0wP3o3HCLi3us5f8/4tTRUnj7IBcHQl9my4PDjDw8YdmS4=
X-Google-Smtp-Source: AGHT+IHxpmdIjzZ3NBy6ZKDeIo2oJ9uzZLQK6IFavRFuRv86Y+8cRv+dnKeq1VLQiY8bi9c3dCFsFQ==
X-Received: by 2002:a05:6000:22c7:b0:391:4889:503e with SMTP id ffacd0b85a97d-39ad17503e8mr8632876f8f.33.1743173629528;
        Fri, 28 Mar 2025 07:53:49 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:70c0:edf6:6897:a3f8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d8314e110sm75219615e9.39.2025.03.28.07.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 07:53:49 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 28 Mar 2025 15:53:43 +0100
Subject: [PATCH 2/2] PCI: endpoint: pci-epf-vntb: simplify ctrl/spad space
 allocation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250328-pci-ep-size-alignment-v1-2-ee5b78b15a9a@baylibre.com>
References: <20250328-pci-ep-size-alignment-v1-0-ee5b78b15a9a@baylibre.com>
In-Reply-To: <20250328-pci-ep-size-alignment-v1-0-ee5b78b15a9a@baylibre.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Jon Mason <jdmason@kudzu.us>, 
 Dave Jiang <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>, linux-pci@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ntb@lists.linux.dev, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2533; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=5oAHlbTAcauldOWi9cMUgYioWN6gScafeHZfYPLkyRw=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBn5rf5tteiMGeKSx358xJ2+154PVr7k7RAJ8OqE
 x2hmwLHlNeJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ+a3+QAKCRDm/A8cN/La
 hX1yD/sHaWYMETTJwDgxrGxRlNsQF+Rc9Q5oMX73ZbvDomTMBb5/EiuCjNA+WGqvLAaxZPnInYb
 gbgbOiq3WmzHn+nEp/DGRjxo8UlUCwJEE0w+E+D89smicnQpIelt4t7+C/M+ImfP/AUC7bxZfiJ
 aJqVUT1ya+PnF0xTs2X1txWYxCtLvr1ez3Zpq7tWgPbvlZzrQgQX1Gs5NkYGemnRj4CdKAwWwc/
 WdPQ6RD2QjKbsur4fqR5Mm5Ykd+yveBedPVUDb2otNDQSi+P+8ACxZ9wn2ZpFbQeSdWa/wrxgFS
 uaKxglM4i8uT7qLrWJWP5we/cAKLPVTI3n11V36Zs8g2ppjfZgAwIhZckxcPGaBFNStjI3em2DX
 y1oAkpi56w/B7itaLGgQ2OnANTCeZ74U/9RJe80a4dq7rHsZcbs8yeIxhhnIWjN/fRvO4nqpH09
 B/XqYI18bYdgYLJ4zPvixPbtVhvoAxCpY7xJPyOhrJR27m0njeWb/dugQjI+03LABwI5PstLYYl
 qtDWRm0pg2/TA/v5JTTzpqK2BbEG2ST+9Htlt/UeGLN54VADr9qtKB/C4PCkqs0HoHNRJpX6ufm
 2UoJI+sD12dRMYYnCviwxrBt7KSVPuWTN5lnUmnHqTOFDl6WfqoPgNvu3mAsPJfqPMpvduOzCNN
 hJsCtJfdABnSOEg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

When allocating the shared ctrl/spad space, epf_ntb_config_spad_bar_alloc()
should not try to handle the size quirks for the underlying BAR, whether it
is fixed size or alignment. This is already handled by
pci_epf_alloc_space().

Also, when handling the alignment, this allocate more space than necessary.
For example, with a spad size of 1024B and a ctrl size of 308B, the space
necessary is 1332B. If the alignment is 1MB,
epf_ntb_config_spad_bar_alloc() tries to allocate 2MB where 1MB would have
been more than enough.

Just drop all the handling of the BAR size quirks and let
pci_epf_alloc_space() handle that.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/pci/endpoint/functions/pci-epf-vntb.c | 24 ++----------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/drivers/pci/endpoint/functions/pci-epf-vntb.c b/drivers/pci/endpoint/functions/pci-epf-vntb.c
index 874cb097b093ae645bbc4bf3c9d28ca812d7689d..c20a60fcb99e6e16716dd78ab59ebf7cf074b2a6 100644
--- a/drivers/pci/endpoint/functions/pci-epf-vntb.c
+++ b/drivers/pci/endpoint/functions/pci-epf-vntb.c
@@ -408,11 +408,9 @@ static void epf_ntb_config_spad_bar_free(struct epf_ntb *ntb)
  */
 static int epf_ntb_config_spad_bar_alloc(struct epf_ntb *ntb)
 {
-	size_t align;
 	enum pci_barno barno;
 	struct epf_ntb_ctrl *ctrl;
 	u32 spad_size, ctrl_size;
-	u64 size;
 	struct pci_epf *epf = ntb->epf;
 	struct device *dev = &epf->dev;
 	u32 spad_count;
@@ -422,31 +420,13 @@ static int epf_ntb_config_spad_bar_alloc(struct epf_ntb *ntb)
 								epf->func_no,
 								epf->vfunc_no);
 	barno = ntb->epf_ntb_bar[BAR_CONFIG];
-	size = epc_features->bar[barno].fixed_size;
-	align = epc_features->align;
-
-	if ((!IS_ALIGNED(size, align)))
-		return -EINVAL;
-
 	spad_count = ntb->spad_count;
 
 	ctrl_size = sizeof(struct epf_ntb_ctrl);
 	spad_size = 2 * spad_count * sizeof(u32);
 
-	if (!align) {
-		ctrl_size = roundup_pow_of_two(ctrl_size);
-		spad_size = roundup_pow_of_two(spad_size);
-	} else {
-		ctrl_size = ALIGN(ctrl_size, align);
-		spad_size = ALIGN(spad_size, align);
-	}
-
-	if (!size)
-		size = ctrl_size + spad_size;
-	else if (size < ctrl_size + spad_size)
-		return -EINVAL;
-
-	base = pci_epf_alloc_space(epf, size, barno, epc_features, 0);
+	base = pci_epf_alloc_space(epf, ctrl_size + spad_size,
+				   barno, epc_features, 0);
 	if (!base) {
 		dev_err(dev, "Config/Status/SPAD alloc region fail\n");
 		return -ENOMEM;

-- 
2.47.2

