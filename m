Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9DF1F180C
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 19:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745697335; cv=none; b=af5qEenb3XDfpeBLRTjy5Jf1u+hIIMoaK5OcC/0gUV9SDEtmzmzbKZe/teWaJxkTOEM2SV0fZ4KQ6e7VOQH7YYz7CVh3pWjQxwJec+AzhozQ2bFrVvHdiAKOfJMajGXlDbh2gm14RTlIjpTgHOiej8u+SQKjW8Fu3r2/LphUOb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745697335; c=relaxed/simple;
	bh=xTyDJ8s5RF89A3fUokvu73dsKgZpddM2D6r95ukSdAg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uPyN+KZk0fNBnU5MX/XZub4PFlGiBuyf/iKJZBV4eupKYVcV7mmPwku34QsuLdr8H/TLkEoOJ5YwoiwiBhIowYqV3B5RLUui3oHJ60u4dZkBYd0YhfQ7iWUhbb6CoSabBAks2sexodJGIWs7Zv01XUpd+QKrwPHRku+gNqeH1zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=YVMBEcV7; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="YVMBEcV7"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ace94273f0dso82474666b.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 12:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745697332; x=1746302132; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aftG49fJm+Fa9LC9HlUDxoFYsWgicnJbWUzkp620LLU=;
        b=YVMBEcV7gG4ZZqtRpfItcdGSjSd++/lZr7+dzWeAScKyuylwR/Ww3KG15Pm0E2XHlC
         X+KUo/B7Q1Mlbr0TULNKbc1vr4UuF0Ys2wXDrPQ0Ofz6RCfAgb2ynW7aHWNKHWa2wYCG
         u2EVnT35UNHjhj5HHp+7n2jSyud/BPgUtx/EM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745697332; x=1746302132;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aftG49fJm+Fa9LC9HlUDxoFYsWgicnJbWUzkp620LLU=;
        b=pWcEI+ygWBj0vtds6AvXhTkmDWyy0Cm4s2OK0oyQZjo74nm43fV1suGmCfENB5WDsj
         b6qQMN2p7l6OAWKCDjMCUA76xkfncKoUHBjtnWwxebh6+FMgARsx8IHPa7XFSxWdEqiY
         XTxZtfeKV3/T54FC8FxOsd4le/G0YKA1SVud3fXcuoZZj8Bsqd1xdolqTcTWptf6Vug1
         VCa/wuyFm2XZZw9iC+rgCKpo99RMjkMm6RosxW7BAR2TOnrhWPwL5ulqRpO81v6/NoOf
         Gn4hO5DihyCksaJlFMdT2PrP8DUtOGWuJ34GQ8wh9JlyJ7uMC2YMcF3UjIabqGv3J+R3
         KgpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGLYM3S+6KUS7HhnDR3It8CqbxEzCcZLzAPil0Rp3yoA7iHctq7Soo3JyuE/hmoJhTkl35KIHYe/v/0rY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPTaFzRXDAPnBjrVGSw/gidhOETHlOq4I2dobK8wjJgBf87UcJ
	QFZ28CnWa23z4shNcThLRURPtAf1QEGy0aFlyip2Xl84EP33lMyTHICZf+u+6ReolJcJazRxAlo
	5tIk=
X-Gm-Gg: ASbGncsUlTOuL9DG/owlMwRC+z26jVt1CN/j5s7e2ESDqqO2rV09Ztdylww5uXEQive
	jGochyiWXxNp2h3ztzHUie9CS+8FWVuvCDOuH5x0m9+3nek5dd4e8ITbXc7vIhv38qzo+hvI6bB
	Serm9gln72G/gXDx51eixbB6F92KbwDO+OrxVn1zYuz9zBNQ+HrmSiOhiCTGKIhwj0TJIx3OB1t
	QMwpHgUHPRLRGjx/GjxhEvugTbvCtsc/qAoWxmSz9EBZCtWmxrvJMt3V3IY9b6SYZwNuyRRQB+A
	WZsTKXAwyRdYtK+qRwWBhzyiEai/On+6yiu1aHPxQ9yy3gP+hKUIhaHU5hPjW7fYJvrkjcl1jes
	eosrzAbet0NZNpiU=
