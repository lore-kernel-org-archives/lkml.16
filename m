Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEE31F8BBC
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 15:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744041089; cv=none; b=NBqIzlop2neIjQ7BP1Vv2rNi2CDe8jcFgOt07xbIjUF3u8HZ93E2WfCLR9C8j4h37BpUFa0oy1YbZZd8h3UrG/vhfFR4GqaBYNH7258YI4AtrdDGz5pcBhS09RslDJGnKlyKE7lne66vPv3agOHxK+49Z8tFIRJcNfYXmR+xMSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744041089; c=relaxed/simple;
	bh=hYByVlFOdQ5tUDsI546IduxEXQs7zpMcuwDUP1V60HQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eYPKzdKx5n1HtYI7FPOlPaYaU3k42VrqRpy0wJRyo3pcu088rmdXSpw2CnpspTHjFVoxSKa/i4OeWviVEq/Dvr0Bup9yVF4iZ66lNyjwze2CLvor6vMZgg5aAXthX5Tg37SHEszBrfcIPyyak+lOFhIwB0Jbiw5aOYCqiH1fDFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FfGWxjhK; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FfGWxjhK"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6ecf99dd567so50411626d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 08:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744041086; x=1744645886; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kdUpqYi9EvB68p5pUTuhgN002MKTGjcbPEieSfoDMKs=;
        b=FfGWxjhKPgMXVdMyiG+6nSx2ICqtLAjXDfZHXJw4Pj/eb6d82B1qGoVvYP9bEKfHTm
         e2ziq5WtdNXfJK0vX4rZpfe8207lxpowSHr2u+EDImJ1gNfX439CfxIg7WR02KEvoMkB
         Bg5FaHUO5v1ambtqgbUWX/v+8nEq+vgbzxKGXRwXV2ysH/w7tqKN9eECVCnafRodt1jW
         Ji061fWwW1owyhBOBlHxpLpDSDWh6pHeTJqqSKrm6FF/DncLja4JHwLJbbSpE84n0Gra
         RjLih7bQQgcs/tbIjRXR0l+1JpYp4Z05Bu5U/n7a7XiCkFfGymkfsuWGbuWokxrRAzZ2
         ReWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744041087; x=1744645887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kdUpqYi9EvB68p5pUTuhgN002MKTGjcbPEieSfoDMKs=;
        b=VreI1PsRRrvXGb922+5vDttYfHABjdso4tyL2QmApqgZxxbAJ52EFKNP4TTzryNfPw
         HogWwDPQdPmnDnKHFDW+rKzEz0eeradsBSj2C8yJRPehK9urtMfqOmqC7/D6NggwQmWG
         lb30BGecu3fwyhsBwXPmd7syQmj0OHcqkTGKo/2+AukXNA4YTWtablkm/Tx1ZEo3r1k0
         ZxIem7jEqcxcySSNamgA8Z0sm7PAiXm1po5dj/HVmJyhBQKe3QycFMiPjsgJoRfMTVY0
         eQyyjIu4kbAqwDWonUvVoXzsCcxloqA26zTnWWaKLqwhz4vcSwfp8Z/gQrrhXhtsXpR5
         qrCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPZTOzpLbmVdS2+oVdzLBknVlmDhjKN3mtygL106xvkNWrbSUfWmAAuf6ShEc/HWuX4we3hSfWlOXVvw4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwRPmQ/1DqiYeSVkxSqfislDRf4gOW7D3d2G5cICsXgXDR5iVC
	c8e4Hf5Pho8TAdk4qMXvxu7u2Ox08XsSbuwg8ofWMWesMB4s7e+8UWEpfzXWA+ws3GJsxnIpkrZ
	cqeP/gz4sHbCIo6KQZqLG4+mgqUM=
X-Gm-Gg: ASbGncs9i2mIk9aj96A/reNQFUaoIUSQBXP3UY+dh+p1TFJovXLnzRCWKi35dOMthUE
	Zy4cKR9XJIRaQJe0HYowoEmtPEDI2fcKKLBzrdhcCkrFb5N4cdcZzZ/bCBI9WgO8tn5jRefeEm4
	6NdF6L70OU6jVBqeL94nzHSw6DFYq2vfLReGKeJpEVyKf8OHTwqNxvrVdUJQ==
X-Google-Smtp-Source: AGHT+IGxTpDuKo5pcngYzfkY7RLk5vjib5jFyyhTKThHJRDeANtIy3AV2yqsFgJgeQTqkVrLCloyz8KWJf9nFtWhd6I=
X-Received: by 2002:a05:6214:2526:b0:6ed:122c:7da7 with SMTP id
 6a1803df08f44-6f058403c6fmr208019906d6.5.1744041086560; Mon, 07 Apr 2025
 08:51:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1743810988579.7.125720@webmail-backend-production-7b88b644bb-5mmj8>
 <0dbbbe9d17ed489d4a7dbe12026fc6fd@beldev.am> <f8063d3fa7e148fecdda82e40b36e10a@beldev.am>
In-Reply-To: <f8063d3fa7e148fecdda82e40b36e10a@beldev.am>
From: Nhat Pham <nphamcs@gmail.com>
Date: Mon, 7 Apr 2025 08:51:12 -0700
X-Gm-Features: ATxdqUGH8ufjRbUszFYILwiOzJ9nv_Aiz3jCpEtOlB2FslKOwmVTCXjwV0M9Cbc
Message-ID: <CAKEwX=NMjfC1bKTVsB+C7eq3y=O0x3v8MW7KxUfhpg6UUr23rw@mail.gmail.com>
Subject: Re: [PATCH v2] mm: add zblock allocator
To: Igor Belousov <igor.b@beldev.am>
Cc: vitaly.wool@konsulko.se, Johannes Weiner <hannes@cmpxchg.org>, linux-mm@kvack.org, 
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
	Shakeel Butt <shakeel.butt@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 2:00=E2=80=AFAM Igor Belousov <igor.b@beldev.am> wro=
te:
>
>
> >>> Do you have zswap/zswapped meminfo metrics from these tests?
> >> Yep, and those look somewhat similar:
> >>  - zblock:
> >> Zswap:            234128 kB
> >> Zswapped:         733216 kB
> >> -  zsmalloc:
> >> Zswap:            286080 kB
> >> Zswapped:         774688 kB
> >
> > I tested the kernel build on a 4-core virtual machine with allocated 4
> > GB RAM running on a Ryzen 9.
> >
> > The results are the following:
> [...]
>
> Now what's funny is that when I tried to compare how 32 threaded build
> would behave on a 8-core VM I couldn't do it because it OOMs with
> zsmalloc as zswap backend. With zblock it doesn't, though, and the
> results are:
> real    12m14.012s
> user    39m37.777s
> sys     14m6.923s
> Zswap:            440148 kB
> Zswapped:         924452 kB
> zswpin 594812
> zswpout 2802454
> zswpwb 10878
>
> /Igor

May I ask what compression algorithm you are using?

And does the zswpwb come from zswap shrinker?
