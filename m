Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB982165E8
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 17:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738690527; cv=none; b=XV03xa4WEzviUWWU0MeuFXlXkYgzokPfchZtf/NMhCVMDTy/rZyDVty3eKsF+FGTNQHhHrkteauredPwsAYvaSwNOAMPifMYdo3pisZgVD+Rj3AV03UCrhC5/DaltWvMEdvuNBnvlXgSYqhsI3nk8sDMs3bCMSEg1ctqHLIZ974=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738690527; c=relaxed/simple;
	bh=zCHNKGA6MIC6IBXzZGco0x6H0vkuSlEA7G+5gjB5WwU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QkggQFklhHxue/v02sI0xj0Bhm3F7qkZlpCS+xpUlSZklRZbLgrwFCo2LUPyssfTXZ79otZgbdwtky9672wTLAKxhUC1Epai4VbHBVxfnS9Zp4ZAOtRDz5XNgIe4Giw8n94l6I16zyzxst3QRKc5808U5KAulPwFeszvkM9HPlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d4+rhr9N; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d4+rhr9N"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21f032484d4so156215ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 09:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738690525; x=1739295325; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=84XRGI+7lwmGL6GUPwbtH7AhjEYYUVi2GeiyJJ7VXBw=;
        b=d4+rhr9N7zikIW+KEMZg+mcQTPWn3C3oVbh7IFjp/+E3N9ZO0Vz+GYDjAEb5GoVIDe
         MzagfKV8ddXD5kBdfbj6vBRUbchPhacBWeKxTQL5c9FamSDkBny5X9kPdpOwBzVsvpNS
         wvOzTCnf3rKtYIMtnZbmEbKcZMM7/x6kcTtBWXUbFPSV0zS1pjqmaDthXOzCpqfwp0kT
         3fSZzjsGH1j+XMtop7Q9oBvGHDEv3xBzkZJSLiYAXylwl+UCktgVt/UcHaPDP6AmId3d
         RaXsirVOZLD96J21TOH5q6jPlGIhOPCwhr04nxwfou3hBJKUgJ+PkZjv3MPSv45GRiT9
         6WSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738690525; x=1739295325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=84XRGI+7lwmGL6GUPwbtH7AhjEYYUVi2GeiyJJ7VXBw=;
        b=BquVUjZrKJ9CPBI0MmfWG5sAOmOzVioqWcoJUq+I6X0x63g6O3NNwyUVJEnmVQQi0z
         kLiy/Zhuv5GbKMCToUNdST3YFLfs/MALlQn1mp0NiEV4yBYofJaZK/64nEJJa90zxtTC
         QrwfTgSj7OwrOZAIE+Tpx+H5jKPeX0QtsDM7AM/a5IzqhggamjBNG8DFd45sAys8I2+c
         L2tWTzNXeVdWWHmhsfe6W8mLgFGyUnXg1E+WYO8NwMNd9OjdZ5RPJYXyGmhkuVLNB20M
         dEGdYqCjmNf0co5Mg6Wb8PseFxIfUq2rGG6/D+ZyzOJJ5/ZZdA9E4zIGpt3kPtlFWKJp
         17tQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNAuII6J7fRY0qPjdSj5MAE/G3xkHOoOFOiX3vAZDfXj5415hPSfuuOYu/Kh+RSuLFz35rXAu5je1onQU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbl+9hJ1OzLNt0grPUfsFS+mzwW1QsQh+xZWMN5x810+8o5RpY
	h70NMQ8KKqjOYQpDCbvCART5D2U0a8EbdA+LqINYqfkQCzgdCusCx6ECXFixbn1WgA/LowFpvhL
	jZR5tNi8/HxWJ1bN7guI5O1Wf5pOXVmPHtQOq
X-Gm-Gg: ASbGncuOnxaQhEtDiw3HsJkdApW2lrdjHhsCGNJc7B5WeOej5/FrpqoWAai1f3neSDN
	HDw9ZTip5eN72v95+W9UE3paKnaLXXibl1zyh8jaLw0YSEcDn8g9Q+v1aYU+oGCVUPiywQyu7
X-Google-Smtp-Source: AGHT+IHg8SF867Yy+z2GXbKry2r0iDmWlZunHewA79883dWtyyKDj6PGknuUr+EeJwHqGa1SQwzcF0gj8w2TziRSjaE=
X-Received: by 2002:a17:902:d9ce:b0:215:7ced:9d67 with SMTP id
 d9443c01a7336-21f005bbe36mr3250755ad.24.1738690524517; Tue, 04 Feb 2025
 09:35:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203223916.1064540-1-almasrymina@google.com>
 <20250203223916.1064540-3-almasrymina@google.com> <c8dd0458-b0a9-4342-a022-487e73542381@redhat.com>
In-Reply-To: <c8dd0458-b0a9-4342-a022-487e73542381@redhat.com>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 4 Feb 2025 09:35:11 -0800
X-Gm-Features: AWEUYZn1moYHmrXoVYPPn5psMSRlqxODAnsNkR2q6mSq4IS5EB-8iProLqujYec
Message-ID: <CAHS8izOnrWdPPhVaCFT4f3Vz=YkHyJ5KgnAbuxfR5u-ffkbUxA@mail.gmail.com>
Subject: Re: [PATCH net-next v3 2/6] selftests: ncdevmem: Implement devmem TCP TX
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

On Tue, Feb 4, 2025 at 4:29=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wrot=
e:
>
> On 2/3/25 11:39 PM, Mina Almasry wrote:
> > Add support for devmem TX in ncdevmem.
> >
> > This is a combination of the ncdevmem from the devmem TCP series RFCv1
> > which included the TX path, and work by Stan to include the netlink API
> > and refactored on top of his generic memory_provider support.
> >
> > Signed-off-by: Mina Almasry <almasrymina@google.com>
> > Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
>
> Usually the self-tests are included towards the end of the series, to
> help reviewers building-up on previous patches knowledge.
>

I noticed reviewers like to go over docs + selftests in my previous
series so I thought I'd put them in the beginning. Looks like the
gambit was not welcome. I'll move the selftests to the end. May also
move the docs to the end as is customary as well.

> >  .../selftests/drivers/net/hw/ncdevmem.c       | 300 +++++++++++++++++-
> >  1 file changed, 289 insertions(+), 11 deletions(-)
>
> Why devmem.py is not touched? AFAICS the test currently run ncdevmem
> only in server (rx) mode, so the tx path is not actually exercised ?!?
>

Yeah, to be honest I have a collection of local bash scripts that
invoke ncdevmem in different ways for my testing, and I have docs on
top of ncdevmem.c of how to test; I don't use devmem.py. I was going
to look at adding test cases to devmem.py as a follow up, if it's OK
with you, and Stan offered as well on an earlier revision. If not no
problem, I can address in this series. The only issue is that I have
some legwork to enable devmem.py on my test setup/distro, but the meat
of the tests is already included and passing in this series (when
invoked manually).

--
Thanks,
Mina
