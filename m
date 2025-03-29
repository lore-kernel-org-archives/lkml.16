Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E4D134BD
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 18:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743274359; cv=none; b=dF1vufELLOUkMpbHFOBHyEjOOHAVB9zTWC2dVyogboFgZRUVPJMapQqVDVhIPPD96uvo5cfoa1FFttW5I4pQfGzzEbi9hJRfdG5+elsQ8YU8SYAaCaAmMHFG2q+aNdVhz03BMJvanv8Kzd2Kb/88HL8OURuAFMBmEmgI/FoPo4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743274359; c=relaxed/simple;
	bh=wIQzIZgH3WeVOOSe4apoCqE2KGja3fV/2QqK9w9GFyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UT/JVgnx/eYlM7wCnih1/Vw7wZVXxUregNzmqPJmjhBez2KbApM1aiWKEdlmhRo2N873jo3RDcViX1fY3h07ynAulC3buNtkaRXhIDMSC7bGAW9Xs5LRa9uMViQ3UH6carId2EemykJyTOVodOOhtGr71pHWSQV/5OMD68nxM1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=TE7c8pcA; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="TE7c8pcA"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac41514a734so535349466b.2
        for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 11:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743274355; x=1743879155; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=act5dliCYf1Xte3jD8zN9vIyZot+EgA+rw0oWDLbeUA=;
        b=TE7c8pcAXo2akEqb3W0nJJeoZBujTMXC1tc6N43Tk/LYJBUJ9X6/3ckeY0xL+jPXcn
         zfSqA+L8gr/VBVUuto1RuoGXJ41eK7X9A7Dye/gJkeTLmF4aFtcs9D1clIHPwB794RZW
         4aklMa2+a7eBneFgl24J/9D8WfsI0Ef+AdyaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743274355; x=1743879155;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=act5dliCYf1Xte3jD8zN9vIyZot+EgA+rw0oWDLbeUA=;
        b=FE8jIoHZUElVvLp7pW2NL8/2lxUYpa5HzEReMU5QoCp2bzasSP2CNU4vIa2jYHcmh9
         hKlf2nkCd6wnqV6SMJ3p0wmRPZktqtwJpsLqE9SDFow2N5Y64KZ26Xe99/5DGaEsdqf7
         Frqcb8ppde7bOU7lDo77Qu+4HRWCKXo4gQegiXJAZd+dMAPN87OdM8hPaZpuDKPxo2m8
         ZMG5epWavWddqR65QlFjeYQO5WC00WfTbmVvUPgiWsNNZDLEZx6/GQA15P9mhyCFfgCO
         hpYnRUJZK065Vsv8gvxptQSJy5r3FhIesv0/ymt1F1VSdRc7lnZjuJNBKV/gE81KS/8M
         YfuQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/X/cpguL8c0Ot3sQ4694I3wptzvZxWJXopAnfMWIwsJ5GPjFhpPejwbpihzfIE0P9OLDjP6FWSERsh74=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAqp/oSIMAHso/BkAPypK8tw4fkSVVVs36CISplyNzUeM+nIHh
	CVIgz2pUAqv6xhe147gstGiWk2bR5bNBem4u+dOiZysYlTCBuDdxz5qK5piR9zRpCBX2C+On4qI
	E3ek=
X-Gm-Gg: ASbGncs8iD1wvoTy3aGpEwTh/gU1zbCe/IVHsjIxDY3E2qJVEH480afA4jT9XmqJlRt
	kZRheBdHe+Hj7lqcm8RXrc/wwhX6zzDY/Wkuv8Xv5E7JNWdbgbAH8ojhoEGLk3RSbgR9fhQLIET
	B+0BS4I65jzhwluBeiG2jUQmbAVsaTecQIbU4upKF5f5ka1BzEy6QhK1dbfrL5iaQhgiKAw86Gb
	Wricr8w3lkTaY1X3TCgilDazAYgtbUSPS68/BjyIbmoMtpROv4xG+F0xR1tjKQ1Xj0z+xRfnyGA
	DvSoDWd8zsNHk4ZDA2Bb70XDxwLFtP4mJlZs5spCXshikPBvabujAAPbm1mvQDkX4Nqq1xTFh5p
	yjWEh/jyTe3I9EdEWMlpDM+Z9+PEvjQ==
