Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E9027FD70
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 17:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751390942; cv=none; b=ioZ6JRVmMJ0lH14B7f2FbDSNZaH3wrQA9uRmmLA+ffwrNgZG1PbZP7O1kMkue7pfRDJHQIZVJ6v372NI3N+KQ+BV30Q/FvKICyfkKvsnNho6mEKJ2a4Sf8dBRyldJaLVyTa7f7vT8wRNEVN/7YxWQZ+FebUTW2WFKJHaozTMHRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751390942; c=relaxed/simple;
	bh=lKLvoCVJRgutFe2R/Rd+FFb6y/96aAw7/Kdifm/nYNI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ukPbygh6KSZbnmUakAq8EIogwybtFvG0FzcXXno5DNMM55SmHH0RIguHc7P7hnEAiHGoJgzlz9FvYGMJrjtXvfleDYKH4cW0rkkC3QrAkeIwfi0jW/5RTMR2S5GylfTe43od/ahm92AkY5p6ibpWI9VB4P7EbFyE12EsgDXircA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jLiAdaZe; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jLiAdaZe"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-450cfb79177so35653255e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 10:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751390938; x=1751995738; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bLYmm/W841t/0A2F0oIr72Kx6VbF3J/btLHJRobqvhw=;
        b=jLiAdaZeofVCHtmtvWsRHEwYNpFYRg4aDjMy+MXNKVX8dg5jDOuhxVrqkxGHOHQZF6
         Kkq3I1e2xBZ5biaBNKBAk9O4PD/q+xzxE6o5ty5bkVIReFjRR52h+UctDrtj2e9cwu5w
         Oc6ucocKQnittO07+M9Rhgscw2x1nJbY25YH6ePrd5iPLSR4LnhLA0ZFCDrXGJZd65KL
         vexvO6NBNbkpdvzKXW/TE9H5L3l80UsJObnRfAkqP7nWnydGWzrbxOztyfL5tErAu3As
         gMun5iX9PANcg1mABwj1yaIO2KJkBDsI85OzoMKlXCZucf/PZ/DrGblFlJvBUZzCJTAW
         FN1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751390938; x=1751995738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bLYmm/W841t/0A2F0oIr72Kx6VbF3J/btLHJRobqvhw=;
        b=FnGQii8EqTyTQBjUodGFl0b4LPtvcM/4rgktrcqPhCKNB/hZy1h4QQH9ze7MLRuNjz
         a+VMKuDhZ1gu09XfRi4WAZe05wDqC7wVr0EZFcOFZsq82CrN6opNoTvxXroqOdOr7hD1
         7gka5y5O7QuyO+hUwn6AuAg9LR+hXvszrB4toOmicrjeML0a/e3Ou//wnz0X7XVOIw91
         7k+qkhelHfLX/w0zTHHLhjCIOdxtWAZeFSJnx8oe79+qyrmyr3CQaXvBF2V1wxs6yCZD
         wcf/oTeh2AfLhCGMFebOdS3a1WVR7x8FXmQMcADozWLk5UMQz17LuBnh/5Qsc+DlHxGb
         rpjA==
X-Forwarded-Encrypted: i=1; AJvYcCVNzO6qAdd6PGXzD9+EKLbcB8Qo27UA6NBnOMogFMd4uuhWD2+dsPHE+A2djeWYo9ccVRpUukXDv3EK1Ac=@vger.kernel.org
X-Gm-Message-State: AOJu0YxO959HwVSbtOsMRDzu0BP5/AzIrF84RcL8nSnZdHl8aENdzNSk
	sphK84CXTYbowfF5aCoZX/FxVWoycUNudKpyELXxXgu6VWCoWLzw4SvTUOIZf6Jgzv8=
X-Gm-Gg: ASbGncvbfr5zrFFZaDi/xzyVEu9T3z7O4OiAxSTLH1/dLmKv0bdlLDa7gNWTFIoQ4al
	iNS16/0eUe6V5NOMzGbeiePZiO6K+D+9rk3qpMaqLQak4BV8nq5MGxNSyDBaRH7CGH1UxB4QHxT
	MQilS27JWWaIUPnyIBDsVPJEzeG/jKOnL7VzjlvSXHthRaHUnEdzt1/Wxqm2bgvUhhI8Ug/wBQW
	w30SLt7p6bWSH/0b5HZr4vG1/kkYcNxpPrRKbJfbPpHtUw97w7qWSz8CKisyjiiIv+/FlLT7dUt
	KqDjtfMwNfJFsLjE+dtG65TiwwmZ4lBKXHKDp6SjOYaHQJ4xnmpl60pN68OJhn91RTcWyaKcPkG
	F7A==
X-Google-Smtp-Source: AGHT+IF4HQoWvaoo6s2knilDjvFtQ5l+MD7/ur7mX6jo8Z4Ek68Oqu5P27xeS+nao9YYpdCcOso2Ww==
X-Received: by 2002:a05:600c:699a:b0:43c:f3e4:d6f6 with SMTP id 5b1f17b1804b1-4538ee7122dmr218050125e9.31.1751390938018;
        Tue, 01 Jul 2025 10:28:58 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:1425:eda1:87ab:f850])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538234b1b9sm198716175e9.11.2025.07.01.10.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 10:28:57 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 01 Jul 2025 19:28:36 +0200
Subject: [PATCH 4/6] dt-bindings: clock: qcom,x1e80100-gcc: Add missing
 video resets
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-x1e-videocc-v1-4-785d393be502@linaro.org>
References: <20250701-x1e-videocc-v1-0-785d393be502@linaro.org>
In-Reply-To: <20250701-x1e-videocc-v1-0-785d393be502@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Stefan Schmidt <stefan.schmidt@linaro.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

Add the missing video resets that are needed for the iris video codec.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 include/dt-bindings/clock/qcom,x1e80100-gcc.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,x1e80100-gcc.h b/include/dt-bindings/clock/qcom,x1e80100-gcc.h
index 24ba9e2a5cf6c31e6e88c682e6bfcc60490d692d..710c340f24a57d799ac04650fbe9d4ea0f294bde 100644
--- a/include/dt-bindings/clock/qcom,x1e80100-gcc.h
+++ b/include/dt-bindings/clock/qcom,x1e80100-gcc.h
@@ -482,4 +482,6 @@
 #define GCC_USB_1_PHY_BCR					85
 #define GCC_USB_2_PHY_BCR					86
 #define GCC_VIDEO_BCR						87
+#define GCC_VIDEO_AXI0_CLK_ARES					88
+#define GCC_VIDEO_AXI1_CLK_ARES					89
 #endif

-- 
2.49.0

