Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE441E9B3D;
	Wed, 30 Apr 2025 07:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745996703; cv=none; b=m9sWXfxOOKABAQ6PNDRHlNuQ1RHXS+coCNwOU9Uc7+j8q4wrrMNlKu9sg3kMfBJq6BiXt4vb0qSS8QpnjmPvRFOQr2h9ayarqr4Ue99UhovwEcwNcLa4A7WR2cd43GvtdTcOdICQF9A2GLKrK8ax8dOnWq96WYc7B8AeA3OZaQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745996703; c=relaxed/simple;
	bh=0jJcPCJLt1KylRRbiG+MEfiP1omyEpl/8MqQSoM3n98=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QpNJJcrwhphn24iJcdSvqOz6fRtmyMGOXT+RnVQhkHy3wZ1ZcqkVo3294jgm3cmVoQlVPZ2uPR3hRc4imhWbm2EEW6XOsprhDYHyliBLHSX7+ylV0QtJ2OJx9+Y06eLk2TqA/5nFWJdr6tQ5ct3iqPUSEPjksmu2bgP1wwgoLCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3iADWnQ2; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=6bmFkrE2; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3iADWnQ2";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="6bmFkrE2"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745996700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tCsrSDsvTkK6SkgYIF70bN0EWs2t+iSvSFadkoJDcpg=;
	b=3iADWnQ2nOBGlvCt8hTukwWjnOAGXqhyOUiwAHQrdkoUtoQQ0JSiBIe9QdbtvgmJyLfzJR
	jazIuyC0zcHe5j6DM59FfZt4agY+CKhGDckHIkFFeXB9X6ruya7y7L+DM2ZQOfia3Zkosx
	K8DY8dKJqIRzvjKOcsEDrylo1ZDfjMXdVTkSYnHDJuAGBr9fEWHhIbudHG737P9s9phn6d
	t4Ar4QtVmLkuJ1uwLgefBMooIk94PNUDOGEDggf/mMieLPS9PUI1otcdg2BcCUpUeXylzY
	95UD42MOKlN8tXlxs1Xr23VCE8rpoAT5N0B14u9+T7C+0u45DpXmNODaSYwcCA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745996700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tCsrSDsvTkK6SkgYIF70bN0EWs2t+iSvSFadkoJDcpg=;
	b=6bmFkrE2r1IbzapO/qhl/dL3kdb9A+nB4Sj6qSMouFf109CjNTFhAOBVWWRjt4jALQm8Ju
	bduDF6/x6CBO6IAw==
To: Su Hui <suhui@nfschina.com>, jstultz@google.com, sboyd@kernel.org
Cc: Su Hui <suhui@nfschina.com>, dan.carpenter@linaro.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v3 3/3] alarmtimer: switch some
 spin_{lock,unlock}_irqsave() to guard()
In-Reply-To: <20250430032734.2079290-4-suhui@nfschina.com>
References: <20250430032734.2079290-4-suhui@nfschina.com>
Date: Wed, 30 Apr 2025 09:04:58 +0200
Message-ID: <87v7qmp1t1.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Apr 30 2025 at 11:27, Su Hui wrote:
> -	spin_lock_irqsave(&rtcdev_lock, flags);
> -	if (!IS_ERR(pdev) && !rtcdev) {
> -		if (!try_module_get(rtc->owner)) {
> +	scoped_guard(spinlock_irqsave, &rtcdev_lock) {
> +		if (!IS_ERR(pdev) && !rtcdev) {
> +			if (!try_module_get(rtc->owner)) {
> +				ret = -1;
> +				break;

This really reads odd and relies on the internals of scoped_guard(). I
actually had to look at the scoped_guard() implementation to validate
it.

The whole thing can be simplified to:

 	scoped_guard(spinlock_irqsave, &rtcdev_lock) {
		if (!IS_ERR(pdev) && !rtcdev && try_module_get(rtc->owner)) {
 			rtcdev = rtc;
 			/* hold a reference so it doesn't go away */
 			get_device(dev);
                        pdev = NULL;
		} else {
 			ret = -1;
		}

No?

No need to resend. I fixed it up already.

Thanks,

        tglx
