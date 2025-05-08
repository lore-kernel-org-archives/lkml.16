Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0BD2741BA
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 14:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746714900; cv=none; b=I96oceUfke+2zAOdZUzVnpFwQLGhE0j97EaEkiGmk0AKdoaljeJw0U0n0+rlzzD2zKztwPlEyvbcQ0Jd5U01OdEy0PZ7UV+g22RFQltibmDMriKS8SLX6pa+AbFJrnLNLGX59GkVVu9/jpOsg/YE6eOtAbvJITBQ7s8Byx9K31Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746714900; c=relaxed/simple;
	bh=S6xk8gQHC3YLD1Jam8QnKSHYbugR68dS8H5Eedxi4bY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=s3QIIDSwqphOJJ7vaO9RB5T/uny+ylzASYvdkNoKHquB85YI4HATlfCuni50CR0uvCw4mIKck2bdbIWozvVGcpgP6vt1LvmQwwWTtTtGGJmAexAIRM0WJrkydxunzLKoxSQr0HETD7FxXs6PJz0JaYmFI2S990e/FRFSXO0Nli0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WwxXk5/p; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WwxXk5/p"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a0b5b90b7aso147732f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 07:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746714896; x=1747319696; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1dn6QKLYPM5/ncrpI5DcFlLN8TipCwy7tClQS2gE2ZU=;
        b=WwxXk5/pYMCVbjnFaWhFxgGGDsFRqCuaTILc8Icy5s64PVqICJzyK0YuDOoGJgERQX
         mwm00zn28my2ucNe6tg0yhwT00iR1XCk7dLBhB4BndGs3vUDTAbDKNNksgw/TLQ+S08E
         PMdqvm/vp3sO+KlSWn1PbYKz6HSclj5rwS1TpoNrFzwVlwvqH/AbQzmQz2wzCbA08D6q
         i2y/rUT1vAv4L5O1XZDGP4XtbgEiWXa3n9MC372Wga1zXFiyxdNDPsdWL72fcxzskXA9
         iNgUrjyXo3T58OwGzHOgc0XUgji3BV0CccrSFmi62wMjW5EIb5R2tWZ5VKM4PSU7seX5
         TRoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746714896; x=1747319696;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1dn6QKLYPM5/ncrpI5DcFlLN8TipCwy7tClQS2gE2ZU=;
        b=ADGo89W53snO/Xt6rsGPUGqpV5JfRogZ+1rXivThAqSy4Nu6L5FybcsEb7ziEtlaNh
         XrYX9M3tLJoiE8y2WA0GHZQtaVT289WaYuJ/8k6vBhAPeMkKpK228hXVm0HDeCCJGs3X
         jodrWzXOKUyqGTvHUwJAWINbpaNJ+qG3HogSEPK7wcHwlkq93NrtWRkhFafKY7OqHhaR
         Gggm3EcpuxFt5/HM1WGWdlPDy6gIAKhwLYEBVFuAj8rJ+ULLGN+faGTyNx5j3yHasgnR
         ocRo5mgCfZaU6sU/b1lClP/ff9DqDnr/nmav7NQqidA8LD2XNt9MccgmnV7OY5LIJ1II
         xzgg==
X-Forwarded-Encrypted: i=1; AJvYcCWpm1W4zGh04lsKSJFeH2q+QtMo23y/riwShRBYDy+lJ5CwdZ5e/aV2vcktiuOM0z+ne7zi1/a5K2qKIjE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5dCc6u9gnVOVZsyW+ZxG2gUqLa1qMG5syz9tzD2ye7ghCoWHh
	b3/PzqldomC79wC0rTQ4YC1FTnhFuhi6/zc5xVbZNWKUDRfoRY48OAMHHQ3EuIo=
X-Gm-Gg: ASbGncvB54oPdLTUwQxSsiS1d8lAs1xcoN36I8YjwZBbPUSZfBaFV5v3thechbP2VIq
	/daHKzAwL3wRMoBxyMfRnauihEjA+sBYV5PaPfeM5YfsR3vdd4a1ejHxVi5EURc5IX9ykAhdUHm
	E4Lw7MWs9H7PV0gxLo4ck4H+Sz8omrtJFxl5KHJP4XoVs5cM/lkb4Xn+3yOb0K8kODGGacdDjyl
	P1sHgIQy4bnUJAS3UdrRhU9zx3X5fkWEdaiHw0a0VOGoAsW4XIV0ujwcBlbQxsWRUGhq75S3OZi
	pZmdCwQ1VR8fyPJEcqzu1A3Mo16LuLkha/DtKpm2rAbzXfkUxskeSK/EqWg=
