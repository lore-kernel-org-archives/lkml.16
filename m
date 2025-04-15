Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8580D29A3CD
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 13:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744722756; cv=none; b=fMn/BasRb9LcSmyT5SWxeNWcPqQfwFifcDXhD1At86e79ePUbmCt5x0LKNYP3dnYnF6C/XGw2cWRmNTzjBtuT743I1FgBjuSGWhWWJ1Tma3LZuhrw2K2YCFHmSLXDOeIhgdX/LbCxlqb7QZikcYzIYQ1q58aPtK8RFM7zrqprAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744722756; c=relaxed/simple;
	bh=O3EZDyxyG/XjjjOz2D8BAc2/DKYtl/58kBgjmDFmg4g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DitHD/L2T78t9Mb4gc69Oxp0ysV9eQ1OoaFE9IJRXnoqpx5RrOHrBl9/GikG7DSbh45/W2RO1nG+uRPFaBQQPi6N3Ly3rlsODUSots/FM+78R76wbssNRC1zq2PIgccZk1qaJERejjHWrt7f/wIz50jwKlAfKUfg1wJWoqzxPZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i0HuPiWe; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i0HuPiWe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744722753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4k892aDAMWLaTLLT54wWyKa/KFEvtq0nCWCvqVRRKtU=;
	b=i0HuPiWeZjGDJEHTVO7gZjiXcHmWh3jcF9o82i2Z20TdFUmklm9RZN18Bs55JlSpJh1dBQ
	aW8UW2P/d5ft96aYAn/o76WAs3J4b5HOpzWWHAVGh1y6RfBM4lV1Kek3GwAarePZtmeYwH
	N0HJgKiyxTAuBpxvl0Qpb/6T3gJ9qq8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-355-C99xfz39PXCyWA3qoQmFAw-1; Tue, 15 Apr 2025 09:12:26 -0400
X-MC-Unique: C99xfz39PXCyWA3qoQmFAw-1
X-Mimecast-MFC-AGG-ID: C99xfz39PXCyWA3qoQmFAw_1744722746
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43cf44b66f7so37154415e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 06:12:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744722746; x=1745327546;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4k892aDAMWLaTLLT54wWyKa/KFEvtq0nCWCvqVRRKtU=;
        b=p4ZrpXcNlTqED1TAJV3ZOKgbLk+gdg8r31zhOmGRoB90W46VdEpEyUF/OXK3JIDAIY
         uWFo2aoVMiyO5MvD0id36AAozC/f9exgO4Q3rtNXTYerScYYTt8yjwyn/S6C7/VTvMbt
         gkf0S/+JpmGgPuewp4P60hfM4FOG3vWK+5sHz1HKy21bowCi9cqpDBvj8SCO8Gj7sBSz
         1P1+yLgM9NJaWGZPrINwNelD1ISHafXhcnLpiwG6JbIzJAhA5vYk39qrejVS1Deg4cNt
         kGnKyA07fUW9lW0BmH+Eyj9bMZSASnTcT4lQVco7UUbQvhNVMTcvb1LPbgr/ITfl+lKm
         HMuw==
X-Forwarded-Encrypted: i=1; AJvYcCVlkr5wvDgQs+FDduZwLGLWOKJN2/dKFAW42tiSNOCgP9spe/vllWEn0N6K1yIDIqQ+6RV/fWkr4RUWZtM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIjbqv+vM2Ee6gN+wUXUkySB6xBE1bBLk6objPXtN0zKQMZ337
	TboQRFXy6cDwugCXWGYNhmoBVGb/+Zv3xUz4Mf2Z+RhBMxVhfn1PHms+vvNFMcnG7oEDpfmqwip
	b2bfO7GCJjGrX+PMgiPKmoEX7tH4f1kADQySD6f6U7mEJEmd7EE3kzfPmJ0rAZHDfjKH873Jx
X-Gm-Gg: ASbGncs+/2QcAiA3M5ZEhsPbfAeC9HeVpnb0ENRFioMFqJZQRrZnOikX6kZNja8YIsn
	O+maNTgFH151+kslTohwsPajG9g5JDOx24LU7Lm3nJQRGpmpoBDxGeahS4+mBoOk8u7dzlDXJeP
	qAaUyETWHxTvc1Sajsksz3DLJFdlq/ObPvtShK6VWjVPUqOU19+JWN77zqoJNPAUIzEUp8bLoX7
	D9kGdVlqVJ8QZ02YYgNlencouj2TMyQnva3v0i/mrMsCAw1k/sRIKEVaEtlc6hxfBeqahE/sP8I
	I+8MbIGfjfUuZRsws128uVXUN56w9fHXAVJAur4=
X-Received: by 2002:a05:6000:4211:b0:39c:266c:423 with SMTP id ffacd0b85a97d-39e9f3c997cmr13539679f8f.0.1744722745622;
        Tue, 15 Apr 2025 06:12:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEd9Vgr+5VknMvjpTJWS1SSUGPluf6BdV1c9glXEsAHcSrbckzMw1C1+EJLe73+zi+Ujd2OFQ==
