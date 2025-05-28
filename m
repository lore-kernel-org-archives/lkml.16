Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003361DE8A3
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 03:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748402177; cv=none; b=txfLGEPNAlTwzx3SLj2H7J0SdFLhP5jutNa/18tBx1Zj7QsCNkhMRmYhAsgPwzPuVIh/ZBtYHFg1j0oFZTW7p8r776fZ5/YK1ylofjqg/HLvOhT7AN+qqXBIg6QgFeyW2Bmz40iWNr0IHUc3pURGiuot/zNHy2WUj9VC+YnMF9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748402177; c=relaxed/simple;
	bh=0bdtpndwZMuDSr/xS0AhTKAcuII2GsnyUAe5k1Utuqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V8DWry4IN8p0BAzqzTD2rQ9G5patx+yucH1y5I5P2dGaG7oYPiJa1lQiIT1Nk88qO8t3GZQPmL05yA7hett7Cw+w9nWlGvdkEInLw50cstdhYmzZSuGO137g6sD0m1Vf/gTF+ZpYBRnPj4MT6NWOA99sWxFi2Gw0GHv2/9T3QYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pnbfP11N; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pnbfP11N"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-231ba6da557so80715ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 20:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748402175; x=1749006975; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0bdtpndwZMuDSr/xS0AhTKAcuII2GsnyUAe5k1Utuqo=;
        b=pnbfP11NPQBkIarbw0bv5nZdtf5tIu1Hgy9LFF0tcTIG4Ddky2BuBRbmRqjkggpzNU
         X9LoRi4J2pJRQy6Ymj83eBvcdEh1fLI9xel3M1d/KdIBEqWJFeccOP3vL+MpStwgEEjj
         rWq1uI2CwKoKD0IalwGeIBuhFot4jgq9qVu7N4sYrfUwcNKtC229un9ocw9diQqyAdz3
         qriyP0oPIPu5tyLSGxtrLxosl3mybzLMSWP5Ba19qAb63I8+nRc4X27ztH3ZRDYndCcR
         qLhN4RMDMepzE0JGVqEfXZ1gPJ5ZUtN9TxHAPbNFXtx4+/VK2ATOqK3xD+2fb3dt9XxN
         eumw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748402175; x=1749006975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0bdtpndwZMuDSr/xS0AhTKAcuII2GsnyUAe5k1Utuqo=;
        b=kr3rUjMS2LQwQa0yk406tII9cutRLkzSQiQMIP3XA1Kz88BxtNN+eSIGnqa7wh035C
         jINMKkNmJ+OrEmnS9X5s1mM7BDfXrUzQVsBXBC6Pfse/BLsm4ZBo9CqraSUjwvHlPKoC
         up4NCL9wgiIRN8Jm+cVVdiATZnnvSZbcbnXIlh5Z6OhmvuvtNyaMf5AguZDCO1VTvMRY
         2wjQ/v95Hj5sKOGiBj9lafqejt96IJK69mEOv5md2lpCZzVgX5kLN4L45u2BZzkhOBap
         ru6G68dwu3p4oK2yNjGnj1BixVxnh7oZt5dNz3JWDAjHRK3MObd6hqD6byXzVUdygZ3V
         rzyg==
X-Forwarded-Encrypted: i=1; AJvYcCVDj77QGnrfBg0WT9iP/CDEp7WmfLQj/VqlPj4035CCZowAbdScEskXu/d15jmsJ8Fp7ZPs25ArtZb3+Ls=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfmcMxpRZnNIZItp/rZVoR5Hp1L0W7RJdSRo+WCb7jyeUJwJR7
	ltXKhlyrTVSyVx9U1AyudVo9dNJTXpqop8CJaO8EY0ZudXgXZfnnRbBFkXiuAb6djOk1uce9+gT
	4Tw1xXCvVk3RBj3mao9TS93MRK4ux5NyXpLEa/Gad
X-Gm-Gg: ASbGncvxqXsxutt2B6lvfWiums9vPpGbxVVt0EFMgA9u31ZqdIfNnvFiFRpLk6Vr7tI
	ydrCdKVClGT/D91EXrkvSKMnmDk3jK9+8fwhaZ+LUbGcVYTehCgxguV2bAKZk8N/66WmU3cbrZ8
	YZM+wO2/OcXGjnKVMOb1b73vPFlT8pFalMD/E+oYxMULCH
X-Google-Smtp-Source: AGHT+IFWlfqtKFHMBOLGn7Z83pzgLQUiE0GOnbpIGbNfU5pFgYiUQrcsYOaQ/uMIysvwNUJIuaG+fK9N/GeYGeIrPqk=
X-Received: by 2002:a17:903:98c:b0:216:4d90:47af with SMTP id
 d9443c01a7336-234cbe69a15mr1091405ad.29.1748402174833; Tue, 27 May 2025
 20:16:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528022911.73453-1-byungchul@sk.com> <20250528022911.73453-5-byungchul@sk.com>
In-Reply-To: <20250528022911.73453-5-byungchul@sk.com>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 27 May 2025 20:16:00 -0700
X-Gm-Features: AX0GCFumg6JlJqGa53nVXK2u3d4-rG_n2DPcLF5XB4A7_ranyMV2_0D-3YxOvnY
Message-ID: <CAHS8izMWhQsGuf4vFzU-LwViR5M0a2J3=H8Uuwn27ju4uZC6NA@mail.gmail.com>
Subject: Re: [PATCH v2 04/16] page_pool: rename __page_pool_alloc_page_order()
 to __page_pool_alloc_large_netmem()
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
> Now that __page_pool_alloc_page_order() uses netmem alloc/put APIs, not
> page alloc/put APIs, rename it to __page_pool_alloc_large_netmem() to
> reflect what it does.
>
> Signed-off-by: Byungchul Park <byungchul@sk.com>

I suggest squashing this to the previous patch that modifies
__page_pool_alloc_page_order to make the patch series smaller.

Also __page_pool_alloc_netmem_order may be a better name.

But either way,

Reviewed-by: Mina Almasry <almasrymina@google.com>

--=20
Thanks,
Mina
