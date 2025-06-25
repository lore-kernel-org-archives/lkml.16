Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E4D2D9EFA
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843395; cv=none; b=tDqGvm9zCTguYm2pVZKkLePimiNMdFU8pjO0BozGhHWNfe/KYQjNcTpYqI3oILQg5a1LTI6cOfLY6Rvsa5TLPCVj7nC2YcjXqXnQUDrI/TY1vfrrQkgqdXoUqYJ1XbyN184dXN95JF0EgZuMjUlxQRWLh2a+cy2aT0l5jP4j3hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843395; c=relaxed/simple;
	bh=cHqszQuBCaVtspU1t7iOjEc+5vwmG2p0Bi0y4m/DFOg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bvFXTiAw6RjhL8lqrQugVZ1frEw/LW/zqRL/xub5c4XLE/U4Gu/oq6xZuKzZnAxjl5gaqnlRxjsLOZXJEd433enWEVXS+uVTau4f8UR79/6EYOhCVzhbsYPwI5r9Czs9FT3/COgVyaoocHOQHurv37KizaZB/QoeLKr5ZiMN+To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=qQimaYIy; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="qQimaYIy"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ade4679fba7so240807766b.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 02:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750843390; x=1751448190; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cFtr36P+rCcWPRSy5N2MbhYZaAtcWKoXHXQTaJufVVw=;
        b=qQimaYIyKlpWXgEyXsJfceYSlAiWv445eBYouhKZTk7GRDZF9NDZI+OORDr2FZoiMG
         QK3B2iBxgNv1QEToOJK2HOSn6ultvfEnrA+AwHWhxmvE4PR/DC3iR2Q8ucbzR/yvxV0k
         X+I9erIbTIcoq20/bkchLLRiou+5tx1VLUrqGHwseFFH7AoXYnRQ5tqtp3mHH+9aweno
         dz7ibgia4pGRS+EV74ziqinpRJObnfXvyY3z43I+b9vIowcrNIXnQbF33k0rYiKA5aPS
         znj2Dux9yYKnUw4R399gnDhvl41G0C1z62gkeXrkEknJsdMaF4BaViziEs9mkvJmFglV
         SgeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843390; x=1751448190;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cFtr36P+rCcWPRSy5N2MbhYZaAtcWKoXHXQTaJufVVw=;
        b=Q6mna5UheyMdkMaR+1bOqP4qFLpz8vkdHlSOpVAM4tM4EJT8Y3DHhHtXHrcUQ6rP7B
         kmgApZjqkdtjPDaVS3Mgp2zpx/JbrZnTOyvYnu9hlvcQaUsSk5CErWw8xdaf7SVEu/ue
         RWBlQg2ngN672bCOZAmLZIRecQeQq+ly+DP2+8v2Ze2zu0xS+X4+6pJwgZE38tdNgEUH
         Gn6ZXDoWlXvF0J0PUkkRwG5i1Gt2/kGuuZN9UgAf42+fLBMvi8cpCN/j1r2opcqpfofi
         3Md2EqDhCdZ1Nn6JbzYaTXv2v0tpQ7Y7/xH24aJ5z/2eM95xNkYEEw+PUNEatq97H4pc
         Tleg==
X-Forwarded-Encrypted: i=1; AJvYcCX4U0WmUof5ukQUt/UFs/cdmUl90TDX+IqOKj7A/FP7TjOyLtdLDisL1AWomMFwwnsBxO4l/DvFC7TV3yE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyB0LJF3TZ0WZoE0OIa+OLmNIktmWs8LxbhbrMxH4NUaMZ0Adgx
	YD6gmdDl1y7tGi4O6JEGQyTvgQW3Ujy9EdIM2SH9OYL21G0vZRk/UDLK5aJS9FMK8I8=
X-Gm-Gg: ASbGncvS3smlFNIb3A58EOg9nSsldq4bbhnP+9yzLxLJ2fFCINX3roT2od/Bx4dL9SU
	6tJSYD5BeoCtafsD0n/odAEimMs9TwOa6UEyrTlfxT82zuQXKwUJd6pKxs1SJmYpfgkUrm8sa0k
	9PicbUtjPc/7WwdgrRVvwqB1Z3t8VEBdov+Nc9VErzHbgtOZN3N2B8zhqLparXsgOxX8Hh/av5V
	B3HHEjSYNZHL6qG3TCjUWiSN9wWQN7Gfa4TCmyEAT6ow2eSVQZIBy3ir5VkBH5XdNyP7UJ3/9VD
	YXeV8ctsYepvHRAUUqo4yht4IsDc6t/hsBH84yDl0LYlXOsJiiX+/tsQ8ZigJ9jC9B4t5VXlz1s
	Ktl13TVt44XP2jjUDtJoiQL0fWFFdx2M5
X-Google-Smtp-Source: AGHT+IFJ9o4JWl7lIDkFxyVHQOH8cM1/pOAHHQWQqVQ98/eGA7Vc8alvEQuTG6jNWUZwYJgy53sTvw==
X-Received: by 2002:a17:906:ae88:b0:ad5:3a97:8438 with SMTP id a640c23a62f3a-ae0bf1b4c54mr195255066b.41.1750843390328;
        Wed, 25 Jun 2025 02:23:10 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0aaa0a854sm270277766b.68.2025.06.25.02.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:23:09 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:22:57 +0200
Subject: [PATCH 02/14] dt-bindings: cpufreq: qcom-hw: document SM7635
 CPUFREQ Hardware
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-fp6-initial-v1-2-d9cd322eac1b@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750843387; l=1256;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=cHqszQuBCaVtspU1t7iOjEc+5vwmG2p0Bi0y4m/DFOg=;
 b=kCR5siUeapo7dxDWp4dWExqPF+lGnBc97GFA4dxfQD8XoZ1lE5aOP6CJT2iAzeOSwdIFhC4/p
 Z4uY5ayq4rUBb21sP5ZjkiYsj+KLEC4ZuYf4Q18vGbyiwI2d+IWW6Oq
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the CPUFREQ Hardware on the SM7635 Platform.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
index e0242bed33420a39b8a8cff4229ba9eee994ca30..58a2222574e57a8f9c114f5fc3f0aa19d9794965 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
@@ -44,6 +44,7 @@ properties:
               - qcom,sdx75-cpufreq-epss
               - qcom,sm4450-cpufreq-epss
               - qcom,sm6375-cpufreq-epss
+              - qcom,sm7635-cpufreq-epss
               - qcom,sm8250-cpufreq-epss
               - qcom,sm8350-cpufreq-epss
               - qcom,sm8450-cpufreq-epss
@@ -169,6 +170,7 @@ allOf:
             enum:
               - qcom,qcs8300-cpufreq-epss
               - qcom,sc7280-cpufreq-epss
+              - qcom,sm7635-cpufreq-epss
               - qcom,sm8250-cpufreq-epss
               - qcom,sm8350-cpufreq-epss
               - qcom,sm8450-cpufreq-epss

-- 
2.50.0

