Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCC4283FE8
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 10:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747133474; cv=none; b=DZAgOZSETiJQ9jOZUudMvQMX/x3ZtlZHOJOi16uDdYLAL5T9gB+5SHlc6QUqf2zceHkp77yV1+uICPJApVGEY44NsbW661F+O+OL90N4BC5IQqlEQYYktkO5MJeB2pt/2eDPGPFPJ0GVrS8ONZKZtm0U+TsdVd5AE5MQ4kJRRqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747133474; c=relaxed/simple;
	bh=5E1lkeip2PilixN5+Jb/Tp8zQpRVxsoWODfvUlJQfa8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BKMOLmFESiGvtDvd5Gvjj3mVnVVAiR+DKmXOG7uu5C0BDtFlobp93zF5TgmD59QnC0Qj/CPUXpy5ktu0E4OxUTAAqm4uqKXMdWv0g1ggmPdAZL5/x97LpHuplrDpsWcDpIaidpzeFjbN2idyk6BHjEW/5wC+sAXLKBF/7e3KZZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oHxoUprR; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oHxoUprR"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43d4ff56136so6038595e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 03:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747133471; x=1747738271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7dpPESwPV7GmKfyNqa21cVHHZT8VVNzAwp2ympaxpjU=;
        b=oHxoUprRY0dgc3QY/xdgQubEV7EZDEUzOgq2DyZHc2LbvwMfOqqMvrQVWBBCgADc/b
         EL8eEv7KX4820LUaF9hqyIzM8w2ex+Sz1zuWdvqrWc51jmHTrE04BXE4DcLfSMnUtz7J
         R0yh+UbFYgjHQEgUM3rwhdoRDhr37ja0h+sYfALT5WDy7LMnfBxv3B6EkzgitbyK5psl
         NbzSltpMocEm8RjIOwScQX59xicR7wE0mViegeh6iCYmoMtv60QnTg83kX2HIC8VMo8X
         mWeV9a7vJqYOV8X2Q6txtVpkGTvvQiCCdXjDfX01LHrSRENFNNhIlumKAlapW8OGnN5A
         2Niw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747133471; x=1747738271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7dpPESwPV7GmKfyNqa21cVHHZT8VVNzAwp2ympaxpjU=;
        b=j6LvWFDlvWhANIL0k+bTm6J/Z1RfNVwstXxvf8r+dONqz9ZKn9pfFByuDvAqpIKpFD
         /vY38E5jWnd194BP1NeyiGK5ZFeMwROSXcUtOd1K7GV/EoAQoQ9Fjcgj/JsgJU68ZVZG
         3L52qjw0P69uKxsOakMncMVwT2yu8C5+7ec/CY74pfcaeWz8A2LaC+/EvO8nhomEDXE8
         qYZFpj2Cr71I329gaDV2K9zcZsu97O/rPF8vMz42u9zPF7ygyGz6uBBop8W+dQJn4TvW
         C+8OTdbqC70Z7ffqDiwut6lvD2N+kVXHrn5Wks/TUE7e5g6l/eOzTn4DdKqIIVkGbiJz
         8DTA==
X-Forwarded-Encrypted: i=1; AJvYcCU3upIg20/9rDhcdhQqJ+7daDCZ/gcrATJ6L5alCkP/l2aZorBHeDAeZgD1hA0wSm39bttUkjsoGMRX8bw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFPZENldAuVglGZKEcN6JsUOEc8g4adK9KfwrAhiuOenhfT9cH
	7e7nVm85AVLFskEK8P/hdvGSkOZTOOPw7kRwlFMP8M8I2PIIWJEJNblgx+uYU+0=
X-Gm-Gg: ASbGncsjJLOHlMwlVYt5v3/wIlPm1jAM0/1xr6b4B+On77fqz9Mr75hJincJzMjixg3
	QEF9VM6S+zfKd3zxO6I1S5q7maPfmY0cLNbyWLz0y+ZkoKk57HoVe8k9Gufc2YZCycNHkbfzIwc
	kdgqG8zhFRPKMfrJa2S5bjZhCY1n6Z4z/50Bt/7XjM1N/aK2517CsB/SDEs8BIw35I+tgF8PRs0
	BgHHkcDnejlnxfblW+uJG2o7QvbMwHExLG6nHzsSf2wwYOzBGIaHpsD8h+TwuDRjA+GG+G1t+UC
	GETRjdojPoRbngwP7iFcpaeoz8zOyyX1bSEdQ15MMAbi5Ap9LPOF+Oz+WJABXauTg90w2iv7tKU
	ncnD571Xx4kdCdE0kmlu+I9R8YIlxlJ7FSVcTRIQ=
