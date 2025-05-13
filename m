Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513AC1EB5E5
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 09:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747130246; cv=none; b=B152SbZlp1ffcXenOEn23NW8uHBy8tBKOO50dPXruS1EBygK1mf5pUGFEkwTrlI10Op86prDNwiyfGMuAvGn9KslAO+vTahrm7vAj0OtbysBN6iMXoVNcAIyjlBfYgb9UwzzIfuzNxDG1XOp5hvqYQhrX0wEPFjnLzhguakjFBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747130246; c=relaxed/simple;
	bh=y1vwBESWiR/qW5iNS3tKc9lSlFHyvqwd0ZJTvUI/6eY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NVmMowK2hKPT/ouuZ1SAVnoiyyQtaINZwViEtKc8hEmw0WYvF7boM+FT+BL4z0quFgXpIEmNvQ17nmyQLssbJIayPIFBvhNlhGsIZW9WRqFr2TiIgSB9I8k+Yp7UzpGynvBdHDJDssk0k/9K2e0Vgqrlmt9tm3OZEFxcdwI0dNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=N6Gt5dYM; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="N6Gt5dYM"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ad21c5d9db2so693122166b.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 02:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747130242; x=1747735042; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5hDg10QShDmWMapzldNJZV4UHtOzf2fHPXWTwnp16kw=;
        b=N6Gt5dYMlZuYB57q39ro95y72vjXs9vIxk0iMSbYOe9Cup8ctqlHKXGpGK6V8yipG+
         GHdqMHGqp/cz897M8mDYLxEbw2MLgUXS2Md84d8JqtLgtOC89R2oXcSTMREwhyc1F/bG
         oxsSg/dRrJxtTxwQT9Aq0de6L/yxCEZza9C1za8zRtR9dJ92MpOmyHj27xmM2ppiJ4Pj
         7BBmsiSNnmdPFQEKCPBxvjJgI4x/KRLHxmtZvefvdUxXPO8f9gGXl/CDjrdq58OHMFPE
         Ylq0Tx0VtIayQsOz6hgOD94AP2YCJR+jv9pxvkfdha9REbTFKVDomzYo9fWblgCWcVnX
         bWdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747130242; x=1747735042;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5hDg10QShDmWMapzldNJZV4UHtOzf2fHPXWTwnp16kw=;
        b=CFs2E5tQrJX5ErKAbmyLO7TAl4D7EdZcWgQwOfnX93gx8etAaTh0tykgoom/cDvPiN
         DDuGsrNiR0Bhb2DkqCH9Mf5+3lE8tc7iVdij8Zxyxo8OY/HnK3zvjOAgciB5Vx6pfILH
         4coJQutsKkuTFntd5k/LZI2QMhtB0uYxl306fVuLBsdJdLqSBVyxUbuT59Y8PISrPnHM
         f9aCPBbIpF2pPAIEhNr8hxVzfvergfEZaO0zquT+agN2IvumCIb7nq0Z9y8qduCpSe+k
         DdCLV/IzZSoGLeZS88cyWu8NRHIIov7yutmqYRZHo8gUu6Dfii0INm+36VAV441kTpXN
         RWUA==
X-Forwarded-Encrypted: i=1; AJvYcCXqJeRRo3WhLLzuDJrxBq5sQuMelP5marbW9JrI9ggpXcxdjF//+tsew5LyZTRb96mSb/h+REtL2INAeCc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxebDTq0p2DHY+HxMZLRTip3UT2qm9hMocoE/2ULfpqoFots89S
	QMCdmrGr0SAGA+Ya/S7Rq3PuN4Pumtv3m54V5xSh8e+VlxMDt2HxwkSYYhjCHM4=
X-Gm-Gg: ASbGncsMlKznNjepYc3bZDXYqZqm/7EC5fClCXIz1mgdK3Z7VPZPYOtY2kF/G+3I6J5
	mbx/lAxFA2TF4vSzKiLDiU87n94QvUnVUoAjs9PMn0MRFsP3WrhnMYchbun1YTYJfHD0CdJCDex
	3FW/QduGj+rw5gr1Jk2NsJszWtpr/Vl51qOsQJbio/pVciAVed34ZSYxNVmrlV8TBwi64CKc2ap
	Lkd8LzlQiXsxbnXnaIH+umLd2fZrQYxbeAEzWdDyd5r9CU4Ih/z/sYySP6WU0naScnNc42UWkGZ
	7ioHZqVYsdczl9ZuR8PocTlYLnEcV1txw/nuojwiTjQ3D18RjnzzTA==
X-Google-Smtp-Source: AGHT+IHG9+PgkMahUVPvu8ZSj/6nXF5iZ3CsK6DKn5ZijQeLHEj9yqvRNYU8HmlnMrbFCVsROIa/gg==
X-Received: by 2002:a17:906:714e:b0:ad2:2569:6969 with SMTP id a640c23a62f3a-ad225698c9cmr1105340566b.39.1747130242464;
        Tue, 13 May 2025 02:57:22 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad224531152sm676929066b.38.2025.05.13.02.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 02:57:22 -0700 (PDT)
Date: Tue, 13 May 2025 11:57:19 +0200
From: Petr Mladek <pmladek@suse.com>
To: Feng Tang <feng.tang@linux.alibaba.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Lance Yang <lance.yang@linux.dev>, linux-kernel@vger.kernel.org,
	mhiramat@kernel.org, llong@redhat.com
Subject: Re: [PATCH v1 1/3] kernel/panic: generalize panic_print's function
 to show sys info
Message-ID: <aCMXf0JOi1g6ZI8u@pathway.suse.cz>
References: <20250511085254.61446-1-feng.tang@linux.alibaba.com>
 <20250511085254.61446-2-feng.tang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250511085254.61446-2-feng.tang@linux.alibaba.com>

