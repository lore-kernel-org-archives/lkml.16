Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CBE70805
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 10:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747046481; cv=none; b=MDCD/1o9I4Fxumn88aTcAT5Zqwes3+ATzVVO0kxCkaW8tf3kHZQBOS+h5SsfnwZHemM9nPmKJwdlllw7cNoZnf35UV0B9gDomlT34pxSQQZ89ibeKPBYe3nn6zWSJrsU50iv9saQHJPBylF9qjCxrton07pTVA1SHcCVdBII0BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747046481; c=relaxed/simple;
	bh=Aje9AwAiS9Y0v5qCIExzN8qPlUb7TaDzqZQs1iuei7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cxAvYZBXa5216KYaAzN0ZH/cmS9k0N+68VNxnBPtYxfT0cK0oTdtRcL9c9AeJkuo4hphu2kiOKEBMjOE8m6bb4sj4rMvWColNZA2xdkD4zfWG/C7GtA3zDs8wZJzu9ZgMD5ZBItj2wJhbNj1kZseJJQWkI7fvnOMHuZqqf43D8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3yS4oaai; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CyYKzGVg; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3yS4oaai";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CyYKzGVg"
Date: Mon, 12 May 2025 12:41:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747046477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N4m3rubZsWyVaGsaB5wPR32rb8iSG7t0JS0X/ho3mz8=;
	b=3yS4oaai5zADwx5eafPWBcdKx4NchcV8GWSKIjBQZJa8/kjA0O31th1V7kf9CrwTM7D/lb
	kj227/JpauI9UiCGEiytD0q3/NaHcnQwz2FCrv8ODHrAfj0OzQuMw8A0CFAfj9NfBHq4X6
	corE8I31+hL81xycrsDBflD/v2N2gjLbUp5v6LCN0LV2ES08kKZZdCfqNIt1VzWdVFOmSl
	EIBRxMGrfgy4eFX6uUA9ku92kznsVyP/+BJIQLe3MTKZgIweUERqKX5q2psxg12jTBUhID
	EZstUouacGOhrBNSWqOGcVmYDw7Tml5PwXdHELaH1tpf0KKyk/JIHfSV65acSg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747046477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N4m3rubZsWyVaGsaB5wPR32rb8iSG7t0JS0X/ho3mz8=;
	b=CyYKzGVgamNPXkL5lAjt2OXQ9P9Xsz23MbbjEajGMaiurgzotcwbaX/y/js/X8Za1ojWPm
	fACyzURzCAAHQfAw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Leonardo Bras <leobras@redhat.com>
Cc: Jakub Kicinski <kuba@kernel.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] local_lock: Minor improvements of
 local_trylock*() documentation
Message-ID: <20250512104115.KcF7Ct_u@linutronix.de>
References: <20250505170244.253170-1-leobras@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250505170244.253170-1-leobras@redhat.com>

On 2025-05-05 14:02:44 [-0300], Leonardo Bras wrote:
> Fix local_trylock_init() documentation, as it was mentioning the non-try
> helper instead, and use the opportunity to make clear the try_lock*() nee=
ds
> to receive a local_trylock_t variable as parameter.
>=20
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
=E2=80=A6
> --- a/include/linux/local_lock.h
> +++ b/include/linux/local_lock.h
> @@ -45,38 +45,38 @@
>  /**
>   * local_unlock_irqrestore - Release a per CPU local lock and restore
>   *			      interrupt flags
>   * @lock:	The lock variable
>   * @flags:      Interrupt flags to restore
>   */
>  #define local_unlock_irqrestore(lock, flags)			\
>  	__local_unlock_irqrestore(lock, flags)
> =20
>  /**
> - * local_lock_init - Runtime initialize a lock instance
> + * local_trylock_init - Runtime initialize a local_trylock instance

If you replace "lock instance" please use local_trylock_t instead
"local_trylock"

Other than that,
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

>   */
>  #define local_trylock_init(lock)	__local_trylock_init(lock)

=E2=80=A6

Sebastian
