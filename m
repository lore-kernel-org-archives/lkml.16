Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94E728B3F6;
	Fri, 20 Jun 2025 12:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750422249; cv=none; b=lyatex4T3CaK+4LZD748z6GeuvTBDdtNt1Bkh7GWillHn3mtpKbEkXhj4/ORxap61PDpFoi1TkqhShF+gAWwBNNMZbcqlWsaJ6hbokZWl9yL78Maja6azgCByvIlz5cZNEQ2vRngxxy+PzxjQhrY/3KmwFsjUsK0TGjdKGkEzTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750422249; c=relaxed/simple;
	bh=6nrvi+QqqYykM5GEPzyRSFfMhpwuBH9QcZ4diabLI3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hi8ZA4WFWm6X2mNZ+GE3W7lwEyy0VmjC10Lu5GoJbUrBaP+4KomcUEB0FiDWX2kdv/91/VxFuK63cYlAL74OKOmf8vcvaTdNoRugZgNy4Me4uGNjr6kFjDKkRUW5o2+jayBBIOMmSiOVLZWWjX05PTowOZJSR6LxIH2ThzYpCPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hd5/UFsX; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hd5/UFsX"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ad8a6c202ffso342313666b.3;
        Fri, 20 Jun 2025 05:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750422246; x=1751027046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zA6hTIsQgrOeAdYUcX5ilcB4HjpeFhO+PB7ko4583uA=;
        b=hd5/UFsXq0ivJtbaXctaWt2XutUqaE/jfCURQQnn12dUxWAftvFBjT6wpdT3+xO4l7
         BIHNE3wv3y4cHoc3vblAteB/ZvkWTJHKgRJ+ge5yWJixuqORQkCs1HPgOjYbr4wZUy1O
         EE53zP7N+3lXuQiH3fqq8F98Ic1AZLdWaYDUY9iKpzKkXJQxCsCdhI0CxjN0gq5HXqDs
         AU5lStEoE7enduDnuRyIVP6aAJJdShcURIem0wtylwyUDjUzmBR9UKcCK8PSKf92ihgB
         mhIRUSLi/+h0NfH9jCprHkZwPsOnPe4tqlfwe/gD+S8Se9E+6lPZ4rR8fZEhoNLFJQKU
         vc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750422246; x=1751027046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zA6hTIsQgrOeAdYUcX5ilcB4HjpeFhO+PB7ko4583uA=;
        b=ImWOh9izPCofq5qtpV+BpDtHK29pwwtoP8EVj7DOa+7yGjIWJUU7oFl4WXS/8gqH2A
         0D+DU/NgZQli6UOwoFmQ7YNB4o6xcw7oMP5aY2AtdXh23d/SE/R5dnpuZErIztw3YX7v
         EWuCODkescAfUAlmCb+K1OVtQ2j3mZSbshlM9L0zO1nb141Y/zrdfbFt7Wk4pwyPBjaf
         zT9LvuIt6p8Rn1zjfVZ1ck0rj8eZarpFFNQPZylgY9VlJFciHbjlfoxLJ0kpXMoRZnFp
         +GaNXXSy6JML2uDx5ii2IiUG2s/WC+JtUHyix+zhkB8cb+IrgeqC5WBkns4eTI8fv0uI
         QJ9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUuF+2CQR+73WcVnCoMVBC0NQagJgxw+nb82vxc0sNsQI5nK6oxhQsG6D3dm6HUF4IuJbWbGRJf7s3g@vger.kernel.org, AJvYcCVn+06LWlnb8m0+8PuljWky8IctpsJXYkprUaS+wbPlybJE7l3Ex4waMm7V91luMq3nWzK8yqqD/ZsFyy/P@vger.kernel.org
X-Gm-Message-State: AOJu0YzKpYrURjeZInCaO2t/04yNOLAKGyNkTUHDL9uFbtWZHkIvIvu+
	HbG3HnselVus7uTmshF3iiaKRwbvAm3YFWCOvYWf/sEjW/Zzd2kuyQ1E
X-Gm-Gg: ASbGnctpycQtO5fGJ4naXGKP40pI68mlY9vjJziOA0GMCIjKAB+kar8yfvVlnKnuTMK
	JNb2OLgIJjfveKH9LL6r27xEcPEGbi+14mWjAiRwLJAH5kz367wI+GdcjT16UZrQsJJhaEaQjJ3
	ZjiNi4IRNY3zukGUzMu9n789ZqCjvt0MMT/JkG2EcX84zPUVggq/uXEerIUbh05QcjkZJTiA8zr
	QRzwDc4p2Iypig29PiMJmHW8s0hBPPhzm+qvn1WoZcR9emPYq76CtShXyuZfSSgv04LnITv0uf+
	M9FfVUc6QB/3yz7r6VwuGXh3OgfzxQvFpSlbvAEOkmFi4VEXDXrI8i6nzlinM0tv2xJqa55Cs3U
	XGoRJqOk3h0gz
X-Google-Smtp-Source: AGHT+IHA5+LBdaB2RSQC4fqF+MAjuSpzpoHLN6lkxQFRUsBaPChC8fLCImRuFBr8LNu2vnk+E57W5Q==
X-Received: by 2002:a17:907:c295:b0:ade:422d:3168 with SMTP id a640c23a62f3a-ae057b6cc35mr250486466b.37.1750422245959;
        Fri, 20 Jun 2025 05:24:05 -0700 (PDT)
Received: from wslxew242.. (11-127.static.abakusbp.net. [46.17.127.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053e809f6sm154000566b.1.2025.06.20.05.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 05:24:05 -0700 (PDT)
From: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>
Cc: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] dt-bindings: arm: imx8mp: Add Ultratronik Ultra-MACH SBC
Date: Fri, 20 Jun 2025 14:23:50 +0200
Message-ID: <20250620122353.150700-3-goran.radni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250620122353.150700-1-goran.radni@gmail.com>
References: <20250620122353.150700-1-goran.radni@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Document the Ultratronik Ultra-MACH SBC, based on the NXP i.MX8MP SoC.

This board is manufactured by Ultratronik GmbH and uses the compatible
string "ux,imx8mp-ultra-mach-sbc".

Signed-off-by: Goran Rađenović <goran.radni@gmail.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index d3b5e6923e41..9cf2ab3b12db 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1101,6 +1101,7 @@ properties:
               - skov,imx8mp-skov-revb-mi1010ait-1cp1 # SKOV i.MX8MP climate control with 10.1" panel
               - skov,imx8mp-skov-revc-bd500 # SKOV i.MX8MP climate control with LED frontplate
               - skov,imx8mp-skov-revc-tian-g07017 # SKOV i.MX8MP climate control with 7" panel
+              - ultratronik,imx8mp-ultra-mach-sbc # Ultratronik SBC i.MX8MP based board
               - ysoft,imx8mp-iota2-lumpy  # Y Soft i.MX8MP IOTA2 Lumpy Board
           - const: fsl,imx8mp
 
-- 
2.43.0

