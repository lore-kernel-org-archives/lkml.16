Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121F121772B
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 16:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745945421; cv=none; b=KhjNXIpdI0aNnw05mEoci03CMB6E5T944SlPfGm0JqhlpZJ3NKN/dNAwRJnXD9WzhL9HdsUi6Y/QTZpK/A4JQFdMh0ezN1w8IFMWBLeCRDbo2DFZlZV7dZbthZjBlNVEGbrRFXPmRd6xC0Sr8Cp5ncSokuN5b1Dj67ZK/2u74JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745945421; c=relaxed/simple;
	bh=JN4D2Zk5rI7nByYKsBZdJAGWppeR8Kb9krtx05j2M/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UXu5J5zFF+ZhaZnCrHiAl7DB3ZggFYT3OHDd/4WBqHawL549sFABvk9FHJCBj9zXO15cASd6qeztxnYGycxhy3cZ+Bxql6XLZ7BxpdlV3P2hR/k8t/F+1zrq1G24ElIEM68qu4fhOMOJZEtUn0OEWgnaem5AZZsnRSbNI0D5dAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=cK0sIncI; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="cK0sIncI"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e5cded3e2eso9749452a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745945416; x=1746550216; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Bax2H6y3LHulnVcF9K5n+9AvR5ikjgjeo/HnvQSbdRc=;
        b=cK0sIncIg/+N6+0A+01JcNsX7GlgdrG6uZuZ/+vcHcWhteMRgPsl4QNtRczMR4RigL
         YxNnBGRhbR8+Qh46H0ZbFV6hEEG16HLgxhhOhLqoedMXj8o7SAwvDFuekOXrHObEohlT
         wlBPzTwusu+FdLs+MiLsrkjPwMWkPILKPcF3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745945416; x=1746550216;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bax2H6y3LHulnVcF9K5n+9AvR5ikjgjeo/HnvQSbdRc=;
        b=g7lzVhYjEhxpOW6pRxV349FSikQoOitXdiqfJNgdl0POrMepuL3mt/i5RaSFO4Lt0W
         kdtxlkc33H0EbMB6ldq2DW+jOyCPO8hAT0BvcOth1v/Tb4QvMh/YsRkBYRRMGmu4+JG5
         arJL5TDQf8H55vLK0FAFjUR8nKyi/sVpmX4ufUHpzTDwD57SPKDdbKrV6WrlZK3EpLGh
         mZX0F8Kxfw0ApnTCT4yx9fKgSfqR3mp/X23WtGNuHM6Ux00unrrBGAAfwM14nKgjQzNj
         Xk9Ms13c5qvzHDgDul0KmYTTtcOVMerZcDN5sWBY0NSwRwlHltz4vYeA2stBSIDysZBU
         BFBA==
X-Forwarded-Encrypted: i=1; AJvYcCV2icnRS3EeeNlt41CyF+UDl9yig6jvOUlXEWl2a1RFjI6RpIowU+/jf91kgM0zsjvZMa9TcgbEdKsZIko=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOGJi7NQn+wxtzu5e98xt16gZ+5DSD4XVufSqQovZXvav3F+Qx
	bcgSOqbUolini3cn3+wVN0DO/P6MXQwEFXZD2rXEI12IRPRvEyvbfHANTKFOHiDqq+NYxu8wEzI
	Lj405mg==
X-Gm-Gg: ASbGncsKYbOI6qvRmW0CobRYBykDevvc6SDnHseZoG2o2dA/JDVOzrF0OkQ8On6LdMp
	9qkxx8P424xlb6fKA4Vi7IVf4VNGNZnqMELdHPkPO+9ITG8odj1GZw8RkaW10Up5/J+KiA69vcZ
	uFatGEQHqna/D+9TiOEEWTMOUUETiSIcTuJLJDvNDpyzSr6CrmgDP3jipNhEjvTi4CqlHInyvCT
	tZdmqMRYrDofhZ/Ysc0yJfHFWua0zDRh0JH47ArkfYH3NOLsc3gnvgcW0cfNcPNclVhuQYCpWel
	8HFvA3yFypvnzloyAG5TYUsnFBuO9LUEjgzAsv/liqUFOFnT8qOYbCvcU2+8rrgwIWeKhVCQg0Q
	1dLJG3on+yWCP1+8=
