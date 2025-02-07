Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E49919342E
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 02:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738894867; cv=none; b=BjKclfBd5q07WALYEABdSL+Am+S7BKRSrDob/G9aWar0lDRbIkFPtfl0h8A8TL7U7UP6UbdsVAPm42ZepUWl9aapuZz5ESFs5ul7bsSBESn43JJ7LMYLUzqgs85AFTsHdhX1JsuPp8zaFdRS8ki9x6A0Xr45mB5WmfymOB4iTQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738894867; c=relaxed/simple;
	bh=lQaV34lurimnaPJ9vgfTHAK/26+j4AVXi7l/BHGkvic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=al1MN0RzGn/4JZ0c9TW7B6vqm6/AaS0MSKVX/eGiZMiHtTRJ3F14YIS0Qp45IdjxnwjOOxQm3RrgGU4XhCEoyDlJv6E4RrInq3Skb4UUeufDe48VqwpCGFOqfBFRjEW5EY0jDuBTHiZG25T1DrF409/TbLaeTVPtHmueSEJK410=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MZbX5Y06; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MZbX5Y06"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-303548a9361so13164891fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 18:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738894863; x=1739499663; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ihgnc3taSXbrknD0hSr+bBzd9N3zZ9ifJfj9N5E5nmY=;
        b=MZbX5Y06nGBOcPlOPzBF/mufImJFsR5/iJ9xyq2oZIl7LtRAxUpFtHFuKf8T5SRk29
         wj+qrZIGEJgZLBZV7Hr2N25M8ailDKEbwWOxfyFdOWUKFxpo4BY4EpEHW+DnP9rSsjb/
         6BkEhM4bpBpBdzLH1Qntc3Bht42IV70PGtZLsnGxPh9QYVXjRATcLmN4f80Tl5OziIV4
         JjnCNjEMAt4Y7/Q+OY6QzRaH7o7nI5IhJVBkZ2eSfLH8WcUQvU5SVVlUdoNqYdokls4+
         L8pVgLH+D7yzchOkuSmnLZGYJt7ngxcQXeUf9zraD1djJmTnYewaa3jG5w7m3l9X6ef7
         2Lyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738894863; x=1739499663;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ihgnc3taSXbrknD0hSr+bBzd9N3zZ9ifJfj9N5E5nmY=;
        b=da63NLfB3bWwwkzr+Ors1SH4L97Gqe0UVtni2zZw0lBkPc/Rb1d68FpjPEL7ENX3nb
         WQ4IerWinGhCHuddpK/uQlll5Xeb6MerIT26Rwd2xlHZY/ua1MXqFgi9EMI6ImSqKnqS
         XE5MBT06PAPfJ9p1EKLKY0zNMYeTe+bF+Pl+b/zibE29xYk+O/D7p4UzOuPmLstgMU2g
         2MXHomY9vXUqdqD6YXAyCbLzpfmmDa/6d12wAAXmMdsBeFYw26nAq+TOqPE0pzI/WKrA
         QiQNuLVbKtsNZN8uG7oUAWR9FyLNWmfOyc+PsVaiLLH+q9K1zqxoRu6Ge5oTnDcPf/dc
         p2TQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnXGZ+tw/y5WAzPSYREKSUb/E9rl08cfYcn/5OWELBlcMnIeDjmqigZw+oCGjuqHZtem8OHoqNWdgSgNA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1fyuXeVs/lBCCrEUDGsnOYhO3nbx2lKwNOUzTe7/8R3RgOs2p
	nJrzH9+21Cwnu/dT6Ds9LlzJ8c4xwHCHXrQ3W3pEQyxuY1pI/R9oNcg2liwwmkY=
X-Gm-Gg: ASbGncsn3kKdDO5O4jgh1QCqjVfm+XX1tGCH0TeOF24D26r/pfh/sQ28L3dLXTTPce2
	b+66ORmyirDvv55TgCVXvFNQ20+zv6DvyH0tuhVP/OybMYmm92qzuFlLKRunqHW+6RtMaMV0+2g
	fC/LBE3Bd5ZvGv4WH1NgQZ9c0TKaZLrWfXhpyG/YdhMJ+mBVxNgTpCwOlSXQ4hCGqfIZ7BmulhM
	y1BqA54UI7VyiX1woolFXLEbYva5QzPS+LZjrlmW0OqniEVqtTiuOn9j2M50M7SmZNDAV8/+Ry7
	zCpkQAdOYPOG9daVggrCebI9ok65zW5I0daxPq6JuCompmuZH8g7GqfwXRN5svb+ll83iXE=
X-Google-Smtp-Source: AGHT+IHRDTBhlu8pAlsQ3oP0N0FtT5qdWC2jNVUTMMclmHpLd2GBk+UOaDGiKoBFjKCmUJyp2r/OWA==
X-Received: by 2002:a2e:a913:0:b0:300:3a15:8f22 with SMTP id 38308e7fff4ca-307e581b0bdmr3526211fa.21.1738894862959;
        Thu, 06 Feb 2025 18:21:02 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de177d22sm2841571fa.2.2025.02.06.18.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 18:21:01 -0800 (PST)
Date: Fri, 7 Feb 2025 04:20:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Paul Kocialkowski <contact@paulk.fr>, Maxime Ripard <mripard@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	=?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v6 02/26] drm: of: drm_of_find_panel_or_bridge: move
 misplaced comment
Message-ID: <w4iufoohajidadw6s6qwaa6uo4qna2yepieb4qe3thkk5terwe@m2b6wogduiiz>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-2-9d6f2c9c3058@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-hotplug-drm-bridge-v6-2-9d6f2c9c3058@bootlin.com>

On Thu, Feb 06, 2025 at 07:14:17PM +0100, Luca Ceresoli wrote:
> This comment is misleading as it refers to one of the inner if() branches
> only, not the whole outer if(). Move it to the branch it refers to.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
