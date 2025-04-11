Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C7429B221
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 11:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744370593; cv=none; b=akHY9wmijg2yKjfcIeRQn64lmnJIayDTh7Ken0H90Ggl0XOFD+JMFqydYiDtJk4wl6vfdA724gz1Crs8WNzuDK6m6FdFNPoZMEX4bhU1sYkYp2OTnIXL3apXYuA6sc58RYrqWHt1EmYNTcDjNXsHLg57etJxxE/Yi8b16yoS/yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744370593; c=relaxed/simple;
	bh=0h/wAFlFu424QPdbdTuYDgc3snDDYcmUHAH/j2XvOBE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eejSban3cV1RvrZKb77f6M4NEI75BAkSQj5uZw5hBOIaoaD7gtEDi7DducMb6yYM6phvpYCNJJKS9PD1PRJhpyd0bWV7TOVKgcerQ4eQ6VHt7tJ6M/qkSbDJtihnBkGoiAFU3OWIFyozu64NKVp5EXsVDao9B/01ouGSR3QHD2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tInKhydb; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tInKhydb"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso13631625e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 04:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744370588; x=1744975388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fmG63D30aRLLm0dfdRMDFAgoARZHLicvoWT/isnzgx8=;
        b=tInKhydbx8ZOeBKIkHIUcPMdvE6jQsQPMGYhsh0txwVwgtF+3ZkdUU59Q1rVz5EIDU
         KDTsi28vOSs2lbgP5NIrHkCNaowmj34kM6K7Ra6I2zJi0f5FHqkMhR2oDK3b6bVwdEea
         eLRrpgzEYU5Fr+zMI4YgWbbiY7HX+EYkemOCpilAlBp+viI3qo3EfgWdT72qRo5R0lRX
         Ast6pOnvKTVFapAZLZ2Cas1XDvCsvdFfldOIvebEnbACN4WPwSs+UnHI8nssjqH2XPwS
         XmKPmeAA4sHHirvZja++QoGLaKAXx9GQjG7StbaGh9VULjkDfDpdoq8XwGUmO13ejTVM
         Axsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744370588; x=1744975388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fmG63D30aRLLm0dfdRMDFAgoARZHLicvoWT/isnzgx8=;
        b=bf+h8GnwFis+m4LnZqLJTR8ifK0oj8qfQXhc2eUAbUNz9eMa58cFP4OQ2ptVX5vYos
         drpHuYrHJrLmxurUvVBszwPLzygKUBU1q6XjMB1QWjX1eXQ6M4pUKjuk17egEmIGZgFK
         ep/nWPEmJbiB5BBH6spBCi7S2fdXNCN4Z2Ad1cQz1vequOqmI9izYVfuZxyN1wIWvrOp
         6biSpTlibBpjatGSIk6ntwWELFfM8+aLsUecPRsAzUMx1qrq6z21vbMGwAL9eco/v+D3
         BpwSsEbUc8OP195BtUCb+XtHdg6tZhhOhi55HyM6l72ocrqQSgZMJklzQLtWzOLBkScH
         Bv6g==
X-Gm-Message-State: AOJu0Yw3GPyOr+u2lWpsGFn72eaiyCWcnbdz6wmHccU1iFxS/NHcx+J+
	4SFzlqHeKMVm5mrerAL2TJFGU2XPBc9xAc+YUrK7fWysHgPFjXFXPwrDzSFObUI=
X-Gm-Gg: ASbGncsm87vJ+FGX2cFmRuh72Utkop/VE8AalIM/WNN3ubr/txMZqvwp0YWTxXeGk4m
	i3uSCnHYlR6qLmKLcQzHx+PBWEJyow6kCDUIryOAeA4kCzK2dYCM8sAg4fMXVgZXqpVqg7ocLW2
	/C8l5IzFvrcGGCU6d7Do8w7T9uWrJsVTASkKZ5KJir2kNlbn63hWPC9lyzxyZKyWR6i9a+60OD0
	7wR7dgUZfzgNzD/LPCTlctJkkJI6dR1EicbL2oe/1EFeApBzxLiR0ijCQn9rbY8s5RUIUoSGG++
	cjEoeob/rnbhNIdpi0iLHT3t9e7j2y7wf2dA6KeSGxk0yTM/TfJjC4ecN9B2q/FYGA==
X-Google-Smtp-Source: AGHT+IFVLrpaj1MA52yIDTi6iprl5N3WShaRAU7X+RDs4Z5l9JhNAQ6SWgcRV8CbcFv7CA3lyb208g==
X-Received: by 2002:a05:600c:3c98:b0:43c:ec4c:25b4 with SMTP id 5b1f17b1804b1-43f3a93cc56mr24312145e9.10.1744370588568;
        Fri, 11 Apr 2025 04:23:08 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2075fc8esm85171445e9.30.2025.04.11.04.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 04:23:07 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	srini@kernel.org,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [RESEND PATCH v3 06/13] dt-bindings: nvmem: Add compatible for MS8937
Date: Fri, 11 Apr 2025 12:22:44 +0100
Message-Id: <20250411112251.68002-7-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250411112251.68002-1-srinivas.kandagatla@linaro.org>
References: <20250411112251.68002-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Barnabás Czémán <barnabas.czeman@mainlining.org>

Document the QFPROM block found on MSM8937.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index 4c332b44d35e..e1a8856ccba4 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -28,6 +28,7 @@ properties:
           - qcom,msm8226-qfprom
           - qcom,msm8916-qfprom
           - qcom,msm8917-qfprom
+          - qcom,msm8937-qfprom
           - qcom,msm8974-qfprom
           - qcom,msm8976-qfprom
           - qcom,msm8996-qfprom
-- 
2.25.1

