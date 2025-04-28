Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938F1823DE
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 02:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745808009; cv=none; b=FkKQ0T5cv3pqRnfEfPdFf64TrVAxdlBOeLho8bCTtzJTSzc6D+oOjkn/L13IS+S6pib3VpXJ3UUgaM+L5yOGleFKQIK1ZkEEDvVaKPFb6KWqxLx7p1OX+RVUhYT85HTMKcYPrUAxiIh4JL1dXZdecfNnIFeVuh11Y9r4EXH8kp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745808009; c=relaxed/simple;
	bh=9ak1Y1LNwKVWK45Mep5TVznM9aXYVsr0q7zxmIKkhMU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a7Pm8o1SrmaIOIuC7GCP7/WrhdJpAh84rPYyLdADFioF0sZQVh39OdWgCGg22fXmcaqrZfPwe3fZ0MRAVijRu4G2y/uNxssZikeQh046iWZAXqGsgMbfFrOt0/toNhx9A6lSyQi2wRtJjFH4eyr8JlEMMZrftYhlNTXx3gnn8Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=OjLzsQA9; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="OjLzsQA9"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e6c18e2c7dso8097682a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 19:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745808006; x=1746412806; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+7yg5nbDyJb2zlJLx/YXnma09SaHzuLtzbwsUIUnGhg=;
        b=OjLzsQA95WvIRYuWlfey651Bu/qCzEBI10v/XqIPIXysh7MNl4h+Za22m7k5jxt783
         x4+2rfmw6mulqmqgTA7rrrQ0nEqd5MrRJ8+pwWe0tyUZLz5YFlkvM78Vx7PRVgxg3hoN
         18fpNE/hpgORPk9Ph1PnSHJSe24GLulNECWyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745808006; x=1746412806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+7yg5nbDyJb2zlJLx/YXnma09SaHzuLtzbwsUIUnGhg=;
        b=GW3LhdPJChUv51Qo/xOiGF2WL9Sglgc2aPQ+9Mdb49jXWcsH+/ULyV/m+2Wg72wbpP
         eOLg3B6r66sRpL/LCqBfa6Ixoiq317+QV7uPh1l8T2vP5sFt1YzSuCaJAPhxxwrKBYlX
         UGxboRTAvHcS+dbeIDKe39zsNbqSupmgVAHFy6ekIY1tV08C4wbS5NEEnOfvn8HIy5at
         MTehQ9ynJDvgx3lXyCf+C7Qdd8AlGvVgVoCll3QsxPRSflT+YpbnhRZsMFD0aMVVyo58
         n3HVVW/JTaO2Kzr/qD+jDkC+AmeHXhq62ZzRYrEO4a9/2fN2itAmhskee4huzusBKKb9
         q6LA==
X-Forwarded-Encrypted: i=1; AJvYcCWxeN9uj6Qo93uyUIVPAWvQMIxeoFSzHtluCuctZzh83Ugq5PY7ewW12ODWuTiaPlkwE6lCJKAkjp2t9mk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVTSUwLmS28v4GuGIy8D/mqmsaaVOPbe+XMPZSWz0beuQUV4Pr
	WVNDR2G1d6uRf7cxKZrdK45V76W3UUFom/28dMH9GI7uePZkRsPGf7eoKmFpZ9dKXbsR/ktyne6
	N15Y=
X-Gm-Gg: ASbGncvT5RworXEARjLiOVuCj+2qkvPIcYDaUPSWJvdlMtLzoTfBZWupcbxwOEm8dAw
	rCeoKDZ0q2n64gj8jChW42zTsNw7PeV4553bHqvRh2TCfmhZJhqkD6mmgzjUrUNt00pEOA74y+a
	x+PvtpA6It4n46zKjBS8tmDud0F7MBS+AlMxSHu6b2LMEKGhI57uBR9MAQW9F12uuTw+Jys7hre
	A5Tc6MfottZ/1ElUXdBmF/E3mYyZd01xeerUGGQsotiBaX4mScXpKdvqqA0eu3AOfwEdSyxPlpr
	RVWLiJ0cMzNU+FzCZ/JD/BA2znH5RjI1lIrlR9BElLxC8DCuUZVoDSodKJwvnEnj3qiq7kvRycL
	usaEkQYhnJNDM3MJqUFT8pzNhGA==
