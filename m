Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E46292910
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 13:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750425878; cv=none; b=Dk8H/m9sqXxTUwzmjCpoSXkRAAxewkXyGnWm3e52w8vo19EdOONn43xNfMIroIJMpVysJH32rZhxLDG/Nc+6PKf5YWZHuIAlYr7klkoP9iHMwTD/Z/EhuCuTfMJS/rkI9Vn+dCvFs1EFahCI9glRQUXERUuNRPo7wJ9Ydhq0oeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750425878; c=relaxed/simple;
	bh=d9ZfafjmIee1iG+4AYS+vqOpLxzW4Rp/rsErzbqVdU8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ajwl3URA6Mi5ohJRZKIEUZdXmB1aRtREchdkGJXURr/QRsgiWjbH0V3fDrH48ld3Cgg5/7/1XN3ZEUOC5uoQp2p2drXWJhpHfGsBx+yO1nYQzDZfwagwu1BPtLBIgYZT5u9U31T1Q8wMiDt2TzZ6RQh0T3zTGcJHUrxWtyB0hz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BSYHcxwf; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BSYHcxwf"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4a4312b4849so19299071cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 06:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750425875; x=1751030675; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d9ZfafjmIee1iG+4AYS+vqOpLxzW4Rp/rsErzbqVdU8=;
        b=BSYHcxwfP/jZz2aqO3yNcaCca98GR/68QtS+UsKdu3eqcbjNvAsSTTaSPobyiAKMI+
         yCSMkZcjAPBx06I8EG+vC/nAR/4GdK9P8USncIn/bMfHIJhh/O4V+fx5UslvWsU6Agph
         yR2+ZK+l9p3fcpEAjEl9DmI2a6pyAfgZ5+0cOzjoWZ69NAXVNCmJkRRkKJ264DCtLdVu
         6bItaJnx+7h3giTb+TBpuq3pcrPMoDeED9vCkdwTUODp+bxnRitfX4NJLxXTefRVe6OU
         Cnh3hxXdN1et172yZC/kxo3Zac9BekSoCboGYMsbE4cEktOOP9bWznXgSZ2UlqZsR7Lb
         07tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750425875; x=1751030675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d9ZfafjmIee1iG+4AYS+vqOpLxzW4Rp/rsErzbqVdU8=;
        b=LKduwtIAeCCsHOk6iIlypzycCTZVYb7a0cnLTP3FXakhc2BEQIJlMmw5b/mbHuLLrT
         kyAG7PcMhHO5oAdnupEEV80mmGh02xAeYlhT06te7rF0l1Yv9gI3CB0R0YLTNL1sWbNw
         jAPdk/xvFrZ3r546jW2qiLfuhOnjuiyKKyhetfu/pcOyX1gQ/Blu8uIrx5Ru/4+X+8D9
         wu+TL8aR6LqvdgEo+M5NlMHxB4CXdfLYcA3xDBd9lhcNzubz8Ei4D+VO7CIcybI5MJaP
         VAKE9nRFfU+lwuSHldsfvTUN15RxPo2HT8q42rWJu48+wtrxcgpP3swAKhmictgE3Bv5
         53Cw==
X-Forwarded-Encrypted: i=1; AJvYcCUmpA0kf0xxrr8Odvoz9oOxTRvTzduV7VBRmGRIuHEUJGdjZxah3vYVDiL2ujGGp7IEreWVE/8nOhZjIw8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyY1pQiKtPCIA0gfUZ7fH6mCqGn315j7L5/iMzor0uXp8bUp8RJ
	9B0mkAIYOr1xpimz5geaR22+FSewYk/tGOio5M66qiOujflV6SLKBWQO/JQ/nK48WNMJD8YzGaI
	yf1qyfs7B0tpgZBlFSUkiiku/F2TAegyQxGkKnF1H
X-Gm-Gg: ASbGncvnC8BhvhRng8vJ19Z3A12Z8JyqRQBF0T+cSx08V0AwrbVdMeFhz4mQNnLkngk
	ehdFRTSlQKSY55QHvC1z0ou+sI5ykJQ24qy3DwavrW/Cj4NLhDlXGkt/gk7HkQvr0gG6osDNYDY
	Zt3HdxFIz0CEVvrWwc1/nffyeAnHEEcPePcOpgBplllA==
X-Google-Smtp-Source: AGHT+IG4eaVt0MWfu/UDw8t8Al7b4heihOxTJYPuijSj65Z6bXsPF7O0hfoC2og12Kgf2KdA706bwmNyEIknhSNOCDU=
X-Received: by 2002:a05:622a:489:b0:4a4:31c5:fc8a with SMTP id
 d75a77b69052e-4a77a29d8a5mr47363631cf.47.1750425874849; Fri, 20 Jun 2025
 06:24:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620125644.1045603-1-ptesarik@suse.com>
In-Reply-To: <20250620125644.1045603-1-ptesarik@suse.com>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 20 Jun 2025 06:24:23 -0700
X-Gm-Features: AX0GCFs8knA8ecPrWGUgxdl0yH3mTUWy-n9f71rdkERcznqHz0_ZUn3B44h7Urk
Message-ID: <CANn89iLrJiqu1SdjKfkOPcSktvmAUWR2rJWkiPdvzQn+MMAOPg@mail.gmail.com>
Subject: Re: [PATCH net v2 0/2] tcp_metrics: fix hanlding of route options
To: Petr Tesarik <ptesarik@suse.com>
Cc: Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"open list:NETWORKING [TCP]" <netdev@vger.kernel.org>, David Ahern <dsahern@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 5:57=E2=80=AFAM Petr Tesarik <ptesarik@suse.com> wr=
ote:
>
> I ran into a couple of issues while trying to tweak TCP congestion
> avoidance to analyze a potential performance regression. It turns out
> that overriding the parameters with ip-route(8) does not work as
> expected and appears to be buggy.

Hi Petr

Could you add packetdrill tests as well ?

Given this could accidentally break user setups, maybe net-next would be sa=
fer.

Some of us disable tcp_metrics, because metrics used one minute (or
few seconds) in the past are not very helpful, and source of
confusion.

(/proc/sys/net/ipv4/tcp_no_metrics_save set to 1)
