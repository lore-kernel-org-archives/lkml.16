Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20C6268686;
	Mon, 12 May 2025 09:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747042073; cv=none; b=meIR1r/KgYq7JMN21K7RZmpzR1M+PWzoBQH7ZTbXSk7kagoTAk3GhTmc37YXCFOdAkmvtZlO6Bq3Wu3eHi3KH6mFJt6agP/ubFazQOSOCwHZhFxgWS97RJV0gxZn3QaoBkMY+SXFAJxH2CUl2FQNj36KrcQe2VbJsGsskbw/wWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747042073; c=relaxed/simple;
	bh=ViLnr+YHftclB753UlUBBdyCrCd0dGRtcsAbvoZCu0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KPIVLXLmgIddfsYDO+nU+IYywv0l2MmXfYemNDalPEGnqdIXZYjl4YMRZWxLZmdeh3vj54jMRVSbcAAGXtLC4c8ftueKF3n0uGDukDNaHtFKvs2o/zr4PMsEhpb0VFcHLUnE0772LMI1WfxOXVQ8Z4AwlVCesP3lYVHsaBuly6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lz3CDccW; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lz3CDccW"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5fcac09313cso4410220a12.2;
        Mon, 12 May 2025 02:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747042070; x=1747646870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ANDUWfNKsZdPQBcng8o3Ct9reMOcOARWKm7ZdwbTys=;
        b=Lz3CDccWQFYOILCd+6zoKgo2EGBYyWI4uucYXbSyv4SbwU9NXioXUiyLH/0T95vVjl
         A7rUgfAkqAZBHaYtlQRrgbjdj8VEKu+7DdKgJef0u07ZKQIiJl3FBfUbLxr2eXeRwrbn
         rmtOZe4iW0pvtqpTzSDLbx20qFrRzgb6vSKjiVHTe6LO0qlFLzQAZSNWcjfAUrBKJ0VV
         PuoPjSar2LOxk9fvzNwb/pRM70rGdINee9k4yAtMiVALvYSvYXrogk6pY0xnc10PZ4HZ
         dldysTO04gEEhykO8v/5b7MMAQ5jNWQihDZlqeeMZ0S2IzReUICgAgbI9dA+OTOQc81y
         wzAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747042070; x=1747646870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ANDUWfNKsZdPQBcng8o3Ct9reMOcOARWKm7ZdwbTys=;
        b=o80iimf2ptFSEgh6JgHA4sOvLK9Syqv0JmwrpdXbqw7zsYwccThLBoTZFgHJeTAhhb
         k82XW3G6v7ZApOdnh8gXd6DanOsjq2YZePY/VD3v8vn6QMzHmiawCnynIkOeskyuMTLJ
         dfQqdEoaa2sqyu4zGp7aZ8FY80+OiLk+EKvnDu2vQkjtNPeGgnrChSUDMlGomEZh4yJQ
         kKXVuwXkvk2xAlqrqBsm4UDfscUw2BDUsF2rGg7SC1JaDU0HiAA0DmdskjdO80Y5gadI
         bhBrlJl2OwxBsv3l/Y5yT9UMXCMrskvBmyknhupPDq33UkTh3cGZu+fggYdvcp8f/eZK
         SxZA==
X-Forwarded-Encrypted: i=1; AJvYcCV0bYtADonNfuzJbe95cU/M1wFBPE58edN4bQmDvGerYrJQpYZ6+kNzniQReNVoeOlG04POlJ+8hFdNcOAv@vger.kernel.org, AJvYcCWCGAJQ4iAaHTOQ//I5nwEpTOn86FQszH7urwSn2KkKFWgfteXWUyAAnbtPebGt8+c9YARoK+zIWSc5@vger.kernel.org, AJvYcCXcMoGPD02y4roF6u1Df50McFtCrCb1iiZAknDIJFJXXRxe9sIuwtCsHeZHrm86m6JcX21vu87CylnY@vger.kernel.org
X-Gm-Message-State: AOJu0YwzZ8u31DGiTA41qRhu1sHiKqYWYuVax4Wy+hvDDDTs8Kl3dUz9
	inO3x+qzmbzPeRnkjW59TQUaxmawYCt+hiVk2OLJV1dBn4CLqDg=
X-Gm-Gg: ASbGncv+IuW4KzYpd9UdlfV3gWmAID/Cj9bYBe8//Uf3jUeVaPlzIyVTikeA9StEQYp
	KT0a3wlwHSJwbFoq2C28ecmLb3L+P143GizycxyGMTuk28qVIQYtzoKBanuqw/9UAM42vjVreVm
	DqXPMmeQqNIUVGnp+DXokE+DCt8ccE5/dW6X1JDw0R4CbKzhwgYT3vN0M7yCrCC4SrkykGKlVi4
	NipVPK6Kd4emKU+jSIgF0vU0cTFpDO+AUMgH/6LxLw+VJieDJL0hEGJhMWPnCpTRIMFzSCce+iw
	J2k3wA3UbJpHr16TykqRUhGn0gQzGT2o4TR/H/Vmip9WnT1YXIb8ovHi
X-Google-Smtp-Source: AGHT+IEkfqMVOK5w3X1SaLcT5AwFrIPpP1kUFcvuvD/vafsegqEpMg/4WXr0D8u+NF2HbT1JjMmOCA==
X-Received: by 2002:a05:6402:510c:b0:5fc:9759:3791 with SMTP id 4fb4d7f45d1cf-5fca0735bb0mr10426211a12.1.1747042069142;
        Mon, 12 May 2025 02:27:49 -0700 (PDT)
Received: from alex-x1.lan ([84.226.118.249])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9cc26483sm5480242a12.22.2025.05.12.02.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 02:27:48 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Abel Vesa <abel.vesa@linaro.org>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 1/1] dt-bindings: usb: Add Parade PS8833 Type-C retimer variant
Date: Mon, 12 May 2025 11:20:28 +0200
Message-ID: <20250512092745.249293-2-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250512092745.249293-1-alex.vinarskis@gmail.com>
References: <20250512092745.249293-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Appears to behave similarly to Parade PS8830. Found on some Qualcomm
Snapdragon X1 devices, such as Asus Zenbook A14.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
---
 Documentation/devicetree/bindings/usb/parade,ps8830.yaml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/parade,ps8830.yaml b/Documentation/devicetree/bindings/usb/parade,ps8830.yaml
index 935d57f5d26f..aeb33667818e 100644
--- a/Documentation/devicetree/bindings/usb/parade,ps8830.yaml
+++ b/Documentation/devicetree/bindings/usb/parade,ps8830.yaml
@@ -11,8 +11,11 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - parade,ps8830
+    oneOf:
+      - items:
+          - const: parade,ps8833
+          - const: parade,ps8830
+      - const: parade,ps8830
 
   reg:
     maxItems: 1
-- 
2.45.2

