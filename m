Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3963B26E152
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 15:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750691093; cv=none; b=h6K3XHwKXrPjJPWqoXApIEKJ+wbvh1QZnyYxyW0poclmlbgZDUAlKqLsynS5O/p1EaFsl+x90GYfI1T7C9GGoZumTuenqSj/7fNkV1d7aPAPUv0vvMc0AVbNKzg2b38FRiBSw8hFd84IADu55xySxZk2EQ5YBUN5YrGJ316WU9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750691093; c=relaxed/simple;
	bh=dMzwahMiyfcj6Zn1uTyAPuQv24ayiFLiFyoqcUx6o/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DNbyjrq8HcXeGR5w9TDjvUNGEb/sQLMzSdRoeIpAWePED3/xHy1kxQOyiTImOFgtbJsc6a8l9mdXyEYE/bsXWynL3OPl/v3gbg6d0rseeXnZL/iQJTkfJ4TEUfUHs9pghrM36y8ay9k1Mu6b6/YtjpAhu7aHBSWu90QfJqvMVpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Irk9++Rk; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Irk9++Rk"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ad8826c05f2so791269766b.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750691089; x=1751295889; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZSsjYQbWIqp0mK8U56a247e9vWDWwmcnsv0WdzGwgBI=;
        b=Irk9++RkVRVwKsfG3f7xOyYalGO8Nd+joxm/pMmX+A+HWNi70g/76cuxZMo3GKwe3e
         jyYeYrhaY/JF06D5aOJ8EG9esnykhJm9cjTgIZcE+dDdAK6QDMzs8ap7ZxizeOywL6Gb
         22gFUpuqkKYV3aSEqngDfoTTxC/cMHEX9bk1pZGubPT/I5b0tH/wJbhGZAlX+ltw9m1c
         bBSMZ8YAyMV89VLj+pj8XzYGtFEmqOPMkCiNM5KRkoFgzqFaN8HlkK2c/tcOd59KchTg
         3NLSFC7seb2xV+c2xWGwN9mf11x5+BeY+ylJ5aXvMRvY+7HoEYo+cxSFVmQE45e/WL30
         t/ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750691089; x=1751295889;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZSsjYQbWIqp0mK8U56a247e9vWDWwmcnsv0WdzGwgBI=;
        b=eqPc+yU6iGDYfyPwth/Ui0Y44epiXHQdPR92HzdSNWzE4Yl9gYnyOEzH8KQkVkxHSR
         B8afkzo/42acNUK/n4Ps2UkvKtil4EZKbVuc8FnILl9kbnbTdFG+07jp3IsQ3tQZzKTd
         6skw3/NNUSoCWx3lMDED7DwAhHGdziAsPZvdWePb/0/gBYDyVVOpT/VzEGYUMTqAW3M0
         XwDQdP1zm4yhWqB3INAExNc3HndJDMj5eZztRWFNPfmmrjvM1A8VbcK+br/Z2Le1maLf
         aTdTChY+nxpk1DQedrMeLQkVlI2aEK3fcBHdteSTp9h60xOd4I/QMg7TRa2jJiSW7QfU
         fRHw==
X-Forwarded-Encrypted: i=1; AJvYcCWAIkwwOO81EOGX53itD8mydWGdTD9FxMf/5bt6sFIBxGgmNbVpD0Toj9suGXpYEsXHVbqZNLdTPzypJng=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4AVnSxslOjhT4cENhpCayXY9tb67EJBgS1W8oNVfDAnSUOTAN
	wNJfFzWcbESyT2K6yT0m81A6ANr9g/vDfoI4j+asQzqA6IGFpSGP2GJB/9KXFbZsqek=
X-Gm-Gg: ASbGncvZ6/fszU1iFWko2zhBg2oHKv4w8m3K2ECv4pVoUwS1h4Chwk3HJXnN+T7okAm
	4l3ERJST17q/z4w6HE8tnOWGvrhAsTZg71hQFjXMcszh6x4ijZB6nAZIflpOvvRRWIjAfqPf6a2
	fK3NAzr5tiRF114Wf8kkLG0s3zayJHuyGZc/UUpbibvDiRJUtmrFlZTx3WOH2zBQcfMSN1l0cfX
	4rq56u46U40fl36tjs7yxdEx8CBlKOJTcragW9OodskuWXc0lIcLgEwxiRMz8iSWTJ2ecMSHkwg
	RoGLRf1Ywm4O3+X3dHQSpvdeDO4kBP0CKvziLfXAOUE/VWPsJTPFoVJvnhNTfZat
