Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD202199EAF
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 07:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747811749; cv=none; b=jlt6hvZlbgur0OZ/y0c2aReYNUGjL2zzG/pyEPwCLrJh8KeBthZKBUhnDR57aXW1OS5YrCpl5nzi4gXn/Jwvfy2uhrSiL2eKal2RhQuf/hxTYGinc/LEBTf4wuBeVzMPivuyqDFwVRFVelNAKyEzv6u8+ZMlhov1Aa/fRS3MjlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747811749; c=relaxed/simple;
	bh=gA7JMUFrVX7kHWp4+NT4hA5M3GXs+c3kZsYIETdRNoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qDLziLU6FD+CSDBabNH89arBU4ObXLlOiOfsHN9d8Z/LNvxGpD3dHoAQ8E4WQOJ/2Da769+zBD8tSYB/pZL0L4e+bMupa0NUrCowVwP5ot+kapwXcqJQ2ywBijO1BX16nvBBIkNM6p5qhIZi0W/kskBXemlx+HaUOCVYmHU7uXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=KGGuPMHO; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=iWmNelXV; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="KGGuPMHO";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="iWmNelXV"
Date: Wed, 21 May 2025 09:15:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747811746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OH1fa8c6X9JHc+30hxlyGzLr56PYrUI+NF1KY/xlfnU=;
	b=KGGuPMHOqKytMQDivTy8Z/6cGp+3u2LVS3vHujQU1/5at4Xz05oD1Z6Uuvkf0MJcTwUdoS
	KXDF2urP6aYHh9PkygCyL7BGQ4Tg8gxez4Idw5SRmYsHRDZDHwcgr6QROWKB5conO3AKrc
	S22LK2Xw0S+AmTZEwKDIlrvHVfyVdrEgO3TxjSjXlctFKFkXn6bvbo6LMDl3HD8SerBR4O
	stObWI7QGWANSYWVOJEX+0FoEzpgcyTlQnXG+BGha0dwKQzs6WIliJC1IYfp/RS8tSzo9M
	yTrmd/2iCpEsj8BM31OAhlH1ihpR1HU4qVzE0rjNxytGBYVNkMGQZNgEduUSVQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747811746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OH1fa8c6X9JHc+30hxlyGzLr56PYrUI+NF1KY/xlfnU=;
	b=iWmNelXVm3fQFybGt3Ij+g1PlgTeInoGXBH1ePV33X/PA2EB7CqE3uGbYvgPNtMXA4AOqF
	IiQb2cqjfEXqm6CA==
From: Nam Cao <namcao@linutronix.de>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Tomas Glozar <tglozar@redhat.com>, Juri Lelli <jlelli@redhat.com>
Subject: Re: [RFC PATCH v2 00/12] rv: Add monitors to validate task switch
Message-ID: <20250521071544.1adrW9ry@linutronix.de>
References: <20250514084314.57976-1-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514084314.57976-1-gmonaco@redhat.com>

On Wed, May 14, 2025 at 10:43:02AM +0200, Gabriele Monaco wrote:
> I'm keeping this as RFC as I'm planning to make it ready after merging
> the LTL series [1]
> 
> This series adds three monitors to the sched collection, extends and
> replaces previously existing monitors:

What is your base? I cannot apply the series (maybe because I'm illiterate
on git...)

$ b4 am 20250514084314.57976-1-gmonaco@redhat.com
...
$ git am -3 ./v2_20250514_gmonaco_rv_add_monitors_to_validate_task_switch.mbx
Applying: tools/rv: Do not skip idle in trace
Applying: tools/rv: Stop gracefully also on SIGTERM
Applying: rv: Add da_handle_start_run_event_ to per-task monitors
Applying: rv: Remove trailing whitespace from tracepoint string
Applying: rv: Return init error when registering monitors
Applying: sched: Adapt sched tracepoints for RV task model
error: sha1 information is lacking or useless (include/linux/sched.h).
error: could not build fake ancestor
Patch failed at 0006 sched: Adapt sched tracepoints for RV task model
hint: Use 'git am --show-current-patch=diff' to see the failed patch
hint: When you have resolved this problem, run "git am --continue".
hint: If you prefer to skip this patch, run "git am --skip" instead.
hint: To restore the original branch and stop patching, run "git am --abort".
hint: Disable this message with "git config set advice.mergeConflict false"
