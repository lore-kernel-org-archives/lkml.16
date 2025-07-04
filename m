Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925F93271A2
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 16:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751645684; cv=none; b=efhu0f/9QletVDvEafRY3mBBMPIBbnUd8Aj+lMXBGZGZbBpcXYsI4mbah1mdIT82MacWnY4WcukpQhFY7XUFSY6WmCb/fT+y2v8Cg9euGhF+w1/Kx4CSBKCbMkunw3iEaLuLzgsgnHviqCWyvg5o4hYccced6x431zMjNQltnAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751645684; c=relaxed/simple;
	bh=8qyZx+ACiY0+WBNIGME8B9wVL18PEIEvpUnFL2L5JlY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oTIaXcIQCY3MyjBrTXmqDWRndSgHihxHo85v3nxufB7rx6GtD31WxA79LquC6tAzCiJEWShfpBWnw7eqj8hM4zNpbT/O/cmsA0HIamXJIu3EGvLCaeE+rIdHGDja5sIfPj5BmcOIUaHqvadJDlpeyc4vU1AQj04Mn4pTow53bog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=nJ7qrkuQ; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="nJ7qrkuQ"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-607ec30df2bso2123463a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 09:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1751645681; x=1752250481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EDcC8N9ecRYf9VHdU9K0Q9wS+bIYi9ixK/h1xf/HBCM=;
        b=nJ7qrkuQ8JGmwc8qNezgio1TfFxtRIvONYqndX+NCODLX4GTTS8CaZMDPWpKIYYdtA
         krjNtqYKeIQV0ePeCpxEdZeT3VWsdzT5QGy7yukNOBi4ueOiaFaEoRHPBmFN0nHk2cvb
         00MDsyniuVi6HcWZZjWddUudt9qSHfDRBZ6Qc8FiBWvLUhJ4VKjHNc77imjyyiah5RHZ
         8wGzo2+y9s3WRxTL3dAD5Re4a5IjndKeev/vQZ+NDfy6ES5cvOPlpfecFgbGfnhFoNV5
         TmVUe2+5tKarak4W/VQR/+8gFPA3mnsBf3VNSWQ6KtT9NOANRN5bJE7+xvJSvF4T2uyc
         1yBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751645681; x=1752250481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EDcC8N9ecRYf9VHdU9K0Q9wS+bIYi9ixK/h1xf/HBCM=;
        b=wEMTEG35ru84f2SCm6ZW+5zoTIvrLC1DKdBEE9wtT+KTW6NGAMW+FJxTw89m07DhH5
         K/hWPEpjJiLk/kx69E2TzYWO/j1AfXleF3CMapbWyxaTxIphkkPC+ml+2r7HUFRTW7Bh
         nlM66mVjA9BqG1NsJ2DET25a/UvbMJWxKNYuGCDNdjjJVyLBzQvJubw3IAv0cbmrVZ5p
         qylM1Qoc2Xd3gxSGYQp2lHJv7BZV8Jrb/1vt8K6VTLdWY6voFm1RSd27K+9OQHOuJJtY
         MPdQrlFOIxYUacpocDRVH9/zgdSOa2B13Tg5DPX17K4IJ9HmgOSvQyVB1y2f6ypV/NTI
         ygCA==
X-Forwarded-Encrypted: i=1; AJvYcCU/gJ9DStZuDCUMVD1ZR/727b7i7TF50vKhk+aaIipoIVsuA2Jzyb5QjuN3s+UngAJR5SfkTPDqviF+IzU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOYNkxBX2DbfqKL4ZNvdJ8nShysbpboNtuPht3Jrtkx6UoHhS4
	ktHzhmnk+kG8Bedf7eSA2d5XguNyfEPA2jypH0Ui25nhBV/byVp3evdSnCqO5Dkp4J4=
X-Gm-Gg: ASbGnctR0qrLGxTjOqQgBERtgQmPFZ4xRpEH85OALiBuSFkwJID+UQgHgW5qSBA+6h0
	HIHEcjv3H581SnA4r7ZFSNuYLs3pxVGiGuaqZaVN7gTUUWXVc73nVWDye3pkfbK3vpDZ6Vyl6wa
	uPJ25lRG3sLqtCVQ4VQ8dJAkS3JhBFHxHImnfBJBENXHGN640es81mGWwFsAMALMfhv6L6ZunDV
	3mrEjrBS5udWW5oYVunAEbQpvXgS89TSBAgTFUoXVm5I60o4e/CYmGSnQ7UpsgWsWHZg15je7El
	DqxqbP7QXandgsMtRMpETgcAr8Fhv7DeyEK/IHFI6DnZDlpOHA5FeluE7UY84J2FFPiPjjVO6IY
	3YDiU3toihZG9lW4=
X-Google-Smtp-Source: AGHT+IGL1FhLD4OaydMHDQRErBXQVTMo3OYnTq5XD1D0AoTOZG1fs0lJwUIPUfaPAE25gc/Ra0hNDQ==
X-Received: by 2002:a17:907:dab:b0:ae0:c0b3:5656 with SMTP id a640c23a62f3a-ae3fbc6509bmr348476466b.22.1751645680835;
        Fri, 04 Jul 2025 09:14:40 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d9215sm194703766b.2.2025.07.04.09.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 09:14:40 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	lizhi.hou@amd.com
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 3/9] PCI: of_property: Restore the arguments of the next level parent
Date: Fri,  4 Jul 2025 19:14:03 +0300
Message-ID: <20250704161410.3931884-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

