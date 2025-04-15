Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628D51F4614
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 14:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744725834; cv=none; b=mGrvGRk3mP7MYbbp5t55Z03/Fo84nR7yPDbIt1ae/s2LQpTNoLvPaeUSPZR9jSZ1Gknv7AG+z4Thw4Ea0iRovkHCUx2IV+3mLWmK5dCc75VcYP0Je3HdGjVgiJEGZ5opaRF4K1z/P+ivHSn/4ZjKNDyaevMDVuOR/FuntRZRnII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744725834; c=relaxed/simple;
	bh=5bfJsgR3m/o/t1OHYyV5icrvh0iH7ZHvs7Ywc6HuCLQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HTDNx/pcu1iowLGD0byrPY2W6s10RGrksMw1LVXypNr3LTsEmNIzOW4p7hrNfdF+1yWxCNZLOFA9YqaHDHejeEYwSA2pHMkitocShDohw2Z/d/849BbEd19A6qCTYfdVf+VHPKFe30lCu5lg3+T1zYNAOWdpL4Na/e4wJowqgAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OsWxxCh9; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OsWxxCh9"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43edb40f357so47187995e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 07:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744725830; x=1745330630; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iSMcwciXFDhUl1+08Fh5h1VKOSqvYJ+dyCoPGR8uh48=;
        b=OsWxxCh9AqUGgGsVqTi1oF0oryuKwgJB33nNah2EGri4j8gQSGov4kJD5t9+JhPrAL
         nUKMKtNLxoXq46H966wtgF/j1WDKlIdceaLUXi9nrjS9NoOBsqU84KTk/ORJZs965TeW
         C9TtuJTedhqZys/PLfLGcFMUHSPeQUX2ZcaZ8mAtMWHifGlAUrRPQw6AwYno+NEPk/IR
         moLqTjL0Vvsyh0haw2GEBOUU+Eb4vk0kVzUhLha5Dz3lAOIKoM4hT9mxC8vGtBQxHwIl
         dzVdW4lLv4rClxk4R5zUN+Czlam8OzykP3JsiOK2n81YdMLiDYNWAxnc2SzIVsv1aYCZ
         XI/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744725830; x=1745330630;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iSMcwciXFDhUl1+08Fh5h1VKOSqvYJ+dyCoPGR8uh48=;
        b=BNzZ/W5jssz/B+aBI0qAe5FF+OXkFTj2XLpD98X/WEojQlvk5Iae+B3tsTEK7Jb97F
         tZSM3EewjYnlbx0VmaJBsJUckQykE4NZUUr5wzANeTMCx9cUwMtj0XKtv0QFZ3QfG1X3
         dacHrtEjFIZvb3IFEKUi3BDfJCJGKoqbI2cV8cfKj8CgLYx94NAjm9uwZK+CflZnIDhu
         e1SNVyjo41CygWzo66PWmQCG5PT8mHn3paMVhd+FC1iER2Fu/cy86FqAp8erZHg7ADge
         WSFBngI4cyTYQsP5D1bthI0pTjqVAwfxO99v4TOBRthlZz7FpNo4xxox9sbTOQIdrlvC
         MBRA==
X-Forwarded-Encrypted: i=1; AJvYcCX4iv2da+kPehkgG6pV2uha1Sc4VByL0TH/Z+jJJ344PL5brzmVABWYupfKPNAPHsvl1dR4n0gvMbSsGvY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfxU1E40v0icG78FqwLlVphvaeTrq1cHYbrxDMFVYJr+svzyZe
	UCAkBrpwd3TPLDY0S7VJJnJTXPnsFKT00IvZXPeDXw0Xej9nEzAvpNFrpj6tm14=
X-Gm-Gg: ASbGncsqJhq0JzP6IbhyDgLmV8NPG2hD+f3o0WQJKVHYC9KIm6hxeIQvPXGxvRqWlVa
	P/LaXXAvZabI1sRYHaVbvDI+9zpLjuMwWiLdhvcBpKYK17MVV9398oEh7tpqqLdG7/sse1GBGv2
	AEoV3tbGyjM7siwW+g0N46xafRZ3oLlmc9FSaKxpxTwBkGwQsTwxQXghmsoOhKiCTxmdz9xFcLS
	gEEpF3X4nT+arjE3/SAEYgLS1y0PuSwxaei7W6YI8roPyRYt38LiWPDXbeWq1I2lexuNyPxSmjK
	aVdkrmtupp53uWsylt/MkWl2Xz4GgmZQsEf7FJvqgLC0ay7VBiHIqkfNZQT5u+Kz+UBAGwVL
