Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8310B204F6E;
	Mon,  3 Feb 2025 13:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738588309; cv=none; b=sV9mH2SqW0m/B5j/J67lgrFIkqili36QjCkt2V1bImXV1XXd8pcu6L3v9q/UUOLbug1BsdRotk88xEnGiF+/7+1B/Pe5UnuDvrEchWY8CBl68EynPgWgo/1hSkMxhJTYgxTdJIeG1gwgz+QTbiEWtZcnRIA/BoxDZAz116vwoiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738588309; c=relaxed/simple;
	bh=qw6/oRijMeiMYBDoqhdnPazfxbD4I4FYFWBsgfYvwO0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sLABNn0KhBHmtRkeZcvjsl6Uop6WJJ2nW6C19Fqv3BiA7EP2URBF+AHWKbFs3fY130SMuK7U6GpCmrdQGM3b/ueKk8dIVPK6rSmXX2I7tMt7D4swgj1sQSzhpXb5UPIJQQdX7o/h4WLBljtoyVOnidN/NDW4RJ1hRFdb0CRrgBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IFhPc/8a; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IFhPc/8a"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21c2f1b610dso99600005ad.0;
        Mon, 03 Feb 2025 05:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738588308; x=1739193108; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b1FY1lFZx1d7qtietTMvsLIGmuJzU+GwniaWJjqysAo=;
        b=IFhPc/8akn+kkvH/oMCrlcG/ly0gNu2eI9I4EwhkOewi1A0+jrDhgVWlcLGSvMob3X
         MRQdtBXOFXdrVUOX3WVPCAUFs+NSJzaDIxPeDdmrFWfFOkvPL4+u6G6qpwzHRt1cfAyk
         RXoH044cSA4nhsfXMV4wlfnF82fqz7bD/pHEmzR9+5cjdXimzTdwv20NuQ//dJ7k8axb
         Iu8RbggCJQcyPFVLDch8TsUVyri1VtecV1NHiEg105br+mZIw5t7HVyQxO1Z+KwyNDZV
         YYNCOMspqPzgABy6cRHa0sts88gp0yAjfcxhvYKOEiAb4G68PLS8tv7/XS4PJSATG6/b
         q3zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738588308; x=1739193108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b1FY1lFZx1d7qtietTMvsLIGmuJzU+GwniaWJjqysAo=;
        b=VXPo2pb36YhnN4Uwox3kHoCN6JdU+xqcg+nxkewM1crl5yKWk0n575Uk0g5AB/8xlA
         0CS6qRfcKicTvWGHW8pW3ZLkfOxyFusA7dZgPqxKlcxVGbRj1DVLukdu/k3fwpPLCFEW
         AYPvAwVqUz4NApGWeRBks+Dz/Sjz09allmMYBaAqXnVSe8jatNd8F4qfpo0y5LUGGwhn
         YYh51KnEBdTRNpP4mS6jQ6Id/ZXS8qLCFEHp32s0OPlEfaWdCECKtXXU2A5kL95eb/J1
         /eomgys3zJMsnRoxZrbj7Ziwqr+8X9GHrpZrTcGS7bwwyVOaU30sNEm88iQpksUoNoBM
         tmUg==
X-Forwarded-Encrypted: i=1; AJvYcCUolP/2IgiOYQF5KyUq/H5XOKHxDIBHSl1ih2+MlAMSkKdDCbKKac7D4Iv7Fz6WJ+fX0yoNB5jnUWv2@vger.kernel.org, AJvYcCWDuk/ZtA9YmtmqvkjROszm0eS1DUwIu29f/pJGc/JsN3Fw2MXKWMlU2Axsa6JDxw3QX4bq3be4f1TKDb7u@vger.kernel.org
X-Gm-Message-State: AOJu0YygyyquWnT7BLdlW0PRMgw99q0Fhdx8R3LDenD+4LgZXOvIJk16
	i5vh9JT8WJQbO65+blzC7NRJiAFAVnGS8QcrXhiXT7mCMORZWTcn
