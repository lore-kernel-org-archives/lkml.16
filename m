Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE2F288CB7
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842796; cv=none; b=WHoV8u6wlEyF55/HY7rbLMhncPNhwNqdmyOoNPrAF8qbHvudIEeXNHbiB48GkCqD/6tYXgPQKwZ+nzQpjToyDMcmyatdbc0N5AtMeygRFeFeR2HqyjRIFXbmEN2K76+fwu3dnypY/pMRO8culSHgu4j6RYmDSTjsNwzHxPp5mHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842796; c=relaxed/simple;
	bh=rCMJF5cY6TSLNwLvNZ8Vo7vwwOm7NqQ5k6GlrWG6fQ8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DNsGcBasFKOPNfFUpEqf+nKqqenVYcTDnwZttDkuAez9F+cuWjMiVw3NwyknLBMChpk1ulYIwbP+Fh5dXbyMlFCBnIl6R+A84At2GAi5sGSu2wxmN1StzBPLRr1FI7zDcJx4zQG7wlNICi/1OUZW6g9YiHjGPza3LEvLwLZHUJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=KncfVZip; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="KncfVZip"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ae0b6532345so136058266b.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 02:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842793; x=1751447593; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7JDb40b+XMsoFH3hVYMNJlvkxxFd1SJzzC2buHHkiRA=;
        b=KncfVZipjxwz/ktQpE9/TY5Hr3f0hn1wRaDsM+yFDiiiBdxc3dwpxtZQeBFh4EU/N/
         LQWwf2YHD7zxh6haBXf8sw20o7KIfNc06mXYgfWxJRUL+qTp8OOnA338lTk9aRfSgSqh
         e0vPfOCDBLYosDaBsWXXvVMkh9L9V/K7r4FGI2GazIOlgIvYzgnNqde90xD4QRjiAP/T
         qcWkTBSTv/mdNuftFMJdnMZ9vljTdtaxZV0dgXS8tX8Tv4KIxc5y12t447pjs8Rl3ipJ
         Az2nSuVaQptB/CNB4NfWJMkvlf1xZLvZt3PoWWCAy0DqgWk0fWfdJsVByW+LcUucECLO
         LKbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842793; x=1751447593;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7JDb40b+XMsoFH3hVYMNJlvkxxFd1SJzzC2buHHkiRA=;
        b=prT8C2xJNu2PdC7EEZiSqRk5glj28GW5lNwqYKhlcU+4hMGIvEBG2w5drZrjFTgtnE
         ZQ09lqS5bNT1MBfxK4hGD0kV9/zwLB4NLJAKJOoaDTrZH2txBC+zvovmARBmmoHpob9R
         rvjP6fUPOI6IvSjMdBTUQ5l9FksQpQwOj8Unto3kDSZP6M7dXknaIpWWWIOvnZE4Q9kC
         3wqgIByOxJNCg5o2rsZrimckI2e0caihpgZFAMJ5uZa7wXVP9sCCEnRbNxuh8GxcqxcN
         mJqwJ4YwcYaQas5AsI+fB+ygGgCridzx9U3wdZ+h/Hj7qcyVV/JbAShPbThI3NOGodJ2
         W10w==
X-Forwarded-Encrypted: i=1; AJvYcCW9dxJfYKWLo95H0WGbJukTIXVjD40dRBgjrhmV/uE9WMTBHFnxlUaK42SSiNGDHRcIkHQmy24cLvkpCi8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHEPFhng7H0dNLCmvnxyNNZrse+ScxLYQ/v/fnlvGU5KHm1mk5
	9rOInMz5sn+3inIp/UP9tczbHCJvlCusP+G0YbpF+MzepaWu1HI30iO42DhGrgG3Ss28vNZQJ5u
	A5/bf
X-Gm-Gg: ASbGncvsWoW1aADsqRSTytQJU9MIU1qulWmne7F4qBWm/cmrksHB8GKInRduu4Oh2Na
	umcWyttfnq8nWnc30TIuYN4Ej/DrBMVGAQKhgiaKhQ9HoI8PUYtszwnlqedwIoVVEGwKIk9Z+cz
	H+gHTatmYjfxcXq/Z3G6MqvfNsRBbDiwglBUSZxeBEW88D8TpuVt8oHUpT5pQEgDNneIDT2TiGe
	mqzZy64RQ5PIvv/fOzZqt/SSNQIMp9c4xoMXOKebKNnbvW155KuUqI6IcuRM/0gtJyijzljRjjw
	Qfv6bdCsEJlnnQlHlSgSoS5mXTQ0+JeUBNlXf4CwVKOdpWoBZN+Mu1wQMuiDn1E4zRRZAG+YOaJ
	ysZ6kT+kcd0Hf3wxGWQGKtQs3veCo+ovB
X-Google-Smtp-Source: AGHT+IHytBgJSzxPG2M0B0pHjNve8tu+c9ENTWBqtwZam8LKZyOcUSplxme61y1UP3dKjhu+DHVnjw==
X-Received: by 2002:a17:907:7f2a:b0:ae0:a351:6208 with SMTP id a640c23a62f3a-ae0a715cf32mr592579266b.1.1750842792529;
        Wed, 25 Jun 2025 02:13:12 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0a93f5e96sm272499466b.74.2025.06.25.02.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:13:12 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/4] Add RPMh and TCSR clock support for SM7635
Date: Wed, 25 Jun 2025 11:12:46 +0200
Message-Id: <20250625-sm7635-clocks-misc-v1-0-45fea645d39b@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI69W2gC/x3MSQqAMAxA0atI1gZiS52uIi5KjRocaUAE8e4Wl
 2/x/wPKUVihzR6IfInKsScUeQZh9vvEKEMyGDKOSkOoW1Vah2E9wqK4iQak0brGD7Ul9pDCM/I
 o9z/t+vf9ACXX+NhkAAAA
X-Change-ID: 20250620-sm7635-clocks-misc-0f359ad830ea
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842791; l=897;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=rCMJF5cY6TSLNwLvNZ8Vo7vwwOm7NqQ5k6GlrWG6fQ8=;
 b=i5VJrCDxMfUXV0muX3ixGkMAukjuxYAe5nADAwWzlBfOfZjXRZvdIU+v2u71LqJCEcH5xer6Z
 1vGynEloSFrBpWyZHl9TpByd4VQxjmhqFem6M/nZkbrVKFHnMU71Pdq
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add support in the RPMh and TCSR clock drivers for the SM7635 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (4):
      dt-bindings: clock: qcom: Document the SM7635 RPMH Clock Controller
      clk: qcom: rpmh: Add support for RPMH clocks on SM7635
      dt-bindings: clock: qcom: document the SM7635 TCSR Clock Controller
      clk: qcom: tcsrcc-sm8650: Add support for SM7635 SoC

 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |  1 +
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |  1 +
 drivers/clk/qcom/clk-rpmh.c                        | 26 ++++++++++++++++++++++
 drivers/clk/qcom/tcsrcc-sm8650.c                   |  8 +++++++
 4 files changed, 36 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250620-sm7635-clocks-misc-0f359ad830ea

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

