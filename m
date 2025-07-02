Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2D71DD529
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 08:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751445942; cv=none; b=gcEQXWUZbbgtMW5RmYS+tPo/ik0ygvBN1RM0GakE3O1FRYlQDcD/tIUBP8F/oyhsYBdvD6pDIKJRWulkIsZcchsNq+sCd+XuLM5xiEDbKleE1ZklQpvTyO16RNzvyqbLNZyAV/48sCua17MpafNFXh0a0WzArdjjLJcUk0+UYJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751445942; c=relaxed/simple;
	bh=FnuOlYkyZbbfsuuN7EAeiPYXAJM4kZfV/jmZgUvOYZA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jrnuEd/xjdkYePn3xfiyoEA+UyZB0KsZ1a5+SLBAfk2XaoJvqHMCatGyDvDYIPyZfOCBkpjqDZBtDXqenaOOw+uVm403xYnvC/vBOOQlH2z+3OfyoqFlnKD+vy1TWNud6J6XGNHjktPhFTo4hheM1noeGozKw65/Sj76NTcq52s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=AQozF9U0; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="AQozF9U0"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a522224582so3427426f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 01:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751445938; x=1752050738; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QDWGSu82gDhbtHEO2HgQwloTv6RTwtjtuDR2SCkVfU0=;
        b=AQozF9U0R4RNI3UztaDh39Aj75xvaGq2Vw7JK9QfeBEkCsT71J+XTZ9OlBkh7XiCTb
         Tr9J40J73BdLbNL1CRxtpMhJLwEmR3k2QD2gQUBqWCbXkgbohvBt2h8WOmJxV908XVnj
         DaoEAC1fHuBXAmtaWH6hFP3rARBWAwg/9of6hBKYdOe07NZmsfJez7k5qU+EKG+jKNs5
         d7Ex8ECcYXeFFkIKw4XzmTx0hmGj6bnnD0kUdoOTl7+HJVp/M4DgDv69V/SYf4P19MQg
         J5al/nA6PSWlJAy0HKasrX7HseN79OBh2g1Az7p+Y7ZoHxMHobzH+xVy0UhcgrQ70fE6
         NTUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751445938; x=1752050738;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QDWGSu82gDhbtHEO2HgQwloTv6RTwtjtuDR2SCkVfU0=;
        b=ipS0MTVOERBdBX1cnxxeQAp3Gip6Otjho4vDQ388f+qhf7m57sW57uCkKZTNIxMb7M
         bGbNYeOwFtduhwLspWIX9dr9KVap0XJowmEX/OjW2J6AoAmX/eBNcU41UvDtBqEfkiGm
         tCusv42JNjWyMvDhc86RfYwb7WIqqOXD5EWP8HuBCvsXSKLo+w855t51gh522H0iD/HD
         SuX/+z5y6I+Ztm+xDXZqBtN1t2Xdr/hztKsh2P6Va/mJs1wBE4stODhJ7pMFXT3NCViK
         Ei184rPtO6YKjHjD3klwLTP89Q9RGxEEZGmV0irZdtv4A46iLlF4bCZsCWrIFx6pk08r
         MZEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUchG+SyCcTKc0mKsnoF4pBw88jBvIORcOBseF2GgtYaNWvLJUJCsegstozeiCknQfu2ZWPQiqCqG5wlVk=@vger.kernel.org
X-Gm-Message-State: AOJu0YziL0HOlqbr7Y8mE3h/ptY3TWbbHoA64WhSQb9Ic5es152YL0hJ
	XmGmvFlCb+C1xNBJHCxVX7qAtEmcRRaV0fsG+NXtxl1nBFGXZRoHpCAlKyAkf0czdNc=
X-Gm-Gg: ASbGnct3zbcptrLsc015d2EVPgQ5IjVAVvi5EnmIdvjvPZV9ZqDJiS4kz1tT3K3jqei
	46sUnGj+KpxJFz0kKkg1fzUnygrgRgXy2CcookSa/cvl37YfqXc6GabkNzIL6X/w/rxw0ttOqd4
	qogVQrpqvhXtmClrrFCaHgtwdHUb7uzIX+VUe36qiZ86Acgq39c5ajnd0qSfQwdqdMcNFXJR3qx
	+kFQ51QtZhIPPLiXqBjfZ2WJfzP7XZstyY6x3YYY7vS7E9I1oidbd1iebcWo7xQ9breWqsnaGRW
	AmF0kY307LSQy/YITqbchkyTS3I12lLcHY0ZoxHGC3GbtWjRJcmX3w==
X-Google-Smtp-Source: AGHT+IGrsFF8GEpJb9W+Lv15zmFhXWlu/sMu3JnRsuf09K9zqsvGU+TjI9frFakVxX/GrL6OT5+gkA==
X-Received: by 2002:a5d:64c9:0:b0:3a5:2182:bd17 with SMTP id ffacd0b85a97d-3b1fe6b5786mr1160138f8f.19.1751445937881;
        Wed, 02 Jul 2025 01:45:37 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8827:d0e:25e:834a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52a26sm15620571f8f.51.2025.07.02.01.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 01:45:37 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH RFC 0/5] pinctrl: introduce the concept of a GPIO pin
 function category
