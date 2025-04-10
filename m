Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56AF7283CAF
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 14:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744294815; cv=none; b=WatdxuHNCe9O83AWc2WY1a6xaVG0rIcAIQ98fl90GujScmqEo12f+3Y81FRLCIxuq11TYgTD8+feq0FWVuN9laZgqdiExDrodJ34y9xFsgTw5Q2SzwcLWK1cvn9iLEsmbxtKTO3+mSmI5dx5hGhA005q1GlTPLh37SD1MJQs0P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744294815; c=relaxed/simple;
	bh=JattNGha423Yy6m0LWWQusIZ0pJwwQ/7X2UwSM6+8fY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A0SsIABSv6IOr/LFvh9ZU0ZIiXMUK0GcakKoIsm8xkEEtPHZC6i7nMvFUxLgA16wt2eMG84WSW1R5F0hKdfLZfkH/4fQ6bz61O3HGrhJOZTEoflDxdAXEvZA2ewt9UfoloCeQ8/TX3szU3KeGBaosHDOCTEf++hNa+JP/LPspKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dFF0SloR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dFF0SloR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66B05C4CEDD;
	Thu, 10 Apr 2025 14:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744294814;
	bh=JattNGha423Yy6m0LWWQusIZ0pJwwQ/7X2UwSM6+8fY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dFF0SloRdMIr4BsE6DxXf2OZ3CABG+q7v8vewQCmqpU+gWTnZdsdzKgMVtM/3E2eO
	 ykZ5JUiTRGpItd3LOyt3JNSymwJ0mJXuoJo8Bd4vyZ4ZnnqDuAq0ULZH+fWuSZqTvx
	 ItDsPYw/RWtTHJg9MCjFXRYar4nTYcE2H1vpSVV8+26V8D/BhM8TJr9e/2pwnxIwSn
	 PjeZ5A8k1DhbOBK8/s62E6fCizsUBl3pYrAYhzWFOxuuj5juP6dmxeXKWB9Et7Qc0q
	 FypgVdkQcIwGdbKBicbHZphPHUBJH2ZfUz8NYmvAV8ZevzzR1G2TxqknZOUjGUL05Q
	 JC/LOTd9/tPhw==
Date: Thu, 10 Apr 2025 16:20:11 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH] timers: Exclude isolated cpus from timer migation
Message-ID: <Z_fTmzdvLEmrAth6@localhost.localdomain>
References: <20250410065446.57304-2-gmonaco@redhat.com>
 <87ecy0tob1.ffs@tglx>
 <2c9d71fd79d7d1cec66e48bcb87b39a874858f01.camel@redhat.com>
 <Z_fBq2AQjzyg8m5w@localhost.localdomain>
 <87wmbsrwca.ffs@tglx>
 <Z_fHLM4nWP5XVGBU@localhost.localdomain>
 <4fdc6582c828fbcd8c6ad202ed7ab560134d1fc3.camel@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4fdc6582c828fbcd8c6ad202ed7ab560134d1fc3.camel@redhat.com>

Le Thu, Apr 10, 2025 at 03:56:02PM +0200, Gabriele Monaco a écrit :
> On Thu, 2025-04-10 at 15:27 +0200, Frederic Weisbecker wrote:
> > But how do we handle global timers that have been initialized and
> > queued from
> > isolated CPUs?
> 
> I need to sketch a bit more the solution but the rough idea is:
> 1. isolated CPUs don't pull remote timers

That's the "easy" part.

> 2. isolated CPUs ignore their global timers and let others pull them
>   perhaps with some more logic to avoid it expiring

This will always involve added overhead because you may need to wake up
a CPU upon enqueueing a global timer to make sure it will be handled.
At least when all other CPUs are idle.

> Wouldn't that be sufficient?
> 
> Also, I would definitely do 1. for any kind of isolation, but I'm not
> sure about 2.
> Strictly speaking domain isolated cores don't claim to be free of
> kernel noise, even if they initiate it (but nohz_full ones do).
> What would be the expectation there?

I don't know, I haven't heard complains about isolcpus handling global
timers so far...

I wouldn't pay much attention to 2) until anybody complains. Does 1) even
matter to anybody outside nohz_full ?

Thanks.

-- 
Frederic Weisbecker
SUSE Labs
