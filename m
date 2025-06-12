Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FA52D8DB9
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 19:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749754863; cv=none; b=g4fwyUGHm6tSUGCiGypdfbLcXj3NyNaZpXlmnugfMiX0z8WzLVcIkfsHk6PGbdNPdxI3mUk3l40NUhSEU2nF9GhwLgAPL+rSG2aOTxVJWNScVJeUe/37VijZieqIpIfjScF7eZmLWC89100K9w7eQ7r3NXp2OQ7kubDYnYmOHPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749754863; c=relaxed/simple;
	bh=ZwlMsaTHjZOtEXv/YqtnnEPbYBwwh6k+wD4c3F2kUr0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GZQFT0auXo0Awx8mK2T2fJasJiOZS5TI0hMaDi75uZNZvHMYGUlnwrIn5151WEkC3FbZu+hhLrnfZFFs+IuI/fQUz9LbCiTvcolskYsfWXglVgr8WB51Zmg1Rp9vpHzI/ysQx/+jQdFV9LKNJnrLwmgYteIW3pec9Kx3OwcJEqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A4L79eJ5; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A4L79eJ5"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-235e389599fso40365ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 12:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749754860; x=1750359660; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZwlMsaTHjZOtEXv/YqtnnEPbYBwwh6k+wD4c3F2kUr0=;
        b=A4L79eJ54S8X/R6hdBRCGJERy7H+zrEjPyMVVBDEq73jX4tDGzH3TXGyFFeViSYU5x
         IGzAXqwuH26ZZPVqh2BTD5c3EpOFjYyeo1I9HO28R5rcfjJlc2TAXXEdCVOvI8HMDWfp
         M7wJn59bo/R0KEjXzu89S81WRPMoZVOOhkc21AJp4jsxBc+Z1Ovope1S+Euh07I4obrz
         XE0AA8khB6StZ406/4PRkf1tmhWHpT5xPcwwyRiaVgrHj8YsHyvkoiansK9tWjlLAHxI
         FYIg/BMQu0jDDqJ66Tbft8Y7n2iHJ/TnY54dW18edX+W/DKljg8uhbbwI+IRKCUqSyD8
         Ja2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749754860; x=1750359660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZwlMsaTHjZOtEXv/YqtnnEPbYBwwh6k+wD4c3F2kUr0=;
        b=G040Fri07UWfLIS6jpnguV1WQq3o9obx0jKuIujm3nFemt5Y+DF5A3Yy2O+8GgLaQt
         0nv8tJqZpyzEbMtcHP29cNoc+rQP/9Q+kRTzd0mjer6JzkUIiLk8Wy8cI/4J5ReggQ1O
         7RxDfivz+Kjoteh5juj+jjyzc+4mvSIWsCsm98QD16A2YsMRGkI3XCrx47swWIhjsXgj
         8SSyUhtmcz4ILF3/zmk4aUTYZvjZCrbtSbaVuhe4yqScBMCx24bLD5t2uxoQc9h05mec
         SB71IWIYm9ApEMuE2VlQgBjzUfS363v/gxnNw+3hpe0fzYnlecqODk5cRDvDDzf3/F+I
         WxqA==
X-Forwarded-Encrypted: i=1; AJvYcCWMyJ61T4C9drZOJILIxlcg4CKpbCQj4QHbc3wgYTCW5pCayAlkhci859v12xH/kzuqhcOf6Vw2M5tiGu8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfrASuCTjDD37H0DvMTsVR5nTzB0D4y6UjEwYP1S+LRtNG/9y6
	cpAfQWgXILDxt6CrQWJLf7D4a//LN74aMd2s4LX2nM3KYPZ2WSAnoEXHORlo+mvpZ9kPT63W4l/
	MOYG77v4AW/TzGYXQPCCp0SxId9SRK+QYm5HNQLfOix85aDF1F6RCV3QA
X-Gm-Gg: ASbGncsGL7MgeZPQwxt3U7DTse4j4wN1yfT1KB86/wEFGOkHcC+m8BBpHS4FEMmqO+V
	bDYNCO1KBblf0RovLcU3ijWUT0Vyey7qX+/OcehW0tvmrc4zP/p9OqfvAByJ8ZUMuzdD5pn6Zgj
	P8LIbumpxCbO7URNzyymn3WrT7sQlOAug4EI5GpaKfAh3QqioXdXZDxxwY4ND4RTeXPeab88fcw
	w==
X-Google-Smtp-Source: AGHT+IF+DrhTdw1EVP33Lsxs8pEmeKyxPiFeWCjxcFQq5i+dtpZuy+WTSh+WvsQ3zeAWf1tAffKMVahMPLgaOisNCFA=
X-Received: by 2002:a17:902:d54a:b0:235:e1d6:5339 with SMTP id
 d9443c01a7336-2365e950001mr97625ad.26.1749754859927; Thu, 12 Jun 2025
 12:00:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612154648.1161201-1-mbloch@nvidia.com> <20250612154648.1161201-4-mbloch@nvidia.com>
In-Reply-To: <20250612154648.1161201-4-mbloch@nvidia.com>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 12 Jun 2025 12:00:45 -0700
X-Gm-Features: AX0GCFs8bIh3dxPetT87B5xeJSISXmwVqrXxvRLSdCTJ2AOZNbM701RU8f8TtdA
Message-ID: <CAHS8izNe_g9o92C0RbOe6vtbSfBMbJJJc4K1HubpozN4xwrcuA@mail.gmail.com>
Subject: Re: [PATCH net-next v5 03/12] page_pool: Add page_pool_dev_alloc_netmems
 helper
To: Mark Bloch <mbloch@nvidia.com>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>, saeedm@nvidia.com, 
	gal@nvidia.com, leonro@nvidia.com, tariqt@nvidia.com, 
	Leon Romanovsky <leon@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Richard Cochran <richardcochran@gmail.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, netdev@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	Dragos Tatulea <dtatulea@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 8:52=E2=80=AFAM Mark Bloch <mbloch@nvidia.com> wrot=
e:
>
> From: Dragos Tatulea <dtatulea@nvidia.com>
>
> This is the netmem counterpart of page_pool_dev_alloc_pages() which
> uses the default GFP flags for RX.
>
> Signed-off-by: Dragos Tatulea <dtatulea@nvidia.com>
> Signed-off-by: Mark Bloch <mbloch@nvidia.com>

Thank you!

Reviewed-by: Mina Almasry <almasrymina@google.com>

--=20
Thanks,
Mina
