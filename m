Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DF8261581
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 10:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745230409; cv=none; b=QSQ5zE5FpTvFfIsaxOne/IaAc2DUuJT4fV4OtKswMUsS/ZImuvtUzB+fiKM3VgILpRKQPLvB+qauJ0mgZZ5y8qJGf0kV8rRONBtguGYJhfqKlspdV44oGhADEQk/X7HlNNwKkI+jNa19UC5PT9rPGvJSGl62I7iz1fkDThhuDuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745230409; c=relaxed/simple;
	bh=qF7jWnTilMBS2qcmpMwmTaRPTIW0Gr0c/UFCDNrCywY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GWcfEMvYZ7i1aeH6awjFM/sSfVu/n5g9yAzmDb2/HuuegBpjGu/L42MFOfiVvB4FQYW1FErAv1cfg7fS0qlfroqSGaog24weD8xLw2daF2JzejZmNgmWYc9wg4GnXDToXq97jTcr3vh3tyFy5S6CzTp0pTQ8jBwiPEq7VKFUbTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GsxUWMiF; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GsxUWMiF"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-224019ad9edso54596035ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 03:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745230407; x=1745835207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RcjHyP3cBWKaEk01AYLfxR/iTiJMn9iHLwLqY1LLLpk=;
        b=GsxUWMiFK0oWYAKsRY0F5+gFDuXQv06/pFo9Cdam+ZNfTR2Cq6J2m+YtHsFvqVBJtP
         QBA5FCVFI7PaXPzbST3fzJ1n5s3mbscuTQsYkhurNXrS6AAfij6h5H2uZSO6gygWcAR+
         brHiEX5yebvHgBhNlHtnMs3BAo0aYQoLycePU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745230407; x=1745835207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RcjHyP3cBWKaEk01AYLfxR/iTiJMn9iHLwLqY1LLLpk=;
        b=AiKoqQ4Fyv8KIcQktjB3aRcbA2KiqlP5+PCXS6ZgabhH6/1kDkJIv9Ojy+EzB4/8Vw
         wxP/ZSqunvipKrNiP9S86UQFU243rBEVNz5vto9z90+q+fcifJ9GUzvcUdapJy0j90U1
         FKw2maRwg5Axz03riuLK8no6CeqA+stpSPQdNvya57zbF7Lj1+8GfCXfqaMKVMf0zsXP
         ACcltiLNa9Mgxsuq8IWpKF+ZAHc1YlC0FGQcwzYUgbMnf8S7ZIbSslaUcNvXqV+Urw3D
         qExuCWuYXk4krm/XQiivsrxLy0ReKBNbmbzqhEhqmjTMWgjuQhvOf6VNhgKpd0e2r+uT
         yj5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWmZ+wZZW8ruRJc91Ds61UzCVg0/3kP6qRPUa2nRIs/ETu4dPRjb+tfLlqMtzCPU+bf4GlTWQe3QqXR/0g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXkWR8Dp2lH3Apqgp26bw/IsNUC8QVLbDADKNLAfklVUoOU8Jg
	5rI+vT65WLa1m+LPfv257tIZxljCcH6b6ENeOyBDIKTe8CA8YmYRSlrnOtkmDw==
X-Gm-Gg: ASbGncs+eBxMkDu+0e27OV6qIjz9zPcf9T4h7a/HEieK01GQK6KZnkfDnLtN87NG2zD
	NzB0v99dutIBvebTXurgF92SJ5nDGeXBDkAOXPIXaKXv88y7pZn8KmINwD624j8J+MtZ01ehrCF
	xYWBLD0YOg75NpEtL6yyFH+rG+vewjqFzemoUh+KkIqMQ6JwQeIoz9W4+uupDt+iWt9XLBOr/aP
	2sLQAc+Zm22sjoWunWDQUAsTEmhNGbielCUi9X5Wqdji9BhrDEXZf/8xFbsvXRxGtXO8YJEdBAc
	Bo0ByRhGRKEHR6gdiqced2sZgh+zvAi0oHGhg7thlnGdZJDOQZFGHUxWJ1it7lRh4z1dOg==
X-Google-Smtp-Source: AGHT+IHuFSunYBioxk4Fk/97b/EXhuCRKPWNocxu/A5uMoJPd3zI4mtSEWbcD0F9jrilaVzVx5rPjA==
X-Received: by 2002:a17:903:41c7:b0:220:faa2:c911 with SMTP id d9443c01a7336-22c535a4b39mr151608295ad.14.1745230407602;
        Mon, 21 Apr 2025 03:13:27 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:7633:f42a:d31d:3f9c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22d78db8b04sm38985205ad.238.2025.04.21.03.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 03:13:26 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 7/8] platform/chrome: of_hw_prober: Support trackpad probing on Corsola family
Date: Mon, 21 Apr 2025 18:12:45 +0800
Message-ID: <20250421101248.426929-8-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250421101248.426929-1-wenst@chromium.org>
References: <20250421101248.426929-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Various MT8186 Corsola Chromebooks (squirtle, steelix and voltorb
families) have second source trackpads that need to be probed.
The power supply for these are always on and their reset/enable
lines are not exposed.

Add them to the probing list.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Rebased and resolved conflicts with "spherion" trackpad prober
---
 drivers/platform/chrome/chromeos_of_hw_prober.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/platform/chrome/chromeos_of_hw_prober.c b/drivers/platform/chrome/chromeos_of_hw_prober.c
index 019578bc7ad0..10dbaede0541 100644
--- a/drivers/platform/chrome/chromeos_of_hw_prober.c
+++ b/drivers/platform/chrome/chromeos_of_hw_prober.c
@@ -57,6 +57,7 @@ static int chromeos_i2c_component_prober(struct device *dev, const void *_data)
 	}
 
 DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB_BY_TYPE(touchscreen);
+DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB_BY_TYPE(trackpad);
 
 DEFINE_CHROMEOS_I2C_PROBE_CFG_SIMPLE_BY_TYPE(trackpad);
 
@@ -88,6 +89,18 @@ static const struct hw_prober_entry hw_prober_platforms[] = {
 		.compatible = "google,spherion",
 		.prober = chromeos_i2c_component_prober,
 		.data = &chromeos_i2c_probe_hana_trackpad,
+	}, {
+		.compatible = "google,squirtle",
+		.prober = chromeos_i2c_component_prober,
+		.data = &chromeos_i2c_probe_dumb_trackpad,
+	}, {
+		.compatible = "google,steelix",
+		.prober = chromeos_i2c_component_prober,
+		.data = &chromeos_i2c_probe_dumb_trackpad,
+	}, {
+		.compatible = "google,voltorb",
+		.prober = chromeos_i2c_component_prober,
+		.data = &chromeos_i2c_probe_dumb_trackpad,
 	},
 };
 
-- 
2.49.0.805.g082f7c87e0-goog

