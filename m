Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E76F52F88
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745413960; cv=none; b=uFdZSkzN51PuFoh3zJEGGWGrWbm4jcrvU7mMx4ve+3a07pyLoK2h1mdz8zP6KQlgDa7k4g6ogM3Pi7feUAg43YSeVhKlycpZD+n0EqofCXd8PbgFxbElkfZShDSzIV1K8FETAQ24/U15Fj2h6UhPp4DX27v9wMwpnjXpPESNGwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745413960; c=relaxed/simple;
	bh=fIUyCjQtOjmd1WAoagxHXNlbCDt6PUnMgQToMDKJOYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X6ULwaX1g3iWYw347pX9He8NZbQtnLc+X5vdsB4LINXOgkyLLbCiFcJb4iCfdVxHLPfOzsltI35TN5elWWC01YovQwqFulw33w2pEbEeFNYH6ni8mW4CXd7CZ9ku5CQ5JnGYTvQwCxP6hKp/qHXDDfZ/zpv0xakn678Nz1pe81Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=km3pGIHW; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="km3pGIHW"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-391342fc0b5so5279160f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 06:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745413957; x=1746018757; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EnNh4nAQm+RPIaXKRaRvi+wY8Sx0Yyg+NpjwoekcfHY=;
        b=km3pGIHW+rl0tcZCtsnXFg9iMq3QjFCep3q/69bY66WtRjEi46MBIEUcQGoHQ+D3YP
         qKOc+N1ieFkZvcT5aBwOqAFWIGnHHj8r3Z34SS8z2VRcIwi47g/lVlft8QzYxUtJiMF1
         VDbdSCKPAJhpkrG1Bb9ilULrcN24sAX9egmzmxTWbdyBxI5cIMCv1wToNLK7gVOXjja5
         rAt7tfeunuiysHbcu7Lqbc0mMToFaQv2WPwQrv4QvFVgrCUeH2mJfwYEp5KdLwhl8SAo
         iEwTP2pGE4ltXxEHk/gGbbau39bYMcqTYMXSjfLtRTIohyG5ayXJt1My8Hy9e6jb7P10
         ccBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745413957; x=1746018757;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EnNh4nAQm+RPIaXKRaRvi+wY8Sx0Yyg+NpjwoekcfHY=;
        b=em1js6p48MbZRA6q4DBLkrt0revY6lZq1RYYctXADgN5SMrNBbaa0KoEEW4GyAr/Zd
         wMr6V6ZFJfSs2PgxI0YRhGNykCR9M3Nq7arIQgaILyshDO5hc0uL+G1bTdx0zyhIw2uw
         cYIMzaiaEQ0tiiqBivfn8xwvXklHkk+ssExaLV3f2mBqf6GJmELtEzvx3w8fhV7Ig1uJ
         kAODHFpQgXXqieReUmqrw9W8+fDfdwiRN8KevIBxp8sXQTEoSXJWBidnzE13qH3ljMy/
         3dgH+sqNV8llRm6GPCZFNlVNltf7jRkhfxfsQLvRYQQ1aekPxiNsEmEpjSgOSTZEFC4p
         xsXg==
X-Gm-Message-State: AOJu0Yw7AKEZHFoF4YFyqBJ/VzppRhIFqroWivmY4KHCKY9jcWW68kq0
	2vf2WxlE3jbpNbeOfk6krbEGM/NH9X8jvwPeI/CyltsL1twc4NGyrEYANoV9Tq4=
X-Gm-Gg: ASbGnctHjPHyX2ciwDtIBUwRvIVXaGtiqvL46ki33OKCnTfqpumfyp85sJtIm3ygVGN
	6aBy75YVe9wgUL9VLfdxk1T4qnwrZGoWeTQ22iXKWI+jpEzQ8hzlqKrPkHsQ87qmJEa4T/0yWk0
	PUrHm1MAgWUIgGg3jxp0f+7BJpPGvnQywSUY8uXSgER9FEoZYOXyZeWqdfFieVjnvvSHdrq2FEF
	JVKIXFde+hKWpPV0dabt/XBHm7kSa0xmdUw0mohcTvO5tEIYmsGFdtfYCtZj+qT9UUce+v4IWWE
	pnssRfbVO2Uj/VCe15E6hThQ5/J4eC91gPre7X5hniWMEw==
X-Google-Smtp-Source: AGHT+IFLiGEPtIUG41rtNhf8o9bC64yoKVgiB+tlF8MOvnBbCSYDUU6BGbHcm/6Whcb9nIfm+cjAgw==
X-Received: by 2002:a5d:588c:0:b0:38d:d666:5457 with SMTP id ffacd0b85a97d-39efbadef97mr14579817f8f.42.1745413956864;
        Wed, 23 Apr 2025 06:12:36 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39efa4207fcsm19078159f8f.19.2025.04.23.06.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 06:12:36 -0700 (PDT)
Date: Wed, 23 Apr 2025 16:12:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v11 12/18] clk: imx: add support for i.MX8MN anatop clock
 driver
Message-ID: <09721eab-1adb-4001-880c-10ffa1961918@stanley.mountain>
References: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
 <20250423060241.95521-13-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423060241.95521-13-dario.binacchi@amarulasolutions.com>

On Wed, Apr 23, 2025 at 08:02:29AM +0200, Dario Binacchi wrote:
> -	hws[IMX8MN_CLK_DUMMY] = imx_clk_hw_fixed("dummy", 0);
> -	hws[IMX8MN_CLK_24M] = imx_get_clk_hw_by_name(np, "osc_24m");
> -	hws[IMX8MN_CLK_32K] = imx_get_clk_hw_by_name(np, "osc_32k");
> +	hws[IMX8MN_CLK_DUMMY] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_CLK_DUMMY);
> +	hws[IMX8MN_CLK_24M] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_CLK_24M);
> +	hws[IMX8MN_CLK_32K] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_CLK_32K);

I'm just CC'd on the v11 of this one patch and I really hate to nit-pick
a v11 patch...  But I don't love that there are so many unrelated little
cleanups mixed in with the functional changes.

I also don't care strongly about something which is self contained in a
vendor driver and I recognize that re-writing patches is a pain in the
neck.

regards,
dan carpenter
