Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EF112CDBE
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 03:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748402306; cv=none; b=hpZRXRZDlHLqSUrEy48oKB+P/VRY7F8qsj/FwkLDGAQwe2CCTZCfJwV401G9FrWKoz2bSm9VsbL6cf7n5Y/cmPtwBSBPimdsfbIQ95Bcw/0QLRlXun595vnGQiWte1lEDfFSXcHVAE4sBKrJkWlYwvxB+t9H3sTKI4enSAXS3MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748402306; c=relaxed/simple;
	bh=p0o8H/ZWP5ajJApvc49pdLseFqRSuUwEFayifU1/9TM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q9ahh/RZleg5CMxdxKdIPKLKS2K3CEkWnKOs27gcFP3HxVk57T0wDHi1YvQuYfqDUHrY+z6TvyLn2ZHLymd2pKFeJpFMMi7us9O3fRM0rOxwMr25kro8Q9L6Pk8xWrq7aXi6zujDGkz8sSbLKBLDG7Q2p0zfpykcv2v1nrlT+4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xFZ7x+ue; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xFZ7x+ue"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2349068ebc7so134945ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 20:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748402304; x=1749007104; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p0o8H/ZWP5ajJApvc49pdLseFqRSuUwEFayifU1/9TM=;
        b=xFZ7x+uen24P4ZojJyJX0jgpi8lonQi6MVbcGYpkKXqXdiK8kFJW/+aGMdVAq/PAIB
         m7A8Rio2Rmkc5Ek4Oia+B/ST52OT5+FoTxjsVvxUqx/76r2K7D4g64Mszm3txZj7XQPV
         O7qLQLyZYgzAaUG5nVTYK+NVYuxPoP95xcGGyp5OUg7DTLPPPTK/MquRfG93T3ffD/B/
         PpdLXU6EZZizv+FaYUHKH/MCpNLMZFJapTUJVpGkHBld9fdCUSztexbTXClG/LhFHPBF
         NwWrYEvLyWQIlJ96NEP1hqgfwwwZWE5tG+9OXXTqBLvnFbJ1TXjqDGpVSOZK6cBgGnek
         U8DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748402304; x=1749007104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p0o8H/ZWP5ajJApvc49pdLseFqRSuUwEFayifU1/9TM=;
        b=VDfl5ifZhBjtDZ6d7FOAPFcENstdWRDPersDl9vROMr6+MgiNVaz2B1xeqnB4nAc7s
         M8PU/IB8uZW0MUb+/acpT6AoLWGw0TE3KBu3ttymceqmtof0KdltOFGIeBgLdW6ITGrD
         SRs1QvZOHXUdzoH74yIvPOCgLPKdPtrlGaL0KTzqcmkQMRWLfx4dU0G3Xqp4UO2Zpgct
         ZfaGruzCOC0MoyJHeZHJN3LliQ4vf2xh2XVgXC0tiwqWHcfm0JNIq6Si+Y0yTMgVOp3X
         GVAo78GW1E+5lrNDjGKELHfx/+gkNwWylMMC8Dq0rYqHfAevlUeZ8iqQeBsS/GXyUYuO
         C+nQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgm1i6M2YGnlIhQYi+UubQRW9tYc91PtsGzM0a7jmG2dwntEqwMxeBuengfz2lpwL+daCBxdckufdLFwU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0hkiy6bEvZlhJH+n2jwL5Cc7HUq6fJHhIMkrqEIUpl6JTN5Z8
	K2VefXp86trLFgiSea/bUpmlhdroOkTtdgTSHSGTjyQS+nRMxSDVp6Nys/QWlcpMTKGFBn7bs/m
	xyw4w2Xc3p0VYS95YFqdsuCwehfJiT5PQxlPWKnqu
X-Gm-Gg: ASbGncsluYyVMihYK1yLgAMJdlbTh54vplNJD8Nv4KDsP+twnekWHmeiY7qxcE9oS/f
	a1pR59EmteGONRY8FP3wgK2ETSphYDFd8PQ2Cy5zs23q2ANe6wWq3lQ1frkkoVozgXwuFR49KWh
	Z0Kz/dm52LbX3MtFBzmwaFgn6Hr3F8yZwYwTXVxNC6HxpU
X-Google-Smtp-Source: AGHT+IHyBASOmSpQ6jrt38akPkcyDz5ZPwdAwA+jYpxd9Nbay9v2Ysdq8wuVjVilze9WFqafdNaHLI6g1ELAifk2Rao=
X-Received: by 2002:a17:902:e845:b0:231:ddc9:7b82 with SMTP id
 d9443c01a7336-234cbe2892cmr1015255ad.13.1748402298919; Tue, 27 May 2025
 20:18:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250523032609.16334-1-byungchul@sk.com> <20250523032609.16334-7-byungchul@sk.com>
In-Reply-To: <20250523032609.16334-7-byungchul@sk.com>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 27 May 2025 20:18:05 -0700
X-Gm-Features: AX0GCFs9-vI-xN4yFg2bdl4ceoAUrTj04uXSI8vFV9kuA2D-mWZq_A_MtCFBCAU
Message-ID: <CAHS8izO8fqvXV2_83MVLCxo5z7DepRVaPWS6rymqputuhcrk5A@mail.gmail.com>
Subject: Re: [PATCH 06/18] page_pool: rename page_pool_return_page() to page_pool_return_netmem()
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

On Thu, May 22, 2025 at 8:26=E2=80=AFPM Byungchul Park <byungchul@sk.com> w=
rote:
>
> Now that page_pool_return_page() is for returning netmem, not struct
> page, rename it to page_pool_return_netmem() to reflect what it does.
>
> Signed-off-by: Byungchul Park <byungchul@sk.com>

Reviewed-by: Mina Almasry <almasrymina@google.com>

--=20
Thanks,
Mina
