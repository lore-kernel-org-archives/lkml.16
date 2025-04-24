Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5718417FAC2
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 13:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745502966; cv=none; b=O0/u1Lni9p6PR44aVRQKCVSat4Zykf/l66LBPg2AIDjO3LWLdka3KW6XLdZkeo99IcET5xFFpDW1tQwnCKBjIxgs5o0YsOAw3jyhWvWXtD81WaEnu76bNTEDGX/LZHQsRek/sxbAU/ypU8SewnGQ7Cfwo3oMcXo7vzcTU3krsrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745502966; c=relaxed/simple;
	bh=HczMHuCZV7ek5eXuc7rjQb9ytJ3N4/LC6rbBrJIYijA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ShFnJfiVZwFx8+cIgb93/7rgF9QZqvX7qx4Y0C9E7nkp+8OxvbhWNzL2dYIsutracaYyvWpExb9lzAfV3rPenFZ954nPoJkiSkGZKfkN/M1mPpjBjlYABac1z0445hg/8tmnk2duzM0/8lHSrVV61rQMcb6XMda9nlgtM6gywXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b/muARIn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b/muARIn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745502963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Y1RyaFKtxAMrB5HauvPOnP185eorkVDz+74Vg8LMXDQ=;
	b=b/muARIn119n8bZ27A7bH9yeLBJ+Nq4peCVT1Yb0JHBIP3MFuxYaMqUt49hlVB4SdEqnsL
	0FgXrhUFUzrPTSoAjLaQCKkxSCBCm8vOoME7vGTDBoaEOPwDnzjACuSzRuz3eMC3g6BeWX
	tKZMPtNMEc1mEMfYq7yaQGQJX1/OGgQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-17-Zn7lxg1OPJ20EvaWIcY3vg-1; Thu, 24 Apr 2025 09:56:01 -0400
X-MC-Unique: Zn7lxg1OPJ20EvaWIcY3vg-1
X-Mimecast-MFC-AGG-ID: Zn7lxg1OPJ20EvaWIcY3vg_1745502960
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43ceb011ea5so6451765e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 06:56:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745502960; x=1746107760;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y1RyaFKtxAMrB5HauvPOnP185eorkVDz+74Vg8LMXDQ=;
        b=jjWzKjT0aOSYW9GMNufgSju+gBWjyQJvcl8ByzzL/2FItLMXvrMCegeKrGMwNMlLzg
         sK33ogx3gBFpv+2KYHqUD4HO8tVCwXCuBzhvyTYDGWwcOeAFm1wc5Jeev5kun5fVwYvn
         p7dUYVXLPNyx0b0SW7r89RXhIu6/B/92YetxqBreQ5duDQ1JNebUUrGsjPws6Xsbn+WS
         YZWFowxof8CvloqqZ1RkApjmQQU4ggDF0QPLhXKbaLtxUtgf+ScaoAN0gGy+3AjtzuAU
         STMXIz0sq0rpMoluR1V8J+zqtFOZ2yxZ2impDB1wxYd6Tbo7U2W9L4mJrr7Or9FDQZLT
         hFLg==
X-Forwarded-Encrypted: i=1; AJvYcCUqtN8penVLcgOsrcZbPhIPsqiUq6Imv2DqilKlVDtyGqHB9a/T/PqXwthCkKaJv/2RNm/arrGQlpC+gIA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZLAY3aEly4b4Bxymr+nLqASODoQ+XGINeD5Wf4ddx8oNP087K
	+IxHPtJkvK7gYLYOgeiLY8qhCyjsn+3gFNdteGTi7eDq9LgpzHLWESyJJwnETuinpaw1J8hiIZj
	UEJFn+KP63bGWn0zsJ1bxyzVuON4X3fnj509LBs44pZ0KVLO4yW3tW4QLhMB3tg==
X-Gm-Gg: ASbGncsGI2v5lleoixnxA2RntQnt47Tkq4pWz6l/t8zteB+o7eKwlHzEuyLffoVNFOZ
	1PLgWTHFq4t8omFT3CWZJOiwGu8M+9rCZCwWTCwsRd7BJU+xb+hU4ZS1ZonjeiJd/aZwmo2bD7W
	1LR4JE8uRedHrK5T7XSJYStm5xPi7Egirh10QLZ17YAgdwq/ND4okWXVi963gOt4jI5YUi6cozo
	Ca6YwNUpmxHD7oEkLV04yLICZDETsCTqKrWONqv+a410Vid8syCsGU2f4T8PkbG5lfWCW3qjRIr
	zSFD1u0coeyXkMw0Qzd5PP6DvH6fGFlOQnqU9Q==
X-Received: by 2002:a05:600c:a363:b0:43d:47e:3205 with SMTP id 5b1f17b1804b1-4409bd0e377mr24787835e9.11.1745502960185;
        Thu, 24 Apr 2025 06:56:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEaulAtCMwz/QY4Wsmd7+YPlHQCjODqYQKkCyZqkzc8UCUby+uEZhSuylFsVw/BS4GiRlE9lQ==
X-Received: by 2002:a05:600c:a363:b0:43d:47e:3205 with SMTP id 5b1f17b1804b1-4409bd0e377mr24787585e9.11.1745502959824;
        Thu, 24 Apr 2025 06:55:59 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.40])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2a2eabsm22120895e9.12.2025.04.24.06.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 06:55:59 -0700 (PDT)
Message-ID: <c321c7350ec10f9f358695acd765d2dbd067eeb2.camel@redhat.com>
Subject: Re: [PATCH v4 20/22] rv: Add rtapp_sleep monitor
From: Gabriele Monaco <gmonaco@redhat.com>
To: Nam Cao <namcao@linutronix.de>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: john.ogness@linutronix.de
Date: Thu, 24 Apr 2025 15:55:34 +0200
In-Reply-To: <c23cb5ef10310f978c3f90f07c2dbb9b042e8b01.1745390829.git.namcao@linutronix.de>
References: <cover.1745390829.git.namcao@linutronix.de>
	 <c23cb5ef10310f978c3f90f07c2dbb9b042e8b01.1745390829.git.namcao@linutronix.de>
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

On Wed, 2025-04-23 at 08:50 +0200, Nam Cao wrote:
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
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> ---
>=20

I've been playing with these monitors, code-wise they look good.
I tested a bit and they seem to work without many surprises by doing
something as simple as:

perf stat -e rv:error_sleep stress-ng --cpu-sched 1 -t 10s
  -- shows several errors --

perf stat -e rv:error_sleep stress-ng --prio-inv 1 --prio-inv-policy rr
  -- shows only 1 error (normal while starting the program?) --

Not quite sound, but does it look a reasonable test to you?

I quickly tried the same with the other monitor comparing the number of
errors with the page_faults generated by perf, but that didn't make too
much sense. Perhaps I'm doing something wrong here though (the number
reported by perf for page faults feels a bit too high).

perf stat -e page-faults -e rv:error_pagefault stress-ng --cyclic 1

Anyway, the monitor looks good to me

  Reviewed-by: Gabriele Monaco <gmonaco@redhat.com>

but it'd be nice if you have tips to share how to quickly test it (e.g.
without writing a custom workload).

Thanks,
Gabriele

