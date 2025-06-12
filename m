Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5732029B799
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 18:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749754251; cv=none; b=db0jGq6hwOpeN8yww8SVpdmu0WgaumvCwE4jq7NLlg1OxHgFrDpqHEPa+mzP/uypKQBpJo+x7RWTix4JT+TgmXqtfeQtHGT1kXLPyPcE+dzgNuaHMoDbk1CBGyEyHD4IviREEfctXR8q6BV6XgzgsfWkrpQ/GCYKAb64JQnyjbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749754251; c=relaxed/simple;
	bh=m7RmatOFZf37KbJP7V43/R/yV8MVhhr9v6tiEmktbF4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WeZbQLlbtmMQ88//h0FcQMSBHNJQ6qbemmZLd3xV2onzZ+PQ89vGWVk84tZ+AD07HPnspMMxBJb/x3kAv8GOI609LOdBRVYbp7txXCEavCuB3xtoN3VSF6Huo6+pCocefOSh7onYwo7TvEJ8Dl4PsPLrmgLCX3ANNTC1WbGCYP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B4Q67bzI; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B4Q67bzI"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-450cb2ddd46so7479235e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 11:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749754248; x=1750359048; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8tbSeZMHtNCZXJWreRbrqTxYE7/dISAs2k09LBmNzrM=;
        b=B4Q67bzIJU4coZteL6LKnXHV9bWdUCjT9+viKzPnlDFVfoZG3z2picHwko74ESlp0M
         e8jZD0/SdoEzZjdNNhHiVnjK49nizYWZtpC9ttYthcdC2Iut4W2M8ADo5pXabyhq1jXZ
         h2MCX53seXrwwSmy0vziisZ/4s6Edsmm34DoWbkZtt2bxfLLiBRyLTE9U53AP4mngb6i
         O+c/SrBgQdsNevCsR1OIlSL54c7JvyJu9c0z5o3e3GV+npQtIbumN3OBe0gTLumyEZ3y
         8/R9kbSIzS+tgUWVHUd+BXMtR/K/SQnA5m22JwXjX5D1JqziA+3jHIdJa3SS/lZyPtqA
         WefA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749754248; x=1750359048;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8tbSeZMHtNCZXJWreRbrqTxYE7/dISAs2k09LBmNzrM=;
        b=vDGxgqy4NRk2wmkuUB+B87F9vm1PLTKq/LVBEKcNDnAT6/g344yIRf+ytBoNOVttCW
         eEdUrLVmkvHj2pHKnznVg5giVI4K/dWi2irtAGRzunlS4bSO5Vm1ZjyDO2DKJLVZ8Dkg
         jYS2CSQEwMs7CjlLOVGSFCllCbIW5zHcKYkQSEPEnjn2xzZDJ9isK8kl1QZ5cgU2XU26
         kkmFBjRJhxfVU+4k/8VDBT+w0luscM3iUIxFd6dPtMyDr8sbBChV72rgsecbSKfEilig
         efgNp3YfBL0e15Zh9S9AiT1DRRa7wvv7kubX+uUueIiK5hR2CAzehbX5A1a1U1TXJNEK
         SMxg==
X-Forwarded-Encrypted: i=1; AJvYcCVEYmZxXglfhHMQ8dsrWEbEksvbM9FLs1ur6Mr9VVLUHo0FWK9nNUPp9Wdlpqr3/LSbdP+JJKwaMLaA1lc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzqCdvFZ3sgE4/sL+CjBBZIeRSqVivb3Hr3Eq2vrHlZhvb8RoY
	knaHkWsstRM2Vwa8nwcXQIFSTErOwnpeO52ve0FCSa1N4kMC6iqCixzD4odklkrHfu8=
X-Gm-Gg: ASbGncsPU9XX4/ZwBIcPpvv59KySU5KrUsDCMQqekcDfNEW7Z5NIv9XAVeUrLVgKCkw
	ieiubLN6QSg+etsf2QDVshrTIBZA7g6pb//vvQxmYTLl6EpAFstjlqB9PUActx93gU4gfjtOzPu
	/TEhfExk7K5WWgQ/0DXV2JNm2GFunNWex1mAjleULsh3P05K5AyoE4/LxH5hNbwJrkbzSMmUP89
	MyG/ctbovov216DFFhVObwxi77tZ8g3kAjhwHuj/kFjXPosiNdGMhXgTgKqGaInQVn0iGEN1z59
	4BBWEahFT2nhMcgb6i6tRQ/3ObRjuy5BHVTnzi8pDyDsxG/1yjgHwurYBkmgROhjm1c=
X-Google-Smtp-Source: AGHT+IFFK9l+yfY1kr4NnMO37BPPvCq/YrWFhg/vLvoWZsXd9u+zkfYJb5d1B0c7bwKtakecyoBgfg==
X-Received: by 2002:a05:600c:1d22:b0:43d:5ec:b2f4 with SMTP id 5b1f17b1804b1-45334b0246emr2257445e9.10.1749754247699;
        Thu, 12 Jun 2025 11:50:47 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4532e253f64sm28578855e9.27.2025.06.12.11.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 11:50:47 -0700 (PDT)
Date: Thu, 12 Jun 2025 21:50:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Peter Chen <peter.chen@kernel.org>, Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Xu Yang <xu.yang_2@nxp.com>,
	s32@nxp.com, linaro-s32@linaro.org,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Ionut Vicovan <Ionut.Vicovan@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: [PATCH 0/3 v2] usb: chipidea: Add support for s32g2 and s32g3
Message-ID: <cover.1749747898.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patchset adds support for the s32g2 and s32g3 chips.

The changes since v1:
* Put the device tree lines in alphabetical order.
* Add imx@lists.linux.dev to the CC list.
* Use power_lost_check() instead of creating a new REINIT_DURING_RESUME
  flag.
* Change the Copyright date.
* Leave the .compatible = "nxp,s32g3-usb" out of the ci_hdrc_imx.c
  driver because people can just specify both in the devicetree
  since they are compatible.

Ghennadi Procopciuc (3):
  dt-bindings: usb: Add compatible strings for s32g2/s32g3
  usb: chipidea: s32g: Add usb support for s32g2
  usb: chipidea: s32g: Add usb support for s32g3

 .../devicetree/bindings/usb/ci-hdrc-usb2.yaml |  2 +
 .../devicetree/bindings/usb/fsl,usbmisc.yaml  |  2 +
 drivers/usb/chipidea/ci_hdrc_imx.c            |  6 ++
 drivers/usb/chipidea/usbmisc_imx.c            | 89 +++++++++++++++++++
 4 files changed, 99 insertions(+)

-- 
2.47.2

