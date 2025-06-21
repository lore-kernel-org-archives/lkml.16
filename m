Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BD3221FC6
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 20:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750539498; cv=none; b=elvjwzDRQN5fxDuYPNrC+611vJTPJrKZwZCcP2sqYx7jcp1ejY+cOvMFVy48Z5h+gbkffa/9jSbouHPJS/xQ6fRrevr0dcn7SVZ1YwlWnVh5jtUXDcO+LN49AMoDycjq4BdVA6j0EdU9EgVCYurpmyHoDNePQTyFbJ0JcPdez2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750539498; c=relaxed/simple;
	bh=siVc9RXe7otepqDtpg3E1usZhGrwMlWqN9Q+Gtweicg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n5jBy/egXMsPvdaUuBnjPoMN5BjAbUtbVa4+G0IEaQJA8dWBvGIMlKS1tSpc14TUEGp6zvSuEcU0qJ7LGtOkCoC8YAIB8RIKXnj9hC0+dGFSPEEB7tI/jr9bR24FpnNL8wflPC/rd7UOcPSYxtE4mwIaDlLWj2+VGYkVd6TghBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Vnlcnr9X; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Vnlcnr9X"
Message-ID: <2211ddf3-88d3-40c4-a6f4-22e31c5446ea@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750539494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B8MS0cazfGUsxYyk6B/exVLlLdNWKEHr5YMhhdcZ8Lk=;
	b=Vnlcnr9XHU8OHhGIdcjxkNPWIroG2eGXz8aQ8mLBrhK33Mawsjq1mozTFagGPXv5F8+2lr
	pw8/YyITMAtjJZYpA7WY9n4f0IsqlvBEzC5iPTEVOapuDnJFaHWVc2E2fe+Y4vpC5GfD5k
	aStdtJPPrfct4QtlL+YjjMol2svOBBc=
Date: Sat, 21 Jun 2025 21:58:12 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [patch 07/13] ptp: Split out PTP_SYS_OFFSET ioctl code
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org
References: <20250620130144.351492917@linutronix.de>
 <20250620131944.156514985@linutronix.de>
 <83c30e4a-d674-47a7-bda9-4b2fc0d590e3@linux.dev> <87a560q10x.ffs@tglx>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <87a560q10x.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 21/06/2025 21:42, Thomas Gleixner wrote:
> On Sat, Jun 21 2025 at 21:14, Vadim Fedorenko wrote:
>> On 20/06/2025 14:24, Thomas Gleixner wrote:
>>> +	pct = &sysoff->ts[0];
>>> +	for (unsigned int i = 0; i < sysoff->n_samples; i++) {
>>> +		struct ptp_clock_info *ops = ptp->info;
>>
>> Looks like *ops initialization can be moved outside of the loop.
> 
> Well it can, but does it matter? No, because this is only a coding
> artifact. The compiler can evaluate ptp->info inside of the loop at his
> own peril even on both usage sites.
> 
> Though what's more important is that from a context point of view, ops
> belongs into the loop, because that's where it is used and not outside,
> no?

Well, in the original code it was always outside of any loops. And the
scope a bit bigger, all these functions work with ptp_clock object, so
the context is really subjective. It just looks a bit weird to de-
reference something, which is known not to change, every iteration. Of
course the compiler is smart enough to optimize it, but still..


> Thanks,
> 
>          tglx

