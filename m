Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54CB189B84
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 14:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744121813; cv=none; b=oLEpTIWtcrhf9nKtZkkXxlBmXX3g/lsRgvTx+93yCr+k0Hgme44xGT7gEVPKzJbonBouHr4I4N3hXaCN9VHZuyaUtUBcKtJt3WgPpsPwJgvrFu6EBqgDq3/dNLb81obh9hVv1QZCMHR2gDxO7YnpZkT1u2ewZqkmWWyb3qwlPVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744121813; c=relaxed/simple;
	bh=LPJ5DC/qJdNwC6BaugmZeWV0dPB1/Q4W000XRyMqt98=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=usTqQPeJ1HxHGuPoKKYDIxDwlItwRD3LE8Ihv+sDGlsZifIJHyLR9qU8l3/ZsILbWXgn69XmdQumcKLMfuxNPu8qLCiU8Cn9oUbApTCq0lvxK7WL4xLwspEw1CvXSfKs9BTF2jXtAYrrP6x+N+PpJQyc7Lf1ls9IagDHy3UFjQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aP+dfGPS; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aP+dfGPS"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-476964b2c1dso93132451cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 07:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744121811; x=1744726611; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LPJ5DC/qJdNwC6BaugmZeWV0dPB1/Q4W000XRyMqt98=;
        b=aP+dfGPSKmirZPV8tjGdr3KDeDyNcXmfHJs1Aip61R5A5tf+2prq/TK02tGnfLn0TT
         +fgVZvYgflJyv+wh2El/jm1zMoHTH1lCNd2h6dHcqWSm5NM8/QK9c8yPLJIa75esu0q2
         y1N6SD8saKUtGGfNgHt29N7ph6ahbQhbNBwPZwmfRz88Nx6DeERpcgc5Gu1xhY7tyFd1
         jADaiI6cebEcthFF3zrfYDgZP8VvKOT3D+e3gio9pXCeKvbB6LiEI55g3YZvy89C7X+h
         QKfsavgYPxJuLmlImr4m2WsK7VFdxuHJgVXwVsdSAHmRAdrTQmqV9zue7y52ZeBcq0f/
         GFxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744121811; x=1744726611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LPJ5DC/qJdNwC6BaugmZeWV0dPB1/Q4W000XRyMqt98=;
        b=HShEzs66wllXlFel2cjsTblIWEq6g7LL0UrnGKN0/mb6nFui1k1UCuhnjE7v//ERFG
         nPph388ytrRdOTbUOIr9C4ihuzEqdLK4p1Rf80eID+TUb2EmBeoepoTepCkvk5+DzaNT
         X9FcH7X14Q0hdsqtAaWaC+G9qZjL+RlanHgwn/Ujqw9uROD2kuSl/ULlV1uevh7aiHZn
         UqymQl1hqiynxD6HIXnwPAhPxdoBI6BBI6TlF3sPP4nQcnoNXF3GcT+JdMwCCEyfFUAb
         5ww8slJQ+S5ErsGlWPBSuTh38L1ieVeDvZfioch1u40floGJjEAFmtKCfLKHB+UMoVma
         I18A==
X-Forwarded-Encrypted: i=1; AJvYcCXkw2G5kNz8NxwrLT7kuyXCi2IOIfTvszI0pkvTb9iwnGyDqE9g0MWurwc2c2Xk686Y0yTqQORQveWED00=@vger.kernel.org
X-Gm-Message-State: AOJu0YxM+MG95+H2P+hYMXZFUtbmJbwkHRQbz+r/x9FgwEb9znUq4kgJ
	6+x6J2ySsx0y9mTdBnhb8BMFDqlHWFvozznsEjnlzyaN9l5SbBQjz20Ru8qI7ccw8U0gV8piMY6
	aVqpuBF+Gh93AB9tMrwFA2QdNCPyMlfr/ykSS
X-Gm-Gg: ASbGncuMv0A4KiyWo5T1av8tYisU8WMtIJTyru6GgaLsuXnhwYoejJpGdS+f+2WMlFI
	1PGfbCNx8zeEPKOLEQeJeHS9dp3YwusLQjA0omI6kQzPnlMvHDGUGBEq4GW4+YK1FJWMxK8YGfe
	/2tvwhnOvyEjSeD1AeXeYXCXpCd8g=
X-Google-Smtp-Source: AGHT+IHUjVyFD7izpuiUpvmNnf+FDUH75moOoGezgMNusboh88UNsivDmQCcYc+G4RahQGt7lDjXkGMaNSEWhyim3Q0=
X-Received: by 2002:a05:622a:20b:b0:476:7199:4da1 with SMTP id
 d75a77b69052e-479249bd49dmr285747491cf.46.1744121810231; Tue, 08 Apr 2025
 07:16:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407140001.13886-1-jiayuan.chen@linux.dev> <20250407140001.13886-2-jiayuan.chen@linux.dev>
In-Reply-To: <20250407140001.13886-2-jiayuan.chen@linux.dev>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 8 Apr 2025 16:16:39 +0200
X-Gm-Features: ATxdqUGjCQjPmmLIhcLV4VA-4isczJrM0_7BiR56nk0Heb7yBGKhT8w790UEEEE
Message-ID: <CANn89i+a2tbuEJgzQ-yvSt-jqXq6S5y6=C90jNB4QXGseg0mDw@mail.gmail.com>
Subject: Re: [PATCH RESEND net-next v3 1/2] tcp: add TCP_RFC7323_TW_PAWS drop reason
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: bpf@vger.kernel.org, mrpre@163.com, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@amazon.com>, David Ahern <dsahern@kernel.org>, 
	Steffen Klassert <steffen.klassert@secunet.com>, Sabrina Dubroca <sd@queasysnail.net>, 
	Antony Antony <antony.antony@secunet.com>, Christian Hopps <chopps@labn.net>, netdev@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 4:00=E2=80=AFPM Jiayuan Chen <jiayuan.chen@linux.dev=
> wrote:
>
> PAWS is a long-standing issue, especially when there are upstream network
> devices, making it more prone to occur.

This sentence is quite confusing. I do not think PAWS is an issue at all.

>
> Currently, packet loss statistics for PAWS can only be viewed through MIB=
,
> which is a global metric and cannot be precisely obtained through tracing
> to get the specific 4-tuple of the dropped packet. In the past, we had to
> use kprobe ret to retrieve relevant skb information from
> tcp_timewait_state_process().

>
> Suggested-by: Eric Dumazet <edumazet@google.com>
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>

Reviewed-by: Eric Dumazet <edumazet@google.com>
