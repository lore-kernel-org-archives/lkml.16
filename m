Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763E628D84D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 14:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744296232; cv=none; b=BAJL8aqgiY7h+X9NgcKHQhqp60FYp7s/O2di0bdVsaeTN7uWlD0AVOsj+pynu9NacY4E21K/aIrHGKtheBRNY0w4CPMxkBjFVk397HDGSwdHw57OWxtug2kqduMe/vWr5aRP4+NxVD7q45dabnojZT9IEXmyjZ7jIEvfhPd+y4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744296232; c=relaxed/simple;
	bh=xAuiSTkrkcSKLugsuwfGK1c08uM4VX03pD0uOicYexM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S5Kb7fuhqXPgBeDpj7pQ6i6kFhBB2w0i8tadHcJkUIYnj4yCkp5ncxzEhfLCGHsrcxzaEDYdfbR6A8pZqjL/bI9C+trV9LAdgojdIJT5OJ89lgRG6EvU6pfJYU7wbzS6WirYbJQDIENC4eui8YtZqN390IPwBurect/AhzsR2D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TKYwo7gX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TKYwo7gX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A83D5C4CEE8;
	Thu, 10 Apr 2025 14:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744296232;
	bh=xAuiSTkrkcSKLugsuwfGK1c08uM4VX03pD0uOicYexM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TKYwo7gXgoy2zEs/AJFN2YufvqNd9Lo0y8zN9OUuNmYu5xsOOhGRdE8HkhsqCsMnM
	 bTOQjMEIc2PjhBP8abrHHF4HZpyppkSPlxSO/evkbAvcDQdQP9C34o0jthwUR5eW8T
	 CIVdoIc5bsChCUJyIF7+8Kq8Uw2deYQyHgC2KtWUsWnSdDhEGrNTnujiMmhENea7hS
	 f4lyLijI/WAvWUhBDvt+G7X531U5j2uzoTWxxIzfldjxiXz+G1U2PtmeyCJ2qVigD0
	 aQiw/WmglLtqX/TPzEt5GHo+KsXSKSIyuy1z9aYKEmJQf8ZAa6iOyg3PWJM31Ruo9G
	 vWnXQ+yxuYh3A==
Date: Thu, 10 Apr 2025 16:43:49 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Waiman Long <llong@redhat.com>
Cc: Gabriele Monaco <gmonaco@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] timers: Exclude isolated cpus from timer migation
Message-ID: <Z_fZJfgwzpz_ccny@localhost.localdomain>
References: <20250410065446.57304-2-gmonaco@redhat.com>
 <87ecy0tob1.ffs@tglx>
 <2c9d71fd79d7d1cec66e48bcb87b39a874858f01.camel@redhat.com>
 <Z_fBq2AQjzyg8m5w@localhost.localdomain>
 <77988036-7550-4ee2-a738-9f9bd4417001@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <77988036-7550-4ee2-a738-9f9bd4417001@redhat.com>

Le Thu, Apr 10, 2025 at 10:35:55AM -0400, Waiman Long a écrit :
> On 4/10/25 9:03 AM, Frederic Weisbecker wrote:
> > Le Thu, Apr 10, 2025 at 12:38:25PM +0200, Gabriele Monaco a écrit :
> > > On Thu, 2025-04-10 at 10:26 +0200, Thomas Gleixner wrote:
> > > > How can that happen? There is always at least _ONE_ housekeeping,
> > > > non-isolated, CPU online, no?
> > > > 
> > > In my understanding it shouldn't, but I'm not sure there's anything
> > > preventing the user from isolating everything via cpuset.
> > > Anyway that's something no one in their mind should do, so I guess I'd
> > > just opt for the cpumask_first (or actually cpumask_any, like before
> > > the change).
> > With "nohz_full=..." or "isolcpus=nohz,..." there is always at least one
> > housekeeping CPU. But with isolcpus=[domain] or cpusets equivalents
> > (v1 cpuset.sched_load_balance, v2 isolated partion) there is nothing that
> > prevents all CPUs from being isolated.
> 
> Actually v2 won't allow users to isolate all the CPUs. Users can probably do
> that with v1's cpuset.sched_load_balance.

Perhaps, and I think isolcpus= can too.

-- 
Frederic Weisbecker
SUSE Labs
