Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE12E232360
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 16:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738858701; cv=none; b=MSMrV3/8l5YKImcucYwI1DLMDJLeQZW306OnFHWG8VB0weNVaR6RR8C4XhqMizET2PVNFBSlDPnlh78pMvaOlz+hQjBcm5UcLx89irl4txAjRIdjIwv9ISY9RGGLtR0zLUY6GlXs8eefRHIVlx5U5l494tk3bGMnphP/XrpNlJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738858701; c=relaxed/simple;
	bh=lBQ0mPHElMVwQdHa1BjidtzNbOp5KF6CO/DrIy8130I=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oxSTsd1jP3t+y/0oPcOH74AAtbykhYeUm28lFErle22EIqo206xF8yGrNfc5jRgbams1bjq5kwwkUWUHVrgAyaxO9POBaSNfU3KhPdP+p1a/A0f3yruS3S23cfjpPMCM1X/1s3DtTF6urSmmtr1KgwOFn5IrBW+SOhPP36//Drc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MzY0nSgH; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=RNjNVWPP; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MzY0nSgH";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="RNjNVWPP"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738858697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=39K6XMO+q4l7T8TMI+o1Gud9PY3OdwKUWVkh1aOA23Q=;
	b=MzY0nSgHjRua3oKFASeIpnu/wcXb6gQzu2IfXIroX1tmjuVOMXYaVvUhvH/8B4mQY77NSF
	BT3KK9yD1I8AMVPS2cPrMHOmCY2hTzOi3anZ7KCUTx9L901nWtL2HS8UqOibVP0k/KWBWk
	Y1U2QaaDjSI1wYLJkuVzQtiJI8Zlj4a2y0vKWhDlq785a2feHfBsumITDkgcnr+ajmAyem
	A4WJokClWJxrYxsQpT10+NZa4qd8SoDYzyR74edIMAYhmazPHJhO0IoNNNpn/c1kdPWivi
	ZFJ/k7CVNaG0GK7I8i78BktC5I0+a/uFzebRHK4X8LxJBuInZKl7J0aRNu8Kcw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738858697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=39K6XMO+q4l7T8TMI+o1Gud9PY3OdwKUWVkh1aOA23Q=;
	b=RNjNVWPPjT7YT+n5d9ZM65sRiWFLtIK6z0n0F49oK2OeUYDHLhHSCo0hUwTn9dS8d8FNTw
	jSbA1clLll7BAaDg==
To: Jens Axboe <axboe@kernel.dk>, Nam Cao <namcao@linutronix.de>, Anna-Maria
 Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker
 <frederic@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 05/12] io_uring: Use helper function
 hrtimer_update_function()
In-Reply-To: <35d4b9be-3d08-4eaa-8750-7b34ec6e6064@kernel.dk>
References: <cover.1738746927.git.namcao@linutronix.de>
 <9b33f490fb1d207d3918ef5e116dc3412ae35c1e.1738746927.git.namcao@linutronix.de>
 <35d4b9be-3d08-4eaa-8750-7b34ec6e6064@kernel.dk>
Date: Thu, 06 Feb 2025 17:18:17 +0100
Message-ID: <87y0yjm4hi.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Feb 05 2025 at 11:45, Jens Axboe wrote:
> On 2/5/25 3:55 AM, Nam Cao wrote:
>> diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
>> index ceacf6230e34..936f8b4106cf 100644
>> --- a/io_uring/io_uring.c
>> +++ b/io_uring/io_uring.c
>> @@ -2421,7 +2421,7 @@ static enum hrtimer_restart io_cqring_min_timer_wakeup(struct hrtimer *timer)
>>  			goto out_wake;
>>  	}
>>  
>> -	iowq->t.function = io_cqring_timer_wakeup;
>> +	hrtimer_update_function(&iowq->t, io_cqring_timer_wakeup);
>>  	hrtimer_set_expires(timer, iowq->timeout);
>>  	return HRTIMER_RESTART;
>>  out_wake:
>
> The timer is known expired here, it's inside the callback. Is this
> really necessary or useful?

It's not strictly required here, but in the end this allows to make the
.function member private, which prevents stupid code fiddling with it
without proper sanity checks in the debug case.

Thanks,

        tglx


