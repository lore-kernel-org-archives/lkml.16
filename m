Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06260289E38
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 13:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746625925; cv=none; b=axSoqrYKUeFo7i+zo7Gvs8V0D1j2aLPLUrkKiRQsoiNRGC2TdnUgm/i4so/XFdyOssoWbnntn8gvWzEEMomA+qBkiIYYq/Opns3Nt/KuBsjubisbBSWmMakcSms7H3aAESye0V5t6nlAFcRAQzG9VGtrYeiQpMmh0deAv680e6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746625925; c=relaxed/simple;
	bh=5LLKe8a++xD2c3tJVJ8drGjnk/736Tl6kXc3j0/ObLg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ncExgUTNhZ6QEE+Xosyss9xYNhxRgBvdj2U4gkUWy4yNf0kRi2eXLyjE4waczbo4nP0wThibOR8KiNslhADBfDoqoTp77e4qoy7x7eYTQJkoIeTuF7DXEDHfL3eWX7QRA4mJZFRGJjW8Sax/63RDxgJ8si64TRB+3KDJH3SFpBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=lFAhvrr/; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="lFAhvrr/"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac25520a289so1176304466b.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 06:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1746625922; x=1747230722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7GeKwUyzeFoIF4XHNI7B0gCteSiC3k5ZfaiHzje0KNY=;
        b=lFAhvrr/x2lCs9AaM/SYfyToFSb5i2OyrG4DEJm4NkxKfoRAsd3erSklk/W8AJ1JMM
         mUJqPvjfLN0DXTjKTDqhuenAUbGp6bEPixhKMk/TCst8b0MCfBrTVhElgkJAVv4WEkQ3
         ACgZmU6p5+YtfDKuJpo0xQg/imF8f8l7hezmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746625922; x=1747230722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7GeKwUyzeFoIF4XHNI7B0gCteSiC3k5ZfaiHzje0KNY=;
        b=qmerAxW7+8aUEYZFTN9Wb+QMzhiWpvGfpDhTUZsdmrLBX+A3/ReopUk1pUBPnX313I
         D5BrXQo7YG3dN4LPkxahZ/d8XpVmtLrUdvX+CmoVsK6UH93dxxlnv+KSGZMTSuayLyb4
         Bo3aTEiLj6ZfSWLQzUkGUosJMuXBBQlUhqJ+Vtw7YlNJyCWCi/QSpsyuG4BNCqgBrlj1
         sO78f6ybIIPLlmuRDrZ1cD0GwyCzfyHHg+xFGCUGoi93ibtiNa9FRwMm9Rl6YFKc8lom
         GhZEENA0+VPv9Ox1zCzNNAQvvJvIR1EuXxK5cFL0dBEFArH1lpb+b8CFavdsZwf/WesE
         EqpQ==
X-Gm-Message-State: AOJu0Yx4KRkRfqjaMVC6fIqGKxjnMGkE81Kn1RkHyYJqZ/2zYQK/OrEN
	c1QxOsWys3sydkcfmkxC6CC+TZkgZT53YWGBgHarjufdidUh1FX0eUtFMm6EnQzRb7jpw8wcgmS
	2
X-Gm-Gg: ASbGnctfRIGcc6wTZ7AqqUCXxX+UPKPCHi+/7tIf0KwOcltOOY5CdP1D5LlAB2UjVsu
	YEzAiKTah4BBLdok30/ewaCtOIs1dzH3s6w/tRavLd+DZjRqnT1yIrZT2HhJtnmBpd25GVFGfRR
	nzT/1pJp+lKMuX8kYh3xUUmATue7jcXYYckWS6Le9uzl+/wjHGaj28xQAnY/Vb/LuTya2aP+Ojo
	9mOp2+AUZ2vEx9efe14j9BiT+poQ5tKKHWxA9+90W1tz/YPwHQsLzjnBDtsTd1dKqOQY5eePCI3
	c5zEjblzIISwPPrCF9iVOoV3aNz8ReMxJU/OreHSPFVERvH70JCe4QtBMvIu+XwXy7CqOTa6WFc
	eHhQ1CDUolKUNcE1RtNAOrkFZBkIUCA==
X-Google-Smtp-Source: AGHT+IF8nFh7Jj3E3ztZAdeC2ct0kjtnQ1x6LvMRae+EEiYHTrZbN6TQQ4YbOvTXqTUEGvOdOJzFVA==
X-Received: by 2002:a17:906:bf47:b0:ace:6a18:595c with SMTP id a640c23a62f3a-ad1e8ce4c1emr334611466b.16.1746625922122;
        Wed, 07 May 2025 06:52:02 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891a6873sm920845266b.61.2025.05.07.06.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 06:52:01 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Mikael Gonella-Bolduc <m.gonella.bolduc@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org
Subject: [PATCH] dt-bindings: iio: light: apds9160: add missing type definition
Date: Wed,  7 May 2025 15:51:38 +0200
Message-ID: <20250507135147.1328639-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the following warning:

 Documentation/devicetree/bindings/iio/light/brcm,apds9160.yaml: ps-cancellation-current-picoamp: missing type definition

raised by command:

 make dt_binding_check  DT_SCHEMA_FILES=fsl.yaml

Fixes: be464661e7532 ("dt-bindings: iio: light: Add APDS9160 binding")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 Documentation/devicetree/bindings/iio/light/brcm,apds9160.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iio/light/brcm,apds9160.yaml b/Documentation/devicetree/bindings/iio/light/brcm,apds9160.yaml
index bb1cc4404a55..f9c35c29fe04 100644
--- a/Documentation/devicetree/bindings/iio/light/brcm,apds9160.yaml
+++ b/Documentation/devicetree/bindings/iio/light/brcm,apds9160.yaml
@@ -37,6 +37,7 @@ properties:
     maximum: 63
 
   ps-cancellation-current-picoamp:
+    $ref: /schemas/types.yaml#/definitions/uint32
     description:
       Proximity sensor crosstalk cancellation current in picoampere.
       This parameter adjusts the current in steps of 2400 pA up to 276000 pA.
-- 
2.43.0

base-commit: 0d8d44db295ccad20052d6301ef49ff01fb8ae2d
branch: fix-brcm,apds9160.yaml
