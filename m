Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0075021C18C;
	Thu, 29 May 2025 09:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748510402; cv=none; b=mxRTgpocz+M8W//jAsrbsoUDQdX3tODcwqLogm5bhPYc88GaBirYkizW5fXfjqw1297DfLJ4j4ueYlIAakUVEBYz9faLa4VYFB9HqzaRznE+hVHqtlF6pyLchP7iMNFTNsm0nNRm6NhDqk9dTNdotCG+y6ZSZyRGCt323G7iRiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748510402; c=relaxed/simple;
	bh=f7xPyVGmHtPsst3y5iEuJ2peXhmtWO+PJOGzgAzs8mA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ju1rYP4Cu2Lp2HEyDzgFVKGbGOkc3bxnx0KJgKAncaTEFR0EvcxZdKXaUwJRS3jkEwM3hmLJ4U9tz0wb8+lt2tz/6D7tQMhG7Wrrj3NtWn1wF1SKmA3jjXo7OBQoALj58yzCIn8Whbl7p5vZFQCRJ+2XFVuRbNmQzYxI/R+A5Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vPpfmbto; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vPpfmbto"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA1C4C4CEE7;
	Thu, 29 May 2025 09:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748510401;
	bh=f7xPyVGmHtPsst3y5iEuJ2peXhmtWO+PJOGzgAzs8mA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vPpfmbtowJn4dWn36lpjzjxfJWaGkz/n7J77uua4Vset8SmpbovOyHpSB6PDrtR0q
	 4UY1hlcD8IYmAh2tKfDbj7dp23k/K3eIEyXzkD5ig0SAok2LwvNpJ7dEncT8kG0VIX
	 EzW++sfWqH+ZwOCiD9jL2yWQRsTFy9f9tV3/MhXBlDO2DA9FVhELWknOIBVk8ICK6u
	 Pc3MPTqiWnOjRwnytnapb9KZjjsr8KV8IKrBQ0cfQlNHym6a4P0hK4P1JOr4h+4Jxa
	 5vUl6maXPzLkjhVkuLdklKUpACwE/ybbNEYOdN7dbHYLM5U2vw7yJ0IIk39cZWX95W
	 lf7XDKGrOMW2A==
Date: Thu, 29 May 2025 11:19:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joseph Kogut <joseph.kogut@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Steve deRosier <derosier@cal-sierra.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: arm: rockchip: Add Radxa CM5 IO board
Message-ID: <20250529-impressive-real-monkey-a7818b@kuoka>
References: <174735136138.1544989.11909422896170025756.robh@kernel.org>
 <20250528221823.2974653-1-joseph.kogut@gmail.com>
 <20250528221823.2974653-2-joseph.kogut@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250528221823.2974653-2-joseph.kogut@gmail.com>

On Wed, May 28, 2025 at 03:18:21PM GMT, Joseph Kogut wrote:
> Add device tree binding for the Radxa CM5 IO board.
> 
> This board is based on the rk3588s.

Do not attach (thread) your patchsets to some other threads (unrelated
or older versions). This buries them deep in the mailbox and might
interfere with applying entire sets.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


<form letter>
This is an automated instruction, just in case, because many review
tags are being ignored. If you know the process, just skip it entirely
(please do not feel offended by me posting it here - no bad intentions
intended, no patronizing, I just want to avoid wasted efforts). If you
do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here ().
However, there's no need to repost patches *only* to add the tags. The
upstream maintainer will do that for tags received on the version they
apply.

https://elixir.bootlin.com/linux/v6.15/source/Documentation/process/submitting-patches.rst#L591
</form letter>

Best regards,
Krzysztof

