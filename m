Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC1722FF30
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 07:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745564936; cv=none; b=INOUO2sFuwApTTHhi2azfwcy9JHQsLFVb1gyYgomkB8owIH9qpS58kLOTrFrluVzxATPneS1DJ3UHqUq1gFjKoA4N4KnwHn117Az1gGeE3HiqJ3s+4d4rnNvfGUqT0TufuzW9Ms1GsOKUldJvRSf6BBfhffesIZs7VR0CQhbars=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745564936; c=relaxed/simple;
	bh=X2Z23jKDJsecxCviqGVqQYUJRkbYk4LNa2v6qY+TyYo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t+FDmelsXRe+v0mOaiVcXMG94RQ+GpPpmWchppNKnARIe2b8FPe5TK7WGq+b8IvlFUECzzpDX1wNr5opmprs00DmRyBGD6aSLklx8hAtYIKtqg/OUBhv+SBhJrtVHFj6rOwopF51pbyV4kOmzKozA0Xnn0xTt11UsJBevvGQFJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=WEhm6XR1; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="WEhm6XR1"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso21181985e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 00:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745564932; x=1746169732; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M9UsH/AGSSX6ZhEgS0KQAvySVPB6RHXjoHgehdLPar8=;
        b=WEhm6XR1vLsJ7Wy3zwHBAhFrVXySCqvmdQ1nUmO5djp9zn27Rc357jEFgnyM/2sVJh
         j3fk28TxHLz6FGhAXR0fZRASQlumM9bJPV8Txq3HfySNPymyYxE0i/miGWLGJD1KrI8v
         1AEl7ZfJvzFpukvarrZz4K3XwPBI/VeRzlWRfmZBzBKmz7XrwuDI4zNMtMCa2IoohTeZ
         oOieltvZCZEe3MAioVpANmH0dtnrEbt5zPV50UrNH0QHdtwM/pGNPhsAKgVd2fiyrmgj
         NzRGL07iqObNxlImWjSNwUIltIzQ9YBMDqg5C9ScnFGJhzNYXsO/O0SeKUWT97HQ759s
         I9ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745564932; x=1746169732;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M9UsH/AGSSX6ZhEgS0KQAvySVPB6RHXjoHgehdLPar8=;
        b=gwaChBIBGDnrft68DTFsOR4Bgo5EHnLg2DKNYNlS69PDc37WPgswU2DzbXBOGWcbfD
         8RUpkqO5eZ3klfBhJrBhe4ghnFC6FcjBtg4qdsEb0VWyeIluhZV2+azL+h692hz+V22p
         1gg3+TZEpqBp7gHSoyuIfVqg6FsnFkKat4aRPQ6br7hfuV9CRTr1OPs88aVY0e1g1IfE
         ZOs2DKu8S96R/U4Y8FD/95zWgNzV17oLT5s6YwurY9/3lWOfmWhpvy6ZBpmgSKayaxN5
         N17zhg2pfaLbqKdxMeCiLR64FHnYjb5kH22dOgWr50QzTYObzz7oxDRYFHRA2MBUWO2i
         CrMA==
X-Forwarded-Encrypted: i=1; AJvYcCX1EeoJEaw1JgLXjARWnTopL0ViitELjFYxOOYuOLhDLFu0du8/ZaKJGmvci+x1nNXom8Pp7lbMzO71dIo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/El0qLiFiacF/3/JvHOCo8xxxhZMYfj9QuycsR4vJ9fF+60UD
	dK/aNX3hbVTwrFJYisoKcGh1AFXJYI3SvbOjdnB7h6d0wfLVmgQQ380GB39+eCQ=
X-Gm-Gg: ASbGnctKB/xGF4ePHgW7IMQuwbvM8nnOzDQ0UTOqAD3egeKVWAE8Dz8zHmNtk3XePMu
	pMLQdgjpNK9qa+VtbajnpFlUJretuOYhxy2q9S+CRdlIMW3iPJio/0cu0eWiP3TUiMhgXnRwL3C
	zCpmAN0ONl1MKnCcff7dOq6t4X+FUl+7f1IodxC9NwLFch9H/DhSzFJ4iclU8ytTm4WIi/Zdg8Z
	VzaGzx9a3OKRtKc+hm4Br+1ELChC2A6KTanf/BGpb8dfE7qSCIezMT2fj/xNZfOuHF900nB2ZW7
	ucKMI2IJg5gPrrWw7aXZkWM5KqToyZndpZpLBe0yhZIlfRomvL4mAvGEkj0JMCLYBXtxNKvmL78
	2BgOw8E5R7zOSlQ0ool6D/9zt8JpQqH6cv8xxspw4iAqdzYuKw/wLkgaC
X-Google-Smtp-Source: AGHT+IEWNtSZZVP35Vam0NTmvm1HOM6Y8YGU+5T5y5xZ0nRYsgjM+CCCJ4GSJzI2hQRQDGH0PBqSqQ==
X-Received: by 2002:a05:600c:3548:b0:43c:e8a5:87a with SMTP id 5b1f17b1804b1-440a65fe6ebmr9397705e9.16.1745564932540;
        Fri, 25 Apr 2025 00:08:52 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2ad112sm46202735e9.24.2025.04.25.00.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 00:08:52 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 09:08:12 +0200
Subject: [PATCH v3 1/4] dt-bindings: usb: usb-switch: Allow data-lanes
 property in port
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fp5-pmic-glink-dp-v3-1-cc9c2aeb42fb@fairphone.com>
References: <20250425-fp5-pmic-glink-dp-v3-0-cc9c2aeb42fb@fairphone.com>
In-Reply-To: <20250425-fp5-pmic-glink-dp-v3-0-cc9c2aeb42fb@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-usb@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

The ref /schemas/graph.yaml#/properties/port forbids extra properties
which might be specified in subschemas, e.g. like in
usb/fcs,fsa4480.yaml.

Switch to port-base (and specify the endpoint with properties) to allow
such properties.

Fixes: fd2a052ccd69 ("dt-bindings: usb: add common Type-C USB Switch schema")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/usb/usb-switch.yaml | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/usb-switch.yaml b/Documentation/devicetree/bindings/usb/usb-switch.yaml
index da76118e73a53c0e1c255ff115ff959d256816ba..89620191263023bec800dec114c0017c41b7c056 100644
--- a/Documentation/devicetree/bindings/usb/usb-switch.yaml
+++ b/Documentation/devicetree/bindings/usb/usb-switch.yaml
@@ -26,11 +26,24 @@ properties:
     type: boolean
 
   port:
-    $ref: /schemas/graph.yaml#/properties/port
+    $ref: /schemas/graph.yaml#/$defs/port-base
     description:
       A port node to link the device to a TypeC controller for the purpose of
       handling altmode muxing and orientation switching.
 
+    properties:
+      endpoint:
+        $ref: /schemas/graph.yaml#/$defs/endpoint-base
+        unevaluatedProperties: false
+        properties:
+          data-lanes:
+            $ref: /schemas/types.yaml#/definitions/uint32-array
+            minItems: 1
+            maxItems: 8
+            uniqueItems: true
+            items:
+              maximum: 8
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
     properties:

-- 
2.49.0

