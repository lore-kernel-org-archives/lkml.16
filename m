Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FCC20102D
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 12:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750509631; cv=none; b=Fc22jHNz8DjPC1igHnYAUCbBEal9mQ4xtQek4BYTra0omRya3I12FFz6xzggwH9wNGzGrDA/hpo8JksFaUe63oD//jeimAUIbHCsVbiVhafx5OTw2FAY0k4DgjdHs8WuZz5d7g6eVzn8KAeDrkpFyJEYCo05jhZ+1PuXtXoh0pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750509631; c=relaxed/simple;
	bh=wAk9GOJiRwzIF/A671Am8C6yqQ9uyMzmIQJdyaBXuSs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QyYs3HMA1vJ+F+YkqYV2G9hPMt8HseDrFYiidx7CUBP5H020IyjorCaPeeCGcdH2iEqwdo5zNekwBGPQd4/qpbSE2AQN2O39ECUE+0thlD6WHO5NJnb6CTPkoJ8yhYYJcT9EZkqcpvIhzGY+AhTuWzjKjHW+5euZsFlJQNinTyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TBvIApEu; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TBvIApEu"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2349f096605so40607575ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 05:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750509629; x=1751114429; darn=vger.kernel.org;
        h=mime-version:user-agent:references:in-reply-to:subject:cc:to:from
         :message-id:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X53vOJjIymMVYj3rg5nCjdf5UDKh2QhE/Cj2wkuLezE=;
        b=TBvIApEu8cAz5XPTywuGqcyd+y+us0FhBf2wGrVn/m9239gDkKqTAH0tlERRpYcNwV
         StFx4+6VMUXDl8ao5op1ylx7pi1j7OWfTUoDTY90VynG0FJPOrk9mNaF9MwK0p7zxu91
         et8Z84LS7QJgCX4WsCN6t+RON87FucjR8ssJ7+pjEsKE7Gr97Qe+o1+WvwnI1qvr0jnF
         BqyIgnhnyEA/W1b626jy5m2WvtZhuI0xB60RpPojD71dFRi46K004nw5sLzcmuJZv/CQ
         oscpiIHhBQmV+43BCOBtPTK5K8hJHMM9A2kCvQSfAr8A3JkZhLZqkKgH0zzjzFHJ+Tp7
         WUeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750509629; x=1751114429;
        h=mime-version:user-agent:references:in-reply-to:subject:cc:to:from
         :message-id:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X53vOJjIymMVYj3rg5nCjdf5UDKh2QhE/Cj2wkuLezE=;
        b=uyXvP4rbGpKWRd3emiWpSrOGpUQewMJgQQrgoBjudOUkEKtf6WK9g5ddbNwnDHwsxy
         CocRUiZmhHbq4lRfVmm1oOiEWPHNcBAWiR+Syz2fz9Gar34ezO1juJ7ZTD1heHPKEupL
         ZlRWN4PE8iESKyhIFvRYKZQ94WPz3gkFqI0rKyeMHFEExECdLoSHwRlY8Dh8aEvDZS2u
         INVN8rMrzxLfhV3TTT2OpCL67n5UZb26QVXd3DP4h/+Nssa8EJtb+8JoxFaLvq0bXkCr
         o5SGPgQe7HEgAxf4osODrqBcheorMspwGoEVaDgccFaZKRb7EyQVON7S+WK7BM0bTrAJ
         Gh0w==
X-Forwarded-Encrypted: i=1; AJvYcCXf9aBMllY8laafGtas84b3JI4YbUXy5toCy4IpQmSS93L2H2YIYXcdUEz6o+4pHuYu/aQTMhJfftKPkhM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy08Nlxze2/qqSQ4rerpXs2bOlh9UhhPOUUN9Cbn/SE7IMxMsJ2
	jnOk59vklKA9ujq2Iq5N/AtbPgG7PfIptFVl/ygFDaWbZ9j7SeGZZMWO
X-Gm-Gg: ASbGnctYjYQWaQDTYI2k62Ojc/T+r1M4cMBh69U3wW45LuzO8bpBiIByJdZy2bNMUz1
	pJuW/A/pXfJFESl9cH/I1pWm0dFSd/kF7AyKKLNrGu50KVfIy9UnuJd/kO2TVSsv6gV++Wf48V/
	pWCUMiT4JKVJzcsuxwvZrDzP58ibB9QveCLPp0kslVSwCEdWRLCjTg/pdLKOQTLuPdmOBufhnsP
	8aWh18ZIFH/7DrPodANkY2TI0KEjuPQRGdgNknuwKvKg3Yomm3mhOKh0yHcrQltDEItxRMvI1KZ
	kH0wJAqr3SX3jxycNydmPCDNJNHk1h7zicMFfwjd5nAEbRYtnxL0xVazgajMeSwYaj+UTVTzm77
	yYgUXkNO7ZCmbAefOZAFq4uLhWRZyECO993EdSDfHrOoBl4/2
