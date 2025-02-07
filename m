Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C11D2B9B9
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 10:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738925446; cv=none; b=Rh6+hfoEPOEOdSi1tjMOV5MXjxc2uiWPXbi5+mVsCZVWn8zOT8/P4mltwnJNt+39v8wdlvfPZsJNqTH82ZV1fDZ6enGk24XkMcsuW8nFSBrvmiwQ+mE4gF93uTAdT02ZGPCb49nVK3vnfLzVstrlSzOVsOeJDKiMpSc2Bu3abRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738925446; c=relaxed/simple;
	bh=dSRoyjk/LLc0wZ5pRJ9GYPfexVGSK5yA1Y3qknTE2Ls=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nt3xo6hqLNfP6IPnUB2JTcV15jenuFsvvOwvU981AfR3iAYnudKZvLpVLjEThYVnSj/gpRXWF+CPu/cQVFlNhPRRoTzqvXDvYt/8p/ka2bk/2cyeP1DFwNBlByqoZcTj4tpmwdAb1d/D6SMa+1nX9G7vx/e3oRMrAlW00bvNPZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VkaV3EXz; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VkaV3EXz"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38dcb7122c1so356615f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 02:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738925442; x=1739530242; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/IumZi2mO95I/VuFFDFwokd0aVkiJwKGF91Pl5x5axc=;
        b=VkaV3EXz7tWE+QyMB9jA1g4UM9dDM7SvQXUdcmz0+SUXyB2yaXEq8dW0Gt8Foe920c
         4B9MNU1rSVQrPJ7VWh69CD/wWtJtX/vpH0r+lj/xYE3n/it/M29lcCs7+pQOJ24NIzTg
         EFECwAett4iQBnda1kLjOdOCf4WVx2R3lmnjRLbNJ8rI0YxZHElRe4M23xa1sd+TbFc9
         QKoqV3JQLnvbKLcAdPYU+RpmEJU4DaGHTxLBn7WfDqgkANg32jIN2WrYq7unoXTnLgIC
         tywjO/kCvDIvdnXTuRFNP9BMi7EHmOdePwaXszcDmxIAjF7dQAcNJJDsasQ1wXU8qLaV
         31zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738925442; x=1739530242;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/IumZi2mO95I/VuFFDFwokd0aVkiJwKGF91Pl5x5axc=;
        b=EcJ1SeHpGMwDvaMHh3B9r4Ep9UZmaQIIoEy1FHPm8yW8RkSlHlZsRpOK2nyVh8ktqv
         aFbZiFNBNM+TtK433bp64W2GxvT5OYdXVXkei1szAc19lilYLN05bvtVXP9n9sH8gZV6
         tM6S5vSnbOLSlUjRpT8LHQZGmsSP1y6xrOdlF2V0Z62E6Al5i/YiJdtempx17W8JjLv/
         Y4uo+K41BtNFk6Y+coQPksn35JMX2Lyjjdup4F2J2jXKx7OScYfGFUs2OdlRrEiQpSWj
         92xtsUD+gd8frfKAKhlDd+zudg2a8/f3eIth39a9EH/9vDkrp0ehCDDMa0F2gpwPh10S
         PgbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVdu5pJhEASeCJoVhPnW2VFnI1wq6QqnD1p0h3/n6Srpd2AVXf1iajZEcgwG/c6msK8wATgcLMkeAP8PM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIHYfPi5vVfIckNAgDFQsoc1HR1RyYEPY2Ty32NPSEW8efPKUu
	UFbClr54LiS2LQVmBMmd30fOV83BhzHKKMhyS0liAZDmmpjsWz9PvDj9GJ4RTMU=
X-Gm-Gg: ASbGncsSHcfFh8IY72AQmkkbjuM9NiCpnhHciqtelM1Iph34b1rQQ/W2yHGg3Udq6tj
	xFqzv0dwE2P/sDy8dLtmIeS0R5jrF/aZFms5SSj021jvPnRkQolqLfkuTz457+Y51SMUc1z8vPz
	+gzMnDpM/Xv1j68pqOYrLIDK7BNtdVt0J6L3vQhd15b8LvHkdfhzVRNSQLSCdVEHhdsjj0WFcmA
	cW1tQ6DqubwhiNn/FnGRoXAjZN5Ywh6BUKwjwdoI5M9prmttIZYwZKrvuu/y4UJuMaTDYb2qVeP
	07d9JxJ4ffWFiU6qJ6AFcYZK3wTQQIQWgx6C
