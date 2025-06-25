Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8C52882CE
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843398; cv=none; b=R9tX1+z8aCyDZiDgHnMTBMUKVI1xeQUOQzXJwR8FKpiZC0DZPtZVJR5HLKl9Zbml9LPVekacpB7MHokjY1ExLB3eFIYO5tUkI1eUmcHIJ16dQBllKD8T0dJ1Q05u77yvJR1xJrdKzf7sqnUwETptfPbxIcXoG+MYXyrAj+4wydM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843398; c=relaxed/simple;
	bh=uhtUa6TuWWOeZjd4JmW5ZGjrlr6PTEqwVAXpwJZmwlQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dy+fU42KfIX4IhBETTycEUTfZ/9P/+QF8x446Ad1q8aYs7x790j7miUXildt6AG42CskCBSoLe391Iuft4VDeGPF6XB9mX91I7wDHJMgup3DclIZv/fmEZKvSD2zg55WR1bFYIfHoyp1mxKWWq3Kpz9EDmC0fh9Nmr6if99tFfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=O6GlR2UV; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="O6GlR2UV"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ae0b2ead33cso136825066b.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 02:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750843392; x=1751448192; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/iV2ZnPzTHx850i93QH2RHh5n0N52PnUpwC+aDpzRmE=;
        b=O6GlR2UVKmA+vRZ6sretyLcRkZH8+dnknTASGFtbFQ8CH32Vsxl9tlb17kWfAgHRfx
         wwnq0H/+GRLW7F6Q+4IGOZDQG+bPfDPY0Cj8YqWGCv84Lv8Wfw0+WSIiQO/8lXGh+ZpA
         M2zitDv40gMjsMe/6f1/hwUAwQEQk/c3m6StEJRB5qovZBcybrUanrcnAHjsJW94jL3H
         VUArGdbkMxHnJSsCCmIR1BPZdzGzHBxMz0JuGUfvDwYwdib8EzlmL/zVY7gXi2Q0XkfH
         3EcCJDszdoQhhUTXbJ0yFmxDMdjhagaStygqVmfZVifs4gmFBCPh5N+0zoUPr/VH9DA8
         U5Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843392; x=1751448192;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/iV2ZnPzTHx850i93QH2RHh5n0N52PnUpwC+aDpzRmE=;
        b=BAE80UiCOB4mjJShv3o1fc82nf44vsBNJ7MGkWJ0SuFqFZDAT73HnfmvTDleGUtiAj
         SE38UVENeIBb83uw0EVlG4gDXELTjp0vREvbc8k8TYzOMv+7oEGsYn42XsOS0Ov4lJC4
         RcgImZG3MYqHgWzZ6zzlIxB2XSASyZvuiGErRRO3YfFNPsydOjtauIgZGUHmVEtiz1KO
         BPRtD5aQBqHjFpteLM4ibxzp38ydkilgu5m3/gHnQrIIHDZJLRQgPAjmdSwhJ9rIP1QW
         1Y8m5NfZlCgXej1jW0dNKMooU7U5LWvXnsVYFlynP+XAe6MqQobcwtpXu+zMwy9kFsd3
         28Bg==
X-Forwarded-Encrypted: i=1; AJvYcCV7EIyQBRUlEIyI076GwzlTvCl2oF2G+1xYBZv3kRwQmFMBphwUMqXWEwU2k8e29koeTiM1C6ZjKTMyDq8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVKHjqkuz5JKZ8EKZr8ZkvKatERevn5w1C7jiTSA1r2tni96gK
	va8W+Z2CK52MmRBu8FnZtjbU879Eba7o2JGPA6tVjFVKfnZoCB3fy7kMWR+kT+2ePoA=
X-Gm-Gg: ASbGncs4frLVwsdWw+hROherA/spD/HcAk8G6WqgeGivDnQZ1fdln+qcO5/3ee7YMXh
	B7f6U9r6mPaFhkiTT6P+90+70t3aeAzeKdHH9460/jGj7agkA45nPfNoUakRjzKKcIIIXooEh13
	vEXvV1UvvTTbmd7KcIS2c9fBg/HAu6Gg+h2Hz+fX8bvU0qsTodBPmB1qCWFgzaOVMo//fII7IkF
	hMsYxvkIcbi6xpKtYkFrFIby24T6wL1n1mTeUVgkD8ICllg1fY/auC1ZUdyBV6+V/oQrVhA3F9q
	/lT2ID3Okx8ViAsPPr/QndZ1G5xfIqkfsSywZPD9ZtopMIOH7cEE5fLmMqcG1gAWUSHM15VKy9a
	2nG3w28WhF5hwLb10sVNmHQqpan5Tlpm1
X-Google-Smtp-Source: AGHT+IE1gc/uvw/ng78i+q8hHmGEhnihasoPg2pJuO7nZfnd78u9Q+SnvB0RXN8h+HquieGEdTPAUQ==
X-Received: by 2002:a17:907:c1c:b0:aca:95eb:12e with SMTP id a640c23a62f3a-ae0c082c6a9mr173270066b.24.1750843392378;
        Wed, 25 Jun 2025 02:23:12 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0aaa0a854sm270277766b.68.2025.06.25.02.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:23:12 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:22:59 +0200
Subject: [PATCH 04/14] dt-bindings: firmware: qcom,scm: document SM7635 SCM
 Firmware Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-fp6-initial-v1-4-d9cd322eac1b@fairphone.com>
References: <20250625-sm7635-fp6-initial-v1-0-d9cd322eac1b@fairphone.com>
In-Reply-To: <20250625-sm7635-fp6-initial-v1-0-d9cd322eac1b@fairphone.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Das Srinagesh <quic_gurus@quicinc.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-mmc@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750843387; l=1077;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=uhtUa6TuWWOeZjd4JmW5ZGjrlr6PTEqwVAXpwJZmwlQ=;
 b=P52I7QLzFA0XxGiWQVSrZWCETXtQVh8QX/bEHmeiiACmOITY5bmcMCEU3Bv0O7QmN53S50sov
 SnkXYx/JOQTDQpqfdQvrqFD3cdiTSWKxRGwqgKDTvPdxi2Nq493mxam
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the SCM Firmware Interface on the SM7635 Platform.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 8cdaac8011ba499794ebc5b4291b7983c209821b..6ae7405aac658ed5c3524ffc394d845cd2f42798 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -63,6 +63,7 @@ properties:
           - qcom,scm-sm6350
           - qcom,scm-sm6375
           - qcom,scm-sm7150
+          - qcom,scm-sm7635
           - qcom,scm-sm8150
           - qcom,scm-sm8250
           - qcom,scm-sm8350
@@ -198,6 +199,7 @@ allOf:
           compatible:
             contains:
               enum:
+                - qcom,scm-sm7635
                 - qcom,scm-sm8450
                 - qcom,scm-sm8550
                 - qcom,scm-sm8650

-- 
2.50.0

