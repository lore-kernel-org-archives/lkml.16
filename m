Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4DC22F76B
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 10:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745490335; cv=none; b=nmZUeR+yqC2FVQoyalgR1k5kRQSY3pTfGFBSs57s90C6xOGIJYgk05sz34L2auR04uH/IzurrDk4QJWWe3VhRr9jxBWmtDdSSHoZ8I14VIoG2SQTDWklA5d/gbyL/vmwgGq2O1oY0kILz6VMVqrxv0WXPCL+MZkeEMoLI7ajwiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745490335; c=relaxed/simple;
	bh=AlCqzDQhKXab0Q+3deb0PZcdtOSYBmwa2tfmkwAzIoE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qQY2cTX9LO2h/oakk9HOwKNaFlbQnLPtUbtiuAEpBSL5YEZq2mSfFNieffUM3UXN7LnmJiU+Q6LkCB4fSLtPDAZK/qMLtFwZriRRVd1tcXq8la4Fyzq2+qV35ipFVfH3gJ0Jxxa0XbgM4df3vRyyAv48f2gh3+wmjY8lDkUtxE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KyYlE942; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KyYlE942"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2254e0b4b79so13077045ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 03:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745490333; x=1746095133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HOVuiI+8mSRH7O/02K1BDgrIMTx/XasOhwMXr41vKIE=;
        b=KyYlE9426zqbjnZj9SOQq6PvJisAaYgguFQmhsuuMUiRbFPdaWo7dv7cmZz5lm9ZMe
         I8BZ9biHtYRlTll9tZqHgKfnhMIFB+LOT3zx21MjiUM9D+sKElf4rkbm9G1+8f2dG3Gj
         +M7SLlHzyUXWkiJXWKpkhpIbsZG7MJ5EMs6+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745490333; x=1746095133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HOVuiI+8mSRH7O/02K1BDgrIMTx/XasOhwMXr41vKIE=;
        b=IalakKtzWeFEzenjEKRsldKMaBQubKVE/pt/jquONVpzVECbeXSnReqAWn+ZkubTDO
         /lQSkjqU33LIbQ9tppWFpLZ0DbaEAEGEcWe4DQwLdCWlhXGOlavv/CPi3mBwidl+glVM
         ojXvE12X5loF7tX1EsBrKG2MxKGxkPRdbITG5yZW5mjAMbZVhEa9bR++v/m4AFKOHG0b
         +ki0q6l8XI432zLdDb/THQGLamWXkraKr5Lmxdag+oy0RX3lBcxyldwgDXmNtTvu5JJ6
         snJjhG5DH0jqGSusu8Gft4d53/ncAfg9nYG9MOExHsWNZiINKi33g47nWx2bKyBEdB+d
         /3SQ==
X-Forwarded-Encrypted: i=1; AJvYcCV35iJcq63GEAHpGnh/aWcq0s+dixkXLDHeVQHZzLqFIlF9rOZW623V80ZnhCGZan9hxbNhjD2eI58gFHQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6WjG+dBLCxoN+xEOs0fGSES1iYmnapNZOqD49wsuDYdItY/ge
	TYG8GWYexeg6vZaG9YBCFOIBt1JxFHHKHbCWRk0kYPP3nBqdx7ej/zF6EE+3Uw==
X-Gm-Gg: ASbGnct9I+Eo+M+Ar7T5u+pg5kD6o4y5HEjyOnULT5V9ILIQtERwfDkJRcqr5arLXJ+
	vzz6bciAXVu2kDEXsR5JUXphY/eHIIRCRIArJDzx36gvju2jM5w6XvfGwfqGuNYQDj5dup/77SZ
	PzkLKKm0G9UhtCc41KS5E6fLbbAH+OMNUCFOtCEMdwVn6t6p9zM1RcVHgJB3VVYzpIRdKpGLbd4
	f5TIZ0sQ+jHx0tqKGE9eoBjR+mmMC/jvKBtx9I/OJhZOIa/LV0jeQvTO1N+0vV9QsWVJhGExQ0a
	/n6JwA7EejwzuPKU8K8Vckp5fOK2PDWTxVpk/iwZibAtKcMhh0mU2cYsgg==
X-Google-Smtp-Source: AGHT+IGD0vIug8Nt9qcP/TU1PZMvFZmtESOf6amtEN+pO0sojtfEbRYqEQc7zpWOQxTNCIuHa8wc2g==
X-Received: by 2002:a17:903:24f:b0:220:e655:d77 with SMTP id d9443c01a7336-22db3db14ecmr31506645ad.36.1745490332983;
        Thu, 24 Apr 2025 03:25:32 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:fa13:e633:684b:257])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dda40fsm9680305ad.104.2025.04.24.03.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:25:32 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/13] ASoC: dt-bindings: mt8186-afe-pcm: Allow specifying reserved memory region
Date: Thu, 24 Apr 2025 18:24:58 +0800
Message-ID: <20250424102509.1083185-5-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250424102509.1083185-1-wenst@chromium.org>
References: <20250424102509.1083185-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is desirable to reserve memory for the audio frontend.

Allow the "memory-region" property, to be used to point to a reserved
memory region.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml
index 7fe85b08f9df..f5af2cf18158 100644
--- a/Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml
@@ -25,6 +25,10 @@ properties:
   reset-names:
     const: audiosys
 
+  memory-region:
+    description: memory region for audio DMA buffers
+    maxItems: 1
+
   mediatek,apmixedsys:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle of the mediatek apmixedsys controller
@@ -170,6 +174,7 @@ examples:
                       "top_apll12_div_tdm",
                       "top_mux_audio_h",
                       "top_clk26m_clk";
+        memory-region = <&afe_dma_mem>;
     };
 
 ...
-- 
2.49.0.805.g082f7c87e0-goog