X-Google-Smtp-Source: AGHT+IG6rnMFp0fPbWQL97P6anz8S84CbsAQpI5tkYA8t300ZsC8H2blMYMaqz/RjZW3WG8e7tkf/g==
X-Received: by 2002:a17:902:d58d:b0:235:ef56:7800 with SMTP id d9443c01a7336-237d9917c20mr84978105ad.30.1750509628618;
        Sat, 21 Jun 2025 05:40:28 -0700 (PDT)
Received: from mars.local.gmail.com (221x241x217x81.ap221.ftth.ucom.ne.jp. [221.241.217.81])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3159df71ea8sm4210760a91.7.2025.06.21.05.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 05:40:27 -0700 (PDT)
Date: Sat, 21 Jun 2025 21:40:24 +0900
Message-ID: <m24iw95kuf.wl-thehajime@gmail.com>
From: Hajime Tazaki <thehajime@gmail.com>
To: benjamin@sipsolutions.net
Cc: linux-um@lists.infradead.org,
	ricarkol@google.com,
	Liam.Howlett@oracle.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 04/13] x86/um: nommu: syscall handling
In-Reply-To: <d1d08a207844b98d0beba96f48beaf73e30c3bd2.camel@sipsolutions.net>
References: <cover.1750294482.git.thehajime@gmail.com>
	<bc5a2a14d41add7a2a44b12a21d9ccfa68a6baa5.1750294482.git.thehajime@gmail.com>
	<d1d08a207844b98d0beba96f48beaf73e30c3bd2.camel@sipsolutions.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/26.3 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-2022-JP


On Thu, 19 Jun 2025 19:31:53 +0900,
Benjamin Berg wrote:

> > diff --git a/arch/x86/um/nommu/do_syscall_64.c b/arch/x86/um/nommu/do_syscall_64.c
> > new file mode 100644
> > index 000000000000..5d0fa83e7fdc
> > --- /dev/null
> > +++ b/arch/x86/um/nommu/do_syscall_64.c
> > @@ -0,0 +1,37 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +#include <linux/kernel.h>
> > +#include <linux/ptrace.h>
> > +#include <kern_util.h>
> > +#include <sysdep/syscalls.h>
> > +#include <os.h>
> > +
> > +__visible void do_syscall_64(struct pt_regs *regs)
> > +{
> > +	int syscall;
> > +
> > +	syscall = PT_SYSCALL_NR(regs->regs.gp);
> > +	UPT_SYSCALL_NR(&regs->regs) = syscall;
> > +
> > +	pr_debug("syscall(%d) (current=%lx) (fn=%lx)\n",
> > +		 syscall, (unsigned long)current,
> > +		 (unsigned long)sys_call_table[syscall]);
> 
> You probably want to drop the pr_debug from the syscall path.

okay, I'll update those parts.

> > +	if (likely(syscall < NR_syscalls)) {
> > +		PT_REGS_SET_SYSCALL_RETURN(regs,
> > +				EXECUTE_SYSCALL(syscall, regs));
> > +	}
> > +
> > +	pr_debug("syscall(%d) --> %lx\n", syscall,
> > +		regs->regs.gp[HOST_AX]);
> > +
> > +	PT_REGS_SYSCALL_RET(regs) = regs->regs.gp[HOST_AX];
> > +
> > +	/* execve succeeded */
> > +	if (syscall == __NR_execve && regs->regs.gp[HOST_AX] == 0)
> > +		userspace(&current->thread.regs.regs);
> 
> That said, this is what I am stumbling over. Why do you need to jump
> into userspace() here? It seems odd to me to need a special case in the
> syscall path itself.
> Aren't there other possibilities to hook/override the kernel task
> state?

thanks, I found that this is a leftover of our early implementation
which doesn't have a proper schedule upon an exit from syscall.  we
can remove this part and I'll fix them after more investigation.

> > +	/* force do_signal() --> is_syscall() */
> > +	set_thread_flag(TIF_SIGPENDING);
> > +	interrupt_end();
> 
> Same here. The MMU UML code seems to also do this, but restricted to
> ptrace'd processes? Maybe I am just missing something obvious …

nommu doesn't have separate process/context to indicate a schedule to
the context here (syscall).  without that part we do not have a chance
to schedule tasks and signals to userspace.

But the force on SIGPENDING flag is not actually needed so, I'll
remove that part.

thanks for pointing out.

-- Hajime
