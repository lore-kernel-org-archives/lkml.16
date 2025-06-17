Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FB7291C15
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750148416; cv=none; b=OHxjIJ3MOe5ErQFkZvUwapIn7NFeRK3oIhuvkOxyvUlGVYvpNWU+6q7tZTd9GPn+xR8W+ILr9eU0qqXW3oHK+LKC6HR17JPj6yMSx1nmTHSf7a1mzMpFvX4ldaggSubQAufY9mrCj9AEO/b50Y4Ji27kzY0NPMDIYl0VWQxHecU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750148416; c=relaxed/simple;
	bh=sZ4za1Id7G7nTtjakVPvrhklzZJfNGfC4w42qoWdWUg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XUgQWPT9tWmCXokVtqn824xDDIiITRZmVhePWep+yvHEWZGZAcc9qJ7QnGiyYrs0RC6sc9OBcZRZXOjrTfi9v9+cqVfp4+yY/kF1wx3zhDxnjeqP4+eU2m4yiZwQiTaTfIcPhujHhpO/WLKjmYrrg2iq4/ujtr4D1WY3BhCdTh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FszV23VG; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FszV23VG"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2363e973db1so50572345ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 01:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750148414; x=1750753214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hJpSSWKODubMWDu6LS8hKhfIs2zxRW9+kSXB6f03nq8=;
        b=FszV23VGo5soy7GqxhDa8qKGOPpx4ZJMjjJTg/0uTpRAaGcmgNhwDNF7oZyfeVxQTS
         T2NZs4rOdGbY4Ft9XdzsAVa4noz+gFOpJqzBKL26PJznvBmf5hbjUAvVHpwKoqiXIzaB
         PlsEXYnHvIoPcZrZ664znfwMIM+9Rkq7cV1T8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750148414; x=1750753214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hJpSSWKODubMWDu6LS8hKhfIs2zxRW9+kSXB6f03nq8=;
        b=SWdfK39KEBNVHf7m+6+1fg408zGuPWxyVPMLruzgPNMD4TmpbIrXLcVbNx0pt9Qmy/
         McXeVJKWPAqqv00z11Q5EfyTW58M6B9Z4Jpnqngtq+cqCi8kSbvbuZw+169iyX6PDT0T
         JIyXsHy+C7GHJ0yie7gNkAuoNHmwycxSOsNLwVrAk5vum8cj/xCqsklRDuTtgizXglRu
         G7whz4FgejlTX1OzGcCVsNCCKmjgKLWQdwkv9lBmm7JmWZj2UjTUgMg6ajFtMgdkfKYH
         FhDt6jtnM95tJiXsmkpnMjbs3jm4RbKCkioOY7jlFpjAOeVjMUoxmOjofxP9fZItgBXH
         I+eQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5rJNbwwatZ3k6PEg94FnykgkeByr25yu1OaDMS0gLpZ/KH8l/EqoNR1BoIhjvzVzId6LaKmuX3frsSww=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpCp0zwk6YNzBn5JV1FLDtIpL3i4MSV1CuEwveMmPKYbspEprK
	7NqU5D6AG0LoYgN+7W4yr9OWK2R15UBp1I9dRStRImf6iwBN++KTo2lKW2uaLewhbA==
X-Gm-Gg: ASbGncsqHwIHb2LpOXVq0rly1mlrXyTkmu+koAAQtZK6SJjPYSBaPyWsbwU1KFtwWEd
	+fM4BuUTWbikBCHJIynhIb978lmdbsO+SobjpdJQCl7UeQTNqQtCSn9koYhc5BVsHlvDiSbS3B4
	JtWifc593IDqodQ10vr/VA32/i4i/Vn/H89Yewb4NY1+iUfUTtR77RSDWvONdqpDDnLvA9FYpSC
	I1wyBFRC/LNPjTJWlPx/VBk2hXYDOrKvaWqxnb28uObl2CwuGezLNJp390YXwOg6a4uRvNgc3rg
	pZL9zVStKc9JsOs7aNyHx5NzsmN+xcvbs8npkTL7ydK1ohxwdRlwaCCQ0AYktKiyBziw0qtd0wZ
	NisMSiOoj8uovlbE=
X-Google-Smtp-Source: AGHT+IFfpg2r7E+A3hwnVaD8XvFL8a9eXnDD2HrKdh1NTx8ZQ0KD0SKLHARkzMHejSWGfoyIg/Kiig==
X-Received: by 2002:a17:903:4b07:b0:234:b3fb:8ed with SMTP id d9443c01a7336-23691bedec5mr30450435ad.1.1750148414061;
        Tue, 17 Jun 2025 01:20:14 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:24a1:2596:1651:13d8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de781f7sm74598885ad.110.2025.06.17.01.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 01:20:13 -0700 (PDT)
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
Subject: [PATCH v3 2/6] dt-bindings: arm: mediatek: Merge MT8186 Voltorb entries
Date: Tue, 17 Jun 2025 16:19:59 +0800
Message-ID: <20250617082004.1653492-3-wenst@chromium.org>
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

There are only two different SKUs of Voltorb, and the only difference
between them is whether a touchscreen is present or not. This can be
detected by a simple I2C transfer to the address, instead of having
separate compatible strings and device trees.

Drop the SKU-specific compatible strings and just keep the generic
"google,voltorb" one.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Benson Leung <bleung@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Added Rob's ack
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index a7e0a72f6e4c..2032b0b64ba7 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -350,9 +350,6 @@ properties:
           - const: mediatek,mt8186
       - description: Google Voltorb (Acer Chromebook 311 C723/C732T)
         items:
-          - enum:
-              - google,voltorb-sku589824
-              - google,voltorb-sku589825
           - const: google,voltorb
           - const: mediatek,mt8186
       - items:
-- 
2.50.0.rc2.692.g299adb8693-goog

