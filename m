Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112281E5B6F;
	Wed, 25 Jun 2025 07:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750837138; cv=none; b=plCXb+F11TaqRxazEU7vuafKpzBx7qAbbWUT2qF5RTwNwCCpy+TfxJKMQBUpQle4AkJwQb/PePMz7Eu7+2z7XeozvMJqYVPw8kG/WLVdL4PHKbLy3Fu09O3Q+cxC3jASnvlNIL9qoy7XPCgDdgnEqE0fESv2ZSIRX5XLi08bvYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750837138; c=relaxed/simple;
	bh=VW1z7quOUVaSxQgJ+9/BOsabZt0GNXzoFywJfXHGils=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tbx8z1pEZdUNwnScT5nAgW/QJ8vMb68Wmg2i3XrvqDkl5oNy98BGbEW0SItmKTTIY9rJtuftx+S+sRf3NSjnHX8us+izLgJiw3R+5lrG8lh5723V7K2SMKOmlBc3o6g1PSM1hMK43EkN7mxKc7U+F6rUnzJ4jBTiaOQyC48mt7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cyapod39; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cyapod39"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-234bfe37cccso17864055ad.0;
        Wed, 25 Jun 2025 00:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750837136; x=1751441936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f2k6QLhMs+Ybe7hFRFwIVvK0vEsmpmU+VkYws59KtZA=;
        b=Cyapod39txS0VJ9d7la6W8ogkwLdRnrZWNkaPGVHLkUgcS7wJ6YnjcfrAIZNNJ80bn
         bfB/blz2JKDFdaIP8Bnvz7QmZKHS3iYP6U7fKgdDpwxULPEfON08YDe8TCJNwHeJ/pjV
         tQy5M0Evpwlo7GjDhMkgFpJQoRiAFySl9vrAzacw1hHUJadw9E7ORsI2R2iwBHZX1ZiB
         DD5JJ0uy7BHgq+qAZMkgBVxXEEq6lj0KIIRXRKTCBHUEtsRyAHA6irOfCxFVnLb5HfXH
         g/AN/XCAqsJYX60Q7q34WgGWGC9Yl2APcpJXwB8nFrvOcagD+LX9cAHw2CjRsWSS5qrK
         ttCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750837136; x=1751441936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f2k6QLhMs+Ybe7hFRFwIVvK0vEsmpmU+VkYws59KtZA=;
        b=nK2/Imj4H9fMkgQkI4W/R7mblPI/0ntAczwKRaQnLe+wieiMyjIkgNDpm9ix13/5gp
         D+Wu4JybfCmaCF//2BHmU1qJzFcVIQHfso9kb6LLGHUxvNvIWX4vTu69a8qnIEM3phUr
         7KhmJL87wOeMdGpiqkdb7uFuoWYZjgCw22RqzipU0OOFWR40+520cPfDgRLSBxxgZ4Xl
         LgngoH+94ivMsH3GSJiR7MGRHQeiniDVP8Z0ce2EGLusEgrt799V3bY7EGI+1eiGhAY9
         sa328u3Xxxqx3AOKRkz4mEQsJVghr5YAb9fT6xTw83g/o9fHxT032Kbt5o/FH2KIVrH1
         DG2w==
X-Forwarded-Encrypted: i=1; AJvYcCVkjLna5NfaAjcU/EsizHLYNW6MhE5q3cnxiRhjJpta6ExJh2Wdd70fHkpyQTvkNSdjU/eAxY++mu0nTzKD@vger.kernel.org, AJvYcCW7CtoubNr3K+ujcKiom0TT+JKJToTegifrGinuVKzhxO0zTlBQlvjxaJBtmXEXfnZJA8twdYv+gqU2@vger.kernel.org
X-Gm-Message-State: AOJu0YwIkBKTFuMtdvTInB3Sg0UF9N72eWBq2O5t/WrbS8AmR2WFu2BY
	11QLbzgXJQUFxgzMStQkNeC+jk60sKg3PgryMvh6VII6A765qa1m0+WQ
X-Gm-Gg: ASbGncty8nWbeMExUNusogEdj4CrWxxo3Qg8WJsO1FIzs2o0ICTGwtJxeE3e4hxm+NY
	ppVWGij/yk+29zP40U60gWNuWnUGBra46t/I+wHTdlWFYkYyMjg5HcqmKeOve4cZtWDRaOs9dHN
	Cib5a5EgXp+3c4jJIAuQ6LRe7MjRhk6K+GbT3gg9afyHg+kctO3+Cfa3G0+WqZT7grDWJegVW14
	ImWuNctzqWU10WR4VotlxC/sVC4cCwl+PCIlMTi2Ck3htBmr0eBQhfeAPdT750uGCvIcqYEtHRP
	TreTlmTom5mMJWNQLW420Phj10O44ySG26cDLahNPS82/HxGPRywqtlxGmRoLxPZdXxEuYvZJYz
	vHRvrqrxqBQwOJgBPE3O/3WpniL/FLm5aIaY6s/cxiw6WaWnQs4Qf2cqZIMnGzCtyOK4Sv71+QY
	MvUCeTb1fM4xNLWA==
X-Google-Smtp-Source: AGHT+IFPhsOEHB0AtL92cnu1eg5DcAJ4zv8O/1nAazjCboc//yT2Vhmq+mZ1KELkj888CHOfjGO1KA==
X-Received: by 2002:a17:903:2308:b0:237:d734:5642 with SMTP id d9443c01a7336-2382436220bmr37350915ad.41.1750837136289;
        Wed, 25 Jun 2025 00:38:56 -0700 (PDT)
Received: from fred-System-Product-Name.. (2001-b400-e389-b6b2-29b2-bfd3-aa15-d345.emome-ip6.hinet.net. [2001:b400:e389:b6b2:29b2:bfd3:aa15:d345])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d86a3083sm125374285ad.195.2025.06.25.00.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 00:38:55 -0700 (PDT)
From: Fred Chen <fredchen.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: arm: aspeed: add Meta Santabarbara board
Date: Wed, 25 Jun 2025 15:38:37 +0800
Message-ID: <20250625073847.4054971-2-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625073847.4054971-1-fredchen.openbmc@gmail.com>
References: <20250625073847.4054971-1-fredchen.openbmc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the new compatibles used on Facebook Santabarbara.

Signed-off-by: Fred Chen <fredchen.openbmc@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 01333ac111fb..a965f1a03051 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -87,6 +87,7 @@ properties:
               - facebook,greatlakes-bmc
               - facebook,harma-bmc
               - facebook,minerva-cmc
+              - facebook,santabarbara-bmc
               - facebook,yosemite4-bmc
               - ibm,blueridge-bmc
               - ibm,everest-bmc
-- 
2.49.0

