Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE70268C49;
	Fri, 30 May 2025 17:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748627207; cv=none; b=j/PcUsT7jsIYClFnEMsFdyC4GxdfC8CIlcnzD3mJqC528Ndy23cqUdyAqpm3MIzZeO4BCGccrGZ7EuwlcKaV1DYeMTIejfaIjorpvnytdCM5jmbMTdNKjOhaZNJOop2KNpkyR7DUxUq7zTvPbAvfLvZCh7BJ5Ce8ZTYwFNJihq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748627207; c=relaxed/simple;
	bh=c8eMnEXkKj3KZv7pXFKJycXqfPtAZ8DjtUNQCxj7R9I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NIq20kl4pONbOjrvKXol297snj7sB4E/fOJBRyXtlFWjID4kwb6dbfGYyA7iBsCFE0yCKf09Jy23OMQ1pO4OC+Ghzw6QOL9ixIVQGeReps4xPKSEwpgfB8j01ilNmlwj05lsw5XKfYgm7YZ6dIQqhWqVf+gc/uEndRhfYjvhAqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TTr4FJDR; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TTr4FJDR"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-52413efd0d3so749788e0c.2;
        Fri, 30 May 2025 10:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748627204; x=1749232004; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=un/E/DEhIx+krru6ePBASrA8B37RqcZJZEYw5tmJ1+Y=;
        b=TTr4FJDRNp04sUOW2nPxU99Rr4PzEBA5MZ+3UENl7SAFmYndSLbq3qmRvcs7ER9JTV
         iX0lMjE7q9Hz7hP9gRG2VfdUWBwteKpvjND6wgwkPVIBkTaLTjyvaXz4XqrRAel9jA3/
         RuBtukJuvADLWHBCQgKM84hVeOvWIJWxv1ExDEGrFhkA3OK8O/43ae6aYpfsGHeSvA5z
         AgrTx2k7Z6Z0zTbrvYDqPqnY3x9xPjbdvxOMcq7kR1rFHmChSilldBEw84lQlZ3m1bDh
         xRvpsFweDiG2B+xvHymDgBavUU2RNjeItexaPu83tjRqmp8XoQSnaPgCFP8Jhdo42v5b
         1RyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748627204; x=1749232004;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=un/E/DEhIx+krru6ePBASrA8B37RqcZJZEYw5tmJ1+Y=;
        b=HF1Gv5Ook5DmBm0byc1LOJ4zbWh6I0a4mTaoLQPqqdh/lZn5reb9ZatzjISFoIk62I
         4kLzeWs6Bkn+4VcOM07gisfUplg+lPKsuRI5AlpK2QR6VgRT1nil/f7bHlg56UzfPz44
         W43XSygKB+MLQkkmwwJTStjtEw/lYA36hBZuQmgfZo/l+akmvFtGx5Hu320TO7mw9aSK
         Nl8O7lL9adHSV6wko16seIiqhJ3n36PtTPbBKJTQsJARRQxX7bQKUQWcw26TlFD5oKv/
         2vHEEa9UJ1oKcxklqHpbK5MMBbrK8rSjdICVV7CCx/oAcGGkQ/aJ9Ucxy25OZ+xg7p9O
         JnBw==
X-Forwarded-Encrypted: i=1; AJvYcCWRLV3GG0q9gAP+WeSXAUmKS+V3+to1vPIac2a/e5LxovTn4ybI+xx/S2tAa3bmbnv1Rj/CD+w/XkHH7vdT@vger.kernel.org, AJvYcCWk1+6q6Z8j8ulaaPV6M4oPSja2npclkunDkqmkNpsKIo3XrwBNWJjnJEE9K0JR5/I5W8SnPqTXUeIy@vger.kernel.org
X-Gm-Message-State: AOJu0YzRmPM67N9cDei2QASGBHGTlQZo150UG263+Vbr4cbe2XFODwqN
	GpSDeXYrf7KPgY5/cFXhkXcoB2Qd7Hr4E7LpwiJOZfCEqoR2L1DgYNe8BZfQDJHd
X-Gm-Gg: ASbGncsQk4GLNp0cW/wv1EPuTgGDVxzsLrQZzNM1+8q3zmVZSxAUI50w5qrddQm4sz7
	YSzPCfFMcS2+IGEoy6Z80oqRyo0NphBwygxJCQshPTanwB3uWwmP7+Xxwy5zVSOwDIN27N9ph3O
	6O8MQV6j1diBjxTj0HdbfPpsRJvUv6Z8BsLRqwNV6C+jrFUejj8rkDj9CVMTRs62nqjC6kowUJv
	Sd72YLklu5K4NCf/AoqhmH3PcNt8F+UHGAHl9LUMpn+9JN4957iE+UCuDtaoItU4OFUvBNuRWR9
	whRK9cvHHhn5LTAUEsDn/7GwwFITJ3bzAWkoppud4sqt1R/PWPus0wFAeHXE63eaq0dp9/h9/q3
	+7wO5VIu7fu/b2il7hOp0
X-Google-Smtp-Source: AGHT+IH4V76m/Hf7vdE21xeBTvIMLCsL9QKgzOFnmhDedDYenCAyoRqzRaTj/o0/xnOLWhRO9VhpZA==
X-Received: by 2002:a05:6122:4f83:b0:530:6dc2:ba9c with SMTP id 71dfb90a1353d-53084bbd2b7mr3090590e0c.2.1748627204284;
        Fri, 30 May 2025 10:46:44 -0700 (PDT)
Received: from joaog-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53074ab0d37sm3578591e0c.8.2025.05.30.10.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 10:46:43 -0700 (PDT)
From: =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
Date: Fri, 30 May 2025 14:46:25 -0300
Subject: [PATCH 1/3] dt-bindings: hwmon: amc6821: Add cooling levels
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250530-b4-v1-amc6821-cooling-device-support-b4-v1-1-7bb98496c969@toradex.com>
References: <20250530-b4-v1-amc6821-cooling-device-support-b4-v1-0-7bb98496c969@toradex.com>
In-Reply-To: <20250530-b4-v1-amc6821-cooling-device-support-b4-v1-0-7bb98496c969@toradex.com>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Farouk Bouabid <farouk.bouabid@cherry.de>, 
 Quentin Schulz <quentin.schulz@cherry.de>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>
X-Mailer: b4 0.14.2

From: João Paulo Gonçalves <joao.goncalves@toradex.com>

The fan can be used as a cooling device, add a description of the
`cooling-levels` property and restrict the maximum value to 255, which
is the highest PWM duty cycle supported by the AMC6821 fan controller.

Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
---
 Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml b/Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml
index 9ca7356760a74b1ab5e6c5a4966ba30f050a1eed..eb00756988be158b104642707d96e371930c9fd7 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml
@@ -32,6 +32,12 @@ properties:
     $ref: fan-common.yaml#
     unevaluatedProperties: false
 
+    properties:
+      cooling-levels:
+        description: PWM duty cycle values corresponding to thermal cooling states.
+        items:
+          maximum: 255
+
   "#pwm-cells":
     const: 2
     description: |

-- 
2.43.0

