Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD15333EA;
	Mon, 31 Mar 2025 06:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743403713; cv=none; b=eNR7haMEdxuq9Gsw47qvSjb9j64aUp9YHnG4CsdBWd57hIeU7yoSS/hF2j+WeM2v+Zh/Y+0VRByI7l1GKT4RL41qgsYzQL+4s2F9AvhmJZoozJeFFN3dX9a6wjCsFvb3slDCwHf7MZ4J3/v9s2zo838+9P2cROqa98930Gw5g9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743403713; c=relaxed/simple;
	bh=ftEA5HkR9HKgNZtzyjrtkfCte/96vO2XvKPBChSlxXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kOHUlV0HQyPxOjyPXSK7TBtYtfQquPBHQvOov9uTUWpVihekOZf2EsapaBIa7lJAuuiw8Go3ssj8gawQ11E+tJTGSvgIKMHuavtQRZyuSvsGG+5ZlmMMKvMvrZTTlmw0rMkU70qCrVfRwBZTguwVs72ygC26NHJ3ixm5nBLRXEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MlSNfO3d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MlSNfO3d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77E4BC4CEE3;
	Mon, 31 Mar 2025 06:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743403712;
	bh=ftEA5HkR9HKgNZtzyjrtkfCte/96vO2XvKPBChSlxXM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MlSNfO3dzGoTsrUyJAiKxpFMAj41Kt3P37e+V7vO6XpUDVBH6wBCJhe9XNMDpsq5s
	 qZT/qinvZsOfzYPcW/ifHdmqGctNLOqwAoI9kc5fDTNg4bliRMbo4P+9FTLl/zDLMo
	 GxDidqjcd7N97JJE0clAUSU6EC2H59lYPQt2te2f36jg+Yqa1p2xO8qQ24TFoyWEEr
	 tuG2MrO1wJmaNX6b3/PV1sVS6+AE0/dSJ555cq16MYr/DS3akUb/sc/F8tcN2QA4TL
	 U9gQeWGnjP+ia6QKbwKvnrgJFiHUWof7eUGRkD1iQ9PrFLk7onFlcnlJc4Qo13B9my
	 LSbKcT6ePfhlg==
Date: Mon, 31 Mar 2025 12:18:26 +0530
From: Vinod Koul <vkoul@kernel.org>
To: shao.mingyin@zte.com.cn
Cc: krzk@kernel.org, kishon@kernel.org, wens@csie.org,
	jernej.skrabec@gmail.com, samuel@sholland.org,
	zhang.enpei@zte.com.cn, linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, yang.yang29@zte.com.cn,
	xu.xin16@zte.com.cn, ye.xingchen@zte.com.cn
Subject: Re: [PATCH] phy/allwinner: phy-sun50i-usb3: Use dev_err_probe()
Message-ID: <Z+o6uhfMCsqru2v+@vaman>
References: <20250331103257372kkrgDrRRskdABmXRnmbID@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331103257372kkrgDrRRskdABmXRnmbID@zte.com.cn>

On 31-03-25, 10:32, shao.mingyin@zte.com.cn wrote:
> >On 28/03/2025 10:02, shao.mingyin@zte.com.cn wrote:
> >> From: Zhang Enpei <zhang.enpei@zte.com.cn>
> >> 
> >> Replace the open-code with dev_err_probe() to simplify the code.
> >> 
> >> Signed-off-by: Zhang Enpei <zhang.enpei@zte.com.cn>
> >> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> >
> >Why are you sending patch-by-patch? Organize your work for the same
> >subsystem into one patchset so we see entire picture at once, not spread
> >onto 10 separate threads.
> >
> >Best regards,
> >Krzysztof
> 
> Dear Krzysztof,
> Thank you for the constructive feedback.
> We apologize for any inconvenience caused.We will regroup the patches 
> targeting the same subsystem into a consolidated series.

Nice, while at it, please see the subsystem tagging style. Here it
should be "phy: allwinner: xxxxx"

-- 
~Vinod
