Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849B919E99A
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 11:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738928194; cv=none; b=VGAKdcElwuQ9MEHH4BI+a8xABDkuSP4XhJejheQVAAuYGRXARhg1gNujR2yd3DGLWdC8FMVdS7aC5T45gkQYaK1ihzA1kBjN7U2Fzp7r12hHKKC59j/aaCk21F2sTMqJiSJOE8UAAC7dEN8pomYsw0eKKy4UU+rnarUwuYTLD+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738928194; c=relaxed/simple;
	bh=S0jXGXJYq667zMKFys7Ylp7YNrGipcdb91sgnACR210=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=R5MNa4mEx2jDpjXLrCT0P0zJxfc0u40t+O9+Y4jVY31rTuTbQWjlEljb2XPc5ZivcIemUnW335qucXX58G5qak5NEereCTDLPUJSKIPVgBunrXSbhi29AKMkm8w2zcEJ4Fbsti2NQMb7FNtZLbo9FAXtERQEk/33ERS2x3AGFco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LZszRs4T; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LZszRs4T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738928191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=S0jXGXJYq667zMKFys7Ylp7YNrGipcdb91sgnACR210=;
	b=LZszRs4TGpmS0ccd5lFHHZ0a6IlmSNg33i4xVhRv0q3RU1mHYmz3odZdcmHMgSHqM85BqW
	8D7BNMPy7PN31smSyNTebY3IRWHgtQSaTm6wdkecXrCfHX8IEARq1Flo1pPnJTqjpUlE87
	KN1fPrxJMruvwxfOMthdIiGEaKWfFrs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-474-0dALqpeSNW-ucDoL1KEfTQ-1; Fri, 07 Feb 2025 06:36:28 -0500
X-MC-Unique: 0dALqpeSNW-ucDoL1KEfTQ-1
X-Mimecast-MFC-AGG-ID: 0dALqpeSNW-ucDoL1KEfTQ
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-38da6aa2363so862584f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 03:36:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738928187; x=1739532987;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S0jXGXJYq667zMKFys7Ylp7YNrGipcdb91sgnACR210=;
        b=XAYwWoJaFqroCR1DHRBHHBcQzdaaANu7rTldh6WgP4jg/TAJvPCruVVozOZT9E1vuT
         sfxuob56paZVuI8uaBu62LuP7VwE22KRH1coYQJwkiKtTSBKD+ZfZPwFTbajXgv7W0Rn
         O+iV1uSHFjBytmXW8NIy2/hehYpuIzM0PwWuFIWC9TAIk9tReKlGMV6ZdKNaj/S5gZU5
         rO66JnXKcquvA3RqlOIJSaPBSbo9NCztbh2V9LH9ISzza9y2xbkGBeSUThq6mH9hT6yu
         9lSSFzT4ugCYU2+eNZR9HbeOrGIz6gCAkdyinxo4A72uz3/rDJ2/szhFYRBdik0hFGin
         iWiw==
X-Gm-Message-State: AOJu0YxSks09NpYK3VVDG7u2gkc7bjcqzXLTOKnT3b+m9LcDfDBR1gtk
	4zLk0gzJ0TLjArCiSLBBoRh9GkysEJP7N2jFYKcu8aPNp5UUEGBaZmf7TDtKRg1W1gHHIPFtlEt
	T327i5YjbnzM9340Iqxp3k7pHAyODGApVHhzKrG9en99n8QevGzX7CuF9z+HmRg==
X-Gm-Gg: ASbGncuWoOgzeGL+746LnhG3JBVxNlbbjYBnOUL0WKA3qpYNzSq4KpGgk3tuk+PdTTp
	SNXTee80wGOf0RkBkEe+Djof/ClHxyoNJNf1W4dwkb1KmsJS3bGImXRxntr8Sk4zhCdHNFbIZpR
	36ET2L1vpCs9lBvCgLxJggfmjXNvwULMSPykd96GL4/azsTgZDiBm3vp6hkugeuInvmVfay2Gfi
	7uA7ympGQvRQ9NGtBKAOK98Eg8y8O0SH4dE9tIkonwmfcgP+tk+JUuwdUOku6sQSsPhKNSneY+g
	eHWmkuwjxvtxLYsvEy40YHR1L5mT0Ro=
