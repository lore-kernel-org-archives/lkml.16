Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E842E11D0;
	Sat, 14 Jun 2025 08:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749888810; cv=none; b=Gfbp++adD/fgAzJhewWXtpHwfD45TWMGlvzsqpRAFR7Yd0lJNg5Y8D10YtaQbHtc1FAA0CfGwhmYky+urU/0vhM0zBrxpjHLOSYKNWKXIUy8NqofcI4/YeSpylVpXow/3C0MOvE+tUjhAJQksEZMCxqfGyFr3PessqiL3gMKbNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749888810; c=relaxed/simple;
	bh=llglEbe1IKzATynDgyekVhZg6Wz9Ut1Q9FbAxtpJ+8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FvoGN3SlQwJohX1tKdmxkoLMO0l4HUNPBEEXus6kXb3XR9P4+upBGrzC+dfwJ51zgkVXRtdzznvg50BjBmpq6UY5/8j6uLm5PFdTy5TrisxB9yiAdFEDTjKwy5dopXK4Q+v5als5SeGOHj6MJDHwEbDdNKd5Ur3xSOUBkwUVbLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=enjWRwKX; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="enjWRwKX"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2351227b098so24354055ad.2;
        Sat, 14 Jun 2025 01:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749888808; x=1750493608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=csr9FmfIKsBQXGHzbBBq7oCudKRycvxUUNB9J2auubg=;
        b=enjWRwKXFTK/yvjztl+E4t3IhjRKBjWLKMRcoVaTwhwLNle5tAgX5LN3q7YiWe5r9k
         sX63CVa5pF+hQbz4J4WcvshplU+a5vjAyb/lafh6Qtbvl5dlSEHUDHsGRClK79kfRLz+
         YycIvgi2X160xq2DFte+Gi37E26NCJyWl80RklE9jPoCErHh5tg6EB2w+UiTycOh3wvP
         UNIbGaRrRyFZ2QKs/piV3STjWWJ4NtM6z3vZm36PlgJ2ktURCXzgO2tQght2Qw8am8tZ
         YQ43TAMYgOA6PKsydjrBjCfuqhSTsMJbMbheLYxavVnlx8vN1reEgqpYefNxXdpTkItv
         04pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749888808; x=1750493608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=csr9FmfIKsBQXGHzbBBq7oCudKRycvxUUNB9J2auubg=;
        b=PMOUDx7Wnj2j/OkW9KpzyF9POQuPbXfjjCnnvnw5OmoOQXU0dwj+Lz0UL630fqqvPd
         tJVYNBfxBsOzkccx4vOt4Nenaz6rO7JgdqrkSwrPuXbOzo8n7NeIHOYqW4EMwW7OLqbp
         XinOyCysqgHQ1Lxm0krcRTIzFNn6gopc/UiZl1lEVSPWAruaieN0Yr1hg0MnKwgL9TWM
         zbqVOLBYrFOTuFAND9NienS/1va354EesK94qWeIpXwFZW4HWMRInn0SWre3FqKT3f53
         QV2EP2QDGf5uKR9+8uBHkWteQeOfBqa6675Gi8IBsCvtrVHSSow/grXSjH4Ihf2YUVFu
         PW+w==
X-Gm-Message-State: AOJu0YwrLsD0np/I3TL5bfRrZDq90IQRo1CNQAXOceiui1nmqM308iCv
	wuv78yEMvYfo4QJIScs6pg8O6/oxheggHnhge6RSogqfI6dKlY7g4e8eKX2qm0TJ4ZA=
X-Gm-Gg: ASbGncsKtmq5QM4HPHrVVV40ZnFC+FNIJqEJoeqiOfQMPLRYzOoarD0BtW4zFUIeZr/
	ysPk3G/IU8XW9jbsJvQwNewTL9FFCQwEN+WnKDDETejdJxqTohBYGVAQ+L9kZxR5SMh63+S461F
	Yb3Bsum2gWJ95rpnNHhH/rhIhsm2J0ojBCDBeHGHI+nUSxF+B4fxUXSZOGXVYNWkcQTo4DWte2r
	eGL46MC99vzDtSpQSarwxK73j7u3yfqveiN1LY0CRmRA/7Db6EV5kGVv7GZ6GSzeweOXJkIAj+f
	qJwrg+4qLcypBfn/JuNyVnLUNDBSs1t8XIkk67Ycq/ilK6IXWX92WfeFOjzofJrldLN/dpJF
X-Google-Smtp-Source: AGHT+IHgXp3qMY/T0xTpNLwkJILbuetpRfSQISq9NlGFyqYXicJG+7XkeAaxoXRKJKo5bMh+qh4DFA==
X-Received: by 2002:a17:902:ce81:b0:234:f4da:7ecf with SMTP id d9443c01a7336-2366b316adbmr27207855ad.8.1749888807811;
        Sat, 14 Jun 2025 01:13:27 -0700 (PDT)
Received: from localhost.localdomain ([220.85.17.103])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de781b1sm26170055ad.89.2025.06.14.01.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 01:13:27 -0700 (PDT)
From: Eunsoo Eun <ewhk9887@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Thangaraj Samynathan <thangaraj.s@microchip.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/2] spi: spi-pci1xxxx: Drop MSI-X usage as unsupported by DMA engine
Date: Sat, 14 Jun 2025 17:13:10 +0900
Message-ID: <20250614081312.763606-2-ewhk9887@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250614081312.763606-1-ewhk9887@gmail.com>
References: <20250614081312.763606-1-ewhk9887@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thangaraj Samynathan <thangaraj.s@microchip.com>

Removes MSI-X from the interrupt request path, as the DMA engine used by
the SPI controller does not support MSI-X interrupts.

Signed-off-by: Thangaraj Samynathan <thangaraj.s@microchip.com>
Link: https://patch.msgid.link/20250612023059.71726-1-thangaraj.s@microchip.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-pci1xxxx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-pci1xxxx.c b/drivers/spi/spi-pci1xxxx.c
index 9112d8a1a0c8..e27642c4dea4 100644
--- a/drivers/spi/spi-pci1xxxx.c
+++ b/drivers/spi/spi-pci1xxxx.c
@@ -762,7 +762,7 @@ static int pci1xxxx_spi_probe(struct pci_dev *pdev, const struct pci_device_id *
 				return -EINVAL;
 
 			num_vector = pci_alloc_irq_vectors(pdev, 1, hw_inst_cnt,
-							   PCI_IRQ_ALL_TYPES);
+							   PCI_IRQ_INTX | PCI_IRQ_MSI);
 			if (num_vector < 0) {
 				dev_err(&pdev->dev, "Error allocating MSI vectors\n");
 				return num_vector;
-- 
2.49.0

