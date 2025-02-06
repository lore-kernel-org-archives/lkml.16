Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62B1238B48
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 17:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738861395; cv=none; b=PuvhKIp0Cjb+le8H+zOUAktNVcGGvnmGik4jJ92ILzFsAOQM8V+6PLljoHGsJMJadJFXU/niCM+ocg3UqhJYlci9Zq7xaYqD4VRJcsHJiIeypOPeJzPflJqusV3UoWsQ5I+FtUiyrlf8brTkCzUfEYFlVIKrQlQ0k98uk0pG08s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738861395; c=relaxed/simple;
	bh=995lWaHdfV3RC5yCcqnXTphzeBDjFKl/Qex9L/YN4Bg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c584MF5rFiKnPfJjKaKlc0jfZ+ul37cQJo0yqFl8DyAxnyABli8x/M7TE3iOrimF02erTY4FZQoltkidAkEtPUiUzFfqP+kkoEuJt//L9ycyZx/hwTM/I6qhX6hPQHZMqd7WV6bDW9VJXdCI3b5MtZ1DgRo9X17Dh+lMZD+FhZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XoHJoMbH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XoHJoMbH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0480FC4CEDD;
	Thu,  6 Feb 2025 17:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738861394;
	bh=995lWaHdfV3RC5yCcqnXTphzeBDjFKl/Qex9L/YN4Bg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XoHJoMbH//dL7x66cTI/S6KCRBfR13ZkbfYaHl21OeSLZKnvTVHgQX/RoydNfB+XW
	 7SYCUYSXZsvw/4OF9ix3jxdEGAlJa1UXS20Ojqx4Vxtx7VTO/UiQgCGuhVUuu2ghHs
	 j7cesOODhRd3/qpMt0zrDPboEX1Ms98uULEP7jTqo89Kmm9wlwTWuyBD2TkYpfSDJS
	 1PosIU5ZzuIA+GUVgOFVFesD0vQhwnAxFk8a7gnz7hWbUZGgG3+mCV+gTSnH40XCrB
	 VGYgSixqGpfJawFVImXrRt++2s0iFa3ruEL8/MRSMdezH25Wt5Hzhw0JSbPPgFXQLz
	 RZxWQDtwjUFCg==
Date: Thu, 6 Feb 2025 18:03:11 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Mateusz Guzik <mjguzik@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] exit: change the release_task() paths to call
 flush_sigqueue() lockless
Message-ID: <Z6TrT3XyWgiBg0jS@localhost.localdomain>
References: <20250206152244.GA14609@redhat.com>
 <20250206152314.GA14620@redhat.com>
 <Z6Ti-AoQC6EQzPWO@localhost.localdomain>
 <20250206165527.GD5209@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250206165527.GD5209@redhat.com>

Le Thu, Feb 06, 2025 at 05:55:28PM +0100, Oleg Nesterov a écrit :
> On 02/06, Frederic Weisbecker wrote:
> >
> > > TODO:
> > > 	- we can probably shift posix_cpu_timers_exit() as well
> >
> > Hmm, can't a timer be concurrently deleted between __exit_signal() set
> > tsk->sighand = NULL and release sighand lock, and the actual call to
> > posix_cpu_timer_exit() ? And then posix_cpu_timer_exit() calls timerqueue_del()
> > on a node that don't exist anymore?
> 
> Can't answer right now, I will think about it when/if I will actually try to
> make this change ;) This "TODO" note just tries to explain what else we could
> try to do, and "probably" means that I am not sure yet. I can remove this spam
> from the changelog, but I'd prefer to keep it as a reminder, at least for
> myself.

Sure!

And thanks again for the patch!

> 
> > Reviewed-by: Frederic Weisbecker <frederic@kernel.org>
> 
> Thanks Frederic!
> 
> Oleg.
> 
