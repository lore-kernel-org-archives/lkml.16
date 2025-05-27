Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A0019E7F9
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 14:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748357933; cv=none; b=srk7yClHF+GLc6Ly7USk5lhlJjV22sfj7hgeIEsPgegILv3UoIWlfGnAqqvdA6ithDxRnqJJKnAjYJOTLczEStDKuvpxCCNbXH6pSFr178Y4wBbGkNjzny0kpoEvJUo0Xxx+18Ts6bCXtplwKZwUY/u/DW0MNuJ+G1o90H6Uyns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748357933; c=relaxed/simple;
	bh=msfafbvKH8k+6WrHApRJMu1ZHQUoHobjRRMKVSbWuVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GJxdUSmn9sxxtursse5xsHIxHeQky2G3EoWVYQwtoqULvstp1TMibP/whsX/fXDSJoFx8Pmbm4AuaF1uML2nuyDTMmyKMBzlbXGhIX0p8rJrZRg7qQ/O0zCl2BFk9J53/M/FG2nWj1BX0Tmz1kWo/QFq9kb1JWmc9laQygeUvKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=E0sBSGU7; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="E0sBSGU7"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ad1b94382b8so583624166b.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 07:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1748357929; x=1748962729; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Xn/HpegMj8KBA7WUvuVnYcNPpUCOy6S5/PQDziNope8=;
        b=E0sBSGU7cZdsRIMiHupdAEb7/+qLB3YoqYVSPfTJG17Ry0oj/fV58mTPzNPKhoxOin
         Dhqs7BZ+GnJHcTj7/F9C4iVZmaerMZpXyBZkkL6pVG1NEuDCoMxb41fWxpmqlQgegjqo
         YLRfKaVCNZkwrlNQ62YE1vbU2ZtgmLn58EwU8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748357929; x=1748962729;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xn/HpegMj8KBA7WUvuVnYcNPpUCOy6S5/PQDziNope8=;
        b=Ec4/ALGf3p0pPZfEDRejgtPDgtdIxqOd3q7B/0ErKTOSCwdrh5mQP1eV3LO8Mc+kl3
         zcPUQhhQn+x85XOXseic9fPQvsg5JGlvdGJR0oUNR7hUk0gHOxBzDcqGYyhUQ2AYl7W3
         hPM+kCn94oQ9BpQA//hDwI1PhNH1WDK3nMUHAe1bNrxZmztYj4tYnxn3ALEC6y0wQFj4
         u7tGSjKlYRTY84UE34csrjnU9IvVK2VgKA+KfiYpuCpSAZR4Y6IvX6W22aY7lvhN94f1
         g/IlVv7AcxXylO3PFXbqh5iBdKJbRxfffVDUdFp5gXHiJPegULKMQLCSbmJy187r7fQp
         jizQ==
X-Gm-Message-State: AOJu0Yzd9AGSfJy5ThRsdCce1W/y412owbT+9VRaGcsqkdUMu7twu6k6
	s7q3EJZZQmkXIm8VzZo2cRM0E6NVRVqZ8TrMi6p/WR5FUxU5bcc/sMfzI6dC6cOjJZf99HaVPMf
	WtzTp/mE=
X-Gm-Gg: ASbGncu25gXTV5zajmCJ319KykJJNAyJJqhIX+AX7B+CmnYhrgdm4blEU++d5Kp1jPW
	5JjY2VX7dPeeZDFzNqhJGbfEYVWRtcWuGFiXlIGcBraCn6S9NAJtjDiQu044bE1x/MMcgCi2TDb
	p/N5M1/RgDZKN1niWqvgPOprNwRE4Tw/sOY4jjJEITAarrqr/4L7qVV68EpptZIzeXphlEHZWBl
	jGWZoWx4djm91MtlshalXrjFgZW8nGIVSo9wN4A62Y0JT/gJIgAUMUW1jl2MyRmrL9KM9eNIsuy
	9iWYJeiiI7fOF2Hgr2rMH4ztiPuV0plQV1eDOc/aTno7vJdRaENhxS5B80bQM13fOfdplfosfYJ
	BfMHSbDtyYWQawo/4HynDUv8MZzER+c5X/ia0
X-Google-Smtp-Source: AGHT+IFp3bX6MoL2rcSenMXmlWKAp46s2IDn6Uz3aktoiO4d2BJxo/YFfYBC9qQJAubGVQBXexrAtQ==
X-Received: by 2002:a17:907:97c5:b0:ad5:d597:561e with SMTP id a640c23a62f3a-ad85b2f62d2mr1182229366b.56.1748357929122;
        Tue, 27 May 2025 07:58:49 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4f945bsm1833415566b.184.2025.05.27.07.58.48
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 07:58:48 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-60179d8e65fso6054399a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 07:58:48 -0700 (PDT)
X-Received: by 2002:a05:6402:350e:b0:601:89d4:969f with SMTP id
 4fb4d7f45d1cf-602db4b1b2cmr10652767a12.32.1748357927364; Tue, 27 May 2025
 07:58:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK7LNAQezLBpYLqJ+=ONqoYKwdaw0_eywN9O26LTnifGq_g+tg@mail.gmail.com>
 <CAHk-=wg2YAc1TrqWB9HhKDWHGzrqeP9=uiW9hzU5p1oApcdAKA@mail.gmail.com> <CAK7LNARY48483tOLUf01-d_VnQh+K=-e+SLEeAqMaZfZC0YjLA@mail.gmail.com>
In-Reply-To: <CAK7LNARY48483tOLUf01-d_VnQh+K=-e+SLEeAqMaZfZC0YjLA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 27 May 2025 07:58:31 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiSDWVRT6A1cTkzVFaodhnVPmbtnDtaOe573y=HsDHkzg@mail.gmail.com>
X-Gm-Features: AX0GCFs_p7G6msogOW1YvWXgUShzebeCrbjAaYZ9oPQ1gVzmAtgd8KBOQ0T1aqs
Message-ID: <CAHk-=wiSDWVRT6A1cTkzVFaodhnVPmbtnDtaOe573y=HsDHkzg@mail.gmail.com>
Subject: Re: [GIT PULL] Kbuild fixes for v6.15-rc7
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 May 2025 at 23:28, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> However, building the kernel in Fedora 42 is 30% slower
> than in Fedora 41.
>
> So, maybe, this is because you recently upgraded your OS to Fedora 42.

Yeah, so that explains all - or at least most - of it.

There's probably a small amount of "the kernel keeps growing, so build
inevitably slow down anyway", but yeah, it's probably just the slower
compiler that is what I notice.

Thanks for checking for me,

               Linus
