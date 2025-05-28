Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5284A1DDA09
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 03:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748402541; cv=none; b=IOBO9d9KgHw9cXl0MCIZkDZteLmFTcU1KL+ZMi6WD2vF+w5reJDNDeTuvVUkTVZgDPAEX/dBPomlkqohTd/l0LTfEqigHyLZsydrFhDEXvck9v8a9kh3z5EzxCGLyuofrwK86cmcNS3iQhcYYaJWWf4NH+Y3290Yi4anGHjPcRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748402541; c=relaxed/simple;
	bh=TlL6ea7agKcozcBW85BEZTQlNOOs8G4N0oj9OW3+jEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sidb3DnkN72C13+LRViZbxiWzi/3ww3+fj58WVcQDPPlZVdBGAPEfWZUaEeZQXcFpmmCjZXkKnPvW5wugtFtba3GIyybsWYRt+0gA6hdPreXc3lp/61oNc0hURm2/OjeV04cXxWH7uHQpoagLdKQ2CfCIEdLxUPrlHySgqJFGqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iWx9Ie6A; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iWx9Ie6A"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2349068ebc7so135585ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 20:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748402538; x=1749007338; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TlL6ea7agKcozcBW85BEZTQlNOOs8G4N0oj9OW3+jEw=;
        b=iWx9Ie6AAtxQaXvZupLegK0Od2jG4TBVJ2TZV8Va+YXZwev52fTAueV172U0+04hSy
         jWoX9qLmbwg1RU4v4e/I9qbtOYzxc3Yb16vuI/zeBoVdK7GjIghsofIkVcjgm+bSziPq
         8h/wddHbUu00eW0KBYY3W5GExQcFQNze/XqRanOe1t/ffe8mYMyqdQwmuuHxWFAFUu+9
         V4+vWjErzGKfKG6LlxFfEH8YTwt0IUyT5K0i0La0gi5O4EOc4RcXox+3vgrYObcOLIuQ
         1Es23UHs0cyJkaNTJKRv5nij28d04+PxsRxjDIAY38EZ5gosItgvCU34aMtD9NEFHUqa
         UHBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748402538; x=1749007338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TlL6ea7agKcozcBW85BEZTQlNOOs8G4N0oj9OW3+jEw=;
        b=H9jwqiIBTQGGt9mG2JMRYoq33YpAfPWEAcre0IFWyrDFZEXi7ce8/Y2SsSOzunVmYr
         mh4FU9khsKpkxuwSGhO7VG6/mZUJeHqnkbWM3AEEjwj2u9ve9rJg3MF3m9MNfhdV5J/8
         uPS1toadBesBNhkf3wYkOgFxg8xSftlFk4DJe/dhj9/18V4Wa1nH2ksXeaytd90UZVvp
         Y5daf42RRtELlPFbO9PxJF4LEAwZBs+oGV9vuiuA1f0LMpOvGvinXbEDyKmq5y+RNm56
         8CFhE5JCyL7HyGSoGo/6u8D5M7H5FszHYbHeRm//8XjSep9bCSEm6i7F3b/+aLEoopGj
         8OmA==
X-Forwarded-Encrypted: i=1; AJvYcCXOGo8rmmBqFUf5b6FZSjdUWonhYT/Iv5hc1Vjzr/JHAcFxLi5sZKOTVjuiMM0Vb56JGvAy2nYUJYRuLSw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw9ZS559s6MvDLtsKx2akO708Rz5MNJGliPmj4aCGYGKCKk5Tg
	Qroe4RktiRyQ1ugTWh+plMnR5kxE5gtEuuF0AIrBEh4XSlKYSTY+/BWEEW2O7ouoGiBnu5znPwG
	M/S19WScSetLgdsvbgYGT7r8kzXZjsIkxEuhoC4K9
X-Gm-Gg: ASbGncuQT+0rwqG4/Mt7ic0wxv4AREu1lc3uPRPd2jRqtN2DKrbIqfuSbaTgtDRkc6k
	zbjpS3SptI0NJxzrbvAJDRrst25LBPP+g0Lo7vI6OLW0R7I1N2GfSwJgco1gv3iosRl/EdJAlQP
	DKGAnMhqKDanffX94k1Yq3+oBhDnxUSVzPBEWCbhskU7FK
X-Google-Smtp-Source: AGHT+IFjWMsFjxHEWSd8svaJEVsREhu8uWRJJnik1FgFnC7f0wirbtl0vmRI9Jco+Bo3khu2tiMHY3Xc/icJ/DCXCgg=
X-Received: by 2002:a17:902:d48b:b0:215:9ab0:402 with SMTP id
 d9443c01a7336-234c55ab922mr1985015ad.18.1748402538236; Tue, 27 May 2025
 20:22:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528022911.73453-1-byungchul@sk.com> <20250528022911.73453-10-byungchul@sk.com>
In-Reply-To: <20250528022911.73453-10-byungchul@sk.com>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 27 May 2025 20:22:05 -0700
X-Gm-Features: AX0GCFtRcX_EC4PBnTs2d4ZNLeICGbCHPwkYh58-YwsRhc80hGZv7-czylYZ2vw
Message-ID: <CAHS8izP2f8oLFRZ=_NC=W3Ky9fqXJpszNNAiXN_CBYADfz4UwA@mail.gmail.com>
Subject: Re: [PATCH v2 09/16] page_pool: rename __page_pool_put_page() to __page_pool_put_netmem()
To: Byungchul Park <byungchul@sk.com>
Cc: willy@infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, kernel_team@skhynix.com, kuba@kernel.org, 
	ilias.apalodimas@linaro.org, harry.yoo@oracle.com, hawk@kernel.org, 
	akpm@linux-foundation.org, davem@davemloft.net, john.fastabend@gmail.com, 
	andrew+netdev@lunn.ch, asml.silence@gmail.com, toke@redhat.com, 
	tariqt@nvidia.com, edumazet@google.com, pabeni@redhat.com, saeedm@nvidia.com, 
	leon@kernel.org, ast@kernel.org, daniel@iogearbox.net, david@redhat.com, 
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, horms@kernel.org, 
	linux-rdma@vger.kernel.org, bpf@vger.kernel.org, vishal.moola@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 7:29=E2=80=AFPM Byungchul Park <byungchul@sk.com> w=
rote:
>
> Now that __page_pool_put_page() puts netmem, not struct page, rename it
> to __page_pool_put_netmem() to reflect what it does.
>
> Signed-off-by: Byungchul Park <byungchul@sk.com>

Reviewed-by: Mina Almasry <almasrymina@google.com>

--=20
Thanks,
Mina
