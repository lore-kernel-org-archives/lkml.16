Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553F31A9B4A
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 09:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.63.210.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739008690; cv=none; b=Jqeuzvt08FvjpwEpuTMn9uLHvauvz8dQQVEqcpmgHdcbQm9/ytRdoZ583K9HU0oCctgH6WGAn5yHgOGhvJq0rffkDZEaCAaSyfb8TdUzFgmAAlvqm7iBcimuSkEPzZbqgDriNX9VJJ4JARSPPNgBBBUYRl8BdhxMXVXnCOyBje0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739008690; c=relaxed/simple;
	bh=Da5PceD4nSNuB1c7slA9pli6PCIvqpP7MItx3meXMT4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u2y6h5NPFeGWQqUUBlgsYrNtnprzWWXrCaPlFyCC4paQhsZvoL3hUkHqMlHHDAJnKbMYoWZSV0LzXrfPAzc/F11uo+kT03dWkeMONzFlr6taB9eZEozprs3OV+qXg44wtpg/qxnSdOlQq3NZrDx5hArGs/+Wym64RCHLmoOgecE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=marcan.st; spf=pass smtp.mailfrom=marcan.st; dkim=pass (2048-bit key) header.d=marcan.st header.i=@marcan.st header.b=FX7FzS64; arc=none smtp.client-ip=212.63.210.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=marcan.st
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marcan.st
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marcan.st header.i=@marcan.st header.b="FX7FzS64"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 5ED213FB5D;
	Sat,  8 Feb 2025 09:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1739008679; bh=Da5PceD4nSNuB1c7slA9pli6PCIvqpP7MItx3meXMT4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=FX7FzS64oOVPoNnOVFB1wLz/NNDiVn3OnhUKSyiWURYyh8TxPQ18nRdzlJQQmyU+B
	 O4L6XRU0OWuNPXV5H4BymyPNXe+KWZKF3Zc+JylhFgHiCqwlzdDcy917Nr8x9X6WM6
	 Uv1HUtzJ1CnIz3u//H0qdAmSya/MxGuQhSH3pzCYZ7MTJfqdODd2zW9yLE6Wpq5CF5
	 Z817GuJlmx1NfzEJFtkDXLx/IK3Xjf2sAjZi1yur42q1Cn0npxSvkWRPp96ZYadzuV
	 hkD99gVstKN8mIu2wZKI98kAWKSfTh7ik/n3NnyYAoIC2kEEgtcf2n3i7FpKIGKzKH
	 WAV8YKPwrRKPA==
Message-ID: <cf367a36-88fb-4999-a5ab-d34c4ded718e@marcan.st>
Date: Sat, 8 Feb 2025 18:57:57 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: arm: apple: Add myself as maintainer
To: Janne Grunau <j@jannau.net>, Arnd Bergmann <arnd@arndb.de>,
 Sven Peter <sven@svenpeter.dev>
Cc: soc@lists.linux.dev, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250208-maint-soc-apple-v1-1-a7f7337baec0@jannau.net>
Content-Language: en-US
From: Hector Martin <marcan@marcan.st>
In-Reply-To: <20250208-maint-soc-apple-v1-1-a7f7337baec0@jannau.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2025/02/08 18:22, Janne Grunau wrote:
> Sven and I have agreed to share the maintainership for the ARM/APPLE
> platform after Marcan's step down. I'm handling the downstream Asahi
> Linux tree since April 2024 and worked on or wrote several drivers for
> the platform.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f2594c2300f9b054a6d57ce069120df0bb451d88..9987cbc4d14b2d2be43f259688c7791ecfd10423 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2210,6 +2210,7 @@ F:	sound/soc/codecs/ssm3515.c
>  
>  ARM/APPLE MACHINE SUPPORT
>  M:	Sven Peter <sven@svenpeter.dev>
> +M:	Janne Grunau <j@jannau.net>
>  R:	Alyssa Rosenzweig <alyssa@rosenzweig.io>
>  L:	asahi@lists.linux.dev
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> 
> ---
> base-commit: 7635a78a95dc3bff39e9c49b34108f81a9bb62db
> change-id: 20250208-maint-soc-apple-8d2498e75509
> 
> Best regards,

Acked-by: Hector Martin <marcan@marcan.st>

Janne's proactive leadership on the maintenance of the downstream tree
has been invaluable, especially as life got in my way last year and I
couldn't do it myself.

Thank you.

- Hector

