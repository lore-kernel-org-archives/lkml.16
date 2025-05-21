Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB3923F28B;
	Wed, 21 May 2025 09:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747819789; cv=none; b=F5ivswI7D5DQzHVnqyzclGwDAbYvd0sMdiI1h7q63U0phA1tgu1lZeJxdHhMJpN9LkjvvBKHiRT7eZEGBOWTRKd/Jmfq92RmKn47chVTkOqE8+e+tIMy8Im7LdXEtmtacnnyWvPFhACn6evu0IV18ZWhXsH2VePVmm0mEJIHOcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747819789; c=relaxed/simple;
	bh=4POawCM0FTqybhj/6IsHXfoKn5SknSfsKgE85vyH5B8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D2zI3bkQjk3E+DlJp/Ww2Oj/0jgnCrQKgDKAsM2Xbzf3UnMiiEAaBzOno3oljhq/x0mG3iIsQ1JSLbHVI+CBNap362FPYrZnuMbvPizFKDdZJKchZajGaqT358/0BvLaYFKa1MX0T05QBKO4fsvb3O7FjTJ3Jki+LachuzqCSI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S/f5jjsz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S/f5jjsz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F223DC4CEE4;
	Wed, 21 May 2025 09:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747819788;
	bh=4POawCM0FTqybhj/6IsHXfoKn5SknSfsKgE85vyH5B8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S/f5jjszbZ20fRCbV/THWH/CM/1dO4MBwFMxLzuXfXUlUkPRYRMyunfJiSatVw0K3
	 RurZviBpLfpxvo0Ho1BEkY2ncgR9L4Yv6PxoQGwRmkzLlNojYx0eoG72lrG3sgpEPl
	 gvmJlPi+1Jn4WXCJqUWPrm/EPHqKwnjVs4woXsGquQoyog7kjrCG1GoGS+Pw96+v6p
	 Ai1ODKfpXpN4MSIzJ82O39PfsRGamX13v/94is91YKTEH73ckrMq3P4lVDVtSQ/Sh1
	 vSyT406L4k0QLVhfVDm+mQNDB8Phc+QXAD0f071szYJjCmwk+ScAPmBjc41LONkmdI
	 MzKDl+5VqppNw==
Date: Wed, 21 May 2025 11:29:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alejandro Enrique <alejandroe1@geotab.com>
Cc: Johan Hovold <johan@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] gnss: ubx: add support for the safeboot gpio
Message-ID: <20250521-amusing-taupe-puffin-bc53ff@kuoka>
References: <20250514-ubx-safeboot-v1-0-1ae771335356@geotab.com>
 <20250514-ubx-safeboot-v1-2-1ae771335356@geotab.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250514-ubx-safeboot-v1-2-1ae771335356@geotab.com>

On Wed, May 14, 2025 at 03:54:42PM GMT, Alejandro Enrique wrote:
> U-Blox M8/M9 chip have a pin to start it in safeboot mode, to be used
> to recover from situations where the flash content has become
> corrupted and needs to be restored. If this pin is asserted at power
> up/reset, the receiver starts in safeboot mode and GNSS operation is
> disabled.
> 
> Deassert the safeboot pin when probing this driver.
> 
> Signed-off-by: Alejandro Enrique <alejandroe1@geotab.com>
> ---
>  drivers/gnss/ubx.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

<form letter>
This is an automated instruction, just in case, because many review tags
are being ignored. If you know the process, you can skip it (please do
not feel offended by me posting it here - no bad intentions intended).
If you do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
</form letter>

Best regards,
Krzysztof

