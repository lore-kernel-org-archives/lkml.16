Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222CD2CCC0
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 03:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745810207; cv=none; b=RDHHkjT+9JWcDkQPSMVW5g5qIo1Jq0Fh4FVtWYve1CRWgxvopVqjPS8YU022Pc4h0deiQ7m1hPs6cCeze6VFBGgEvOtrk5MW19xafQEF7JVIQ1eaVrU5x8Jm1mhoqbAX/dZWmDSxtOLJubKGMz+z2YdCd/4CPnnGPTjm1oODRtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745810207; c=relaxed/simple;
	bh=bo4XRnmv/C9CPBRc+eOmyFUi6OPxRNkntH1IlX/FEsE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MVvMgER6yMo0iXENCFgGEUqUX2CQ1D6tKXRn+p75iXhKxAeT3hPuX37FB9Mn2iW9QZ1VrgTWrQogRnzBmmEv38RxT7gHuvYfOqO3qfy4H5kvEQleQh5NcpvnuuJiXMNUl3AAT6OvdFnyyaRtjV1Bqyt4V6ZZXMQMBRUPJS6UV+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=PEIBo2nv; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="PEIBo2nv"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac2bdea5a38so612096166b.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 20:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745810203; x=1746415003; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t0e7nP3hjcaqKwc01vRHOmUcHsrAvpBqvUnI+4uZsG0=;
        b=PEIBo2nvRF6oFabH4hrt65iJCDuMZY768lQo7dWPPbeS6VP/E+xYsmt2TK1oUbnvlR
         Q/A8hjwE9ylUZNRnd0hB81TRi0bU2lHvLFPP7miV+SYR0OI4X4OuRfsyHAZirosrX/sR
         vnHMCZH8k4NXCzQBvIbyYnoBBXB8EATt4TUTE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745810203; x=1746415003;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t0e7nP3hjcaqKwc01vRHOmUcHsrAvpBqvUnI+4uZsG0=;
        b=qy6ga+iFCmy68iVENX3oTU266bwIPdGcXgCjbS2pJ3YbglkFK2n2eQJLQV1qtX66b+
         hgPO85GXJD3BOzapQafr49OR4nTRoVMhs1OLpuTWxYoikLRXE9ve0dO1duMFXBBF74NL
         /rcXDeE8NvP7y9OLw5jbjLhpBgC6+DJ2n9hebcVf5vF338sW/Xb7InXZtZAmAE+/OM0I
         ApS81oElgjEQXIHGqy9c3qNpZ+DHnuRPzfXTHT7yh/yvUGgyshaeguqfGjXmZkStfhy0
         7YnH1H4ZG/tWjkCWpDNeiVQc5kvrTbw5K0wjCm9EUgN6G1PZ8nSXJSjBTnzMi+E1ILBQ
         Prmg==
X-Forwarded-Encrypted: i=1; AJvYcCW6oEl3AQdkf3cF1dBPRWT6H31WZm5UzNJfqdEdKUYS9TN0NKlsHWspCalA8adS898z2lC3NH0bn72WndI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy34ejeqOwbM70BMjpW8qOk+lN01qBDc/RigcxdszSePmgGu4Ky
	vZonpPdKM3bNSI4UJPm50aypUuAzg2bKXl9TZgGHRGOZrsiJYzale6FxMhufFNEhiBUNBzbS1K9
	Du18=
X-Gm-Gg: ASbGncuM5EyXtC82hXTg20S5rzDjkM0FhkUUvl5tA0mJ7pl15UF9g3eFTrc8+mo79F4
	7kwu7pS0K/zvzmOuARYkhsKlCXHwnlgBAdUTPeZNx39ZRfx+LjEY1cIMyHkaKflSeNSYLZtgnFW
	S58s8CvuCWsp5j8N1SeMQssnmODz3RZwt0ETRqgSDJGQUEhPQGMJD9TSar2s1sXkK9mk+ItTjXG
	4zAJ1YiNKsgyehHCtPaW7R+GEHE89+t5CIL/rEgrb5C3gx+NLOf1uulhEx/dqBq5Q7DKGxtzNoj
	6bOGGvK7DIjMK7QveY2D+cbLrRHwOQa3ooLD58kUib5IUfXKigMhkeYnl9rE1Wh9T6e3MU/yX3B
	HPRTK4gr3WoSUo7c=
