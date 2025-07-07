Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDEB292B2E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 09:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751882225; cv=none; b=MnZ6V1+FGw2BPrqH8Ium2MRUqpmqmiI+9kbwpBzBAiMB5t7aImL3Y60DSDlQrCGk8theN9MHBxYUxsekph4oeYM63t4NbfgyrBFsnopCotyq6qPfSVPNRu5QmeZcWoYwpqpYawoNeFcacULzmHK08iheCO+bkoIlgpCymoOwZXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751882225; c=relaxed/simple;
	bh=58ZfGXq5HliUApxwu0tCwXNooa/9w1FGf0esQaJhPOU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=t/zdD6rAP/qQ2fx8hh984F+y6qUhrkClzZ+DHCzbApVrACxxKlxTnYrfykh+WZ8wFW62eEnrZgTM+8M6FDFzvgOIHym5Mi4OzIKfR17y3WR67Oky8tMFPZkCAvHYQzoWGcYGqsBJjl2rq0CyQ9Pa4XHi2wuanYHltToRJuqwbas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=CkzlkaDS; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="CkzlkaDS"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-607cc1a2bd8so4687375a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 02:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751882222; x=1752487022; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ODEVf5zXYu0yH/oCoUjJ1b0O3E3Qx4wf8X/BiLQdvvE=;
        b=CkzlkaDSHWgFPkzUuWbqSWxfY28RE+ODAcJInkuPJZo2qybcc0SXwHZ2NwzlxSNFcY
         uC+IoBh88Ke2MooK3HDhp+X/1ueS5ttavd7CaGax2ma+6pB3bWNMg9xrk0vlLFym0lam
         gZQJfe5kS9dBqabcvsO1UrUwxJcV5DSmLBrQOhHtL7l5mqZIOC5y/JEQEISzR/B72m0+
         tyI6aTRKkZ4XRmeuaVVOpzDJzzb0bzywjYABOm66RtlJo5ivlXyd1CH9IOL9Uqy+cD7Y
         1McIoHK7y17X6d0SGtOSLJ3Sdk1fiSlUYDliVdCQjq6U4GLuy3yMB/qx+DJvNBoSKgQE
         FDeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751882222; x=1752487022;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ODEVf5zXYu0yH/oCoUjJ1b0O3E3Qx4wf8X/BiLQdvvE=;
        b=mRlzrcPG4slEPcBxo/H33rrzX4qOb8sGJo9IYRGeIZBuJjcL5WGcEzTdiQfIL9TYXO
         ad9IsIC0sKUgL3qY7y5vc6SGHziDYgSlYex8VHVxI9LbXPFcPwISncwNAvewQ/TvFRJy
         xjEa+qVpWJ2t+M/Gr84tuBuKVvAyERGsETeJYbElI2zvNi4UsV37obxzD2EyWslyMCmq
         M3dovvR3pisYrRJpzc8qSiENXuKX9lqIckO8sACfNiVb9H73zx6/xkWZF9spTbQ91GEX
         89ke0YGGCOUUD1eTyyBS2cB7UyHmOnZjNUrzlaLKe9pjzlF1XyT/pD2SpQ4zb3EB1n4R
         L57Q==
X-Forwarded-Encrypted: i=1; AJvYcCVbUVx15MHQf0XN/t5hmiRfRj6aZ0rTaKiS5z48vsVWn7R6TWnPD8DkpL2BF9uAeA/AdI9yjWOqFjrt4xQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvIbTSIrWMuv90OwV5yXelbEtmxGcdIrUNC6tCaZqKqhSEDUNS
	TZaBgjgl0aP86vbAQD2l8fAypiIkQ+DuWfb/NwpAYOd71rVIs6+zSPp6ups580UN0pE=
X-Gm-Gg: ASbGncteb/wptpx/T2NncMlpoZyvbdB8yJbB8NevL2q/YH+vmzZyMUH/ZRn2ioAn3SM
	VpckB4i2LerPIFpyJMN5tRiYLGNPIUvwnAO0uzUenJQKyIY2DPIBs2cQlP2tUC2LicwDQv/clna
	bi4HSAG3bPvCB/+ioo/e9F51R0ST0AjrJGq/3g26qIuA89DVhsdzHwJ+/fW+m6oLt9gJz9vBFYq
	xd3lwlNbeOuiPzVuH1xr0iRrzOatM2jNRzg8OHkAUczKC2my3FwZRGZRqjhFj5K0yjBXgHAO+9g
	M0NEfH5CjjFdkZiSACFtobVtJcP3tIVEh+qG7VOcEvcvEAaUfr8tm8D5PlHASTymJHMj7e6H4b4
	VcKDJEGDjIxgRYprTBn4fPsi1yd/f+adxKpSVuvd4c0Y=
X-Google-Smtp-Source: AGHT+IGZ95rMuA2Wn1IQaIyHUgRgWlbpUIuXzYBujf+9D//LAmIETPS+IQZyFCmoipIJ+gohRL4NQg==
X-Received: by 2002:a05:6402:d0d:b0:60c:4a96:423a with SMTP id 4fb4d7f45d1cf-60fd6d504e4mr9543330a12.18.1751882222225;
        Mon, 07 Jul 2025 02:57:02 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fca6641fbsm5235815a12.3.2025.07.07.02.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 02:57:01 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/4] Add RPMh and TCSR clock support for Milos (SM7635)
Date: Mon, 07 Jul 2025 11:56:36 +0200
Message-Id: <20250707-sm7635-clocks-misc-v2-0-b49f19055768@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANWZa2gC/22NQQ6CMBBFr0Jm7ZjSUhRX3sOwqGUqE4WSjiEaw
 t2tJO5cvpf89xcQSkwCp2KBRDMLxzGD3hXgezfeCLnLDFppq2qtUIZDbSz6R/R3wYHFowrGNq4
 7GkUO8nBKFPi1RS9t5p7lGdN7+5jLr/3l7L/cXKLCygZydWU701zPwXGa+jjS3scB2nVdP8y4T
 yq4AAAA
X-Change-ID: 20250620-sm7635-clocks-misc-0f359ad830ea
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751882221; l=1169;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=58ZfGXq5HliUApxwu0tCwXNooa/9w1FGf0esQaJhPOU=;
 b=+qWmgG+A7sZEea6VSnoAqFep+mSdABlWvwutydJ/nj2l3sV3wTqA8VZ4NK8OmD1XSu47kkMKg
 b14o+/g1z3cAQoJJvs75BQVX+Exk4IdHgAOUqAYt2d15JahfmKekkk8
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add support in the RPMh and TCSR clock drivers for the Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Rebrand SM7635 to Milos as requested: https://lore.kernel.org/linux-arm-msm/aGMI1Zv6D+K+vWZL@hu-bjorande-lv.qualcomm.com/
- Pick up tags from Konrad
- Link to v1: https://lore.kernel.org/r/20250625-sm7635-clocks-misc-v1-0-45fea645d39b@fairphone.com

---
Luca Weiss (4):
      dt-bindings: clock: qcom: Document the Milos RPMH Clock Controller
      clk: qcom: rpmh: Add support for RPMH clocks on Milos
      dt-bindings: clock: qcom: document the Milos TCSR Clock Controller
      clk: qcom: tcsrcc-sm8650: Add support for Milos SoC

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

