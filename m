Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF2686340
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 01:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751592023; cv=none; b=rcvsx/Zr3P6ahMgh4n0vglY9uAiFVJa3BaesRdJpSCt01nAmDV+l/pSFRJ4rk6paYVxkly6ht8W+wyS0aRkfMP1rcIHtFXOsNCCoBndt2uzuLONV61Q3njcYDKJZ34hCT+871af2MtEEAylX+LcGYWXYLzU1ZbssHGUHI8SGSw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751592023; c=relaxed/simple;
	bh=sn3kEcEnJGdq+CGH93mNVsRhQPGquWnTXTjgFVpFIlc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uvwPRc6dslsyVfZRlBdqm1/zmphKostUu8gZ/BuxKAGomxZR358LcIag6eCPz97Dn4U/t5pwcVG5/2odGV3koPF5dK1l7EfCMThyXde4HkElETmz88wxg+zdQWPESKs33ilLjsGnAC7MWBvlji9UA/bq8EmT2uuYayU8kTK36F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TPLIGQUi; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TPLIGQUi"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-610d86b3da9so154336eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 18:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751592016; x=1752196816; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DC/cBZO4f5h7yIL6Ec05XXIZpY7LlAOQumaUsmGIiWc=;
        b=TPLIGQUi0mYxmcbN2hVndzuw/wULfXQtebU6/CJYNGL1+Pv2+DKwBKeguiPgkdDo38
         o8aseif5IprBLUrxLcijxl7Qv6uCvH6w0QJi8KLbcXw6WBfyBwxbeYMfKSdIcmHCZ6Pt
         5A3RRkIgHBd+6CYwHUhy+iIYKO5xJtht3l5lycgrCA15vDfZiyrdOMvXITH27U3c4SFm
         kB/kw06scTNhmx0bacep+NhiaBpK92cpMYk6vaEt7e0iojLmFkmhLghw/3B82Ppx9Kcc
         PFRR0BEkzEUuBy6R9Q5PSW1K46s4FjZ6jF5ALFjhI83OHd8fSS/ctExZAVIC7d5lGaxK
         0Wnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751592016; x=1752196816;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DC/cBZO4f5h7yIL6Ec05XXIZpY7LlAOQumaUsmGIiWc=;
        b=U7q5uFgk0+0OZqs8pNUQO6nv6gznZGV+Kc4evjyu7RtBcKncTbE0UJj0XjRBvp1ojH
         537u+vnQdsAekE34bNkREr0rahxt3Yl8nl4CksJSWD+KC5mMbBeI4PC58kpMpO5Oxj5v
         /Y5/3NLYXfZZJ5qRU9SKm9EO3IBbZZrCBxJ3hKK7LJQc3fTAceCcOSCG1ebOL4eqYa1b
         FxysbElVvApcYATajOKrnmHAJIcko0yogF/0Qvc0ZPQzu0VLpr1vxVQrCyVHFn7gmxYj
         ba8cpS6R7NGIFvlDl7fT4opJVCNF2sm4Aj27aY5eEDDSc+GYVml9vRN4q6A6BYLd45OO
         x7eQ==
X-Forwarded-Encrypted: i=1; AJvYcCWz2sFr3SHYxGw7tNaTSp+vYcup3Q9GX5sUDI0InFc8mK9HRmBbwCwxl1DYsKrgLRHVKoxaOTuiFH3NbUc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJDSItWBl5siZABzXP3d9f6NRzYJJaKhw/m10LTdf7A2U1Tj5i
	JplHZenLHwPBtrakHwVgxAMm0IGYRJtTkPv/5E8P0Tz+fRUe23faFrRxQ7mRGwjt8PKub86J1I8
	xKD45T68=
X-Gm-Gg: ASbGnctyNJB47ggulC8ykeUP/vkgNd3lNM98vDJogDZex87TINd8ce67NONPMC2fg2r
	9SJtjyG6eg/anQRHiRiOvK8XFvqhHpMt79BoZwBBiFaernuTClBBkAxdUdh8yM/ztcwBJnir3t9
	I3X/bIPgcXpEx5dfWDldtx3LEJ7Rgxw3iUY/B7WEciuJVgj5CPySXhMbK0xHgB0q2jiGq2XcbYz
	wnzxLSRmH8HdlJyip3Rv9sVL/m1MgSAYYH9kKvR7f4GSqFivRNswnKBD8CNnaA0vkwBE8DofA0C
	XA9xkX+MgufxPJ3gTvbBfMlDbi8ZjlyGoZrh8GZ1K1ej95apWpUz3b5mw8d/5gMwN6b94Q==
X-Google-Smtp-Source: AGHT+IE2gfIyrgT2GmZQ15R5wrbiEzA2Rw3RJESsngVF1fw51ISYnu4DuG+UdMI6ohqlrXf2k5q/SA==
X-Received: by 2002:a05:6820:2901:b0:610:fc12:cbb4 with SMTP id 006d021491bc7-6138ffbca71mr549586eaf.1.1751592015623;
        Thu, 03 Jul 2025 18:20:15 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1ed4:f8f7:2a8d:77d5])
        by smtp.gmail.com with UTF8SMTPSA id 006d021491bc7-6138e4be31csm164217eaf.9.2025.07.03.18.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 18:20:14 -0700 (PDT)
Date: Thu, 3 Jul 2025 20:20:11 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chester Lin <chester62515@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	imx@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, Matthias Brugger <mbrugger@suse.com>,
	NXP S32 Linux Team <s32@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Peter Chen <peter.chen@kernel.org>, Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Xu Yang <xu.yang_2@nxp.com>,
	linaro-s32@linaro.org, Larisa Grigore <larisa.grigore@nxp.com>,
	Ionut Vicovan <Ionut.Vicovan@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: [PATCH v3 0/4] usb: chipidea: Add support for s32g2 and s32g3
Message-ID: <5c3e57db-0642-4e8a-a194-f204da5fd2e0@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patchset adds support for the s32g2 and s32g3 chips.

Changes since v2:
* Add the dts changes (patch 4)
* Fix Signed-off-by lines
* Fix the device tree spec
* Provide the complete errata information in the commit message
  and a link.

Changes since v1:
* Put the device tree lines in alphabetical order.
* Add imx@lists.linux.dev to the CC list.
* Use power_lost_check() instead of creating a new REINIT_DURING_RESUME
  flag.
* Change the Copyright date.
* Leave the .compatible = "nxp,s32g3-usb" out of the ci_hdrc_imx.c
  driver because people can just specify both in the devicetree
  since they are compatible.

Dan Carpenter (1):
  arm64: dts: s32g: Add USB device tree information for s32g2/s32g3

Ghennadi Procopciuc (3):
  dt-bindings: usb: Add compatible strings for s32g2/s32g3
  usb: chipidea: s32g: Add usb support for s32g2
  usb: chipidea: s32g: Add usb support for s32g3

 .../devicetree/bindings/usb/ci-hdrc-usb2.yaml |  5 ++
 .../devicetree/bindings/usb/fsl,usbmisc.yaml  |  2 +
 arch/arm64/boot/dts/freescale/s32g2.dtsi      | 23 +++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi      | 23 +++++
 drivers/usb/chipidea/ci_hdrc_imx.c            |  6 ++
 drivers/usb/chipidea/usbmisc_imx.c            | 88 +++++++++++++++++++
 6 files changed, 147 insertions(+)

-- 
2.47.2

