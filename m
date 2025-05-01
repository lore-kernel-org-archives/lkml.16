Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D744CAD24
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 14:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746110016; cv=none; b=YV0WUKZIWdH/nQEHAeL3qPDNb7phN14nwaan420WGHtplqfwPCjEQauCvsKcwidyhzl5X79e/xoiMnJF+KKDAZkOS5YMm83XL4Bj0beYoEPT2pelQ8Oj8sRo8FMSorWM9l/CR4JMgaLPHDohV4XZ65mLPiqWnz3odKizhlLTZU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746110016; c=relaxed/simple;
	bh=bT3tXssg6ljHTYZOaPjPGNc1RzAsrRKhBsBNi8I09cM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=H3oUwH4WSRmc+iuLXrj/bIvlvF0H0ZMZvDwxHCocTzsLp7bjE81X3uIeuyB8tUErcGtFNdtkTzQFaaqTFQ+V0z+IRehT/2AUzNTsYn2D/ZMvEwLHDHTFpl1U4bNN2Z6kAIZSv4WuaMNvfZBesnsI9M08dE9+9AkXBah8RWXqzyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bUy7c6o1; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bUy7c6o1"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf825f46bso1328815e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 07:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746110013; x=1746714813; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g65zjmvJFausBkB6nJxIUNRj97LVqw2lVuraVtSlztM=;
        b=bUy7c6o18T2Nv8DiCTEqMwrnwAne6+mwwRh+jq4jL1uLgIqzSOMFoh2PWQWNbDuivG
         qnPcOEg+4jsQ3ayt2WexdnW5I7gMRzmkmT2KXTPtHrw++HaapchayObgwQDHf3uzzkcc
         NS9LRZf4JlC9R/APCWbAQ6BLWwltsFA1lgqbSEKLfR3KPN1O8CjWtQfAt4S/6hnkLGcd
         5Gpzltk4Ax3giaqfLGWprR6tK+sHr9C7BhcRlIEdSWEJBcyp7W0w7MiBxoB5td4NZ0Ws
         ILvfnlyRG1eemZHSQofn/AwYAEY8z9rACfPpORLcioWrb8JqIOfP2G/KB7BcW5s4pRUc
         ALMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746110013; x=1746714813;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g65zjmvJFausBkB6nJxIUNRj97LVqw2lVuraVtSlztM=;
        b=apWNp2dsHateVmlLtUgaqtIOfEvgXAtuRgAWFAnCFY5v5lt7pNxk49AJMT8xU6idBw
         lwDtCn1+BJmSV9zdik9fK7oqQmqV4rCe5vuHkihN9z9tH+GSd2hqXB9NlRvUUwXdijP1
         8+1f1mCsb3DXxJRSkTiYIs+NPm0JN3Kj3O+EkuIEu9EnvGyjh0L9gcNwfpGWwKSgtK9t
         inMcjMrFO8d17SxvEjF8iuS+bN9810NEbNdC1gdnydp5eq1RUsnYOjwFZksLRHN13pYn
         eP/yEzFKYClNgwDwt79Lel3LAqYXi2R0QBNg8wtoPB3y1U01xEGocoaodM6Z5jKHAB8D
         3zhw==
X-Gm-Message-State: AOJu0YzrIZ9elAA5QO02TMwaVSe7Cogen6ZO3t2Dbd8IGA04g1HQTXeE
	Tpq4kw8ybVHXGaFvf1RiZX0vawGbDpAeB7rY/HV4uiM0lMIG4Kx/34Q2dTFOP+I=
X-Gm-Gg: ASbGncu4/oEOqWY1zF4pgybZwts+lYSrDbXvGTCK4hElbXRV7l84k50DGHPit5W2b0U
	T7URLPvsAfQm0nIxLVmUeG0YtsqjZ/sKYIgxzTMp7iUwaGpjjse41048szjKV3Inv/fS3wQGetc
	rHJV2hB/O67V6g2CR8gHhcnYZ7ZGyhOVvOvMPJNd4tpqIno013qTf4FJc2SU5dP6ARfxYqbM9ia
	1b7h9CSbawMY74QqvA63vDImuN9Y2/KlZG8N5HkNeUNmzNsUkJoOxsDRtf73yZMFueN98r+CEsg
	3QdYuMKfJ4cLe7TVrHpnwvDMNSlbGoF+ozDdxfhrbu/b3MqWh48dBgigkVI=
