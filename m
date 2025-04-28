Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF061F4720;
	Mon, 28 Apr 2025 23:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745882020; cv=none; b=Hf0ZhDy5N14hRKBCGNDGFyvOedAj/3dBOcmRiXOBwfhTSuexdv0NRyLE5szDRu155EECcPsaGNbAWhf3zDTrBM/AS2T316Z9Qlm/a488MghtEOPwlsw9A7Uli9fUPYanbkK9nUkka72Xz9I6KFxycK6o0e7fSqxKYhY0vvctHQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745882020; c=relaxed/simple;
	bh=mfcjVtVchCTujbGAMs19wl9GY6gb3/+JgDiu/lQnIkU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nbCnpBh8py5DqaxxjyMNx8AVtPR46yvkx3E7ZySkv590DuwRGCaHuLZy5cnek7XYm2mBM9MGmIFmnXXEi1FChv4IS3umEzTz6UkX9VRfUxvnm6/hw6b0GqHT/he7LYIIN0SQIArvGpPTi0n2k2L/HsnjA61KGsYugBy5zgap+3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=WqEVrLYH; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="WqEVrLYH"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net EC1B841060
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1745882018; bh=ozM+kmYZmDmnjvLsopANwPE6pE8blnoCbPhurrb17/Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=WqEVrLYHjL6KUtg7mdghmalhI70wlQVX8EMYBHhMcUpPIvh18ccaLe285eW8VTAJ/
	 l1cyWtF/IVU6077+rW21l09IoieAqrmGjRwPFkSbZguYI/wXtbl8bVSHfAZut61tSP
	 EyPHnb63OCLyl8r4qLMkSpCaQkuMYNgSo0KA4nrtEPUP1NyGsWEkK8w0P/nCz4Vd0D
	 Ko16f5O1Wl8K0iCgMf6JvWsdcm7x3Jh0u/DNgdCqzkKL2WfnPTaJf1x1RKQDqY77Dj
	 lRkZTcq7PthjCz4dLRXKYZ2ABJqUo5lKp9EsEncuxJenVpX6pVWmCrxVsFaYhWNVYE
	 12gttC1gtt/bw==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id EC1B841060;
	Mon, 28 Apr 2025 23:13:37 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: chris.wei.cui@gmail.com, linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Cui Wei <chris.wei.cui@gmail.com>
Subject: Re: [PATCH] Documentation: fix speculation.rst chapter
In-Reply-To: <20250426135609.735-1-chris.wei.cui@gmail.com>
References: <20250426135609.735-1-chris.wei.cui@gmail.com>
Date: Mon, 28 Apr 2025 17:13:37 -0600
Message-ID: <874iy7swv2.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

chris.wei.cui@gmail.com writes:

> From: Cui Wei <chris.wei.cui@gmail.com>
>
> 'Mitigating speculation side-channels' should be a chapter rather
> than title.
>
> Signed-off-by: Cui Wei <chris.wei.cui@gmail.com>
> ---
>  Documentation/staging/speculation.rst | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/Documentation/staging/speculation.rst b/Documentation/staging/speculation.rst
> index 8045d99bcf12..0d526ba55d14 100644
> --- a/Documentation/staging/speculation.rst
> +++ b/Documentation/staging/speculation.rst
> @@ -63,7 +63,6 @@ of an out-of-bounds address, while the second call will influence
>  microarchitectural state dependent on this value. This may provide an
>  arbitrary read primitive.
>  
> -====================================
>  Mitigating speculation side-channels
>  ====================================

Applied, thanks (though, in truth, I'm not sure this document needs to
be kept).

jon