X-Google-Smtp-Source: AGHT+IF3v5ZY2aypq5SLPcTsi+QR9KKQmrW0a+W9JaPgxx+qXR9mni9CgG5P0ni1nmKYuQmUnWmqtQ==
X-Received: by 2002:a05:6402:3586:b0:5e8:bf2a:7e8c with SMTP id 4fb4d7f45d1cf-5f83b0c3df0mr3639747a12.11.1745945416246;
        Tue, 29 Apr 2025 09:50:16 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7016f5dccsm7659208a12.37.2025.04.29.09.50.14
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 09:50:14 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e5cded3e2eso9749395a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:50:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXyRJgWbg7FFHh55FdENaAhKSyS02sFWCHavu/6fd3u024yfPmhoyWnc/3ctatMKufEqc9KnPp2QTMWzaA=@vger.kernel.org
X-Received: by 2002:a17:906:f596:b0:ace:3a3d:7e35 with SMTP id
 a640c23a62f3a-acedc7528b0mr8000466b.53.1745945414375; Tue, 29 Apr 2025
 09:50:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231001131620.112484-1-ubizjak@gmail.com> <CAHk-=wg6P8pPg-x4BPUQj-wE0xC7HkGzFk89ftuji8MVo+RRxw@mail.gmail.com>
 <CAFULd4Y+HXuditB51Q0LznqiBsvxJr3BjEYvx4_224XmqrycCw@mail.gmail.com>
 <CAHk-=wh+cfn58XxMLnG6dH+Eb9-2dYfABXJF2FtSZ+vfqVvWzA@mail.gmail.com> <CAFULd4Y-gr+UAvi4m1-p4MnJyMv3NRcyH=TFLZfFfNngnE_Kpw@mail.gmail.com>
In-Reply-To: <CAFULd4Y-gr+UAvi4m1-p4MnJyMv3NRcyH=TFLZfFfNngnE_Kpw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 29 Apr 2025 09:49:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi4ji10PR35r0FqiKA_XYO38gLbZmPN4SYursP9fiUcXQ@mail.gmail.com>
X-Gm-Features: ATxdqUFO5AtgHfDl3tSQG_ott7SOcnzAYniamHpACqHfjo7yPxS6fSz3muFWdf8
Message-ID: <CAHk-=wi4ji10PR35r0FqiKA_XYO38gLbZmPN4SYursP9fiUcXQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] x86/percpu: Use segment qualifiers
To: Uros Bizjak <ubizjak@gmail.com>
Cc: X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Andy Lutomirski <luto@kernel.org>, Ingo Molnar <mingo@kernel.org>, Nadav Amit <namit@vmware.com>, 
	Brian Gerst <brgerst@gmail.com>, Denys Vlasenko <dvlasenk@redhat.com>, 
	"H . Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Josh Poimboeuf <jpoimboe@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Apr 2025 at 09:31, Uros Bizjak <ubizjak@gmail.com> wrote:
>
> FYI, after GCC PR 111657 [1] was fixed, gcc-16 will generate the following code:

Well, that's certainly a lot better than the horrible byte-at-a-time loop.

Did you verify doing a structure copy the other way?

Because the segment override on 'rep movs' only works one way - it
only affects the source, not the destination.

So while

      #include <string.h>
      struct a { long arr[30]; };

      __seg_fs struct a m;
      void foo(struct a *dst) { *dst = m; }

works with 'rep movs', changing it do do

      __seg_fs struct a m;
      void foo(struct a *src) { m = *src; }

can only work with a loop of explicit stores.

And I see in the gcc bugzilla that some gcc developer was confused,
and thought this was about calling "memcpy()" (which should complain
about address spaces rather than generate code).

But structure assignment is a different thing.

             Linus
