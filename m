Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E6C25C803
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 08:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750925453; cv=none; b=uZlGssKDrjN5ou0dm23/Nvmi0/71iEtHf8mQdzxW5GQk97kTG6slWLsga/CLO4yryC+0+XoaS0vPCWXACGyeb1/t0fA17/FuKRkv5GAiqa95Y9TCa/a0UIRKR/tPpi6HjcWRt+D/Fz3D/Fz77KecVu553ayj7C7eH7yA5MZHRLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750925453; c=relaxed/simple;
	bh=aPw+hx+PPvy6iSGn1SJS00R0mk91mLjleKyKR43Sttc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=PcWliaJcgLz3IQvOE/c7ft39AeMzJRuvJj808jcAiRwU2u0uAqB4MrDhR02Y4DHUkeDXZ04utpFSEWkk8GE5UdRxImoXSs4tn/hkwtpA6VRi6yFANkDvueVYvOSAZ1veZiB3zKqEUZ0d1qn/PVgzcxrM/B+H7xFyqRo0B70lXAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=gJmEhL/X; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="gJmEhL/X"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a4eb4dfd8eso99705f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 01:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750925450; x=1751530250; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eqDcDFqVxxmfDYDp+n2CkhXfGQP/jzowgprIS5/mF4E=;
        b=gJmEhL/X00m5iVmp9OZeBEFYtJ07BiknPloTW5yvCdx8e1jRP3r7pByLLic2SlSa80
         n1Sd36XKad/yKTpjdDhL8m/pyylet5XUkJlOrnH+oZQXAo2zfxGOWrykjlL6Yl8PaTae
         Uvo3UmHqdFfuwsNPq/DJpNiWi1cMaM0gm3MMzey7alvXP3r9wL+tGgavfP84RHzNh5W+
         0ieN6h3igJtP2YVbzc1150LT/UTSPMEjWeeymwyqZUsUDz1uowektLnZORg83xKhPXP/
         fThg9VoBRBo2HlTalUB+WQaQM3DuRW78nyuo17kQsEdG7h/q7L5wiMx+fHg6F8TLcSVR
         PnYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750925450; x=1751530250;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eqDcDFqVxxmfDYDp+n2CkhXfGQP/jzowgprIS5/mF4E=;
        b=L9gcARmEV5p7XIW5Z0JEVUATkZ3f9hNcyuNlg1GuS0gmdn/xpZayP7KROUByWtBPeE
         P149VlnZ+yyPvrHhoj/SdIb8F2YUMVv1tz2bM6ig8bvMtQ7TvaIzejU8i/VIQZ5MpBPe
         B6pZmtRujTLznN6Cf90i1IpDI6WdczP04T1Ywk2z7xZOSs9c8IQ4b4olHzxvFJHUMXXQ
         bBCnOqMDLJhRIrErDX67NUq3jtHzdSsHkBRjwAZC6jR/YnKICW57qopELw++N2gUmpIR
         u79qMVx+IpEaRLpx/t9PU/5e+09s4hFtwOGE2dTMdlobXIbw2UPbfBQRwixQSlNd280o
         56Xg==
X-Forwarded-Encrypted: i=1; AJvYcCVTwkJ1eOWbKTvHd1zEmMy8CJNtwxXUUNGgZewpZFlm1nN3rz8bQquR21Gp79UxvvctS/FMCcZfwIdTpME=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVGHQK/29nLZ8HDEBZjlAGqDIsBChZH9fsLamAae9odMQfZKxz
	rNrAuRY+fHUzeJvpaALPjAqrsYnrtcbSNBdaASRoUk6Jb0D9oYCyacCLnCImVEvdkhc=
X-Gm-Gg: ASbGncunhbyuOQqnNl5+wAzv+YazCbYD778bwbgFRLaWtKWXneSvQq0QBoan/ocGlFH
	zBg3SZxdVewLcV1ZcdV1mvy5/iBkkv0QkFDM10a3xbjFdyKCQnipoiObAPZFenA0SlRh3byNHP+
	hEcp5Aw42DB13qGSCvbOUeObROAVrBIIQTwcF15dkuti1P+nK9qsxoLtD2PysB5Zxxc945W2OQJ
	srX40mFVr4rJ0CyJ7x++LhdfPiUzmmi0CZgswRK7Su+PSmwJJo9Yy70VFqGfXOVDEURbcwIy3jO
	Q4RJQEws9SW05Brx68YPU4HERGHHHkuc1PyM/qlWKt78sLD145JyhMGooSVeCUd0lBegdMB1HLP
	b77ohrN7dnladzzbF+gDYxA==
