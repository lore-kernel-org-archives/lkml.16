Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C45128850D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843100; cv=none; b=uFvUxxjGphaGufgNa7IZVS/Vpq7D2DxlAYKNvh8x/iy1diV0jWKwIkOUhalH7vxDXbOzHOi232pKe+lLGtiA1GGEN8EdefQ1DRckpBL6biJ+3eeOIupXqBiIM6gWYLp9nMsrIaMZgTM5xGxbO8nNQGOQsxhD7JSx6Gj7bF0aU8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843100; c=relaxed/simple;
	bh=FFyi2TTwWD+QPai6pEi4JyevuUJcOl9Vi7QGCJ3xztw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LPzKz0LwYLYemAEW3yv6ix0TjO37x7UGsfqtGnklP6vRi+Q+GMKtKi1L92/1r6HrIKanpNg/47jhjxemFdkQ/5HIvYHgi/5yT+6lXXwAFXGSbusKOCgH7dYImgK/n7cA75o796ve071mt2gdH9w3cHJmnzdYEfKHLZLRq2v18Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=uNaTUOOR; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="uNaTUOOR"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ae0b6532345so136986566b.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 02:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750843097; x=1751447897; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f2RSqLPZu23r28/yDYeK3iwSZkpIKmCaKnn2t8cvfxc=;
        b=uNaTUOORyt699w1SXS1CH76sfqNrxw8t2G721zWMKUg64cNvebxu8wBiaK9pjYZ6CX
         7lVBTaouM/NXE8f/sQlh5Xw85+kNIXy7GYIT9Zchphrn0nLsMCEPzXM165nAs6xQ66UF
         r1ZNDkNksoQmdfe1osabRWzW99/lY2gMcJPHcTptlVl3GUZzuaHslSTiWLIDvYYx/fM9
         0jeo95qSbmyKGmHY9jSCZxvPn8BAbvfMKLuW5R7cLZF8ZeNjUUhZ0g8pCNujn60xrX4r
         YJqLKA8qJ0U9+VHa4fgyIqtb0O25gne9FKzEMg1hi/+ZhgyhfZVgxi7WObg7ojCHwb+f
         aZ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843097; x=1751447897;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f2RSqLPZu23r28/yDYeK3iwSZkpIKmCaKnn2t8cvfxc=;
        b=s0jMaXTLsUl/WcBBuIp2awL+YtGPnJV/WRhxgjzNRNSadvd/WoGgS7sX3UdvogxG5J
         bCkwF3L6L9FHi0XIakWbzd3nn2BHZK5iafBIi+5uIi3pkKOaQIJFkV6814VO7aM3z5WG
         n7IXjkYemirj9aERQ+QEEWXw8zpg7yaHDi7z49XZZBDjLbx3Lx4L3PJ+ezdkinW02rgF
         TeyhR5WewEEK5kef0GD47VnKxdvoGJ5q/Ku2a24hUxwBf3RFmIbF9neba0uNMQebt6KA
         7q52l9/Oaf0pe1oGNCuZYd3Ul3pgcdE3q+xrIZmPjGQ5F85ihPPGVxVKn42RWYBvoiqg
         11TQ==
X-Forwarded-Encrypted: i=1; AJvYcCVc/CE3iUl71SBFN2welHAXESM6m4OH18po70VQtv0FHMUHJxhUSPcD17uR0fO1Eqiavf0RNxVmdM56czg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0k/SHCOuXHhgQmJX7cxf/Q2NI5P2dTeyTnO9180SZ5BUw4038
	vnNwPfj4QqZmqs011sZ4kyX3XmfEsIXLRbKubrmeNbWbMdtFoWU9GkIpXHHwInLtu7M=
X-Gm-Gg: ASbGncu6XQATuFZ+oXFCq3mkDSvVBwkGkNneinV9YEgZAm8mjMujPkjUGk3zwGWEcto
	EyUp6r+gw/G/yah2CusUjhSmLlPMHhKs9gHFHsHLdfkTZMvfNE0siXjIaJtKtIkLiAkupYliwQI
	agkMpfkSNwCEs6q89pczeLKvIJPsFY2jInWMWb8+Nm9o3n7zuha6c47LKPVZQpDaU1z98rglHWa
	NSg/Nq924kYPCe4vEGH4Ku2aRamBYaSWA8A296b44NrwlV1rxrLT7LmT67Ky6QVSObmKAMMGKh5
	PzElRw4KqggNC+jJDF3pN3IiSURa1OY0Lzo0OdynI2pOqJMEVHafEzhbIJdSVBBVjmyYbeZEycb
	3X6Fr1nPWmzfMZGhPTUt0gZSlT2jm0cRs
X-Google-Smtp-Source: AGHT+IGYD0rC/aYIVmAXapkPflNDUng9xnrOy/PP1ovsYL3Pr4WT+utJBYAgP6x9+IrqYJvL1om8Hg==
X-Received: by 2002:a17:907:d860:b0:ae0:c4e3:e2e8 with SMTP id a640c23a62f3a-ae0c4e3ed50mr133302166b.28.1750843096666;
        Wed, 25 Jun 2025 02:18:16 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054209c85sm1009952366b.160.2025.06.25.02.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:18:16 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:18:02 +0200
Subject: [PATCH 1/4] dt-bindings: mfd: qcom,spmi-pmic: Document PMIV0104
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-pmiv0104-v1-1-68d287c4b630@fairphone.com>
References: <20250625-sm7635-pmiv0104-v1-0-68d287c4b630@fairphone.com>
In-Reply-To: <20250625-sm7635-pmiv0104-v1-0-68d287c4b630@fairphone.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750843094; l=829;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=FFyi2TTwWD+QPai6pEi4JyevuUJcOl9Vi7QGCJ3xztw=;
 b=cfWhIW16u8AU3opUGXPjIMEz+f97knPAZaejc4RLCxX25LbhEo2hfOqSlizWFGlJWr1mlUCuK
 Lvms8zLfWujAlr9MWTSzk/YxpC+JHEZuQYOZF2Sbd/FZsDPal1KKBdI
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the PMIV0104 PMIC which is found on e.g. boards with SM7635 SoCs.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 078a6886f8b1e9ceb2187e988ce7c9514ff6dc2c..c416f25c90d6d9f8404947d1fadef91cf664e666 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -84,6 +84,7 @@ properties:
           - qcom,pmi8994
           - qcom,pmi8998
           - qcom,pmih0108
+          - qcom,pmiv0104
           - qcom,pmk8002
           - qcom,pmk8350
           - qcom,pmk8550

-- 
2.50.0