X-Google-Smtp-Source: AGHT+IGgFYNO/cQsUzbz2X6U5O8d2ly9uTle4iOYm4R2ut5+IVgQDjYrsmV8syEMS4KF+hLzq2BhCA==
X-Received: by 2002:a17:907:6d24:b0:aca:dd0c:cfc8 with SMTP id a640c23a62f3a-ace7104e318mr628279966b.10.1745697331659;
        Sat, 26 Apr 2025 12:55:31 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4e7d93sm338252166b.51.2025.04.26.12.55.29
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 12:55:29 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e5e0caa151so6516463a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 12:55:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU3Xq+T4ndTgyTFSEyRDTooM0d3YGdhQeVOBai6kjw7+4Fi5Mw6SZcfNIKzSOAGmppKu2kC9AbYjcmJa4Q=@vger.kernel.org
X-Received: by 2002:a17:906:dc8b:b0:ac3:26ff:11a0 with SMTP id
 a640c23a62f3a-ace7133c83emr662400166b.38.1745697329459; Sat, 26 Apr 2025
 12:55:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425141740.734030-1-arnd@kernel.org> <aAyiganPp_UsNlnZ@gmail.com>
 <d2b0e71c-e79b-40d6-8693-3202cd894d66@app.fastmail.com> <CAHk-=wh=TUsVv6xhtzYsWJwJggrjyOfYT3kBu+bHtoYLK0M9Xw@mail.gmail.com>
In-Reply-To: <CAHk-=wh=TUsVv6xhtzYsWJwJggrjyOfYT3kBu+bHtoYLK0M9Xw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 26 Apr 2025 12:55:13 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgfk69H-T-vMWR33xUpVsWJLrF34d0OwUXa2sHhtpSwZg@mail.gmail.com>
X-Gm-Features: ATxdqUHx162ag34plcJL88OxLQAR-HzI_SClvQLeiGcjSBwah8R9mtvrxHJPTzY
Message-ID: <CAHk-=wgfk69H-T-vMWR33xUpVsWJLrF34d0OwUXa2sHhtpSwZg@mail.gmail.com>
Subject: Re: [PATCH] [RFC] x86/cpu: rework instruction set selection
To: Arnd Bergmann <arnd@arndb.de>
Cc: Ingo Molnar <mingo@kernel.org>, Arnd Bergmann <arnd@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Alexander Usyskin <alexander.usyskin@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>, 
	Mike Rapoport <rppt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 26 Apr 2025 at 12:24, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> (And yes, one use in a x86 header file that is pretty questionable
> too: I think the reason for the cmov is actually i486-only behavior
> and we could probably unify the 32-bit and 64-bit implementation)

Actually, what we *should* do is to remove that manual use of 'cmov'
entirely - even if we decide that yes, that undefined zero case is
actually real.

We should probably change it to use CC_SET(), and the compiler will do
a much better job - and probably never use cmov anyway.

And yes, that will generate worse code if you have an old compiler
that doesn't do ASM_FLAG_OUTPUTS, but hey, that's true in general. If
you want good code, you need a good compiler.

And clang needs to learn the CC_SET() pattern anyway.

So I think that manual cmov pattern for x86-32 should be replaced with

        bool zero;

        asm("bsfl %[in],%[out]"
            CC_SET(z)
            : CC_OUT(z) (zero),
              [out]"=r" (r)
            : [in] "rm" (x));

        return zero ? 0 : r+1;

instead (that's ffs(), and fls() would need the same thing except with
bsrl insteadm, of course).

I bet that would actually improve code generation.

And I also bet it doesn't actually matter, of course.

           Linus
