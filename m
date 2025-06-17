Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE2C1F1315
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 21:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750194019; cv=none; b=gds5NhwAjfaL31qyPHXrMruPuEINxmUfN1ZR98rPgycTv53nqj1nW/ReKyfkG6Lm6O9hhhe25AyBd4c6LPi5AHXqf/bNWe6IWO72fRSbVx9DPiyWLgfDdqjq/KnH59a0hYPjC8zJknB29NcMgkxTd4pS2jYGrlmmIiZnSxKBM8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750194019; c=relaxed/simple;
	bh=4f5dqrbKwcAvHZlIrGkjLHnul5z/2rv5406LjB7sPiU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AsXkTF9QJ4SkomXxbWLb/1RQuQGB0FJxeRFWp7Rsr3tiBDKtQDUidGW3+4h26OKOUYbs21XjMcr13CrN6iSjpiLb4texfw1ITkQwEL1mJrNGtUlGzzswjIjgWmM7wJPLVF+2sS6loGYcFX+oGcIH0SfHSwyEOX6EMpZ0K+lckKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XAoUxP68; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XAoUxP68"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2348ac8e0b4so10655ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 14:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750194017; x=1750798817; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tiRIrmoj5IuklufcKZYpm0KBeQtG0GR5U+zFpfqjxBA=;
        b=XAoUxP683/YrlSCjYKrX7/AsGH0VHSgas9Qnx19H7ma9rUgMK0fWqPu6sDou+CNAy9
         BSnIQKtAydWUM/e/rhy3SYGT9WhGXJ/zuJzF8YeGa1U5ptf+rksT0StH6I4d4x+0sX8i
         C4+XSzg96D9wApcQVrX6MkEbw9w0qUB0LOOJaWZ76ZMjohx2AfitiG+nGMm25qkXME01
         mhzDVB9svAmhepjFhcv3NBDx1xsrwdZ//Kk7Dy+2Rp/mgfeuxliR+jY6jQNpuJhGmEPJ
         a0VFhhsxSgazLDZwe/DL+tBYTmtudYSsrkZ1TochxPPp7IJhhHArDQlwmQfCoE5CgJYK
         2WRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750194017; x=1750798817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tiRIrmoj5IuklufcKZYpm0KBeQtG0GR5U+zFpfqjxBA=;
        b=nEwgJXwE4kQtUaeZ82r2K+GvFk5VWJU2domqa6CUPLhP5c/6KFmDbDniPATuGMRjSj
         l0zBlL+h3dHDbyco4EWAHdQhYDOLbX+ecUgjPJz+CKEmslmL4CxsH1EPVO5VSSJh5EJp
         Uv1aBfaafr3e4xRTreEgvhYO3v4b1DlYG3ePV25W1aRgaDCCfTxjNIWQuta9h+UTlJJ+
         Q7UKp3Iysuv37GVnBAJjSFs9bILqfi7JtDMFYQpcb+kb2euatorfe0vUZPSdib4LZ3J5
         wi7MdzWpIoMPYrjjheSR0IzWspjgNOZBsAJGw5TjNa5h7+oZF/9/d85DBs9smtBV/YVQ
         6SbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUb9KJc5QwL9wYSF+hidqghppUrLLb1dFX8R1eaj1zgP9+zSa/bQkyCml8jQTqQ22Ri00RYB3M0Hv9CEwc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlNwb9tWS1hSPBjUI8JKql0epVPRDB//cjYde9Hzeh3MiwddhU
	xkOfZ//hsexf5byOzWpvrMQ3sCwB8HdJdxoE7T4gVSNGq2DLWBhm7eEu7ETuKxZU02RqJXH+SWd
	ZU0VBdJLCJg5Q+9oFNoEUHe4C8kCezq4idZhfkCl3GdykaWlkIcW+O1qgIzE=
X-Gm-Gg: ASbGnctsI6TAW29+SGGJMcKAepoZp2Y297Ffh50xrFK4GMkIzSadIQ5rTlulBF3UpLY
	PyMEl+vqGr9L8QMc+A3/C0sYwyJYP1FwZaT6JESjLVvfNO3TmROtEtd4A21/Ev457BqdtBdCgqV
	EWeoKWZgXregJJY8I9+MrWCgAnWmvo4XbimSSuvl4EJ0e/AT38r6pHlk2iHxa05kdWVZC1Zu3R6
	g==
