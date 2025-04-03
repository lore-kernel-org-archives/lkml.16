Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25212500DF
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 14:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743691527; cv=none; b=SCCnkHy/5JHBhXrOkFBRiFL+A26BVOvUlNipMiMfTCLN9mM48c8kLO3Tn6xbZ9/WNWeCoH9FZispJMFx2hXioR3zDijYra1QxAAa7vhDNIguCWUhBIk7yiwdDrP+PaHtCVFnH17YbtBiPzczE7N4UYy6FAMk96UMmfAMcZ7VZA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743691527; c=relaxed/simple;
	bh=pN/3K0c07mgtPTRPXPCJpX/AGnbpoFURyIzTH/nlVaY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SBSF6+o8YwjED+sw8icy7k5hoNas6It9AgQcejMgjM1MVdVEJB/DafxOHBWm8IacCgkxjRDlYr9Fgv27TXEpYK4+M3n42oBcVD25KNTE0tG8UtKyGVOJIwDHBN5P+9rOIVeJeKYKuh7h867b4LQqiVdFPERdqt/PZC74+ZCMsS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lrszz3y/; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lrszz3y/"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so7531115e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 07:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743691523; x=1744296323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9r0/g7jMkIS31rWPP+0eYALjsbxAMAbdDJjBS2LpzoY=;
        b=Lrszz3y/0lLO37p7rjDsFPpQs3bw6oMcMBFvIQB+pEIZvA2rrlvA9s/e7MZ+tGTomC
         6mUPen5QASJ8om0J+ZCLJhiPRpmHnGOZN/ZI0yyd3vAOvctryAHEhNxxcUPX14bmLT2E
         Ky4ermhs+ysh4KpmURDFsv2osldrIsc9UW3EGigDgGdQtXKR+gn7wl/d5VRl/fqzmJbG
         2eeF/kCivJcVIdgN2dwZpf/EiQjkoXplE8PlRFkmD56JAIKp5kkzDiK02rkzsBLhfcUm
         YsJ5mlQ7qRRWMVVRAMXifwiWQ5rlAGTtrS25mmWoD81DwzcpJ0VdgAA6IZQaLJIPUxsZ
         lebg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743691523; x=1744296323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9r0/g7jMkIS31rWPP+0eYALjsbxAMAbdDJjBS2LpzoY=;
        b=kmKoe7UDI1QdhVJOLUivTW52rj2v+izd1KltokH2erfH1DZec1RW1yo29mSU4fXR6o
         h6j/t+2GROFHNfxNCRJShBLdg5CG4Fx372W0zlD6aLvHCQLXPnR5VqLVtL5hGq8gJWMX
         3HXq6+gX/8eYc7+0bu+uu04Yr9jl+ruUhAuJoYDSIsx0FdOGHI/oiw9ctIISrK0XWsZT
         WOH0hxp1HXIpknJh+bEeccvkADpCf+c/zootS4TnOFRWaasvU+KljdSOdS8cfuVWfejy
         WPYhJCFAJDzHL8HThOUHOfkhZRYW1La4p+C5tfea13JtlHcjWIIL2Sdqd5Gba6Kp9p6J
         +WSw==
X-Gm-Message-State: AOJu0YzLxPGbhfxPnnB4T35J2IV8CkhQjM2s289M9wSG/bjXz+kTtCNi
	weBTZXz5EWRK7pJ/1My7weFthSe2FBAAhdvdHTF72bPLNIBtZvQEvSVtnG6NTnH+Gx9GJPtImhq
	7Sr0=
X-Gm-Gg: ASbGncvo1HERp0bnx46FndU/m9AnlpndvNbpZabRpMnL3LSUhA9rcZk591OfW4bc7oE
	V6pJ7eFSVJfLQbLSQ1U4de4GUhsEMPLNKgqBRpsm79Ec5HJclKOklzds5YjMWzzXlv4crmteruf
	cIjMyL4X/h7l2PyF9uv2Vz0T3qy59qQh92UR68Uo4uNJMf1AyyjwZpDfis1KniGXh7r1kXPGrJM
	aUJF8FpfGcErL17s+65DCnylChroKv1qPM2eV/KPLc4MW8y7t4lFL8inFq9hkL6VmWkXnFgMK5Y
	RrLQCZ0tOGhLA4Rb8DJTyls+uTTtIIijDUeW1NgtpnIbSOrbr2ttE57lT64BkYDvAU3V4g==
