Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42D723D2B1
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 17:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746553464; cv=none; b=h1uwOrvny2htNLoY2T/SRR0iKVHPgxR+z7KCEsVYrJ+uqzcBNx0e7ggQgkSrExHIAsSkn/sraWok1dZyHVpnSFNQS9juBLIhsbNbNvl1dBgPgeILfXTBqCAiGg+hpRuxDOjgodBaScUkl7PQw4DgnGO0U7kZlULTs3Pag5DN/H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746553464; c=relaxed/simple;
	bh=rC0C12NOCKJh0NfX7Cz0tfHB41yjQVr31E4OUzZC3bM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jYJ077j+dOFS6wobDq1122orRWfTe2TSrGaX/ww8brBXaMlzfMtdic3+NpRXS5Y4BA6atLDfcebatZDBnK8EJP6H+t80TRj8SmLOfZJePqKulrk/mflqCg0HwGk0KHjC/6CpSjsunyPFHp1CEXFnKswY8hn9OY+VoGntsVUaN9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=KBQy6grr; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="KBQy6grr"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e6f4b3ebe5so10471603a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 10:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1746553451; x=1747158251; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xCvURJIlT7xu3GAB0dy/1xpWZQI44cAwmeBh24G9KJM=;
        b=KBQy6grrZEfwUyigc2p5ZN4zduDzI6KZqHKoTd4GictQHeAPEoTYhEF34idszlBD5O
         Hn42skuPyH66AtP+DGDLczSjFoJRWKNUX2GqM5Ft6mWDDzJBiRcfofNYiSSscoHuehIS
         eRp7s0oW9o6/8iFeHjTSg0pPj/+jigqUjXc3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746553451; x=1747158251;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xCvURJIlT7xu3GAB0dy/1xpWZQI44cAwmeBh24G9KJM=;
        b=iJGRPG2NBr9JUGKiSjue4qUydJcsUKE2IwdI8XP6DE8/ZwJWNS6kk8REEn2IKCdNai
         nrBdSfYVIdaP2PaZ1zT1skhpN0qOSKqwk31M7BQaJvnRVb2T0bL2CcwJiMxDEyH9k8pr
         xnHruxVdJj4CHSFLl0cBcyCA3Ti6YHpxCmnaqntXc0zy8dFjICTRYnyM6oUavw7ouzMW
         WSxqvfx/rzuXmBAgCPmi99icwRUEy3tHGlYYd0cgGQAGw9Khs1rT9FEJeF4Qvwdy129m
         wKzXK60CTzE0s+uSELW7ZZkAyJvNpCAcnQY+dRcdzbnNrRw0/XoOM2kzh0UD49ujdMkn
         qQ7A==
X-Forwarded-Encrypted: i=1; AJvYcCV0GWh8DlrKCdUNKQU7fzyHuporLSiulNwyRX4mB83hMBb1AnMDxfa7JmW03W4zC6Jk1pLJvi+fPhm8PZs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv0TTcnSKyL612xNSp3sWPE2Mt1SNHZ2KMEDud1xF9Xws4BbdF
	BWkHLc16wmE+c/y6RxoVBF9rtEiLEwJHx6OU9Ywd26+t9aXd6qTz1K5WTKwr7LHHDL9442vFq6v
	6ipk=
X-Gm-Gg: ASbGncuyHgp3SV3WNRLYLMdM1xyvgMZLHeYQwBz//GC8+4uabEy2ZFrGLb03t4GUK3e
	yx6DKAIalm+IMNExqSNVIDH3hvszB2XDqLenpqgzXbhTuMEziTzIdKmk8vf1qWRlgFsb3vRerCL
	/iLnR4Wm9bucf8w1UdG6yNxXCVxbFQbHMJRo21GY2NhCTkTko1aKle7y+KHHCjzMHcjUjxzEr38
	0+w+EE0VirchGXyL5yVA3CI44qGcWH2v8CzmNXcApIIQyWo3pLWDrPoTbZWdWxD80z+Qq0AvK8e
	do/Qoe/lDdKAK6Oyo8rw0HhibkCYkczMXzeyuWX093kgikfSry2Es6gNQzq2PBV+wYDj7lbi5Xl
	Nd7cgmmO1X3EecFY=
X-Google-Smtp-Source: AGHT+IGX2rHTSEmczL8SYaK7jaCJ3Q20+S/KF9p/VtObvZeeg0eASb0NmseUIEthiHAn4gvas0Fb3w==
X-Received: by 2002:a17:907:60d5:b0:aca:c699:8d3a with SMTP id a640c23a62f3a-ad1e8bc8c10mr40367266b.22.1746553450760;
        Tue, 06 May 2025 10:44:10 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189540ea1sm736181366b.184.2025.05.06.10.44.10
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 10:44:10 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e6f4b3ebe5so10471567a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 10:44:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXZkkB9nG4DE/5mhJP+RylI2LlCay5RfOeIcylZ9CHT4oyxO8auI7bQ2E7s7D0f9HA4GogHNtXTcJ08Rpw=@vger.kernel.org
X-Received: by 2002:a05:6402:5c8:b0:5e7:b011:6c09 with SMTP id
 4fb4d7f45d1cf-5fbe9e68bcfmr158763a12.18.1746553449840; Tue, 06 May 2025
 10:44:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506154532.1281909-5-ardb+git@google.com> <20250506154532.1281909-8-ardb+git@google.com>
 <CAHk-=whrcutH0LcMmaeJxxMeYpw2R5T80yoQAXbrRHNSTCB0Pw@mail.gmail.com>
 <CAMj1kXFSae=stazUv8doka-zLOnDdXXR4ASxHKe5f97ikg3V2A@mail.gmail.com>
 <CAHk-=whxP5Ywpv-U=2NPFhk929VHB9_kdp10+HFJQ4VxEGdX9A@mail.gmail.com> <CAMj1kXGwYXXpjPgDwjKMEZJkuGJ8ZuCpMpc7fTvo58PNtu-czA@mail.gmail.com>
In-Reply-To: <CAMj1kXGwYXXpjPgDwjKMEZJkuGJ8ZuCpMpc7fTvo58PNtu-czA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 6 May 2025 10:43:51 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiz5oXq2f_87hHViN2TZQO9VHpaWb5fWWGJbUWQw1ChVw@mail.gmail.com>
X-Gm-Features: ATxdqUEue06zP1DrNrIUDeETi4Hz4Hcx1vEhqBSEEk1kniYZ0QrNBPJbANsbBoQ
Message-ID: <CAHk-=wiz5oXq2f_87hHViN2TZQO9VHpaWb5fWWGJbUWQw1ChVw@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] x86/boot: Use alternatives based selector for
 5-level paging constants
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 May 2025 at 10:26, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> In the light of the above, care to comment on the previous approach?
>
> https://lore.kernel.org/all/20250504095230.2932860-28-ardb+git@google.com/

I have to say, I find that one much more palatable.

That said, I still think it would be better to get rid of the early
case *entirely*.

 So it would be lovely to have a subsequent patch that just makes the
"before fixup" case result in an UD2 instead of "read cr4 and check
the LA57 bit" and then fix the fallout.

I think that fallout could be handled by having it be an exception
that prints out a warning, and then jumps to the right target.
Anything else would be very painful (as in "oh, the machion doesn't
boot, because things go wrong during early boot").

But I think that first version of yours is simpler and more
straightforward than the later alternatives, and it does get rid of
that nasty USE_EARLY_PGTABLE_L5 thing.

I just think that in a perfect world we could then do more cleanups on
top of that.

              Linus
