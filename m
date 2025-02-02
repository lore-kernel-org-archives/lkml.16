Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD4F3595A
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 20:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738529669; cv=none; b=KG+LwddJfadf+xAnN1B6LbN8dZZ5C7Ulwjfgi9IYTCFTrL+ytPHAkH61bLOOq6RVKho3sz2PYD20W/UOwBK7jdYnkLXU0XSBwadHle8FiKP8RlwtPfYipUgN83D3ls26JsGHBCEIgWq0HNM7vS+0qVcGnDZxThdXVRhceypDZZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738529669; c=relaxed/simple;
	bh=6qbeyFkTnjjClHBhuZEZiCLBy8NmFZpyZPe7wAsJ8LY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V8Pr8ZVsVqP3GXuzZ4L8zftykFutASc/hON3htkL/F1TLL2iFNyFFcmVhBAT8+hiuML2+bUN+HVc+a5bZAuS4nWTTJn/rdrPksmJ/o+vWDLCdA+3sD01zuISOypPO6uxsne+WYO7r85FledioT2mhtQAYwVkW890BxmWH9iyCR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=cCuJh3gs; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="cCuJh3gs"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5dc7eba78e6so6467678a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 12:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1738529666; x=1739134466; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5t2zwiOsM5H/7mjf0AgS4rc7lvfnLgdfVyvCGMgdhDo=;
        b=cCuJh3gsty5fRkKc4ulJTb3yCbYTNUzCWi7SN6aeBg+Fqk9tCyGNjHvqOK6cGddo5g
         59+rZXnJ5s1z1AiB9IvmFftVeNil7jOrtxOLGrw9nxHhfSzhyrsUYFnw9yjrXZGwv3gr
         3QP4/aFKR19VU6gxLA4P1Wfvr88rqQzUHG+Ec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738529666; x=1739134466;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5t2zwiOsM5H/7mjf0AgS4rc7lvfnLgdfVyvCGMgdhDo=;
        b=gheeGh3KMdZL+A1DuQfytNGZujgY7FfJ3GVDfx00Q2FBUb08T86dNO91i9sfjwMc6A
         30zYl66M/uTdWk+mhXkGVGxARLwbh8RZLuBZVbluFXzfDlrzosv1WyAhbsLNQVeuTATh
         JtFOl5cin22d526AbCaPgZTgSObfjqwStrhZLeT2gL4wlMEdv8/FpNpMWvOroIjGKaNZ
         0nR5oujghodjA3Oix1xo9mgZ3ju4vPIv/gA9XClFXstNE+ZvifKFSxS1c36mab4Pfajn
         u1lVRD/kIuUbsoUBjUZerEvUOo5joMN2dzXSxD2Kym1758A5kOUaeh5vss9/VeoviKqa
         39iQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzqfitg2waC5YGg7mabKZh51fSFjDqL3XWgvbqWO2CveQIVXXiMHb2lrrsg+TJryX6F4s5LiepO8UxIOk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVi05PTxlQnAvzwEZP47vKEtwjjEgvv6B0wOp2gcTMh+c1DBCv
	KvAnpxOXe1e6GKe3+6t7p9xMs7uqi8KICX9G7frwmB0CUiLlvxw8n8fcKqXF831nNhd9/av64os
	l7Q8Dtg==
X-Gm-Gg: ASbGncv+1l1tNvr2myVZ+p/ooTjElpahfLQ36cdFSbAPktJq43erwVp1mX+kKKVOLdB
	UNwjkbO54wv2JswrwXG3oesX/EQzgCag2gAeuztNfBPcKlgKaTyl643y+OSZR7fY1aLI5etuLh8
	ulBQmHQ5/Z72by29cYyqbwrbiPZOn1r8Lsq9GEJ990DkNyAJC5PXavPZ0KaT5KWEGXL40JYT+5K
	Wbs2CyGObFe1JEe2voTSJPEYwZysvD+BoYHqa/Ngs8TGPW8ymmyYXwiub5yzgxJ1jiVLHRbgx6Q
	yUqYJPi2RfLzyPNR7EheAHXf2Su9TWhHWxxTi76VlnhnQr+fPT89Rnk4Q8sfdauT4A==
