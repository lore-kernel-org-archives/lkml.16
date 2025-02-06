Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D7322616E
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 09:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738834136; cv=none; b=hrfIkHbEVT+Sspg5/MI4nLsXEUB8yFz1bIr9wn1O7Sb0u1Xnltt0BsiUfeTOuNZVZk+fCF9rZEg/WDq+Gvc3crMsfBHG+AiufS0R3H1mGN4AWdfA4sPi+MihlYZoHvcqsgBOs7mQFYBF7RVMTQOlcKY0NEysAixxyd19C0i7VH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738834136; c=relaxed/simple;
	bh=mi2ya2XYtiIVhTI4rhFnHXRrlV3KLTgg8Uh2R2mlGu4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=r3dGhX+0DpE3gH1+Kf31OQmOYYZqtv5Ecrc9GcszNjEe3mVrckCbhueu0QmDjtyAOUKpFRnGw8CnOYgklqE+qgSYTUOY6MHxl+8An+gBIWgYgD8iZcTVMoq81Vimsh94cFjZRjPsHgjmjpUGsIwV/yf+v2PY0oiL5zQZ++lMjdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rvnVQIIv; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rvnVQIIv"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4361f664af5so7290555e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 01:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738834131; x=1739438931; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KqEZ1rjcv0RLDBvENRTyjBD/Kk88m0THVKYXm/2YN70=;
        b=rvnVQIIvthvRPzYrLWV7dE85H/+WPVsWnPqkguRc2wlEwb4YNeVRvePbab9CoMw3f0
         VjT1+BZY6jJlX8w5ZXuSuIF1myOuyOw4/uxoHnclwnAUHGNCIJcuXl5hgxiSEI6MiIjZ
         lN2BDvqQdYuql6XgdGjQLbhLN2bsoi8iaxlItTDugPmAISrGtzeIFTvjsP2tM/VMvsYD
         tsPf/VYhXOscwfTKPWEFVt/v1lUmPvuHIoTAOF9D/P9vy6Mm8fzVlDoAubBOd5N0ZFaz
         xrYgiLYnOSws/S4tnfpQrIW/019cdQTtHVMoru+lSUtPj4wYBjL4G8oCGtdDpFrJFnUC
         83vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738834131; x=1739438931;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KqEZ1rjcv0RLDBvENRTyjBD/Kk88m0THVKYXm/2YN70=;
        b=rtQf0KsySoAR6P8Xk4minMJr5U3Tc/OLA0dOMXO2b+xgnjNFq8saxs4o7c/rMPjHG7
         WI8xu5Voch8TNr7z6zIYiCWBc7SLXhJBzJLbhJgRFCLQOJrLhcq1RHIgMpw341tULblF
         UfJcd6TtjG8qWxQpEjCXtQrVZginlIN6E9WGUQj9XZa1uUrnyF2HuZ5Ew+y+Z+1LeVh4
         lf0tK2zx4wNB9vwztL5pGG3VtOJNZS/rVx0u9eTiLrzZFyM+p9OU+nV+kh6mHpH+udcj
         O8pdUTy0lE+UEZcL4Zr/VlGsA9N5GN2mqawGQT+xWXghPd4Pqe1mDUcgtgJ/xIhpzzcr
         UZjA==
X-Forwarded-Encrypted: i=1; AJvYcCVm9bxbAD+za92CofMTLD37LfaIUG3f4YRvoegFHBvwHno+pqoeq9fCcWTxIvKVKXb7P6dl9TxDNcJa1CM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxYHU2TBQnCugXYjswXvWB8YhlbKX482Iaj+izdWtX2TOZmAqy
	h/U0qANqWq6rcO9YS3QTYugrc3fj/QOkrjPR8ZA6oacU/sXNlODQyhP27uGXNCV+pFkqB5m6KxR
	b
X-Gm-Gg: ASbGncs2r6ClYP0DT41nvDDSVD15WiDpiBzGxRZoQQfqw52PXUyBf15vUyQKO5MFefg
	PXbp/MWJJnfKmOHJWfPFZ5JAI61pLWA1gqrIkjSsqAgjx/Fhr9AWnC+n2m87lE0Mj3Y2Hr21/xz
	/UMoxqbQYCG6n5XiHqs4kLZCgIvHHcaE9xMBRk98QfX6SlN5TrM5HkFGWfhcTWdkRsysbjIDZVv
	lByBwQtANMcS43AVv4x117KVToqK3isSwu1yjsp8UOYd+njoKUMOlO4RgRWQMMXGMvKNIXnMEhi
	1KYlUYMNZ3jNTgk=
