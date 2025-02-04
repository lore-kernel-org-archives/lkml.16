Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BCE215F7F
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 17:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738690076; cv=none; b=cjTt+bkbI0CS115f1wzG/TWkWvAC2/ddx5mpL04i2QNWDW/ArSdlUQVHm5WiNMqD3cLjCbUaCIWmUgjaixAP1nwsJE7mvRJ/q14vUB5czkay+Nukv/3HPhEg06DfcPQFM7X7BYUxPCQHt2S+uZN85fp7AY3OjF3H0BpkyyZaw7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738690076; c=relaxed/simple;
	bh=V4uv66MK680ClXu6f6Ker2AP5D+vs5LU4+W5Eqq9fDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CehyNp+pqDF4ZoPlV9hezi3fXqbXU3pXVZeTv+2Lken4VsnJUtt2gKlyBpjxIYiBUzwpstkK/zEDYwHbCVwJE131rxKUll++AF4C2/lBK4cgNKpARq4TmpPqUzT3W1tDgpIq97Y79wYnVUmE2UL0TZyix8axOdnRCfB+ccQKAJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OftOmaUJ; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OftOmaUJ"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2163affd184so138515ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 09:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738690074; x=1739294874; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rfuayBjlRpeNZsUXyFm5cOwCbpbAk9szfdT3xIhInHw=;
        b=OftOmaUJrSf6tTIWxvgCdnZPkkJuuhxPCe5Lf/UTIRn9nq3TTaVAmc4uVZTNqLTW4n
         VcwpswN4g8JyfIyqWObrF4TpF4tLPo0hC3Bz89YaDcdwa/LcUrAigg016lMxWrB0t8nR
         AXYpDuLlXq2QCnKuj4X8wICSmZPbIwnlf9aKllME7CWIMCXvi4/P28iMEbDsGGAQ1nSN
         L5qnKeUCWe2i4WHHfXWqiw/AA+bQwv2Iud4UEiuMVo6Ab2Efo+JTHmHTaL27XogA/BmW
         X1xXst6mDWUXaCAYHNXCVUNjfW/girinU2noXsXSMNAUf4/xjn5i+gZ2JCMc2EqVYEcn
         8I0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738690074; x=1739294874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rfuayBjlRpeNZsUXyFm5cOwCbpbAk9szfdT3xIhInHw=;
        b=L4Hwj2KHrhFqA1YK1VB9o09bIly5fAjXSIT2c8NsnbPrnFRfCImjX/n6HQQzK6yNWS
         ojQM9NJj3V1k0LYy99YkZ1bCfrLjim2KDWWA3JUmuyQomhdqXtzta2jIgurz7C/oTzOp
         nDOnH81eWNSElIpGCmjJVIWnVq5a/TeqCK/WJHhIY1qtPlrlzH/s1fQS0iAz74v/+Ror
         2nVv0BIkRGcOAt631x/RvLwS6NGyam5hlVMMuUWTt0WpDc/wsKFvhSkndd7+M7L9a8Wv
         P3FflqiKnudNHxCrshrLcaKFflQq3rjj3REJMIzzG4LwDRS773KpveVZqcAikaDuvMEx
         g/rQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHf9FRq0h44J0dDFKJfdehGEPVdDE3WG23MqeuSPqQgO2tdIDLTjAuvLe//31hVqBXsv6ch5jSr4y6yfg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRYDhk3Qc8UaPNnJniOOom22r4Ws/Zo0KnjFtKiT6rKGY2afPq
	J14EZZl+8sOR1M20DTdiV07BRyjieHjoo0r8h32nvziuUC1wxEJBtFnfXp0rCWDDelp84+p+vvS
	yvl38btvSgjI+hkbP9FenDDNMZQIK8cvyqqkM
X-Gm-Gg: ASbGncumzODVNXVnCOka+bqnQVoVyx8sb8Y363gjQyzc/XiRbgBRkYp9EA17MZqFnKS
	1kUjHb8dmMgTdbzDVFvRc8yA4hCsEgVn8NicPCEaApaiN5sDr05CuDhCKY1XS3u46+AA6DHUn
X-Google-Smtp-Source: AGHT+IE6dDHOUbSqrO0D169k4b7qsYEqIapGMMKqj/OrRCHutVQk4Tk9SbBciNiSXSLiP161vvVY/cJhza5i3Kply9Y=
X-Received: by 2002:a17:903:1a2f:b0:216:2839:145 with SMTP id
 d9443c01a7336-21f03afd716mr2749705ad.1.1738690073656; Tue, 04 Feb 2025
 09:27:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203223916.1064540-1-almasrymina@google.com> <a97c4278-ea08-4693-a394-8654f1168fea@redhat.com>
In-Reply-To: <a97c4278-ea08-4693-a394-8654f1168fea@redhat.com>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 4 Feb 2025 09:27:40 -0800
X-Gm-Features: AWEUYZmyHp3Gf6q5ty9WsLiNHfSw5QJWVWhu7wvqA18o91D3NGgPmvSyJ9NXuus
Message-ID: <CAHS8izNZrKVXSXxL3JG3BuZdho2OQZp=nhLuVCrLZjJD1R0EPg@mail.gmail.com>
Subject: Re: [PATCH net-next v3 0/6] Device memory TCP TX
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-kselftest@vger.kernel.org, 
	Donald Hunter <donald.hunter@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Neal Cardwell <ncardwell@google.com>, David Ahern <dsahern@kernel.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	sdf@fomichev.me, asml.silence@gmail.com, dw@davidwei.uk, 
	Jamal Hadi Salim <jhs@mojatatu.com>, Victor Nogueira <victor@mojatatu.com>, 
	Pedro Tammela <pctammela@mojatatu.com>, Samiullah Khawaja <skhawaja@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 4, 2025 at 4:32=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wrot=
e:
>
> On 2/3/25 11:39 PM, Mina Almasry wrote:
> > The TX path had been dropped from the Device Memory TCP patch series
> > post RFCv1 [1], to make that series slightly easier to review. This
> > series rebases the implementation of the TX path on top of the
> > net_iov/netmem framework agreed upon and merged. The motivation for
> > the feature is thoroughly described in the docs & cover letter of the
> > original proposal, so I don't repeat the lengthy descriptions here, but
> > they are available in [1].
> >
> > Sending this series as RFC as the winder closure is immenient. I plan o=
n
> > reposting as non-RFC once the tree re-opens, addressing any feedback
> > I receive in the meantime.
>
> I guess you should drop this paragraph.
>
> > Full outline on usage of the TX path is detailed in the documentation
> > added in the first patch.
> >
> > Test example is available via the kselftest included in the series as w=
ell.
> >
> > The series is relatively small, as the TX path for this feature largely
> > piggybacks on the existing MSG_ZEROCOPY implementation.
>
> It looks like no additional device level support is required. That is
> IMHO so good up to suspicious level :)
>

It is correct no additional device level support is required. I don't
have any local changes to my driver to make this work. I think Stan
on-list was able to run the TX path (he commented on fixes to the test
but didn't say it doesn't work :D) and one other person was able to
run it offlist.

> > Patch Overview:
> > ---------------
> >
> > 1. Documentation & tests to give high level overview of the feature
> >    being added.
> >
> > 2. Add netmem refcounting needed for the TX path.
> >
> > 3. Devmem TX netlink API.
> >
> > 4. Devmem TX net stack implementation.
>
> It looks like even the above section needs some update.
>

Ah, I usually keep the original cover letter untouched and put the
updates under the version labels. Looks like you expect the full cover
letter to be updated. Will do. Thanks for looking.


--=20
Thanks,
Mina