X-Received: by 2002:a05:6000:4211:b0:39c:266c:423 with SMTP id ffacd0b85a97d-39e9f3c997cmr13539636f8f.0.1744722745197;
        Tue, 15 Apr 2025 06:12:25 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.134.30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96cfdbsm14037812f8f.40.2025.04.15.06.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 06:12:24 -0700 (PDT)
Message-ID: <67d9e857fd4fbfe590c9472f1c74b6f22560d952.camel@redhat.com>
Subject: Re: [PATCH v2 21/22] rv: Add documentation for rtapp monitor
From: Gabriele Monaco <gmonaco@redhat.com>
To: Nam Cao <namcao@linutronix.de>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: john.ogness@linutronix.de
Date: Tue, 15 Apr 2025 15:12:23 +0200
In-Reply-To: <9d5b01d8bdff50081d6ad17be0474c8c355aa139.1744355018.git.namcao@linutronix.de>
References: <cover.1744355018.git.namcao@linutronix.de>
	 <9d5b01d8bdff50081d6ad17be0474c8c355aa139.1744355018.git.namcao@linutronix.de>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0ByZWRoYXQuY29tPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmbiuWMCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfJzZgD/TXjnqCyqaZH/Y2w+YVbvm93WX2eqBqiVZ6VEjTuGNs8A/iPrKbzdWC7AicnK
 xyhmqeUWOzFx5P43S1E1dhsrLWgP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0



On Fri, 2025-04-11 at 09:37 +0200, Nam Cao wrote:
> Add documentation describing the rtapp monitor.
>=20
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> ---
> =C2=A0Documentation/trace/rv/monitor_rtapp.rst | 105
> +++++++++++++++++++++++
> =C2=A01 file changed, 105 insertions(+)
> =C2=A0create mode 100644 Documentation/trace/rv/monitor_rtapp.rst
>=20
> diff --git a/Documentation/trace/rv/monitor_rtapp.rst
> b/Documentation/trace/rv/monitor_rtapp.rst
> new file mode 100644
> index 000000000000..1cd188039a7e
> --- /dev/null
> +++ b/Documentation/trace/rv/monitor_rtapp.rst
> @@ -0,0 +1,105 @@
> +Scheduler monitors
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +- Name: rtapp
> +- Type: container for multiple monitors
> +- Author: Nam Cao <namcao@linutronix.de>
> +
> +Description
> +-----------
> +
> +Real-time applications may have design flaws such that they
> experience unexpected latency and fail
> +to meet their time requirements. Often, these flaws follow a few
> patterns:
> +
> +=C2=A0 - Page faults: A real-time thread may access memory that does not
> have a mapped physical backing
> +=C2=A0=C2=A0=C2=A0 or must first be copied (such as for copy-on-write). =
Thus a page
> fault is raised and the kernel
> +=C2=A0=C2=A0=C2=A0 must first perform the expensive action. This causes =
significant
> delays to the real-time thread
> +=C2=A0 - Priority inversion: A real-time thread blocks waiting for a
> lower-priority thread. This causes
> +=C2=A0=C2=A0=C2=A0 the real-time thread to effectively take on the sched=
uling
> priority of the lower-priority
> +=C2=A0=C2=A0=C2=A0 thread. For example, the real-time thread needs to ac=
cess a
> shared resource that is protected by
> +=C2=A0=C2=A0=C2=A0 a non-pi-mutex, but the mutex is currently owned by a=
 non-real-
> time thread.
> +
> +The `rtapp` monitor detects these patterns. It aids developers to
> identify reasons for unexpected
> +latency with real-time applications. It is a container of multiple
> sub-monitors described in the
> +following sections.
> +
> +Monitor pagefault
> ++++++++++++++++++
> +
> +The `pagefault` monitor reports real-time tasks raising page faults.
> Its specification is::
> +
> +=C2=A0 RULE =3D always (RT imply not PAGEFAULT)
> +
> +To fix warnings reported by this monitor, `mlockall()` or `mlock()`
> can be used to ensure physical
> +backing for memory.
> +
> +This monitor may have false negatives because the pages used by the
> real-time threads may just
> +happen to be directly available during testing. To minimize this,
> the system can be put under memory
> +pressure (e.g. invoking the OOM killer using a program that does
> `ptr =3D malloc(SIZE_OF_RAM);
> +memset(ptr, 0, SIZE_OF_RAM);`) so that the kernel executes
> aggressive strategies to recycle as much
> +physical memory as possible.
> +
> +Monitor sleep
> ++++++++++++++
> +
> +The `sleep` monitor reports real-time threads sleeping in a manner
> that may cause undesirable
> +latency. Real-time applications should only put a real-time thread
> to sleep for one of the following
> +reasons:
> +
> +=C2=A0 - Cyclic work: real-time thread sleeps waiting for the next cycle=
.
> For this case, only the
> +=C2=A0=C2=A0=C2=A0 `nanosleep` syscall should be used. No other method i=
s safe for
> real-time. For example, threads
> +=C2=A0=C2=A0=C2=A0 waiting for timerfd can be woken by softirq which pro=
vides no
> real-time guarantee.
> +=C2=A0 - Real-time thread waiting for something to happen (e.g. another
> thread releasing shared
> +=C2=A0=C2=A0=C2=A0 resources, or a completion signal from another thread=
). In this
> case, only futexes with priority
> +=C2=A0=C2=A0=C2=A0 inheritance (PI) should be used. Applications usually=
 do not use
