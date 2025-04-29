Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1333127605C
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 22:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745966093; cv=none; b=XSX3MhcFS4Jstq1kKS1DOawy4S7QaR7jXOrNL2ArXJB3F7i5cyXgsS5u5ReMF1fd98UHWCwfpWaW3oT2o4by0ive4G9oZgUs4ZETxPOKJl0B4RuTGasiYkHvbo+5YXwV6FeQLtORU7xS93aJAN8vk520kY+4oV0uLVd2XL0qT1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745966093; c=relaxed/simple;
	bh=gAr+BrqBJITgHMHyo/kDsJnGM8ocNeBKLWFTo9CH5Jg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jNRiZX6qik4BdN7fyBwLPWGg23O6xAKbpy9Mia/AeKGGl1q+UnPsmoukvX1asaBbU29DmVSpMeMhcI23raw34it75mltq/9soAqPn4ozM2xqfVes+2MYIs6HnAW249pxP3lKT38bYFzW3qdUn/NO4DkhE+/0syRAn8KR4s9dnwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Ja9SKEOa; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Ja9SKEOa"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac7bd86f637so59625566b.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 15:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745966089; x=1746570889; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Oc5Kg3k3xlsA9pOUU6bgWUdMQMuuSGtxKsnW3LcmO1M=;
        b=Ja9SKEOasKq+F2Y+7d5++a4ZSM9IqL70aJJyVaxPzL0QYcRXnvfamDzy44cEuRLiRp
         hA+oKgBYJ1w5RLpHODvEm8p39aCOd5ZmQLGGVbI34JR/Yi6Y9QW3pHypF+k29+/p2EuT
         tJwWxUibm+O5jOqzAGtV7imFDKskqL7tezoWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745966089; x=1746570889;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oc5Kg3k3xlsA9pOUU6bgWUdMQMuuSGtxKsnW3LcmO1M=;
        b=qZKslvky53vSX4RSy3Her9cX94a7YH+oeiqe7GtTPelXuDsEkN3/LM/H4wj1o408Lo
         P2IlMVWnCSpgltKiaSQewdUYK0uZYnR6MxqIliRM/7oGo9JrkUzDGN68kOrdE8rDBXWF
         HhmcjAIqLHCA0xULO1RZpm1CqaoK669t9C/Lvzy3Cz1ndU1sVoS6ahKk0247IyvV9zkp
         OjMzdknWgZEybWrgYNhG4y+/4XampAHSt97qj3nG9UHm+yOnXmUK/APfm69iPPRNnRbq
         TWXXGF8BfNmT0R6Txc87iK0sBiiTx2iDSoKnu8vrLY96nffxanNiQE1S1EljIpmAVHV1
         +HgA==
X-Forwarded-Encrypted: i=1; AJvYcCUiGyHF2UoGWmFUnoXqiQ1nHEEoyGKSr0NBewpKkr7IDxMDsUMDgmlfhyM9Kl3wMybSNrbxuwy7OpoGJ8Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YylpdER2s4uDi/DKpSGky4zZ5nWyPlGEg2hwjZFCiFRnm9Kumwo
	a+iTxVE5/bN09jDnM+JWfjC9f7XT0VTjJw1irGUXWbpwTrj4wRjHNXDfXRaY6LHEeKGZVWVctQT
	pBrvd5g==
X-Gm-Gg: ASbGnctBqHABy199ASwAi5CczdSmDrjTZhc80fhnIyZ4KubofxoZjX8nzG0isk/3zwn
	iD2UcxB8+lzT4hLL8WMS8W2DoluCj+mlrGrVg2sllwFUFUMZ8AynXbrpUs13122MbWlhDKIiNOU
	cBixaGztYzVmwUc0QgAvvbc9+npOOSlFZ9s8A7FFbB1W/rnI7z4FYAY6bRmz9zs5XcAxrkmXIM5
	Ize4EZPFfH2O5AMAYt9cMWjGX3AYuD2/jM2p3rhsRkeIeKHa29ri6hbHJ3xtpeFNZlpE2WwW00M
	3Jy7kKTqleAy7o24EPujXx6V5RFqtQcr1wn6bbVo6VNU+hmwjpYHQg6GJfV06bkCxcDnYjUiLOD
	Kg0K1+584eFwtNlY=
