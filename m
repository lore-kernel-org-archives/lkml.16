Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9228838FA3
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 20:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743969712; cv=none; b=LnipRhqpkKN5SKepEEaE6XKSDT/8ALnKQCpKL+BzfhxHpc4iREPtX/RQJoIR4a+lCsa9Ubg3/L0O1bj6xUseDa0HmF97Q24DC8ixKDV76gNM+Td/TpLXQVjkVNrRn8NNVRK+ZQHlCx2gwRNp6x/Dt/HrUyuY2+8e+MkGheg0+zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743969712; c=relaxed/simple;
	bh=iSXkcUbsxY3DxZJb4frxFs5pjfXPxSfYSUua8756xYQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cL/CLXNEYZ/y9Hpqd35S5apHpkfKYUM+OVUQF3P6aKALgdau/Zj7bvMEvOtx5ZE6QVKgngRrY+ITqWDfgBVbh/Hzo8p4RgYehDAaxGvoa552FSA395oe6a9kPWTXa/CcMqgW+yo4sB6aw0U6Vyz5k2RCuwcmK/u7PSDK96kVSGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xJrvTcqn; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xJrvTcqn"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3912622c9c0so391111f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 13:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743969709; x=1744574509; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1B7AZw7nds/G/Q7UFyxo55SXsrJvSu3ziPQ8Q+kdE2g=;
        b=xJrvTcqn1tLdwURDE2qcbL0jwaUazlJJRo2y5ecjFlJ8irt2Zgvzn1YkyCb4i89rjm
         jF7+9SPQHohZJNRNgC6jphc43ow3Q1tTiB63gK/bkgMfhGvsRBMhlekfkagmAP6skTXT
         H7ao6nNjRKHbRwYmSc2OFvUovXzccSZmTcOaNiruj/VRURJ6BLWkWdvkwk0hFLnbJmDH
         4nUghQDaqf+lTwSvr9KsreQLeJEHG9YzykjlwHZD7YkiPug9kyO5SKcektAA8Q3V3XEX
         HMxDRHynlSjWkqf9atzbBQWBAeK+iAT76TBEyOOby5wqxB6+DXTExYphe4bK/nrnCX4/
         4Hhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743969709; x=1744574509;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1B7AZw7nds/G/Q7UFyxo55SXsrJvSu3ziPQ8Q+kdE2g=;
        b=O8QikqpFoT3h2x+IapS6+wRP8f2JO2CTt8LoJKiIsjIxy8kH0Af9Od+PfqtTEl7NlN
         AYvcdLXgbYe+GYX7u3t7f3gfvj+mp5GlMYJ4RAu1CDp7c5HiyWlmmoI7kCUX8fQXKkiK
         iZmW5OFUUTIbT8W1S48KECl+yy931v0X0i1ECuTlEhnBCAW7gcOPTgRkRwAeasdEXoCh
         EZXl17zfLGczmkrr5zKLvkpZaM4XHV7+Fu8HbA+zNsCxRhycRmeWGbT33+W5YqCFK/QW
         xYZf27ppN5SQVLxy7qe01CFePaTGoc3xSmW+01lrdlw+Jao2yNdxscBTuCG/PpfNmgW2
         WQZw==
X-Forwarded-Encrypted: i=1; AJvYcCVhm7dvqyxSUGFPEV6uLIsXYQSh9AC3coJMJpvEAQf7LEHvnW2hEt7Usa4uF7PpbNl37qj/M6I5nTi+Lis=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeCZaCCVRX/9ByP3OXzJD3o6MPLwuH3++MtGLytgbavdJW8dNu
	okHY1sn77WwK4o5QR0pvs6Mc8YI2wiEgSiVxX5XmJlelbOwjFBI0UhA26FctbDk=
X-Gm-Gg: ASbGncu8TZJ+W5doIUfHg1Fcl0e/ipPl4xTSFnlGFGZeTtP59+9HZXB8ApvvJl9WlOz
	ltgUv7GQLHpNwhfY7TUpLDD7HSx6ImyJXDAq+QzqMibydT9b05+7niGiFZAthKUfjZB6/4Qv7/q
	LWsuGRBgTFV50cSN8efVeR5U1uhHywsxap544Ilf2s2h5AXcxBfjaAKLuUptmTpzC8rX3gruYeq
	v+zyAr5oAAZGDz55A8JIWgbiRP1KxwNoNAhrR1jCKm2e2f/ABQJ7CzFnnnkIk3BVc8YB0kS6S1/
	mu3v+2a7JlIjCf6iTxbFR2BKcid1HLudMBwH+neNNtAMevrv/WJVCIOtFYQd7BtQIFgH13ifjw=
	=
