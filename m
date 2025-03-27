Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B540E1B87C0
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 13:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743081464; cv=none; b=j3OVlkcT8Nzwc5eXJaaR3lIwcltBGC8AyUsWgHrwnbmPVxLFNd5wNMcMj5ZLTEVQ3B5EbjZHoGNI/1xKKvqnCgQqC+dtvq3/mQSIp9Ob1HwCYnr7xwxgFQw8BOJZhm0g85jbZLDxEdvy1ICy6+9kAoggLuVk1fXcNJYB+tJCCVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743081464; c=relaxed/simple;
	bh=9DRpbO/laZRlrGDbB6eJj1DVHnezphlWfDR2GDoHqYQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ASqdrr2JR0FyqpezCVHS/Q1Bh13xtYuPbKvi45sLL62WI+zzNMK4XRBYg0y3e7hjfzzHpa4Sv9/8yM4avr8cW0zV4QTokCjmGfJqwXyq6UO16W4/GR29hjLdfW9Z+pp9tPfSTc15U6aA0Gl5kcAVd19hRkOy/EKax8th/3hRsns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yJWEViTb; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yJWEViTb"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-47677b77725so10506231cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 06:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743081461; x=1743686261; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9DRpbO/laZRlrGDbB6eJj1DVHnezphlWfDR2GDoHqYQ=;
        b=yJWEViTbLuLX4Aa4sysA6+8I02JP67QKyMdCzn2TDDmEWWrHXq/ZX+ALIsEgvuvYrg
         /pLobXp75Ujsed2VPZGXMy5xacqXmDJTMCzXvIw4oa6gj1Gl3qycJ8K485NlfddGk2bo
         RZtlKUaI/K4y9v7uIKQQFFhVY0aXOBsv9WsWJEQp39Hs3glkdcsz+B7HnVTTw8dyYNC7
         GMX3+EN771eJkzDoCXcLMGF2mGueYJNfMKwvZDoOLAwzy9RDVOzwIS1nI61APlggUPbA
         E0uMkEQcEnzcXnAP/AKX1de+uTSdjvmGE64mkIUUUxvMJyaK3m8GA0oNakaZC/Tz7uhE
         xhRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743081461; x=1743686261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9DRpbO/laZRlrGDbB6eJj1DVHnezphlWfDR2GDoHqYQ=;
        b=KZEff0cHfVykg5GVv0f7Fj8zA8185BZqlObSf54+PCYevmM65PN+/I+GfFFOuV9rtB
         r4XIdKHnbKHAlXZwpEbhb7xJpV29f/Np6VxvFuevZyVVXrZrQrjflfAuxrODfdAq9BCu
         AoK8XM/iVPDLaj7sfwYE3kSkJC/1SohqtEQdPsvwSuzQoXRwZ06keDgjw/HgHVR53syn
         x0b9PeQbJ3YAN971FweJ2x2R5MfU0+2ICGOZTUi949M+taJq6gRNAwPaTLtMZVuTRHZf
         36G6u3ESOoLtV3vo4Yp7+eiVRzfS0Dkhmepc3g9cypH55bl+Ag3LYzFY1rOPdYCW1Re2
         EMjg==
X-Forwarded-Encrypted: i=1; AJvYcCV+5eSBRgUq/qCucksI6inbeL+/CeiZ6XiRzHpH1/+ka5AXvAvm2pt1emSF3perA4RdAuRZiiGq1Aug2x8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFKVb9XxvyBBiwZclsyfgzvOvB4i4eBgW73I3+1jEZt4ZPcoez
	WL6VpDSg7QwHgVK2DlQGlPb5Lzg45CcV0dj6Krn7nn+jY35V0WJmrF5xC7YGVpjmX8JcgxUKSdU
	qSkaoJoIXA7FJPHfsZb/P+IsJ/zstuyac7HUKhonma2CNsYAl/Q==
X-Gm-Gg: ASbGncsqaK8rzNynfCrIOZGjRamq0tWjDN6mBF7RrNetPsF3RiNeSg/5yoK3ian/sgQ
	Ac5WwjwZ34IRSnUEmD+6m/a/a81MwZs4xEA0jpEEGldSE6oxI2FY1SN72/7pz1VZhFJ75UAYXfs
	gXOt6J0BeL5RM0c527XjKqlFTD820=
X-Google-Smtp-Source: AGHT+IEWBIKYVf0v48fp0zwlf/Iaha02NsHdBDRjn0S/B7uo/GW8mi5KZnJ1xg+0SS2zN6aJiXcCTXDt0md29z2NxSI=
X-Received: by 2002:a05:622a:1446:b0:477:6fdb:75d3 with SMTP id
 d75a77b69052e-4776fdb7666mr43014251cf.4.1743081460695; Thu, 27 Mar 2025
 06:17:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202503241406.5c9cb80a-lkp@intel.com> <87pli4z02w.ffs@tglx>
 <6sn76aya225pqikijue5uv5h3lyqk262hc6ru3vemn7xofdftd@sw7gith52xh7>
 <CANn89iKjCgmxtiLeVAiXODHbbR7=gYYi5cfAS1hS5qn+z=-o1Q@mail.gmail.com>
 <877c4azyez.ffs@tglx> <CANn89iKAkio9wm73RNi9+KngNaS+Au2oaf0Tz9xOd+QEhFSkyw@mail.gmail.com>
 <CANn89i+nAN+p-qRypKxB4ESohXkKVPmHuV_m86j3DPv6_+C=oQ@mail.gmail.com>
 <87v7ruycfz.ffs@tglx> <CANn89iJvxYsF0Y9jH+Oa2=akrydR8qbWAMbz_S6YZQMSe=2QWQ@mail.gmail.com>
 <87jz8ay5rh.ffs@tglx>
In-Reply-To: <87jz8ay5rh.ffs@tglx>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 27 Mar 2025 14:17:28 +0100
X-Gm-Features: AQ5f1JoGmxVZSAGdTOg2wWSOeOkq_wZ9f2AcSbIhDi26H4jWYlCUDcAK11n7cN0
Message-ID: <CANn89i+r-k-2UNtnyWC6PaJmO_R6Wc6UROgeoir5BmgVV8wDqQ@mail.gmail.com>
Subject: Re: [tip:timers/core] [posix] 1535cb8028: stress-ng.epoll.ops_per_sec
 36.2% regression
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Mateusz Guzik <mjguzik@gmail.com>, kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Benjamin Segall <bsegall@google.com>, Frederic Weisbecker <frederic@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 2:14=E2=80=AFPM Thomas Gleixner <tglx@linutronix.de=
> wrote:
>
> On Thu, Mar 27 2025 at 12:37, Eric Dumazet wrote:
> > On Thu, Mar 27, 2025 at 11:50=E2=80=AFAM Thomas Gleixner <tglx@linutron=
ix.de> wrote:
> >> Cute. How much bloat does it cause?
> >
> > This would expand 'struct ucounts' by 192 bytes on x86, if the patch
> > was actually working :)
> >
> > Note sure if it is feasible without something more intrusive like
>
> I'm not sure about the actual benefit. The problem is that parallel
> invocations which access the same ucount still will run into contention
> of the cache line they are modifying.
>
> For the signal case, all invocations increment rlimit[SIGPENDING], so
> putting that into a different cache line does not buy a lot.
>
> False sharing is when you have a lot of hot path readers on some other
> member of the data structure, which happens to share the cache line with
> the modified member. But that's not really the case here.

We applications stressing all the counters at the same time (from
different threads)

You seem to focus on posix timers only :)
