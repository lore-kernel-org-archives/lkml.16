Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C07D2C324C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 14:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749135277; cv=none; b=QNrY6+l5VSjTHXDYK6twPZKAB+396MGlHCRuV0M/5yjVv/31qsaRnsjUMlrtL4t6eF1Ye/PDEHcA3nQhJVcFrGRAi5FNfyd8UIJdLsLqbQ0zEL8rVLl00jIwOdNOyZF8YhZC0xM5UKX/aNL7NYj9algys+e7xuXbYinWo4Ym+G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749135277; c=relaxed/simple;
	bh=aHYbssR+9VM72fIqPBNGZpJvIkoY07+gJQAYdofPP/M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JtzSY6EBbQS3/Yvpz/Qq0/sQwIoFgg7RJ4QttpkPrzUKlRPLzbFC3mJAGFS4f5m2L/BGTtM5bI/atiwqo9JGYkRBNTwpMp28GM5o4eC4i+VtPRDqazKikEi4IB2M6ArePONgGcYX9+KfKgviAeL0Uj2/Uwwqw0ff2zE7C38Xqy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T18mhraG; arc=none smtp.client-ip=209.85.167.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T18mhraG"
Received: by mail-lf1-f67.google.com with SMTP id 2adb3069b0e04-551ed563740so1332127e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 07:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749135274; x=1749740074; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aHYbssR+9VM72fIqPBNGZpJvIkoY07+gJQAYdofPP/M=;
        b=T18mhraGEdeOfK59tVdWyvyJx0HwUrpomxN4dz4l0RxLMnsYdbQmMKymhd9S0CNeqj
         Q9svB41VZfzuBudHrL2pKImUxjTjTK/67Vnr0+1Ob/PI/ymLRCvH3GCXezm36ecRgXcm
         uDoHz6ma+kQnF94JRweKCK0SOGBzaKpPtiEPo9LFBjzzAlJhibMan8fECRd0480+jSaE
         s9yVSjFY57MDiR9NsHabmiYzJwpP1eV10WoWfkcHeJJKtAnI1dXJza4bbjCO4/FPCSOw
         kXfaXp6tY39Ymkgc01dgbZq1geTh40qMe/KJ8HQYkYhTuefUwLgN6kR2JEzAK41brcfA
         r+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749135274; x=1749740074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aHYbssR+9VM72fIqPBNGZpJvIkoY07+gJQAYdofPP/M=;
        b=AqLSVwWLg7R8Ec1ZFR6Eoresf4otk8/XqRqM34Jt1nXmY2QNaoLbhPW28DOTH9mLA3
         p0v0XT/PFB9ZJ5Y3sEGYAWSZiR7Iq4I3Ze093XOYBXAdJ8onaTgxVoXzFsYcXGUByUWv
         a3dZKRVclPHZvhLtWsimeNIdavwpfbFzlLzqYkqln/7gj12WiMIrxEbVYTtf++OWTGsK
         dORnO800BiQECnrlDKMGfF7lhSzJtj/ZY4oknwTSOorXuDsTAJcLzGzOBvNyJ3t0Xn5d
         yf7G6NHwNqXETPiGzRfDwtaGK7G9EOY+thce2hadI8uXqK/pjsy0o8aTLEizT3n/RxVw
         V10w==
X-Gm-Message-State: AOJu0YzfwwwmdmjGQE6TVsDOUO/Wxq8DQkVJ9Ucq/l6OwrHP/6ewpsGz
	aeg1fQ1vI3K5Zq+wE4a4JCvvMFonxhpjl98E8jZZM7DbYamZlEEyXVTpyp047gMPMOQnUXHT2b9
	Gvg+xcF57yOyjSlHwm+TvSunqpjvDNNg=
