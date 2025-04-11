Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E682829DB7F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 11:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744370601; cv=none; b=UTvTLp7vy+kqXSnfAsO2XGA2L8vTUN+3vyeEaMWsUMkgDP91I7Km0TbMcvRzPAE0vraVEAUDaVg1dPdkIQoDUTPA9qirMZudyWvWtEliqpv9VBoYl8qIhVtGLiLKgDlkD3GIuuu0ztdDGMKatYZbIa3j52SczV0vLOooZIVT4QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744370601; c=relaxed/simple;
	bh=llHMbBLI3AYzEzC41ce2TRURYGQeUkzAPq/2Cos3ChU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DWqvgNeqIcWt0nrfXCO9wXz7kBRmOQPtB6eJPy5iLKJWu4OBnzV5hW5Dm+BthFG/g2c0ZYwN1AxFWQkuUqZ+xZRr7UtD3zrW7YUnBPAkdW0WHCsbeGYOrk2zY0u5MHwiDbHygJr64rra+c5ekKJeMqjfzNXFPCb1WNox7qKCA5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k7arXHlo; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k7arXHlo"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cf257158fso14032215e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 04:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744370597; x=1744975397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=psqTSXKr1vyIckc55b4zFED5WKVYrFytdNh/LmM3Z0I=;
        b=k7arXHloCf8gm5BTU3ylN+pFlKnZE3ZC5HnLMMmBFRaM1ajj9BhPNndr2kltKPo49W
         Yyw/AIzZ5Q+YhsM7PY766/M6j/E4iYBdRkVVMb05OiLGS7ADPQalQObHNNvsZk1kej0R
         qZa++0EhWkYUdUUdISqvQOrH/qjiuqp9GXqe94FQKecWRBqBilL+TYHYCagy43t7RKAX
         T93IKk0Kb/0MxMqxpqpE2ihPjsds1IrOhcrZgrtyX/TGHAbOoXTJ+H3+87FZtsiGyTI5
         DyJkdC9z/a4ExHgrltzc0PjKfbgwJCITXjsyrfAagmwvSweXAluxzJUL7Y0q5D1BlajC
         ohnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744370597; x=1744975397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=psqTSXKr1vyIckc55b4zFED5WKVYrFytdNh/LmM3Z0I=;
        b=q01A716JSc786tsq4ZMfhcrVaLvW9srgDNEFTjKoXn8TuOGaCRMQIlGNLqvryOvBI0
         umzUaGVLq2LvPgcHhhtyvoU36GYPKhb62XqdEtDn6JHHp9sdsFzp+ins3/TtrBq0BfCs
         6DyPXxWBba/QJ+vpo0SG24ijBMXfIDVsotPk3wli8EBuYjIqQ5hXx1MneDSmq9bVT+ET
         6/y+o/mUaQxyPdajZsW1ijHfr8R6gZTYkEurpzbzl0Pk420xnkXIBx4POESvytyY3V8Q
         9OpVdT0Fbp84pHYoxW0uPQKL5THqXUxoPMy0IAzaIO8Sv7212p8TBivt5Wt2/p3mlXvq
         m3+Q==
X-Gm-Message-State: AOJu0YygNn/aDh7RK1J7JC2rt7kEcqeFCbxCiNRcDq087vQom0wWqWcM
	qzb+I6OMZMS/EgeoP8fxW9VscFJQP6nHU3eI+CJL1DiyT43QTfSmmumFLcedy6o=
X-Gm-Gg: ASbGncsqQkBbfkEuMpnfGCrsL2KZl0/e4dyGZdI/Gx+knfXjwS9QfNOjy9sY9sFGsEy
	TykelFgIgdU45QQvW8JNx9SrXM41o8IwoTDQCcFnXan0jwztGvwf5ryT9tsGW27ZInZ5xmK2PEe
	y7ankel9YKhNfYzTYaCl1AqH5LmQUchXMv4d+OQub9f6Kqx1PbkbQb/emvNLgeeSn6Rw6Oy5+SL
	DYOHXuvfBwHxnGeZcY2mntJhnpWvxXwbLfWtclZje5dApPQP86iY0ksCsayEP4TZwzP3gUfHfIl
	Mn2EQDkqvvdC/SiYRUc3MvCFVb1SaUeuRH2DSkjtbs5wgov9FYpMnLKZurtRhYyRng==
X-Google-Smtp-Source: AGHT+IGq8I/TMdJ7It8xYyBQMzgaFrnZnsNkLwFffHD+7OQGf0a7B0E54K9eZhuFHPUwiy4xOAR+Tg==
X-Received: by 2002:a05:600c:4704:b0:43b:d0fe:b8ac with SMTP id 5b1f17b1804b1-43f3a9af837mr22642445e9.30.1744370597220;
        Fri, 11 Apr 2025 04:23:17 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2075fc8esm85171445e9.30.2025.04.11.04.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 04:23:16 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	srini@kernel.org,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	George Moussalem <george.moussalem@outlook.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [RESEND PATCH v3 12/13] dt-bindings: nvmem: Add compatible for IPQ5018
Date: Fri, 11 Apr 2025 12:22:50 +0100
Message-Id: <20250411112251.68002-13-srinivas.kandagatla@linaro.org>
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

From: Sricharan Ramabadhran <quic_srichara@quicinc.com>

Document the QFPROM block found on IPQ5018

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index e1a8856ccba4..2b39d27da57b 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -19,6 +19,7 @@ properties:
       - enum:
           - qcom,apq8064-qfprom
           - qcom,apq8084-qfprom
+          - qcom,ipq5018-qfprom
           - qcom,ipq5332-qfprom
           - qcom,ipq5424-qfprom
           - qcom,ipq6018-qfprom
-- 
2.25.1

