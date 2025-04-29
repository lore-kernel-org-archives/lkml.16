Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CA822157B
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 16:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745942476; cv=none; b=N8d0XUuOVNVZFWV0+oEIcpcNCPoSY/w/HeVvsP1ea5pyYWhfbVkZ3TaN7WFj7967gMJwBhwg8ToXIbfc9yIF09RI5IyvGdbuWUPssfVsMauZMCx5RbU9Hhtvfmk4mbddXHB4sOCJoQgf7t63bos4hh7seFLtsQh8xjP90iqJ9lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745942476; c=relaxed/simple;
	bh=ljGRE+fg1GbYFRrEyep1aWAADwhofg/J+DkXE8o6zCk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=C9T0PCFHB+kjfs3+GtUS+Mcd6e0k5063tUyb7OCVV95/tUUM6hSUdB/VXBInSf5MmZk0bNblhOZgqKX4Lrumq32f7iWLJxg85u6AVIgV+3+wcOCB5M/T5BvEFkvciJJdT1mcTgT3QVNAYOa3gNLI+9T4hgzZAlCAkX6A//TLM78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WwJQ/Rd+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WwJQ/Rd+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745942473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=F9d4ihjEcZCGzfEfkm5oQUSnv2p0a0HdnyPYGguifKE=;
	b=WwJQ/Rd+7IjMioPg02YshjrWxwP9/HRMbL7ABwYLNSz+Webv83mEXAERoi+k+2EHLRO9AU
	udHVcyTaSQo66iuts9sPoVO/rV4IvJ3j5Bl11ShrP32UQQ1ae9GXiswbZNXO6zlQf0gc4J
	Np8TWdQxyum+uXn5F686HPH4iplBt6M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-360-ZqL8T_eAP2ydyRRsrNbpdw-1; Tue, 29 Apr 2025 12:01:12 -0400
X-MC-Unique: ZqL8T_eAP2ydyRRsrNbpdw-1
X-Mimecast-MFC-AGG-ID: ZqL8T_eAP2ydyRRsrNbpdw_1745942471
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43cf44b66f7so36591925e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:01:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745942471; x=1746547271;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F9d4ihjEcZCGzfEfkm5oQUSnv2p0a0HdnyPYGguifKE=;
        b=fmXVEAiDtn0NivP+yd5kUgeDV/Oi8I+TUrdcRflvPuPYlQhnpHkO/1ZNBeFeosreFT
         foddG8VV1uFcyAW6OJAXUwLnDiwnswB6rm6kR2llSgykij34dQZxgPF0w+z5WXhjxcuu
         TrKmDFi+YW/adKIpB2TbeSy6jr7o4An3IwAOdVD5yyvBMQFflUXbfNgR7aLPx/sU4jbk
         /hdgoSY25W31KrLJ+hOSE08eCe8NZM98ksY+d4GSjU2EGasHNxjobDGtuhAAjv1yhig9
         dwVMjfBM8rws0J+jH3Au8MWsYJlTg7ULt8yWuuL+BPSjDpkF5ywnYTnM5LTCQLOUMFn8
         znxg==
X-Forwarded-Encrypted: i=1; AJvYcCU8ItyFQCro3fkf+uMR8swHnnoXhiMisFAseM1FzDDSkA/xnNcjnuqqxepokKI9D6jFPBKdBtJ+lFmjLy0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxpRHSgEYFjhg+qHNFI/pPfUdhZKADPnvcd2gmB410bpuvjluL
	XwQsdHwkhbyBxmNbfWXfjDK4FDRx85WfYZceypR31GdfjOTnMTRcLRoAckithRjaHM3aCsvx7dI
	KuJdOZx+cMhy+Iko6ZU+7Zu6DmEyC22QWaTGVlVdpUEs9P/wwaKnd9zpIYmU7gg==
X-Gm-Gg: ASbGncs3OK8qwmX8d61d3TZj/cmcjrAaO7GkG7uWNLUQYLw7MLjS5SyXXdfYOkbism/
	MjWx/M7xrppiX707w9xSQQScQ9JP2MOQi3mcJzuu6a8UW7T9JocN0sX3o5L7wBBDvvGknu0V5Qh
	AWadQk7o2NDUCKVNZ6gvK+jOwav2kL0jt87gEni5pSuYgXTPLS/wMHt8SK8g7HDjopiAjL2jZnl
	+FVSkqO8F5S3syjcCw41fewKTZl/08O2pw7qQdx8xnBJ51KqWlWEyGknrpgsqd4RLoqyAEGs8nl
	4GIT8W4xvtt8prQDsbDqubBaefqzlJTdGmJbDw==
