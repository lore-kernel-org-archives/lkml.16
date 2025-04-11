Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F84120E33F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 11:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744370590; cv=none; b=R2h6XZQe7896cHG829R3Kx0eQESOO43kmVsXqwMSWOuv6hxQjiGUrrQEhJAQKPBRFjtHfcETaUkKJfm+Q6MYkry8vDK2srtuYE8PqQyGUwf9lVD50Q5RyU2FZLsFT53DEOV18BWV8b+hJ27beBQKhK/kK7Ra8txBKb+NfYHSWVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744370590; c=relaxed/simple;
	bh=pN/3K0c07mgtPTRPXPCJpX/AGnbpoFURyIzTH/nlVaY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d0At16v8ZDkmsEFXCw7DmwrFo09kOqeptp2HE9fMtkP1gDF9l/P0CTmR4PnYmCzwEUXGt6rYryI8jioJBMOJMcU/CX7u+ySN2Np5tWLLPqHHkCdXSiqBkbXuyfCgqdZrXkZT+FkercbwDncszyttYWo/k9V13nJxgTEOVex6pHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KwelEG96; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KwelEG96"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39bf44be22fso1076400f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 04:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744370586; x=1744975386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9r0/g7jMkIS31rWPP+0eYALjsbxAMAbdDJjBS2LpzoY=;
        b=KwelEG96NgJOaGGUmrIYqcTLFyHYyngrYoFmj88OxO1XsfaYk0lfAS100iDXksn5gY
         kBk5Yl/SmmxBJo7NDtRxb3RP7pyG2gWv2iUxquu4YyX1WZwsMPlX4GDGXKVq0cYvbsfh
         tuixyy5UEpOBIO6gjkyOm9izFlxvNCY4XsldHI0PvMJhnUejc4J8iHBTUne8SAWzFfLx
         NOPIq1C7AiJwR17Ru+oY7ScBjkLyOLeJVXIyALfoNdbVZJSWm5Sk8Ytk6PyIU3hrWZ4F
         3kyMwJov772UiYEkBq7L6yIcmWWwBnZPBU2gFNz1YxKEgklBidTBEh26JSVu8Ql3DlWJ
         OBJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744370586; x=1744975386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9r0/g7jMkIS31rWPP+0eYALjsbxAMAbdDJjBS2LpzoY=;
        b=XyuQ47Pr0Fbqco+W9+JDpb+4mtG0kBnetd5WfEbRA/WyulhOP5zaa+jQjLV4lO3I6x
         EJtVYFwybRMGizqeS/npzomdTbmtKKWNvDZrsrYudWkirnPsAOdvuLfsf6tTbuwKJ/C9
         EYD583CMXBnCZZQB/VWpVhMjX4AJj5UHKjaLdIK1AbG8L2T6h89S3oTBrkrJJWASTEV9
         nvGLxjFgTT3VvAE8qjFBTgFTmgDWHhfKLvdLze9gjN7CatXHQDnveyO9vjD8g/p6N39s
         wdaLRTGo/HjQh4svYkVSvmAw4VPKOIp+6Y4HI3touX8f7fj5sBGF2f9FiCDRHu7GfNeY
         UReA==
X-Gm-Message-State: AOJu0YwmUsvbJiU0naPWsnW0JDPOy3kvHJ+jlRQgJ/xWXc07h3j+jLfW
	7xKOYtpPgOkKR8/ldiMxfrcNf6lYodByVWozN3Skdg3mTEzj7l06OERcdEZQknY=
X-Gm-Gg: ASbGncucCKVJHUh72QU+uQ2olcTjyTzmQx4PHvCB+6eSqlqOSkcg8dtdEd4SKEwnEFY
	vEi9mIIUA1Am/PbY+W1poVJwhxi3eaDPgJOmO5sEe9ya2rwgJ/dM2xHVNlNRedCDltUjvnQlLk7
	2DyCM5YRBDMzH4HnzgqyuORb0c4oNLmtGipPyivemS1dzE/vdD7sQ/ybSjiJf0mwG5eUjMYaCF/
	45dZSlrvb3MUl/7bsPRRaT7Rcbz82oe8pZJ8+OjCVVULVfZDN8/W51LbBnw/gslU5YzxL+DxRR8
	AYNJlHEcAv3ZHMXkEFSY7SgWJV+eajIaXeRLYYKy8F0WJr+BZquVznVzUIkqN5wIawFCKFu8Wv9
	8
X-Google-Smtp-Source: AGHT+IHVXqnLyvvLHbBFULraiNiQh68KrBkF4w6IlLCS3MF6yl+jtUm4urqIze65v/DBVdGU5/bX8Q==
X-Received: by 2002:a5d:6da8:0:b0:39a:ca04:3e4d with SMTP id ffacd0b85a97d-39ea51d3184mr1855921f8f.7.1744370586542;
        Fri, 11 Apr 2025 04:23:06 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2075fc8esm85171445e9.30.2025.04.11.04.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 04:23:04 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	srini@kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [RESEND PATCH v3 04/13] nvmem: rockchip-otp: add rk3576 variant data
Date: Fri, 11 Apr 2025 12:22:42 +0100
Message-Id: <20250411112251.68002-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250411112251.68002-1-srinivas.kandagatla@linaro.org>
References: <20250411112251.68002-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
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

