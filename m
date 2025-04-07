Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C2B22D7B7
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010513; cv=none; b=jJ4VP0KQRBwPv+QQSTbQwrXhtU4vb1KM99W2uGMeS4XQEbDcK4Y3pagQ1LAKK4k8opUE/2KnrhWvsivGOzcsEGmCfAR4/8NLsJxSCxDuZtsyTNP1fHRSIVVpm6pZJ2Byk4tXfWNKrRvn8J3Pb5h/mJrxe/6oLkIxKitxxt3zw2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010513; c=relaxed/simple;
	bh=0moqmrnlm5C4rE6n50GJA2BT/ki/KqRSesvB4S8YSSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BJTsMvs/V50CajnhXVwrQotDwe5bQJqAshJ1ZpJvM59pzUInFx8jiOcZeZEVwKO6oy29njs0UV3YxHkOq37gF0u1zzj7G/PdWmJoZx8j4TpmD24cm7d6eqj3Lcd50FwEczKl3gb2XdcFl/vXkr70y7HdUoa7zVcPQ3OAt74n/XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ou4sY6f4; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1nU2n5g5; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ou4sY6f4";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1nU2n5g5"
Date: Mon, 7 Apr 2025 09:21:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744010510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=moC/ANfimYUq4N7KG+rd1xmzyM4h478EFviaRfta0Io=;
	b=ou4sY6f4o74qgsFU40SQ+0/DZ++5HeqymGXPooJGazMWy6qZVYq+znBd/bev8EIDuCnbHo
	WTyexp1UpzZzHUYzkO8pLY3Cu337i3LbdIxtXbxuL8wky07kzDweROLsf20t73vMusHfsT
	wB7bMEYxguIeZb+YyEw8NfO8h4WAnIn1Db4zWnMlqrRGcHNFdpBHYt/zwipvJcHvtnra4Z
	Uu7DWNrA11OYrnbhFSWMOSBStyLz1D57IkhPibOevlkol+A90kitgr1PwHz58ufxRGrLFu
	MLJSqMvXFz83+d2Q/tqarrn33PCe4ubE+VSukx8EKyPt++QpW/BMeUcynSp6uA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744010510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=moC/ANfimYUq4N7KG+rd1xmzyM4h478EFviaRfta0Io=;
	b=1nU2n5g5imVa8/Vo7twFU3P9izjV4YlQXoxZUgp9jSqTuchET9pkXni2H0JDFiRhBsngzc
	FC8dh/C+ymGcUUDg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Waiman Long <longman@redhat.com>, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] locking/mutex: annotate __devm_mutex_init() with
 __must_check
Message-ID: <20250407091438-557fe081-0c03-40d9-9b1e-9331c5181e31@linutronix.de>
References: <20250407-devm-mutex-must-check-v1-1-cf62b440bc33@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-devm-mutex-must-check-v1-1-cf62b440bc33@linaro.org>

On Mon, Apr 07, 2025 at 09:03:46AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Unlike the non-managed mutex_init(), devm_mutex_init() can fail (for
> instance: on OOM). Now that we've fixed all instances of users not
> checking the return value, annotate it with __must_check to avoid this
> problem in the future.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  include/linux/mutex.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/mutex.h b/include/linux/mutex.h
> index 2143d05116be..e194f8c22d72 100644
> --- a/include/linux/mutex.h
> +++ b/include/linux/mutex.h
> @@ -126,7 +126,7 @@ do {							\
>  
>  #ifdef CONFIG_DEBUG_MUTEXES
>  
> -int __devm_mutex_init(struct device *dev, struct mutex *lock);
> +int __must_check __devm_mutex_init(struct device *dev, struct mutex *lock);

This didn't work for me, see [0].

	"Unfortunately __must_check/warn_unused_result don't propagate through
	statement expression."

Also it is missing the !CONFIG_DEBUG_MUTEXES case.
I'll resend my patch once more.


[0] https://lore.kernel.org/lkml/20250208-must_check-devm_mutex_init-v3-2-245e417dcc9e@weissschuh.net/

>  
>  #else
>  
> 
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250326-devm-mutex-must-check-8c1b94ae151f
> 
> Best regards,
> -- 
> Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