X-Received: by 2002:a05:600c:a03:b0:43c:e70d:4504 with SMTP id 5b1f17b1804b1-441ad3c6602mr30614395e9.19.1745942470833;
        Tue, 29 Apr 2025 09:01:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMeuVr5PTAmj5isfFftY7IqinZh8JCUlTZsYw5t+if/pErZS1O8MEOM08+w3EhWkOz8GDbBA==
X-Received: by 2002:a05:600c:a03:b0:43c:e70d:4504 with SMTP id 5b1f17b1804b1-441ad3c6602mr30613645e9.19.1745942470076;
        Tue, 29 Apr 2025 09:01:10 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073cbf030sm14248751f8f.46.2025.04.29.09.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 09:01:09 -0700 (PDT)
Message-ID: <bfe8322cf5817037af57f10ffbffcd9b30f43b42.camel@redhat.com>
Subject: Re: [PATCH v5 21/23] rv: Add rtapp_sleep monitor
From: Gabriele Monaco <gmonaco@redhat.com>
To: Nam Cao <namcao@linutronix.de>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: john.ogness@linutronix.de, Peter Zijlstra <peterz@infradead.org>, Ingo
 Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Boqun Feng
 <boqun.feng@gmail.com>,  Waiman Long <longman@redhat.com>
Date: Tue, 29 Apr 2025 18:01:01 +0200
In-Reply-To: <57ea14992e148121fc010a200986e4db60ac2de0.1745926331.git.namcao@linutronix.de>
References: <cover.1745926331.git.namcao@linutronix.de>
	 <57ea14992e148121fc010a200986e4db60ac2de0.1745926331.git.namcao@linutronix.de>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0ByZWRoYXQuY29tPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmbiuWMCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfJzZgD/TXjnqCyqaZH/Y2w+YVbvm93WX2eqBqiVZ6VEjTuGNs8A/iPrKbzdWC7AicnK
 xyhmqeUWOzFx5P43S1E1dhsrLWgP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-04-29 at 14:01 +0200, Nam Cao wrote:
> Add a monitor for checking that real-time tasks do not go to sleep in
> a
> manner that may cause undesirable latency.
>=20
> Also change
> 	RV depends on TRACING
> to
> 	RV select TRACING
> to avoid the following recursive dependency:
>=20
> =C2=A0error: recursive dependency detected!
> 	symbol TRACING is selected by PREEMPTIRQ_TRACEPOINTS
> 	symbol PREEMPTIRQ_TRACEPOINTS depends on TRACE_IRQFLAGS
> 	symbol TRACE_IRQFLAGS is selected by RV_MON_SLEEP
> 	symbol RV_MON_SLEEP depends on RV
> 	symbol RV depends on TRACING
>=20
> Reviewed-by: Gabriele Monaco <gmonaco@redhat.com>
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> ---
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Boqun Feng <boqun.feng@gmail.com>
> Cc: Waiman Long <longman@redhat.com>
> ---
>=20
> [...]
>=20
> +RULE =3D always ((RT and SLEEP) imply (RT_FRIENDLY_SLEEP or
> ALLOWLIST))
> +
> +RT_FRIENDLY_SLEEP =3D (RT_VALID_SLEEP_REASON or KERNEL_THREAD)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 and ((not WAKE) until RT_FRIENDLY_WAKE)
> +
> +RT_VALID_SLEEP_REASON =3D PI_FUTEX
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 or RT_FRIENDLY_NANOSLEEP
> +
> +RT_FRIENDLY_NANOSLEEP =3D CLOCK_NANOSLEEP
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 and NANOSLEEP_TIMER_ABSTIME
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 and NANOSLEEP_CLOCK_MONOTONIC
> +
> +RT_FRIENDLY_WAKE =3D WOKEN_BY_EQUAL_OR_HIGHER_PRIO
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 or WOKEN_BY_HARDIRQ
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 or WOKEN_BY_NMI
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 or KTHREAD_SHOULD_STOP
> +
> +ALLOWLIST =3D BLOCK_ON_RT_MUTEX
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 or TASK_IS_RCU
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 or TASK_IS_MIGRATION

So, just thinking out loud, PI_FUTEX is a valid sleep reason,
technically also BLOCK_ON_RT_MUTEX is something you are allowing.

In my understanding, the contention tracepoints already in the kernel
can track all contention by kernel code and are leaving aside the PI
futexes, which use the untracked rt_mutex_wait_proxy_lock.

In your case, you are tracking PI_FUTEX via the system call, which
should cover the above scenario.
Do you really need extra tracepoints to track this too? Or is there any
other use of start_proxy_lock/wait_proxy_lock I'm missing here?

I see the only case in which rt_mutex_start_proxy_lock is called with a
task different than current is via FUTEX_CMP_REQUEUE_PI, wouldn't
considering this one too make the new tracepoints superfluous (assuming
this one is even needed to be tracked before FUTEX_WAIT_REQUEUE_PI).

Thanks,
Gabriele

