Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E34298CC6
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 11:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744370590; cv=none; b=EPSiFIq8kLpPA4u2hw5DuTTqm0dbEZAov8rRi53e2E6cRP6vu5r6aeZgjXr5Q4b5/g4DzyYWoatGh6aToM6gAGaE+r1Jnjki6NkoAbeZU/Q69JxnDuobQTniJnNiJw099BK7d64/rRMdxhjZcoBOvlHlDFysmDYSjn4gUQbYm5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744370590; c=relaxed/simple;
	bh=EBIXp9MEwTv8npBMLtGlllYjPqDwC08/ANOAQbUSTNo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=awRYNN/a37EWajaRlfXj1HjDZGMUfsA1S+Tww9OsxJj0cezpe38IBZuXrcPKcdOubS+EUacRMoKFLFUPOlSMPD+1PvNy+mdE+4cC9D0YkIl2gHMRiSBoxyNbY2H99TprILKumY6iggZxpLggipdlKEBgtCUbr1Ip3HAMHnHUq94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c4W/dQgR; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c4W/dQgR"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso19808865e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 04:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744370587; x=1744975387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J7k8HfJLEdInVheN7W4N/TTPmfm2GybqEO8yAYEOdG0=;
        b=c4W/dQgRIZ07OPbEuYHb/Bp8OAg/0C426yTgay3T9dNR9dcgXc1K3QUJY60NbaxApf
         BcmzVBu1o2tVWeJGjtjSnIVnPvOFqWRY0ozAClgGJewiByApgwqjeL7P/QW5gZ7BLLpo
         qTP8QrVJ/hQri6LuQGbs2xIDa6tfDCeI/xJ9D7+rkIPLgjqiPg1Z6zkHXWzNLlZWK/qJ
         /abyrK2exJu6LQtLSLYySrmVVKnAE6QE01PqorvgRsHQn8ILTMe6nu9IG+iN2KUimKxn
         GCqH1IhcZAjvcaWa8FVdMJidOU0obpstGs8JYG0Hrv5e1q9348eQ8at8oIEyrpb3fDst
         vZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744370587; x=1744975387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J7k8HfJLEdInVheN7W4N/TTPmfm2GybqEO8yAYEOdG0=;
        b=GV9nquB22xrgfZvkOvMwHIHoezbwThmBj3jnIcjts6isvuhi7M7CjQFqInKpcCuizu
         ZZI2SxAl5s4T2ECYrlvsdmg/57WMzfX8uOHxxTE7M1DcMYk/NcrNSkOhDsqu57ELpKw2
         7EdVafvTXZ18AFq7JW+/3SkfRslOZBl1nftGujExpLZU0r+S6wZBVoozACAfAbFRyTH4
         Wsza2Y3oYAt98+WiGqYJpyoumsv+UBtV+kBgvooqSnCYkFp8Gl1NMJkUPODEFBWZMkfm
         bVbHva12bHKvhKBdG08SuPSIiYFplWLqobh51KfjZQII+tEX1nTExVXyBce39dwr5cvB
         OUTw==
X-Gm-Message-State: AOJu0YxFJQeIg5+KfMKIBD6KcoN2eG9DCQS0drt2aBP3yoeHKZ/Kqy2A
	hJGSp0Dl4andYoYvu+EXCgFJAwjgWCQN2ngnmY9X0uvmA0aq8o5LWTWkH8TcroU=
X-Gm-Gg: ASbGncuea32gWmVxGODOcTsI/9MnXOd0UYUno2HObxS0NvpXWtq3i1nt0zaoxBZvwwY
	lkn+AtPle9n6fHCmMoDyTCjS03v9O0ES4an7OE1toguIVoouRWwyv5sjnwZh0q/igoKczer2cgH
	0Ro8MHwiIYrIwpwRjGyO+dow+OrjNKyqoEjYjCPDIIwuR0eXCR6Qx9ro0/62Mkyxefq9uP5iQkE
	ACAA9DPxpfm4PmpKDkp4uFNYaxikmv1Br8kHSnkroRtuTxp7EuQ4wpshlZmjqJmGb9j8xi3zLgc
	0OrxmifF5oUQw1Wz0lWfSEn0bQQKEn08LSMnthp2qf0UgGndj8CsAerxMmWCICmO2w==
X-Google-Smtp-Source: AGHT+IELINoTEkAHWlVCYIWb7m6H7h4HnPMK4VEaUuCiZGS4aKw3gMCDn63rujZcK3uVfVbjB6V6lg==
X-Received: by 2002:a05:600c:5104:b0:43c:fcbc:968c with SMTP id 5b1f17b1804b1-43f3a92639dmr16889645e9.7.1744370587251;
        Fri, 11 Apr 2025 04:23:07 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2075fc8esm85171445e9.30.2025.04.11.04.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 04:23:06 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	srini@kernel.org,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [RESEND PATCH v3 05/13] dt-bindings: nvmem: qfprom: Add X1E80100 compatible
Date: Fri, 11 Apr 2025 12:22:43 +0100
Message-Id: <20250411112251.68002-6-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250411112251.68002-1-srinivas.kandagatla@linaro.org>
References: <20250411112251.68002-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Akhil P Oommen <quic_akhilpo@quicinc.com>

Document compatible string for the QFPROM on X1E80100 platform.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index 39c209249c9c..4c332b44d35e 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -51,6 +51,7 @@ properties:
           - qcom,sm8450-qfprom
           - qcom,sm8550-qfprom
           - qcom,sm8650-qfprom
+          - qcom,x1e80100-qfprom
       - const: qcom,qfprom
 
   reg:
-- 
2.25.1

