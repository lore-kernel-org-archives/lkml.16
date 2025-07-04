Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F24A262FEB
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 06:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751611965; cv=none; b=uy1+AGPyT74/VQSZST+q22TYpkzfwHGkeAsU6PZ5Yzdnv5WrapapU9op5C084d2bz79c/WO6k1RKCfpN10my6/liwsjEBSKm+xBM7gX2RlNCe8Wt1gXz5ne3u4jXgqMtunr7vG6nVzsChPOCoQL1QVyCXiPGgXrx+018/8pwEPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751611965; c=relaxed/simple;
	bh=Tv4gB4IzmA09TgqZAyPP+TGiF9YCCa1B+JrlwcTCnmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jf/F7pY+DUBlJ2SJzRz1PcN9y98S6M1bk+4vZL+ukXuvGnmgyHPRYed+QRQfJZNuY4kmwklwQgl5g0QGEZAVn1WqC4y6zn91hPIrx76JZ8I087kG3eYMvN2tm20BMgCz6sFAMiH5lS1sif2vRrN81+ggWPW6sllq8m6BkfV4YxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=ZMDT0Lsq; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="ZMDT0Lsq"
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 622EE3F69B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 06:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1751611960;
	bh=Tv4gB4IzmA09TgqZAyPP+TGiF9YCCa1B+JrlwcTCnmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=ZMDT0LsqzJYbpqAg0pgTwx0phG0NcgEfh0IwT3/xlrqszixi5CYBcjNcI1hRjNOcz
	 YZ+47/H455eTGRIdhkWdjc6uH0A06FwF1a/ZIIwKW3bM4n2wwGyErk4z4XjrBnaxii
	 eJnNrIgqMZ+MdFlICAn1A3rDCBEtrR9P+fiJDvZkbytuprZ1ERYl4u/Z0PUnyY7xY2
	 hq/ut8pSQ9sXbHIShAIlwrzhQH7nCzZF668bCAxPvEAcRmtRK4EtZX+es48NZKTRbq
	 DisLGQNiCPZYLGZgI25uPa7LKZdAhrljj4++2LWqKgoSAcvEqIQB8rzR8FZYN+K3sd
	 2TaKlZrkPR4/w==
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-87edf585bf9so462440241.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 23:52:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751611956; x=1752216756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tv4gB4IzmA09TgqZAyPP+TGiF9YCCa1B+JrlwcTCnmU=;
        b=badcyZXIoV8AOC65FH4FCGU8UisbyMS9Cf3Wve7IlUka8kFUBecDf1fUnF2r4Wl8Bh
         ozE2pM2kshrBcM+kWOFBOz9+S6m6Sq5c+CIYfsiN4dDiyD5UqFhNSbxLaevk3h6hkJw+
         2IkjYme+Eqo3s7wKiMEU+VTxQe3L8bu+0hkUzt45yFj5YfGzued/x5OcavIL3TBHoyRT
         l2WHK4h17qeOVxGFa3e/sZ5dm0lQZUAyohpMwQPb4nxrMIwXgWgGC7VDG3/6fX6KNzUV
         EPW42ergU1xQibTUIBZJR7LRmpX9n+Tg7MlBRtN9S0QTmXf9X4ss+NspMgukHvZgy0Ye
         2xiQ==
X-Gm-Message-State: AOJu0YxZS7sTWcuqHrofi6SMoCzdmwwk8LctSTIyB9Tx33ld+7JVScxj
	DDOFsHSD2/VCM6yDDjJNpBlaTbzfYeAJ3+yupdxRf7RFBFcSu7bUtTCbfAYJ1kcPMyeAr0zh1LM
	kmwsX7QldJKYG11qibW+WfCR/f0u05/BDG2FmrAvbOboIooktkNkCHzPASbJW+S4qAsrWtMcpBe
	1F+OL+xVsjWOrtXIvQxqAl4fp16tqbrpHkBC9koXtMn7D7ctfFxWDvwM/J
