Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4D315AF6
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 16:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746461011; cv=none; b=uh6PST2kKo+hx40lQjDcsCcwFHIKdQbU2qTfrkbluoEzrZr4vNIadjw8mlTzBGYmQ0Qnig1V97GPmyzX/7aHiK/mIlhIxXMJC1AwKs6DCsgrL0AyftTiLkXAyUR2FizLiUEgviLM5MUi/QVWf2RZSg05m820/GH5TJJIqr4LoLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746461011; c=relaxed/simple;
	bh=UftVvy8RC4icpI3AhefASAQZ/iEzxTAxJn3EY71RiK4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qhlp+zwo+Um6Gbgd5XNV/hlQ9wnBRKpw8SbqWD69Xotyz8bsyn8AabeC61gjklrSTySEFPuEmJowXcuP0ppZuif+oF0PXutjdcZjZ7yjJe++8B+MqrXPb33ConsvOaAxoURWzDjYBNWOruyjvmhTBDKVQCcV7cxzNTvqXDvIGxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ERGyzyzw; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ERGyzyzw"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5f6222c6c4cso6643865a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 09:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1746461007; x=1747065807; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h01CWeWtSOhKaIqy3G/6IN778pW2sxnxWWRyeifkMkg=;
        b=ERGyzyzwL3A//wQnEWkf4/5Cdk37LQYWlrosDP8jY7wfeXg629HTQT182qdQql4QWI
         ZtvHMnNhCeT8cFjYXMfNBcsq/8gm9dJ8VcEvGA3fHvArmJ2TDmatIEFgIXDf3Eu/wOTL
         AQSwlHeQt3REBaMb5hvVUdwyyATclUhPY7eVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746461007; x=1747065807;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h01CWeWtSOhKaIqy3G/6IN778pW2sxnxWWRyeifkMkg=;
        b=gsHHLE8xZXPaDAhr7re+m4CUT5c/Q1mMndtzZOT2YOk2EJB267/8oOYNUKp2UmkkHS
         HW6j3E6fLSOdedRViQ/PE4wY35yAvvYHrC2MSjK5EWKtMu05hVYEdwb30spX2W2ByMiT
         ZyOcA8caRPuWD+e+BrdPzuSH//jeZV5G3C+n9WR8fjrbE2VX66wYA6ENKEmlvHYEq/pi
         FYUgi+6toyBTQJucT+d7Tw+gN1GRu0GaO41dd3N1FL8NxeJXAt6WHNTsRoIXY1Wqw0i9
         CE0ZSle6+kFJx4FNGaFHntHSfY0m7tN7mmBjSnLAdBYba/2JOviEwUPcd7E6+xjiUU7w
         EN7w==
X-Forwarded-Encrypted: i=1; AJvYcCXLRO57Eh5Mg/l9im2Z6YoYbYo/ATkeIvQyfT3QA3qnF93omxqpQ4u/beoxzYBrvSYCsxJscgJaS6gmYAc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGsvaoWk0K27es4wMkXhYfINgRtBUVUA/9+xOK6DDjy9QzFfGG
	FbYu9+M7cjU/AEEZLdw7bXbHOIbW/votoabIGSVW6TzXKLwV2NHwWM4G/i+UU80+4HNv9vCbraS
	oLCE=
X-Gm-Gg: ASbGnctwSg1fuCTMSe1soh19P63RVy4RImyFUBMdZRfQZv2YEWGM8Rj26wzg3gvEcwF
	ShMgZtJeWvq1e2ilKk9BeB7ZVd5q+gpWZRW6Aor21sLePaEI5AJeUld1cmLngxma5RxRXyEG+RU
	YaU1PpkAR5s2lWZzX0FkxyP0sJXQlikx7B3/nD4kyZXi4ZqsUf9+wAyfchBVY6uI2BAnNjdIj9+
	UTN0/DakIGG2gc+DPg3zR92bq6O335cM/FkzoCqwN4BOkELVbs2enXufimyT7Ydz6FEqcKDvd1f
	JTiGKiGyp54MCbB3hZEZNrU0eTxEZh7iZGxldxqblRRbnkCfPGk4DWpMF5gd+6f+T2paEYCXxG3
	koRVwuc0ePtmptnBEeES/yf9vgg==