X-Gm-Gg: ASbGnctuJSVVBtHnAj4nEzhh1ZfDcKUCJl3pSArp/CHQJfDfcklO0rFQfB5dym6u83B
	ZsdnZ6udRU21yhG5Ox4gWfwIPALosP6zVKojTuAmHKP4E1rzMwDXgj3z64I1ugCWYKkv5iciTM6
	eqhgQpM5oF7e92VtxPbO598Sl9OfUQql4b4ePCBbUJKTEc
X-Google-Smtp-Source: AGHT+IFyYo8Ml8OY//OgeUYcEk986C+CfcRJWXBY1hkFMM5bk05QVXBlbnqojST/HNffv1Jd0o68RKUoCaR8Pcncco8=
X-Received: by 2002:a05:6512:1101:b0:553:24b7:2f61 with SMTP id
 2adb3069b0e04-55356df2b3cmr2311547e87.57.1749135274071; Thu, 05 Jun 2025
 07:54:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407134654.92841-1-hupu.gm@gmail.com> <CANDhNCptjorLthhgMBLLCCYsk5MJT73Daj+usFPWNenpgYTF4A@mail.gmail.com>
 <CADHxFxTWZJMBU9+VJH9=U9GHeoFf3N5fju3hApSRDONpQ9KAXg@mail.gmail.com> <CADHxFxSGwSBL0SvHGe6peVZ2=T=cz-PERrAiux8=0v_8heAp2w@mail.gmail.com>
In-Reply-To: <CADHxFxSGwSBL0SvHGe6peVZ2=T=cz-PERrAiux8=0v_8heAp2w@mail.gmail.com>
From: hupu <hupu.gm@gmail.com>
Date: Thu, 5 Jun 2025 22:54:22 +0800
X-Gm-Features: AX0GCFuI9UROKVNDj5d_aeBvWkLIS9yGsNDsziXCeh8NKppuq2EIpOxwmbrDKis
Message-ID: <CADHxFxRQL_VyAMtJVrHXso9aGOTLf8Z==2eKaDnPHe5aXy+Gtg@mail.gmail.com>
Subject: Re: [RFC 1/1] sched: Remove unreliable wake_cpu check in proxy_needs_return
To: John Stultz <jstultz@google.com>
Cc: linux-kernel@vger.kernel.org, juri.lelli@redhat.com, peterz@infradead.org, 
	vschneid@redhat.com, mingo@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, hupu@transsion.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Resending to bring it to your attention.

Thanks.
hupu

On Mon, May 19, 2025 at 1:13=E2=80=AFPM hupu <hupu.gm@gmail.com> wrote:
>
> Hi John,
> I=E2=80=99d like to revisit the discussion about this patch.
>
> As mentioned in the previous email, while using wake_cpu directly can
> effectively shortcut the deactivate & wakeup logic, it may introduce
> performance issues, especially on big.LITTLE architectures. Let me
> illustrate this with a common scenario on Android: foreground critical
> threads often need to wait for background threads to release a mutex
> lock. Under the "Proxy Execution" mechanism, the foreground thread is
> migrated to the CPU where the background thread is running. However,
> background threads are typically bound to weaker CPUs due to being
> part of the background group. If proxy_needs_return allows the
> foreground thread to be placed on wake_cpu, it may result in the
> foreground thread being migrated to a little core, causing performance
> bottlenecks.
>
> Therefore, I suggest that proxy_needs_return() should always return
> false for donor tasks unless the task is already running on a CPU.
> This ensures that donor tasks trigger a CPU re-selection process,
> which is consistent with the behavior prior to the introduction of
> "Proxy Execution" and should not introduce additional overhead.
> Furthermore, on Android platforms, this behavior allows vendors to
> leverage the hook in select_task_rq() to fine-tune CPU selection logic
> for critical threads, enabling better optimization for specific
> scenarios.
>
> Additionally, this patch has been successfully validated on an ARM64
> platform emulated via QEMU. It has been running for several days
> without issues, demonstrating its stability and reliability.
>
> Looking forward to your response and further discussion!
> hupu
