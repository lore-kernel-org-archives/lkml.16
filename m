Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7311C861D
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 07:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746431569; cv=none; b=YxnwWR5Pu/7soM8UNPHazKQJ6o9mHKewZx+CcD1BUIGu4TKKL++ExFzg/9UGB9IvHzl8eIx/7K+SKOmKqZtsLEEey7xi+lYtl1sQ4hnzuIRINGVGlRpO6H6rnET30ri4hV16Y1EHw0RQ7CwA2dnAxDpa6+I5bgBDtcC5pVfE3RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746431569; c=relaxed/simple;
	bh=ZjSUP8jmlrb5+uP1brciCf5mZMhZ6YlpFsc/7NT/y40=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gDiqJltEqTW1536q/L9WR5JuTO/PaxJIXDJTKSUjaDUmR0zSOvNW2Qq1oNDqBM/CVLl6hchefT4a51MFjk2bAKKXxHuZvmVHKm2asofSlnxyrFJ+/Z19yJA2OYBqEtKrYtdrKhZOLzdpnjE0xiA6/GCrEzd+lJYQgVOYTxp3ytU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fKbbQnjl; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fKbbQnjl"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ace98258d4dso569628766b.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 00:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746431566; x=1747036366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aMDm0qfjOuYWTzr0Xo2QLnRNDzdiZPn1MuFHomJVvBY=;
        b=fKbbQnjlL/9lgskLhQ6P3tFgyTD8sCIVP94XAXZcyPkGNRCx0nuPf/HERTgo+Isnsn
         kL5DxwRKFFzeH/r+/yJFLIA9h96kMvJ52P/wppzK7VCSgNM00LIGIu1jJyFhgkLLiSDF
         sHcScJWM40IgsT0HDSBZXXYh8WtaDzqaCJX1uqVlrVKuq7E9SP0zTYUiJluKfVX3ypV+
         4W7dGZaTvkp2TXfXvZ2EXD7An9ycCj5l4yX0maxC6mL4r5AFNBVUivOV0nD8VWwY7IU8
         y/tTtMl5awCXF0rzHqnrklcGPOArkotqS0UmwwWAmUH2CrYMa4UvD5iKDeHwfPsIFx7Q
         qRsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746431566; x=1747036366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aMDm0qfjOuYWTzr0Xo2QLnRNDzdiZPn1MuFHomJVvBY=;
        b=XRY0Usyan/fR2BY4ARJaEsctsOQ68Otx/rAvBbVYG7OIflm1XvQerU/dcAifIKKaf+
         GrTmG6O6rynY9tueWwikKNg7GN+ZeGP79JFiPloqPzb0nAKZKVrTAsxw0ug585ro8hOy
         nSHlxR6SCvgZLDL1+lxC1kWoeFJ2X8SGPCzR/loSxjZ7/w71aDW3Qu/hT/CtQE84RhXH
         gPz8SUCR6Fnt/VY9Ci84Wg06jTDezNKCpkvAFImFOGWRwTlyIuNILNZzyEPFNaBn23Ky
         u3MYinfJh9B4iWzN566MzxBfHESgRdSrt4YwXJlizByHSkGRfRFMlEvNIKNLU8JI+Axb
         REBA==
X-Gm-Message-State: AOJu0Yzrs3TgGoiu2ghOBtk/PyiwMT5e2Gyfts1Czqg8HKodY/hfo/wm
	X4r+y9owjlyTqXHTPolFLTl3b9IodBPe+6H1TPcmjvoSsLbguYIpCx/j466COlzBfHNni5eBTs7
	Z
X-Gm-Gg: ASbGncvvUmd28/BrUbGZ84duiixdG8Wvp3m7qDkKSOZKnGoJGyyNG9VM+b5zxGiGTos
	3jK/UW1RDlZ9SIsEt80x8Jq+mP3JfICsR8wVLZsaUacT66ROo8V8kn5iX/KNu7rX8LR7e8/MXLc
	ihUDFWJnfZ0mFUrLc6PGu04xzZL7DwdKJjhgWyWedQyWMbCtoJAZJPKZBZKSTobJYo6l+JRYxt8
	aCmFRGYIqpmMRWHfQHmQ1mIpn0H6WWCeolyyDB0Wmu8t6p4qNDpCtDfAzy62JGBXp6TpYDpWreZ
	iZBDkJD/3nhzLgzHS7UcPpmODA7DffNzJNgH2Hm69krJLbmEbw==
X-Google-Smtp-Source: AGHT+IFKn1amEuiEsrKWv/SJZ/kZTwDtb/a8ekD/9m9gKUzOyHca4mZtzNEFzhzpC/nVZriKwygVQQ==
X-Received: by 2002:a17:906:c08e:b0:aca:db46:f9a6 with SMTP id a640c23a62f3a-ad190858be1mr564437066b.59.1746431565639;
        Mon, 05 May 2025 00:52:45 -0700 (PDT)
Received: from hackbox.lan ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189540d94sm446544666b.182.2025.05.05.00.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 00:52:44 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
To: linux-kernel@vger.kernel.org,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: (subset) [PATCH v12 00/19] Support spread spectrum clocking for i.MX8M PLLs
Date: Mon,  5 May 2025 10:52:35 +0300
Message-Id: <174643143452.2950397.16722215892279685541.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 24 Apr 2025 08:21:30 +0200, Dario Binacchi wrote:
> This version keeps the version v9 patches that can be merged and
> removes the patches that will need to be modified in case Peng's
> PR https://github.com/devicetree-org/dt-schema/pull/154 is accepted.
> The idea is to speed up the merging of the patches in the series
> that have already been reviewed and are not dependent on the
> introduction of the assigned-clocks-sscs property, and postpone
> the patches for spread spectrum to a future series once it becomes
> clear what needs to be done.
> 
> [...]

Applied, thanks!

[01/19] dt-bindings: clock: imx8mm: add VIDEO_PLL clocks
        commit: 20e5d201b5d8f830e702d7d183f6b1b246b78d8a
[02/19] clk: imx8mm: rename video_pll1 to video_pll
        commit: 26a33196b5b68cf199b6c4283a254aa92d2aaf4b
[03/19] dt-bindings: clock: imx8mp: add VIDEO_PLL clocks
        commit: 2d50415e2457c6f6621c2faa3b01b11150fb9c67
[04/19] clk: imx8mp: rename video_pll1 to video_pll
        commit: 21bb969f608cefd8d847cf6eb50a193d9f1fbb87
[05/19] dt-bindings: clock: imx8m-anatop: add oscillators and PLLs
        commit: 2ba124053687c933031a6dc5b2e16ceaca250934
[10/19] clk: imx: add hw API imx_anatop_get_clk_hw
        commit: 17e3c1a272d97e49b4f3fbfe1f1b889e120d2be8
[11/19] clk: imx: add support for i.MX8MM anatop clock driver
        commit: 3cbc38cf42ca42d2dc9a93c949e0381ff919df71
[12/19] clk: imx: add support for i.MX8MN anatop clock driver
        commit: 80badb1d7264e83b512475898e7459f464a009c9
[13/19] clk: imx: add support for i.MX8MP anatop clock driver
        commit: 4c82bbe8b5437c7f16b2891ce33210c0f1410597
[14/19] clk: imx8mp: rename ccm_base to base
        commit: 1a77907dbbecfbe5e6a1aec28afd49a1dc184b7a
[16/19] dt-bindings: clock: imx8m-clock: add PLLs
        commit: 6a55647af3334f1d935ece67de4a838a864b53fc

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>
