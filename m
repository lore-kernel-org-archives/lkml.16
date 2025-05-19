Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9205277004;
	Mon, 19 May 2025 11:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747654694; cv=none; b=I0w3YyWcVb5jHuMXDUVp52UvFACaK8pZ/2HXngT5ctWnfmvSD48ofEwubkMiD8r5Y0Y5UAlUBQ5iy4n7OJQd2vRQQQxBCYAHDAmDJ1BwNuCJZTzX58Ay2qWeY72rXH4lPrAb/Z7CpXz22kY2sSkn28hcsMXDaWJ4iE8ClWhKPno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747654694; c=relaxed/simple;
	bh=ZT2swLw3vak3ie4pR74lUra8/LgMbJf1xWXMpaHdV0k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=B2uDQd0bOoIW7gPeQXG3ElKuAyReaGdzQ9fNy67l4eSbWC08RLfLAj8wS3rVjNqa5vbjzOTpQI9jlW2cgkl7zbqUfuagcoSAMiWWvjtMhlvn82F9P57lJCfxrKwYV68RxdjUUcWctQw9FvADAoFEIuYNjNkDp22xbSawK/LvdUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=lmcBlLoB; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="lmcBlLoB"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0122F41086
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1747654691; bh=VrpHJZVhRIauD59sBkuzdqC6I4YPrdfuP0YshFjFxQw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lmcBlLoBBIUEKFU30+ACIy5RcLGDkTd497DsOT5UdQ9wDVjPUMqrGDZkpxX3gu07M
	 Ec1B6irU7XqS4yLuo8n5b7pMktdeatO9el+C4TJxjhYJZws4AOcIx2r9Gld3GoNjBn
	 TeG7LdLF3eiefHB/QHrqhPBvGMDMd2ZPCjCG0A6g1jW606FAPZis8Lgi5w3VM51C9+
	 +BY9LUMUcQPX/eadSBIUYe0JAr27w3QLvUe/NBcMBKWs/hO3KFO6I6Axfgef42XT8e
	 IC+oOkNaG3AE13f1RBsQ2hc4xbJ66qyPQtfTQeF8FzZnuzmCB1RTDN29pseA/GTUhb
	 wAGa0cUEcL8vA==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 0122F41086;
	Mon, 19 May 2025 11:38:10 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Benton Raymer <benton.raymer@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Benton Raymer <benton.raymer@gmail.com>
Subject: Re: [PATCH] docs: memory-devices: fix typo in emif.rst
In-Reply-To: <20250516032837.42124-1-benton.raymer@gmail.com>
References: <20250516032837.42124-1-benton.raymer@gmail.com>
Date: Mon, 19 May 2025 05:38:07 -0600
Message-ID: <87o6vokezk.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Benton Raymer <benton.raymer@gmail.com> writes:

> Fixes a minor typo in the /Documentation/driver-api/memory-devices/ti-emif.rst file
>
> Signed-off-by: Benton Raymer <benton.raymer@gmail.com>
> ---
>  Documentation/driver-api/memory-devices/ti-emif.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/driver-api/memory-devices/ti-emif.rst b/Documentation/driver-api/memory-devices/ti-emif.rst
> index dea2ad9bcd7e..d824cc0dce89 100644
> --- a/Documentation/driver-api/memory-devices/ti-emif.rst
> +++ b/Documentation/driver-api/memory-devices/ti-emif.rst
> @@ -29,7 +29,7 @@ This driver is for the EMIF module available in Texas Instruments
>  SoCs. EMIF is an SDRAM controller that, based on its revision,
>  supports one or more of DDR2, DDR3, and LPDDR2 SDRAM protocols.
>  This driver takes care of only LPDDR2 memories presently. The
> -functions of the driver includes re-configuring AC timing
> +functions of the driver include re-configuring AC timing
>  parameters and other settings during frequency, voltage and

Applied, thanks.

jon
