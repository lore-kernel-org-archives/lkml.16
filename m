Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4FC2DE201;
	Tue, 17 Jun 2025 14:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750171653; cv=none; b=GLAuqSVQCih+71VJAlwRfwTsISt3Vyu6RdbE25EyvUfrO+WH2NavKMghGqTp4oeegijT+yMdNE7dVOwT2ubNsuCroN2XBZzXISXwYhXVihDuRywX1sWbM692MjRYaK9ORlOAscaO7t/JwWfkf9BfeRe90kLz4uyu1M9ivSaoxwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750171653; c=relaxed/simple;
	bh=IzkVodiKGqG2Hx0dNaL9Ea7qx63st4euoU75dM7/X6c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IHMSe/KsijnA3xP3OzbQamyFT7AX2KgO/dVqWXcOQz+t95kPmxar7Rz80GmlHEKRr6n96EYpnNxs4BVvM6KloFmQ/x+TWuDVTrj0jfUZpfaEsBUrtcBSkcXwMWpgItl39qNgy7h9pHlOvZbx2i8Eh8SptV9rqVOSlisCYTNXqSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gZk0NH1v; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gZk0NH1v"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6077dea37easo11280335a12.3;
        Tue, 17 Jun 2025 07:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750171650; x=1750776450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lpygrMPmKf1mO8Jd5/JcuJM9Ew7b30x4jhAAfy50YQU=;
        b=gZk0NH1veydBEihXWuZM0I0btFDdsdSYzw/9N1JdsJK9Ln/GM9knVsE1JmelBCd6oB
         sPiH/YLItLISQvmuaFjFgiK9YSULbZPyPFNUUhmJLZ7crPzZ//iZtdllB39sJqnXu4nB
         hQdfQDr/oowJdcyKcfbcULNZqREAAMVM9MV5+LSMEA64M8pMX+rs/JhoOnwN3YR6f7ck
         AIwgS1VGiop8LCwmEaTbm6RCKMa+nfiZ967rEMso9J4+BUuywsyyaJvOjt5KpL5WZsPB
         bSACiHMIsy4HB6g5uTsjM9HgjZHPCCUcRcxl4wNuzsrnzWWIla98o6f3Ctvwqj2q418s
         WPUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750171650; x=1750776450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lpygrMPmKf1mO8Jd5/JcuJM9Ew7b30x4jhAAfy50YQU=;
        b=nvUAO6fiE2/W5a3/YwTznJBqN+10vKq67cAHMfprKgindNMrBhVOFQuafGHt6K4iMb
         Jd+iD8Jyah8xZRIJzM6naC6+YlvZP/S1PX7JHI3IaBwRCSmFedXumAxQCZNQWXwd/DTw
         68I5tI7kMjS/gvP3hFnlptTPLe3huCYsHuMA5Rvbfn4auCulnT2XdJyJ5lifIjNwYcWK
         m7izrsD/NFobPRII4fr0lK7B6YQt7YcB6NlcNFG2R+WgNn2rsN52uFtdihNEzDbcbpFv
         Ai5FDAoS+DctoIs1DBm6kfneR/274WWJxIY/I45vDLiCuBFPhDjx+W4ah5V+Vjx/yUQI
         AOyw==
X-Forwarded-Encrypted: i=1; AJvYcCUrV0r9L/ThX0rlNjn6uSTIfZhVWWq9FzJQRV5tgrATitvjf75pjvUFpccIZTFvg5VWAKEqvp9bI+p1NJw=@vger.kernel.org, AJvYcCV2Ija5tiMZwbKFfBSPxmPchuX0FIotk1VY+IOIN/7kv40jBdEKIb4sWgd6aAGdt4cxf0+oD3eAtDh8byiZ@vger.kernel.org, AJvYcCXYUKieKoLYu36iTXs+5dmKq3awduX4RP+yzMP81s784W6z25GMJTbdOG51x4NZ5OWw8kH/Cygs/66h@vger.kernel.org
X-Gm-Message-State: AOJu0Yzpp2AafP07bPOAmheuEpP9s6TRlZqxRdugUv0AHJ4KtoFDYnrl
	D/q3pQmrVLvF7Mux9a1i1fsoO4L91IMLZ0eKB15dSeQ3tyjOBy8PhlDN
X-Gm-Gg: ASbGncuJYZULmbS9cEvv6q441KRQFSVhq0C8/pp3Sv+eA8pMysztxN8yx+fqXIZ6fmG
	fz3Ycxh9YOrQ1xJQaFQkCUirh40ZUlePivXRgT4KzS95u2NdPmVVCzboNrmg9ebC+uPhTdEAwcL
	aV/RUrxrwiqJum5sL6wmQ0emLsmmpN+GWxk7LSbbcLmwKT5fFvqzuAeEE6q7Hnig3TwowMqqS+z
	0stjjF+yMDVqKBM7lcvjsvpZN5aulwdcwmuxjse6vJDNZd421b6gdmdATH0CdjSoIZK0/HhmKZb
	r/XF/XnKAiXhPq/i6HjuskjejhI/kpr/8klKa5N1DlIhnKQCLULaxWIcESWKLZjibOVLqaMekvz
	ERHjFL/e1Scm6k4kg891MQ24=
X-Google-Smtp-Source: AGHT+IF3WK+xyeui9KpM2p+MQ7Ua6+TKDxyMbvyFbkcNlgQr4Pi+4jrdhRTMADxvhfCUjXE8zzU+ug==
X-Received: by 2002:a17:907:94cc:b0:add:fd7c:ae9 with SMTP id a640c23a62f3a-adfad4a480dmr1438507166b.45.1750171650135;
        Tue, 17 Jun 2025 07:47:30 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b48dd68fsm8261210a12.22.2025.06.17.07.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 07:47:29 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: cirrus,cs42xx8: add 'port' property
Date: Tue, 17 Jun 2025 10:46:19 -0400
Message-Id: <20250617144619.1130857-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The cs42xx8 codecs may be used with audio graph card and thus may require
an additional property: 'port'. Add it.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 Documentation/devicetree/bindings/sound/cirrus,cs42xx8.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42xx8.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42xx8.yaml
index 725b47e82062..cd47905eb20a 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs42xx8.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42xx8.yaml
@@ -41,6 +41,10 @@ properties:
     description: This pin is connected to the chip's RESET pin.
     maxItems: 1
 
+  port:
+    $ref: audio-graph-port.yaml#
+    unevaluatedProperties: false
+
 required:
   - compatible
   - reg
-- 
2.34.1

