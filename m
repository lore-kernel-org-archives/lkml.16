Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38701285C87
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750249334; cv=none; b=gXJrqblSr4Kk1YJQaTpvgv3rdFh7WxUJeA42jux7G0qNdGtirLFItJESZ8yGKfn3u6Y91ETIjd+eJWYY7EDstZgx08WsSrbEm3H/MwVzx5Q67HV6evX3ThJHyf0sMX9xL3471rKNlkATi6/aCSuGjM501OS9zMGjueX7msoJvmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750249334; c=relaxed/simple;
	bh=JVE/+3sgH3e9JCWN+l4e4TPxHLMo4/QTyRIKzNqrJBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=igsAWb66hWK6APuuu/lqkU1H1bCV6faQ/qZC0caPHHykvLb6CvgiwW94LRDOsU2ZGcC03tEPxhl4khJjmd2DhlHdz23JDmFm3cnYySUB6dXfuI9DU0N73l3ZM27PYmjBBKf9Q3shQB4y9/XjmnR8uiTYmaQATgq3zcsPJ8aaThs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eaJnwTE7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eaJnwTE7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3F8BC4CEED;
	Wed, 18 Jun 2025 12:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750249334;
	bh=JVE/+3sgH3e9JCWN+l4e4TPxHLMo4/QTyRIKzNqrJBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eaJnwTE73J31a7yBaU3MBP7RB9KhCQVL2ec+avCaSzaS/Fnh4UI/IUi7NWpGfz6KW
	 RfJ07Y0et+SYSCHXM1GpASH93CvmDFXkE4fPFj23BGHKfu5KqDe8ijCwgvjYTNYUdn
	 5pr+rr/UEtkykAxWD0k8AnMWmdxG7mAgyjeXrDsvUEL6DwWGXKmdvBUFWGYc0sVwH7
	 HDKfHKUKHbi1HvigG14lJA6JVWeMDOWefd3CQ+6LgpFJyrIrwVaozXrZ4DJVN9GRo3
	 hf+//19mFW6bzaTl5flZODKEo3xy45Y6JrugLc+tSbDoLInwRWhejO9W6tPhO3YwJn
	 C7ap3xyDPu5Wg==
Date: Wed, 18 Jun 2025 14:22:11 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v6 0/6] timers: Exclude isolated cpus from timer migation
Message-ID: <aFKvc6FK9CH5BsNH@localhost.localdomain>
References: <20250530142031.215594-1-gmonaco@redhat.com>
 <d9e3238e78a0384a6ba0651574522f44c6f2fb76.camel@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d9e3238e78a0384a6ba0651574522f44c6f2fb76.camel@redhat.com>

Hi Gabriele,

Le Wed, Jun 18, 2025 at 02:17:29PM +0200, Gabriele Monaco a écrit :
> On Fri, 2025-05-30 at 16:20 +0200, Gabriele Monaco wrote:
> > The timer migration mechanism allows active CPUs to pull timers from
> > idle ones to improve the overall idle time. This is however undesired
> > when CPU intensive workloads run on isolated cores, as the algorithm
> > would move the timers from housekeeping to isolated cores, negatively
> > affecting the isolation.
> > 
> > [...]
> > 
> > Exclude isolated cores from the timer migration algorithm, extend the
> > concept of unavailable cores, currently used for offline ones, to
> > isolated ones:
> > * A core is unavailable if isolated or offline;
> > * A core is available if isolated and offline;
> > 
> > A core is considered unavailable as isolated if it belongs to:
> > * the isolcpus (domain) list
> > * an isolated cpuset
> > Except if it is:
> > * in the nohz_full list (already idle for the hierarchy)
> > * the nohz timekeeper core (must be available to handle global
> > timers)
> 
> Frederic, Thomas, Waiman, would you have time to review this series?
> Thanks,
> Gabriele

Yes, sorry I got distracted with other things (although quite related).
I will give it a priority soonish!

Thanks.

-- 
Frederic Weisbecker
SUSE Labs