X-Google-Smtp-Source: AGHT+IGPGscujNy6ka2UfkN5HOBekksHT2bVCVmtrZqc1hzIzGJ9112QXQKS+U4tjJd2iYG+NVZVOA==
X-Received: by 2002:a17:906:dc90:b0:ace:6416:b0e0 with SMTP id a640c23a62f3a-ace710489d4mr1015668566b.10.1745810203071;
        Sun, 27 Apr 2025 20:16:43 -0700 (PDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed71ff2sm547160266b.144.2025.04.27.20.16.42
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Apr 2025 20:16:42 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-acae7e7587dso651974166b.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 20:16:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUU+U/2sE/Y3Z12zrzzItAEV8Ux3J13o8N4PotjRWInsk0z0NMS4jfKy13mYKGea+GB3JJ/TauOPAkcECM=@vger.kernel.org
X-Received: by 2002:a17:907:1b22:b0:acb:6746:8769 with SMTP id
 a640c23a62f3a-ace71098d77mr1016463866b.18.1745810202119; Sun, 27 Apr 2025
 20:16:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHk-=wjajMJyoTv2KZdpVRoPn0LFZ94Loci37WLVXmMxDbLOjg@mail.gmail.com>
 <ivvkek4ykbdgktx5dimhfr5eniew4esmaz2wjowcggvc7ods4a@mlvoxz5bevqp>
 <CAHk-=wg546GhBGFLWiuUCB7M1b3TuKqMEARCXhCkxXjZ56FMrg@mail.gmail.com>
 <aAvlM1G1k94kvCs9@casper.infradead.org> <ahdxc464lydwmyqugl472r3orhrj5dasevw5f6edsdhj3dm6zc@lolmht6hpi6t>
 <20250428013059.GA6134@sol.localdomain> <ytjddsxe5uy4swchkn2hh56lwqegv6hinmlmipq3xxinqzkjnd@cpdw4thi3fqq>
 <5ea8aeb1-3760-4d00-baac-a81a4c4c3986@froggi.es> <20250428022240.GC6134@sol.localdomain>
 <CAHk-=wjGC=QF0PoqUBTo9+qW_hEGLcgb2ZHyt9V8xo5pvtj3Ew@mail.gmail.com> <yarkxhxub75z3vj47cidpe4vfk5b6cdx5mip2ummgyi6v6z4eg@rnfiud3fonxs>
In-Reply-To: <yarkxhxub75z3vj47cidpe4vfk5b6cdx5mip2ummgyi6v6z4eg@rnfiud3fonxs>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 27 Apr 2025 20:16:25 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjib+vjy9R69+gSC7socoA2tD72vAYk6JFqZ-+4BBFeNw@mail.gmail.com>
X-Gm-Features: ATxdqUFmSSiIZ5FtR5ZekGeIsPhc_hAWXu7IuqzkCaCNgzlj8JjW49lq9NjLN_I
Message-ID: <CAHk-=wjib+vjy9R69+gSC7socoA2tD72vAYk6JFqZ-+4BBFeNw@mail.gmail.com>
Subject: Re: [GIT PULL] bcachefs fixes for 6.15-rc4
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Eric Biggers <ebiggers@kernel.org>, Autumn Ashton <misyl@froggi.es>, 
	Matthew Wilcox <willy@infradead.org>, "Theodore Ts'o" <tytso@mit.edu>, linux-bcachefs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 27 Apr 2025 at 20:01, Kent Overstreet <kent.overstreet@linux.dev> wrote:
>
> I'm having trouble finding anything authoritative, but what I'm seeing
> indicates that NTFS does do Unicode casefolding (and their own
> incompatible version, at that).

I think it's effectively a fixed table, yes.

I've never actually used NT. Back in the DOS days, you could set the
codepage on your medium, and people did. And it did cause problems,
but they were pretty rare.

People in non-US locales tended to learn to not rely on local case
folding rules for the local odd characters.

[ And I don't know if the Finnish situation was typical, but we
actually had a *7-bit* version of Finnish characters, which meant that
there were special case folding rules where '{' was the lowercase
version of '['. I know, that sounds insane, but there you are.

  Those rules never extended to the filesystem, though, but they
showed up in editors etc ]

> I'm becoming more and more convinced that I want more separation between
> casefolded lookups and non casefolded lookups, the potential for
> casefolding rule changes to break case-sensitive lookups is just bad.

Yeah. The problem is that it's just *hard*.

So when I am made Emperor and Grand Poo-Bah, I will solve all these
problems by just making case folding illegal.

But until that time, I really wish that people would at least try to
actively minimize the damage.

It would be interesting to hear from the Wine people (and Android
people) what the minimal set of case folding would be.

Because I really do suspect that there may not be any actual steam
games that rely on *anything* else than just A-Z.

That case really is much simpler to handle. You can do some really
cheap things like saying "for hashing filenames, I will just ignore
bit #5".

Of course, for *existing* setups, we're kind of screwed. The "two
different versions of the heart emoji" was from a real case,
apparently. Because those filesystems had already encoded the overly
complex rules in their hashes.

               Linus
