Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8719222AE5D;
	Wed, 16 Apr 2025 07:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744787156; cv=none; b=fITZCG4+EIrA+9tmaT61dsbfZANVoCQxVEBRIUIIqRJ6QfMwj7yfFHLOGIw6b7OBdulhoyVw9/DYJoz/FCnEhRccMuS9jzaDxypfvBk6YGRCCHWfps9EwQaCLstkNTXZOlsJ7x1ve35njojilroMTP1lz817mMcwxjZDi4nZcN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744787156; c=relaxed/simple;
	bh=TvXOOfKd0AybmzJYKKOIvlp2HZzH1NJikgI1O9LLoI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X8BJ2A2Q7VycvQdJs1cVvnRKoWJBBtbzl5Gvy9A/ePpyu2UZRPhyKSnKfOaMQqiOqINhnjXgbCrWs+rjZUKC9r069o+gsq9Kvn0Thi+lrBiAUTw/iFcSJyeR/TJXLwZnjMDFM3+mQRs9tJ1ycu6JdbCoAPlha5tVTC+cXuJ+rmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pga454ij; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pga454ij"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B175C4CEE2;
	Wed, 16 Apr 2025 07:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744787156;
	bh=TvXOOfKd0AybmzJYKKOIvlp2HZzH1NJikgI1O9LLoI8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pga454ijr9cG0L5OgTIT2/FkeP0bBGXdaK2we465eqKPpHz8IGq3a1p1nXMDMQKT6
	 GB4EQIzSJKyWdnsVmZfr3LNLtmPMXsCzplmXasJAA5dqMY3klHwHOtrBT1ZUvARjN/
	 Zzbax0FELML6UEenIIsL8HolP4iUWgDgDapZcU/Dn61a8PPpSuwT5iucZYIWsk/lZP
	 3uPhtIxDWz1tsQ7v2llcz2HDuCexK4UYI/UrHmy8nIC6s1i3671YFiMHRoFjhXL49d
	 VuqQP61yqkW2fZoS5glxVuRYO1m74CusWu/82h1+wclWgomWjUNbZ+allUKFvzwVoK
	 L8J/T4NyXXyTw==
Date: Wed, 16 Apr 2025 09:05:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org, 
	Finley Xiao <finley.xiao@rock-chips.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Elaine Zhang <zhangqing@rock-chips.com>, linux-arm-kernel@lists.infradead.org, 
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: power: rockchip: Add support for
 RK3562 SoC
Message-ID: <20250416-elegant-devious-rook-1bde16@shite>
References: <20250415032314.44997-1-kever.yang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250415032314.44997-1-kever.yang@rock-chips.com>

On Tue, Apr 15, 2025 at 11:23:13AM GMT, Kever Yang wrote:
> From: Finley Xiao <finley.xiao@rock-chips.com>
> 
> According to a description from TRM, add all the power domains.
> 
> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

