Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC732242D81
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 23:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745452420; cv=none; b=qb1Om1RMTBv7TEC+USfNgib66Ac1oLnfqYJRXuXaYkG8nnkldRwJbAU/IItbpUM5zDp2t8tY+Xx3s6OCC0MJCdvE02OaAan8yrvSrQXFMWnL2o8HSs/OA4l8epKJvF//Ga+kp3LWwhNbpFuebd+k0bCVIC/43zPB6qDjXLCYV/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745452420; c=relaxed/simple;
	bh=OPdi1VqB1omOpnUAwaklrwqievoOBra4zBTdgs/6ev4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YQyhdRNCcHGamU1DLk1ze8yj7GIH3YqJjManWxrghyGgmXTTkYpXMJ0ljILUWJTE9G3yiN0qTAIexlJA0bc3C2VgEeGxrOJDw3vYGW7xKU6n5D2B1mbVGS/YkVaXRHPvlEQZCZV8wYgB+ARWIZjsAPYMXtRIM6pvcVR2jCSutuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=udoV3995; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="udoV3995"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso1098878f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 16:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745452417; x=1746057217; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fXE7IkMB87zw4RjQxYE2EK7ftI5E4rkj0M0t7A4qXHM=;
        b=udoV3995UEptANGzDngAV2MTlatBkoci3OgbAnEjwVahFdRc7C318yKgjpMcFgov6Y
         jVxy1/B9FKCrMtkNgbHeMx9z33QDonbHJYiAe7nnQe7k/mCVk7Rvspzho13Ms6HoBt0L
         PxZPmS9eOimzEq666kAq2XIE/OTI7KinJs5FAyOrScmqqHfHPUCeQEjwG0AZ+MoKmTEc
         5rSXj48sNjs+++B7Pd6KZkPK9f8fgmSay/9VFgVvHHaF52Y9QA7cr1SN5gSYJwyjIqU2
         /AZG/tSsO8bUyB5zVAr7XavGbYrunQXHgrzgBeQ1jZMLzjtahj06ehEtTv5TQTc1abKI
         PMBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745452417; x=1746057217;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fXE7IkMB87zw4RjQxYE2EK7ftI5E4rkj0M0t7A4qXHM=;
        b=BiRQM2fKKpx0J1JLmZ3Oj31tDsbMrPZi/9fbssP0O0CwVB/rqIC1JkRwoTdOrdx0Vs
         PmVE4siDH6fm0vae5tTXODrMff5MofaiVMZn0fR3BuP7NeT6vrWEeW30A7kA23nIRzKC
         rfUZr5/Bbck9mbFGQlgt8H2ZchNfap0IRVWLNIGDoemRqcXEdg/ttSzw1kAFltnRGH6y
         KYAUtqC8MIq/D5OfEUdQkkzyeI5grgyIcCdBh9tnFkhRQeoTm5D59fP6AdEQDcKTn79p
         PIENQqtIBD3YZM2Lh/mwPMV/QQug5HYFOaBlE3wrCWFu3S48B1WOoIk75FSxm/cMKYvT
         pdgQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+AaNExnOKqipuGqrZ4mY8d5BbX+E6ecy3c5hTzKsKp8cf9YTsQlPh3BAt8hv/juebIjXP7pamVehiIKg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQpgle+VvnvF1vNBXFb2q4J3laoOWk56gPsjsO1zFOq2EHNeP5
	rZ4S/xedbbiaQ39vfIH7p62bqwNORgtRBo3k2DQUS/BZqvhDL+U2JYYft5RyAuk=
X-Gm-Gg: ASbGncs2Jh3YW1crBC7dxiAyz58d4y4XvFbuiY0wt9OOX5rReO3GkiMIcIN7Cm8veVg
	54SIg+1Yy5kjd70SlO6U3JRYiJu6DlKmb39WQH/aFZU61fgwgzZe8DhdnF4nlvsxWdRFvxp5W5I
	o94wOlzBXL0R8ubsWEnb5l8bs09eVj2H8URFN8QgF9AYfEEzVeSXouIg1ENrtolv5miRkRdRLmx
	2GZa81K6PqCFnPi17VWRHiXbIQKHi3CdYxItbZfLvuahv2mJR9p8Gcqyzd/+VZgA/sSe2f4B7OB
	UosK79T+c5YRf80efpYGABFIjg3EIUWOcfrNZP65R2ETuogUnwzTieF4nOg9PSOimtd5IVfUFgY
	nbfhP9Q==