On Sun 2025-05-11 16:52:52, Feng Tang wrote:
> panic_print was introduced to help debugging kernel panic by dumping
> different kinds of system information like tasks' call stack, memory,
> ftrace buffer etc. Acutually this function could help debugging cases
> like task-hung, soft/hard lockup too, where user may need the snapshot
> of system info at that time.
> 
> Extract sys_show_info() function out to be used by other kernel parts
> for debugging.
> 
> --- a/include/linux/panic.h
> +++ b/include/linux/panic.h
> @@ -16,6 +16,17 @@ extern void oops_enter(void);
>  extern void oops_exit(void);
>  extern bool oops_may_print(void);
>  
> +#define SYS_PRINT_TASK_INFO		0x00000001
> +#define SYS_PRINT_MEM_INFO		0x00000002
> +#define SYS_PRINT_TIMER_INFO		0x00000004
> +#define SYS_PRINT_LOCK_INFO		0x00000008
> +#define SYS_PRINT_FTRACE_INFO		0x00000010
> +#define SYS_PRINT_ALL_PRINTK_MSG	0x00000020

Please, remove this option from the generic interface. It is
controversial. In the current form, it makes sense to replay
the log only in panic() after all the other actions:

	console_verbose();
	bust_spinlocks(1);
	panic_other_cpus_shutdown(_crash_kexec_post_notifiers);
	printk_legacy_allow_panic_sync();
	console_unblank();
	debug_locks_off();
	console_flush_on_panic(CONSOLE_FLUSH_PENDING);

All these operations have some (side-)effect which increases
the chance to actually see the messages on the console.

I think that it was primary meant for graphics consoles. But there
it would need to be used together with printk_delay
(/proc/sys/kernel/printk_delay, sysctl printk_delay).

Note that it creates a hairy code. It is the only reason why we need to
call panic_print_sys_info() twice with "false" and "true"
parameter.


That said, I could imagine a generic use, for example, after forcing
ignore_loglevel or so. Otherwise, I do not see any advantage in
flushing the same messages again, for example, on serial or network
consoles where they are likely already stored. We could add this
later when there is a real-life demand.


> +#define SYS_PRINT_ALL_CPU_BT		0x00000040
> +#define SYS_PRINT_BLOCKED_TASKS		0x00000080

The generic approach might deserve a separate source file,
for example:

    include/linux/sys_info.h
    lib/sys_info.c

Also I always considered the bitmask as a horrible user interface.
It might be used internally. But it would be better to allow a human
readable parameter, for example:

	panic_sys_info=task,mem,timer,lock,ftrace,bt,all_bt,blocked_tasks

The console reply might be handled by a separate:

	panic_console_reply=1

And it would obsolete the existing "panic_print" which is an
ugly name and interface from my POV.

> +extern void sys_show_info(unsigned long info_mask);
> +
>  extern bool panic_triggering_all_cpu_backtrace;
>  extern int panic_timeout;
>  extern unsigned long panic_print;
> --- a/kernel/panic.c
> +++ b/kernel/panic.c
> @@ -208,33 +200,44 @@ void nmi_panic(struct pt_regs *regs, const char *msg)
>  }
>  EXPORT_SYMBOL(nmi_panic);
>  
> -static void panic_print_sys_info(bool console_flush)
> +void sys_show_info(unsigned long info_mask)
>  {
> -	if (console_flush) {
> -		if (panic_print & PANIC_PRINT_ALL_PRINTK_MSG)
> -			console_flush_on_panic(CONSOLE_REPLAY_ALL);
> -		return;
> -	}
> -
> -	if (panic_print & PANIC_PRINT_TASK_INFO)
> +	if (info_mask & SYS_PRINT_TASK_INFO)
>  		show_state();
>  
> -	if (panic_print & PANIC_PRINT_MEM_INFO)
> +	if (info_mask & SYS_PRINT_MEM_INFO)
>  		show_mem();
>  
> -	if (panic_print & PANIC_PRINT_TIMER_INFO)
> +	if (info_mask & SYS_PRINT_TIMER_INFO)
>  		sysrq_timer_list_show();
>  
> -	if (panic_print & PANIC_PRINT_LOCK_INFO)
> +	if (info_mask & SYS_PRINT_LOCK_INFO)
>  		debug_show_all_locks();
>  
> -	if (panic_print & PANIC_PRINT_FTRACE_INFO)
> +	if (info_mask & SYS_PRINT_FTRACE_INFO)
>  		ftrace_dump(DUMP_ALL);
>  
> -	if (panic_print & PANIC_PRINT_BLOCKED_TASKS)
> +	if (panic_print & SYS_PRINT_ALL_PRINTK_MSG)
> +		console_flush_on_panic(CONSOLE_REPLAY_ALL);

I do not see any advantage in replaying the log at this stage.
It might make sense to replay the messages printed before
the critical situation. But it makes sense only when they
might be filtered/blocked before and can be seen now (unblanked
consoles, forced  ignore_loglevel, or so).

I would keep this in the bitmap for backward compactibility.
But I would ignore it my the generic print_sys_info().

And I would replace panic_print_sys_info(true) call with:

static void panic_console_replay(void)
{
	if (panic_print & SYS_PRINT_ALL_PRINTK_MSG)
		console_flush_on_panic(CONSOLE_REPLAY_ALL);
}

> +	if (info_mask & SYS_PRINT_ALL_CPU_BT)
> +		trigger_all_cpu_backtrace();
> +
> +	if (info_mask & SYS_PRINT_BLOCKED_TASKS)
>  		show_state_filter(TASK_UNINTERRUPTIBLE);
>  }

Best Regards,
Petr