X-Google-Smtp-Source: AGHT+IGggYqnQKDjMVw4ZNTIBvPNVlN4qrl7M7HonVQgN8AlUXLRDXU9noAQayyhvdbiEcFOINJJcA==
X-Received: by 2002:a05:600c:3d9b:b0:436:6460:e680 with SMTP id 5b1f17b1804b1-4390d43e44emr59550485e9.16.1738834131113;
        Thu, 06 Feb 2025 01:28:51 -0800 (PST)
Received: from [127.0.1.1] ([86.123.96.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dcae80dsm12827595e9.22.2025.02.06.01.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 01:28:50 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v6 0/2] usb: typec: Add new driver for Parade PS8830 Type-C
 Retimer
Date: Thu, 06 Feb 2025 11:28:26 +0200
Message-Id: <20250206-x1e80100-ps8830-v6-0-60b1e49cfa8d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALqApGcC/23QS2oDMQwG4KsEr+siydaMJ6veI3Th8SMxlJlgF
 5MQ5u51UmhT3OUv0KfHTZSQUyhiv7uJHGoqaV1aGF52wp3scgwy+ZYFAWlgQnnBYAAB5LkYo0B
 6ds7ZiWfmUbSucw4xXR7i4b3lUyqfa74+BlS8V78tQ1NnVZQgZ+f0OMGMXvPbR1psXl/XfBR3r
 NIP0Np0D1AD2HkDYJxxGjpAPQFEPaAaMJh2T1SMYZo6QP8CCP07qm5AhDgympkGFTqAnwD8ZwN
 ugLbeKBu1x4H+ANu2fQGvJRw7swEAAA==
X-Change-ID: 20240521-x1e80100-ps8830-d5ccca95b557
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Sibi Sankar <quic_sibis@quicinc.com>, Johan Hovold <johan@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Trilok Soni <quic_tsoni@quicinc.com>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5855; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=mi2ya2XYtiIVhTI4rhFnHXRrlV3KLTgg8Uh2R2mlGu4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnpIDGH0+B7/WGdiHt4qe7EKmH/LHUmWFiCG+aq
 ecNUZVjX0iJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ6SAxgAKCRAbX0TJAJUV
 Vs/JEADEBiNsCOOdOEXEZEygJGxDuQclLNzMDghGJfa+p/o62KyZbBuyfj5p3BM2bxyKHAzLmu+
 sgIssw8Qkn0JIj5TbLJtX1XAt30NBXpHbfu8/gn6ILaxCu8uJVc3wmrDrd7va56ttybYR969ieE
 onaNgR4+16pSFhVWqFwWGRlnzZV7u2mW2DxYeAm8PgUwGmBhO+FVzHgGfbP2CCQclKCxvpvI64R
 zhhESaDGfL0GU7h8pDDKVR8sG4Z4jGAtUJ7726NPLsqUlTdjrCqlhVeHaazkhu9qXAdDY11rRCW
 /chuOwH2ZHGwttc1WN/UbmZg00DDM1qrpmHAje9UoWowUx3xSZJsQzQVbcjIPtUSPH4ZgN5c2DS
 gAszTYdU4LIstk7D4lJP/oJWroGqddPtiDyeoIcEEMFRHfDUE3oCWp/flEIhe/ADmoS4qOUtGA4
 EJWlJYafkssGJSzVOZvAWQhaBtdmlivb+GG51Rub6lGqmjXG38ulrQ52mVYOayYAW8Y3UqD1obV
 8sFzuEITW+Z/oocf+V+yci1wcyhh7r125vBb1qnmKkQG0xWNlFWE15B/7+Iyqv251tKeFas2GO/
 8B/jAvLNkOLMpzjdZub65wC0GNFheh/94p4MkzhBmtlNxgMz4vVde8kaaC5lVSz54/5/rc+SmwC
 SyQraupAn0E9PrQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The Parade PS8830 is a Type-C multi-protocol retimer that is controlled
via I2C. It provides altmode and orientation handling and usually sits
between the Type-C port and the PHY.

It is currently used alongside Qualcomm Snapdragon X Elite SoCs on quite
a few laptops already.

This new driver adds support for the following 3 modes:
 - DP 4lanes (pin assignments C and E)
 - DP 2lanes + USB3 (pin assignment D)
 - USB3

This retimer is a LTTPR (Link-Training Tunable PHY Repeater) which means
it can support link training from source to itself. This means that the
DP driver needs to be aware of the repeater presence and to handle
the link training accordingly. This is currently missing from msm dp
driver, but there is already a patchset [1] on the list that adds it.

The support for LTTPR in drm/msm/dp is here (v5):
https://lore.kernel.org/all/20250203-drm-dp-msm-add-lttpr-transparent-mode-set-v5-4-c865d0e56d6e@linaro.org/

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v6:
- Dropped the DT patches as they should not be merged until the LTTPR
  and the fixes in ucsi and pmic glink altmode are also merged,
  otherwise it would render the external DP and the resume from
  system suspend broken.
- Replaced dev_err_probe with dev_err for typec switch and retimer
  register failure handling, like Johan suggested.
- Fixed the gpio orientation for when the retimer is already
  initialized.
- Dropped the useless "No SVID" comment in ps883x_retimer_set()
- Added definition of all ports (including port@2) in dt-bindings
  schema.
- Link to v5: https://lore.kernel.org/r/20241112-x1e80100-ps8830-v5-0-4ad83af4d162@linaro.org

Changes in v5:
- Renamed binding schema to be the same as the compatible.
- Dropped the ps8830,boot-on from the schema.
- Added register offsets and bits names to the driver, like Konrad
  suggested.
- Reordered the vregs and clocks enabling, as per Johan's request.
- Used the dev_err_probe for regmap init failure and dropped the
  multiple regulator disable calls, replacing it with single call to
  helper, as Christophe suggested. Also replaced dev_err with
  dev_err_probe on typec_switch_register and typec_mux_register failure.
- Added some new pinctrl specific properties to all pmic provided
  gpios that control retimer vregs.
- Re-ordered alphabetically the retimers default state pinconfs.
- Added the T14s patches with same exact support, as per Johan's
  request.
- Link to v4: https://lore.kernel.org/r/20241101-x1e80100-ps8830-v4-0-f0f7518b263e@linaro.org

Changes in v4:
- Renamed the driver and bindings schema to ps883x to allow future
  support for the PS8833.
- Dropped the dedicated DT property for keeping the retimers from
  resetting on probe, and replaced that with a read to figure out
  if it has been already configured or not. This involves leaving the
  reset gpio as-is on probe if the retimer has been already configured.
- Replaced the fwnode_typec_switch_get() call with typec_switch_get()
- Replaced the fwnode_typec_mux_get() call with typec_mux_get()
- Dropped the clock name, as there is only one clock. As per Bjorn's
  suggestion.
- Dropped regcache as it seems it is not needed.
- Re-worded all commit messages to explain better the problem and the
  proposed changes.
- Link to v3: https://lore.kernel.org/r/20241022-x1e80100-ps8830-v3-0-68a95f351e99@linaro.org

Changes in v3:
- Reworked the schema binding by using the usb/usb-switch.yaml defined
  port graph and properties. Addressed all comments from Johan and
  Dmitry.
- Dropped the manual caching of the config values on regmap write in the
  driver.
- Reordered the DP pin assignment states within the switch clause, as
  Dmitry suggested.
- Added SVID check to not allow any altmode other than DP.
- Added DT patches (retimer for USB orientation handling and DP
  enablement). Did this in order to offer a full picture of how it all
  fits together.
- Split the DP enablement in DT in a separate patchset so the USB
  handling can be merged separately. 
- Added ps8830,boot-on to let the driver know it is supposed to skip
  resetting the retimer on driver probe, as the bootloader might already
  let it in a pre-configured state.
- Marked all retimer voltage regulators as boot-on since we want to
  maintain the state for coldplug orientation.
- Added pinconf for all retimer0 gpios.
- Didn't pick up Konrad's T-b tags and Krzysztof's R-b tag as the rework
  is quite extensive. Especially because of the ps8830,boot-on and what
  it does.
- Link to v2: https://lore.kernel.org/r/20241004-x1e80100-ps8830-v2-0-5cd8008c8c40@linaro.org

Changes in v2:
- Addressed all comments from Johan and Konrad.
- Reworked the handling of the vregs so it would be more cleaner.
  Dropped the usage of bulk regulators API and handled them separately.
  Also discribed all regulators according to data sheet.
- Added all delays according to data sheet.
- Fixed coldplug (on boot) orientation detection.
- Didn't pick Krzysztof's R-b tag because the bindings changed w.r.t
  supplies.
- Link to v1: https://lore.kernel.org/r/20240829-x1e80100-ps8830-v1-0-bcc4790b1d45@linaro.org

---
Abel Vesa (2):
      dt-bindings: usb: Add Parade PS8830 Type-C retimer bindings
      usb: typec: Add support for Parade PS8830 Type-C Retimer

 .../devicetree/bindings/usb/parade,ps8830.yaml     | 140 +++++++
 drivers/usb/typec/mux/Kconfig                      |  10 +
 drivers/usb/typec/mux/Makefile                     |   1 +
 drivers/usb/typec/mux/ps883x.c                     | 437 +++++++++++++++++++++
 4 files changed, 588 insertions(+)
---
base-commit: 00f3246adeeacbda0bd0b303604e46eb59c32e6e
change-id: 20240521-x1e80100-ps8830-d5ccca95b557

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

