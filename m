Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2864B2949E5
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750148418; cv=none; b=WkV9i8HGgHAxXmOHL5qKVJ27m/6XGSfKGEXmLM0DH+gRcoECkOqXq6lVuB72OxQrwpH0NsBuiboK+gQKxNeRadmwXqfOwPXHBOjGb/YWsRMjjWmgSp8Hg/Xwzwb0zt3BocNdmkHnTXq3OEZ14UwglBagexfDDnt8yeoXFkHhGpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750148418; c=relaxed/simple;
	bh=UxAuiy3peyOlwLJBGOPsPiR8T6DVdxWS7Est9l1Frw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YBcrtnt1PYyjjfkNSqQN7WUwRGPjFyvOE/oPh1OswbQ9NTJsmcj6WlJ84hQxkb/FoQQtgnt3FnAWf1T/2+W7nwi3MiiaLwrXy8HwbMyOJjx1GJwfxU6gfWG8WY11sNL+wbc5McZnWxxwbltsJmhhHGO3mhV2sxPlWQJAs0fOkf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dycxxRg1; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dycxxRg1"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-234fcadde3eso68739625ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 01:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750148416; x=1750753216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/boR19WWVB+LDycLFRcC7qjbHGCqTpzpia0XTcyCZes=;
        b=dycxxRg1MQFA+QY5WXQUEmRBQCKew+3Qv1hNIdOhEyqmjsiabzW5aiSMJXy9CJ3HHr
         DwyltDia5ZJl6M0jbflsrENZUlilBPKvV2aP9vMoVcuT2FtD1kUSG/JgRevQGoPo9qxb
         09Sd0g/xpTLPtRyz/H6C7Xw/ElgKmPnDkEzVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750148416; x=1750753216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/boR19WWVB+LDycLFRcC7qjbHGCqTpzpia0XTcyCZes=;
        b=vUEIr9S0BWtER3eS5GVO5wOCFA5SJ+zp4oZT2jZNc2f9eDdegHyJ+KvUxrtL2oovVN
         JbflcBtFJgBCl4O6hSlzItaglQWjBTr9RB2mh6nC7ImecXtcfSCqxbUX1nX1tdLlkfpW
         ImFhcCCTSYMhhm0duA0K/CAkuojqUvvrxTFg1DvBE/I2Hc6BfmWzBg1sPT4ZRzEMbrnc
         RAVfZ4bs19jzO5mhLUjov9UQX3zRKRA+wfKChPeDOGoVkOqmaAJBrs/4l3RlSEEpO4a4
         C/2IBl/TaK96Qn7V+98e6p66M38n+MRXzXe5NkoSPbTWB6qpV3rKVh5T61BgXNCylylo
         IYBg==
X-Forwarded-Encrypted: i=1; AJvYcCWabpwGejRGLZ1h34me5tc4ddqRh8Q1a1yYQGh/7Bzdb3mm5cKz3NEgsBcg7dJSe9FTCrCKbMBzdeU4OxA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ9Ol/yQvS3/uX6Pr/6Lh2QAw/UncQ1gZW8m/A2R1YVbgsd/+i
	D99Kn82FzXXp3r46UFXHMO3n4Mu5mkziov27+ZzrONwyUV1CPJMw/O2KRvpNbVHTgQ==
X-Gm-Gg: ASbGncsNfQacG/z4bPxyv5JOgJFC9oiKDuhRLj0v7z7aqRgqacuT5d5HPkWXdIL8Jn0
	YelXE+5HtiaCbtpGa9WH+Hzo5esQmGVV/eX1s+IXT0G977DX4B/ATgkKI4HYbbMhaox56K80ApT
	XvFsXdqkGbdgDtPLdd/RQhtr2fxcY2mJBbPqWh7MtpM5aepkn0cG/D/14OKcrI911U8SbHl8fXJ
	d+y0yWnRY3GHMGCG5CfqdAZq6SMJWe7sdVdhY2kNf7jkuT4i/t/Cp4QThTAN9tE68oXx+qPbBNt
	0GgdAiAnKE13xLsrvgCFuRtzhn6ca7K1nHWbsRLPHtj9No5USgaZkY4PE0YGxcILmEH9r99wndN
	wDXFA
X-Google-Smtp-Source: AGHT+IEDu/d0gvLMPkfg382ZhcCdbDKZbFxmgqE3AqPSqBv9agEnIVcL4Kq6GKfMPiLzVnBd6My2XA==
X-Received: by 2002:a17:903:24f:b0:235:ea29:28e9 with SMTP id d9443c01a7336-2366b3c35b0mr200531685ad.38.1750148416513;
        Tue, 17 Jun 2025 01:20:16 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:24a1:2596:1651:13d8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de781f7sm74598885ad.110.2025.06.17.01.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 01:20:16 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-input@vger.kernel.org,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Benson Leung <bleung@chromium.org>
Subject: [PATCH v3 3/6] dt-bindings: arm: mediatek: Add MT8186 Squirtle Chromebooks
Date: Tue, 17 Jun 2025 16:20:00 +0800
Message-ID: <20250617082004.1653492-4-wenst@chromium.org>
X-Mailer: git-send-email 2.50.0.rc2.692.g299adb8693-goog
In-Reply-To: <20250617082004.1653492-1-wenst@chromium.org>
References: <20250617082004.1653492-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an entry for the MT8186 based Squirtle Chromebooks, also known as the
Acer Chromebook Spin 311 (R724T). The device is a 2-in-1 convertible.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Benson Leung <bleung@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Added Rob's ack
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 2032b0b64ba7..a4d9c72d10c4 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -302,6 +302,10 @@ properties:
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
2.50.0.rc2.692.g299adb8693-goog

