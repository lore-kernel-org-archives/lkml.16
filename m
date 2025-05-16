Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604B719FA93
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 12:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747397885; cv=none; b=JAEQYWeBRNk9joVY3uBbiQY2T2T/mWvyIF7XxXi1sVuS3Mn6MlnUHkDcMrCs02/Sz5kcD57+0nTALMXSkqrakBj6HcCZ1fCOCCadwS2LvXqYvbK37M1SB0jkbW+oh9VIINNyIgJXTc2AAkwfy43yB+zCUHEr07++wp2NJqV0gdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747397885; c=relaxed/simple;
	bh=hweRMDBbMgYEt5Dl85UjPVti8UDtwdriVOJKL4UqFLY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jRofe59WwVkhzgEj+vBa3F0DH9X9t+0DLwqP6EGzywckTJME9VK0Qnbdmgho6RnrYohfWQfnzLaYssoJT03QCNtyfznEzwClmM3QgLN/xw6LRyAZJXBc6ldrHeIUPpm9wyZ6laqZ+B4s9PLCHZBAuESno7s1mXS6s3pZ7CEFde4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eL3egZ0L; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eL3egZ0L"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so21029515e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 05:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747397881; x=1748002681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X47ZGQTdlEcBRUJmRih6LvTVvMFGNhFYURx88/HuE/M=;
        b=eL3egZ0LR8tL/icOuO1WISzyHq5p/7eHsAGe8niRYdyVwPD6IlfafHeFHcMpPwwCLk
         amdxBLAUpHGeD+TgnSs9NMtJJqWtOv8ypPjBjLR/vac+MIGgkcxmJlfTqxGuqgU1XfVh
         aUnhAP/JWlb56YoD+dYFoL6l5Kx9zw67UntaLvXhhPCueMVJkDsmdp9r+OELEtcvhMzf
         5EFOvbp1VbLLibBx+HD1th6DxbzP8mJunlEFaRvLjAS7x6W9dCbel+8OOqUJxpDOGROs
         8w/ApW8n/AxecKF7tGyFLy8XdfFjltZJh9Pa7KtjmFrMciQTKzmTPtUxonUWLyDJx/zs
         75tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747397881; x=1748002681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X47ZGQTdlEcBRUJmRih6LvTVvMFGNhFYURx88/HuE/M=;
        b=bDOBcdWsxQE5LIrXo8E+x1ceVIS5t2T30YLtnsnvarqkFlKJ9uBif2s5Zm8Vkenkvj
         dfSS1t4+K0ZWWZfkHGz6+J1vwZWQNQiTRtqtn+bh/mwXqUhhw18l1oh/dZ/AkJTmr/0F
         BBOgZx3OW/4WHiFkZAVv5N2Tr6TWeIhLQgL3SJfFMz+CJulTmhAoFN7oLwm8ocjUM4tj
         P6ElxpzQ1i077+ECOop2xVZQxMjn0eAu0RwWYZMJGd02b6UfGFdqAyjyPic7OEQI8+P5
         lYv42vOS3GaoSfRbepDBIzTmwBEair6axdXPvebO00qUxD3Di5d+zQs2EBX6cGNKeoSr
         IPnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSvGjNSsUb9he3mmbdmzt0gQhHY68HZsIsPS4C5wAMN5JHpl3nkXW5KZ+4jit0vVFTNrLozv0NraMsWs8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9j8b27WzbCLyyyqXBpObJpvgwU3X33YT8RzNCh5aIGPP7yfhE
	2PcbCoDWKrb0yKLoSnhbacg2+o/70yCR3otGNfQIvrbXZzTwav4fyUPX
X-Gm-Gg: ASbGncuKQvZMO+N/grW3bG4P/b0aF+eEqd7cBR+I0/C11PRsw3MQPRNUyHSnmbz4OyK
	NBv0hjEbGq6rhThh5bvnziZysDZtTsZ0UU6qEn/NwIPAufatlq7kKstFM/ZoGZIySCUUip/+1fa
	17Le2e6zOPTVoQk2lFrZ53gvP+sosl8+cBvZXPRdtA2d5DoU72F2/KkkdaU6pB9fK5b4W54S+Jv
	SqjIIZdGmW+fgHbL3Kl1m169mB2jqEaclQeoQ248VX+M5dWi3ZSkx6og2+0GS2vV3thiw6L9rPw
	awd7ktkKAlDg48uRtmfiEXJ3v7gJvm3RyX2oBODaXRY1X8j/kcFh4Np0WMP5cyqaMYTH306Nteq
	usfaWFeoWIsRcIA==