X-Google-Smtp-Source: AGHT+IHVoJ/yFhrGM5yW2oecSSOZF/U1e36KeGBWMXYejVvgWPAorvz07tPkhkeYAwNeOFbK1EmffQ==
X-Received: by 2002:a17:906:6a13:b0:aca:b720:f158 with SMTP id a640c23a62f3a-ace7108a282mr894138866b.13.1745808005637;
        Sun, 27 Apr 2025 19:40:05 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed704bdsm544901866b.148.2025.04.27.19.40.04
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Apr 2025 19:40:05 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ace98258d4dso201022566b.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 19:40:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWrt8fobW9efn3/8eywC+uCAgd62XCoLDWRJU2VOWrDJMtRBgBIJtdQcSqdCZQ0xNGcZMtUKuGUtcDN8XE=@vger.kernel.org
X-Received: by 2002:a17:907:7fa5:b0:ac7:ec90:2ae5 with SMTP id
 a640c23a62f3a-ace7110bbc5mr916176466b.25.1745808004097; Sun, 27 Apr 2025
 19:40:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <l7pfaexlj6hs56znw754bwl2spconvhnmbnqxkju5vqxienp4w@h2eocgvgdlip>
 <CAHk-=wjajMJyoTv2KZdpVRoPn0LFZ94Loci37WLVXmMxDbLOjg@mail.gmail.com>
 <ivvkek4ykbdgktx5dimhfr5eniew4esmaz2wjowcggvc7ods4a@mlvoxz5bevqp>
 <CAHk-=wg546GhBGFLWiuUCB7M1b3TuKqMEARCXhCkxXjZ56FMrg@mail.gmail.com>
 <aAvlM1G1k94kvCs9@casper.infradead.org> <ahdxc464lydwmyqugl472r3orhrj5dasevw5f6edsdhj3dm6zc@lolmht6hpi6t>
 <20250428013059.GA6134@sol.localdomain> <ytjddsxe5uy4swchkn2hh56lwqegv6hinmlmipq3xxinqzkjnd@cpdw4thi3fqq>
 <5ea8aeb1-3760-4d00-baac-a81a4c4c3986@froggi.es> <20250428022240.GC6134@sol.localdomain>
In-Reply-To: <20250428022240.GC6134@sol.localdomain>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 27 Apr 2025 19:39:46 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjGC=QF0PoqUBTo9+qW_hEGLcgb2ZHyt9V8xo5pvtj3Ew@mail.gmail.com>
X-Gm-Features: ATxdqUGvyKI4n-dRAwL1ViEnwkLC2od4DD7XTcjrN1q3OFkYBi4GABqBN_mXblI
Message-ID: <CAHk-=wjGC=QF0PoqUBTo9+qW_hEGLcgb2ZHyt9V8xo5pvtj3Ew@mail.gmail.com>
Subject: Re: [GIT PULL] bcachefs fixes for 6.15-rc4
To: Eric Biggers <ebiggers@kernel.org>
Cc: Autumn Ashton <misyl@froggi.es>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Matthew Wilcox <willy@infradead.org>, "Theodore Ts'o" <tytso@mit.edu>, linux-bcachefs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 27 Apr 2025 at 19:22, Eric Biggers <ebiggers@kernel.org> wrote:
>
> I suspect that all that was really needed was case-insensitivity of ASCII=
 a-z.

Yes. That's my argument. I think anything else ends up being a
mistake. MAYBE extend it to the first 256 characters in Unicode (aka
"Latin1").

Case folding on a-z is the only thing you could really effectively
rely on in user space even in the DOS times, because different
codepages would make for different rules for the upper 128 characters
anyway, and you could be in a situation where you literally couldn't
copy files from one floppy to another, because two files that had
distinct names on one floppy would have the *same* name on another
one.

Of course, that was mostly a weird corner case that almost nobody ever
actually saw in practice, because very few people even used anything
else than the default codepage.

And the same is afaik still true on NT, although practically speaking
I suspect it went from "unusual" to "really doesn't happen EVER in
practice".

Extending those mistakes to full unicode and mixing in things like
nonprinting codes and other things have only made things worse.

And dealing with things like =C3=9F and ss and trying to make those compare
as equal is a *horrible* mistake. People who really need to do that
(usually for some legalistic local reason) tend to have very specific
rules for sorting anyway, and they are rules specific to particular
situations, not something that the filesystem should even try to work
with.

          Linus
