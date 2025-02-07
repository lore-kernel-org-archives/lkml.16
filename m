Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C601EB19F;
	Fri,  7 Feb 2025 15:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738940474; cv=none; b=kVjc/DEWdPbBQ+FQmNyQ1eO5qJRhp01lpLje29IeihkqWNNkMsg4mO0aii96dQ1e10LXR7onHX/zSx8P04FaIbnuLqF2Ee7sspG+l+sDmVF+Hh1HHN2qSkPR5LfbrKPGiJ7d1TclNIHMqeOnN/m5ekThQQj+oQIl5Gu2X6GF0TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738940474; c=relaxed/simple;
	bh=F8Aa5aceIm++TIRugP6fG69olAAFmZnooDdSl11N3Es=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=QwlTo8CHDKB3y5aWqv6VscpfpX21eCcHtgtOnDCQ70/3s2eXAjutFPwMBh4xNdqBcRecnoM/D1KR/BFDE6RjRruy3SKXIwJlY/p68sw2WRpcT0krs8UY5c7c1vEj43YDZlodW1aWVE3uYusHtE658udx3VJ01UUOP3pl3YxNvDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=ppTUSEKX; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="ppTUSEKX"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1738940465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MdSSRS0zzr9cmqiYQNz4jFGUuLv5U2TbTEH1JId0mac=;
	b=ppTUSEKX3LFAhWXfNk5cTq9naAAmq9H2bVF8nkbmNHXync3pnwkkaahMU2MdwxSBVoWVx7
	x+xtYB6tlHlhrsl0Xx1AxkpI69AN554BVqZ74zzB9x9Vq90G/hfYDI9uUDhuFaSuzZ0MAc
	5QFeVCzpDuudDqP5kPv2+xQL8hY+f0cjYZRnNvThfYLstaGKLWMO2OT49tgV040RwkrAFT
	zj0E9wxOM+kXqEaMznZgJPj+BIXezfy7lpRjyF6m4/Fj8djCGBDGR7ayj0FIkipg8kDm+r
	3ycofI0/ZtA4oWwRYwIkkoHlEff5CqhLIgc7erzVsbE8go9n7PrzmAUSP2gm2w==
Date: Fri, 07 Feb 2025 16:01:04 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Diederik de Haas <didi.debian@cknow.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Maximilian Weigand <mweigand@mweigand.net>, Marek Kraus <gamiee@pine64.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: rockchip: add 'chassis-type' property on
 PineNote
In-Reply-To: <20250207111157.297276-1-didi.debian@cknow.org>
References: <20250207111157.297276-1-didi.debian@cknow.org>
Message-ID: <502523554b482a2e10d85d37761932a0@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

Hello Diederik,

On 2025-02-07 12:11, Diederik de Haas wrote:
> Add the recommended chassis-type root node property so userspace can
> request the form factor and adjust their behavior accordingly.
> 
> Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
> Link: 
> https://github.com/devicetree-org/devicetree-specification/blob/main/source/chapter3-devicenodes.rst#root-node

Maybe the Link tag should be converted into a "[1]" reference?
To me, this is more like a reference for this DT addition.

In general, references can also be placed closer to the contents
they back up, which isn't possible with Link tags, but of course
that doesn't matter much in this case.

> ---
>  arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi
> b/arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi
> index 2d3ae1544822..3613661417b2 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi
> @@ -9,6 +9,8 @@
>  #include "rk3566.dtsi"
> 
>  / {
> +	chassis-type = "tablet";
> +
>  	aliases {
>  		mmc0 = &sdhci;
>  	};

The patch is obviously fine.  Thanks for the patch, and please feel
free to include, regardless of the note above, my:

Reviewed-by: Dragan Simic <dsimic@manjaro.org>
