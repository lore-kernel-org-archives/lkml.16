Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B361FECD4
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 19:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738785156; cv=none; b=YE0IHBJWQxI3xxHjP1w3JoiJBreXdYur+A4w8uMnrPUzHvcHyaL7OTSc/K+S4RpgYN1+fYwDzbGDVE6spJJKuLgrwsTEdT2ShS6of/9tKBoLm8eGUWzVmcinUHs0dQjbqDjlxTwA2ucSSsjsheSRmvtlpUy+lsuMVYVeglpbvis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738785156; c=relaxed/simple;
	bh=ylXsVJQ4SkSRoIxit5Ty1D4Df/HyuC5GpDfK6nUoWVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RZtYF7ESZt6hPBfYKDapGtUyZLWWD8R6lIDiQzC2FEGGGw3ET2SAa7laAog7SYP/37J65AUtcn83/aZ59sJyshi5GBS4ucG5RUzM2IQ8qTVYXdfJsKURo7ElmXu669j8MGiD82GTTQMWiJiCyaf2uKfwobJrqovhYt7yFxIg+hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UpB1XR5E; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UpB1XR5E"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-219f6ca9a81so21735ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 11:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738785153; x=1739389953; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FWWB+QEPZ+Au3FNEZ2YpDzx0U4CEf7uGyoSwdOXplO8=;
        b=UpB1XR5EmxINE2f/mfWjDipOftmw7hO5LdxoEeNMTw09zC+JiN0JAUo+m51ldCY1AE
         rRAPP09/qVH2y7LQJkisZkV1Im452uVrI6JIIyhu6BPH0yhKL2yA9XeVLeVMBItPgx7a
         2u7Ehtm4ZlT6SxeENivcsRN6lbjl3QzdKL2/ZEA6giQUw6Z8GW5G7MhzsTxtaqufIF+o
         77h9IZTipLicVd4gcARjzVJhTS4DToxwD6d2Te8Z1wvYkXbB6h7qjHKD/2cL/JMp3cE4
         bEDDToDfLnyG4PQhOPxS+9p7f9W+Ba3QFiYisKC9iktLLMfBP1miIKmZ2QAd2a73k2ya
         JnWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738785153; x=1739389953;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FWWB+QEPZ+Au3FNEZ2YpDzx0U4CEf7uGyoSwdOXplO8=;
        b=s4dzqMQh2IbCYHS6EMMq8t0/PBDMIuD31Wyd4wsQcE14L9v6/rM3bvb8xod0wsOss3
         6HnD0OiEJ2THDsgUUMGs1oRhdsA33e2xLHJKqOIqScncjqGBUzSjK21UoX91ZSPU8/WT
         meECE/OCrBa7u6jKSi3obM7r6Tg4q11UKY+QJlT9AAig9pgZKIbyApG+WW2lSsJsLVtb
         usUvGrWABMEBKJscHCOMKqBzBgOCaGEDCGEKv9Xf9Xh82lJ2S83BwjicUX+RZaNWmHJw
         5v8YbkC6kGRYUtshz2U2faQ6TE9efVHmdGf1WiIdgLGtMlBym6UDUVOdcpOzT7h2hZ1z
         97+w==
X-Forwarded-Encrypted: i=1; AJvYcCVrX3SXyJtJs8SgQ4tC1OIn1YvKS45eaiCIDDOnmTgWWoYeBPAjwN3wMBln+ib7rR6zKRmdOr1L4tBhE84=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCz5pYU4GCZn+2ezCI67ojpjEw9mjTj5karOMtZYlf/Kx3Z4Za
	xsPC2AcctIt1ip6PwDvddzxCt6bXYEl0K2Y0+cy1Mynm2Vgcd4ApDK8xctSS9h+2Df+oBhsWOV4
	5Alnfe0AaGEotuzN8Nzo0tU0yP2Jrq20SZ6ri
X-Gm-Gg: ASbGncuoBPZUnDlanOp85nfwoHTR/CfdbHg6jBJ8v43PP7s9Dwh/YPuIvRiXEhHeoGi
	nAFBJnL/Oiq0YCz/hvrDT5s3nPi0lKdac7P/dswb1QylcZH1mIA6La33OiliTHmApUowwwJtT
X-Google-Smtp-Source: AGHT+IHSXvK084oC3z+1fgrASub/JYpZd/AoLG9lE82EQY5MiiDttWHzSDZOOWYo0x2zVfAmQP+VclfQEe9+CUjMAGc=
X-Received: by 2002:a17:902:f64c:b0:21c:e29:b20d with SMTP id
 d9443c01a7336-21f311d088bmr191825ad.3.1738785153331; Wed, 05 Feb 2025
 11:52:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203223916.1064540-1-almasrymina@google.com> <20250204180833.48cb40cb@kernel.org>
In-Reply-To: <20250204180833.48cb40cb@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 5 Feb 2025 11:52:20 -0800
X-Gm-Features: AWEUYZndLUQ3-Ja5MRaU3KyullgQr0rdTygpMSUSH9To-Lupoe-x8bvGN-ZuNjE
Message-ID: <CAHS8izNxi+Dc6mXPNaQSjtmz5YzmeA-Sn8JdMWLpYRomJdCWMA@mail.gmail.com>
Subject: Re: [PATCH net-next v3 0/6] Device memory TCP TX
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-kselftest@vger.kernel.org, 
	Donald Hunter <donald.hunter@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Neal Cardwell <ncardwell@google.com>, David Ahern <dsahern@kernel.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	sdf@fomichev.me, asml.silence@gmail.com, dw@davidwei.uk, 
	Jamal Hadi Salim <jhs@mojatatu.com>, Victor Nogueira <victor@mojatatu.com>, 
	Pedro Tammela <pctammela@mojatatu.com>, Samiullah Khawaja <skhawaja@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 4, 2025 at 6:08=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Mon,  3 Feb 2025 22:39:10 +0000 Mina Almasry wrote:
> > v3: https://patchwork.kernel.org/project/netdevbpf/list/?series=3D92940=
1&state=3D*
> > =3D=3D=3D
> >
> > RFC v2: https://patchwork.kernel.org/project/netdevbpf/list/?series=3D9=
20056&state=3D*
>
> nit: lore links are better
>

Will do.

> please stick to RFC until a driver implementation is ready and
> included

For the RX path proposals I kept the driver implementation out of the
series and linked to it in the cover letter. Just to confirm, is that
OK for this series as well?

--=20
Thanks,
Mina
