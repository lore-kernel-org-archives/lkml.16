Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A616538B
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 05:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749705470; cv=none; b=fDT+rlbYaC0VE8MZ9OxI3KZ6o92IRWzUBNPvVzcZkDdBq2RK5YYthUKzjgJK8Nekw8n757mjfPGA17adgrEstdJryhFI0YtOUU2GGnUQ3JRqywLUzZ+ArdmUvq/VUNIlb9o2XxsMvhIrqH0esUo4L1eSz1jAqWlj4qL4DLM0pzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749705470; c=relaxed/simple;
	bh=2SCdJ/+4doAXDA1dugfcerrihJYg32knCvs3SFTaAHM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lTlO07wFJcLgb3ztSCjFGxAzINaYXJsjvixe8WGuOhRJJ7dqyjSLPrjt7lFZwqMt35J+WAy5bLpIC7HCpGmDzMo41FnBAik/VyOOrlTE/Lz6L7Eyj//wEOD60oIjlr011Zm46u2evChLVY3i1CUOcPaqVyD/sFNdYh8fm/vc6aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l2+xx4lR; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l2+xx4lR"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2357c61cda7so63625ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 22:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749705468; x=1750310268; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2SCdJ/+4doAXDA1dugfcerrihJYg32knCvs3SFTaAHM=;
        b=l2+xx4lRk9VZdvj+XODaAdpfsmHoNTAQiuoBm+Vxve0ddmNB/2OTz8EJY4erV7FZGD
         6mhjNLpen8OIBrqasVtsOlcrBEVLpT/ZpMhjKJEZrINkvYjiRjvEKFcceRepBXWmUNEB
         kdpnArPcasSr1FwZG+zzD0Dp2hhxE3yzF9Gi4V1dRR9PwBuJRORakl5YBRPHWhPtz5bU
         /XBjGUoIuS+UdyiPkqG+8JolPkK8FQjKplfO1MMVLnJfJx7TtW9yTnBkt9bmFDlaXY/4
         szjqy6+2cZjkGPZ2rMDDgNYm4GVhYXJXKPpnIbPREaHqUiOgxlTy3OOjkd7NxYx9a5Z7
         o8Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749705468; x=1750310268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2SCdJ/+4doAXDA1dugfcerrihJYg32knCvs3SFTaAHM=;
        b=H8L6MYtVO8+hwz0CkIPTYi1kzcVuZWhtiIHcx9Z9l168EdKT7JJvY1UNN8D/Kwpwny
         0lshjPtRmbIomYAFdWrvtlcxlQ+PuxkHf1v9RRyVGdhqM5y/NeV6Y3RiUQtqsgQ9jBI1
         yzJ8uY4oTazzXOOzYix+THB3yI8T9aVtejCl42LFrIQrAU1DSHJG0hmrVwZuWrr69sEE
         dEAEdsA9bZQs2K56uS+CniRYyOYIu3lJH0U8JlujnfolUcpVjgTaEQXOSl7cg62VIxEF
         gQmcI8R7pz/S4sNo0uePPFMQw12yK/TJaR/ccVlBCSWo8Hl58NOiR3z3atQ1qC+SfiE9
         NABQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAoLu10ZVk8rsqaNKXzy09Eo/6nxpYS1N+nMvN5n23M/ybz0Zf/sdpSzSGEIyaf57ounHmkYwknpIOMPs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwH/mgD+nPb7fcAVjcwqhLsEExz9elbT7Ew77nfc2DbIRC0D4vV
	bmEK2wm8rb0oFaY3jERXfpgZMdzz3h/vJXTRF4bhWtEmxwLY49jF4dQGbIHnGqQOf0/t9lGIt7B
	SA9voJJfOLi/K8qAnKQjAiuaSx4s3Y14pvBzSOD/g
X-Gm-Gg: ASbGnctxu7t6mEn0bJeOnihxdN+MifGdU3XA/71UXSnlCWDJ8sEsQ4mM/dH+V17HGxj
	zjWR/+07FfUhOCD69wdXpL7lGK0uTufhyPcgmPuy9Irj/f2sOofSQWcP1JbBoJ1sHyrX2BJTy13
	kRcUL14BvJsnT5CPpelNF2QQEK1x5zSvkk9MqGGFTeqqS+
X-Google-Smtp-Source: AGHT+IGYP9KzkXjDzsA4+41CLW5Waykb3HixIBnHVes8taLU5EpIH0GQEyzbO+4zVc94uZKbBXgXshRqTVavOIadoX8=
X-Received: by 2002:a17:902:d2c6:b0:231:d0ef:e8fb with SMTP id
 d9443c01a7336-2364dc4e3b8mr1774665ad.10.1749705467691; Wed, 11 Jun 2025
 22:17:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610150950.1094376-1-mbloch@nvidia.com> <20250610150950.1094376-12-mbloch@nvidia.com>
In-Reply-To: <20250610150950.1094376-12-mbloch@nvidia.com>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 11 Jun 2025 22:17:34 -0700
X-Gm-Features: AX0GCFsQbpdJnxhJgwGMagCQgzHoP4omoeUSZWQdZ5DAkp2-7EHR6n8NXEpEZgY
Message-ID: <CAHS8izMOcAYzcseZqud5xj_3ibaWKBUqEARgJd65S0_Wqs6haw@mail.gmail.com>
Subject: Re: [PATCH net-next v4 11/11] net/mlx5e: Add TX support for netmems
To: Mark Bloch <mbloch@nvidia.com>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, saeedm@nvidia.com, gal@nvidia.com, 
	leonro@nvidia.com, tariqt@nvidia.com, Leon Romanovsky <leon@kernel.org>, 
	netdev@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dragos Tatulea <dtatulea@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 8:21=E2=80=AFAM Mark Bloch <mbloch@nvidia.com> wrot=
e:
>
> From: Dragos Tatulea <dtatulea@nvidia.com>
>
> Declare netmem TX support in netdev.
>
> As required, use the netmem aware dma unmapping APIs
> for unmapping netmems in tx completion path.
>
> Signed-off-by: Dragos Tatulea <dtatulea@nvidia.com>
> Reviewed-by: Tariq Toukan <tariqt@nvidia.com>
> Signed-off-by: Mark Bloch <mbloch@nvidia.com>

Reviewed-by: Mina Almasry <almasrymina@google.com>

--=20
Thanks,
Mina