X-Google-Smtp-Source: AGHT+IHheRa2Rgn9S2tnWNBbq2OUiWZoBRuQ5Na1mJuasKDMUODO2Y9aeKfPW0J+6bPRanqCge7sMw==
X-Received: by 2002:a05:600c:1382:b0:439:a30f:2e49 with SMTP id 5b1f17b1804b1-442d6dd5413mr49242215e9.5.1747133471089;
        Tue, 13 May 2025 03:51:11 -0700 (PDT)
Received: from kuoka.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67df639sm162708085e9.13.2025.05.13.03.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 03:51:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Rosin <peda@axentia.se>
Subject: [GIT PULL] mux drivers improvements for v6.16
Date: Tue, 13 May 2025 12:50:57 +0200
Message-ID: <20250513105058.27028-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2125; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=5E1lkeip2PilixN5+Jb/Tp8zQpRVxsoWODfvUlJQfa8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoIyQSOehF/grxkwj+XzxLDd9KJv6DYGiGHdQHV
 bnoNqhvZEOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaCMkEgAKCRDBN2bmhouD
 13v2EACV1YntbKzp5bw8LgPHLkGD6BjFKGOPtwx2i4RmAVqkOuRlmIWXRk3ZbbhQG+zJJEfjvqk
 VOUnKcyi1IYjzraAa+NlFxvLDR/ZRhupOXTGbS7AnsEbTYgwaqNqjMbOwavaEiPMxDIxxHTtVVV
 hZk1iOoZM95Z4ld9HqDlRKXbA6q02YXP4VdEQLa6Wqub+TBudfff6YWC/XeBEjoUAb5fAoYsPXs
 MuvrUbTQIpRU3R1ucC58LqGv9/1Leo07EirfoH8jpKls2t8jtO1VQESbjrkOu0RIl9hi8fy2zSF
 qZEtWotq8DPUHMvawAr2D/azyQOYJDR7YCXkELIu5JaDsssAaKuLld+YU571lgRZFoUX5e28qum
 GKTWQuVawZpv/itOpSKF/aRHCq9ib00jDi2tTijfb2lderzAo5esRi6YTHWhtRbO+6YP8Pk+hVO
 S+VNV2BGPmg0eA8PToYLcwgWNVGRSnvZZKPipjgQGZ53yar1xD7In9Hl1kO9/ezATwreWGeqiyG
 OsP4WgrEkY/L0wPaxw1HmW1bxTWFAflRXWtkNAnBpti42mNLaSJ0HTRP+qAJ0ATsotaJ5kRseKW
 w+CgW/ofKmKnBRM72l3UnqXhh8jYssaGFxxudVTgAdzzg/MefDFm8ClM1OrERR5gI4n/JJXMpax xv+iyQhRUW0nT4g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Hi Greg,

Please pull mux drivers patches - mostly minor improvements and one new feature
(regulator support for Lenovo T14s laptop).  These were on mailing lists for
some time (one even from 2024) and they were never picked up, acknowledged nor
rejected.

Best regards,
Krzysztof


The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/mux-drv-6.16

for you to fetch changes up to 9761037d28327e0d4ee9586a8210ef6462c2c757:

  mux: adgs1408: fix Wvoid-pointer-to-enum-cast warning (2025-05-08 17:12:08 +0200)

----------------------------------------------------------------
Mux drivers for v6.16

Few cleanups and fixes for the mux drivers:
1. Simplify with spi_get_device_match_data().
2. Fix -Wunused-const-variable and -Wvoid-pointer-to-enum-cast warnings.
3. GPIO mux: add optional regulator for Lenovo T14s laptop headset.
4. MMIO mux: avoid using syscon's device_node_to_regmap(), due to
   changes in the syscon code.

----------------------------------------------------------------
Andrew Davis (1):
      mux: mmio: Do not use syscon helper to build regmap

Arnd Bergmann (1):
      mux: adg792a: remove incorrect of_match_ptr annotation

Krzysztof Kozlowski (2):
      mux: adgs1408: simplify with spi_get_device_match_data()
      mux: adgs1408: fix Wvoid-pointer-to-enum-cast warning

Srinivas Kandagatla (2):
      dt-bindings: mux: add optional regulator binding to gpio mux
      mux: gpio: add optional regulator support

Thorsten Blum (1):
      mux: mmio: Add missing word in error message

 Documentation/devicetree/bindings/mux/gpio-mux.yaml |  4 ++++
 drivers/mux/adg792a.c                               |  2 +-
 drivers/mux/adgs1408.c                              |  4 +---
 drivers/mux/gpio.c                                  |  5 +++++
 drivers/mux/mmio.c                                  | 15 +++++++++++++--
 5 files changed, 24 insertions(+), 6 deletions(-)