X-Google-Smtp-Source: AGHT+IH0J1ELfcQkOEshGXIHJbKTcVdYhtFdGW7TPb6gIpDGduQddR7Mrc0J+r4kneCopXMfacaOQA==
X-Received: by 2002:a05:600c:8889:20b0:442:f44f:66f with SMTP id 5b1f17b1804b1-442fd672542mr20883745e9.31.1747397881313;
        Fri, 16 May 2025 05:18:01 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f39e84d3sm110946875e9.32.2025.05.16.05.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 05:18:01 -0700 (PDT)
Date: Fri, 16 May 2025 13:17:58 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 Nicolas Pitre <npitre@baylibre.com>, Oleg Nesterov <oleg@redhat.com>, Peter
 Zijlstra <peterz@infradead.org>, Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH next 0/3] lib: Implement mul_u64_u64_div_u64_roundup()
Message-ID: <20250516131758.2a304d1b@pumpkin>
In-Reply-To: <5e7mp3nreaadppjhxhpffyff2d2ccwcjf2suonxe43eofngddu@qfufr2wiw7yn>
References: <20250405204530.186242-1-david.laight.linux@gmail.com>
	<5e7mp3nreaadppjhxhpffyff2d2ccwcjf2suonxe43eofngddu@qfufr2wiw7yn>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 16 May 2025 11:47:58 +0200
Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com> wrote:

> Hello David,
>=20
> On Sat, Apr 05, 2025 at 09:45:27PM +0100, David Laight wrote:
> > The pwm-stm32.c code wants a 'rounding up' version of mul_u64_u64_div_u=
64().
> > This can be done simply by adding 'divisor - 1' to the 128bit product.
> > Implement mul_u64_add_u64_div_u64(a, b, c, d) =3D (a * b + c)/d based o=
n the
> > existing code.
> > Define mul_u64_u64_div_u64(a, b, d) as mul_u64_add_u64_div_u64(a, b, 0,=
 d) and
> > mul_u64_u64_div_u64_roundup(a, b, d) as mul_u64_add_u64_div_u64(a, b, d=
-1, d).
> >=20
> > Only x86-64 has an optimsed (asm) version of the function.
> > That is optimised to avoid the 'add c' when c is known to be zero.
> > In all other cases the extra code will be noise compared to the software
> > divide code.
> >=20
> > I've updated the test module to test mul_u64_u64_div_u64_roundup() and
> > also enhanced it to verify the C division code on x86-64.
> >=20
> > Note that the code generated by gcc (eg for 32bit x86) just for the mul=
tiply
> > is rather more horrid than one would expect (clang does better).
> > I dread to think how long the divide loop takes.
> > And I'm not at all sure the call in kernel/sched/cputime.c isn't in a
> > relatively common path (rather than just hardware initialisation).
> >=20
> > David Laight (3):
> >   lib: Add mul_u64_add_u64_div_u64() and mul_u64_u64_div_u64_roundup()
> >   lib: Add tests for mul_u64_u64_div_u64_roundup()
> >   lib: Update the muldiv64 tests to verify the C on x86-64 =20
>=20
> I wonder what happend to this series. I'd like to make use of
> mul_u64_u64_div_u64_roundup() so I'd be interested to get this into the
> mainline.

I've a WIP rewrite of the divide code, speeds it up considerably for
'not amd-64'.

IIRC (the test machine is powered off) the test cases with random data
do down from over 900 clocks to below 150 for x86-32.
The 64bit code (on x64-x64 but skipping the divide instruction) are ~70
clocks rather than nearer 180.
Both those clock counts are almost data independent.

The code relies on the cpu having an 'unsigned long/unsigned long'
instruction.

I got reasonable code for 32bit x64 running gcc 12.2 from debian.
Then copied it to godbolt and found gcc before 15.0 making a pigs
breakfast of it (all clang versions are fine).
So some rework.

I still need to actually plumb it into the kernel sources.

I do want to test the divide loop on x86-64, at least for 64bit.
Probably by including the code directly into the test module.

	David