X-Google-Smtp-Source: AGHT+IFZDvkOPT2nkrYDosMJxSvyqWdpibfsvEOGz7vuA49ORE7PmTPuXfJTr5Qi39rOLVdxnZn+fg==
X-Received: by 2002:a05:6000:1788:b0:39c:1401:679e with SMTP id ffacd0b85a97d-3a06d64709cmr180773f8f.5.1745452417192;
        Wed, 23 Apr 2025 16:53:37 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a7ff8sm267265f8f.13.2025.04.23.16.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 16:53:36 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 24 Apr 2025 00:53:30 +0100
Subject: [PATCH 1/3] dt-bindings: arm: qcom: Add Dell Inspiron 14 Plus 7441
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-qcom-linux-arm64-for-6-16-dell-inspiron14p-v1-1-ace76b31d024@linaro.org>
References: <20250424-qcom-linux-arm64-for-6-16-dell-inspiron14p-v1-0-ace76b31d024@linaro.org>
In-Reply-To: <20250424-qcom-linux-arm64-for-6-16-dell-inspiron14p-v1-0-ace76b31d024@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=834;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=OPdi1VqB1omOpnUAwaklrwqievoOBra4zBTdgs/6ev4=;
 b=owEBbQKS/ZANAwAIASJxO7Ohjcg6AcsmYgBoCX173ZgOXlhAGRh4ro3T6EOTZVgjUZpv8xf7N
 zdUR2NT/ouJAjMEAAEIAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaAl9ewAKCRAicTuzoY3I
 OjBeEACa/V0OBm+oxMpcnLIstaReDh+Ly6y4dFvy2jdGMKjUzSDGmTXQH/NSwt72Dmf7iQTM2Qo
 EnDMX66nWjxoLYyMF3IDguN0GjGY7XsRWt10pxp0YK6vXMiU1h9dFOoBeH9/dUjlaH60EYupUfS
 cCATfa1hOsKWTCkTkfxtQzJ7AW1vIbTukbxVmLuWblJleLVR0sifOZ6Iv9/FMOx+p9e9BzLwFSf
 /6PcDjgIbTgIZnQvqyhvG1v/bk2AQSCyiGI0+EB7N3hHF/03F31cjNSsGEKhaXERlozNYsF0NGR
 c3/HaQtjmkjJ3BXgYYHliGB4s6AlRIwGTdyMymodH95BCdJwOPdTFU4rxH32Cro5dkJpRWjkFFt
 J0ZafBaHn2X5wV20DvGRKqG+AhSUuwY7kPZOX+tMg/1bgX0I0SpTxkwvSDcsXMq5OaFIPOkSjRl
 gqChTOm9SL7nAZi62DyjG9+pukn/ryhGV71lK+FzX2jM4YxdIdRD4haeRhu1tL4HizrWqLZ5IwF
 Ns/G/pjNuBLmfR8miiAQJJwFGHHLa07NI2E3d14gg1+J96fLKBpJ7qLOXCjHLi8Gz2jxCZERPZe
 E/U5LqRevrtKbIo0vjvJGay5ifbQR7HUd6584LbOJUZyjJl5bJDbU+VzZJWIXwWVw+btKufzMa7
 14/PfvWVn+V3JDg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Document the X1E80100-based Dell Inspiron 14 Plus 7441 laptop, codename:
Thena.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 08c329b1e91928fb7eccbb0bc8f25aa76fc9a0e4..65210582ef027953918077bd1621a61d3c782f39 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1133,6 +1133,7 @@ properties:
       - items:
           - enum:
               - asus,vivobook-s15
+              - dell,inspiron-14-plus-7441
               - dell,xps13-9345
               - hp,omnibook-x14
               - lenovo,yoga-slim7x

-- 
2.49.0