X-Google-Smtp-Source: AGHT+IGruTH9Dv/rwifz2YwU8yxpPKuZ/RpQRWyxBaoGZpvsUk/RyXjU/itW/UwthJg+CQNE79HSuw==
X-Received: by 2002:a5d:588a:0:b0:391:3fa7:bf77 with SMTP id ffacd0b85a97d-39c120e3519mr17418153f8f.31.1743691523139;
        Thu, 03 Apr 2025 07:45:23 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d661sm2044374f8f.66.2025.04.03.07.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 07:45:22 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 04/13] nvmem: rockchip-otp: add rk3576 variant data
Date: Thu,  3 Apr 2025 15:44:52 +0100
Message-Id: <20250403144501.202742-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250403144501.202742-1-srinivas.kandagatla@linaro.org>
References: <20250403144501.202742-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1278; i=srinivas.kandagatla@linaro.org; h=from:subject; bh=3Ys4IkX8eCFRNDyZ5cOnVGSBTrGSodl3ymtNu0NI9Wg=; b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBn7p7izrcabPVsgwcqQzznbddwl7Md0kDIrrWvM 52dXNcO/WyJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZ+6e4gAKCRB6of1ZxzRV Nx6TB/9Lw6/txzgETuJT+ceFi9jMm5UiPtOprJrfirdxGcemA2ER4ZtO6sKwQQVXqj7ZOBE3UK/ DzTO9v2EBLrotQi9Oai5qmCJEwzb1aXwMvga6sS+WpEkTg7/7IRoVKC6ycYsMcB6D7XeRY+nRrN 6BJBDnzpCPrSndb+5wXytkCmXv2DAsilP5BNTay+c8TXG0ZzJ0Y0xphlSpZstXgf6HirW3ZEH+D G8G4/QibUFw2vo/NcE+33bf6kWnJXMXNNDAUkEIy2oBQk2Az+GI7gqtpNgJj+Z9PBbkHL8383mw MYQwP3NIpref/UdH9p3tSZ3LCxD6DArw7nW3ePyeAgfBBuE6
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp; fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Content-Transfer-Encoding: 8bit

From: Heiko Stuebner <heiko@sntech.de>

The variant works very similar to the rk3588, just with a different
read-offset and size.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/nvmem/rockchip-otp.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/nvmem/rockchip-otp.c b/drivers/nvmem/rockchip-otp.c
index 3edfbfc2d722..d88f12c53242 100644
--- a/drivers/nvmem/rockchip-otp.c
+++ b/drivers/nvmem/rockchip-otp.c
@@ -274,6 +274,14 @@ static const struct rockchip_data px30_data = {
 	.reg_read = px30_otp_read,
 };
 
+static const struct rockchip_data rk3576_data = {
+	.size = 0x100,
+	.read_offset = 0x700,
+	.clks = px30_otp_clocks,
+	.num_clks = ARRAY_SIZE(px30_otp_clocks),
+	.reg_read = rk3588_otp_read,
+};
+
 static const char * const rk3588_otp_clocks[] = {
 	"otp", "apb_pclk", "phy", "arb",
 };
@@ -295,6 +303,10 @@ static const struct of_device_id rockchip_otp_match[] = {
 		.compatible = "rockchip,rk3308-otp",
 		.data = &px30_data,
 	},
+	{
+		.compatible = "rockchip,rk3576-otp",
+		.data = &rk3576_data,
+	},
 	{
 		.compatible = "rockchip,rk3588-otp",
 		.data = &rk3588_data,
-- 
2.25.1

