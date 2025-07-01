Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B824244671;
	Tue,  1 Jul 2025 19:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751397845; cv=none; b=I9nm1Di4PltAlxoMhE4x4I42nAhKFre1i55Lk0aXZqUOBZ6xC/Zhs5CISWcRWGdk9WpIrYhJq050IWotuFOzJcbdziEr6ptjNnPFcSqarBHatbEKCdlxg9o1xfYsB8PJKPkPMsrllZ55vE70zv4l7og5AA6ozZVVKNRibfvRrfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751397845; c=relaxed/simple;
	bh=YhoiQtDB5/OLyWdP3xHtmJYqo/8+nJ8dsTf6c95tJsQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Phj5ghufL8aoyUdx9oevutHIBNklrYKtSjbTtVJF5A/vfZS1m4fJjdtT1N/VfqI5v30UEfDzNTpvrNuzgAk6bRLkHjnbRF7VWXN+/q6SGcu/q3ZEAASgjwLJL4GlGIEH4O/aJ8mnpj+jaEzB76Zw91SklZ3qcRaWBfTL82pY+jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=l5lxRTvj; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="l5lxRTvj"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6455E406FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1751397843; bh=XvtKFs8u7tVRJzwFXZHcodvMTrSJIHhfbaDKETNlGIE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=l5lxRTvjitiOaW4aA6fd89voZTYQqWnB6aBlTcKLVp3Ok9ddKiRFtN/zoGZP9iBZ3
	 bkeA7qSBMPltkfLxcxwCfF3tYodyLDWB3HjFz5QLhZ9Q0gOGdRbuG53Y042MgT4jah
	 F6Vka3DjnWJveZsiKenSmTGMTdhAfvjObpnxGSU1zZB0UcnY0cOw8nLHyfbZxvd4IW
	 XpUNPEBDmttfPEoVv9kO8q12vm3kUtW4H3b0xHfuQgQjOJjgcu6mSu14it2Lp/wjMt
	 6KQeU26i/7yjqKho+VU+6w/GpwXayXFvWDAXfM2XRmr03Aol7Le1+lQ/SE9xPS3HEr
	 qC9KMCb+MJdGw==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 6455E406FC;
	Tue,  1 Jul 2025 19:24:03 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Xose Vazquez Perez <xose.vazquez@gmail.com>
Cc: Xose Vazquez Perez <xose.vazquez@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, DOC ML <linux-doc@vger.kernel.org>, KERNEL
 ML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: replace git protocol for github
In-Reply-To: <20250625150231.241687-1-xose.vazquez@gmail.com>
References: <20250625150231.241687-1-xose.vazquez@gmail.com>
Date: Tue, 01 Jul 2025 13:24:02 -0600
Message-ID: <87plejr9yl.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Xose Vazquez Perez <xose.vazquez@gmail.com> writes:

> It was removed time ago:
> https://github.blog/changelog/2022-03-15-removed-unencrypted-git-protocol-and-certain-ssh-keys/
>
> Cc: Jonathan Corbet <corbet@lwn.net> (maintainer:DOCUMENTATION)
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: DOC ML <linux-doc@vger.kernel.org> (open list:DOCUMENTATION)
> Cc: KERNEL ML <linux-kernel@vger.kernel.org> (open list)
> Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
> ---
>  MAINTAINERS | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)

I have applied this one, thanks ... working URLs are better than broken
ones...

jon
