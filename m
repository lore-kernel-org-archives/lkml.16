Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B802798F3
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 06:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749537286; cv=none; b=TJE0QNpvo7vfR34mx98Hlwd9Iq8Mubag08ZUu/AoLiD6BvT0TOgYpMIyawdoNN/FjYlQHXYMhDOD0IqhlaKz/uYZiYRJayHCLoIZkaQ8EYy7EHqQn06DjuSyHXr7m/dmlwcnp/FFi/9ZRQnxFDKxNI56K9HLv6+B93L8Z17yOJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749537286; c=relaxed/simple;
	bh=9NPxdq24w65wZ7p9o+7CY4r0pgpVwQsdYz2QlyiKI3A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FjZdBbN/fq/0GsOrYRKkZ3xETOVEwMwWzJAXD+4HxeEqIW5hdh7MTBQiNEczaHLk0VnhyASr3aCq+7ARYgn4TbtqMDOEQFKWSBNOxfD+kHpi3gYAGR1o1kV4e1ZJT9aPQoLv1oAKPwP70sh24NWGY+0ONrbMkvi15C6MKMUU6F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HU2AjjJq; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HU2AjjJq"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2353a2bc210so43841405ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 23:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749537284; x=1750142084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VrqULORtZRtLvohScS0bW/tHKk9lrlbI86cMujlReXw=;
        b=HU2AjjJq259kV8gkmsDzm2uoi6SYGIZUifWGpUq4bNcxvblLk4Rd2LW23DjSfAWAlV
         Mg51y0mvzVMr2g/WHNtmkN1rkw5WMkIy6L174JFShbFaFJ88Ea2I5FXWE1F5+nya3gVZ
         0W29oDMbUB1oWhey/DZh5JXKPne3UUkZ8h3Co=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749537284; x=1750142084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VrqULORtZRtLvohScS0bW/tHKk9lrlbI86cMujlReXw=;
        b=RyYur7WbVoIX334UjJF4s7jy/B03WC1AoYXQo489888pDt35bk5M4DOFnLNBT91Sxe
         gO2wtOqqHDuTEI5cjlA4UqHpiDO2sTjWpsfGJ/CuWCXlR5/b8GEtY+v/8Gf0Hkg9p246
         2i4AUgUiRkbW+WUYXMr+8cTdLLyekVKUk1aSisMUI4MLBSNZ/s8Gg9mXDeEYC/m7kSFn
         tZRMJgaGscj1tx/UBwTm7h9rGm6LRbWTZi+wEcsZCAekfvIFPn/Dn+grq6+uFQVLaT6M
         Uxzh4eYwp0I0q0/ZELZ2mVPh5eIfcQn+XOngeXfFp9kDORTD0Temub9wecPUDJGX+LVb
         wA8g==
X-Forwarded-Encrypted: i=1; AJvYcCVeWiJ+ehRgaWti7JrGnj3ELpDPOn7AFVxgPtNydgv6bdcO9rm+WuL8KbN0b3aAon1i90Cmy4h5LUX9gQw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSevIAo/bwCPPd2r2DWcunY+4bAonBKIjeydFYtXGhe9IEymsf
	kgb/r27FyiDQVoySwSIfk2gfRDUsC/jh/jAJJgXigxlj20KgjbBoFNE5Le99uQXYnA==
X-Gm-Gg: ASbGncsjFqXLFhgbCkXThkgp3pQJe6jpEPLfTalFWH1QQIiGaPA+BKGF2bYfIN5efZ7
	jma8VH9wxUyDZrcp9LnDwxHuCrBO4mOig2DsX4zRL+JxMLzFTCtkox0VCcON4WgNZRUxHi/MTps
	Ij2t1MEIHQyxyU8uwy9a+VkfAK1dwZP/d/TYAw25c3y7FfoAIMK+MAIxWRfyr8Y5tVKeD5fgKzz
	y4PZQBAM5sdSgkqeOJ4locw7h0/qTOvzbMfP+Jw3R9K8+Z+0Ujo3CxP072v9ZMyg66hsVJMNgdb
	fo7VCLgY3nVWLbP0XQiQSP30dp7GvxrfeGPt+AK4yf6EHqYy8nOt5tqbhfxjE82sLWacPgjEyAj
	xJijD
X-Google-Smtp-Source: AGHT+IEGQxJJmcWYpWGuVmdUnkC75qaMfHhC2ZYRcVR0LV2sYNBvIZJpm3D00eRQqElG+uElS5rHKg==
X-Received: by 2002:a17:903:230d:b0:235:e1d6:f98b with SMTP id d9443c01a7336-23601d03dddmr221983295ad.22.1749537283922;
        Mon, 09 Jun 2025 23:34:43 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:2826:ada4:efac:14e8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092ee2sm64596765ad.82.2025.06.09.23.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 23:34:43 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Lala Lin <lala.lin@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johnson Wang <johnson.wang@mediatek.com>
Subject: [PATCH v2 1/2] dt-bindings: nvmem: mediatek: efuse: split MT8186/MT8188 from base version
Date: Tue, 10 Jun 2025 14:34:29 +0800
Message-ID: <20250610063431.2955757-2-wenst@chromium.org>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
In-Reply-To: <20250610063431.2955757-1-wenst@chromium.org>
References: <20250610063431.2955757-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On MT8186 and MT8188 one of the NVMEM cells contains the GPU speed bin
value. In combination with the GPU OPP bindings, on these two platforms
there is an implied scheme of converting the cell value to what the GPU
OPP "opp-supported-hw" property matches. This does not apply to the base
mediatek,efuse hardware, nor does it apply to any of the other platforms
that do not have the GPU speed bin cell. The platform maintainer argues
that this makes the compatibles incompatible with the base
"mediatek,efuse" compatible, as shown in the link given.

Deprecate the MT8186/MT8188 + "mediatek,efuse" combination, and add
new entries with MT8186 being the base model and MT8188 falling back
to MT8186.

Link: https://lore.kernel.org/all/11028242-afe4-474a-9d76-cd1bd9208987@collabora.com/
Fixes: ff1df1886f43 ("dt-bindings: nvmem: mediatek: efuse: Add support for MT8188")
Cc: Johnson Wang <johnson.wang@mediatek.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../bindings/nvmem/mediatek,efuse.yaml          | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
index 32b8c1eb4e80..4dc0d42df3e6 100644
--- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
+++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
@@ -24,6 +24,21 @@ properties:
 
   compatible:
     oneOf:
+      - items:
+          - const: mediatek,mt8188-efuse
+          - const: mediatek,mt8186-efuse
+      - const: mediatek,mt8186-efuse
+
+      - items:
+          - enum:
+              - mediatek,mt8186-efuse
+              - mediatek,mt8188-efuse
+          - const: mediatek,efuse
+        deprecated: true
+        description: Some compatibles also imply a decoding scheme for the
+          "gpu-speedbin" cell, and thus are not backward compatible to the
+          generic "mediatek,efuse" compatible.
+
       - items:
           - enum:
               - mediatek,mt7622-efuse
@@ -33,8 +48,6 @@ properties:
               - mediatek,mt7988-efuse
               - mediatek,mt8173-efuse
               - mediatek,mt8183-efuse
-              - mediatek,mt8186-efuse
-              - mediatek,mt8188-efuse
               - mediatek,mt8192-efuse
               - mediatek,mt8195-efuse
               - mediatek,mt8516-efuse
-- 
2.50.0.rc0.604.gd4ff7b7c86-goog

