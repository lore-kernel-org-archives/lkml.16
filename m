Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1747B214232
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 23:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746055879; cv=none; b=O0AHiSvO2XUfMTTiIWbtgDzsQ8cmkl5KRmr8VIGSDu47AdIxVs8zRfhe11rsr4wKMwH+Z+dDQ4BJCY2B3bwUpB9JVd/M6YeH2urzx3pehyzkcKJxJXlZAtRX/STNR4NYej6uUbOdT2i6awJwt9nIOuTwFDsFDk9/ibY9xukWmS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746055879; c=relaxed/simple;
	bh=yD3qheyPyJxLQOVC87vkI+yAdZWmU4D1zU4Z3sUtGsg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FIPH08UJS/GwYlHjijaHIoCuAsSqx1sgdSN+JosLhuIisAgcqdx2v8ICu7jKeIO2BckAhC/C81sTk0D1fnDru6IUCUXm2cIknN+HGYFeWj8AD3fHM5j1iFCLyzJeGuH/pXq5QLhCbqo8j73HGk3wopRQKng5fEj+xFMabAs0rgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Gd6XIC1e; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Gd6XIC1e"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-736aaeed234so448820b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 16:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746055876; x=1746660676; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7kkJOaWRkAsIP/ls9ASqGbXAxOgOs1WU+P/bZPko4NY=;
        b=Gd6XIC1ehog3xZBMoRH22G/Fd0fFNtVrX7xdut0cdkoEkDA6yNz2omuxrjbBDTqhtw
         albZrgP+A5nZImakrO6ZuMLVZAnzOIyoE7KX8eG+7UubBXQSb9lTlF+i4QxERaqSSnuZ
         oxDWYgXzRDvh3eenr/eEpdmL0xHPJ/W3ZYoo4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746055876; x=1746660676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7kkJOaWRkAsIP/ls9ASqGbXAxOgOs1WU+P/bZPko4NY=;
        b=tBepoTC6ba0pjzaVQnnETpPfN2XfpeSsIuzGpyjxbaCmy1qz6E2B+uNyDm22ZRj9pf
         OyoiFpjQuvJzZ+e1NSGwsduRVVocg4AsvCiJ/yGuQRuxpd4ivCBDDctmLAykWKKidNlt
         aT9ryVI0/p4b2UD9w1sdWQ3gi9BN3bkAG3MRK6r5fWcj103UJRaFWYx8jTVKsq967uE6
         JgAToVudOoztPDbmi+PberCX/t6bw8LB5dIDFU7Ud/FdF4tmqhji98lMcKkmKj2enaAd
         G6+zdvXYjflKyAJZhtMrrtbIYOZFa+qWK0HOcgc9Sep/gVy2g40PEgZblNyE2wFcS2GT
         8Lug==
X-Gm-Message-State: AOJu0YxqrUUvL3OozspNSpwxgo7LTrtY186Lf762ZoCVqql8INC6GBY3
	IIQ6CNps8THweDhpZ/+sABYevyqaUcUR89wXA3RTDyX5PZIIwFjpcZx/zM1hKHcx23/x+ydmARQ
	=
X-Gm-Gg: ASbGncsHxWSZiULR4jxBl0WvIwSwxrpahy1hJ0SpbSF181fMIKne2n7QY05GZH/jFHo
	YYVLdsPY7t+8t3+vPMnSyFxvEy7b9QeJEV5fiGesSaP48D9GJx/mBgh0TkEB+jguA0+/5JwlVgs
	aQqmqy/9j5Lx9AI6f0110Is4AgonzK3B0wU4FGyVV4VQD2CruV16bJHOND1gSdNSOhKr4GkU6Yt
	M8z72ZTuQcKzUc4I5Nwiigx+z5mF1vf8RwR69qTQ8jXQZ+lxJzexsx1rqrtI6ifrDE4cKKqjBc+
	bGUqCplyRukYWb5Onip+ronVRbx/VmmgkwJ/R7D6T4T8M4uxbv22lNpR0kv93zF1ncZt8wAOS40
	I/FxT12tn
