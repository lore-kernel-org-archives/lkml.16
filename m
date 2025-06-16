Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 074161E3787;
	Mon, 16 Jun 2025 07:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750057577; cv=none; b=JG+lw3bqN6p3a79URSxblOITRd37QsvWJEdYAEHc50QePlBCTSRK6iErlnYcQs7TTLH4e4QHQ6TO+Xw44KIw92VWv6HnR6wCP5bOIP5GEEWtUd/Tug4BuDql1q5PBodA+S//0jLd4w1+8ZBAco+WhH8cPbIntyZ2SJO/vllUDYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750057577; c=relaxed/simple;
	bh=nzjjctefWQSSE2zzLociIJltBjiXlnDX/WqkHVJjaLE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i2lrzLG+vo6ADzsF41FmVnCMPChLewuCNE5DU9oaZ3lYJU4A120vw/A92NVI4g9Ye8Us78YEZG+TXK8+kIdbn1kvja/z2yi6+J3bbHg5GgdWE7AbZcXRTD7c7hgqyySrosKOZKMw7jU4GReHdBsZ/oMCcFx5dFKRvnLI7leWFkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=N784zPPY; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="N784zPPY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=wh
	+CPnClds++E2FomsMltkrI9VhXG10y8m6a304zDFY=; b=N784zPPYbzkId2zVdi
	HJqnG2zlh0hp2ckBXIxuiEBAr7bRt6ej4gaswDJBE38iIoEwaGWdtjNMqK+Ye0m7
	jsTo6D/VfFHobyuX80ljT6vJQ1EWzzqSBiYrKCFYnhBTiwzcyVJfd4hENzOfYx/X
	IBNbLTrazHTADNTGJWgTpI2zI=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wCXq3hDwk9oF3UMIg--.6743S3;
	Mon, 16 Jun 2025 15:05:44 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: neil.armstrong@linaro.org
Cc: conor+dt@kernel.org,
	quic_jesszhan@quicinc.com,
	krzk+dt@kernel.org,
	robh@kernel.org,
	sebastian.reichel@collabora.com,
	tzimmermann@suse.de,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH 2/2] drivers/panel: raydium-rm67200: Make reset-gpio optional
Date: Mon, 16 Jun 2025 15:05:17 +0800
Message-ID: <20250616070536.670519-2-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250616070536.670519-1-andyshrk@163.com>
References: <20250616070536.670519-1-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCXq3hDwk9oF3UMIg--.6743S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7KF18ZFW8Gw1DGrWftw48tFb_yoW8Zw4rpr
	43Gay3AFykXFsIvFWvvan7uFyrAF1IqF4SkFn7K39xCw1UXw4UKw1akry5Wry2gryxtFya
	grZIkF13uFW0krJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jo1v3UUUUU=
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0hFuXmhPwHxAuQAAsR

From: Andy Yan <andy.yan@rock-chips.com>

Although the datasheet of the panel module describes that it has a
reset pin, in the actual hardware design, we often use an RC circuit
to control the reset, and rarely use GPIO to control the reset. This
is the way it is done on our numerous development boards (such as
RK3568/RK3576 EVB).

So make the reset-gpio optional.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 drivers/gpu/drm/panel/panel-raydium-rm67200.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-raydium-rm67200.c b/drivers/gpu/drm/panel/panel-raydium-rm67200.c
index 205273163cb97..add6099ae8a64 100644
--- a/drivers/gpu/drm/panel/panel-raydium-rm67200.c
+++ b/drivers/gpu/drm/panel/panel-raydium-rm67200.c
@@ -36,12 +36,14 @@ static inline struct raydium_rm67200 *to_raydium_rm67200(struct drm_panel *panel
 
 static void raydium_rm67200_reset(struct raydium_rm67200 *ctx)
 {
-	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
-	msleep(60);
-	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
-	msleep(60);
-	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
-	msleep(60);
+	if (ctx->reset_gpio) {
+		gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+		msleep(60);
+		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+		msleep(60);
+		gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+		msleep(60);
+	}
 }
 
 static void raydium_rm67200_write(struct mipi_dsi_multi_context *ctx,
@@ -412,7 +414,7 @@ static int raydium_rm67200_probe(struct mipi_dsi_device *dsi)
 	if (ret < 0)
 		return ret;
 
-	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
+	ctx->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(ctx->reset_gpio))
 		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
 				     "Failed to get reset-gpios\n");
-- 
2.43.0

base-commit: 8c98c2c9ebeaa472e742d664b714aed5ab7c6f53
branch: rk356x_rk3588_rk3576_dsi