> futexes directly, but use PI
> +=C2=A0=C2=A0=C2=A0 mutexes and PI condition variables which are built on=
 top of
> futexes. Be aware that the C
> +=C2=A0=C2=A0=C2=A0 library might not implement conditional variables as =
safe for
> real-time. As an alternative, the
> +=C2=A0=C2=A0=C2=A0 librtpi library exists to provide a conditional varia=
ble
> implementation that is correct for
> +=C2=A0=C2=A0=C2=A0 real-time applications in Linux.
> +
> +Beside the reason for sleeping, the eventual waker should also be
> real-time-safe. Namely, one of:
> +
> +=C2=A0 - An equal-or-higher-priority thread
> +=C2=A0 - Hard interrupt handler
> +=C2=A0 - Non-maskable interrupt handler
> +
> +This monitor's warning usually means one of the following:
> +
> +=C2=A0 - Real-time thread is blocked by a non-real-time thread (e.g. due
> to contention on a mutex without
> +=C2=A0=C2=A0=C2=A0 priority inheritance). This is priority inversion.
> +=C2=A0 - Time-critical work waits for something which is not safe for
> real-time (e.g. timerfd).
> +=C2=A0 - The work executed by the real-time thread does not need to run
> at real-time priority at all.
> +=C2=A0=C2=A0=C2=A0 This is not a problem for the real-time thread itself=
, but it is
> potentially taking the CPU away
> +=C2=A0=C2=A0=C2=A0 from other important real-time work.
> +
> +Application developers may purposely choose to have their real-time
> application sleep in a way that
> +is not safe for real-time. It is debatable whether that is a
> problem. Application developers must
> +analyze the warnings to make a proper assessment.
> +
> +The monitor's specification is::
> +
> +=C2=A0 RULE =3D always (RT imply (SLEEP imply (RT_FRIENDLY_SLEEP or
> ALLOWLIST)))
> +
> +=C2=A0 RT_FRIENDLY_SLEEP =3D (RT_VALID_SLEEP_REASON or KERNEL_THREAD)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 and ((not WAKE) until RT_FRIENDLY_WAKE)
> +
> +=C2=A0 RT_VALID_SLEEP_REASON =3D PI_FUTEX or NANOSLEEP
> +
> +=C2=A0 RT_FRIENDLY_WAKE =3D WOKEN_BY_EQUAL_OR_HIGHER_PRIO
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 or WOKEN_BY_HARDIRQ
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 or WOKEN_BY_NMI
> +
> +=C2=A0 ALLOWLIST =3D BLOCK_ON_RT_MUTEX
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 or TASK_IS_=
RCU
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 or TASK_IS_=
MIGRATION
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 or KTHREAD_=
SHOULD_STOP
> +
> +Beside the scenarios described above, this specification also handle
> some special cases:
> +
> +=C2=A0 - `KERNEL_THREAD`: kernel tasks do not have any pattern that can
> be recognized as valid real-time
> +=C2=A0=C2=A0=C2=A0 sleeping reasons. Therefore sleeping reason is not ch=
ecked for
> kernel tasks.
> +=C2=A0 - `RT_SLEEP_WHITELIST`: to handle known false positives with
> kernel tasks.

Is this what you call ALLOWLIST?

Just out of curiosity, normal kernel threads are not forced to follow a
VALID_SLEEP_REASON but need RT_FRIENDLY_WAKE, how are tasks like RCU
and migration not following this?

The monitors are not designed for deadline tasks, any plan to extend to
those too?

Other than this, nice explanation and monitors, thanks.

Reviewed-by: Gabriele Monaco <gmonaco@redhat.com>

> +=C2=A0 - `BLOCK_ON_RT_MUTEX` is included in the allowlist due to its
> implementation. In the release path
> +=C2=A0=C2=A0=C2=A0 of rt_mutex, a boosted task is de-boosted before waki=
ng the
> rt_mutex's waiter. Consequently, the
> +=C2=A0=C2=A0=C2=A0 monitor may see a real-time-unsafe wakeup (e.g. non-r=
eal-time
> task waking real-time task). This
> +=C2=A0=C2=A0=C2=A0 is actually real-time-safe because preemption is disa=
ble for the
> duration.
Typo:

+    is actually real-time-safe because preemption is disable**d** for
the duration.

