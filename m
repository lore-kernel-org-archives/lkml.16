Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787FF2627E9
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 10:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745230397; cv=none; b=o4ULzH+9XtoZFyj6mjfU93OMHQTxD7wKVGKy6u4qY+OXfACVnZL846JYrRMz18ZymikqJqIK7p2fFibp7vMoQu6uNV2dvjEeufoz8AXRAXaehEmWiq6CAQD+WZFlaHM3NrUJTq2ChHA50vpVUx/ufYPdjMWBCJkjdm1zsESV2mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745230397; c=relaxed/simple;
	bh=34zm+yxWUtR/Lbc2SeD4Q2rTlj6zy2/A2wbsfBG4WVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qdh98ezaikMRyyvlkmsPdF28hFsKC5EHqOhgn5EtB8FLrXy0ApbQVZpjhGGxTwmhIQ8vO7YVxIL7Q2j9O4d55z+2edtGQJDQO1n0OuLF3xmhpQOjJAHO4kWRlP5VxB+pvTe20PYHfNE5WhVND4IepQUmg82PPMcjBcN+2zkb2qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=P7wHBAdW; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="P7wHBAdW"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-223fd89d036so46038875ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 03:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745230395; x=1745835195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4d0RlzVUiZ/GjheYPmzU3+xaXB4NRkzjoXsemgEHtik=;
        b=P7wHBAdWO1tsY4cly0bqVuhDJ36LA1IrNEPqKwfouHhpFonk1iv4xJEdC+d5gQ3bp7
         5oI+pzdpdXwrgLJsgKFRATSxVbAbBEjjZi9r0B6YasUvVAfNliKGGzwQHkzg7HpqUm8b
         ilLjtMdWwFEi3LjjGf49JbAjU4pt3XhdjW+l8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745230395; x=1745835195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4d0RlzVUiZ/GjheYPmzU3+xaXB4NRkzjoXsemgEHtik=;
        b=SkVjaabbvgW1qWQl30C/qB5ZvLgG+OxW4WfdXspsQ8INpJwOG+COMaCyIkqtCY3QCl
         wpReDA1lbA1nuXdQJxeyXW7ypLlKBMoZ6HK/lEr3+ruSX5RB3WwwAV9CcyPGncCSyneV
         Ms3qtEGywf6ciV1XqFq3Vg+Vzq3C1X3cOo/qV8znRpNjQUlTC2KcDNaJJ2u0WZzLqu5F
         5ok6azap0LXi+CH93n42UxjoPMjKnNUpEC0yDc8Hy5Z+heOQgNkAueW4s8uoLPSDJQiI
         dayOdBHaDOpbvP+JceaSzMC/GMgrT/ni3+U4Y09BBGdRm9WlktJeotZcEZH82WEMcWBx
         JfKA==
X-Forwarded-Encrypted: i=1; AJvYcCXH4SL69N6nz1NGPS2bw2QRw+LRf/qlzqV+Fivj3TWLFgIkMUj31EKkmGefiEg1bibaDabGuRgiEGb6lBQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRQCXThmvQfKPylP86B6irRksXe6ChguCHrNqbV/mxmogjrzdt
	e2CWv5soI0oblqGK+vfjt6II8o9P2V8GSqS5k5gicW1cbZwuIkajyXHSAD553A==
X-Gm-Gg: ASbGncuFbRfRkmQ8QFpR71trAZHIqe7doYVw8IYSJTIy5tyEfj7+INHgIiwIiQmiil+
	dyN0vdvcAXrbSAb3B9r/D03XWrCIqaNrLh8aAsXYQxTwLyCD8UmM3MjKWNrtgYBUvzPq80ngstN
	nn4Yc4r5eQCterj7VOmbY+oOiE6OibsxdKiT1T5u8vH5r7vTzZYrgg+8d/O2bC7buLCJfQdFo8X
	1ShhsSchv+YhCLfTZgxEIoIM0ZcxMvRr++rO5HzAkdTD5jIOet7gA9d7FepVHWS+RlgIBbqwDy0
	g8LfD+AUxbJiyxq9R6EnQ558c/4VkSSHpAozPH7e8JsO9eFW/Kr4+iNFFSM=
X-Google-Smtp-Source: AGHT+IF+AnZFOOLJPlbiAxkDb/YuGPI7JP89xIJch2irCDOD6BFYAkiFyfLLQWgKCePZd7wiHYd+Wg==
X-Received: by 2002:a17:903:3c6b:b0:227:eb61:34b8 with SMTP id d9443c01a7336-22c535a7eecmr173618945ad.25.1745230394801;
        Mon, 21 Apr 2025 03:13:14 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:7633:f42a:d31d:3f9c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22d78db8b04sm38985205ad.238.2025.04.21.03.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 03:13:14 -0700 (PDT)
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
Subject: [PATCH v2 3/8] dt-bindings: arm: mediatek: Add MT8186 Squirtle Chromebooks
Date: Mon, 21 Apr 2025 18:12:41 +0800
Message-ID: <20250421101248.426929-4-wenst@chromium.org>
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

Add an entry for the MT8186 based Squirtle Chromebooks, also known as the
Acer Chromebook Spin 311 (R724T). The device is a 2-in-1 convertible.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes since v1:
- Added Rob's ack
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 49ddc504c160..f0b4ccd81c4d 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -291,6 +291,10 @@ properties:
           - const: google,steelix-sku196608
           - const: google,steelix
           - const: mediatek,mt8186
+      - description: Google Squirtle (Acer Chromebook Spin 311 (R724T)
+        items:
+          - const: google,squirtle
+          - const: mediatek,mt8186
       - description: Google Starmie (ASUS Chromebook Enterprise CM30 (CM3001))
         items:
           - const: google,starmie-sku0
-- 
2.49.0.805.g082f7c87e0-goog

