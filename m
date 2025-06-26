Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F982EB5A6
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 17:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750959825; cv=none; b=ZwPU5AQGYuKJzeCIPbTw+DFHSRds0Kek1R1KClg4abFhY1q/IzshyccD9yrwFXGdAquCcwIn3bv6HAx9uqqGkrQWsNmANsTn0uL5caawpUSc2HCMdMt6btFfyPnZU5IH9lp+B3Vqmq1nQ0NXdGfQ04YvugkbRh3g6QLspJzrEpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750959825; c=relaxed/simple;
	bh=wzwuJqhyKPA6pFtaKqL29WQiBrCe4P+CAFqirUycMO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ca+kBfIo74DOyg7xmFiRiBb6aHT35t8zMvNTY3WBHAZPBE49kpXSSoyyCzhzXE9stIvD3/r5ZOUJv+q2dMND4LzkoKdFLBAQBttO+Jrw/kJMkx77WhTm7vBC6hRDfpvUKxkE2Mjr+I30nEeUIfq3m9+jBlq497ssK+yy5W9+8BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uRrzxsZG; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uRrzxsZG"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6facc3b9559so19246226d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 10:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750959823; x=1751564623; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wzwuJqhyKPA6pFtaKqL29WQiBrCe4P+CAFqirUycMO4=;
        b=uRrzxsZG44G6eDnDIhl0c8BBQFpP+FPrPF7DTbhiUZRh/b4LXNOFAHXQav1PkJByrK
         qSTAP+IOM7gZP1/GDF+v194ozXfpnRIHmNItppCvJJ0AHYuO6jeZy0t4sjl7VlJ0A9cK
         w1Ds+40PB2CNyYoPyPaMYkZCFp+WOG/zEpOLM1/ZP+BTXEHwKafrArBUg7+T1dZ2jN/d
         eq5s3CMK6cocfL79zK3G1tnFenNtyr5Yl9LTZj2+6PGp3TlkUwsFN+RYZ4J5deFWY8GA
         oBEBua9ZKaiWqSbHQYmi8Ncr8S+8IS8bZeOHviN2iLFt1wIKtH0Ae5oh22CK9f3IYgwK
         8Hnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750959823; x=1751564623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wzwuJqhyKPA6pFtaKqL29WQiBrCe4P+CAFqirUycMO4=;
        b=edLWrNaovenvdn/InON1MeFnucN0WnCIzDOhLKSNuhcJlgFV1AK9g+kWcQNJC89TXp
         Anc2glONb1QlrNAtMsE0RpXL2IgAx/jKV9tTCKzBbnpsjLcyQETzVUpWE/L+VQSPilM0
         NcdMxBqn4v0wKubtPec0ElHY9DxCNZlKA3+GqRD5xodTBGBTvIFplcKSOEnrELH7rjs6
         SXe8EiNGLTBsLx6HCTqT81bHPMVhZ17C/q37b7WXiwa8+Lhqhi3OICDaR7X3SvlvP5D5
         d2mab13snU/6CLhegzRWo+b8vSOLnyCGKPK9OHTVdkwJH+/Z9CLGBY2cJCGbZbOtsXPp
         DgFw==
X-Forwarded-Encrypted: i=1; AJvYcCXEGeHKP2nVbNDcErHe5JGqyuW261mkgd6h3FyPkqoDdD9Iyeip5vuUwC9ZppSGk6a1fod9CkyEfiYKkVU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxA6DTfDZinS3x3kha6Wp7t5nZiNlx970pG55NvUrGmOgP9tR+A
	/Rnzo0qM/22ccU84D4kKhNtVZ+IgyJfztMiN0l40i+2eRwDfFYXp6xTh2t+fvAwVRpqmq7bRV/9
	BgdaocjiWnL1tTfxIAiRUd8vheaKWlegrVe1Mr0/z
X-Gm-Gg: ASbGnct107eEtGT6sFCtIdfzLyOauYGMzHj2N0j50kXRYnV4flMipH4O1YqcXzs2CxR
	ZFo4CkeZP391EFVo4Oq7uK92m3mXle0wktDXHDliXlPv+5pZNxLpw2PeQ668M9d3PC6Pl9DsuSd
	ngerhHkvbLfnixsDhH76dI8a9b0X5yKWNo4KR+KBlrrxR/sAHGgz0sKbq4RF7rsmBgPT0/3yAQU
	g==
X-Google-Smtp-Source: AGHT+IGdh/IJuNTnlJ5wP1tLYohn6WiFRhrAxLVoOATEeK6niUOWXM6UN14DbuitTFowPzRbNWX5WutFoxjvCZRzqB8=
X-Received: by 2002:a05:6214:2aa1:b0:6fb:5f1d:bf8c with SMTP id
 6a1803df08f44-6fffdcff5c9mr6100526d6.11.1750959822639; Thu, 26 Jun 2025
 10:43:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1750854543.git.leon@kernel.org> <cabe5b75fe1201baa6ecd209546c1f0913fc02ef.1750854543.git.leon@kernel.org>
In-Reply-To: <cabe5b75fe1201baa6ecd209546c1f0913fc02ef.1750854543.git.leon@kernel.org>
From: Alexander Potapenko <glider@google.com>
Date: Thu, 26 Jun 2025 19:43:06 +0200
X-Gm-Features: Ac12FXyaDZROOxurpvkcs9ZXthsb5DglqUebhn0NTWwPhDYnIEGQjkQ7oqhUUFw
Message-ID: <CAG_fn=XWP-rpV-D2nV-a3wMbzqLn2T-43tyGnoS2AhVGU8oZMw@mail.gmail.com>
Subject: Re: [PATCH 5/8] kmsan: convert kmsan_handle_dma to use physical addresses
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Leon Romanovsky <leonro@nvidia.com>, 
	Christoph Hellwig <hch@lst.de>, Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	=?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	iommu@lists.linux.dev, virtualization@lists.linux.dev, 
	kasan-dev@googlegroups.com, linux-trace-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 3:19=E2=80=AFPM Leon Romanovsky <leon@kernel.org> w=
rote:
>
> From: Leon Romanovsky <leonro@nvidia.com>

Hi Leon,

>
> Convert the KMSAN DMA handling function from page-based to physical
> address-based interface.
>
> The refactoring renames kmsan_handle_dma() parameters from accepting
> (struct page *page, size_t offset, size_t size) to (phys_addr_t phys,
> size_t size).

Could you please elaborate a bit why this is needed? Are you fixing
some particular issue?

> A PFN_VALID check is added to prevent KMSAN operations
> on non-page memory, preventing from non struct page backed address,
>
> As part of this change, support for highmem addresses is implemented
> using kmap_local_page() to handle both lowmem and highmem regions
> properly. All callers throughout the codebase are updated to use the
> new phys_addr_t based interface.

KMSAN only works on 64-bit systems, do we actually have highmem on any of t=
hese?
