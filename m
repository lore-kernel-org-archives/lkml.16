Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80436131E2D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 22:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743547626; cv=none; b=YfZl9n+yYyUWyXHnr9mgCCB33hZrRmno7uGmB1N3O68egdaoT7CHs5Dr+EsJEMbO9G42PG1BDeWXoH6XBkbP2YTmgpANA6sq1vLTXkxRd178hjGlqLKoQaQsOA3UgOh59WVmVcv5DC4AUYB6NPcH2ZTagqyJMK6Y8Pt00KLGFN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743547626; c=relaxed/simple;
	bh=mxxIEprYEvdtWSONJg9ldoMSY2Ps6beOPYol0c4a2pU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=vC6dtRBSQYDQbunMRpsDhdJeIiEmMO+qxsxOU6cEvsBwVNFvT1vcLZh33GllcE+FgBI/67AWVf9KsV0KUJxy+UEXAptRtN60IU+dDVK1gvv9jGlBslUHekJqLh7P3PhWxEI//WoBE9skpZjOdiwy2qsV1SYCPaLkemmob3SEEZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EuCgSrlr; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EuCgSrlr"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-399744f74e9so3946921f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 15:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743547623; x=1744152423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rMiriZZ58z+P+I9wSKFjX4MW14qQGjO+dBvbrym1kn0=;
        b=EuCgSrlrGvNJQwhZ20Y1eyeb5ppyxzzZOHxFsPNOQakyWdsfu0jHak/mSaDF6IuBmN
         T1y4aMYTJKa2BUSzDnM5SbXzaeIInoTYvTNj4jLe/fZQahmbt3gRM+ZTyJOzmCK9IeVE
         WQkFDN4szxLpwcLI34DmVxpD9FSO2Z1Na79MwxT8V6AJEeuBp/FNB8kF/JjncjCM6cYW
         PmEfMBUVMEH64LtLjJ/pBU10hKgEzbosH64XaBSt3D0su+WcpSa6DL635W+MaSjjmfia
         OroKpeVFXATmJHGGZPCsw+BU8KH5D+lkfjoTbNk06SNQPF+m/VKmCKPeWJpZ1bd/Sbkp
         Z38Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743547623; x=1744152423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rMiriZZ58z+P+I9wSKFjX4MW14qQGjO+dBvbrym1kn0=;
        b=FO3CNxeNEWBZYO1W7VHsfbdpvWXU8hziukDd7D/5IJJCpX9GuHbXHAT+4Suk+XDPAu
         gX6UNMXF3H6gdQEM2S8j6fXyEh1DP9a8lrSBr0+/IKil9pbvUrfwjV6BBiG1b0jaK6Zz
         /LUYIeeDdJOBojbo/cQ9+krXDJN9TAsgJzsU0TV+/+ax9K9ehwVF8GB7mTTu57JFO3Jm
         nEkEnGITK8ycrxm33c/Hz3uVbH04/BR+L9AkQTkQexlNiYhBE0trzlXRzHn/6/puCUj1
         3ITelSTH6yiYGdmZgzA/EJuZvv2RrH9AVOZV6b79VNroSMfNS+/yo5esly6gKlI5kW54
         21pg==
X-Gm-Message-State: AOJu0YzkUd9HgpwTqPhrcS9lq9ucs48Qh2/YFzua9MG2h50jzVQirjMv
	pOpKaX3OhKqLb7dNADEAWutjfvUMYehUyyLMWdND3umdR/7pHxKGikez+r1WOH8=
X-Gm-Gg: ASbGncv3v2htpVpR4TEwvq9vDLPz8M2vlG5GiUnnThm4ZQtthoTSABAr4I13U9SofqS
	jH2h8/+/xg1uOb8YQk4RrKOnmvL23OOAETmobzfkwgXlxdUIp3Z1c+QJnROeBbIT9L3ZdqhV+tF
	xxGVLxnf4JT3FvKPl2yEFY5pud1gAojH654VTDYEVDVQ1GuSiY2HvhAtLDbwlxP3aamgSNWa8pF
	QX302vXfDVm7Kyyzf2I9k4agOu7GHtXB8nF5OCniwaFMmBH5yoCxqikxEerOgDGtrYeH8VBL3Zf
	wguCdHxiIhzAcVR+rtD76JQohZg3sUVEVl40axe9sVfqA7TCPYbUHZrkVlSphrWH+GFyLsc=