X-Google-Smtp-Source: AGHT+IGiMwCsPJVRnPOnuT9nr3mjkXhzYlZtUEKo3aB0gvr9Pv4s+D2qCg2ZzwsgCWjqxYje4WJRQQ==
X-Received: by 2002:a05:6000:1ac5:b0:39c:cc7:3d3b with SMTP id ffacd0b85a97d-3a08ff7ef08mr1745229f8f.8.1746110013205;
        Thu, 01 May 2025 07:33:33 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a095a8ef66sm957636f8f.88.2025.05.01.07.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 07:33:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/4] extcon: Fix wakeup source leaks on device unbind
Date: Thu, 01 May 2025 16:33:20 +0200
Message-Id: <20250501-device-wakeup-leak-extcon-v2-0-7af77802cbea@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADCGE2gC/42NTQ6CMBCFr0Jm7ZhSy4+svIdhUdsRJpCWtIgYw
 t2tnMDl9/Le9zaIFJgiNNkGgRaO7F0CecrA9Np1hGwTgxSyEEqUaFPJEL71QK8JR9ID0job79C
 a3Colr1o+FKT9FOjJ6+G+t4l7jrMPn+NqyX/pP9YlR4F1XV3I6KJSZXEb2engzz500O77/gVeQ
 elZwwAAAA==
X-Change-ID: 20250406-device-wakeup-leak-extcon-dc1d4429a2b4
To: MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Hans de Goede <hdegoede@redhat.com>, 
 Chen-Yu Tsai <wens@csie.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1195;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=bT3tXssg6ljHTYZOaPjPGNc1RzAsrRKhBsBNi8I09cM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoE4YzXLDQ806r8BrZZ6oTVp5DEGxyZxK94s8Or
 fFSmvo31kCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBOGMwAKCRDBN2bmhouD
 14FzD/9jFWKh+0fxXBvM221H/9dCIn+AtI0nCMu/87ca1znxj/ccajg7bZbc5nJ6r4bFduhXPZh
 EdfcxQg41owUOKuP9sShCy+KLpe4CqV/bPrTUUwc75rPW0otZKxmJHmV4RY+D1OzozQ1j8saBlQ
 /Hgws/ExCRJycOyfPlYXKpcNMq5trAdUA9GiRExd0kcdVFTbEs835DttItiQwm9cwYfdlxeOd5V
 rl3cvxAGaeG5wrhiKKTnDaeR40ULKRqRNiaweGZ5j4YlawMI8vr4mseO+Ap7E2kFNnVr7HtORBx
 YFTuTrLo1HqF1HnVY8HP2TyMmbjZo0Ac+R2Tg3JTH3ld076ai0y2p0ga3nkZ8D0YbhrCzJpcQ/O
 8kyWbFbaXd2DnWO0+b5PUaQsLWILt1IZfFWvxeXmWbDTrKpEtnH6zAr1n7vwlt5x15y9V350rtA
 zIHbpSdP9rL1XZJWTuHyspTZeABWhVzaxBPDJ1U4HkwhOd5guQshVq7zrK5ZVhnAUkuIRea/SyB
 VxWZ+cKioRw37guNjXSrsOXC2f1i00FjEcO55a2Zn2Oz8+q2OwKwux8A2XvW2Xej1E+c8byT/tD
 nvCjSdLkL0GtUXQO878Itdpmi57VCR4Yfcg8Bl0HO9hkrXL4hzT2Bo3CN+1AK5zfvr29gGbMBjC
 NNljIatd1u0qliA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Changes in v2:
- Patch #1: 0->false, extend commit msg
- Add Rb/Acks
- Link to v1: https://lore.kernel.org/r/20250406-device-wakeup-leak-extcon-v1-0-8873eca57465@linaro.org

Device can be unbound, so driver must also release memory for the wakeup
source.  Use devm for driver already having devm interface and manually
disable wakeup for drivers still having remove() callback to keep
consistent ordering of cleanups.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      extcon: adc-jack: Fix wakeup source leaks on device unbind
      extcon: axp288: Fix wakeup source leaks on device unbind
      extcon: fsa9480: Fix wakeup source leaks on device unbind
      extcon: qcom-spmi-misc: Fix wakeup source leaks on device unbind

 drivers/extcon/extcon-adc-jack.c       | 1 +
 drivers/extcon/extcon-axp288.c         | 2 +-
 drivers/extcon/extcon-fsa9480.c        | 2 +-
 drivers/extcon/extcon-qcom-spmi-misc.c | 2 +-
 4 files changed, 4 insertions(+), 3 deletions(-)
---
base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
change-id: 20250406-device-wakeup-leak-extcon-dc1d4429a2b4

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