X-Gm-Gg: ASbGnctmucBNQU+vBMKsBCM70niaMEtwsCC9jKwT3KNPDLh43DcSmDA0igrLvn0PNrI
	KSk2qoapHrIqp6x0dlXtLJPf/FVtfSXP/ZwAuMyhTMav4AffTAOtUJJKgA5FI5jO6lgdCnq3IYW
	SKOx9uuVPoF/B15Bw/gB+F2ZQCsoGagsLbdKa6fYxEtbGzmIRS2joGychBN/RVVShUm1c6Wmkah
	8iETgRAgdJSz5CqapZR/pyPcrsOOna6jOUTwXfqCufVsMKXDBJTVN9suQAOtvLJ6XJiVDY3k0Vq
	kxIw70XwUVyVfEM8+AIe6Ns4TsabZvy229yqUmRNYQl0HL9S+izaAzTMncEZn9ORCEOi
X-Google-Smtp-Source: AGHT+IGT7jAJmUUjkG0BGyDGRldNkdDhZUJrCU7FxK0JnZjhlR1jS8uZ/XiuM5Sfwz08ryIp703/Tg==
X-Received: by 2002:a05:6a21:9102:b0:1e1:faa:d8cf with SMTP id adf61e73a8af0-1ed7a6e1efcmr39872358637.40.1738588307666;
        Mon, 03 Feb 2025 05:11:47 -0800 (PST)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe631be3csm8377629b3a.7.2025.02.03.05.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 05:11:47 -0800 (PST)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Mon, 03 Feb 2025 21:09:13 +0800
Subject: [PATCH 1/2] bindings: ipmi: ssif-bmc: Add property to adjust
 response timeout
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-ssif-response-timeout-ms-v1-1-6fe279740181@gmail.com>
References: <20250203-ssif-response-timeout-ms-v1-0-6fe279740181@gmail.com>
In-Reply-To: <20250203-ssif-response-timeout-ms-v1-0-6fe279740181@gmail.com>
To: Corey Minyard <corey@minyard.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Quan Nguyen <quan@os.amperecomputing.com>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: openipmi-developer@lists.sourceforge.net, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Cosmo Chou <cosmo.chou@quantatw.com>, 
 Potin Lai <potin.lai@quantatw.com>, Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738588302; l=1068;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=qw6/oRijMeiMYBDoqhdnPazfxbD4I4FYFWBsgfYvwO0=;
 b=GphBV5ux1rtL3yI82K1iZX8DbcLYPnDAEW6mgZAMtCBvCuJhsB8VvMB4KdeNGred/5XaW2fjV
 WP5bZpBWXC/A135QX0XhY812LMteOCwmJd80L8SKtM26uG24A5FJwPW
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=

The SSIF response is handled by a userspace application, which may exceed
the default 500 ms timeout when the BMC or application is under heavy load.

Add a new device tree property, `timeout-ms`, allowing platforms to adjust
the response timeout based on their specific requirements. This helps
prevent timeouts in scenarios where longer processing times are expected.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 Documentation/devicetree/bindings/ipmi/ssif-bmc.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/ipmi/ssif-bmc.yaml b/Documentation/devicetree/bindings/ipmi/ssif-bmc.yaml
index 02b662d780bb..c8a863d44f97 100644
--- a/Documentation/devicetree/bindings/ipmi/ssif-bmc.yaml
+++ b/Documentation/devicetree/bindings/ipmi/ssif-bmc.yaml
@@ -19,6 +19,12 @@ properties:
   reg:
     maxItems: 1
 
+  timeout-ms:
+    minimum: 0
+    maximum: 4294967295
+    default: 500
+    description: Response timeout in millisecond.
+
 required:
   - compatible
   - reg

-- 
2.31.1

