Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C579D288C36
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 17:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747675869; cv=none; b=D9++O5cgPmXioTwJ29OJfJ+eKO0fpEiFYbQJrJ6km+ETD9DuU5qajcJ+eaJbPx42sk2Oh9a5/9l47vr5AgyXJwScqMPjopHH+VWOvnv8083r5P2mgc/zbXjRUkdZwjqKC/LfDgy6QedbyACnBqyVrQWYg/qDZt1kq05zCJ3sekE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747675869; c=relaxed/simple;
	bh=9k3rSkCOUuBoGczbRjC9e6BrYoiZJsdyvLLsXOGHPTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vmj08ZhpTtNCDOzh0i1XJM3GWiKm0qN9BF4I+zrcUyH1xyjqDFLMRghbsVaj+oeyXWU/Jqi+PhShd/LIBp8B7PB67CbrWiTAS4StpUxmJ63/CRtKJV/8XgXL9IWH5X/Jdm4pCI9Of3IdoolIOnbfuKh0L/xJzAQxUSBBt0Tg998=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2mtNDa2U; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2mtNDa2U"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-231f6c0b692so394085ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747675866; x=1748280666; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9k3rSkCOUuBoGczbRjC9e6BrYoiZJsdyvLLsXOGHPTE=;
        b=2mtNDa2UCZjQd5G64gKNgvhl/EPIIqYesvKxSqxk/yd9DR4QkGrdBVqUGXgdXIBwrX
         panzXFMmFo222Py+QFlkwUJaYiHleOo0qEfJThS/zYAZptw6HFm7+As7OjcU0KIeiobC
         9ni2HzVPv1rSMkNomYUW9qHF2+76rgX8Oh6WByMEsqiwM9vrjgrdTZdW3+MnixVZGYhL
         uaSQl0Mdx5BSnBGI5onxvmYic/cyEWh4sUeDLcKoMzeWRcsg5Pmy2DsqK1ixq9oChnC8
         J2GZbQ3I6+ORpczhfawUkubTkqrees6WsYwIT3XwAL1hXne/QizzV9zd0hn2ZRsEMz+O
         QCwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747675866; x=1748280666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9k3rSkCOUuBoGczbRjC9e6BrYoiZJsdyvLLsXOGHPTE=;
        b=ZNqs9ssDivhszQEmhCHAErYY19bipIrwnlJn31clSuETbXT9noKyhdF/RakbIFwlJu
         feRyhNTxcDNKuEj9opd1eLRhJ9lvk+IDixfn9zOoqpSBp6Zc10SBhUHXc6ASlKuUbycW
         OXb6WKeR18x0/5hhDR45TGcY5uLdGRs9ZbL+jjI2urwiA8VwMXx1yCoJLvV6izhGxgGs
         v+2v96M+Dqxiv6k7k0eX3zQ56xTH5Ect2AG9EDz0lFq2l1U5qSovDa9vdBzR03Tjm3vo
         vtW3zteCc/fiBxxRPZqptRMIwysoOFdYLsgNhr+U+fzyigths+x8cJYKy48nK9Rq1LXG
         yWdw==
X-Forwarded-Encrypted: i=1; AJvYcCUrEv5gtTjWjOdAzvmA5Ztwg65C4Db03NeuxZNabZhOMCdnUjcb02/kLHobaxgwNXu1DOGjfwS2TvP8SiA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx6Wka9yvqknMqPTMXptxmRhCpIr5wYoT3Gr4We14lrmZZEeTs
	NStCWRZj8Y89K7wvxFxF+QNtfoi55aWi1uSPMOyPKfuUQoqKbPSVUdzFqfeZhcZu26PjmZS2p7l
	CUugaIVx/u7woyQnZUTL4N1NmpKcUYjZ0ISt9hWzi
X-Gm-Gg: ASbGncvKJNujzNeq8jrasrpwv6HK1gQM4gQAms76WYrsuP9/avFeEx8/l2y8kFiTw6J
	4O6Hyu9kQfbmx12THlfR3cAAKgjASbC5vU2cuw8CsxL4Qge/LLTFC1It/fNBFqfIJpKy4OdOeD8
	EIsTUVHyAPWxvp/jOUilmLiYeJiZWmut/83xUlupXb6VQ5
X-Google-Smtp-Source: AGHT+IEEIZ5rIpCccmFXs6TxZYXiYRfp12vQO1P3n/ZqrkCa4SEVdMDrNAx9mJoPegE4qe9PiPx3y2eAjD4yYx4laKE=
X-Received: by 2002:a17:903:2350:b0:21d:dd8f:6e01 with SMTP id
 d9443c01a7336-23203ed3169mr4290135ad.5.1747675866236; Mon, 19 May 2025
 10:31:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519023517.4062941-1-almasrymina@google.com>
 <20250519023517.4062941-5-almasrymina@google.com> <aCtNYJo01UfMOLfr@mini-arch>
In-Reply-To: <aCtNYJo01UfMOLfr@mini-arch>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 19 May 2025 10:30:52 -0700
X-Gm-Features: AX0GCFufj5h-vFrrv9zQxEBaDXmM181og-1BYf2_XB1nm1053kjiQphd_FW10KQ
Message-ID: <CAHS8izOMLm5jLr+778nY0AdFoOWPSb+UV+1sZmOkFb5SSqTGqg@mail.gmail.com>
Subject: Re: [PATCH net-next v1 4/9] net: devmem: ksft: remove ksft_disruptive
To: Stanislav Fomichev <stfomichev@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@amazon.com>, David Ahern <dsahern@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>, sdf@fomichev.me, 
	ap420073@gmail.com, praan@google.com, shivajikant@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 8:25=E2=80=AFAM Stanislav Fomichev <stfomichev@gmai=
l.com> wrote:
>
> On 05/19, Mina Almasry wrote:
> > As far as I can tell the ksft_disruptive here is unnecessary. These
> > tests are largerly independent, and when one test fails, it's nice to
> > know the results from all the other test cases.
>
> We currently don't do anything special for disruptive tests. I'm assuming
> anything that changes nic configuration is disruptive and was thinking of
> an option to run all disruptive tests at the end of the run. But so far w=
e
> haven't had any problem with mixing disruptive and non-disruptive tests,
> so it's all moot. I'd prefer to keep everything as is for now (or remove
> this whole disruptive category).

I've noticed that if all the tests are marked disruptive, and one test
fails, the others don't run at all, which seems unnecessary. I'd like
to see if the rx test passed if the tx one failed and vice versa for
example. Removing the disruptive tag seems to resolve that.

dmabuf bind is automatically unbound when ncdevmem exits, so i don't
think these tests leave the nic in a bad state or anything that
warrants blocking running the other tests?

--=20
Thanks,
Mina
