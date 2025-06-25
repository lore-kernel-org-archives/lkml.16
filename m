Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2286267721;
	Wed, 25 Jun 2025 15:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750866221; cv=none; b=RBaB+Fm02uTK7jul/KVdRMLL+PirvemcFmgFb3+mp8XoxsLs56WeIvywFVp4N95o2/CQ+EXdD98oWP3jOgPGs9lCPQtZXiUmaJKDwEDlMrOWeeYDi9c2Z6co25dSpQbaPSa6inx2dkvFLJG42POMERtehz2B3s3PR3h94+nJwWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750866221; c=relaxed/simple;
	bh=JaYterITZRL6AjGGz5dtVdkGliI0GZeB9bAcq7ml8Q0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qf6PcHXi5V2JeTTiVssUP7VjGRUEOxtbdX7GgteDI8M428slOB6LvXN2XGZd72PbRv6aFCNxqv3uX5C2F35AERRSzgaTOkqjMOJDXTWNOMc9qxB4zLJ0pftRLqvJtW6yq8gCU08CcU2aVlbkJO+8BKVYVCWHZQozfniNOeXVjG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FOndpCKn; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FOndpCKn"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2349f096605so335425ad.3;
        Wed, 25 Jun 2025 08:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750866217; x=1751471017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YtI8ysHDGF8GpZRGmovRBTlbGiNf5VjMID2yRTeQRTU=;
        b=FOndpCKncjLBPfH4MhroI8zQQXu3HxZ30lp5c2WmiBPOEiK5wupiESuwIlhFjgNzfT
         T8fFrVndLT0WAgszeTGfjvoyNIdGurjIqRwnmm/CmPZJ9sT+OfiZvPexDqIG3/UG+mLV
         3U1dOhWCt+DPkbcjzYBzlOkdKaSSJkW0EqtijS2RRKHUOhQFSj8itRVOc5PUu8pS8cLR
         9ZHfv/hW3PSQnVkARa3aS0AfewxmQ1u9IxkT3Y1G7ke+mphVjmpXWFe49vbkGBlkDRbG
         EaaQzWD85v+WWlbFOvrerKbVw6d/Y2Kd4CYbPMxScvYZG6Q3Kj+R/RNaia/BfE19KS8k
         qBTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750866217; x=1751471017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YtI8ysHDGF8GpZRGmovRBTlbGiNf5VjMID2yRTeQRTU=;
        b=bFnDc7W/U8IBVRFQDprus7jlHrB7SCVt74Fp+yd3EiIuOhHNAbJEOx4xUvMlhCyoyk
         aSBBl3MISil7T2xjSca15mceP2SNffAASi0Uk7gkhfkXgV3dXBF/m/GZKwtIQkGa7mqd
         ANXlVJEemnAiF8e8sGm62X7H/Nik6c0VpIkwG0btkG7h9wwWwA2PG5pof0hKAWI7Bw/q
         KyVFW2AlhBisqqMtODrf5qKhoFfCkw7P0V8r0okxqBlqBSU6uPzb6FeaKfW+NkGDHoJt
         Q1Irvbo9NSBQkrhZn0G+f6yhXZKq6ZatgKzbxh7dIjTGccEavOJW/GJUxfKQWqSJHbpZ
         LmaA==
X-Forwarded-Encrypted: i=1; AJvYcCUVtJIgkUFf2zjd5H/tO8YlGv5IJQjVPMMGRDvpSfIKzJ4HxD4I4EyvvZITD08eStOBigy2tOCVO7lz@vger.kernel.org, AJvYcCX728uM9bB947jRoDqD5u5qQtQHol6biaPMFOqV9XdOMYVsCAWqNLxHg6YjkOM0KpOKGgrGe/LHIWeR28js@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3iHDvhMH5nFXB6qz0x/gUH/lMhwZfa8ficRAKxXFu8IBuVchI
	bZ8o9yurtfDEuOJ7DbvUkviaKOySPy2wZnjHeQvW8NJWRp+DnfEX7Gk0
X-Gm-Gg: ASbGnct4WzJdYotvZPIDXN/7bNsF8VmpfFHw8ljUBwZf6vPJ6Dr1Dy1f+KqjaC5tN84
	1Oh/jf4vQ8d/EnaShaaSEm0vJzl5X3qLzNFAT6pHRjhTqG36xgf6QEIebztphIVAh4deeXQnsrS
	iJ2jqr4v95FATL750Eynl5GzXRawsDr91DDw66+pnGAZ1pjOoKQGsBUsi6QLA/ITeeapsjN7Ac/
	7qt6XY2+73EkxncvJsOaSL2nHXCWMkDCQ8snxJ721SjTm2SedjuUEZDGOeWh50BFsmvV6JJqPfp
	DF5p8AjZiphbQ9RhWi9cwMUk5MUGaWKH9vgxCU0HQpj1Zmi47K+NkoHHCVuYbIAY5Ol0hofLR7O
	Y
X-Google-Smtp-Source: AGHT+IEojHuDEfhv+Il/aCDRUeJzWgS8kwDdwg7ziLognMyZb9CPBYDF5z+fFQk+f8Y8ClCOfvDCmQ==
X-Received: by 2002:a17:902:f541:b0:235:129a:175f with SMTP id d9443c01a7336-2382404b2d6mr68604945ad.34.1750866217108;
        Wed, 25 Jun 2025 08:43:37 -0700 (PDT)
Received: from ubu24.. ([2400:2410:dfca:c200:951d:3a1e:f612:1525])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d86628ffsm134229795ad.156.2025.06.25.08.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:43:32 -0700 (PDT)
From: Taishi Shimizu <s.taishi14142@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Rafal Milecki <zajec5@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Taishi Shimizu <s.taishi14142@gmail.com>
Subject: [PATCH 1/2] dt-bindings: arm: bcm: Add support for Buffalo WXR-1750DHP
Date: Thu, 26 Jun 2025 00:43:14 +0900
Message-ID: <20250625154315.114139-1-s.taishi14142@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Buffalo WXR-1750DHP under BCM4708 based boards.

Signed-off-by: Taishi Shimizu <s.taishi14142@gmail.com>
---
 Documentation/devicetree/bindings/arm/bcm/brcm,bcm4708.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,bcm4708.yaml b/Documentation/devicetree/bindings/arm/bcm/brcm,bcm4708.yaml
index d925e7a3b5ef..f47d74a5b0b6 100644
--- a/Documentation/devicetree/bindings/arm/bcm/brcm,bcm4708.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/brcm,bcm4708.yaml
@@ -25,6 +25,7 @@ properties:
           - enum:
               - asus,rt-ac56u
               - asus,rt-ac68u
+              - buffalo,wxr-1750dhp
               - buffalo,wzr-1166dhp
               - buffalo,wzr-1166dhp2
               - buffalo,wzr-1750dhp
-- 
2.43.0