X-Google-Smtp-Source: AGHT+IHSmCzUrd+nL3B2qqDTAaRyJLpa2weNsiFvKQJ1cPJjRjxohsfvUf3LU44ZAaoCQYUEjHLtJA==
X-Received: by 2002:a05:600c:3b22:b0:43e:94fa:4aef with SMTP id 5b1f17b1804b1-45381af75f0mr24351205e9.8.1750925449799;
        Thu, 26 Jun 2025 01:10:49 -0700 (PDT)
Received: from localhost (ip-89-103-73-235.bb.vodafone.cz. [89.103.73.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e810977esm6616970f8f.83.2025.06.26.01.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 01:10:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Jun 2025 10:10:48 +0200
Message-Id: <DAWB9QUQGPAZ.Z5454RAZXOF7@ventanamicro.com>
Subject: Re: [PATCH v2 3/2] RISC-V: sbi: remove sbi_ecall tracepoints
Cc: "Palmer Dabbelt" <palmer@dabbelt.com>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Atish Patra" <atishp@rivosinc.com>,
 <ajones@ventanamicro.com>, <cleger@rivosinc.com>,
 <apatel@ventanamicro.com>, <thomas.weissschuh@linutronix.de>, "Jeff Law"
 <jlaw@ventanamicro.com>
To: "David Laight" <david.laight.linux@gmail.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250619190315.2603194-4-rkrcmar@ventanamicro.com>
 <mhng-516082EA-5A9A-4A76-9448-70828749F95F@palmerdabbelt-mac>
 <DAUSD38QIV6D.1YO5ASNI3EUGV@ventanamicro.com>
 <DAVG8M70SJ4Q.ZSTC5VSJWGSK@ventanamicro.com>
 <20250625093415.53fd21cf@pumpkin>
In-Reply-To: <20250625093415.53fd21cf@pumpkin>

2025-06-25T09:34:15+01:00, David Laight <david.laight.linux@gmail.com>:
> On Wed, 25 Jun 2025 09:51:45 +0200
> Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcmar@ventanamicro.com> wrote:
>> 2025-06-24T15:09:09+02:00, Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcmar@ventanam=
icro.com>:
>> > For another example, let's have the following function:
>> >
>> >   struct sbiret some_sbi_ecall(uintptr_t a0, uintptr_t a1)
>> >   {
>> >     return sbi_ecall(123, 456, a0, a1);
>> >   }
>> >
> ...
>>=20
>> GCC 15.1 still leaves "mv" outside the branch, but at least seems to be
>> on the right track (undesired overhead is marked with leading stars):
>>=20
>>    0xffffffff800236e8 <+0>:	addi	sp,sp,-48
>>    0xffffffff800236ea <+2>:	sd	s0,32(sp)
>>    0xffffffff800236ec <+4>:	sd	ra,40(sp)
>>    0xffffffff800236ee <+6>:	addi	s0,sp,48
>> *  0xffffffff800236f0 <+8>:	mv	a4,a0
>> *  0xffffffff800236f2 <+10>:	mv	a5,a1
>>    0xffffffff800236f4 <+12>:	nop
>> *  0xffffffff800236f8 <+16>:	mv	a0,a4
>> *  0xffffffff800236fa <+18>:	mv	a1,a5
>>    0xffffffff800236fc <+20>:	li	a7,123
>>    0xffffffff80023700 <+24>:	li	a6,456
>>    0xffffffff80023704 <+28>:	ecall
>> *  0xffffffff80023708 <+32>:	mv	a5,a0
>> *  0xffffffff8002370a <+34>:	mv	a2,a1
>>    0xffffffff8002370c <+36>:	nop
>>    0xffffffff80023710 <+40>:	ld	ra,40(sp)
>>    0xffffffff80023712 <+42>:	ld	s0,32(sp)
>> *  0xffffffff80023714 <+44>:	mv	a0,a5
>> *  0xffffffff80023716 <+46>:	mv	a1,a2
>>    0xffffffff80023718 <+48>:	addi	sp,sp,48
>>    0xffffffff8002371a <+50>:	ret
>>    [Tracing goes to +126]
>
> How much do a few register moves/spills matter compared to the
> cost of the called code?

I didn't do any serious analysis... In general, simpler functions are
going to suffer a higher ratio of overhead from adding tracepoints, and
the constant overhead per added tracepoint increases with the number of
its arguments.

For a trap to kernel mode that passes through a dozen tracepoint sites,
we could save under a hundred instructions if disabled tracepoints had
the minimal overhead.  I don't have a good idea how much of the total
trap execution-time/instruction-count/entropy-increase that actually is.

> There will but much worse things out there if you look.

Definitely, I am trying my best not to look, but I sometimes happen to
stumble upon something, and try to understand it.

Waiting till the tracepoint overhead resolves itself sounds fine to me.

Thanks.
