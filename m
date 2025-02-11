Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8F4230D0E
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 15:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739287209; cv=none; b=XI5kysMaHpL8d0+kfVWFfhSEdj4Svl2TmIv0WE+5p5QOxeDuBMkyPM4xYyU7/X7Uexl+8jt+rB9SLXjH3xckzrybntfimky5LXtPp40MNgcgx/nI+7nWaRD1uyPCJwoISxYkCvXkVxxSFiXrxUVvtg1OPXP0FQVEVYgSsOxffFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739287209; c=relaxed/simple;
	bh=TzaJxWcJKmUY5Ga5qo61EJCKNiAgvtpHLBzwKKn2UgY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sF1es/rBTkw/tIfAB0kdFxfHz3X/paWX3x3Y3CvnKKa54GyXiBcwW//9qovZY6ZDh4KQRCiCOGcocUCpBga3JSvRNKhQ/Kb8AZn3EZqjK4PO7idLHe0S7Q9Y4Bg0LFvNWwC3lk16oZVBBiixYYFoeVgv5tlhXBPCHh7HuwIrR1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pF+h16jW; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pF+h16jW"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5de5a853090so7198784a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 07:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739287206; x=1739892006; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TzaJxWcJKmUY5Ga5qo61EJCKNiAgvtpHLBzwKKn2UgY=;
        b=pF+h16jW7YgkccUVcLT2I+P10VVDUdyknUqP5DbXSsIl3jcR3YytOScD4xBmlnQOiy
         KeDLEGNZBvbaYlhl4vG835IDcODpILJ7kfQwfGHE2AdudXwMEfcQdVuFlUlCgH+E79cf
         lNQokdygOSmz0TD/KB+PH1xybcZ0vU3h+XonOCpy5eReO99TH6GDQG0qsXMscUMD0vl+
         avaBvCMknrrhhF02ZmwuWXVBIwM6CgoSPyjkbzZxoU74AVx6GTzfgkv8vVR27JXYsy3s
         yPUvLRUTr24BN30Q+mLho34krU6hCed+6KIDHNwZi1lY4G4daNUXbOlZ3VsjJRsgUqtT
         rAnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739287206; x=1739892006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TzaJxWcJKmUY5Ga5qo61EJCKNiAgvtpHLBzwKKn2UgY=;
        b=hDr+kS/7freavaxc8Js9sc5JTMmWHeHn67XfFlmzZfRQ9+4iP9TzaEK+EmbObbHCvV
         cgWoBpsR0B1RXMOFGDCIwB2UEWNdd/IVmRU1EjFQg15sWCYxrYs8Z6Ol6F+YAUj5mUjZ
         1CHWaG/MEGpCzfBFDFFoVFPWTNftZ4h9RT+0ho9CQjnGZ/emp+riQaOraCUMGFu9WvUB
         cENJ9FA1dLR+eGIy2XzC6l7GPfpS6czwnDRnmB3Y/zN7mgoL+XIUg9zb9oOsmnX/2SXV
         HP3ahMJgUTVFJ8u3XqVdMKcpWAgl38El0vbZxFo2IFV1WLOdjjW34uda5K0bYdaeE3Eh
         DImg==
X-Forwarded-Encrypted: i=1; AJvYcCUTSK0Dx8mCHKsfN9laCcivbBPnLjt/2ZTAOpHgYTBwB9OTZgCif0r4y1iS+i2jzc4rYijXBo7ovqOaFlw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzG+jCX1rQ5+6l1wALtZwugKA1TFJQ2orYEr8NUvkYZDIdbRlVA
	WzDwfQ/FSrCAMT0S1iJ41t756TLG2OfE+mKrIqmoZHk3XO5VvKB9xYP6AY3T6LdpalMRHJk+bts
	FYo59GgqOENzfnK1bU1V/r2IVYnzZUDZbBkgN
X-Gm-Gg: ASbGncuq15A+6Wo6cNvG3bBbvlCl5ZFK3RR8GTkFYenNpBlaPPmg5HylAe+iSsnccLm
	2w+V3lmLUnS6Rdzd6rDbHLAY7fApxFwr3Zu53AkQEtOIInU2NWXyL9t3L2khDHhqxsl2VEOp/qw
	==
X-Google-Smtp-Source: AGHT+IEth4owsN2cD9rohcAARjd/9382+dkUD7t78PWGv1IE2yUnn9CnXi53JmFCuYO1txkt65Y7e8lsH/5TjgHniUg=
X-Received: by 2002:a05:6402:1e91:b0:5d0:81af:4a43 with SMTP id
 4fb4d7f45d1cf-5de44e5f276mr21275900a12.0.1739287205956; Tue, 11 Feb 2025
 07:20:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207-cwnd_tracepoint-v1-1-13650f3ca96d@debian.org>
In-Reply-To: <20250207-cwnd_tracepoint-v1-1-13650f3ca96d@debian.org>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 11 Feb 2025 16:19:54 +0100
X-Gm-Features: AWEUYZmNEvQX4IUPNwHy7Y7XlqImzph57mMR2FKZX52SNCst07ZlNJorvgmWpUA
Message-ID: <CANn89iLMK5B-9LQtga2HEnEs3rS=ta6eOcxxXB2gCkYYApLM4w@mail.gmail.com>
Subject: Re: [PATCH net-next] trace: tcp: Add tracepoint for tcp_cwnd_reduction()
To: Breno Leitao <leitao@debian.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Neal Cardwell <ncardwell@google.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 7, 2025 at 7:04=E2=80=AFPM Breno Leitao <leitao@debian.org> wro=
te:
>
> Add a lightweight tracepoint to monitor TCP congestion window
> adjustments via tcp_cwnd_reduction(). This tracepoint enables tracking
> of:
> - TCP window size fluctuations
> - Active socket behavior
> - Congestion window reduction events
>
> Meta has been using BPF programs to monitor this function for years.
> Adding a proper tracepoint provides a stable API for all users who need
> to monitor TCP congestion window behavior.
>
> Use DECLARE_TRACE instead of TRACE_EVENT to avoid creating trace event
> infrastructure and exporting to tracefs, keeping the implementation
> minimal. (Thanks Steven Rostedt)
>
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---

I can give my +2 on this patch, although I have no way of testing it.

I will trust Steven on this :)

Reviewed-by: Eric Dumazet <edumazet@google.com>
