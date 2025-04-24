Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290C915B0EC
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 14:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745503445; cv=none; b=ahB32B21PWq9HzZ6FGZ/arEmKuJc2fE2gUe/4Q+vXS0yaz3hV2uoI3pO44Xn+QULc2klOkhDlV9bk+ZhImbSi1Wrm41bXFuAlHXYfez78VWMNlGJwmqjA9orHZ0w6ppGQbFHSxgP604Iv5vOdmzCD7ZJ9OU9o758e2QC/Uh47UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745503445; c=relaxed/simple;
	bh=dBqryzxFowwxhppBGiman9vzM6x2rHYiNf1C6NBfwok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hOKpd2y9q5SAiDAua7LMTGbn5/YrVCPQxZopIuwKIvggF3Adnxvhhq9+Pj2pshp2CUzYJRJp+wDrloh/+jnd/ftHkL44rAV+2+f4LE5smeTL9xUedyHFUwDEVcFHTHR52zO7qfksATfH9zAxKUAh996WK1OzQaUulL2SjXnEyXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GYIqTjOM; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GYIqTjOM"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ff799d99dcso1029473a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 07:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745503443; x=1746108243; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6ngV1N+K2wLCHm2Zau2mYRJ29Fj0ceXNMX7YLmapOIk=;
        b=GYIqTjOMhc62tezAScM9lqVg3F3EBCUeMoXsCmHOZI5HDALTE1lNdjLf9Bfdowj15C
         QoKvNN76PrjHlKKm2+TU/Ekwa+Q+bZHVCr4U5ZikocGZl9QS5sQNf0A0oPIpaTJyPdcs
         0t0sVDfQbNpF0wOFova/Emj7aG4/qx0xak6e80pL9D97ryNpES9E0cm911/yXbPbYMeM
         /bEvjahgpfOF3oMt9tby7nJRolavt902Z1tIO9xBqNZKSlGkVgdme8A2V9cZPflsmpqJ
         Qvr4YK4WnyYajaappN7Zbaoclfzdv57EyOynZQkVoG7GU22Rv22V2BVvcoXBVh4F6F76
         /jJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745503443; x=1746108243;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ngV1N+K2wLCHm2Zau2mYRJ29Fj0ceXNMX7YLmapOIk=;
        b=uV4/E9s60TI4uHLifBVXELQHSsKIqZ/WMN4sTRSzujeZfC2ffvdbbLiTHBXHHqtGlZ
         NsvPvClH1NXbTlZnmN17cHsAEFZiHPqUk+vNSVnyG4AiC+CsItRJf0fkgKA9tbWYSbtN
         7flPO6hwo3tuyacadtPg7ZJOXeS+YlwYcpP/VzGn8Q6YVMhgpt7sDhWtsNFPhFLZ1EQn
         ZuXdUXyXDheZ/aU4Q2uD8kslT6BUUOTVsoKXwMif0fvpSKYEEh4yUihXt4+100ecBZCh
         a2/CKhsZemddfXP06gQjLG8iYsH3s1YzwagkOOKvS1JJYazYfncyuLqGRg0U5edTVSSP
         hiyw==
X-Forwarded-Encrypted: i=1; AJvYcCVd81W/H3PTX/hhWvXfkinmpcIpgPFf0fO4o8psIMiVyir3+KYnHNJLWuVnIR1IiIAsWw7DRhWBjl0ulXQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTukWGg13FNA7mmXlfcS1O6/AJ2vNWizKAAP2SMaqNzluue+HX
	WJyqjR+RNoy7LPmnMRj1GWt63TxWwLmNtT5NPx4FXqU546N5AKjh7yjej69NNA5WGqN+3uYT17s
	6KOz4NV08Qr/TzM3OswfVV2LtUGmjFhCmiDXW
X-Gm-Gg: ASbGncsmgvIWtynSHMRmuZyc/qQp/oBydCF7pFR84L53gv7vvHgdfOGAvbvYVSg66Sr
	QeL+umd+btyNtZdtiVXyvr/j8tS4gnTg/Mv8W8stflnm9jUBcbo0rq2xlj1WJ+dF/ErGnwGw2to
	E7BNAeHb7su9ExgTMO9PUJbw8BbAj5r8k0EiYGbl1MYXuOcnykywGx
X-Google-Smtp-Source: AGHT+IFI7REgkeRSxQxSd1FHDaxZf97gZlVyXo0QeWMvvGcT9esWNTNUQbLcm1jfhn6LWHmLFgt6vZLSMvWBK0v7PLU=
X-Received: by 2002:a17:90b:2b46:b0:2fe:b016:a6ac with SMTP id
 98e67ed59e1d1-309ed29d050mr4311829a91.15.1745503443200; Thu, 24 Apr 2025
 07:04:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416085446.480069-1-glider@google.com> <20250416085446.480069-4-glider@google.com>
 <CANpmjNNmyXd9YkYSTpWrKRqBzJp5bBaEZEuZLHK9Tw-D6NDezQ@mail.gmail.com> <CAG_fn=UBVzq3V4EHQ94zOUwdFLd_awwkQUPLb5XjnMmgBoXpgg@mail.gmail.com>
In-Reply-To: <CAG_fn=UBVzq3V4EHQ94zOUwdFLd_awwkQUPLb5XjnMmgBoXpgg@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Thu, 24 Apr 2025 16:03:26 +0200
X-Gm-Features: ATxdqUGU-siYw04IIKznlGV5anGHNOlCDPYBUIfwFfw_Fq57MHjDZ_h43sRjrBo
Message-ID: <CANpmjNM8W67r2W8FNbcDzjaV1HVE5R77ZFgbUABYusgWBzqpTA@mail.gmail.com>
Subject: Re: [PATCH 3/7] kcov: x86: introduce CONFIG_KCOV_ENABLE_GUARDS
To: Alexander Potapenko <glider@google.com>
Cc: quic_jiangenj@quicinc.com, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, x86@kernel.org, 
	Aleksandr Nogikh <nogikh@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Apr 2025 at 15:59, Alexander Potapenko <glider@google.com> wrote:
>
> > > --- a/arch/x86/kernel/vmlinux.lds.S
> > > +++ b/arch/x86/kernel/vmlinux.lds.S
> > > @@ -390,6 +390,7 @@ SECTIONS
> > >                 . = ALIGN(PAGE_SIZE);
> > >                 __bss_stop = .;
> > >         }
> > > +       SANCOV_GUARDS_BSS
> >
> > Right now this will be broken on other architectures, right?
>
> Right. I'm going to make it depend on X86_64 for now.

This needs to be done with a 'select HAVE_KCOV_UNIQUE' or such from
arch/x86/Kconfig.
