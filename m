Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A8B1D5166
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 21:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738617790; cv=none; b=dWa9uf3EYMfP5SimmbI2cZ8CIh8rfk0cCbLX4PbRiD8q+sWI9ZlpNX44TM0fWZ+dplyhV1NavAFP4ZBGq9hj8UcJazfKkfa7CtcLY/Bw1XGs/UY9GzIoAEI3TeBvHk5koOqmMz1xmEI7gW3c5WMBFonZ99Xh8m37Uh8R0/T5PAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738617790; c=relaxed/simple;
	bh=DEk0MlDPhkc3NJj7Yr5ayWkiEJtQDTBHsiChLxAnGd0=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=LONLaSCp9NXtqrWB7jqb8o7JUaDd8B5gycDmD/ZsN5J4TjdUfoX7OzQCM4PnAZ22DNpZ57N1j6fosx2EQvt4SD6oHHQgZe3gtN5e657jDBQ1Ye7o/FTlYojSOOMUUvkFLAMK+66R3YVRoVtWaCpbPOH/RVearsHygU+ERjw613I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jrtc27.com; spf=pass smtp.mailfrom=jrtc27.com; dkim=pass (2048-bit key) header.d=jrtc27.com header.i=@jrtc27.com header.b=mAjM+49+; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jrtc27.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jrtc27.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jrtc27.com header.i=@jrtc27.com header.b="mAjM+49+"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43618283d48so36375375e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 13:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1738617786; x=1739222586; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mQvpp2LRYRT3K/cLfPDLqNS+9MqkGBxxZ8pBUN+MW2s=;
        b=mAjM+49+dTlk2iFqIHgIq2qNlQJEX58xtr35HXujMCAkPPM+j2ywBux+6VUS3w2ahI
         AxubBQJKjx0Wx7OUH3UXYoXknctcfgyHId2BGkiiNGlS5Tn2SJsfkm9xmwDq0OOmnkLL
         lk2mBPSK2lsRZ02zAqYOnYSELxyIKKu3xy/a/pGBNZn9OQWSxBX0AM1LNhOnUizXT3eE
         uaeMwFdvDx64RGl9ui7ViSce3sz+Y/T3SL+uHA+iLU07QMsKgMNk5Ou0DHjhGcBJVjgw
         f5H/ryG6drw8VXJrAY1eu3LZl4bpBmNFE5DxuHaePWa/1NHpmqTN8/IA+HQlOL+z2fC6
         yiaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738617786; x=1739222586;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mQvpp2LRYRT3K/cLfPDLqNS+9MqkGBxxZ8pBUN+MW2s=;
        b=iR0KCSzRaMmsCMXXyrpcrlYJg4VfwFvvf3IWLoLRtToL8Wb2Tx6FtvkolLo+HMpL0A
         V3vrK1sa3H0kKJ5uIYuEgCYF8Dnv6MRu8Blzta3vZ9htkNjqhRihtE4pl5n4xMYwT7Lh
         d4lk41Nq4Wcldonkw90lCPmkyhG6NxC3GAspUgQn8LUfS7OGTpqP0t8LmgdR/sjSEo7V
         jaCYu5yCK9Es/GcBEONsWWnHZeeOdWdh9/UKIK1OIVsNZlXONKcMWwqBlqSP/qz8zhwK
         XyxeDE62HcCIRTbKrUn/VjGdQiUz9ZnJWslFMD5MaQ0zhflew1wtniohUTQ2gzfQVBEc
         +yLA==
X-Forwarded-Encrypted: i=1; AJvYcCWBncCbKx/Hs9ye5plvGR8DxfDGOZmC0Hynf79Xcw7+BzmwCwFMDJvNN4cVfz3UHiZdyWvc7kg7EDaD80A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhZHrnZ+OAL6jfbf7/jP4bokxTh+Xay0fQR+jXxBU+UD3V/zBe
	AufCjgVP62nwa4iYJRrqxT3EXdt6GnseiKit1I1gQkBHgMezZXt3sr6pqehFLMk=
