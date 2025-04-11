Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5B6221286
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 11:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744371071; cv=none; b=qKd+6hQkXxFtzyOruxRBjA3zjtu845pF9hDd9GM+HjRiZztajmIa49M4uzNIcIGfp6WuNMnmCcfJ7xeqmahDuuWwiqjblhflfgZZpD7e/g3wmNLpIfkSsodwElWzW05NPFohffusXa/drEfgA22ds8NO0PLkn340h4SNvb1mpVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744371071; c=relaxed/simple;
	bh=3wwzeZe7YgOPFZVscO1oWOJ4ZjyPE7N5E4MQE8+UbzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RhesR12ynRWXFAWNwIuPEb+YyYkwKR4sKQfbB3QKbnh0bgxpfPEjyymAw7IUFmP6hreyXwoYCOgXJbamsOGdWf9bLynoCW9V1dVIj1HHvy8qC4fsIP8TQHy+CfEImpCoEL6i1Kg7JgictjNszpOkM82kQY6boZH7L3OShLOTkAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j9PetaWx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j9PetaWx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68641C4CEE7;
	Fri, 11 Apr 2025 11:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744371070;
	bh=3wwzeZe7YgOPFZVscO1oWOJ4ZjyPE7N5E4MQE8+UbzE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j9PetaWxJkgCQVHPZ2qcES2qak4QbKd0qiK41rYrR2C+tmHV0T4oZGOn3SMtcvpFD
	 liBWi4dFeMgp/v0Yrm61Qx9P5Hvq/5/LXnlsPVXZQJApoSTTEZ6bJsmvZwrmcvD2HC
	 zxu14jKiPvWdyR3zDArNIb63Q4GwywB9HsIYWRYnoP2Qfq2QkjOufbjAvvkwqFvLEq
	 RZF/n+wm4rjdX8msaRC9JbHsxlmAod7fFNiioaoUC0jKirU8nd5ckIS/V9SpGKeDhY
	 hvPunDH1TlLK7kHzqYHqHkciu7JEZHhmIMRQ0/jH04QqFBn8FCy1x8UnyvnDH0jJrf
	 +vidL7pqfOMJw==
Date: Fri, 11 Apr 2025 13:31:08 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH] timers: Exclude isolated cpus from timer migation
Message-ID: <Z_j9fOxE4Ia79dtz@pavilion.home>
References: <Z_fBq2AQjzyg8m5w@localhost.localdomain>
 <87wmbsrwca.ffs@tglx>
 <Z_fHLM4nWP5XVGBU@localhost.localdomain>
 <4fdc6582c828fbcd8c6ad202ed7ab560134d1fc3.camel@redhat.com>
 <Z_fTmzdvLEmrAth6@localhost.localdomain>
 <56eae8396c5531b7a92a8e9e329ad68628e53729.camel@redhat.com>
 <Z_fcv6CrHk0Qa9HV@localhost.localdomain>
 <1c60e19d1cebc09a8fd89f073c3dbec80c8ddbf1.camel@redhat.com>
 <Z_fkgN1ro9AeM1QY@localhost.localdomain>
 <75607f0eb5939bf1651ff2e6c3eda4df2b4f26f0.camel@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <75607f0eb5939bf1651ff2e6c3eda4df2b4f26f0.camel@redhat.com>

Le Fri, Apr 11, 2025 at 09:08:35AM +0200, Gabriele Monaco a écrit :
> Mmh, my patch is in fact allowing isolated cores to still migrate
> everything if they go offline.

Sure that doesn't change.

> 
> However I don't think housekeeping CPUs can execute remote timers on
> isolated ones.

I'm confused, a CPU can't execute something on another CPU (except with
an IPI). But:

Before your patch, a housekeeping or isolated CPU can pull timers from
any other CPU and execute them on its behalf.

After your patch, a housekeeping CPU can only pull timers from other
housekeeping CPUs. And isolated CPUs each execute their own global timers.


> That is not a problem for offline CPUs (they won't start
> anything and do the migration while offlining is enough), but we should
> allow it here.
> I may be missing something, but isn't it what [1] is doing?

That's only something that avoids pulling timers from offlining CPUs.

The real migration happens at timers_dead_cpu(), which is called
directly by cpu_down() / cpu_up() callers context. And timers are
migrated to the current CPU, which is fine if cpu_down()/cpu_up()
are being called from a task that is affine to housekeeping.

Thanks.

> 
> Thanks,
> Gabriele
> 
> [1] -
> https://elixir.bootlin.com/linux/v6.13.7/source/kernel/time/timer_migration.c#L976
> 

-- 
Frederic Weisbecker
SUSE Labs
