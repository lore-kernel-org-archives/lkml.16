Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58118211A05;
	Fri,  2 May 2025 22:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746223491; cv=none; b=oty4XFpMQPHPDNOBKqbSeubUDn29Zy5005SL0xAjR09xPrhpb6GK3AtYfBz9bu5DKrV7II+I18ypkLOnZC6LpsHCycB80HotIZvgE+xsc8hV3C9yb3zfs9YINPwVk5HQ6b2rb5PkYFxfvjFijs1NXqXkBcZOoilyOyY4hit4bSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746223491; c=relaxed/simple;
	bh=g8O89/tgxr9vz1Mo4beSgs2+D45p8f8lUVQIzp/SfqA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nLs+cOIHVHsFkD0trD0g2Y1V7kJVXvjceAYkD6OaT3pDmQwEUMVEHl6yj27KZjI4LInmAEl/T5wPH7dokHiaQ8MDIueBijgKGgNEPVi7mqZSA8dRNPAm5RbTrhl4RalG75j8m9R8xyq9lXOEhwYa6pk3APXN54VGUxQQUkZ8qzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X/lofpdD; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X/lofpdD"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-af59c920d32so1768090a12.0;
        Fri, 02 May 2025 15:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746223489; x=1746828289; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uq+OXw6OLnK7x004RVfSVNUbbrimNuG8oSdUlWB6tLA=;
        b=X/lofpdDMt6b0j6m3FQ5/itcdXzmnIEc2w5Jt7ueeWmqGArNx9xsYfale2hjBQ9hhU
         V/epCA7nNNlXHujnop/8bAJJpIIMAqIFXT3OfYDaylT8SN/gWHCDLQopPuKk4qAg8k8h
         4lYxOC/EEf8CwG5epo10UNxmunl5leyPPmC9ukxV63pkmyjxgjgKNeGtYp/AHoJkePxc
         Qn9Uv13Bt6TyGgKN4GdBFVVNNfj9Eatw0clc5/R4UhIlEDNRtttOn7foxFb8N2QaIfe3
         BQqRrK9zAo7iuuPRWGf48qx4qkcNvTwlojVywvF6Y69lzYn3omE1OfKlY77hj3M1qzrl
         /9kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746223489; x=1746828289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uq+OXw6OLnK7x004RVfSVNUbbrimNuG8oSdUlWB6tLA=;
        b=FA4elIs0g+/vISzkqt6XTB9xGkUimXsH2ATzxpSSD1ZYuJaN0IrXxbMn50T0l6P6rX
         E3zr8PR8kIHmAgmnw+VhlSjMZ3upBZ20PgU9i3/ZJJgcgH4Fo4S5mOnOXbzE5HRw5xMz
         Ej+RCTJ34165sYBuZSri93Np9YSyG2I8UOPCIE6HFqPhq0bOpC9F3ohzG5s1I7PpT3pr
         TGJgovbxf17ggszbURvwdYPO96m1B0NQR0au5Mp/HGYIA8EgFMOdkeKfdGUx/Zf4jgH4
         eRtMW5Rsp1G6OWN3dUpRJGrWgVYadtDO8prIeeXMmtVQFR/17bMn6iDw4FnD869SoO57
         VzPg==
X-Forwarded-Encrypted: i=1; AJvYcCUz6CupWJyhJzlOubv1YPmi6AtJ31wJrxYFrMtICfZPTFl+ZKLbEs6qf+0E17Dko+hDzyEj0aQqBzRoqpE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPo113b9wenuJW3vx2xUGGL/0AxrAbiJZcWrSClMmc50Eb0KW8
	CiMqMDNa5QH6EdaN0MO6LZoLCgbLIgHr++uzkel2tKjN1MtFC3bZ
X-Gm-Gg: ASbGncsxWRoXbPyXsPJD2z6+VRQG0SByLr7tREwjHXLTGyyN9/zAQ99APca9fHj1z4r
	tfB0zfQwrQ42p5PWi9o2+eSRicaae1NKR6f1V4EI47wIXhquoCA+pkSKCl+KIq1SqPzjluJL1SI
	+nJnUpT2Mnmdg4D+Etgp7aQ8xWvMDfqmOOKjRhiQNkILmDw7n5qqi+vbrXxRg6o4tYjbZKtjU/7
	Oo0zRxgH1q47oDgz6sW4CUjPy4lV+Cj/tpY3NhH0sWD+m1zz3mCNY04dSFjoxoJCr6wuFfMg82z
	SnM++I36N7XVsT8KbCEH3Eyy8e+CG6A8PorUakfoDT4rWjmw8TZNAB7HYsWKZ+s=
X-Google-Smtp-Source: AGHT+IGIUqAabkLqubDX4Jwh5s3qIBaj31PlOqtXecuhGusREvC+uNRvRC9U1mpHrmUFZCkKtK1DPg==
X-Received: by 2002:a17:90b:5707:b0:2ee:f550:3848 with SMTP id 98e67ed59e1d1-30a4e55b5a2mr6295145a91.5.1746223489449;
        Fri, 02 May 2025 15:04:49 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3c48ac4sm1301153a12.55.2025.05.02.15.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 15:04:49 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Sat, 03 May 2025 02:04:23 +0400
Subject: [PATCH v2 1/3] dt-bindings: soc: Add VIA/WonderMedia SoC
 identification
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-wmt-soc-driver-v2-1-8c774ad84d47@gmail.com>
References: <20250503-wmt-soc-driver-v2-0-8c774ad84d47@gmail.com>
In-Reply-To: <20250503-wmt-soc-driver-v2-0-8c774ad84d47@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746223484; l=1713;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=g8O89/tgxr9vz1Mo4beSgs2+D45p8f8lUVQIzp/SfqA=;
 b=EAIdOSwrW7w3KBGa/ocx/LaApsk6+8FLtGjQCektH9Dvh4aT21hW/4ADeFZoclicEljnO5tE9
 RUQ+2rIXptGDYQhtoNVw16zgJfo+5uSYHW+gvrBdUcTFbmKLw3NYP5Q
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

VIA/WonderMedia SoC's have a chip ID register inside their system
configuration controller space, which can be used to identify
appropriate hardware quirks at runtime. Add binding for it.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 .../bindings/hwinfo/via,vt8500-scc-id.yaml         | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwinfo/via,vt8500-scc-id.yaml b/Documentation/devicetree/bindings/hwinfo/via,vt8500-scc-id.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..87bdb947dedb47b508528d70543aba067aa03e95
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwinfo/via,vt8500-scc-id.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/vt8500/via,vt8500-scc-id.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: VIA/WonderMedia SoC system configuration information
+
+maintainers:
+  - Alexey Charkov <alchark@gmail.com>
+
+description:
+  The system configuration controller on VIA/WonderMedia SoC's contains a chip
+  identifier and revision used to differentiate between different hardware
+  versions of on-chip IP blocks having their own peculiarities which may or
+  may not be captured by their respective DT compatible strings
+
+properties:
+  compatible:
+    items:
+      - const: via,vt8500-scc-id
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    chipid@d8120000 {
+        compatible = "via,vt8500-scc-id";
+        reg = <0xd8120000 0x4>;
+    };

-- 
2.49.0