X-Gm-Gg: ASbGncvunyY00fWhJ0wkMD22hkBimnYguITBxG/92EaWMovFhzqF8BIlh+JKlJ8ij7a
	K35z6rUGwlIMtcTlrAOcOhhbCj/AuvSm463htTaKLa/sf0ayE+C+cX0BAEczUdlP1oCsm6S/B5A
	P0ZRIq3OM6P6KHF9DqTWTD6a1UH4Mcb4iaHqyl5T26iuccU5FQgQ3daGbci2gYVwzVc8202zx1A
	DEFGqZ28OBXdVaaFpUfuSOc9+oP59hc0Ze2J4ikw4ZGjo5hy1R6I5XVwQRL6gwxjZBTHwlsWA16
	3evxIXHR1tE6gL7jG3tP6+FfqTZB
X-Google-Smtp-Source: AGHT+IGRgSY98as0FO+OEr+iCd27zkPxvZBzkNQKfXeu12EQ7NnYzWoYKMRb+N3FcwOpbqZjf43ybA==
X-Received: by 2002:a05:6000:1789:b0:386:4277:6cf1 with SMTP id ffacd0b85a97d-38c5208fb3emr21016029f8f.39.1738617785948;
        Mon, 03 Feb 2025 13:23:05 -0800 (PST)
Received: from smtpclient.apple ([131.111.5.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e23deddcsm165659455e9.14.2025.02.03.13.23.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Feb 2025 13:23:05 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH] riscv/atomic: Do proper sign extension also for unsigned
 in arch_cmpxchg
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <alpine.DEB.2.21.2502030510390.41663@angie.orcam.me.uk>
Date: Mon, 3 Feb 2025 21:22:54 +0000
Cc: Andreas Schwab <schwab@suse.de>,
 Alexandre Ghiti <alex@ghiti.fr>,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <0DF64D04-D609-4790-8279-7DFE24D1FB2C@jrtc27.com>
References: <mvmed0k4prh.fsf@suse.de>
 <c9cbc2be-d1fd-44ef-aa14-fd25a5ff8490@ghiti.fr> <mvm5xlw4anb.fsf@suse.de>
 <ac53a62e-4f89-49c9-a755-fdfa7a582337@ghiti.fr> <mvmwmec2t7u.fsf@suse.de>
 <CC2D9220-F8DE-4CC8-ACAD-7B1A21E276FE@jrtc27.com>
 <alpine.DEB.2.21.2502030510390.41663@angie.orcam.me.uk>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
X-Mailer: Apple Mail (2.3826.300.87.4.3)

On 3 Feb 2025, at 13:57, Maciej W. Rozycki <macro@orcam.me.uk> wrote:
>=20
> On Thu, 30 Jan 2025, Jessica Clarke wrote:
>=20
>>>> a2 is used as it is passed by the calling function, so we can't be =
sure a2
>>>> is sign extended to me, what am I missing?
>>>=20
>>> 32-bit scalar arguments are guaranteed to be sign extended on entry.
>>=20
>> Firstly, the calling convention is irrelevant if the function is
>> inlined, which this almost always will be.
>=20
> Umm, that would be a compiler bug then, as inlining is supposed not to=20=

> change language semantics.  IOW the compiler is expected to explicitly=20=

> sign-extend the arguments of an inlined function at their evaluation =
point=20
> just as it would at an actual function call unless the compiler is =
able to=20
> prove they have come out sign-extended already from previous =
operations.

No it=E2=80=99s not. The calling convention is there so that each side =
of the
call know how the data is being passed between them. When inlining
occurs there is no such call and compilers can do whatever they like.
Calling conventions say absolutely nothing about what the
representation of a value is whilst inside a function, only at
boundaries. The ABI can also tell you what the observable
representation of values within a function should be (e.g. that int is
a 32-bit two=E2=80=99s complement value), but just like other platforms =
there
is nothing in the RISC-V ABI specifications to say that 32-bit integers
are kept sign-extended in registers, and that=E2=80=99s not going to be =
added
because LLVM has never implemented that for RISC-V so it would be an
ABI break for all LLVM-compiled RV64 code in existence.

Jess

