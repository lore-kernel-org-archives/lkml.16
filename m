Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434472E11D3
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 16:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750781189; cv=none; b=fvpg5HWBK/yRdl3rUZCHZu3PkUBnc1ZBkdqfwe2x9GGvKRTmi6hoh+Lt1KCGLZasMRm6c96r/g2akWiVbkBvPGU5Smps0p5AGQe5FUN9VKj/0QRO38TdUwRD14PXZ0xY/2Z1I1bARxpPTGtqbfipgpsEUi+1+EWAjaDybeudJzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750781189; c=relaxed/simple;
	bh=ksd+r9cixP2JpFRZLh5NH/QezogKKzVMrSYSuaXgros=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g3yDcH9ALtsJOL9tS3iCQP84ijL4PzO0cywhMdzruoXU2+RETJUjrZ+oRs6grAYxNPaPT1w6dBVHblY4puI2PxuP1oskiKoaOucjlxklud3086gsnXqbpMwAYk1tgfHKzneb6UxFkYus1BynIX2TY+Adj2K6tky6rPA+sWWS4TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=WEXrj4bL; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="WEXrj4bL"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-450cb2ddd46so4248755e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 09:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750781185; x=1751385985; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mkw37E8JWs02brQAU4juDlznrN1By33E9feiEVoXMro=;
        b=WEXrj4bLo9SDMW/BgJSeqVjtWUb0IIC8wVQr3W+WTr4wHhdyf6kbd1GocXJaAQH7i0
         xA4nJkwAn8C9wSAqkqbE7/cGGfSMBiZqb6/UP+8DUIB8PoPlCjIX4Q1HWN+5SeZ/6KbV
         WPmQ5bqUcElpLsIrG1yd/Pty4oRSK31UIWe1O1RTWb1FPUVU3dnxZncjGFIroREPGMSw
         TVOFboa/Xzy7hHkDdfjnsnxNSZJ3LKxV7o14/Xnov8Bgc4m4rtAkdLpqQX9u6Zx/s320
         CMGTAutV1sG5PqAeIEkwDw4C4RMVMdey2vU4tQeST97KjKlz+4SXmMRz0RiQ5fluD0Qu
         cUmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750781185; x=1751385985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mkw37E8JWs02brQAU4juDlznrN1By33E9feiEVoXMro=;
        b=ULlDg76z7zs6BLnFMdJEUVkQmweexrwH0d4uyu7EwXcPqsOzrJODrFQuFZyCf99KEU
         ihS4RVnEklkDGLJnGaUFJqvZnvapGVkQyl5nH9nz/oDq5fDaFFpXy2NT+X/z9nGdZpPe
         Yg1jvpqQag09seZrIZUrwrxame9pVlr8wC0QdsbjjmHQb3OXCVCvCqIfZtTmhnRl3xgF
         Vye5UDZzfLkKutbVGqzNtsFQYc0hEoXRgGiXogzzAJoqFfwtInVQqE0sVGLayAmBV1pk
         Ax6Q0II9gtTkfi/OrgokA6KZ3ayF5bkbvaW0Lw9zdaUEidW/A03rlkS0zoj3hppkGUVj
         4w6A==
X-Forwarded-Encrypted: i=1; AJvYcCW2ltp6RMfcGDMM8633Lpxyr388iF6C1sWGCx803lD1VvkQ8HIK6auzdfTQtQRNVmKXGYaSdstdJovHtqY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwabBu/xljv7vrrGTu9oTOQx8XHMAJNonCIFU3KJjPOkTl47uDl
	UPrLm35i/u0BP5iCccLziA98wYbnqpiCX4DqpQMNu1VFYNxz8tfzTPapKgoXaBTcM4c=
X-Gm-Gg: ASbGncusq5psBFXByQA/fYU2s2p0nBir+HDDpmEFLp/3w6KvY/gmKJhAX8aInlMnIPH
	JxrCy8KIeDgHJvB5JJikzQ+PR+gGl9BEGNDUirvqYSxJqoGqoDm6j2xjCIbes1d42jBS3QMQstb
	kAvoun4CXdYfA9PlWSI5l9PBT/04ajxag64EKPilF9/YiR5ydBN8oSxm7Z2pnwpLUdNhhWPuAmX
	BsZy43XqmE+ZiXQFUE2oIrIwY2OhPMMUzgEAV2fjzgjz+nyUN9OJmG2v/UF2ojUkIU9+o45efcr
	UKnrAvv4iAU0eCMQLWkGYBv9TGxsrNM3EyzTUZ5tDDVVfIJmL12yBdpTGsDIo1oeGaY0QwJKlZZ
	lOKN9Syw0cJM=
X-Google-Smtp-Source: AGHT+IEhQzGC8kExWFQeWgM/yDeL09UAxr7lNw3qqiK2IVc702o/A3qxsPe7x/s60KhVtq/Z48a/wQ==
X-Received: by 2002:a05:600c:4fc5:b0:442:e03b:58a9 with SMTP id 5b1f17b1804b1-453659edd23mr149033095e9.25.1750781185514;
        Tue, 24 Jun 2025 09:06:25 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:9dad:c694:2b52:ea7d])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-453646cb64csm151933805e9.4.2025.06.24.09.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 09:06:25 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 24 Jun 2025 18:06:17 +0200
