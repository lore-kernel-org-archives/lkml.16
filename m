Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0EC1C700D
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 05:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747631605; cv=none; b=t3VXcrz5MS63AyAHtzs95wFkBssVAjjhGuItzIvecsCC1MUMpD9A3tlalGLE7fFnxmy73huQ9YZzSVUwb//7qrW++SrQUk3ozx3TMxinf5dyJw8CVXV+fV0NAUjXyucy59SqEOfoIiKwJ7d728ugyq2SHxX/bmJTwr6ajZE19go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747631605; c=relaxed/simple;
	bh=PDHWgUZ9LjmdwdNCHq+P1OzFDVJEsd85gzxxBXKcwyc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CY+PbB2OwOb+G2bfxAMa1o00wZHRShfdjQiPrboMjQaVQl8sOBIX2EitGXy3pryidQ2rN8kMopqxURc5m+LfgXxA6GmbB+nu66R22saurCSXnisCV3/kWP8x3CI0/nROvHQq3si3tU18QDIK/g+D0qB74iD1hTrzLpyYnw0OywE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ExxZhe80; arc=none smtp.client-ip=209.85.167.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ExxZhe80"
Received: by mail-lf1-f66.google.com with SMTP id 2adb3069b0e04-54e816aeca6so5645972e87.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 22:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747631602; x=1748236402; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PDHWgUZ9LjmdwdNCHq+P1OzFDVJEsd85gzxxBXKcwyc=;
        b=ExxZhe80v4HUcjnL8Bt77gpRMjK+zkXI0PID7eFzRlKh0J5qJRsZfvicd668wLX2Kv
         2AKpBubkjc0eCl+sOTQqtFPAhWYm5Bf5BPUlOadfuZkQxchcxDvzuk9zmUVv0ANJ9qOZ
         monj5onBRisTczSqovtBfaDX/Vwl/+dncNnClmDiavGQp1E1JZ2ypbUWmvQ9EFxn9CDK
         LRJr6XzkYRPjIOI8Vr2/AcP2tBC+eH5EqyQgS9BfwKNagtUqnev8oCdDERgVgRdT0BvU
         MTiGMUQWZt9nZr3bdlA5WAE/m2IDhDV0zH4QEODt+FllKd8gis4m8Jmi286yEOBPezVK
         p7JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747631602; x=1748236402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PDHWgUZ9LjmdwdNCHq+P1OzFDVJEsd85gzxxBXKcwyc=;
        b=FCt3K1xpLx+U8TFfEw6vCj9MZD+C7o1sqQisV++kZU2l5YDySdKOkujzlIjyk3Iz/X
         iiZSl5SYJl5ji7sx7A1+fa3pXciVEQii5gFigd+rJFiIXQ7BPHLMi2N9UGYL4h81ziI+
         WDBZr7XkEEc8KTzfiT0u8yYQK2H/5P1z8JLX2cZcDHzTAsjvoiinhXGZYRvQosEr18nb
         qnGn54zpW2baeMshdwFuNQZJloxS3vOFJLZuWLYamtpblY69ddr8SsSVCsDF6ZPDXMpN
         V0igd3b3qCBGMEiux37UUcJldpTkJyq7xx4+lH9tXMeIpxzRE9/JL3kNnkkTGcpE+fJK
         xK4Q==
X-Gm-Message-State: AOJu0Yz0T2LTWOFgXeP64+SnALu8iY8aTW2PnibxjToykTSnhT9MGxc0
	LuBtoF7RhSuis4+w/OLLKEdDnmeC5i+tThUnqjvggRcDYHkgMW8GHI7SrVX+6UvkgNSRD15TV+U
	uaNpLC4IPrG4MZducyfEHN6snCXsWpWw=
X-Gm-Gg: ASbGnctkbYbkvqpW1U1DkvJfgailhX7AbWVN3nbxju4kNNXLIt4PA9DjPVDONU9zGeu
	wCtN3Z31eGBeiG7aCao5gMHQ75ccCUq1iU/VNBWPbVFcdkwd+eLRx/ORZkkE7CmmfnD3Tku5bxR
	HrCl0CELJVkG84OX/7Zr/XO5hURRTH7P+fhQ==
X-Google-Smtp-Source: AGHT+IGbZAIkOOx45l0x9zr/50Tj0aN0sNASnh/usHDVKQ3FjXWJxH95UcmaW7VDCHMUv/LPJasXSz9vX5eb9HudtSA=
X-Received: by 2002:a2e:a546:0:b0:30b:aabf:fc4 with SMTP id
 38308e7fff4ca-32807759049mr37455591fa.21.1747631601690; Sun, 18 May 2025
 22:13:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407134654.92841-1-hupu.gm@gmail.com> <CANDhNCptjorLthhgMBLLCCYsk5MJT73Daj+usFPWNenpgYTF4A@mail.gmail.com>
 <CADHxFxTWZJMBU9+VJH9=U9GHeoFf3N5fju3hApSRDONpQ9KAXg@mail.gmail.com>
In-Reply-To: <CADHxFxTWZJMBU9+VJH9=U9GHeoFf3N5fju3hApSRDONpQ9KAXg@mail.gmail.com>
From: hupu <hupu.gm@gmail.com>
Date: Mon, 19 May 2025 13:13:10 +0800
X-Gm-Features: AX0GCFvWBmIak7PGRIy2EGhPENMmUsv7e15cygiqT4GncQ_U-HmdDPKmWf9iwMY
Message-ID: <CADHxFxSGwSBL0SvHGe6peVZ2=T=cz-PERrAiux8=0v_8heAp2w@mail.gmail.com>
Subject: Re: [RFC 1/1] sched: Remove unreliable wake_cpu check in proxy_needs_return
To: John Stultz <jstultz@google.com>
Cc: linux-kernel@vger.kernel.org, juri.lelli@redhat.com, peterz@infradead.org, 
	vschneid@redhat.com, mingo@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, hupu@transsion.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi John,
I=E2=80=99d like to revisit the discussion about this patch.

As mentioned in the previous email, while using wake_cpu directly can
effectively shortcut the deactivate & wakeup logic, it may introduce
performance issues, especially on big.LITTLE architectures. Let me
illustrate this with a common scenario on Android: foreground critical
threads often need to wait for background threads to release a mutex
lock. Under the "Proxy Execution" mechanism, the foreground thread is
migrated to the CPU where the background thread is running. However,
background threads are typically bound to weaker CPUs due to being
part of the background group. If proxy_needs_return allows the
foreground thread to be placed on wake_cpu, it may result in the
foreground thread being migrated to a little core, causing performance
bottlenecks.

Therefore, I suggest that proxy_needs_return() should always return
false for donor tasks unless the task is already running on a CPU.
This ensures that donor tasks trigger a CPU re-selection process,
which is consistent with the behavior prior to the introduction of
"Proxy Execution" and should not introduce additional overhead.
Furthermore, on Android platforms, this behavior allows vendors to
leverage the hook in select_task_rq() to fine-tune CPU selection logic
for critical threads, enabling better optimization for specific
scenarios.

Additionally, this patch has been successfully validated on an ARM64
platform emulated via QEMU. It has been running for several days
without issues, demonstrating its stability and reliability.

Looking forward to your response and further discussion!
hupu
