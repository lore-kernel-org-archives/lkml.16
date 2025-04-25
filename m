Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF21C1F872A
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745601868; cv=none; b=Mn+F5YvNqyKIu7/BhXtu5XvtvHWwuSG0BgNoDZv6nPS0+y52xcZ6F2AWSf2M083sjP7CIDBfb3NDBZiBVP2t8Pi+D6nOSVVyYCZvFilBYPgdDLyvy9BCeX5nWfTXANvvyqlNzTaPz3FrqKPn316U+pi2zFl5jQ5rKkV35m1tKC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745601868; c=relaxed/simple;
	bh=LCEhXJ78EVW0YQqjmYewE+ilCkahOVXWd5IUzIEC2w4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KtquzfbJ5s6lwLbjvg9QQbMIwubwVa2BXIzx0pTsYWYCBr88uZE++EBxxQj/WO76I7MEg/bnoo5+Jm5LUzTDmsOs4p/Iq/znzgEfYZhu+rgYS5WFXVNv0a6nA7nysRY0sAo83tyUq0GCLEDGbbbzhtJy03jOQwHKutKiSggYTlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MpwKlff/; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MpwKlff/"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e5372a2fbddso2286844276.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745601865; x=1746206665; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S5BYJ/kJrx1zv49ZyZm7rE7zuXpOE/64quqeYSHNfbI=;
        b=MpwKlff/sBVttcwjDsZayFWFmFZoNuE1t4ayy53oGgPhMtzxGBhIXWm8uzz8mUp1R/
         P9OZnoNCxFUIY+y9OGratmmKD5XGxet/b7WSXoSa252nEIsysgnmKhvyJvPo68CcZ9tY
         0iCxw5y4uEh5rtK5xkU6sL+/utuK0SJpWxOeToMZWPGzKC/PptyFrgkwNB0dOk31pslK
         Y2zfXF0/3IT6rddKDT9oEnTlZOcNCNG/i6NyHjrSTdlKOK5qyp2lIEAoeVCkI+gUKS8n
         W87Fwmc7qH1EbgAK4nnmRJ25GwYN2Cy34K1oxvY6c0yhJvMtOgTiURgQxhpukiVtqrai
         sbIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745601865; x=1746206665;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S5BYJ/kJrx1zv49ZyZm7rE7zuXpOE/64quqeYSHNfbI=;
        b=q5G9eSb745vJcYJwBjEnVr2U+eJfWLvfCp/cGsxzhRPpmNfTRPC2OtV+cY0x6f6jqV
         8iU4E1Fj0/6ymwivy70dT54GW47QxZ2swD07o1tZaYWPjj/TtcQt/f/biRffU5ROlSwa
         Sk913ejgqSFDHCzoQ7nsz8r1jjKQoMq/10J70UbY2mfOsGvOkDRAbwzjQ0lQ+nyfruwR
         +diFw3ZBYflNyAMYSN3n082NSD+Q0d7zHQ9wxIsrQXgXgPB5nVpwTgeMD6dnkdHzJyUa
         iRU5NkBU4ZQtNyn4T9Jh4Ha5esKLkD31DgP+3tqEpwT1N6V7UfPcqhUebDBOS1Z3bsuO
         Ei1w==
X-Forwarded-Encrypted: i=1; AJvYcCVdtUNdVwyxLRxvj8E3Q6pBQO6zu3CDj9AHt1a+ZMR/7/W0fCOsTBX5yH2CzskLMQjw3gki+JUF0wX0+gU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoFnH6Jqf5KBPahBASGqbC5ZqLLtS96Ujy9Zwe6Cnemi1eTDNs
	ZRtosypRKPuc0lPeUOQ2A1LB4FIMkSSK74ui6sULXy0ZEz6D+umCXxZv/zjQ8c1Jnmx49IRc+gL
	m0pHjM3uT9JXUUznxlT6ErqCcVrU8/q02DXt2qQ==
X-Gm-Gg: ASbGnctFAWTWqo6v54MF/j7AYC8XagwUEABAAejRUqbgukXQfn+BqtnEiPrlhHtRH6/
	vVb5xLdfDkTfn+T7zsUOHkMPnAB4ra2v2xRtWOWbC0ukzhw4P0MISjmjYWyZj0SDevMG2G8J3fy
	kxURg3o/6s/He6nawMEoEWvj0=
X-Google-Smtp-Source: AGHT+IG5fygRQA0brhiOJhqrGMYMFj9HAIFW410x2TjdLkdc5FFpzCoknjGQr2wppGoeIDYhbcmEriauA+w7JfJty7A=
X-Received: by 2002:a05:6902:12c9:b0:e72:e170:cb78 with SMTP id
 3f1490d57ef6-e7322eeada4mr634737276.0.1745601865589; Fri, 25 Apr 2025
 10:24:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424153815.4003-1-haowenchao22@gmail.com> <20250424194200.GD840@cmpxchg.org>
 <CAOptpSPoc76ZSzbKJSnnfxtcDubJHC8a1zU7b=C=wdF6_wC3ww@mail.gmail.com> <20250425153232.GA108388@cmpxchg.org>
In-Reply-To: <20250425153232.GA108388@cmpxchg.org>
From: Wenchao Hao <haowenchao22@gmail.com>
Date: Sat, 26 Apr 2025 01:24:14 +0800
X-Gm-Features: ATxdqUE0MQUiRrofdlCaEOl4Fq4nuHIeSitZx1vQdMOQFyJB9VaQj41lcByhZpw
Message-ID: <CAOptpSNX9adqgJpjz3WP9G8xoQHNF+7OHe+WYD1gDHhp9WFZng@mail.gmail.com>
Subject: Re: [PATCH] mm/compaction: do not break pages whose order is larger
 than target order
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 11:32=E2=80=AFPM Johannes Weiner <hannes@cmpxchg.or=
g> wrote:
>
> On Fri, Apr 25, 2025 at 10:28:42PM +0800, Wenchao Hao wrote:
> > On Fri, Apr 25, 2025 at 3:42=E2=80=AFAM Johannes Weiner <hannes@cmpxchg=
.org> wrote:
> > >
> > > On Thu, Apr 24, 2025 at 11:38:15PM +0800, Wenchao Hao wrote:
> > > > When scanning free pages for memory compaction, if the compaction t=
arget
> > > > order is explicitly specified, do not split pages in buddy whose or=
der
> > > > are larger than compaction target order.
> > >
> > > Have you observed this to be an issue in practice?
> > >
> > > compact_finished() would have bailed if such a page had existed.
> > >
> >
> > Yes, when proactive memory compaction is enabled, there may be situatio=
ns
> > where the order of isolated free pages is greater than the compaction
> > requested order, and compact_finished() will return continue.
>
> proactive compaction has an order of -1?

The order in struct compact_control is not directly related to
proactive compaction.

I just added a check here, if the compaction is awakened by wakeup_kcompact=
d()
and the target order of compaction is set, the free folios larger than
the target order
will not be split when isolating the free pages.

The following scenarios will appear when there are free pages larger
than the target
order of compaction but compact_finished() will return continue:

1. proactive compaction is enabled, kcompactd is awakened for compaction
2. the defrag_mode you added, __compact_finished() will return continue if
     the number of pageblocks size folios is smaller than watermark