Subject: [PATCH v2 2/2] NTB: epf: Add Renesas rcar support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-ntb-rcar-support-v2-2-8c0e5cf69c4d@baylibre.com>
References: <20250624-ntb-rcar-support-v2-0-8c0e5cf69c4d@baylibre.com>
In-Reply-To: <20250624-ntb-rcar-support-v2-0-8c0e5cf69c4d@baylibre.com>
To: Jon Mason <jdmason@kudzu.us>, Dave Jiang <dave.jiang@intel.com>, 
 Allen Hubbe <allenbh@gmail.com>
Cc: ntb@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.li@nxp.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1326; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=ksd+r9cixP2JpFRZLh5NH/QezogKKzVMrSYSuaXgros=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoWsz+tpfrxfKmcVzoE4RqWgZDMGhoyDP6ic2R+
 /FiP9KOq+KJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaFrM/gAKCRDm/A8cN/La
 hVD5EACoPMsRVtwtBSevpYMpzypxnVkVwkz7kmmvOasvLnrxvYooXYNDy+/+XkcpX3OclE2dEmY
 0+RxsR9Hwpc4wCDzxSmozDy+cAcdVV8zuiKJ4se9WiFzWEFCeOGCiXJTco6mZi86hVdWs/jrAgJ
 5Ps/XixjlDgPldUfiE2nMrflGL1wC20daqiS5G4kla7aZ+FuS8GfGcM/ZeLnP8iIfASF1AMgcWs
 4ljdzyobJ5KtrTruf+X07ArVG0MafAV8+87Z4cUQbit/bo4IC4k6aag4FHX+YDDlLxQ7lzUf7h+
 Q/L+YgVrrrawNzTP0l9K9sFFbm4p6FTsK6mTt70cO92UZszCjLjxGYklov+hnkuq9zd7Aj/Pwek
 VVGweKgdkLZYnEMpWWVLJCPNtb5smtsyrHqxegJlD3TNQvjBwolr11/+uiR1z47FfeTG46kgLwg
 0jhO6fnWEZ8DR6UeAmX7AcTRrXbCZHDhgaAKCIOKR3NPpSl/3tu38ZoHuhn3lUEdT/HlXPcrUcW
 h7o0gVFv/1CqVrYFer+Ej2fLuLnhI9KjvVhrF2lLvJ2YAqZNG/8ryMGEfyh1npPyFEBFXuQY/TK
 ZUL68GxzoWUvDEswVkyKLQiZ50V+rbYXcVrsDbI4DDV8fYkUFW9m3WCkHApvvZn+JZjHG4ceNsw
 cQ+O0NtgKQ5y7HQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Add virtual non-transparent bridge support for Renesas rcar platform

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/ntb/hw/epf/ntb_hw_epf.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/ntb/hw/epf/ntb_hw_epf.c b/drivers/ntb/hw/epf/ntb_hw_epf.c
index e8eb3adc6cecd2d52235a3f0b6b5a59ec58f1d73..97c9ed7e4dc27dabd21d3f083cc70d55bb280df8 100644
--- a/drivers/ntb/hw/epf/ntb_hw_epf.c
+++ b/drivers/ntb/hw/epf/ntb_hw_epf.c
@@ -747,6 +747,16 @@ static const enum pci_barno mx8_map[NTB_BAR_NUM] = {
 	[BAR_MW4]	= NO_BAR
 };
 
+static const enum pci_barno rcar_barno[NTB_BAR_NUM] = {
+	[BAR_CONFIG]	= BAR_0,
+	[BAR_PEER_SPAD]	= BAR_0,
+	[BAR_DB]	= BAR_4,
+	[BAR_MW1]	= BAR_2,
+	[BAR_MW2]	= NO_BAR,
+	[BAR_MW3]	= NO_BAR,
+	[BAR_MW4]	= NO_BAR,
+};
+
 static const struct pci_device_id ntb_epf_pci_tbl[] = {
 	{
 		PCI_DEVICE(PCI_VENDOR_ID_TI, PCI_DEVICE_ID_TI_J721E),
@@ -758,6 +768,11 @@ static const struct pci_device_id ntb_epf_pci_tbl[] = {
 		.class = PCI_CLASS_MEMORY_RAM << 8, .class_mask = 0xffff00,
 		.driver_data = (kernel_ulong_t)mx8_map,
 	},
+	{
+		PCI_DEVICE(PCI_VENDOR_ID_RENESAS, 0x0030),
+		.class = PCI_CLASS_MEMORY_RAM << 8, .class_mask = 0xffff00,
+		.driver_data = (kernel_ulong_t)rcar_barno,
+	},
 	{ },
 };
 

-- 
2.47.2

