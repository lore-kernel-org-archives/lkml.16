Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996CA2309B6
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 10:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745490338; cv=none; b=igXCv39bGB2udSP+n2uQeFXXIERBviJIEnTE6MQYUnxz/EAlmk0l3dF0HNOkg53HDF6h+kOWcUFIw/HPq6ZZvnXs4xtFUbdfDgwV8nxJZD/IV8tFj0QEkZB5VVGk+/MxReAuEIX7f/3FNZAJhulhcjLh6B5t/eMmyES2CvCo3SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745490338; c=relaxed/simple;
	bh=SddUH/xqsKCkWdaBB0Rh8l7Fup5QKZ1bZQvIU0QOXGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IT0L9o1bRFfOz0jsZQEdN9oLyTNnfekcfnwV2LvlTS2ewoIdO0ogVurDy7jZ6GIo+jmnkt06UJuVLCzoxbBuvqCONbtOh1ZZMAYwZF3GETmijsHg4xrsi6QLco7fUYGwua+lbVzbCF0ddDvqWeEE1n8/4ghYKHoeUOzXmQP11bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HAavX8b+; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HAavX8b+"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-223fb0f619dso8695525ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 03:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745490336; x=1746095136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kPI27XPPYRRK0xWqV54WIVswQxSYJsBtgx975xO40PU=;
        b=HAavX8b+aOd3i4wLFnVYNA/6M4S2WVEZFhdlv/5nEoCrC1wL8Ov+0iw9VcfKiFl4uT
         Hj2i1YhGh0CXlxZzEi1BbQFbxdd8bNtkIB0TZVjTWDKxcPhzCZAVeCvT5p68c4xelxbK
         oJ7vw3D4/ZV5JP0B2DIVTMVFjVtpzcBev6ifc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745490336; x=1746095136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kPI27XPPYRRK0xWqV54WIVswQxSYJsBtgx975xO40PU=;
        b=TkZib6PZXdzCRJIUHXMFVizTWMT3m+hl3uiRTXDoO3MozeeP+fNMHrjZOU86JUap1q
         Ja5gK/cVDuxXeDCu+GKYH46na7gc0O6XHf1osZzBuuwLK3Y+6BvYadr+R7SuMC5+nw/q
         6cnxzujM0ATVbeJ/krWhGQwyzCPy6H18sdpho4NpUg2NXbP2dCPZsn8V4BJzjxXKMRh6
         dncNBpedrmz9iaPtTcKySLLwybjS3jmm5WSLU70kHRjgS2rBebuxtVu/DL96rlqtKyPt
         e7iDJ/6xuVDgH/hbQMMg+BoxnmqkIqakjTJDsEg9qTwkj9qK/Ji+d90icbJ3bDxDlTkW
         i9+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVcWUT6q0Hd1XMdrvGqFwwjKXmNWvaJhQfG0/Dhc3Y1en09LdJ83+LbiewgFD29xJ/DOTEypsCM6oE8WCw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzW7CgQPB/AxOjxRYUvsWwSwPvK09/jPVzkZmrNzaUckIHybHll
	SZlOD9CrhqWYqfD2dkP8jLsl9Q6JkYGwzmvNIY9h8uqs4QQBQBoknOWvtAWxnw==
X-Gm-Gg: ASbGnctSjKv/53gQpkZJL/4sQ5jFWaurWFwzef8HkytRlrLC7ztX1YsNXpvPRO/sbhD
	BNmiqDFBZdaQ4MeGGAFC4EkeVtiSluC2mH6jvaq6wzrV+zPwHmsITFj/iHY82qN2317BGIhQl6Y
	y4xUhx/JTk8Odv+lcPtRYSNj6PdCrUhJ6fuLGKRTajtj43jvmhzMG9wPoMMDQ+fH/HA24wZ7BK2
	7jRVCL9M1emmHiI+QndxT51a5HZ5GYJ/fA4mDCzceeAm8Rvjml5WKcESIcgDCO1Z7jBj6wKqJoR
	z6IkN3fGfsqpqidcdFrxzGfM6Qhr7an9AeWwVjnM6nFvyZ0cqRHoKXgxdA==
X-Google-Smtp-Source: AGHT+IFl3f1jhKy5TreVsC3n6Tp6f11IsZEiWWY1AzKzoKnuU1FfQGTVtrsgZqmOG5uoeu4Ajq1oKw==
X-Received: by 2002:a17:903:28c:b0:224:76f:9e4a with SMTP id d9443c01a7336-22db3c0c147mr26537035ad.14.1745490335985;
        Thu, 24 Apr 2025 03:25:35 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:fa13:e633:684b:257])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dda40fsm9680305ad.104.2025.04.24.03.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:25:35 -0700 (PDT)
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
Subject: [PATCH v2 05/13] ASoC: dt-bindings: mt8192-afe-pcm: Allow specifying reserved memory region
Date: Thu, 24 Apr 2025 18:24:59 +0800
Message-ID: <20250424102509.1083185-6-wenst@chromium.org>
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
 Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
index 064ef172bef4..8ddf49b0040d 100644
--- a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
@@ -23,6 +23,10 @@ properties:
   reset-names:
     const: audiosys
 
+  memory-region:
+    description: memory region for audio DMA buffers
+    maxItems: 1
+
   mediatek,apmixedsys:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle of the mediatek apmixedsys controller
@@ -95,6 +99,7 @@ examples:
                       "aud_dac_predis_clk",
                       "aud_infra_clk",
                       "aud_infra_26m_clk";
+        memory-region = <&afe_dma_mem>;
     };
 
 ...
-- 
2.49.0.805.g082f7c87e0-goog

