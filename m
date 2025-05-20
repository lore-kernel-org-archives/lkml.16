Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23A11D8DE1
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 20:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747772396; cv=none; b=TAGE3q8byBsYWpZ8XN4241mmhVvI6p5E0wJwlY31j6Ya/Bj4njfETRENGK7j1vaBUbpPXIfpNpoinSemUX9w4wmvGu9Rbg7gvvpk/XRwNc7/rCGO2b4yOGuKfOPFor8MCMb84lTJj3pieejbC8+DWPeysywiQrSLfx48rT7f8+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747772396; c=relaxed/simple;
	bh=bMLv8nsok5tZlpnaEGxfph0R34j++0XjMwAwsz81dus=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=umJwY8wLNmALiLryR8sGr7Uye3+QxTNMCDtzU61/adV2j/aqdUjXsd/qLz6X9na6qenNuaKwv/T8OehiYucXQlmtZUMRAV6E0NQFTpM0BfR1NwltH/nOTdh+25OFn4oWiuMA6M04XrqTe3JiANwGO3yXm+UdSAkle2Rii4nQSPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DCFEC4CEE9;
	Tue, 20 May 2025 20:19:54 +0000 (UTC)
Date: Tue, 20 May 2025 16:20:35 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Prakash Sangappa <prakash.sangappa@oracle.com>
Cc: Madadi Vineeth Reddy <vineethr@linux.ibm.com>, "peterz@infradead.org"
 <peterz@infradead.org>, "mathieu.desnoyers@efficios.com"
 <mathieu.desnoyers@efficios.com>, "tglx@linutronix.de"
 <tglx@linutronix.de>, "bigeasy@linutronix.de" <bigeasy@linutronix.de>,
 "kprateek.nayak@amd.com" <kprateek.nayak@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V4 1/6] Sched: Scheduler time slice extension
Message-ID: <20250520162035.7855e94c@gandalf.local.home>
In-Reply-To: <3EF0AA39-2C51-4E70-975C-CF8BBF27DAE4@oracle.com>
References: <20250513214554.4160454-1-prakash.sangappa@oracle.com>
	<20250513214554.4160454-2-prakash.sangappa@oracle.com>
	<ddc80d60-0cea-4e07-a4ef-fb21d5f5a0fa@linux.ibm.com>
	<E2C65493-D9C0-42E5-A8C5-091FE2394216@oracle.com>
	<20250515050159.3dbba5f5@batman.local.home>
	<3EF0AA39-2C51-4E70-975C-CF8BBF27DAE4@oracle.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 20 May 2025 16:52:20 +0000
Prakash Sangappa <prakash.sangappa@oracle.com> wrote:

> But the thread has to make the sched_yied() call. The behavior of which
> will be different if called in the extended time vs not. Assume this is ok.

I assume it is ;-)

That's because the only time user space should ever call sched_yield() in
an extended time slice is because it wants to tell the kernel it doesn't
need it anymore. If that's not the case, that means one it's using the
extended time slice and calling sched_yield() for some other reason, which
doesn't make any sense.

-- Steve
