Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5E91C5D56;
	Mon, 10 Feb 2025 10:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739181873; cv=none; b=INqfh7Dj0402aCf+beIM4sWhZeDvt2F+wf8HuoKxzz9DEaRcDjt09KtD2+R86vue6eeWBYMVX+Iq0HJ8H3wga4nV7mxua+lUt1Pime+lJD3W0Zfvc3UNTsgQoA4qhUFwEG+bpNw5qS10uiJM0jZucoRH9RffCcHds2QLkiMW2nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739181873; c=relaxed/simple;
	bh=7L2ha/YngK5jMueC7mLCC2P45ZJ5Oa8CNhph4EuCsSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cXLYkBDfXWXc0wnIJVbvjJcl4EuMnQZH1EqkrBYy4kXs5/HzyxEygGExu0X0y+18Es8KIwGFyXSiruQmutpngV4+5Mgt/N2bwKnLg73yOmsZz25YUB5fgJyPeLyK9hF9hS5ZccduBfePCui5Rx+Hoo8GURcmLHhrkst7t5bO7KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HadQvcNy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HadQvcNy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 378B1C4CED1;
	Mon, 10 Feb 2025 10:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739181872;
	bh=7L2ha/YngK5jMueC7mLCC2P45ZJ5Oa8CNhph4EuCsSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HadQvcNyiQEIpvzP3QIYWdrOT4ClSpOay4MttGI3cYGp1ebeBhcOa0DDJKg6s8HoF
	 jZZSB9vjhe6AsdiCODgld+unX+vNka5AtWMmdfxMPgxl7iZ8LL6LO7RjVUHMdb77yO
	 PzdHJFtbj5Ob4p9LeZHVpFjGhYgFpuuBwYaUwit/owGKHjAImUCa9X7UE+00irIuaJ
	 YOX5zj3qacz5vE3shms4d2Vo7dJHPv/eMNd8/wN5HZFtR8O50y9hJCvkR5sMl6f7AR
	 eLai+TAWMGLswIpUkt7KRPy98nAhg8T4xKllMQiJOeXCaaHMn6kFy0BpxqW82zwB+w
	 rW1sEIV4YF/VQ==
Date: Mon, 10 Feb 2025 11:04:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, krzk+dt@kernel.org, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	derek.foreman@collabora.com, detlev.casanova@collabora.com, daniel@fooishbar.org, 
	robh@kernel.org, sebastian.reichel@collabora.com, 
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v13 12/13] dt-bindings: display: vop2: Add rk3576 support
Message-ID: <20250210-crimson-weasel-of-diversity-ece7c5@krzk-bin>
References: <20250206064457.11396-1-andyshrk@163.com>
 <20250206064607.11495-1-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250206064607.11495-1-andyshrk@163.com>

On Thu, Feb 06, 2025 at 02:46:03PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> Add vop found on rk3576, the main difference between rk3576 and the
> previous vop is that each VP has its own interrupt line.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

