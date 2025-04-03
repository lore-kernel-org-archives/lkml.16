Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB36918DB20;
	Thu,  3 Apr 2025 06:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743662544; cv=none; b=RplKDjIirfj46H3H6MREe0bwPTgosMAbV5Lz+qIiyvHgDyHywtizpd3TMwWBbuvrfdCVRNpgZUtV1ufwgO2G91DuE6S6XzIKQJGRhSgO61XxrSW061M3h9U1prRgdEF3R0nzqkwKqY8V3USmEeW+c5qpmuu1e0QbmfxycqCvpGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743662544; c=relaxed/simple;
	bh=Mm5UvShqJfS6Bo3gBY57Tk/+isrXqZzI84v5T2TgGyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gqif3gMve/ZJSg72jUx/lth+RJrIah9o/z4beNGGVYGM4sFUGDAunWHmyW649fdLq6m6jz8Ydctf3mu/7zGZV2hE376I+P3+C/u6OJJHEMYpFeHbby432UmfyL4dtg2gs8tGFBlgm7f1uLD3UVpgI4TksNiGkjFrSa+6+vHiM6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qgce0Ewg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qgce0Ewg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC26CC4CEE3;
	Thu,  3 Apr 2025 06:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743662544;
	bh=Mm5UvShqJfS6Bo3gBY57Tk/+isrXqZzI84v5T2TgGyI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qgce0Ewgkd+Cumb5f6U4T1HhR7WHTnXMeJrlK6+7f+dxtNnJnHGzn4rG1Mh0jfzKG
	 GYtkJizV2zO7Q72uwCvGV+9tZ7MjW203gozPMAbCeIkZnsgByXUV8z2r4qJ1sEcryJ
	 0RX3uL8ze5r0AjY4Ymw5pMLgaJum8G4C9JgeHAZwZMjMg60yGnZf9DZiVvrnA2uncK
	 TTDMv92scWRTufXVLVNFCgXkbUkZZHANAES+VwsOK7DGMrgpmPDjadzPqVXME1DnVt
	 96T/3vhXiBiJsHJydOyNmnrUJcYxXPYniJ1sxotmez8xtYriIU6Ck4lRHhZfRByenT
	 hz65jzoVWTjgg==
Date: Thu, 3 Apr 2025 08:42:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: dmitry.baryshkov@oss.qualcomm.com, heiko@sntech.de, hjc@rock-chips.com, 
	mripard@kernel.org, naoki@radxa.com, stephen@radxa.com, 
	cristian.ciocaltea@collabora.com, neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com, 
	yubing.zhang@rock-chips.com, krzk+dt@kernel.org, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, robh@kernel.org, 
	sebastian.reichel@collabora.com, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v3 4/9] dt-bindings: display: simple-bridge: Add ra620
 compatible
Message-ID: <20250403-big-hog-from-ganymede-6aa617@krzk-bin>
References: <20250403033748.245007-1-andyshrk@163.com>
 <20250403033748.245007-5-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250403033748.245007-5-andyshrk@163.com>

On Thu, Apr 03, 2025 at 11:37:32AM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> RA620 is a DP to HDMI bridge converter from RADXA, which first
> found be used on ROCK 5 ITX.
> 
> This chip can be used without involving software.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---
> 
> Changes in v3:
> - First introduced in this version.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

