Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEE3126BF7
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 14:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749566836; cv=none; b=ayfRCSAZWjEg/fqE6GIr/RpyPIfFfRVLBBzFlxG1Y1jGi1IsPZeQnf4NHt7vSq3/ldb5K3/3gJrfeZoU8QFVMaky7tZWtR5WtPhNKue7oCOSW3EUTFCdEj8FGs6tRYXPVQS0OmmKwDdSXlXpxT5JmD/PBjz6xXsaxJ/Rb23hz0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749566836; c=relaxed/simple;
	bh=FZPSJSobV+2clQAW57HhDQJrYIdKkViaMqsz2twW9aI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tNaZ4by19X2/edcEVkpNBNi7YtWiVs06tFiZ0uDsZMJXnX7C3vUiZdQ0tcg7YawNCshi6q5IqCfACcWNU1X6kOmZx3g8JolwjYsf45kefnqB9VPKzf8wOqdaThvX5b/O+GkFdxd4fVVZ7t6CClLyoYTMACvwBNfRJ6mQ2ldeM04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4nqarmpq; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4nqarmpq"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4a58ba6c945so92329891cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 07:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749566833; x=1750171633; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FZPSJSobV+2clQAW57HhDQJrYIdKkViaMqsz2twW9aI=;
        b=4nqarmpqlfmEFcgvVlKfyJBwAvhS1jQOf0ADiF8hdvhuUXw1zuC0do2is2lxemU4C5
         7zxtavahwOXXcUAQexwSnw0GOri3DAKvEO11KxKuSkpF6/LexULqTaJYMyfAbbo7VNVl
         D3BJGRXhaYIi08YJ2ltxIaHGnFFXuqBbY8hxQZZfqlkoGyXaaAgotVxUR4i42Fvfj/LB
         mW2oFKem7+tUnh53PAsLWPEgsstQom4Z8KSD90hHADRUD8DrPo5sLBjY1AEK3J5UcNB1
         3X07sQks/Q4UdaDUktlwJC4wvWshRU1C7xV6Y3BjBguVhK4S1Uq+eTQC1B8hzAdyROTS
         /t6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749566833; x=1750171633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FZPSJSobV+2clQAW57HhDQJrYIdKkViaMqsz2twW9aI=;
        b=h79oy4oNKD1oBHTsGtm528zEeqcb24cbTNMtzJZqc4aj7e5UWJiAoHKbOK31O2R1BX
         OChA4/XhnThElITVmK9GyG0inLLRJcUfiD4QQO/hiAqISBu8f5LrUcwOrWPdCveQkTCB
         BhNVQvonHyF1DogV5i6tstjaBM83x7EfrMncW4h3+YOQ7LB4Q2fZgK0lL+FwiUuR6Pz2
         OnN7JNPIaV0TtVMv+bnPZJfgnLgWKVEi+3gsnHu+ICBRx0L/5pL+0U+8/9dC4OiF/dLk
         qLsdWJnH26T7mVHa1HkXBEzsmx4Ji8drqHYaK1E3zkopnmeulrxAaIESim1Hqjzgelle
         I7Rg==
X-Forwarded-Encrypted: i=1; AJvYcCXYUGgeZRpCKuWmFPixfxOuErdnu4nnjl5Dow3TsaRXIrp9STDrYfcvqmPxFqXBbptET/58abQVWX9B8Nw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhc6T4TvuZqbLJizq98lSDnjnCjwNwa0eUv/xrCS1180DEtk4m
	ZuzUN3j8VHUUE8GT44WYW3auMTBunYkCsBZQB4wIFWShn1GB+ApZ2GeV8IWM98GSbhQ+L3hZEel
	XfgDzgHr32dVcJYLGgRNT43tsy9o9CuH6YGcCV/71
X-Gm-Gg: ASbGncvJvWATjMCFx7h10dMV46tbPxEnW3MxbpAqSQUZj5Kfo7JnwbhAN+DUwrt3pDP
	scY+GkvL/AQfsASXHOCC+BABG4BMWP5ps2jMpdahBqeFsen4wMLn2aeUHS0kg4dim5jVvWNiilU
	6sYdksHOG8KliQ/uty894Wrl2HI3qHFKgC8JDFF/83pmA=
X-Google-Smtp-Source: AGHT+IHXh/T7TQqCEkwyyhG2DFteUT8YXPJnsgh6HCzHALaXsQIqBwNAJeluGWjNRQa7dqIuBvp0KPGecicwp689F7M=
X-Received: by 2002:a05:622a:114d:b0:4a2:719b:1238 with SMTP id
 d75a77b69052e-4a5b9a268f6mr308357231cf.12.1749566833287; Tue, 10 Jun 2025
 07:47:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aEdIXQkxiORwc5v4@slm.duckdns.org>
In-Reply-To: <aEdIXQkxiORwc5v4@slm.duckdns.org>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 10 Jun 2025 07:47:02 -0700
X-Gm-Features: AX0GCFssQls_Gaij5ZeXP9fy9SKSORmaR_2shcb4agLN0_oDN8ItFdCW3VPHcfA
Message-ID: <CANn89iLan0LsN2X9RA-PkaQk+6EQJiFL0eCqQ5VsCCyU2r5gFg@mail.gmail.com>
Subject: Re: [PATCH RESEND net-next] net: tcp: tsq: Convert from tasklet to BH workqueue
To: Tejun Heo <tj@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	David Ahern <dsahern@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jason Xing <kerneljasonxing@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 9, 2025 at 1:47=E2=80=AFPM Tejun Heo <tj@kernel.org> wrote:
>
> The only generic interface to execute asynchronously in the BH context is
> tasklet; however, it's marked deprecated and has some design flaws. To
> replace tasklets, BH workqueue support was recently added. A BH workqueue
> behaves similarly to regular workqueues except that the queued work items
> are executed in the BH context.
>
> This patch converts TCP Small Queues implementation from tasklet to BH
> workqueue.
>
> Semantically, this is an equivalent conversion and there shouldn't be any
> user-visible behavior changes. While workqueue's queueing and execution
> paths are a bit heavier than tasklet's, unless the work item is being que=
ued
> every packet, the difference hopefully shouldn't matter.

On a 100Gbit NIC and 32 TX queues, I see about 170,000 calls to
tcp_tsq_workfn() when the link is saturated.

Note that a tasklet could only be raised on the local cpu.
Switching to a work queue allows us to start the work on the cpu who
did the last xmit, thus reducing the load on the cpu servicing the NIC
irqs,
a bit like RFS does on the receive path.

I am tempted to say yes to your patch, hopefully we will not regress
if highprio user threads are competing with this work queue.

Reviewed-by: Eric Dumazet <edumazet@google.com>