X-Google-Smtp-Source: AGHT+IGzmf7u8lOV91tQ2bUO6AOqOzShvP6P0N0+WwarOOa/wfspqpwZ4Rf3iZg3JHMLcnGdfnkCsQ==
X-Received: by 2002:a05:6000:1a8a:b0:38d:b2a1:244e with SMTP id ffacd0b85a97d-38dc935f87bmr1688184f8f.41.1738925441775;
        Fri, 07 Feb 2025 02:50:41 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390daf4480sm85968635e9.27.2025.02.07.02.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 02:50:41 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/2] dt-bindings: display: qcom,sm8[56]50-mdss: only
 document the mdp0-mem interconnect path
Date: Fri, 07 Feb 2025 11:50:36 +0100
Message-Id: <20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v1-0-852b1d6aee46@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHzlpWcC/x2NQQrCQAwAv1JyNhAjS9WviAfdpDWHZstmkULp3
 108zhxmdgitpgH3YYeqXwsr3uF8GiB/Xj4rmnQGJk7ENGIrq2WM5bolwkUi0LxpzcVdc8O3uZj
 PgZNtKHIb08R8EUrQi2vVrv+3x/M4fto8a9V9AAAA
X-Change-ID: 20250207-topic-sm8x50-mdss-interconnect-bindings-fix-dd975f223d05
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1173;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=dSRoyjk/LLc0wZ5pRJ9GYPfexVGSK5yA1Y3qknTE2Ls=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnpeV/K8vJ2pQ56PUAoz+0XinHG2mP2E+oDhZ8jXi0
 f85TrEGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ6XlfwAKCRB33NvayMhJ0QiyD/
 9iUH3Rp2L1QCaj45OJfAnmUngLFmc0VQHV59TFpjfXaPfqfOMTWtHJ/4ZP8wFQJCsxl7yaAzDm6UO4
 zlFHFM9MoND+vjxn1msUPfMmIkYL08fg8GmtAgRwVGTgyQaW8Y/cTxi8Wc7mmQWo8tmZM/GxCbOT72
 yRqCu59o14WNCgkx5ASS/VtMlXALTzIiciepqqKKHRaIT+MSnzgAjKhLjH5PX/9/SqvBXScWAJlpXU
 AmIcI2S82HdjSf1xRZRmTZGZkp1KC14BVM7I/jkA03nzrDEezN284/oo0+Al5ddVMrGc52p4n9uZZ6
 GOTlUdiIwt8wzAwlbzgM+vE1wFAKpOK/wC04wgk74CNTrF8VP/lhsFAeL5HX1iJyNptRe5CE31/okI
 VeUnjknXAFfnNURGiEikQSEpC9EI8JdCRCwVkcbK2mgzR6AnYVGz0KnFaWPOYBN5CNGuU4F6Yyu2bX
 u6rD+sxyXTRD3FkOFPmrpuhSt4RRUjjLgKJe0837rtReagRU8hTueZfih8sf0Y0Gdst+PQPRd81ojD
 fzeJP1Spg3tCntBFFLFK2UhQ9vXwWoeq4/g/+KPaCGAuCSaMLYn67TJhu0VKBtXrUTEEOnr5Wem1n0
 yvkD6ast+usxuP7baNqyx2YBbDnjuPvDxdsDgqGXrk9Vu7ulA2eIXLS8P9wA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The mdp1-mem is not supported on the SM8550 & SM8650 SoCs, so only support a single
mdp0-mem interconnect entry.

This fixes the following errors:
display-subsystem@ae00000: interconnects: [[200, 3, 7, 32, 1, 7]] is too short
        from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-mdss.yaml#
display-subsystem@ae00000: interconnect-names: ['mdp0-mem'] is too short
        from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-mdss.yaml#

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (2):
      dt-bindings: display: qcom,sm8550-mdss: only document the mdp0-mem interconnect path
      dt-bindings: display: qcom,sm8650-mdss: only document the mdp0-mem interconnect path

 Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml | 4 ++--
 Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
---
base-commit: 808eb958781e4ebb6e9c0962af2e856767e20f45
change-id: 20250207-topic-sm8x50-mdss-interconnect-bindings-fix-dd975f223d05

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