X-Google-Smtp-Source: AGHT+IFARjEu/2hRj2F/HylwHLjIRwEmREjCe0JHh1QsrNQ2R5or20nuIT/x538ajsDRzjpJkwf+nQ==
X-Received: by 2002:a05:6402:34d2:b0:5d8:253:b7df with SMTP id 4fb4d7f45d1cf-5dc5effcbc1mr21871809a12.27.1738529665708;
        Sun, 02 Feb 2025 12:54:25 -0800 (PST)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc724aa168sm6316684a12.52.2025.02.02.12.54.24
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Feb 2025 12:54:24 -0800 (PST)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5d3f65844deso6861420a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 12:54:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXe20bTYPfVVPVHbuuwDKQP6Dy/VBlnBDWNLmmoyka2HEjsCKR6YlcqU/VA9h948E/cKhBZwYv4c5LNAWo=@vger.kernel.org
X-Received: by 2002:a05:6402:400c:b0:5dc:7fbe:730d with SMTP id
 4fb4d7f45d1cf-5dc7fcdb696mr14967854a12.6.1738529663837; Sun, 02 Feb 2025
 12:54:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPM=9twyvq3EWkwUeoTdMMj76u_sRPmUDHWrzbzEZFQ8eL++BQ@mail.gmail.com>
In-Reply-To: <CAPM=9twyvq3EWkwUeoTdMMj76u_sRPmUDHWrzbzEZFQ8eL++BQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 2 Feb 2025 12:54:07 -0800
X-Gmail-Original-Message-ID: <CAHk-=whRBX0aQq1J5S5nHXE2GvXnQ5z+cqu=iTY9xU34kvYMzw@mail.gmail.com>
X-Gm-Features: AWEUYZmtdf6Aj4eR4CjeK7M4f9l-h8Ccbl_a-DQ9v5PSq10GpXRW0o0FHXwpAT8
Message-ID: <CAHk-=whRBX0aQq1J5S5nHXE2GvXnQ5z+cqu=iTY9xU34kvYMzw@mail.gmail.com>
Subject: Re: question about firmware caching and relying on it (CONFIG_FW_CACHE)
To: Dave Airlie <airlied@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, 
	dri-devel <dri-devel@lists.freedesktop.org>, "Luis R. Rodriguez" <mcgrof@kernel.org>, 
	russ.weight@linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sun, 2 Feb 2025 at 12:15, Dave Airlie <airlied@gmail.com> wrote:
>
> Currently FW_CACHE is an optional feature (that distros may or may not
> configure off), where we will cache loaded firmwares to avoid problems
> over suspend/resume (and speed up resume).
>
> I've just discovered a problem in nouveau's suspend code when the
> FW_CACHE is turned off, it tries to load a few in it's suspend path
> for certain scenarios. Enabling FW_CACHE fixes this, but I'm unsure if
> that is considered properly fixing it or should FW_CACHE just be
> considered an optimisation.

Honestly, if the alternative is "driver hacks up its own caching",
then I think it definitely should just say "select FW_CACHE".

You need to make it conditional on PM_SLEEP to make Kconfig happy, but
arguably that acts as documentation (ie it kind of ends up being a
"this is *why* we select FW_CACHE").

So a simple

        select FW_CACHE if PM_SLEEP

sounds like the right thing to do for nouveau.

And in fact, that was how things used to be globally (with no driver
selection noise needed). There was no FW_CACHE option, we would just
enable it unconditionally for PM_SLEEP, exactly so that drivers would
*not* try to load firmware during resume when the filesystem may be
off-limits.

HOWEVER.

We apparently have some completely cray-cray "uevent messages" thing
going on, which caused commit 030cc787c30e ("firmware_class: make
firmware caching configurable")

Honestly, I'm not sure what broken thing that is all about. What
uevent messages? Firmwas caching should cause *less* uevent noise, not
more, because now we don't need to talk to user space as much.

Is that some Android-only thing, or is it some inherent stupidity in
the FW_CACHE code that I just don't see off-hand?

I do *not* see any real explanation for that commit, only that
statement about netlink that appears very odd.

That commit really makes me angry. It has that pattern that I
absolutely hate: no actual background, and a "Link:" that makes me
follow it ("Yay! Explanation!") that then only points back to the
patch submission ("#^&% this thing").

Useless. Annoying. I absolutely *detest* those links that give no
actual useful backstory to what the thing is about and only point back
to the patch that I'm wondering about. The disappointment it causes is
intense and real.

Anyway, I would say that particularly for a driver that wants caching,
adding that select is very much the right thing to do.

I'd rather get rid of that stupid config option entirely, but since I
don't know what the background is for it having been added, I guess we
can't do that.

Greg, Luis, can you explain that odd uevent message / netlink issue?

            Linus
