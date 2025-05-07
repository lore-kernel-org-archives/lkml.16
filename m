Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B800D28136B
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 12:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746622246; cv=none; b=LW1SUTF1YOt6wcvorxqx1vhy2Eu/qqSuU6X7paFZlhtZmSTJ+pj5Hs6WogG1YVIP4hPOeE+3lCPrPpx4J/rfIOp4ZN32/653JT0GaPbzI3J5VENzKJHXLYZK4Z6g07zYxaTVUJzXz29iEE9Lf9Wc+D4KgvvvpUMkr0I4BllDHpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746622246; c=relaxed/simple;
	bh=NNbI2mZc7orPCD96orrUtGmro7jcN7TH/vdaWXSEFkc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AvFwwK4YEH/ehTweNt2c6Cj7K0+XpUOlRBwiUkE36fFmips2vjUpXz1LhuHaIpFysJ9IRv36hXGo64Rgj6iBsDYcPLJrMQgxAzQBWVOII3Zkd5tNFJ0Bnst/06Jtxw8b/dVkbhuyxki6RnL2p5hOBZWUlhpLc3ma9aRX50DUIws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=aINOKAg1; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="aINOKAg1"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ad1f6aa2f84so55782566b.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 05:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1746622243; x=1747227043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TPcRXEDFKMfOBueOV1ZZggEMaCzz9uMyyXHjT+cR4Zg=;
        b=aINOKAg12P7aT0KDfpvr4TYz1todh2ccAr3rMKqqx5DEVwdEiDgNYU/Bf6ZOnsP6VK
         fezUWRbWeUjcy6xj4EM+v0bmi4zKOAWT7/aJBZrREVMwSn3XypGztXtIOc/pLIX32PUu
         Vm/8eEwWVr5nH7Nv2YBXfGyyHh/iLRXCQQ2FCNDFNP6k4siM762/0CqRi6nTh74Z1Rqb
         aocClaXrViap9AfDFaI9WMRTnfOD+AJqlKp1r5e3j4lOofFouZm0Xy0bU6kO5Hw+yinY
         g8QicAR7wRyCKhtvr7ixQ/oMEg9ys8OYLT/w9rjr2DiMo6b5xxoBmebcRnl0BXTXy+hF
         PtrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746622243; x=1747227043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TPcRXEDFKMfOBueOV1ZZggEMaCzz9uMyyXHjT+cR4Zg=;
        b=uN4fR+kEs7S2SjPVb3Un9qMva3FbVF0srOlNoUDfvcLJLJjxFEnWgFTjm7qp5zmsMs
         olShtN3TA04InZOiW133vRnsLJ9P+KLJBimELLJbu6om2dBK6e+3rBITeg2q/8AIrNU7
         EOCvXanQXj+PnbSBDX/sdn8KsnJRqVcQU9aLQUg2PsCbBzQvQKzzcqhsKhFR8hL2Tch7
         OqwSN0SNyNrlRmW1/D7LA8plexBFgA94ER6J2MbLEr5cLasMMymYfpc7XjPULP9wWwAS
         Fm2Nmh3NicDSwjz0p3sI+KiBK8d2BD3RAmOUGGOHqm2+uajanLxaHAXTYH/oJ4dfOGCc
         ADLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGgTTkxlvkqcYlejUpNqlrGcfYWACAKgFfhZ7qAL5ua/kV4WdxhaJ+EZ/NPL4EyFRc8k/VLwkXc2YGTYE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrvVviOY6z7WsmqixvlapCEpWlNCrE35BKAX+qzqNqzf8CAdFF
	y6cHy5jRRbPNhTmjjPaPnorMBpa45FoifuGFvmzlIBsbxu63VTkKfyZ7MH83V8c=
X-Gm-Gg: ASbGncsNEOBQoajLbN6z0/9Mdohb8L7kOXkiXdF1QHR3H5O7XvkwURyewAGqXbfi63U
	7MldMl8hW9N83gaIvdXbymm74otNuJOu3jAluaNOtL+g/JEjtO6CD2DHcTTd76QjxvZsPS4O72z
	c2RHNSZCWrS7x+oNeP1cgfXoLh8VW/+Dndr4O9r/0i3R4j1nE80VBGf6nsHPrZBlrAixBKnRgB6
	fF+wtoxLFlzcr2svM6VnEMY+Lu3o8FC69j0A8n0z5dLRLQbSuJFVxUBKjpALwFug38cDUV7lJGr
	d7fGSGHxvVhuQ6LkkApqyGauSX758uhxxe5atSiLgJfedes+YNU/UWzv/K6R9drzEN18y/Q=
X-Google-Smtp-Source: AGHT+IFgr60R6EGG/hfv1qbucadH38+M65/DG+xuJSaXMntsG1skx5u3NWADh8GI7FcyDwNsoxp1ZQ==
X-Received: by 2002:a17:907:1c9c:b0:acf:877c:ccc7 with SMTP id a640c23a62f3a-ad1eafbe4f6mr342734766b.13.1746622242991;
        Wed, 07 May 2025 05:50:42 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.147])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189146fb4sm913182766b.10.2025.05.07.05.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 05:50:42 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: yoshihiro.shimoda.uh@renesas.com,
	vkoul@kernel.org,
	kishon@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	horms+renesas@verge.net.au,
	fabrizio.castro@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH RESEND v3 5/5] phy: renesas: rcar-gen3-usb2: Set timing registers only once
Date: Wed,  7 May 2025 15:50:32 +0300
Message-ID: <20250507125032.565017-6-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250507125032.565017-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250507125032.565017-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

phy-rcar-gen3-usb2 driver exports 4 PHYs. The timing registers are common
to all PHYs. There is no need to set them every time a PHY is initialized.
Set timing register only when the 1st PHY is initialized.

Fixes: f3b5a8d9b50d ("phy: rcar-gen3-usb2: Add R-Car Gen3 USB2 PHY driver")
Cc: stable@vger.kernel.org
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- collected tags

Changes in v2:
- collected tags

 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 118899efda70..9fdf17e0848a 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -467,8 +467,11 @@ static int rcar_gen3_phy_usb2_init(struct phy *p)
 	val = readl(usb2_base + USB2_INT_ENABLE);
 	val |= USB2_INT_ENABLE_UCOM_INTEN | rphy->int_enable_bits;
 	writel(val, usb2_base + USB2_INT_ENABLE);
-	writel(USB2_SPD_RSM_TIMSET_INIT, usb2_base + USB2_SPD_RSM_TIMSET);
-	writel(USB2_OC_TIMSET_INIT, usb2_base + USB2_OC_TIMSET);
+
+	if (!rcar_gen3_is_any_rphy_initialized(channel)) {
+		writel(USB2_SPD_RSM_TIMSET_INIT, usb2_base + USB2_SPD_RSM_TIMSET);
+		writel(USB2_OC_TIMSET_INIT, usb2_base + USB2_OC_TIMSET);
+	}
 
 	/* Initialize otg part (only if we initialize a PHY with IRQs). */
 	if (rphy->int_enable_bits)
-- 
2.43.0