X-Google-Smtp-Source: AGHT+IEjlfGioqQrUO4vvsISl/rkiK08Y6eqp4VaGk5U/oVlTDftQ1aVG8HuZicBmI8IgcAr6Zc32Q==
X-Received: by 2002:a05:6000:2481:b0:39a:be16:9f1e with SMTP id ffacd0b85a97d-39cba936295mr3359285f8f.12.1743969708899;
        Sun, 06 Apr 2025 13:01:48 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d98bsm10199924f8f.76.2025.04.06.13.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 13:01:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/3] iio: Fix wakeup source leaks on device unbind
Date: Sun, 06 Apr 2025 22:01:41 +0200
Message-Id: <20250406-b4-device-wakeup-leak-iio-v1-0-2d7d322a4a93@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKXd8mcC/x2MWwqAIBAAryL73YKGFXaV6ENrq8UoUXpAdPekz
 4GZeSBRZErQigcinZx43zKoQsCw2G0m5DEzlLKspJY1Oo1j9gbCy3o6Aq5kPTLvqHXVOGNcbY2
 C3IdIE9//u+vf9wMUrxNNawAAAA==
X-Change-ID: 20250406-b4-device-wakeup-leak-iio-4457b99b6a91
To: Jonathan Cameron <jic23@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=784;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=iSXkcUbsxY3DxZJb4frxFs5pjfXPxSfYSUua8756xYQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn8t2oyiYKFqMFuIEI+qrJOdqyPUI7XxIjAn1Y0
 XuFYA2+qVmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ/LdqAAKCRDBN2bmhouD
 14vhD/0UdVj5FON7GeEue18yn0kAF4sr1rbTdzOxvjDnh19v7r5l5KOaDq1/jlotutWE3p24gzP
 1/DgIRCP0ZCFWAFTyCYmP7nykaeuqW80Pu6MAEE5oTFfhQ7NnYztRpYyMROOpTauE5aNDfh67xu
 WAGlYk2LahSx6lv8cYYw0IrmIpMoeiRa8HDA+dJ79h38F8U66kAVXcuRDM+X3LmBoBuY1b+mc27
 yecbQYStW1+Ur/sQWjOEbuK+ue0Y4SSTf7CbY7mkeFIAc+zUtFzIwOu0r4ms5JJnudd5QzQBW9Z
 spZblATUlfk64uN8HfYOyrK1JLDbofZ5ug/nQejIxBp4knzpCkdoSW0/tU+wLr66X9pRtWPtrEI
 4WQLrZqARWQyl+L/wsaWyRQm0IKDx1dJF7Me5vOVM+h7o/eDtBdC59OQhDP6hQ7XaRP2fD7urQq
 bozViLpZlg0Ac6Y8E9w8qLFpcDDr6G8u46iIQ7FmdknURcviy/zVHPIAszrAAFDvnSnW+jXkMCl
 jbN84GvH/MlnJotIEQZgTIxWByFE8O4o6om4/0wTCJzTzuaxiHcfMJwGy+UR47vUdXB+qmaMXIv
 CkkcCBseaLhNkk9YmALwULIk6g+vQRcYnDp/SrqfH7fg5NG3s14znkSg3ar8BzOHOXWZde2cWLI
 KQBr4eQU0Fa36EQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device can be unbound, so driver must also release memory for the wakeup
source.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      iio: accel: fxls8962af: Fix wakeup source leaks on device unbind
      iio: adc: qcom-spmi-iadc: Fix wakeup source leaks on device unbind
      iio: imu: st_lsm6dsx: Fix wakeup source leaks on device unbind

 drivers/iio/accel/fxls8962af-core.c          | 7 +++++--
 drivers/iio/adc/qcom-spmi-iadc.c             | 4 +++-
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c | 7 +++++--
 3 files changed, 13 insertions(+), 5 deletions(-)
---
base-commit: a4cda136f021ad44b8b52286aafd613030a6db5f
change-id: 20250406-b4-device-wakeup-leak-iio-4457b99b6a91

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