X-Google-Smtp-Source: AGHT+IHXDJNo8fxkFVHDFbOXrhkQ3gaoy9OEBCnzu/hTDy4EuBz0PL7w+tWgwa6E1opkIfmN1J/58A==
X-Received: by 2002:a05:6000:381:b0:39c:1f0a:ee0 with SMTP id ffacd0b85a97d-39c1f0a0f69mr6100756f8f.2.1743547622790;
        Tue, 01 Apr 2025 15:47:02 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b7a42a3sm15488862f8f.91.2025.04.01.15.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 15:47:01 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org,
	thomas.fossati@linaro.org,
	Larisa.Grigore@nxp.com,
	ghennadi.procopciuc@nxp.com,
	krzysztof.kozlowski@linaro.org,
	S32@nxp.com
Subject: [PATCH v3 0/2] Add the System Timer Module for the NXP S32 architecture
Date: Wed,  2 Apr 2025 00:46:40 +0200
Message-ID: <20250401224644.3389181-1-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These couple of changes bring the System Timer Module - STM which is
part of the NXP S32 architecture.

The timer module has one counter and four comparators, an interrupt
line when one of the comparator matches the counter. That means the
interrupt is shared across the comparator.

The number of STM is equal to the number of core available on the
system. For the s32g2 variant, there are three Cortex-M3 and four
Cortex-A53, consequently there are seven STM modules dedicated to
those.

In addition, there is a STM variant which is read-only, so the counter
can not be set because it is tied to another STM module dedicated to
timestamp. These special STM modules are apart and will be handled
differently as they can not be used as a clockevent. They are not part
of these changes.

The choice is to have one STM instance, aka one STM description in the
device tree, which initialize a clocksource and a clockevent per
CPU. The latter is assigned to a CPU given the order of their
description. First is CPU0, second is CPU1, etc ...

Changelog:

 - v3
   - Fixed bindings, compatible description and name (Krzysztof Kozlowski)
   - Fixed bindings filename to fit the compatible (Krzysztof Kozlowski)
   - Fixed a couple of typos in the driver changelog (Ghennadi Procopciuc)
   - Enclosed macro into parenthesis (Ghennadi Procopciuc)
   - Replaced irq_of_parse_and_map() by platform_get_irq() (Ghennadi Procopciuc)
   - Fixed checkpatch --script reports
   - Removed debugfs as the driver is not considered complex enough (Arnd Bergmann)

 - v2:
   - Fixed errors reported by 'make dt_binding_check' (Rob Herring)
   - Removed unneeded '|' symbol (Rob Herring)
   - Removed 'clocks' description (Rob Herring)
   - Removed 'clock-names' because there is only one description (Rob Herring)
   - Renamed 'stm@' to 'timer@' in the DT binding example (Rob Herring)
   - Fixed dt bindings patch subject (Krzysztof Kozlowski)
   - Dropped 'OneOf' in the DT bindings (Krzysztof Kozlowski)
   - Dropped the STM instances structure
   - Use the dev_err_probe() helper (Krzysztof Kozlowski)
   - Use the dev_err_probe() helper (Krzysztof Kozlowski)
   - Use devm_clk_get_enabled() (Krzysztof Kozlowski)
   - Removed unneeded headers (Ghennadi Procopciuc)
   - Removed unused macro (Ghennadi Procopciuc)
   - Replaced 'int' by 'unsigned int' (Ghennadi Procopciuc)
   - Removed dev_set_drvdata() (Ghennadi Procopciuc)
   - Prevent disabling the entire module and set min delta (Ghennadi Procopciuc)
   - Factored out the clocksource / clockevent init routine (Ghennadi Procopciuc)
   - Use devm_request_irq() (Ghennadi Procopciuc.)
   - Use irq_dispose_mapping() for error rollbacking (Ghennadi Procopciuc)

 - v1: initial post

Daniel Lezcano (2):
  dt-bindings: timer: Add NXP System Timer Module
  clocksource/drivers/nxp-timer: Add the System Timer Module for the
    s32gx platforms

 .../bindings/timer/nxp,s32g2-stm.yaml         |  53 ++
 drivers/clocksource/Kconfig                   |   9 +
 drivers/clocksource/Makefile                  |   2 +
 drivers/clocksource/timer-nxp-stm.c           | 496 ++++++++++++++++++
 4 files changed, 560 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/nxp,s32g2-stm.yaml
 create mode 100644 drivers/clocksource/timer-nxp-stm.c

-- 
2.43.0

