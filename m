Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D683B22069F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 15:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751555442; cv=none; b=pRvyfMD/vxW/9N9DgRSxG3c8Beb7nW4V9hPE/k86zvxHO1wVvOSa1eKifc//WkDM7cSNFTTNI1N3Iumys/IT6QF9nD7sFhLENZU8myI74CXqv17vh3QKWgM3V6/aieKX3nyzxu12ISmJ1LdFknfjNf+QurAmkXYddP401xNfJV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751555442; c=relaxed/simple;
	bh=HcpB7WcJRiu1n3uBKLFMvcSjTuFp3XqHuTv/XQqwXIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=izIKfkBD9kis2PycgXSf7lB6SiXxINf1NRUl/oxRDJe3VStXfXys3nuj5OPUPGhRlGYruIjxCOlewUO2b86IidT8cHme+YLS044RnrXHeDIWAFyd67PKl5HBZZdeQcETWTJVDjL5KqiywNKkJuJ1l7O14P3UfscDSgaieyEiRmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iAATeiGj; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iAATeiGj"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-607cf70b00aso16113403a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 08:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751555438; x=1752160238; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gBhYZEvvr6wT0rA3y1ifWP+OcQau5rDJJM6LpP/dVA0=;
        b=iAATeiGjUj5uhUVs20MUepRI9IH5zG4tHSzWgr2pgAIJ+nABbJ629e0H9W8+ytanES
         tSXmDUzZoI2Q7qnuxdghkJejmZQVKv5yebZ5TS1fJakh/HEiLerx9cAXRBM9YRzOWhzk
         r7fSME2UlGXJeUNLMnK1P4kf++Y8UEVFBbHzsoyYb7KRawKcWZNGTLsgjCqVwbRYT2vQ
         BO8fSwWyvxB7RIiZHOEESCo/xCcYxRta0h6/7SEAEzmJGoNK+4zGNstWB3wAItbjQU8v
         A3QkiHQsI0m5eMkaKWQ0ZbWGjvxovP/OwbRFZystR8ZEa56hFc2U3hMBmFhqvAcVtSC1
         xzsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751555438; x=1752160238;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBhYZEvvr6wT0rA3y1ifWP+OcQau5rDJJM6LpP/dVA0=;
        b=P+b5zaPs1SFKWpadJKorr9D1DNbnQuhZEQpi7NywjJ+QlHskRruMd/6DbBunhaWVLY
         KHU14X2lk5kuPOem7B3TWcWfXm3mxVOMk/l3ccCXOd6xfDGEZqiESyNWqhlxTyQaUNPn
         xSH5bniXC104zbq/u0RfgoKSUKrYVLs/b5Yxb29V9rtGcmsAOQp2iIjeJ7D+Q+OrRS6v
         nu2S4D7F8S7YBYr2EmUyrKzC5KqWbWKak4EZIpv/LA4gWmBC6uKOpP8rOH8KgsPd2uFD
         yt+eTOVErc+3cXamW6QEu07WVyAAZvaxaQVxk4yGvsuET1HpobNMdgDUyVkMxk3FYVUd
         47WA==
X-Forwarded-Encrypted: i=1; AJvYcCV0VKr0WYVqZcIxLkgGIjn2VO4DWl6LC+Np/Sk7XaF0LpLjt8/fI5WW8L5fFNcfhEWt31nItX2E/W/slbU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxygRpPyNTIpZqY8KF5k83rhElFt2j4BzqECH8q/qvrt12E85nk
	u1EkX8q5tXziDYLRE0jL1c3+MUFpMdphH45PPGxb1JVfTd9fYUqNeXinI1ogkkFiFc4=
X-Gm-Gg: ASbGncvmaiwgyRtJ2BIIok6UdFMfMeDPC7alHDzhgo4uqq9IpGvPpGFHujP6v4+/8qa
	i2Z1tfT64IFzoJJGj5bZ9cMGIaZ+8eAJV/LX4lG74JIH+7v/n7H+UsvKKgXcWeC1Le1Vbhv7/0h
	qm07/THuxnnt8FTTi9vEfJsQ5c5PxQ0e4USfodjJu7WfGA2BFoeuwpS86+QpF+zKmMu5no9SZNW
	0LEiYd3krAL1yLWQTpsmLH3Xp87Hv/w0Fy6g3R9pYOKfgAxuJckNs9+Oy9yt94mQ5VZfAR0J55H
	Bybv2q3XbizfoHkjEH4dcy8XzPdmAfb2iIChsc73Yj0Gtf7VHZCJlr0lpLkAwb1It6fLyg==
X-Google-Smtp-Source: AGHT+IHFWA0SjfKo8Q9HvR8gkZ0iZby8sEu/tE1InGy6IA+SPlppSiNPUeimMeEYtk+3MIxhso8xqw==
X-Received: by 2002:a17:907:3e0b:b0:ae3:bb0a:1cc2 with SMTP id a640c23a62f3a-ae3c2aaedd7mr750188166b.19.1751555438164;
        Thu, 03 Jul 2025 08:10:38 -0700 (PDT)
Received: from linaro.org ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b369sm1274968066b.3.2025.07.03.08.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 08:10:37 -0700 (PDT)
Date: Thu, 3 Jul 2025 18:10:35 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
	Frank Li <frank.li@nxp.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] clk: imx95-blk-ctl: Add clock for i.MX94
 LVDS/Display CSR
Message-ID: <aGadazB4LbRvk1BM@linaro.org>
References: <20250703-imx95-blk-ctl-7-1-v2-0-b378ad796330@nxp.com>
 <20250703-imx95-blk-ctl-7-1-v2-4-b378ad796330@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703-imx95-blk-ctl-7-1-v2-4-b378ad796330@nxp.com>

On 25-07-03 11:40:23, Peng Fan wrote:
> i.MX94 BLK CTL LVDS CSR's LVDS_PHY_CLOCK_CONTRL register controls the clock
> gating logic of LVDS units. Display CSR's DISPLAY_ENGINES_CLOCK_CONTROL
> register controls the selection of the clock feeding the display engine.
> 
> Add clock gate support for the two CSRs.
> 
> While at here, reorder imx95_bc_of_match.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