X-Google-Smtp-Source: AGHT+IEcfLHeHGaWchoyJN5YtWjJzG13bF/rfi1P7Znp8zJqqmwzeAQynW9RpvB1ZGbuYtak6KHWYA==
X-Received: by 2002:a17:907:60d0:b0:ac7:3323:cfd8 with SMTP id a640c23a62f3a-ac7389e49b5mr315338566b.16.1743274354634;
        Sat, 29 Mar 2025 11:52:34 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac719223e42sm369308166b.22.2025.03.29.11.52.33
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Mar 2025 11:52:34 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac3fcf5ab0dso511148666b.3
        for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 11:52:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXYcdCMAAyEi7PA5+iYzx0Zka/p93EFoxVeBjbFNSfmG4A2XgQKjKD59JHANkEzDh76oZn0r2C7cPxGmeU=@vger.kernel.org
X-Received: by 2002:a17:907:1b27:b0:ac2:49de:3969 with SMTP id
 a640c23a62f3a-ac738ba8dc9mr254702466b.47.1743274353618; Sat, 29 Mar 2025
 11:52:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZpkdZopjF9/9/Njx@gondor.apana.org.au> <ZuetBbpfq5X8BAwn@gondor.apana.org.au>
 <ZzqyAW2HKeIjGnKa@gondor.apana.org.au> <Z5Ijqi4uSDU9noZm@gondor.apana.org.au>
 <Z-JE2HNY-Tj8qwQw@gondor.apana.org.au> <20250325152541.GA1661@sol.localdomain>
 <CAHk-=whoeJQqyn73_CQVVhMXjb7-C_atv2m6s_Ssw7Ln9KfpTg@mail.gmail.com>
 <20250329180631.GA4018@sol.localdomain> <CAHk-=wi5Ebhdt=au6ymV--B24Vt95Y3hhBUG941SAZ-bQB7-zA@mail.gmail.com>
 <CAHk-=wiA0ioL0fonntfEXtxZ7BQuodAUsxaJ_VKdxPrnKx+DAg@mail.gmail.com> <20250329183820.GB4018@sol.localdomain>
In-Reply-To: <20250329183820.GB4018@sol.localdomain>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 29 Mar 2025 11:52:17 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgp-fOSsZsYrbyzqCAfEvrt5jQs1jL-97Wc4seMNTUyng@mail.gmail.com>
X-Gm-Features: AQ5f1JrM_HFkzUSwzDgwQhKmnl8eHsLngYM7ql_facXoYoScNqXR7VePFMkP0dk
Message-ID: <CAHk-=wgp-fOSsZsYrbyzqCAfEvrt5jQs1jL-97Wc4seMNTUyng@mail.gmail.com>
Subject: Re: [GIT PULL] Crypto Update for 6.15
To: Eric Biggers <ebiggers@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 29 Mar 2025 at 11:38, Eric Biggers <ebiggers@kernel.org> wrote:
>
> Yes.  Those cases were just a single algorithm, though, so of course the library
> was simpler.

Yeah, I realize.  It's the extreme case of "using the generic crypto
infrastructure is just silly to the point of being stupid".

I just think that there's a continuum of that situation.

There are cases where you *obviously* want to use the crypto
infrastructure, because you really have lots of different users, and
you actually need the flexibility (and in the extreme case you do have
the whole external async crypto engine case even if I can't for the
life of me see the point).

And there are the cases where it's just stupid to do it, because you
have one single hash you are doing and the flexibility is only pure
pointless overhead and it makes the code bigger, slower, and harder to
understand.

But I think then there are the middle grounds.

The cases where you may well just say "this is the common case that I
want to optimize for, and I know it's more efficient if I just do two
blocks in parallel and I'll do that case directly, and fall back to
the generic code for any odd cases".

               Linus