Date: Wed, 02 Jul 2025 10:45:30 +0200
Message-Id: <20250702-pinctrl-gpio-pinfuncs-v1-0-ed2bd0f9468d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKrxZGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcwND3YLMvOSSohzd9ILMfBAnrTQvuVg3JdXCKCnFMjEx2cRYCai3oCg
 1LbMCbG60UpCbs1JsbS0AU2saTWwAAAA=
X-Change-ID: 20250701-pinctrl-gpio-pinfuncs-de82bd9aac43
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2861;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=FnuOlYkyZbbfsuuN7EAeiPYXAJM4kZfV/jmZgUvOYZA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoZPGvpdYAGAgUkamSWB/I7UlyVcIU+EtWFNoZ1
 3mlZdUn6MSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGTxrwAKCRARpy6gFHHX
 cl7oD/9/x/XqbIS9tEA8Yyjo5yqol66AK1p8BbgRwkBo7plDrKn1KqEjHtF4A86S3Rn0BzKQaAC
 wA2IPqCgSt5JT6kqZSoX9mjo0Zi+B8G6Miahq1WYeNv+UKx1NAW9Dw3JRq/CswAMKXBpVsrrBr5
 4hHZZOHzfXF0AH32oG7hY/X1qdWRdfIYygd1HPV0GDFV6nvztHfC77Z69/+RYA56Lw0WDhgIz5K
 EefbwytTLw1INvHQExYZW+O2LtgIzqNxQrHv0dr4ioctsHeV0ubzI2SHECTvO3ze6vG38GlM8ns
 XfU9F8g2m5XwF7vuhwxnlo3MjkYQ8kilIHlKQCzjpcLdVuRZGuhF+4WYvs6XCS6wiWs1Q4fh5jF
 C/Hub3fmqjOM/VYDmDCSzMhjvhxI10co0iV0Zs/amvbPpmdFHWl+Zz7dPAXmvsCndfcY2RlXSp8
 89I016WfxI0rIdUTk6dMKJMOdrGeiYJJYiGdq5c9OzPqS1kbqOuVH4JS/3sIU9c4ppRTAvBos1k
 3ysrV696hryxytxsm5Cp2lNg/NOK9iffH+ZyC+Mn3irXpgaZMJX6z2uBwou1scbAj+J3MzgJ4K0
 W4DCf6bLZIEMjgfabumsuRFPwrNAhlbHmcxsyQSreT2tXe9FmWTpVq3sh84gfkinT+khSExXOxi
 o5XDswgAOshpHCw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Note: this really is an RFC. Please don't spend too much time revieweing
the code in detail. I'd like to figure out if that's a good approach at
all first. Also: while I tested it on sm8650-qrd and sc8280xp-crd, the
last patch cannot be applied until all Qualcomm platforms are converted.

Problem: when pinctrl core binds pins to a consumer device and the
pinmux ops of the underlying driver are marked as strict, the pin in
question can no longer be requested as a GPIO using the GPIO descriptor
API. It will result in the following error:

[    5.095688] sc8280xp-tlmm f100000.pinctrl: pin GPIO_25 already requested by regulator-edp-3p3; cannot claim for f100000.pinctrl:570
[    5.107822] sc8280xp-tlmm f100000.pinctrl: error -EINVAL: pin-25 (f100000.pinctrl:570)

This typically makes sense except when the pins are muxed to a function
that actually says "GPIO". Of course, the function name is just a string
so it has no meaning to the pinctrl subsystem.

We have many Qualcomm SoCs (and I can imagine it's a common pattern in
other platforms as well) where we mux a pin to "gpio" function using the
`pinctrl-X` property in order to configure bias or drive-strength and
then access it using the gpiod API. This makes it impossible to mark the
pin controller module as "strict".

This series proposes to introduce a concept of a sub-category of
pinfunctions: GPIO functions where the above is not true and the pin
muxed as a GPIO can still be accessed via the GPIO consumer API even for
strict pinmuxers.

The first patch implements this functionality in pinctrl core, the
second adds local infrastructure to pinctrl-msm, next we convert two
Qualcomm platforms as examples and then finally enable the strict flag
in pinctrl-msm.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (5):
      pinctrl: allow to mark pin functions as requestable GPIOs
      pinctrl: qcom: add infrastructure for marking pin functions as GPIOs
      pinctrl: qcom: sm8650: mark the `gpio` pin function as a non-strict function
      pinctrl: qcom: sc8280xp: mark the `gpio` pin function as a non-strict function
      pinctrl: qcom: make the pinmuxing strict

 drivers/pinctrl/pinmux.c                | 17 +++++++++++++++--
 drivers/pinctrl/qcom/pinctrl-msm.c      | 10 ++++++++++
 drivers/pinctrl/qcom/pinctrl-msm.h      |  5 +++++
 drivers/pinctrl/qcom/pinctrl-sc8280xp.c |  2 +-
 drivers/pinctrl/qcom/pinctrl-sm8650.c   |  2 +-
 include/linux/pinctrl/pinctrl.h         | 14 ++++++++++++++
 include/linux/pinctrl/pinmux.h          |  2 ++
 7 files changed, 48 insertions(+), 4 deletions(-)
---
base-commit: 1343433ed38923a21425c602e92120a1f1db5f7a
change-id: 20250701-pinctrl-gpio-pinfuncs-de82bd9aac43

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