X-Gm-Gg: ASbGncsuZcbvIUP8FtW2ZtDdfZc81FzWMIPczWhOUULs3gQGXqyQCVsKXp3HX28xMtP
	t9t69edPFGrcO5nvH7BwhKMoZw2AmKJvYQ09w/6oErP2KC6IWXhihGYdhTmq1/W8VL/VQac77R9
	kqnEcr
X-Received: by 2002:a05:6102:50ab:b0:4e5:9138:29ab with SMTP id ada2fe7eead31-4f2f18cfc95mr441081137.15.1751611956009;
        Thu, 03 Jul 2025 23:52:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHB7HfZmQOhR9Isg874gqYf7ux5G+ZxtwZDg/dj07LCt1Yk4BMJUJdZLZ+cFBmHmnW+F1WX3cb4/8peLVtympU=
X-Received: by 2002:a05:6102:50ab:b0:4e5:9138:29ab with SMTP id
 ada2fe7eead31-4f2f18cfc95mr441078137.15.1751611955653; Thu, 03 Jul 2025
 23:52:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250703222314.309967-1-aleksandr.mikhalitsyn@canonical.com>
 <20250703222314.309967-7-aleksandr.mikhalitsyn@canonical.com> <CAAVpQUDn6vjd2SpwZj8v9KM=yzmC6ZjB1sf3xO4fc=sr4s367g@mail.gmail.com>
In-Reply-To: <CAAVpQUDn6vjd2SpwZj8v9KM=yzmC6ZjB1sf3xO4fc=sr4s367g@mail.gmail.com>
From: Aleksandr Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
Date: Fri, 4 Jul 2025 08:52:24 +0200
X-Gm-Features: Ac12FXxtIsZihNOxSNCXS3Jjflo4OPvAJ9izvZuFGthK8qAmPo3MPUpvzqlW5DM
Message-ID: <CAEivzxeM3+TwwU7jR0i-=GrhZEyd+uffAQeODvyb6ZRRd7gsDg@mail.gmail.com>
Subject: Re: [PATCH net-next v3 6/7] af_unix: enable handing out pidfds for
 reaped tasks in SCM_PIDFD
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, Leon Romanovsky <leon@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, Lennart Poettering <mzxreary@0pointer.de>, 
	Luca Boccassi <bluca@debian.org>, David Rheinsberg <david@readahead.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 4, 2025 at 8:38=E2=80=AFAM Kuniyuki Iwashima <kuniyu@google.com=
> wrote:
>
> On Thu, Jul 3, 2025 at 3:24=E2=80=AFPM Alexander Mikhalitsyn
> <aleksandr.mikhalitsyn@canonical.com> wrote:
> >
> > Now everything is ready to pass PIDFD_STALE to pidfd_prepare().
> > This will allow opening pidfd for reaped tasks.
> >
> > Cc: linux-kernel@vger.kernel.org
> > Cc: netdev@vger.kernel.org
> > Cc: "David S. Miller" <davem@davemloft.net>
> > Cc: Eric Dumazet <edumazet@google.com>
> > Cc: Jakub Kicinski <kuba@kernel.org>
> > Cc: Paolo Abeni <pabeni@redhat.com>
> > Cc: Simon Horman <horms@kernel.org>
> > Cc: Willem de Bruijn <willemb@google.com>
> > Cc: Leon Romanovsky <leon@kernel.org>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: Christian Brauner <brauner@kernel.org>
> > Cc: Kuniyuki Iwashima <kuniyu@google.com>
> > Cc: Lennart Poettering <mzxreary@0pointer.de>
> > Cc: Luca Boccassi <bluca@debian.org>
> > Cc: David Rheinsberg <david@readahead.eu>
> > Signed-off-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.c=
om>
> > Reviewed-by: Christian Brauner <brauner@kernel.org>
>
> Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
>
> Overall looks good, thanks!

Thanks, Kuniyuki for your help and reviews ;-)

Kind regards,
Alex