X-Google-Smtp-Source: AGHT+IGYSyFPYEN3CJyP+J4kYg78+j8ZP3rtGU70Fmfbq95+uHvXwqdRzI7fEaoV24mHUCX5t/AWMY+acWJiCCug0xE=
X-Received: by 2002:a17:903:1a27:b0:234:bf4:98ba with SMTP id
 d9443c01a7336-2366c5bf768mr9634365ad.6.1750194017160; Tue, 17 Jun 2025
 14:00:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616080530.GA279797@maili.marvell.com>
In-Reply-To: <20250616080530.GA279797@maili.marvell.com>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 17 Jun 2025 14:00:04 -0700
X-Gm-Features: AX0GCFuSvuiFb2EDQuylqXhXT-A4igR9a0X-pfgq6hhpfPcew2gQaR66_tUKLZ8
Message-ID: <CAHS8izN6M3Rkm_woO9kiqPfHxb6g+=gNo7NEjQBZdA4d+rPPnQ@mail.gmail.com>
Subject: Re: [RFC]Page pool buffers stuck in App's socket queue
To: Ratheesh Kannoth <rkannoth@marvell.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	linyunsheng@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 1:06=E2=80=AFAM Ratheesh Kannoth <rkannoth@marvell.=
com> wrote:
>
> Hi,
>
> Recently customer faced a page pool leak issue And keeps on gettting foll=
owing message in
> console.
> "page_pool_release_retry() stalled pool shutdown 1 inflight 60 sec"
>

This is not exactly a 'leak' per say. The page_pool doesn't allow
itself to exit until all the packets that came from it are freed. The
line just tells the user this is happening.

> Customer runs "ping" process in background and then does a interface down=
/up thru "ip" command.
>
> Marvell octeotx2 driver does destroy all resources (including page pool a=
llocated for each queue of
> net device) during interface down event. This page pool destruction will =
wait for all page pool buffers
> allocated by that instance to return to the pool, hence the above message=
 (if some buffers
> are stuck).
>
> In the customer scenario, ping App opens both RAW and RAW6 sockets. Even =
though Customer ping
> only ipv4 address, this RAW6 socket receives some IPV6 Router Advertiseme=
nt messages which gets generated
> in their network.
>
> [   41.643448]  raw6_local_deliver+0xc0/0x1d8
> [   41.647539]  ip6_protocol_deliver_rcu+0x60/0x490
> [   41.652149]  ip6_input_finish+0x48/0x70
> [   41.655976]  ip6_input+0x44/0xcc
> [   41.659196]  ip6_sublist_rcv_finish+0x48/0x68
> [   41.663546]  ip6_sublist_rcv+0x16c/0x22c
> [   41.667460]  ipv6_list_rcv+0xf4/0x12c
>
> Those packets will never gets processed. And if customer does a interface=
 down/up, page pool
> warnings will be shown in the console.
>

Right, I have a few recommendations here:

1. Check that commit be0096676e23 ("net: page_pool: mute the periodic
warning for visible page pools") is in your kernel. That mutes
warnings for visible page_pools.

2. Fix the application to not leave behind these RAW6 socket data.
Either processing the data incoming in the socket or closing the
socket itself would be sufficient.

> Customer was asking us for a mechanism to drain these sockets, as they do=
nt want to kill their Apps.
> The proposal is to have debugfs which shows "pid  last_processed_skb_time=
  number_of_packets  socket_fd/inode_number"
> for each raw6/raw4 sockets created in the system. and
> any write to the debugfs (any specific command) will drain the socket.
>
> 1. Could you please comment on the proposal ?

Oh boy. I don't think this would fly at all. The userspace simply
closing the RAW6 socket would 'fix' the issue, unless I'm missing
something.

Having a roundabout debugfs entry that does the same thing that
`close(socket_fd);` would do is going to be a very hard sell upstream.

I think we could also mute the page_pool warning or make it less
visible. The kernel usually doesn't warn when the userspace is leaking
data.

We could also do what Yunsheng suggests and actually disconnect the
pages from the page_pool and let the page_pool clean up, but that may
be a complicated change.

Honsetly there are a lot of better solutions here than this debugfs file.

--=20
Thanks,
Mina