X-Google-Smtp-Source: AGHT+IFEA/aJ+3RMT11dq2pF/arT4Y9Og71cDqv5JQgKpe3srWBWNpFe/YkbdCDPZghLlxg4Cni8LA==
X-Received: by 2002:a05:600c:46d0:b0:43d:209:21fd with SMTP id 5b1f17b1804b1-43f3a9b02b3mr165355905e9.30.1744725830091;
        Tue, 15 Apr 2025 07:03:50 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f206332d9sm210480765e9.13.2025.04.15.07.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 07:03:49 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/2] interconnect: qcom: sm8650: add MASTER_APSS_NOC system
 NoC node
Date: Tue, 15 Apr 2025 16:03:46 +0200
Message-Id: <20250415-topic-sm8650-upstream-icc-apss-noc-v1-0-9e6bea3943d8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEJn/mcC/32OMQ6DMBAEv2JdnYtsgsHxVyIKY47EBRh8gCIh/
 h4rNKlSzhY7swNTCsRgxQ6JtsAhjhnURYB/ufFJGLrMUMhCy1JpXOIUPPJgKi1xnXhJ5AYM3qO
 bmHGMHvXNSeN6p0xfQz6aEvXh/ZU8mpMTzWt2LecIrWNCH4chLFZs1TV7klfwG2HFmSDrPwlzZ
 KTW65aoNPeqs5uC5jg+Gj90KuYAAAA=
X-Change-ID: 20250415-topic-sm8650-upstream-icc-apss-noc-53a08afa18f7
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=993;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=5bfJsgR3m/o/t1OHYyV5icrvh0iH7ZHvs7Ywc6HuCLQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBn/mdDpn+xZ+RYrEX6/OBCAaF4nMt5i8FhE6bkIpjk
 1Q83B1KJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ/5nQwAKCRB33NvayMhJ0erpD/
 94TG9P4WKRl4RZy23i/74ssR70noio15L2KIquvl0ZxaFcSJBwRXUTNx0/nyIvhKzAAiqEBNalEFrg
 7ZxEEYi5aG9RggPiTNA4E9/Oui2VgpJXnBY9SSnyD6IDQo/vBiez+Xqj4a/hr2HJB9T5OgvqkcUaVp
 Vw7zLgyjl4NOzoL5/1EzKMK0KqJB0C2IvA9umFd/z0+YFIiCHRH/tqa2g4JYUtabRdjPbZEo6W1eyS
 Jc5V7BRg0NFIYchg7ZdmdsYXT+I3dwpi4FFlVrIr0RS9PwE27+A/9DxapFgu0bhZKW2i0I7WbKnjL9
 x7fqtXwozUQ2glGspmwTdty11ewChIAOwKjo9kT/W1ah//ThZbBzOlCfFpM9TdY86kwDZHXVKf6Xks
 nDS9UoYEOchdOwAeyvhmyeMdPj/TGyoscKh6igal60WvLEAlXgh3hXuWZWmBibU/vZhm59Efae76ye
 dOvE25Kgfu+xLwxYoRNZpVRxev9C5rIlonD493WmUpWJ5C71TmbqvWix3N5urILnQABkqEXg9+Z0MN
 T4P3qSSXcBAiSdz8TYv/nTv/iBARtYxOyFp96JQBmP1YLSHt6Hve34+r24iIzXHZQg9oCVET1j/dpA
 F3mtzz0Jh81q0GejGaJLYrMDoKN8h8UiwLfkEW9rnQPZMLDGuMFiPZ6gU0SQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the missing MASTER_APSS_NOC system NoC node,
synced from downstream driver.

Depends on:
- https://lore.kernel.org/all/20250407-topic-sm8650-upstream-icc-qos-v1-1-93b33f99a455@linaro.org/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (2):
      dt-bindings: interconnect: sm8650: document the MASTER_APSS_NOC
      interconnect: qcom: sm8650: add the MASTER_APSS_NOC

 drivers/interconnect/qcom/sm8650.c                  | 19 +++++++++++++++++++
 drivers/interconnect/qcom/sm8650.h                  |  1 +
 include/dt-bindings/interconnect/qcom,sm8650-rpmh.h |  1 +
 3 files changed, 21 insertions(+)
---
base-commit: 64e9fdfc89a76fed38d8ddeed72d42ec71957ed9
change-id: 20250415-topic-sm8650-upstream-icc-apss-noc-53a08afa18f7
prerequisite-change-id: 20250407-topic-sm8650-upstream-icc-qos-ebc5bee4896d:v1
prerequisite-patch-id: 04fba63dd9b30c5ff407351a86ba445373c841b7

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