X-Received: by 2002:a5d:6d88:0:b0:38c:1281:260d with SMTP id ffacd0b85a97d-38dc90f0f98mr1895379f8f.31.1738928186941;
        Fri, 07 Feb 2025 03:36:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4yT975z2O3wFjbb3NJP9lf8J4Kp/aHd+bgRUK1tWpGp2eSjf2AnV/W9eW0s1bLI33jydtYA==
X-Received: by 2002:a5d:6d88:0:b0:38c:1281:260d with SMTP id ffacd0b85a97d-38dc90f0f98mr1895365f8f.31.1738928186554;
        Fri, 07 Feb 2025 03:36:26 -0800 (PST)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d96530fsm85449585e9.19.2025.02.07.03.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 03:36:26 -0800 (PST)
Message-ID: <847c962745ef5bce757b9ae257ae279913ac711c.camel@redhat.com>
Subject: Re: [RFC PATCH 00/11] rv: Add scheduler specification monitors
From: Gabriele Monaco <gmonaco@redhat.com>
To: Juri Lelli <juri.lelli@redhat.com>
Cc: linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, Ingo
 Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	linux-trace-kernel@vger.kernel.org, John Kacur <jkacur@redhat.com>, Clark
 Williams <williams@redhat.com>
Date: Fri, 07 Feb 2025 12:36:24 +0100
In-Reply-To: <czykavxpz46nwnelml6yorg3tvmyjvczqogeuqzji6qrfd2peu@qxr6wucv6mrj>
References: <20250206080952.98478-1-gmonaco@redhat.com>
	 <czykavxpz46nwnelml6yorg3tvmyjvczqogeuqzji6qrfd2peu@qxr6wucv6mrj>
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



On Fri, 2025-02-07 at 11:55 +0100, Juri Lelli wrote:
> Hi Gabriele,
>=20
> On 06/02/25 09:09, Gabriele Monaco wrote:
> > This patchset starts including adapted scheduler specifications
> > from
> > Daniel's task model [1].
>=20
> Thanks a lot for working on this. Apart from being cool stuff per-se,
> it
> means a lot personally to see Daniel's work continuing to be
> developed.
>=20
> > As the model is fairly complicated, it is split in several
> > generators
> > and specifications. The tool used to create the model can output a
> > unified model, but that would be hardly readable (9k states).
> >=20
> > RV allows monitors to run and react concurrently. Running the
> > cumulative
> > model is equivalent to running single components using the same
> > reactors, with the advantage that it's easier to point out which
> > specification failed in case of error.
> >=20
> > We allow this by introducing nested monitors, in short, the sysfs
> > monitor folder will contain a monitor named sched, which is nothing
> > but
> > an empty container for other monitors. Controlling the sched
> > monitor
> > (enable, disable, set reactors) controls all nested monitors.
> >=20
> > The task model proposed by Daniel includes 12 generators and 33
> > specifications. The generators are good for documentation but are
> > usually implied in some specifications.
> > Not all monitors work out of the box, mainly because of those
> > reasons:
> > * need to distinguish if preempt disable leads to schedule
> > * need to distinguish if irq disable comes from an actual irq
> > * assumptions not always true on SMP
> >=20
> > The original task model was designed for PREEMPT_RT and this
> > patchset is
> > only tested on an upstream kernel with full preemption enabled.
>=20
> I played with your additions a bit and I was able to enable/disable
> monitors, switch reactors, etc., w/o noticing any issue.
>=20

Thanks for trying it out!

> I wonder if you also had ways to test that the monitors actually
> react
> properly in case of erroneous conditions (so that we can see a
> reactor
> actually react :).
>=20

Well, in my understanding, reactors should fire if there is a problem
either in the kernel or in the model logic.
While trying things out, I had more than a few models failing and I
excluded them from this patch because they are not stable.

Ideally you shouldn't be seeing errors using those monitors, unless you
(un)intentionally break something in the kernel.

That said, the monitor task switch while scheduling (tss) imposes
context switches whenever we reach the scheduler.
Daniel modified the sched_switch tracepoint to fire also if prev=3D=3Dnext
(in fact no switch is happening), I'm assuming the tss specification is
partly why that was necessary.
During my tests, I didn't apply that change, yet I've never seen the
monitor failing.

If you manage to call __schedule while the next picked task is the same
as the currently running one, you should see an error and a reactor
firing.

Since I couldn't reproduce the above case, I ignored it for the current
RFC, however if that's possible in practice, we should perhaps add
another event describing this fake switch to prevent the monitor from
failing.

Thanks,
Gabriele