X-Google-Smtp-Source: AGHT+IEvE8AOwLAPw15D0uhiREVfZSAP8kBgZgVPvOyYqVlok6DzDz0AWHiFww/Ez8tuh3ykjmy5ag==
X-Received: by 2002:a17:906:f049:b0:acb:aa75:2b3b with SMTP id a640c23a62f3a-acedf68dda4mr54162566b.10.1745966089245;
        Tue, 29 Apr 2025 15:34:49 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6edb1ac8sm831176766b.182.2025.04.29.15.34.47
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 15:34:47 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5f63ac6ef0fso704423a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 15:34:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUR9hICGJBypJzFCv0pN800qM0iI/svAnLGCtokXyzxGTrYxe39alQrLwsG0E5+SiNrpgFHR/gHD6Y8YxA=@vger.kernel.org
X-Received: by 2002:a05:6402:3488:b0:5f6:4a5b:930d with SMTP id
 4fb4d7f45d1cf-5f89fe51d37mr514981a12.11.1745966086672; Tue, 29 Apr 2025
 15:34:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425141740.734030-1-arnd@kernel.org> <CAHk-=wj0S2vWui0Y+1hpYMEhCiXKexbQ01h+Ckvww8hB29az_A@mail.gmail.com>
 <aA8nF0moBYOIgC5J@gmail.com> <aA8oqKUaFU-0wb-D@gmail.com> <CAHk-=wgJfWfWa2NTiTmev+Xr=e8Uo=aFkrXujLAQBVAVN-VigQ@mail.gmail.com>
 <B364FF6D-DFCC-42A7-ACA1-6A74E27EE57E@zytor.com> <67be5eee-b67b-409a-8309-829f891b9944@citrix.com>
 <916BD58C-E6A7-495E-9A60-722E130AC7A7@zytor.com> <e5e97ff8-9670-40d1-a0fa-69504d34c4c4@citrix.com>
 <956DB0ED-F3DB-456D-8D06-6F40DBDB815A@zytor.com> <06d04c13-76e8-45fb-a563-e365e1f19362@citrix.com>
 <CAHk-=wig1E4B-e1_6=it1LfVQ64DJsVgO6f6Ytnbzm2qChbAdw@mail.gmail.com>
 <81ed8b53-1a40-4777-ab87-4f4abe032dbc@citrix.com> <CAHk-=wiAPQFf-RUr=8ra1sYdfGPGLb4QbV8THE9zY3n820L94g@mail.gmail.com>
 <72078B8D-F03E-4783-8AC2-A36464A4B6A1@zytor.com> <CAHk-=wi=nuDW6yCXSA-dEztZhXNuzLOaH--s_V7GOAE7n6RsRw@mail.gmail.com>
 <565ac06a-005f-4b77-930e-d63285c025b9@citrix.com> <CAHk-=wiMN7eMYE=SiA07f2aFFeuEV0YJ-ewoW4rJ3yQfbviuJA@mail.gmail.com>
 <7e0c2b99-00c1-4e64-ac68-50ba7500fd20@citrix.com>
In-Reply-To: <7e0c2b99-00c1-4e64-ac68-50ba7500fd20@citrix.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 29 Apr 2025 15:34:30 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjpUbDYw5O+zXWMq8yq91zaZFLUgZJ0Y1PU1g-OCiftrQ@mail.gmail.com>
X-Gm-Features: ATxdqUG9ooiLW1FjokHyuPv-6NWWppXUVmXsmKprDfDV5sYeskxfWUGa3Yy8OuE
Message-ID: <CAHk-=wjpUbDYw5O+zXWMq8yq91zaZFLUgZJ0Y1PU1g-OCiftrQ@mail.gmail.com>
Subject: Re: [PATCH] bitops/32: Convert variable_ffs() and fls() zero-case
 handling to C
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Arnd Bergmann <arnd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Alexander Usyskin <alexander.usyskin@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>, 
	Mike Rapoport <rppt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Apr 2025 at 15:22, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> Oh, I didn't realise there was also a perf difference too, but Agner Fog
> agrees.

The perf difference is exactly because of the issue where the non-rep
one acts as a cmov, and has basically two inputs (the bits to test in
the source, and the old value of the result register)

I guess it's not "fundamental", but lzcnt is basically a bit simpler
for hardware to implement, and the non-rep legacy bsf instruction
basically has a dependency on the previous value of the result
register.

So even when it's a single uop for both cases, that single uop can be
slower for the bsf because of the (typically false) dependency and
extra pressure on the rename registers.

       Linus
