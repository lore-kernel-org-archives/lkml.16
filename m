Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955A12528E6
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 18:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747076173; cv=none; b=i/441KCdVQMu5+n5Cy+uzF4HNHER69C+gY5o5r9upvgSTQUx+9d5TB4YISECcoBzvBJrx2ob2nTP6firoxt0xTYzGHLup+4zUqK4IlDqE/uL5K59F763sDWuBGmb7Rh9cdUD1zh9Hnsd1pE8QQ2vqAtsXhBfyl2l2medn6XCwps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747076173; c=relaxed/simple;
	bh=R9Oi8PhHsn0Iqgoq3Kuo2vY/g67j2m74WQmsNoKbiDg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BNxyWQHEpbZszTRxyZwWfW6WIAEssD6YBsYpdd+v5bf3jaBr/Z1q13kYofvT7NjWiTYZTE54x0ZjaDi5hgBWeBdnLekrWQPWwsyvNDaebdqNUdLdlrmBIm6gRQUSos0Nxir7j6vW75gQXdqRNGeh9mC270e6+a953ZfbrZHdd40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=REzRzN6E; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="REzRzN6E"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ad21c5d9db2so593574566b.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 11:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747076170; x=1747680970; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R9Oi8PhHsn0Iqgoq3Kuo2vY/g67j2m74WQmsNoKbiDg=;
        b=REzRzN6EJwLd6jkvOc2HILBwBgbhLcxCfe6nq3wLePWM6WdZvrhkJ/i5JQPPE62kqK
         LeQz6AYyceWAyEwBUI69F6U5tIkPIZ4JkUPTxj6qKDz1PD+YXW2skpqobii8yh4SwPno
         fhQGQxfCf/pTuWMd1vFPqKUjcsLSnL2+OSUqW0VZF6qeIr9H07SLjcRPnkbBGo+CClvO
         S7l62Yri+QQiPC9jz5NOt4Po0v0RjWuKEmPDVcW2gOCrlJI1pMLGOqdbjueeupXbqUyt
         MnJvgq0kiOTBjq5lqHq7M/vhbjtz5lJZBVyMmx5oTRRWdHuntSpcOEjKDIHC2ItK1syP
         943A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747076170; x=1747680970;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R9Oi8PhHsn0Iqgoq3Kuo2vY/g67j2m74WQmsNoKbiDg=;
        b=j0tQAlnaLvxijepqpPs7bpzgvP8bXnvm3F8muag51aG3iA5wVVAKZLYFDAgeflHVOD
         hDHmopHRG6/5Hg4B4GQOoNxOyXVEOHCkmLxtG59QzjjTVZjggt29aR1Bp94AkeGtAv7B
         u2YmhavqPrjc7NExh9l2pH/A3U0OUlBaMdHI/QsTbnu64Hj6UZJZ3nGXf5++pXX9PlRW
         7hn3vrdeRAYoKQlPuz4SpxmMlvQjF0xRKVsgcT4OiEFDe3OPusjdIhsFvYeX/xFnfPNa
         ESMneazHiH5XSrPWF/EaFxduvsgZk4tgE0csPAoRHiuhd4sxJOJVb2rYquH8zRD9nlf2
         qDLQ==
X-Gm-Message-State: AOJu0YzetI/7+3/tPKLSB115c7FVAUbd8+Yq9vpcOv1PC73SIEha39Pr
	p/R9cC6xptORqDxr3J/pvggnwhA/dEhNqtnpDwQ+OxAZXEHezswOimMSrV9TGwPcr2Qs0enGNxh
	3s28FQcTdNuNxbVuSYGcpXmx2RNfzr5904L8Mmm4ubfj/TrMAQkWMHi0=
X-Gm-Gg: ASbGncupIZYKC8QWfOATTsSIHs77ImeLTa+X/sSeGH48ir/e9gXRrw6PWHRyF4jGZ7R
	AMx+3rrFEWsC28mAfj3akJ17mL68dq4Y3eVdHZnRTiilX05dmnYRVqkxpr5S+WS6T4L9fk1Ll19
	hb+mrcrU/OSKinsw0IpSUeEW2rgDXrv2xU240gr+311t1i2+x5pnaYYxUXPFs0sCBwQMM=
X-Google-Smtp-Source: AGHT+IGSxf21cydcKSaeqGdWQfCMq/i1Jw1c1h3iOLfTnyifJEAxgbYTWe1QXdk0KWz98TodjdO76SfECkN7Q4EznqM=
X-Received: by 2002:a17:907:1b1c:b0:ac2:7a6d:c927 with SMTP id
 a640c23a62f3a-ad2192d4b63mr1294443666b.50.1747076169603; Mon, 12 May 2025
 11:56:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506183533.1917459-1-xii@google.com> <avxk2p2dr3bywzhujwnvbakjyv4gsnshssvgwj5276aojh7qbl@llhdz2e55iai>
In-Reply-To: <avxk2p2dr3bywzhujwnvbakjyv4gsnshssvgwj5276aojh7qbl@llhdz2e55iai>
From: Xi Wang <xii@google.com>
Date: Mon, 12 May 2025 11:55:57 -0700
X-Gm-Features: AX0GCFtN5E-ewrK2qktSybXmdK4lo0FOtGq_i9xSb1_nkn6X8o0AyCvqgWj55u8
Message-ID: <CAOBoifiYV3YX6nAf9v5PwkkKPt4qhV8af47mWoJQ1B_tFJ7D-g@mail.gmail.com>
Subject: Re: [RFC/PATCH] sched: Support moving kthreads into cpuset cgroups
To: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
Cc: linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, David Rientjes <rientjes@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Waiman Long <longman@redhat.com>, Tejun Heo <tj@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Lai Jiangshan <jiangshanlai@gmail.com1>, 
	Frederic Weisbecker <frederic@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Chen Yu <yu.c.chen@intel.com>, 
	Kees Cook <kees@kernel.org>, Yu-Chun Lin <eleanor15x@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 3:36=E2=80=AFAM Michal Koutn=C3=BD <mkoutny@suse.co=
m> wrote:
>
> Hello.
>
> On Tue, May 06, 2025 at 11:35:32AM -0700, Xi Wang <xii@google.com> wrote:
> > In theory we should be able to manage kernel tasks with cpuset
> > cgroups just like user tasks, would be a flexible way to limit
> > interferences to real-time and other sensitive workloads.
>
> I can see that this might be good for PF_USER_WORKER type of kernel
> tasks. However, generic kernel tasks are spawned by kernel who
> knows/demands which should run where and therefore they should not be
> subject to cpuset restrictions. When limiting interference is
> considered, there's CPU isolation for that.
>
> The migratable kthreadd seems too coarse grained approach to me (also
> when compared with CPU isolation).
> I'd mostly echo Tejun's comment [1].
>
> Regards,
> Michal
>
> [1] https://lore.kernel.org/r/aBqmmtST-_9oM9rF@slm.duckdns.org/

Kernel doesn't actually have the best information because it doesn't know w=
hich
user threads are more important. Giving the root user more power for fine t=
uning
is a common practice.

The most important reason for moving kthreadd is to prevent a kthread from
interfering with important user threads right after forking. It can still b=
e
moved to other cgroups later. Moving kthreadd allows better control rather =
than
worse control.

CPU isolation is more narrowly focused compared to generic cpuset based con=
trol.

-Xi
