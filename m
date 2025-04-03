Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E652517B6
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 14:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743691539; cv=none; b=Av/6mkExdUF0PkvHw5+RWbWd2L6Go1vIPaCTcXXPX6NH88Lk1YOKh5rfS2dC666ZxAWFUqbPS145YShqv7b1ENhyiwPnrLJJ5U0GcqjWJpVuN4fzlQTGi056QNe5kJbRq7bvZZkldTzUEMiY1cT/4V5tr/cENo1ntS6cAayYZ+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743691539; c=relaxed/simple;
	bh=l4iJNAHptiuVKpCa07q2upOIZMfPgiV52LMmwgdvXhc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y1sd646ZxkHl3TXU6uIkkZx+D8wXDvBdinOgCp4Owi1MvkjdH0eBHFpPolEMioKgbV/5jjtIlC/Ozx++9cpdFfbqUZE5OZNzSrpKpl5OhghZ7WUSQFjz93Ce5OKVVBLlFjrOQ9mGW5AooF7R89bRuPmwB2LVHXifDN9pKXrKe0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dBrZPKlA; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dBrZPKlA"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso9666485e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 07:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743691535; x=1744296335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FZqArbq2CLhmn9uqH6RdF2eNuvNBqtoUAKfUBvHjG6s=;
        b=dBrZPKlA46v29MHgh772KiqFFWUdJ7kYqtTPWHZH7ilu8C/Sh1dDayL5t3YpbetO5y
         yQH2bUoVpJExvkj+IMh0UZaasiQ6WeTnfVymPqEcAuY4ndU9svAsQiXLdhTZ0HtWfOad
         eFSKx2u2oAFfE5ReGiE1Tn5ro8tj0tZl5ROQmBa5Pwit27PvjDXduKawJsxa/v4qWn/x
         0el2xS5l2lrD75njgKprNQBcdpLD3kV8GRCidgemRFO3VSq0ME/lSPQL9pzP7F6nqkBx
         ctXlyO/xkAN0+TTiqDG9m4U9NtP7KcCsxoVRnxEqKd5WHLwlWEw0rHufTWtEbthH/BKN
         +pBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743691535; x=1744296335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FZqArbq2CLhmn9uqH6RdF2eNuvNBqtoUAKfUBvHjG6s=;
        b=eM73tCiqGa6HyxhZQ1wizqOcVCHTvz05ruJ2NH9lpLtVTy4ycjPn2KYSwjr57/j76H
         M8GvA+/NWuUXezhWynPH+jx1H7Zni7YtFh8HcoLZH3wnttXete1b1bkc67IJ2+rqdvYx
         iJ6CYixoqEhBk8T7MqRxnzNywFQdI9tX1ckibYo3wNeAIJqOArl9kQRYtmwD9/EDvW2z
         0Ekl9jjXmUP9B6Mt4oiFOTWQYrKK3Is5FYghavOhpcCR+qZ+63fUoITbOkIuRjPb7J5v
         RClOTxrZwkTGNo2HY1LdI9dogyDAc8ZAVHBQfs9Z82Ohnteh7MtaOG/xLqTFE6hFVBGU
         gVeA==
X-Gm-Message-State: AOJu0YzPt1mbaitN4lCXZr1G+jpGSzjsAANCKogwaysKdQZEe62VfgUw
	bYmTOK/hZNN3XNBbC7e35AJoVTcautazI5IVaHjGwmYMT7kslxHWSJ3UBEylESLAnz28BomO8n5
	UlSM=
X-Gm-Gg: ASbGncun10HJ5VSkZrE1bVfJUi0+D7vtvjFEvvM3eCOBREiJ+yJ444vsJj4kGJxYqRf
	AVzS4MxQn3jd5C+StR1MDpuYhBA9oYiNEJ7Lauvr8pEN4ohkAXUdMNqic38rGPgDaQQ5KPF09jC
	MV/8GQw0IEvq97v8/+GXqwuWCV/1NxPoObcG5fRdyP3B8yLodKv7ABgEqf7AiSHwApueHCgEWEk
	Tr5YNkD3IQYE4YF9t/r/Mm5bK3rwy4nyPVOQOCiCjrF2JRC2RoX3yXucmc8bI9JVlR2G6MZB3fL
	FtH456NcJ88NbLaqFPLJRh8B/Ged+gQ+q0yxUETPrB1q+3kIbF5zMYkUxa/5VzyZ0KOvNg==
X-Google-Smtp-Source: AGHT+IGHaZo46FQdOLZGvNflgqb+6QaWejJGL8oml5XkCKM6k/q5DM+3Nk52MHwVuDkrLGyzpz3vLQ==
X-Received: by 2002:a05:6000:4021:b0:391:38a5:efa with SMTP id ffacd0b85a97d-39c120e07e4mr17272795f8f.23.1743691535378;
        Thu, 03 Apr 2025 07:45:35 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d661sm2044374f8f.66.2025.04.03.07.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 07:45:34 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Rudraksha Gupta <guptarud@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 13/13] dt-bindings: nvmem: Add compatible for MSM8960
Date: Thu,  3 Apr 2025 15:45:01 +0100
Message-Id: <20250403144501.202742-14-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250403144501.202742-1-srinivas.kandagatla@linaro.org>
References: <20250403144501.202742-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=910; i=srinivas.kandagatla@linaro.org; h=from:subject; bh=FXEt/Kj/cOQDVL0xn0HFa2IaPATF3j89thQhbOzYB7o=; b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBn7p7kdWWgcoOaGztrTUxERMTUY/4sCVheFirnh 2g8KO+3G8OJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZ+6e5AAKCRB6of1ZxzRV NzJJB/4oKvA+6mt6SmXJ8sLPSChf+wE/8fNajDfOaVPn7IsWmQIrc+YWvgN6JfZfB5ou32RUuNg ktrgO23Qnxj/9eCtPmes54zDDYLJd0R/+P1voLWl2k4nm1qrZjBi/Km1SRL6tb6WZEHJKDsHx0a +1dUdf4NYCv7ydnUqKRPq5oAfYOyJVrTqplaw2kK58eaCFVmzKG2in57IH+VG6bGj8C8KsaZask QOb98FBkDcgP+pANL8ih5FxbFRUkhrYsQABp8BGoeyCzWCl4lkFZwoGtAngTcBsr1J5xjXwDDTh h7JOTH/AvDHyZK69kVPrEYUOLE3dRTjDjrHBFjEZwNL1b4kH
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp; fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Content-Transfer-Encoding: 8bit

From: Rudraksha Gupta <guptarud@gmail.com>

Document the QFPROM on MSM8960.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index 69e3669f8178..fb4dfb1bfb4f 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -30,6 +30,7 @@ properties:
           - qcom,msm8916-qfprom
           - qcom,msm8917-qfprom
           - qcom,msm8937-qfprom
+          - qcom,msm8960-qfprom
           - qcom,msm8974-qfprom
           - qcom,msm8976-qfprom
           - qcom,msm8996-qfprom
-- 
2.25.1

