Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D93029E0E7
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842883; cv=none; b=dW4R9aOE/8B6cTBrAt+roWouHHsLGyROiKM0rS3L3k3Glq/qzR8uDFdhtIYZgGpxY1Lk2NrkoOd+COD8uh5MwY9Nx6IqEjlOnCqbw/qb3Wu5PKMLCKhAivJB5eQGHKj2hDj2jNArXi136DBqQNeDS1wjBqZ9oq6zX6VV6aap5AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842883; c=relaxed/simple;
	bh=eRKXKF6mMaUPaJ+UjU/8hav2GlgqkxDfF+0UOVp5P9E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OHqhJB4N8rodeoGvWncrVrUkaJ1BVJedg/Zqus5Q9g84yH6OBbgiimql2W82JNTJwy+yCm8xld8NvYfEa7iROxSabH919N0SC3cH7g3UTPHJUr1d+CmPGCfqeFAcJOq4tc+MgMrL5IVhhG82J+Sg/tzJK577KL5fnAGtK2g4ZzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=kJ9NwL2f; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="kJ9NwL2f"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ad883afdf0cso256691366b.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 02:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842880; x=1751447680; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FtEbaqMHRXIEvNFaPPE5wU/cQa+kH4fJ7i9D/u9rEcQ=;
        b=kJ9NwL2fWBlgCQL8StW8DxvLDYbUezSBxrRxtKKc6pjD632AHbikoMbQLqGa5v9aIX
         nAe2ECD0sz+reNXmWyYxaV995myKwBTTF3PU6r/SGPobunjR28jOmQ6KsGLdtZO3Bxgw
         uaF7HhwQ1i+AtpLokfNDg4KAsy4Uj4tTINUkm7EgR1FmPlU6CusKGmxdw/+bo8qmwzaH
         p/p+1lonlGRqRHfM200n8qQeFXZJyFezo3R76F5l9ECLiMFxpUGlUgn47JAI34xrBk9M
         0tsl5hVmN5HEM+5yBgSG79+JEhrAeBZeZXRWxc2iTRtv2nlNx7vtm7H1Z3dVouY75RMa
         Dn5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842880; x=1751447680;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FtEbaqMHRXIEvNFaPPE5wU/cQa+kH4fJ7i9D/u9rEcQ=;
        b=b2U4B+7Ubccy9UDEuj/DzZrpnydHlvuj8pLD20WQJjA9m8Z8JvoxXTx7FKrhUJylko
         dgljXHn0fkNeTwBZYIRCpHBe6OUFIAdFxuaawoL/4Q84sFIAlOQRcOC7qHXD4u+XallN
         yrhsiVKa1f761p0zmpkyuVdnMZ/xV1RW4e2Sojanx46Yq8sbZL7d/jsDm94DmQhMJ2+z
         FaxWgvW6dUwj2M5FLT1haw6uSRoTT64EtBDCGZmjnaQM8Y5cqY1yOSabt+mXh9rLLvhL
         k/bNEvJ29gPhWhIfwbaZsiWuwOKtUqveiRVGH/p8zGFxeUwZNZnqXPLpLfenJmKteaDb
         Ep7g==
X-Forwarded-Encrypted: i=1; AJvYcCXRLxI4QSSAiilApTGGwo+l53oIgeHyUwzNMFPnu/XnzEDodwWJCH0SAc40cez840BSrEYMoaxGfGfUDgs=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd4OSi3xxhhsn/Q3UqWCGBkGKFIfj+HuEwFjvW+fTb7/lcqH2s
	6GXJLkYX9yP7fk4TXk7zCW9J0VfFHZfCS2M8qYF1Dqn94eUKBswEdASZAaiRpqwpsY5EhWDOIML
	5UU5X
X-Gm-Gg: ASbGncu6wFYYP/wW/Q9/9E/VV1ZKRKPkEfnJel9PtVsWPWPVhvjbFZ2oo4XlPwAyVHV
	ZFv+V9cMJuAmDxpNNjCB4YOtVkXWmeIQtbfjyTBHP27crNhxGC66TnslAeopn10b9TOQH9UCVc0
	DJ32M5bj66jVvBKLasiAskWFoIwJkhAwsaPXG/bn6m0OY1qw4zQSexK3Zpb5xN7pOgN8ouVcY0w
	PzsEiGb2K7GCPhvT1UBiPxNH2eO4R8DHJCsttUV+YUusamIx/McMZmJB00XoLmmy8Unb2zocIm6
	eRkLoHtdBjIpOGcHj4R0H+Eba/uzvGVnZ8WN8vyclp8HTni15jJCQyapKLkNgWBTq4dOPNeCjjR
	KQoXixEV3ZWTJFzvc3QwyVLDp380qD7UA
X-Google-Smtp-Source: AGHT+IF1iuoBJ5/IWRuTBr2H+764qhYUfliJ6K8sCXaPslobIM/iwfyF3QHm7EtNXEH7KW3eJUZwvg==
X-Received: by 2002:a17:907:1ca7:b0:ae0:c215:5be2 with SMTP id a640c23a62f3a-ae0c2157b5bmr180401866b.30.1750842879941;
        Wed, 25 Jun 2025 02:14:39 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054083c95sm1021480166b.91.2025.06.25.02.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:14:39 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:14:29 +0200
Subject: [PATCH 1/4] dt-bindings: usb: qcom,snps-dwc3: Add SM7635
 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-eusb-phy-v1-1-94d76e0667c1@fairphone.com>
References: <20250625-sm7635-eusb-phy-v1-0-94d76e0667c1@fairphone.com>
In-Reply-To: <20250625-sm7635-eusb-phy-v1-0-94d76e0667c1@fairphone.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842877; l=1298;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=eRKXKF6mMaUPaJ+UjU/8hav2GlgqkxDfF+0UOVp5P9E=;
 b=wpxdiMwdD1qjIVMibt8wuPqXRsBEHwnN9wfoc1mcjsqkiHBTcfoYMO2yrsvY9XvCAP+0AjcCW
 idXpk282ffCBG6St4/1bJgt6brzsRTr2oSi/pUFKtu8GSwHflZVg6P3
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the SM7635 dwc3 compatible.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index 8dac5eba61b45bc2ea78b23ff38678f909e21317..07ed7c68470d7c951e3a4259942dfe1eb257b939 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -60,6 +60,7 @@ properties:
           - qcom,sm6125-dwc3
           - qcom,sm6350-dwc3
           - qcom,sm6375-dwc3
+          - qcom,sm7635-dwc3
           - qcom,sm8150-dwc3
           - qcom,sm8250-dwc3
           - qcom,sm8350-dwc3
@@ -345,6 +346,7 @@ allOf:
               - qcom,sc8180x-dwc3-mp
               - qcom,sm6115-dwc3
               - qcom,sm6125-dwc3
+              - qcom,sm7635-dwc3
               - qcom,sm8150-dwc3
               - qcom,sm8250-dwc3
               - qcom,sm8450-dwc3
@@ -453,6 +455,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,sm7635-dwc3
               - qcom,x1e80100-dwc3
     then:
       properties:

-- 
2.50.0