X-Google-Smtp-Source: AGHT+IGn/1f5fVo9UAqigFTuvhU2ZWjHNOeNzjX3e9wrqMBloTE9loZYKlPBMdJ7be7YIqOCEx6JuQ==
X-Received: by 2002:a05:6a20:c6cb:b0:1ee:8435:6b69 with SMTP id adf61e73a8af0-20bd6656eebmr521239637.1.1746055876380;
        Wed, 30 Apr 2025 16:31:16 -0700 (PDT)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com. [209.85.214.181])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a5ffecsm2368080b3a.143.2025.04.30.16.31.15
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 16:31:15 -0700 (PDT)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22438c356c8so3884835ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 16:31:15 -0700 (PDT)
X-Received: by 2002:a17:90b:562d:b0:301:98fc:9b2f with SMTP id
 98e67ed59e1d1-30a41cfc2e0mr915708a91.1.1746055874808; Wed, 30 Apr 2025
 16:31:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <wpwd7rit6t4mnu6kdqbtsnk5bhftgslio6e2jgkz6kgw6cuvvr@xbfswsczfqsi>
 <CAD=FV=Xp7zOQ2iEVf896P074RW911F-e2Qa36deD0e8fWksFBA@mail.gmail.com>
 <u7ek3ccya4c3c4rteliskjjfczpmrt4vmqo5c6kjdotxdgitn7@ko24dpb35pq4>
 <CAD=FV=Wc9TnDg6vDb8r5A8dT9TvOzU2kNSKi_6TzTtb0ka=8jA@mail.gmail.com> <nchsanp7nc7nqy3kqlu7c5iwvfj6vmrkqbxyjxmoc5eq3dthjk@fusw4pm52auq>
In-Reply-To: <nchsanp7nc7nqy3kqlu7c5iwvfj6vmrkqbxyjxmoc5eq3dthjk@fusw4pm52auq>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 30 Apr 2025 16:31:02 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U4PdTgRsxJ3HVRRQEZAPHinKxhUE9FpKDOnv=nDQo3KQ@mail.gmail.com>
X-Gm-Features: ATxdqUFKrr33v60MdJ7VLJEtzDzKpshe0mGaGV2WsW8O5fvBduy-dvNn_PfNeFQ
Message-ID: <CAD=FV=U4PdTgRsxJ3HVRRQEZAPHinKxhUE9FpKDOnv=nDQo3KQ@mail.gmail.com>
Subject: Re: PROBLEM: AST2500 BMC video output disabled by reboot (regression)
To: Nick Bowler <nbowler@draconx.ca>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Apr 30, 2025 at 10:52=E2=80=AFAM Nick Bowler <nbowler@draconx.ca> w=
rote:
>
> > > To clarify, there is no boot failure.  There is just no video output
> > > after rebooting.  I can then boot Linux again by any method that work=
s
> > > without being able to see the screen, and then everything is fine onc=
e
> > > I do that.
> >
> > Super weird. So every other boot works?
>
> On a new/broken kernel, every time I run "reboot" the video turns off
> when Linux does whatever it does to make the system restart.
>
> The video comes on again if I manage to boot it up again.
>
> The problem is that I have to do that without using the screen.  So I
> can boot Linux via the serial port, or via the BMC web interface, or
> by just typing on the keyboard without seeing what is happening.

Ohhhhhh! I was assuming that your problem looked like this:

1. Boot up Linux, video works.

2. Type "reboot" and the system boots back to Linux w/ no video.

3. Log into Linux via UART or ssh and type "reboot". System boots back
to Linux and video works.

...and then if you repeat steps #2 and #3 it keeps alternating with
Linux having video and not having video.

It sounds like instead what you're saying is that you're typing
"reboot" and then booting into some other operating system / BIOS and
the video doesn't work in that other (non-Linux) environment. Is that
right?

If I (finally) got it right, then I'm not really sure what to suggest.
It would sure seem like a bug in the other OS/BIOS. We could possibly
land the revert you have. I'd imagine it's papering over the bug, but
it's no real skin off my teeth. As a test, I'd imagine that if you
turned the screen off via commandline (I never really do this, but a
search turns up [1]) and then reboot with the screen off then I'd
imagine you run into the same trouble with or without the patch. Is
that true?

FWIW: The original incentive for adding all the shutdown calls (aside
from the fact that it's documented that they should be there) was to
make sure embedded panels shutdown properly. It looks as if no
embedded panels will really be used with this driver anyway.

[1] https://www.baeldung.com/linux/cli-monitor-turn-on-off
