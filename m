Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A162505A5
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 14:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743691527; cv=none; b=Y+j03MOOjzlc18UZyxyZJv3JFBuIKIGVjxEjDfpkaw+YKpzlBXDniZP/8JBysOy8SYY9bnfnREDdMvxD29YpBviHelDCK06PWTjX2z2AsQc7iIQpA6ddT14HG5fYhZFyhX9/nteqgJoYjmWNy7/p2hUmur7ZqhN1a47dXr7MnNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743691527; c=relaxed/simple;
	bh=7MXpC1UsPTFkEH6w3Dr3IjWHrLN92YVeJc/OuOPJTDw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U0HI5+S0oLILn3VwrFhoOL+3BfGjS/ekComfJasqCbBCYZJqz89F3rAGNZsd4PUWAkdIQ4rjwy39H8fQWwz+865Fm0ynRKlNSqzFfFyTlrKnF+NkBtR3Tx4BKPpH8dEVsRpJFkQbsaZOuYnF3IP6/0MKMROdsF1oQke8fFzwMfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JC4jMe2R; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JC4jMe2R"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39c1ee0fd43so905015f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 07:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743691524; x=1744296324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u0Dr+cnFlbJ+1l2BNrPM33eKwGXGKx+rxyRsMaRmDtw=;
        b=JC4jMe2RosL3Ro33nhOAFK1a1k00leTLux4DaJHFAdz2yX7B5/Ifi84nXcp0CKDCUw
         WXJuPfqR3mWnGjQ8/cSNdSblupRDN0mNN14UFH4dJY9GEw5rIa83iTZD+e/nOJhvZHc/
         LRqqhEOTCIZGPQgSP9bYvZXN+63Y5Q4YWaqPM1z+PNm/fuNFaWFRLMOL9iwZNq+wW5WH
         7QYHZaJ4Rv33VaXmWuBAE4N7jdjYxN9iCOwA52OK1cF2P9X0fTzAyDLrqI6uMi0ID8TK
         jnH/0ETs5P0SVklDjXQ7MzKazpAXvUbH1oG7IhFqs/Pf+xOQkeqxwkMgfybKITnRFAaN
         pORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743691524; x=1744296324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u0Dr+cnFlbJ+1l2BNrPM33eKwGXGKx+rxyRsMaRmDtw=;
        b=xPOKPPNcutlsorsxmDsB2tkoT4VDl8bMOS/ObyCDDBU6najBHrn75ZsjL+VvFVdDM3
         C2VhVr4P8Fs8lTEp5FuzzzwPEGOGWQry2VHgcOpPYb7FJxdze/Hhu/AjlUv6HP6t7w9J
         IVeidnZVsvk3djWb/JXsXGXjhIFz59EZc9YeQsK85yLXYCKHxzGs1XDYAnLT/gpMxbl5
         0db9NXjs0c8CebmoDlE9nyAQ0c6ZBfMi/RRqKKyDDbEDX4v3KgMpOr3ekbhor8QMXfx0
         4EBvIfxrrVYUkGMW6KCpMAXc0OUXLQ+lJXGhOn6AzqfTbhO6U0+j7BFQvv9J8g0kw2YL
         UP9Q==
X-Gm-Message-State: AOJu0YyoJZ9hK5udjjzMbdBaE6l5QvooPm02zZ8wGcWtDQsdj/otjt7i
	YH3aKJeWLi6slA888rv3XLDMqnHLdhiuxGuZdepARdk+zy4CD6307lsqrxKFcw0=
X-Gm-Gg: ASbGncvngc8vrnW0iuNswXwP/VZfDjUqm8b1vQXPl+L6wL4YZQdf8D9QVEnP3/2AcCu
	3plR+tDSiZPBlXJ30pYURvMlDSyb7m3qhgPHwTsxNinuODhXwgKVSmxoBVMNCCphCu4P8xrYpe6
	XCeihzyT60Jz3INFWVV5ZaJxg+5P1vJwmLNlHJg/zVFBE3yOdb3wG7UgwhyBlsmObu2HnCmbyb9
	q8wGh38YxK70n0e05rneq09WVS8x+YZ7bGtZZ9IU0ClBSrazkBpZ40RzqMPJ8c55MkOm3ZQRmkM
	bUE7F22zAmgoX5SW5vi65ikeRFj3ukEaIdcVI/Md5TuQyPQhyvgf2IlLy/uAkvlz47FQGlw/RM0
	IbKSr
X-Google-Smtp-Source: AGHT+IGPg/iZf5OpeWncmzmuhbyNUVV+h4b0tK9HpRCQQOw3mAIMcH1ko/zsdVH3FuU2w1FIrxX5KQ==
X-Received: by 2002:a5d:638c:0:b0:39c:2678:302e with SMTP id ffacd0b85a97d-39c2f94be2dmr2230339f8f.45.1743691524417;
        Thu, 03 Apr 2025 07:45:24 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d661sm2044374f8f.66.2025.04.03.07.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 07:45:23 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 05/13] dt-bindings: nvmem: qfprom: Add X1E80100 compatible
Date: Thu,  3 Apr 2025 15:44:53 +0100
Message-Id: <20250403144501.202742-6-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250403144501.202742-1-srinivas.kandagatla@linaro.org>
References: <20250403144501.202742-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=884; i=srinivas.kandagatla@linaro.org; h=from:subject; bh=zQ+XDU22w1KeN1u2R0sBn32K6zj/nRUuBnAFl5n+VVw=; b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBn7p7ih90iMu8k4UWTZMM/77qH5t4+r/N3S94Id NPORNO+EZKJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZ+6e4gAKCRB6of1ZxzRV NxDrB/4y5wwhNgyqBHpTf+QkISxKEz+Dv8X8zHpHU2vCfhlGauogP4f9oKmwypuovmXZsvnl7nQ mEBp/PChSJgTg041HKONEifpy8At4X9wpKqCM57/FReXuFEpY1mncrKMB4OuPm+XuchFC48ghnd zaZxoGAwbvTCtVapj0tC4db9WU+0ZJ41QLDVpUnxXHsmj0h2yE9aH/fsAOkq5sAOkCGZbJ9ulTB padoWzkA584eOGc/mOeeRfp1hFka5roHKrOjpJKButcHwc8UduB3e92QgwOlUjrN3e3OpuHZzpJ mvf/LKWI+fcrFIyHauuZV209ngfirNb3CHWWR5W+Hm/JdQ3L
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp; fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
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
index d37f544ab8aa..a85f817b015d 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -50,6 +50,7 @@ properties:
           - qcom,sm8450-qfprom
           - qcom,sm8550-qfprom
           - qcom,sm8650-qfprom
+          - qcom,x1e80100-qfprom
       - const: qcom,qfprom
 
   reg:
-- 
2.25.1

