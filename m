Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3D423A566
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 20:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749675246; cv=none; b=tleujI8Vgfv28rXIMaP89sPYKMiKH8WZwLOkP2N0+fZg35YYQDIvSFolOts4GIFIhyIqNnRLVZ10faEcvPC1IvPcxCEpKWx6m4GNxrVNCdJMwla5fzjuBFAmkot7J+UL8TkEusMndLNA2EIvcE8xhaESWCOzrgLfwFBvUPJgRKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749675246; c=relaxed/simple;
	bh=AYq8n/v+tXT+VUaqslKMjVLnkmeNw2RH4xUUmbvnOTw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nIoLPUPYDLgmXwFz1coZkV2XeoDz3jTcd6zdW2jIm9sXzbgIFZ2ecPlunDZnPe1ek1SwwbfZocdNMThTaHQf1/+rjjXnToPig4ML06GjymjyRxc7l7fJJhdx1yF2rn8e1v/5ntz/utn6ZWNyeVUPs78d5pSN/8CTi7KIbLC0rj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O8SLhoe2; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O8SLhoe2"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2357c61cda7so13865ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 13:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749675244; x=1750280044; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+9ODZSh8S7aCPsxn2p/L7r5lbam9F8rTMEAJ1T+T72E=;
        b=O8SLhoe2xdpv1TU4IcPMtxP24QwZe9fL667FTUvmw2Rx6aF65AsfHenEAOX3DMeOl1
         CbysfEvve6rnPfDTFXzMENge1ywPBti1NOvNRMKWN7rlhSDlaxqa3CYc26H14XZAl3/h
         7CfOT9cqDOvXMVWaMk1beKr4vbbWdyK8Vy1Elzb7ShqnM4X7vB0g5DaWrsrsIPhzorY+
         +7YE1XQ86uMn8EAJS+po9NIpsfFIQgBMXKKChuGEHwwdAbQoUfwkhY5w61V7dYIbsL6n
         hxmkhYTPKm/JYH2rD95qJ/A3pedYP5LAf8Nt8UjbtlaDXJjHt7+TSXmzAF8sgwExkiOU
         9YVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749675244; x=1750280044;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+9ODZSh8S7aCPsxn2p/L7r5lbam9F8rTMEAJ1T+T72E=;
        b=VX8eqcHNWAcGz9waTqqdpqjVPcAt44a0k1Ucp3IzFbv5UC5JIC2cPK4Stbxv4bVbOJ
         xhSTFNy0rGl7oA6sQA/vRSPDj+tj+UFjkyuwsxP2Z3icBWrFFXEuKIdBV8d6iRa+41JP
         mh0IxpTo19WYTjh0yFVqOXc4nTCHiQCBlxf9Om1PfIGFUZfFUlxL+3l2/CL7362BpYgg
         IM7Pq752viBiahTG/mvVhf/aoQgTVaKPpUP7ZxCJvJ4xQcqDn4c+kqflAMQ2qGD4JdFC
         ufwv7emj4EqH1YzLCLSveHqg3bzRzAsuy2+zkQZvOYoXjdWVw3S2Loyzbq4tX7xiTTBk
         vS4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVluRVZZfffTLmTCGoteA02gwOGXg8HDTadOVnQvNpx/crz4cospr0icb9X4KxQp3s6WLbrw4DPHP3+ENQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEj8Ga8ixTPi2W3moKQQ3ysMbIMFzcd9d7o/VHeWck5xE10Gr1
	1FcsnIAj8Bbh/CfHJttE9EsFPfN9/5YCT6Umbr727HW6ucL6CggQDJ5J2TkJpCve30SVTpPx2tb
	FizHTIZAAtneMwChJREGkNoHDKo2Vo/Q+KYxsEKN5
X-Gm-Gg: ASbGncvrsz1hIaBCir2D3YiaPLh0wRmsckwsiajlz4hAV9kDZSdNoEfte5nrGsb3tSa
	/UylWnNFpirhayBLIE1ceVmIgQO9T+nwCHhSUz1xH7zQXfiFxT0g6bw1NJxz6uRoUEE2rzlz2xo
	8wusk7TrJoxBa980yeLtvARoQ+gIyzitqY/XYyZ+oL4F4vlcZSIQNcly0Ksp7lW2AjB2qrCG20
X-Google-Smtp-Source: AGHT+IGNxlwvOT/63E8WfH8fOvLo/kbNgZNIZ0H/0cRMTD73xz3o38k6hHpr4p4XXDFuDJGxNZhFeuEoTw2UanOyEww=
X-Received: by 2002:a17:903:4b03:b0:224:6c8:8d84 with SMTP id
 d9443c01a7336-2364dc4e0d5mr581215ad.4.1749675243498; Wed, 11 Jun 2025
 13:54:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609043225.77229-1-byungchul@sk.com> <20250609043225.77229-2-byungchul@sk.com>
 <20250609123255.18f14000@kernel.org>
In-Reply-To: <20250609123255.18f14000@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 11 Jun 2025 13:53:51 -0700
X-Gm-Features: AX0GCFs86j-gs5jhCZgm2IbPRLCZG610-Y9bqwTkXzjafc_yCgYbSIAlkglSp4o
Message-ID: <CAHS8izP2Y4FMfHyTU6u5NRT45raM9isXJZPY4LMC8c03dGUPJQ@mail.gmail.com>
Subject: Re: [PATCH net-next 1/9] netmem: introduce struct netmem_desc
 mirroring struct page
To: Jakub Kicinski <kuba@kernel.org>, David Howells <dhowells@redhat.com>
Cc: Byungchul Park <byungchul@sk.com>, willy@infradead.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, kernel_team@skhynix.com, 
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

On Mon, Jun 9, 2025 at 12:32=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Mon,  9 Jun 2025 13:32:17 +0900 Byungchul Park wrote:
> > To simplify struct page, the page pool members of struct page should be
> > moved to other, allowing these members to be removed from struct page.
> >
> > Introduce a network memory descriptor to store the members, struct
> > netmem_desc, and make it union'ed with the existing fields in struct
> > net_iov, allowing to organize the fields of struct net_iov.
>
> What's the intended relation between the types?
>
> netmem_ref exists to clearly indicate that memory may not be readable.
> Majority of memory we expect to allocate from page pool must be
> kernel-readable. What's the plan for reading the "single pointer"
> memory within the kernel?
>
> I think you're approaching this problem from the easiest and least
> relevant direction. Are you coordinating with David Howells?

FWIW I did point David to this work in a tangentially related thread:

https://lore.kernel.org/netdev/CAHS8izMMU8QZrvXRiDjqwsBg_34s+dhvSyrU7XGMBuP=
F6eWyTA@mail.gmail.com/

I think yes it would be good to get a reviewed-by or acked-by from
Matthew or David to show that this approach is in line with their
plans?

From my end I tried to review to:

1. Make sure the changes are compatible with net_iov/netmem_ref.
2. Make sure what's implemented here is in line with the memdesc
effort Matthew lists here[1]. In particular the netmem_desc struct
introduced here is very similar to the zpdesc and ptdesc structs
mentioned as an example in [1].

[1] https://kernelnewbies.org/MatthewWilcox/Memdescs/Path

--=20
Thanks,
Mina
