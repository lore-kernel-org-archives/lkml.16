Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F952BEFE2
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 09:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751620689; cv=none; b=UJh6Iv7EaoYTuaSBmbgCJQv8+E22L1ZpBMqGXHgVpTTlgaL7654mq2bbgVPLBo8yedT1fS+NBQSibMG0IajDYYbMn8Ypyea0oq9iJE0z6BFauzlkNdzhl1rw8pbtZq9Pk4MkeXzh3POiZn7S48V3DNgMGRlTeCGY1Uz5ce5v/cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751620689; c=relaxed/simple;
	bh=2au/gMRCvrmAaOABc+n1ZlTVUslMjpC+yNB15/DeTAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gW17jIv7zzbCX/02R4dwGNWQAQnExDFPsnT0Cvzg5KhLit+8nQGtblZaRpc7oAbQZjF8i1vnX4MCewRzX9zmcwVwprmmcdaB+wUaSuN2SmxZJldo4b1IwJBQIYzTpKpyE7QRHOtgyqm3q0qUHwcGnFQm9Q9HpBoH0x9eHb1yCeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=kmQxVkxf; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="kmQxVkxf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VxKvUiqHO/R0peFfP7EpC2bNw/E2RpR5Zdg2uyWV9uo=; b=kmQxVkxfMPNplcHW+e9frl02Fz
	ciQV6f7ILAA5svpExyFiWrrkjjj0DjLroRcRnhaWtqy9cakLEGmCjgDc6enslh/7yoqYjkRONTni3
	VIqKxOYvzgrk3+kPCwRUD3DP0FkSE/M8oTqJLVOIOYNWgMRnsr8qWz3zR/LaT4WbnI/uZ/u4eoA4d
	+WgFZD7gz0p+0CFkU1cZb0zSi2TGFKdRMqXEeF4Qmp08Ma3YoUMtTbkK4dTVcjCkRjp4SuC3a78j/
	fkx6T/EG3jlzA4ogNnCUO52UBh1IxtCUnA8687wm/zudlAcVOhdVFn72CFnxQHjMMUYvFJNj2fGRm
	OVNt9Bgg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXcYR-00000007trA-2JWX;
	Fri, 04 Jul 2025 09:17:59 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 8039D300220; Fri, 04 Jul 2025 11:17:58 +0200 (CEST)
Date: Fri, 4 Jul 2025 11:17:58 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Adam Li <adamli@os.amperecomputing.com>
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, cl@linux.com,
	linux-kernel@vger.kernel.org, patches@amperecomputing.com
Subject: Re: [PATCH 0/2] Fix imbalance issue when balancing fork
Message-ID: <20250704091758.GG2001818@noisy.programming.kicks-ass.net>
References: <20250701024549.40166-1-adamli@os.amperecomputing.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701024549.40166-1-adamli@os.amperecomputing.com>

On Tue, Jul 01, 2025 at 02:45:47AM +0000, Adam Li wrote:
> Load imbalance is observed when the workload frequently forks new threads.
> Due to CPU affinity, the workload can run on CPU 0-7 in the first
> group, and only on CPU 8-11 in the second group. CPU 12-15 are always idle.
> 
> { 0 1 2 3 4 5 6 7 } {8 9 10 11 12 13 14 15}
>   * * * * * * * *    * * *  *
> 
> When looking for dst group for newly forked threads, in many times
> update_sg_wakeup_stats() reports the second group has more idle CPUs
> than the first group. The scheduler thinks the second group is less
> busy. Then it selects least busy CPUs among CPU 8-11. So CPU 8-11 can be
> crowded with newly forked threads, at the same time CPU 0-7 can be idle.
> 
> The first patch 'Only update stats of allowed CPUs when looking for dst
> group' *alone* can fix this imbalance issue.
> 
> And I think the second patch also makes sense in this scenario. If group
> weight includes CPUs a task cannot use, group classification can be
> incorrect. Please comment.
> 
> Adam Li (2):
>   sched/fair: Only update stats of allowed CPUs when looking for dst
>     group
>   sched/fair: Only count group weight for allowed CPUs when looking for
>     dst group
> 
>  kernel/sched/fair.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Hurm... so the thing I noticed is that update_sg_wakeup_stats() and
update_sg_lb_stats() are *very* similar.

Specifically, the first patch does something to wakeup_stats that
lb_stats already does. While the second patch seems to do something that
might also apply to lb_stats.

Is there no way we can unify this?
