Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAE426B2A3;
	Mon, 19 May 2025 11:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747654944; cv=none; b=Eewewv2uUI82kMZ4lut3Kvfwj1Zj0MgKpjaNckO15dsh7zS8sPuWL3IJBgr5g8NiMNAwpgyIAs1YJAx+hXYQ574ByP7zjCVecvfaHfidu2Qi3bp+IFJO8+Xhlwk5ASQKoc/YZPsCLIdmn4y30aB91cHAArWb9rZxOxYQGJCYrf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747654944; c=relaxed/simple;
	bh=jzaJn7NfjL3k7WuQXBR+Itg71XWZV7gyCXNn4d9oU04=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Fuw6CWrioe/5hhnl/AwTC8FXS1YUHx+ney2noyaTuWjSSuiUmeNn25CMncSLKiHpbwQrQtxDQiYOD3G2mYL4Wc6KezCZGRPxhwCsK2EfMozhwb16VXaf6HnQSbHsFQk3lcdbNZvGa+2XS94QxhbOWgt40MfiIdblhlZKRS16dk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=CruDbJtf; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="CruDbJtf"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net EB91241086
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1747654941; bh=iYioAv1QtY2jiiIOxBbQCs8XERepMbW2M3Sg9GYqtAQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=CruDbJtfD9besvy1uHkdDkSIG14vlZZi9KI7M7Dk9hZ3EC10AzYGj1QakCxHkNcaP
	 Jh3rgslDlimkSXAWaa/z3RhwNN9IN0eBj9zfYHej5bbSwhnbahqO3qj2sYa0TloZA0
	 fai1pHZQj1VDc2zvkNn24kJWVwkyELreEyAKnmrjGi+HLYD8wIdP4kki25TkE4gOLw
	 VW/7QsWiCaNEroGkzdelnuHDkId+vT1iRNsvjXDuMwIgn/5cF2deiQwKmBXbqKoy3q
	 McEFTGmP81sh8ixvRWJTk4zThLc1uUqlNijLt3r8eNjFpCIqoLrvx9ijUmC9VhlzD3
	 wcNCGFM9VxxXA==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id EB91241086;
	Mon, 19 May 2025 11:42:20 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>,
 suzuki.poulose@arm.com, mike.leach@linaro.org, james.clark@linaro.org,
 skhan@linuxfoundation.org
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Hendrik
 Hamerlinck <hendrik.hamerlinck@hammernet.be>
Subject: Re: [PATCH] docs: fix "incase" typo in coresight/panic.rst
In-Reply-To: <20250513110931.15072-1-hendrik.hamerlinck@hammernet.be>
References: <20250513110931.15072-1-hendrik.hamerlinck@hammernet.be>
Date: Mon, 19 May 2025 05:42:17 -0600
Message-ID: <87frh0kesm.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be> writes:

> Corrects a spelling mistake in Documentation/trace/coresight/panic.rst
> where "incase" was used instead of "in case".
>
> Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
> ---
>  Documentation/trace/coresight/panic.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/trace/coresight/panic.rst b/Documentation/trace/coresight/panic.rst
> index a58aa914c241..6e4bde953cae 100644
> --- a/Documentation/trace/coresight/panic.rst
> +++ b/Documentation/trace/coresight/panic.rst
> @@ -67,8 +67,8 @@ Trace data captured at the time of panic, can be read from rebooted kernel
>  or from crashdump kernel using a special device file /dev/crash_tmc_xxx.
>  This device file is created only when there is a valid crashdata available.
>  
> -General flow of trace capture and decode incase of kernel panic
> -~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +General flow of trace capture and decode in case of kernel panic
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  1. Enable source and sink on all the cores using the sysfs interface.

Applied, thanks.

jon
