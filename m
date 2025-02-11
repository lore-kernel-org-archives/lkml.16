Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B522C24FC1A
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 14:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739283409; cv=none; b=gAbVseT+Q1eA/Jdqk9DwRP9nNPNTwHcyRaaZMUFtvxWkdsGPn7fyuemqRxqQQC2AzftxlZ56tRHQyzfJAONgR4tvcznigc30tCe53eBO4ptr4YVDyRmS3wpNK3D7pkB9YM26xHegxUp2H5uE+DiqQk6SkmV78CXF+T5sjrU1Fas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739283409; c=relaxed/simple;
	bh=0jZjuDqamsjoEk7e0fmImJOnmKjvvP3xAW1YAbTFTqE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UvZndDbEAl1/wTnliQME0WSmxV1FiqaJ/UqCTvqs9hjYmqoTckWeE8bp+ccqC77m2EURQdBeHjRnvjQF+ip8wtMl4n0JR2/Oc4qCMJ8MfWvNV7On47FMwGzJAG670yRsQUGE8egCyinQXm8ML4U+ZDGxfOzeTBPWBEb6aYdapmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tronnes.org; spf=pass smtp.mailfrom=tronnes.org; dkim=pass (2048-bit key) header.d=tronnes.org header.i=@tronnes.org header.b=D/4Ey+3o; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tronnes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tronnes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tronnes.org header.i=@tronnes.org header.b="D/4Ey+3o"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
	; s=ds202412; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:
	Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=MIH+Qt/I9LD0chnB4J+lbV92eo3vViC6oSROdQt6ba4=; b=D
	/4Ey+3olG2BeKv37mJEme3irIv1YP4ccIAvY8M8gHQ8olFj6qYpG7JFU/Lr7NKb7VlznB2C3CYmEJ
	g22ghj4XO/HRn30IVaTWsnEG7WcpRdPbOfmG6thhEVbtlFF4SI2fZR3ravAobbl5nEijwg9Y9R1ey
	741QsVOfN/UgIWmwFug7bWnCB+Ghh6oO3TwhuWNO9mW9tSaDFIQrbxf3TwQdhZI/jn30pVbu9bMso
	0zqDgE7pFD/BxG01Eqwfk79GBxu8wQyexnuOo5m8YuGIFO+fwelIrcYdtfIBzxNn3AwmMz3oQ7Si8
	15ukF515EYQvDZGqOVilBmk8FpCEr+RNA==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1thr43-003msR-Gj;
	Tue, 11 Feb 2025 15:16:39 +0100
Message-ID: <221ad1f2-307a-4ead-84e2-4b6c4331a20f@tronnes.org>
Date: Tue, 11 Feb 2025 15:16:37 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Update maintainer of repaper and mi0283qt
To: Alex Lanzano <lanzano.alex@gmail.com>, airlied@gmail.com,
 simona@ffwll.ch, tzimmermann@suse.de
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 noralf@tronnes.org
References: <20250210233232.3995143-1-lanzano.alex@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
In-Reply-To: <20250210233232.3995143-1-lanzano.alex@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 11.02.2025 00:32, Alex Lanzano wrote:
> Add myself as the maintainer of the recently orphaned repaper and
> mi0283qt drivers.
> 
> Signed-off-by: Alex Lanzano <lanzano.alex@gmail.com>
> ---

Thanks for picking these up:

Acked-by: Noralf Trønnes <noralf@tronnes.org>


>  MAINTAINERS | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1c5b22f00434..b5e46f23d1ba 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7352,7 +7352,8 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>  F:	drivers/gpu/drm/mgag200/
>  
>  DRM DRIVER FOR MI0283QT
> -S:	Orphan
> +M:	Alex Lanzano <lanzano.alex@gmail.com>
> +S:	Maintained
>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>  F:	Documentation/devicetree/bindings/display/multi-inno,mi0283qt.txt
>  F:	drivers/gpu/drm/tiny/mi0283qt.c
> @@ -7455,7 +7456,8 @@ F:	Documentation/devicetree/bindings/display/bridge/ps8640.yaml
>  F:	drivers/gpu/drm/bridge/parade-ps8640.c
>  
>  DRM DRIVER FOR PERVASIVE DISPLAYS REPAPER PANELS
> -S:	Orphan
> +M:	Alex Lanzano <lanzano.alex@gmail.com>
> +S:	Maintained
>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>  F:	Documentation/devicetree/bindings/display/repaper.txt
>  F:	drivers/gpu/drm/tiny/repaper.c

