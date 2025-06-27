Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F572951CB
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 09:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751015749; cv=none; b=XAhgdI25WV1jEEb2biYs30odDDpKs/UKDWryVAXsfa5QlMJrFJoBcF+WIQEBxlApdUeMo5r4O19uNO74oLWlujARbQr1xxpTPTG5WHZFMVKhBefdZ5SafqxpKa2YzpG7egGNLu/2wHKO46FAvrBmDlpDkeOUfRBc0PyxY9gfgE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751015749; c=relaxed/simple;
	bh=yRbXyUmIWFZrQa8Jcj1B43/2CKJdjc19tHIKY4onRzk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=uaIaOGhx2/NkHCd4aQgA6aL6g9SqYD+ggXsAwzYnCdbhVWcy30Z3yI9xwUtc4ixJxyBy9SNpEYGcE0YkiOg/idk2vqsN/zlI1NKnWO7DAlGz+tcgSB6y/rOt/12Cvb/Ia5VJ1muR2iDO0xeILhVEx6dU9N4mU6xhbWDQtBjViSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DecnbPGr; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DecnbPGr"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ae0a420431bso375862566b.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 02:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751015745; x=1751620545; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oh5XF3KCgs+rtMgIdgbTUFGPWnYOjmm+hF8Cmx6SjzE=;
        b=DecnbPGrL3J/zPoLCX/i/NLhTi55Ntq7A2pg0zSZh7LPUoEIl7mTvko7nEpTxiPxBC
         GnU9TxxJ3nXqIhHdjS0pXgKtyfZUcVy3sSA5kpnYkdbV1DCDG5K89T31pYDhEvxkb44k
         yozhQ5nKDZVbI39PKDeCvGGbW6dCu7aw0yppVX/2WXm9mhAecbURcZcaAirh8DTsKBG2
         yWBart4OYBMhAhdsTRAQh1J5BucDdd9l2F2E6lnlTFKtldqp8Jf20Zf1h00Oede91Zmp
         fYa8OK3rhvP5GCUQ3TezLC/lsK5D2UtVilr77Ex9NJyC5FVxEwkRHkkX4a77EV/L/jSY
         KdSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751015745; x=1751620545;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oh5XF3KCgs+rtMgIdgbTUFGPWnYOjmm+hF8Cmx6SjzE=;
        b=sp7a6pUko8cFy8nUAgwaRdcoIhtEKGz0gAcopE925TAi2dGsYuwniDieJPZxtWyCQc
         CCQhPL6Qli+P3FqtRCaqnoOKn7eO3UA9cA7toP6H0I0jn/t/erb4GVLPuUqelgOULhFL
         tGC7h4soPzhg13WYwlk72IlEMuNu8FggCMbXvIFsLJlssElk1Tu9AqDw/MFUFJo+t6ci
         d2JO/xnTthndawqnLcRgrzlN/w7wNOq5ySAJb7u8wJWn6jmPyrPfZYm7VOqHLMTUyexd
         3Ff9lbQ6kTcD3HoUPs8LtMKi+cEJpebB3UXeZ1nANYgNLulJ+DgxhRL6m3zN1wgKOsCQ
         Iojw==
X-Forwarded-Encrypted: i=1; AJvYcCUks0Fdp6AhziRcPj/EIOkPm+cul/DAGR4D1nYp306h0yNTvehEB67FRMrGgOAL4yy9tCH5//MCnRsdJ5g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLJmmQcE7YfCXZklUA+KuOAxGk8JnFzaj7HVAghmvHMQH+VpRm
	Xoi/Ki6inehSuajnZvmsEBlcrhougpUfAmaR8kpVgxhNyVoDyZjopxRAzPzF5cHW7Bg=
X-Gm-Gg: ASbGncs+4h4Ey7XpGfonYzV/WGm5UwoUeOdnZVUO8OQosJF81hNY3xUxnlgYoFUNDjw
	uBKqVJuJNu7UnWOZbdIdpe+bxm3QKHQKkrjcZRoS5HrpIpDyIUuVfsnsSETEEdsNrDnwPEEOrQS
	rXjsggZmw7kUliDpEiUeX1EVaoGV96+Eg0fGEljdFt4NVQgaXLSG8TDWUdkXr4Z3doI1udZpyPi
	z7A6H0yC9hqlslj8QXdn6iUBCfPoGb4b2igekpSF6dzj89I7H8k9zwKYcwfXeDlH5gvvIVjQ8qq
	aqtgwDxq5TbVB7dGrkz2ACLDVp+BrdvChycKIRfOxu56W7zannKMWqo0Yl7288WQ8NResVR80Fy
	ZIcrcp2LA5tuI75gbKDIs2TqIAw/RvFwl63zzisoBHIUmlQ==
X-Google-Smtp-Source: AGHT+IFhjITN++PVpHqIzdq5cOL1n5hDxRXOigxjiLZBcp92L2m6wtnp42f1b5hw+aCqwkXv34ltpg==
X-Received: by 2002:a17:907:7e93:b0:ae1:a695:a577 with SMTP id a640c23a62f3a-ae35015aecbmr181428366b.50.1751015745419;
        Fri, 27 Jun 2025 02:15:45 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c01506sm88904366b.109.2025.06.27.02.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 02:15:44 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 27 Jun 2025 10:15:25 +0100
Subject: [PATCH] dt-bindings: mfd: samsung,s2mps11: add comment about
 interrupts properties
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250627-s2mpg10-binding-comment-v1-1-f37e5187f0fd@linaro.org>
X-B4-Tracking: v=1; b=H4sIACxhXmgC/x3MPQqAMAxA4atIZgM1akWvIg7+xJqhUVoRQby7x
 fEb3nsgchCO0GUPBL4kyq4JRZ7BvI3qGGVJBjJUG0sNRvKHKwxOoouow3n3nvXEdrIljVTZmlp
 I9RF4lfs/98P7flc8vqFpAAAA
X-Change-ID: 20250627-s2mpg10-binding-comment-9b632a246529
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Document why the binding uses oneOf when specifying just one of the
interrupt properties is supposed to be enough.

dtschema's fixups.py has special treatment of the interrupts and
interrupts-extended properties, but that appears to work at the top
level only. Elsewhere, an explicit oneOf is required.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
index d6b9e29147965b6d8eef786b0fb5b5f198ab69ab..31d544a9c05cad878d10a0ae9b99631f08eb04a8 100644
--- a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
+++ b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
@@ -81,6 +81,9 @@ allOf:
         samsung,s2mps11-acokb-ground: false
         samsung,s2mps11-wrstbi-ground: false
 
+      # oneOf is required, because dtschema's fixups.py doesn't handle this
+      # nesting here. Its special treatment to allow either interrupt property
+      # when only one is specified in the binding works at the top level only.
       oneOf:
         - required: [interrupts]
         - required: [interrupts-extended]

---
base-commit: 1b152eeca84a02bdb648f16b82ef3394007a9dcf
change-id: 20250627-s2mpg10-binding-comment-9b632a246529

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

