Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DBC2857D7
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 14:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744296847; cv=none; b=AqTA+q5ZtzFZWONOOBS7eqwetZWEzqsAJmKgPt4ieKIBAWQtQfVP6FrGSelwm3z4EyvpYzu/LXzqELpRGX1AlElYVQU6FkDAa7k4eM2I8rS3ek7vs60r00MoEh62O7coS14107Om979pHO9B6tfvEqrQtZ1HXSI1EqYKJLit8eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744296847; c=relaxed/simple;
	bh=uRSn452baF7eSP5Tm/VTy3S3qZr8O9Gq44NuQ8ETi9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ch5RPg/1K4wqdv5GgJBQ+ouJWnoWg09Kfj1JYFQOEE1/2k3u25sBDGIbgzEq9CIgOQpM5i+WNvpGlbeDfrlTrtUQxGWO4yyhS8pEjNrQVIhR9QFL4Y8ZnfWjLATh4Q2uVngBDJ+wYwdANN44TqHU3Ey70O1/f0Xk/GtYsd0aAT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lvjQ8B5a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lvjQ8B5a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 740B2C4CEDD;
	Thu, 10 Apr 2025 14:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744296845;
	bh=uRSn452baF7eSP5Tm/VTy3S3qZr8O9Gq44NuQ8ETi9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lvjQ8B5ajXYboqXHVz5vR5AI20ULr4U6pOZVkMsJxnKbAC8jpAguEDgDzXl5k6HKF
	 1gCw9m4P61fdrNprlAE9Aq44qT0FpGHkW8MrQ2SqqSijcLUUiwMXwH8Q7+Tl3fK7HW
	 OyPHBCil8/RHXeV0nmJuNS7h6wacr/iIR1zJxoWPNYNUIEq4xXI1kYXeYzGJSqXPQk
	 7S2GqlenwXv28mb+hu+RyQns1aNXdJ2K6KaWGouvzZ8eAyoX8htpxDCRcznn7wVE23
	 PmEKPCcpI9c5QGsuCO7yqZYQfnU3AIV8M3kabwDKX+YEolU4l90WHNIOaVrA4rQf1Q
	 74/a5dGWIa9+w==
Date: Thu, 10 Apr 2025 16:54:02 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Gabriele Monaco <gmonaco@redhat.com>, linux-kernel@vger.kernel.org,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH] timers: Exclude isolated cpus from timer migation
Message-ID: <Z_fbimtUBqBiWr16@localhost.localdomain>
References: <20250410065446.57304-2-gmonaco@redhat.com>
 <87ecy0tob1.ffs@tglx>
 <2c9d71fd79d7d1cec66e48bcb87b39a874858f01.camel@redhat.com>
 <Z_fBq2AQjzyg8m5w@localhost.localdomain>
 <87wmbsrwca.ffs@tglx>
 <Z_fHLM4nWP5XVGBU@localhost.localdomain>
 <4fdc6582c828fbcd8c6ad202ed7ab560134d1fc3.camel@redhat.com>
 <Z_fTmzdvLEmrAth6@localhost.localdomain>
 <87semgrs5t.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87semgrs5t.ffs@tglx>

Le Thu, Apr 10, 2025 at 04:46:06PM +0200, Thomas Gleixner a écrit :
> On Thu, Apr 10 2025 at 16:20, Frederic Weisbecker wrote:
> > Le Thu, Apr 10, 2025 at 03:56:02PM +0200, Gabriele Monaco a écrit :
> >> On Thu, 2025-04-10 at 15:27 +0200, Frederic Weisbecker wrote:
> >> > But how do we handle global timers that have been initialized and
> >> > queued from
> >> > isolated CPUs?
> >> 
> >> I need to sketch a bit more the solution but the rough idea is:
> >> 1. isolated CPUs don't pull remote timers
> >
> > That's the "easy" part.
> >
> >> 2. isolated CPUs ignore their global timers and let others pull them
> >>   perhaps with some more logic to avoid it expiring
> >
> > This will always involve added overhead because you may need to wake up
> > a CPU upon enqueueing a global timer to make sure it will be handled.
> > At least when all other CPUs are idle.
> 
> Which is true for the remote enqueue path too. But you inflict the
> handling of this muck into the generic enqueue path as you have to turn
> a 'global' timer into a remote timer right in the hot path.

Fair point.

> 
> When you enqueue it in the regular way on the 'global' list, then you
> can delegate the expiry to a remote CPU on return to user, no?

If you're referring to nohz_full, it's not a problem there because
it's already considered as an idle CPU.

But for isolcpus alone that notification is necessary. I'm not sure
if return to user is the best place. I hear that some kernel threads
can spend a lot of time doing things...

But to begin with, is this all really necessary for isolcpus users?

-- 
Frederic Weisbecker
SUSE Labs
