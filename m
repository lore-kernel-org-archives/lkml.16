Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938B921D58F
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 15:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747235503; cv=none; b=Ck6CB6zfqM3Au7Dh77rHrsiTp+iLXs7CEnhJBflpJghADXLP+Or1Y10FRrGKtMD+RZ/UpFl5I/E1A57lhqeJFQEtWwAxe13KN5IryDf++qtV7EalxFJKgzzinMHntdOvU/nQgXldAw1y8pJHHv8XkkGv3d1d15Gi5AU7eXCXlXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747235503; c=relaxed/simple;
	bh=4u/NS1smLHkxhFeUuEbvCE2uMHuDJkj0RIsb2N/7OBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CDJbG+fyT+6/E+qTRgQ8chymbuy+WxOEdjmDZouDUoBJz97HxOSKPVBAvD9GnHYgcR2RrecSWFwsKStfXljDDywL9eZNcR58BsBaDM22L95ZNE4pRXvJ2kHybIgek4jdsyQw+am/PKK4iK8kUhRJ6Ng0wtuyrYLyOJu/l8o1gSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SOvW8FT3; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SOvW8FT3"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22fa414c565so54014255ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 08:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747235501; x=1747840301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zin9UdB1kGHf9472t90ClCu+DsenV3gklPBeEhXFkBk=;
        b=SOvW8FT3d4LANFtjcKwButycoGew7xFHKVAAqC8upyNJp1g/mZoJUO16d8/37oCpc2
         Uc9MIoJHoD9glkhRpEnoP2uMt2vqcGU8Cw9NtDQaJi2TTZ3fgUD9ya6+NeIE69sMvBoZ
         uHJ4n5zySWhnFjZuzAa4yWcpy4r0N5xvAxa8iFPuM4RfFjHLc3nKURh1CHFHzd2MGQ76
         j1WMT/DbDNzm8Pyn0BbZLPUJh/PsIVIBrZi6aaJqLKa7zb+rGsY9HrkoPLu30bAVecb9
         o4S15sFxkyprbRX3Dn+gL+jh7PEPbF4kZDgpE47owaftnKNFI63PesoJyjj9oNXIglA9
         kw+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747235501; x=1747840301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zin9UdB1kGHf9472t90ClCu+DsenV3gklPBeEhXFkBk=;
        b=iF6H8qoJqkzNuGVNVR7OrWiNMcqKjAME1cEmvCFX54SHLU2ZDFRvAf+St0OxsGzgEU
         27jDeXhWL6ZizrdCa3QBvqqNYV2bQF+coCV1y0CsoZxN8JTsRaDauZ4226Hs+A49F9nc
         +EAsbBxCEhXs6JfZPk9dp2jPXGf+HRp45I5Pjeh6/ebI/PspiCJvioXf+tvkgJkuxqio
         6jyc6ua8ZbgpwfJ6oCPwpae6tfRfpHlQZWFKXbq4oEug2fEkl84HAykVXCkmyW5pSPa1
         nEONJQN4EUYUlpI/FJvJn7TBnlQkBp9Atxn6AUJWK/ME9TNUimu5XdIGpOXhf75ggnel
         2w3g==
X-Forwarded-Encrypted: i=1; AJvYcCXH/RPmw6Ym9MVZy2ynCwgAGse/nNfeYs7JcgEN/Jy7pBQNPFWaMQ1RtQOF8cuxbeahkAI/ub+0Fm90x2U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzM35O5qyDyD83NpEerCQrWBstko2+VYPxvtLlMU8RnD3BlQpCd
	5X4n8R8ug4uyCUBFsKzXrJtfcClug1cyvTQbgcZOldyDKIP0zCv2
X-Gm-Gg: ASbGncvTzdDrNOv4WNZlPAGA8pGJIiSGI8WiItwVOL/QRRVOOw6T4NgWICYaYl0psHa
	Zcr3B1Kac3JIJuqAMzh+e6NUhFlOgBFgE2G8fLxxQTZ2ksy2R1mmtOrrzUu7t99OfGnHChDV7Tx
	xBXwhnA9kBj7Ja1YkDl9Rm5e6zGKF0A3onRFpi4gZeQ8pBsHsgZJ5G/KuNcT1Mj4WOTYO6rDAbE
	T9L0gAW++vhXN+b3hYBnZYusQJD1/i1D/PN54zGJBlMbnAUaVwjt1haECaIlmUNoQxL1o/ZoZar
	x8PujnoSLj1T7Bins2kNBKnt+uzcrkrLH7jqj6pql228loOypPbSz00GIxXLHGXeoyBMnxhvwNS
	XYLwR
X-Google-Smtp-Source: AGHT+IGQ88drE0lWsNDyF4V9Vy8xJEiVqRdDdnIX5NlkZpbH8m9mBlqKat4+TBTu4eQ2Nf1yk/MQ3A==
X-Received: by 2002:a17:902:f647:b0:215:9bc2:42ec with SMTP id d9443c01a7336-231983d06d8mr50986825ad.47.1747235500628;
        Wed, 14 May 2025 08:11:40 -0700 (PDT)
Received: from ilya.linux (M106072195001.v4.enabler.ne.jp. [106.72.195.1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc829d668sm99836795ad.201.2025.05.14.08.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 08:11:40 -0700 (PDT)
From: ilya guterman <amfernusus@gmail.com>
To: kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me
Cc: linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ilya Guterman <amfernusus@gmail.com>
Subject: [PATCH v2] drivers/nvme: Add quirks for device 025e:f1ac
Date: Thu, 15 May 2025 00:11:30 +0900
Message-ID: <20250514151130.701885-1-amfernusus@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <0250510102130.14710-1-amfernusus@gmail.com>
References: <0250510102130.14710-1-amfernusus@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ilya Guterman <amfernusus@gmail.com>

This commit adds NVME_QUIRK_NO_DEEPEST_PS for
device [126f:2262], which belongs to device SOLIDIGM P44 Pro SSDPFKKW020X7

The device frequently have trouble exiting the deepest power state (5),
resulting in the entire disk unresponsive.

Verified by setting nvme_core.default_ps_max_latency_us=10000 and observing them behaving normally.
Also by running with the patch couldn't reproduce the issue after multiple wake up from sleeps.
Running without the patch again reprodcued the issue on the first wake from sleep.

Signed-off-by: ilya guterman <amfernusus@gmail.com>
---
 drivers/nvme/host/pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index 1dc12784efaf..03a64bc77f7b 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -3734,6 +3734,8 @@ static const struct pci_device_id nvme_id_table[] = {
 		.driver_data = NVME_QUIRK_NO_DEEPEST_PS, },
 	{ PCI_DEVICE(0x1e49, 0x0041),   /* ZHITAI TiPro7000 NVMe SSD */
 		.driver_data = NVME_QUIRK_NO_DEEPEST_PS, },
+	{ PCI_DEVICE(0x025e, 0xf1ac),   /* SOLIDIGM  P44 pro SSDPFKKW020X7  */
+		.driver_data = NVME_QUIRK_NO_DEEPEST_PS, },
 	{ PCI_DEVICE(0xc0a9, 0x540a),   /* Crucial P2 */
 		.driver_data = NVME_QUIRK_BOGUS_NID, },
 	{ PCI_DEVICE(0x1d97, 0x2263), /* Lexar NM610 */
-- 
2.49.0