X-Google-Smtp-Source: AGHT+IHA+hPr3mhv/F1H4c6+v/AsLKidYl9hpKYtAPH7hY0Gqe3OHwNwzvvzE6kBPm+xaVLCRn5HEQ==
X-Received: by 2002:a5d:64c3:0:b0:39c:1ef4:b0d1 with SMTP id ffacd0b85a97d-3a0b4a37433mr2404238f8f.10.1746714896517;
        Thu, 08 May 2025 07:34:56 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ec98dsm149861f8f.25.2025.05.08.07.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 07:34:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/2] drm/panel: Add Novatek NT37801 panel driver
Date: Thu, 08 May 2025 16:34:46 +0200
Message-Id: <20250508-sm8750-display-panel-v2-0-3ca072e3d1fa@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAbBHGgC/22OwQ6CMAyGX4X0bM2YDJGT72E4jFG1CWy4IYEQ3
 t0J8WZ6+tp8f/8FAnmmAGWygKeRAzsbQR4SME9tH4TcRAYppBKZzDB0xVkJbDj0rZ6x15ZazOs
 8N9rUSogUotp7uvO0xd6qnT293jF92JdQ60BoXNfxUCaWpgF/H+ArPDkMzs9brTHdjO0e53+DM
 UWBpGp1uhRZIY25tmy1d0fnH1Ct6/oBGZ/a6OoAAAA=
X-Change-ID: 20250424-sm8750-display-panel-6b66cacb5001
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1045;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=S6xk8gQHC3YLD1Jam8QnKSHYbugR68dS8H5Eedxi4bY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoHMEJa33Z+nUqmz4wKoOvuYq/TylQ4sRlbGrx2
 Yu96KngTi+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBzBCQAKCRDBN2bmhouD
 19M5D/4z9hi2LhjQbhcJnqmm/BjjE1e7i4YDrLnFxvhgvQ+vnchI6lAdp9Hsd00g8jxMCslhUy3
 z+xlvqRqqWFdJy777zYRIud0ZGmy2ZqK8Y7D7Djkw5jDTCspSMjVv9D0mjEVrlZ2SwZL+tGTowt
 tmKZJEyQ/8VABaZZ2RpK6i09helfVuAcISfJz5rIg8nkzoV1RtAm1B6UlsJG8S31dxKdO6z2KP7
 d04muqAxlecKOpmDlUNeQtaBU5w58uDXWkB319alc5yhKsIzA6qu84HxlhuVJ7+8qKjZKDCktG1
 4IPTI0TEMBC1wykTNqvJjH2CUKJOe1EXDFDi2SiMRgmANT8l/4x5ozY9j4KhH+iw2vGdZhlqYHV
 UD+JExShPiGOf862itpFLacXwrLjO5p/7pOJfEQUeNxP+9KvMpehLhG5Xn1xx5YjESvS/8tPkyI
 pTiqdiCsWwfUy8ys3+snBkq6R+iX6vAs9FGHzhleLUQ/yq3gUzuwU2S+1h17JuVuuKlGpp6ngep
 qiWm3XVatIeGilN0Hgf0X2ZxAu0p/j1XI/pOlIML8it82+y6dz9fCoImxMTdwUhGL7ZdGqCOWWy
 ZuR3/JYRL7k4r703ObYgOoHNsLG4S1T2Hun6jFNq/MGb+0UfR7nVgURIrdngnE88sZhTE0e2yKg
 NE06Q0c4Cr9S2Kw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Changes in v2:
- Use devm_drm_panel_alloc (Neil)
- Add novatek_nt37801_switch_page (Linus)
- Add Rb tags
- Link to v1: https://lore.kernel.org/r/20250505-sm8750-display-panel-v1-0-e5b5398482cc@linaro.org

Add driver for the Novatek NT37801 or NT37810 AMOLED DSI panel, used on
Qualcomm MTP8750 board (SM8750).

Best regards,
Krzysztof

---
Krzysztof Kozlowski (2):
      dt-bindings: display: panel: Add Novatek NT37801
      drm/panel: Add Novatek NT37801 panel driver

 .../bindings/display/panel/novatek,nt37801.yaml    |  69 +++++
 MAINTAINERS                                        |   6 +
 drivers/gpu/drm/panel/Kconfig                      |  10 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-novatek-nt37801.c      | 340 +++++++++++++++++++++
 5 files changed, 426 insertions(+)
---
base-commit: 0273d02b2f84f645e8b8ab317722931eb96f6130
change-id: 20250424-sm8750-display-panel-6b66cacb5001

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

