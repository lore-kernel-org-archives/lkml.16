Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1238D189F3F;
	Wed, 30 Apr 2025 02:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745978999; cv=none; b=mZU7B0EsC7xl8vyyBiRUldNJ0DlrTj0xYaDFR0c4hTzpcxQlcAotwJphsNTlD5BYk4DxM62xjBOszggDWYRr2tJjoc90G0QEzvnFFAt4hI4Mf7rAJCT/URE2TvVv1vxP6Ss9NHXC1TfLA9XnMwV02RzhI3lOXOsPxONxBJM6uD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745978999; c=relaxed/simple;
	bh=rHZyAGawD256Mc7OhUC5e3SWZv5HoHrgkWORlP1eX8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pML6J7DKQvMT5nBGmL2ILy9DPfCUKYhgKGscBrY4FcD4kue7LYU1Mro1hoK1obc70Q2idN+/IDCORbOfprW7mvkwCp9vkzqAQBj0jU7D+Be5upPNuFcCqhqKuJfI3hIi8y3NIb0xiaYCt4YUAYTdlRik4PrflGI49jP0HQWQbM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=COOiGzAW; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="COOiGzAW"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6f0ad74483fso76305536d6.1;
        Tue, 29 Apr 2025 19:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745978997; x=1746583797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YGoCd7OSsBB4HtUz1a10Keba+9sPV43ld/cxoPbEVBw=;
        b=COOiGzAW0sqw7Vnc7mquWLdT0F3mx1SDgmpVXmZbbuXiGZQtcSF6DJbk2t3/NaKoqZ
         xt0JXIeYds4iNucseOQdTX9SFa+XqGmkfyiHUsN36tS0+fLeQ62cqAN8ZFJtpcbgvxjd
         pJ3Mk9Po2+vFiifOr9TjhN1MV4mue2FdH3DwcMZvFCJ5eZfO1SjIBbdpuswOXXVw5EQN
         Rf6NjD7Szy/csmO0BgD6fDLzzNS0cbHXcf7YuIt9XhQVPGGwyqCDCO8JLSfIYyzEKVbl
         flKOpHeHinM54SVahk1rZkizbytItawxDvWdFpVGDXHIQ12q3lzdTwRsF2x1ybrBGE4X
         /ELw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745978997; x=1746583797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YGoCd7OSsBB4HtUz1a10Keba+9sPV43ld/cxoPbEVBw=;
        b=LYVepRnDICasCnEZg6RwuQ+96QnnvQAf7LJlL4U7qpBxzKXBilaGNL2xWGzPnGidR5
         kL5+AzS8GdfCsu3W2DgfZPF5v6JWBd2LAAjP+rSahrtTHd++ZaXLc66/7qBedgyt43Ty
         iRDJI8PBgApS7xmg0cnfFFcyVhYURmFw1m6XPmbn1OzNq0RmuDEraDU/5KBMaaRxh9C9
         60jmB9KqXw8CQtnpWf4atZzVjqYbzECrkxnAVkfm4sxdG9d3SAnou67Iu2+I24zrM3cS
         e9kr+QHrZFKl5wd+ffeE1pBACukeyOXNAXuIKl8RvPMipCG5pah09gzZRBKVShkgN8nZ
         shsw==
X-Forwarded-Encrypted: i=1; AJvYcCUBOiw+/r/nWrgkMMdDqCMod+zj9jEk8aR/rBuyS0TTNPeyECjNOyhpalQ3bIAZlJrp3RRysQfzfAoDCm8u@vger.kernel.org, AJvYcCVBWgejt8ffKEKvgY5n7FFMD2fu+in9szy0wwC3CXO0G1p1RDPZw9HOyYeXtMk/idIGUh7KIQD/onvE@vger.kernel.org
X-Gm-Message-State: AOJu0YwykUDV0RxTesTRjdTU1ktnpkKAiakjTQnV0Cpa35EqaTYaBDjI
	cD1Y8sAItZlRykyQfTNO3Y4wtvXHZkKcfj+WiLJtGRkFWPhAmIeU
X-Gm-Gg: ASbGncuYhnW4k/jRsiOrvYI+z2GRmNFpaOyWl7yhKu9Kp/iFv6wrBtpJeVlVfNTd2iP
	i9l3a2q1mAOy9op8IcK25j3Ggb0UH2FcwuGmNxsXZCIlv79r+Mr7AJMDHR+z0YlaQR/2NCUUCxQ
	gXIkRs9k3jiHuViWJW2CdrV8afZiakgTiMR8XRXR7IajuN9nJhIqAdDSupjYiPHo4nQBObcCY4g
	qv8jnaeZnt4Wb1mz9NBoocFCi85u9hCkXaLh66YJex4RFW4EZmS5GixWD5e4jfSI8GwHgVVtahQ
	8k4f+JNTBcy4lgHe
X-Google-Smtp-Source: AGHT+IHQemqa+wENz6ss6VRn1kahd8zYA9nlmzIMb5bTDRj/D2NDvM3mr37ZArAISihcQ9zANLGDdw==
X-Received: by 2002:a05:6214:5096:b0:6e8:f8ef:d659 with SMTP id 6a1803df08f44-6f4fce5d21dmr30912426d6.10.1745978996814;
        Tue, 29 Apr 2025 19:09:56 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f4fe87df48sm2764316d6.120.2025.04.29.19.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 19:09:56 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 2/3] clk: sophgo: Add support for newly added precise compatible
Date: Wed, 30 Apr 2025 10:09:30 +0800
Message-ID: <20250430020932.307198-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430020932.307198-1-inochiama@gmail.com>
References: <20250430020932.307198-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add of device id definition for newly added precise compatible.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/clk/sophgo/clk-cv1800.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/sophgo/clk-cv1800.c b/drivers/clk/sophgo/clk-cv1800.c
index e0c4dc347579..e10221df6385 100644
--- a/drivers/clk/sophgo/clk-cv1800.c
+++ b/drivers/clk/sophgo/clk-cv1800.c
@@ -1519,8 +1519,11 @@ static int cv1800_clk_probe(struct platform_device *pdev)
 
 static const struct of_device_id cv1800_clk_ids[] = {
 	{ .compatible = "sophgo,cv1800-clk", .data = &cv1800_desc },
+	{ .compatible = "sophgo,cv1800b-clk", .data = &cv1800_desc },
 	{ .compatible = "sophgo,cv1810-clk", .data = &cv1810_desc },
+	{ .compatible = "sophgo,cv1812h-clk", .data = &cv1800_desc },
 	{ .compatible = "sophgo,sg2000-clk", .data = &sg2000_desc },
+	{ .compatible = "sophgo,sg2002-clk", .data = &sg2000_desc },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, cv1800_clk_ids);
-- 
2.49.0