X-Google-Smtp-Source: AGHT+IFuCoBDt2QgBc4AjHYYSeGg7K2lDnt/RWgn5zs8oNa6lBaU6RgbXRuxFJp0AZ04nzunYpzx6Q==
X-Received: by 2002:a17:907:7f8d:b0:aca:d6fd:39a with SMTP id a640c23a62f3a-ad1a4b1f68cmr679798866b.51.1746461006624;
        Mon, 05 May 2025 09:03:26 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891a7a0csm512393566b.72.2025.05.05.09.03.26
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 09:03:26 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5f728aeedacso6743764a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 09:03:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXzts6aYko8TG20SHYIZcZ+cTl0CzA//M+hF59iOLU3ZnqK9ZxyaBvDh6+hEy0HYt5gmBPlTSBDqU5BY7A=@vger.kernel.org
X-Received: by 2002:a05:6402:90a:b0:5f4:d60f:93f0 with SMTP id
 4fb4d7f45d1cf-5fab05e0b12mr6165955a12.31.1746461005714; Mon, 05 May 2025
 09:03:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425003342.GA795313@ax162> <CAHk-=whfT3A8K2Z+WbieGG5Hhc9QAT5s3qsbB19O0Roj2G5tfA@mail.gmail.com>
 <20250425021138.GA3800209@ax162> <CAHk-=wjDV3nOK34rbU8bdo6OjM=KYoCN92=1eVEVFu=FQr8TNA@mail.gmail.com>
 <alpine.DEB.2.21.2505051543470.31828@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2505051543470.31828@angie.orcam.me.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 5 May 2025 09:03:07 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiQN=jqK9n-mUEAD1Q36t-6d589M_rAG568pLq2KysJ5w@mail.gmail.com>
X-Gm-Features: ATxdqUF6pY-99F2WQNkeFTpXwDSx0anOhOWjLVNn7A_NmLH1XNT6o446qEa5uEM
Message-ID: <CAHk-=wiQN=jqK9n-mUEAD1Q36t-6d589M_rAG568pLq2KysJ5w@mail.gmail.com>
Subject: Re: Adding __popcountsi2 and __popcountdi2
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 5 May 2025 at 08:05, Maciej W. Rozycki <macro@orcam.me.uk> wrote:
>
> On Thu, 24 Apr 2025, Linus Torvalds wrote:
>
> > > I will test declaring __popcount{s,d}i2() as aliases of
> > > __sw_hweight{32,64}() to see what effect that has but I figured that
> > > calling the __arch_hweight variants was more correct because some
> > > architectures (at least RISC-V and x86 when I looked) use alternatives
> > > in that path to use hardware instructions and avoid the software path
> > > altogether. While there would still be the overhead from the function
> > > call, I figured not using the software fallback would at least soften
> > > that blow.
> >
> > Once you have the overhead of a function call - and all the register
> > games etc that involves, you're almost certainly better off with the
> > simple unconditional bitwise games.
>
>  Unless optimising for size, which we do support.

I think you missed the part where I said

 "But if you want to do this, put the damn thing as an alias on the code
  that actually *does* the SW fallback in lib/hweight.c."

IOW, what I object to is being *stupid* and doing *two* function
calls. It sure as hell doesn't optimize for size.

If you want to optimize for size, just call the existing SW fallback
in lib/hweight.c.

Don't call a *new* function that then calls the existing SW fallback
as another fallback level.

Because that just makes me go "Eww".

Honestly, from a performance standpoint absolutely none of this
matters. Unless you *inline* the bit scanning as a single instruction
- which this is *NOT* about - you have already lost.

So at that point, it's a question of just how pointless you want the code to be.

             Linus