of_pci_make_dev_node() creates a device tree node for the PCIe bridge it
detects. The node name follows the format: pci_type@pci_slot,pci_func. If
such a node already exists in the current device tree, a new one is not
created.

When the node is created, its contents are populated with information from
the parent node. In the case of root complex nodes described in the device
tree, the created node duplicates the interrupt-map property. However, the
duplicated interrupt-map property does not correctly point to the next
interrupt controller.

For example, in the case of the Renesas RZ/G3S SoC, the resulting device
tree node is as follows (only relevant DT properties are shown):

pcie@11e40000 {

    // ...

    interrupt-map = <0x00 0x00 0x00 0x01 0x1f 0x00 0x00 0x00 0x00
                     0x00 0x00 0x00 0x02 0x1f 0x00 0x00 0x00 0x01
                     0x00 0x00 0x00 0x03 0x1f 0x00 0x00 0x00 0x02
                     0x00 0x00 0x00 0x04 0x1f 0x00 0x00 0x00 0x03>;
    interrupt-map-mask = <0x00 0x00 0x00 0x07>;
    interrupt-controller;
    #interrupt-cells = <0x01>;

    #address-cells = <0x03>;
    #size-cells = <0x02>;

    phandle = <0x1f>;

    // ...

    pci@0,0 {
        reg = <0x00 0x00 0x00 0x00 0x00>;
        interrupt-map = <0x10000 0x00 0x00 0x01 0x1f 0x00 0x11e40000 0x00 0x00
                         0x10000 0x00 0x00 0x02 0x1f 0x00 0x11e40000 0x00 0x01
                         0x10000 0x00 0x00 0x03 0x1f 0x00 0x11e40000 0x00 0x02
                         0x10000 0x00 0x00 0x04 0x1f 0x00 0x11e40000 0x00 0x03>;
        interrupt-map-mask = <0xffff00 0x00 0x00 0x07>;
        #interrupt-cells = <0x01>;

        #address-cells = <0x03>;
        #size-cells = <0x02>;

        // ...
    };
};

With this pci@0,0 node, the interrupt-map parsing code behaves as follows:

When a PCIe endpoint is enumerated and it requests to map a legacy
interrupt, of_irq_parse_raw() is called requesting the interrupt from
pci@0,0. If INTA is requested, of_irq_parse_raw() first matches:

interrupt-map = <0x10000 0x00 0x00 0x01 0x1f 0x00 0x11e40000 0x00 0x00>

from the pci@0,0 node. It then follows the phandle 0x1f to the interrupt
parent, looking for a mapping for interrupt ID 0x00
(0x00 0x11e40000 0x00 0x00). However, the root complex node does not
provide this mapping in its interrupt-map property, causing the interrupt
request to fail.

To avoid this, in the interrupt-map property of the nodes generated by
of_pci_make_dev_node() map legacy interrupts to entries that are valid in
the next level interrupt controller in the interrupt mapping tree.

With this, the generated pci@0,0 node and its parent look as follows:

pcie@11e40000 {
    // ...

    interrupt-map = <0x00 0x00 0x00 0x01 0x1f 0x00 0x00 0x00 0x00
                     0x00 0x00 0x00 0x02 0x1f 0x00 0x00 0x00 0x01
                     0x00 0x00 0x00 0x03 0x1f 0x00 0x00 0x00 0x02
                     0x00 0x00 0x00 0x04 0x1f 0x00 0x00 0x00 0x03>;
    interrupt-map-mask = <0x00 0x00 0x00 0x07>;
    interrupt-controller;
    #interrupt-cells = <0x01>;

    #address-cells = <0x03>;
    #size-cells = <0x02>;

    phandle = <0x1f>;

    // ...

    pci@0,0 {
        reg = <0x00 0x00 0x00 0x00 0x00>;
        interrupt-map = <0x10000 0x00 0x00 0x01 0x1f 0x00 0x11e40000 0x00 0x01
                         0x10000 0x00 0x00 0x02 0x1f 0x00 0x11e40000 0x00 0x02
                         0x10000 0x00 0x00 0x03 0x1f 0x00 0x11e40000 0x00 0x03
                         0x10000 0x00 0x00 0x04 0x1f 0x00 0x11e40000 0x00 0x04>;
        interrupt-map-mask = <0xffff00 0x00 0x00 0x07>;
        #interrupt-cells = <0x01>;

        #address-cells = <0x03>;
        #size-cells = <0x02>;
    };
};

Fixes: 407d1a51921e ("PCI: Create device tree node for bridge")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none; this patch is new

 drivers/pci/of_property.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/pci/of_property.c b/drivers/pci/of_property.c
index 506fcd507113..8dfed096326f 100644
--- a/drivers/pci/of_property.c
+++ b/drivers/pci/of_property.c
@@ -243,6 +243,14 @@ static int of_pci_prop_intr_map(struct pci_dev *pdev, struct of_changeset *ocs,
 		}
 		of_property_read_u32(out_irq[i].np, "#address-cells",
 				     &addr_sz[i]);
+
+		/*
+		 * Restore the arguments of the next level parent if a map
+		 * was found.
+		 */
+		out_irq[i].np = pnode;
+		out_irq[i].args_count = 1;
+		out_irq[i].args[0] = pin;
 	}
 
 	list_for_each_entry(child, &pdev->subordinate->devices, bus_list) {
-- 
2.43.0