X-Google-Smtp-Source: AGHT+IHfogB/Y3gC+FdHdS/+Zm2LBoCerdKhbTtiJ3vSrAFHKI2FUDBKXFrUyt59Gugol/EvGBbddA==
X-Received: by 2002:a17:906:9fcf:b0:add:f4ac:171f with SMTP id a640c23a62f3a-ae0578d604fmr1179325566b.5.1750691089188;
        Mon, 23 Jun 2025 08:04:49 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541b6894sm722138866b.111.2025.06.23.08.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 08:04:48 -0700 (PDT)
Date: Mon, 23 Jun 2025 17:04:46 +0200
From: Petr Mladek <pmladek@suse.com>
To: Feng Tang <feng.tang@linux.alibaba.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Lance Yang <lance.yang@linux.dev>, Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org, paulmck@kernel.org,
	john.ogness@linutronix.de
Subject: Re: [PATCH V2 4/5] panic: add 'panic_sys_info=' setup option for
 sysctl and kernel cmdline
Message-ID: <aFltDlSKKCv3Cito@pathway.suse.cz>
References: <20250616010840.38258-1-feng.tang@linux.alibaba.com>
 <20250616010840.38258-5-feng.tang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616010840.38258-5-feng.tang@linux.alibaba.com>

On Mon 2025-06-16 09:08:39, Feng Tang wrote:
> Add 'panic_sys_info=' setup which expects string like "tasks,mem,lock,...".

This patch actually adds also the sysctl interface. It should be
mentioned in the "Subject" and here.

That said, it might be better to add the sysctl interface in
the previous patch and add just the setup() here.

> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -4541,6 +4541,19 @@
>  			Use this option carefully, maybe worth to setup a
>  			bigger log buffer with "log_buf_len" along with this.
>  
> +	panic_sys_info=


> +			String of subsystem info to be dumped on panic.

I am not a native speaker but I have troubles to parse the above
sentence. See below.

> +			It expects string of comma-separated words like
> +			"tasks,mem,timer,...", which is a human readable string
> +			version of 'panic_print':
> +			tasks: print all tasks info
> +			mem: print system memory info
> +			timer: print timer info
> +			lock: print locks info if CONFIG_LOCKDEP is on
> +			ftrace: print ftrace buffer
> +			all_bt: print all CPUs backtrace (if available in the arch)
> +			blocked_tasks: print only tasks in uninterruptible (blocked) state

This blob is hard to parse. I suggest to replace it with something
like:

<proposal>
	panic_sys_info= A comma separated list of extra information to be dumped
			on panic.
			Format: val[,val...]
			Where @val can be any of the following:

			tasks:		print all tasks info
			mem:		print system memory info
			timers:		print timers info
			locks:		print locks info if CONFIG_LOCKDEP is on
			ftrace:		print ftrace buffer
			all_bt:		print all CPUs backtrace (if available in the arch)
			blocked_tasks:	print only tasks in uninterruptible (blocked) state

			This is a human readable alternative to the 'panic_print' option.
</proposal>

> +
>  	parkbd.port=	[HW] Parallel port number the keyboard adapter is
>  			connected to, default is 0.
>  			Format: <parport#>
> diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
> index dd49a89a62d3..2013afd98605 100644
> --- a/Documentation/admin-guide/sysctl/kernel.rst
> +++ b/Documentation/admin-guide/sysctl/kernel.rst
> @@ -899,6 +899,24 @@ So for example to print tasks and memory info on panic, user can::
>    echo 3 > /proc/sys/kernel/panic_print
>  
>  
> +panic_sys_info
> +==============
> +
> +String of subsystem info to be dumped on panic. It expects string of

Same here.

> +comma-separated words like "tasks,mem,timer,...", which is a human
> +readable string version of 'panic_print':

I would replace it with:

<proposal>
A comma separated list of extra information to be dumped on panic,
for example, "tasks,mem,timers,...".  It is a human readable alternative
to 'panic_print'. Possible values are:
</proposal>

> +
> +=============   ===================================================
> +tasks           print all tasks info
> +mem             print system memory info
> +timer           print timer info
> +lock            print locks info if CONFIG_LOCKDEP is on
> +ftrace          print ftrace buffer
> +all_bt          print all CPUs backtrace (if available in the arch)
> +blocked_tasks   print only tasks in uninterruptible (blocked) state
> +=============   ===================================================
> +
> +
>  panic_on_rcu_stall
>  ==================

The rest looks good.

Best Regards,
Petr
