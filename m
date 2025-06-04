Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9BD1DE89A
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 17:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749056593; cv=none; b=lMYB9FFHiOuixRmZv73wgkKzF61i95YaFaL5P5hMnf5GTEzVc8Nw1fQNrHBW9+4ganmESzhgF17UyzGiZCEZDXPaDWeBQXyjmoa5FQxVYP/6+ZdgOMIZx4NjgkMn+fuMcQvnY6HHDrTLenbDBsZ+mXGSRAiLZGFCSTk4v6Y9AoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749056593; c=relaxed/simple;
	bh=BdQGqhIQcXP7dsPfNkEdiTmcnCKK5h488sLxxJBhbs8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=E1VdNUFM0cUS70UaOwn9SsS8S2btP9sdO+hZvhIYbAteVhdNLaxErCBAAdA4wiT/74Zz8XfABrLlPdcsynRkZ1QbU0CijGoNRBk1e1WEMgl8uxpM1ONM7BDBMChaHEfLeclebcALlKZUEZQZaT2ssTJtKgsaa48UjzSpvW3TZPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bZYb064A; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bZYb064A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749056590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BdQGqhIQcXP7dsPfNkEdiTmcnCKK5h488sLxxJBhbs8=;
	b=bZYb064AIfM12bdCj9RULmkW9iAlNjAsLOF2aDGIvUCuH30evdbx+lorwPqFVIRr8QCTIa
	Gk2i0gCHK6e8QllwElUNJQMgBeo3chtAOZnAr1dkB9AbpK6qjN9TxjjK310YDNikdWzvqi
	Gyx9livvBH0YsmrgUhq5y0zc4oJtxJo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-679-Aifg1KTdNmeMr7NbxNRdWg-1; Wed, 04 Jun 2025 13:03:09 -0400
X-MC-Unique: Aifg1KTdNmeMr7NbxNRdWg-1
X-Mimecast-MFC-AGG-ID: Aifg1KTdNmeMr7NbxNRdWg_1749056588
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ac6ce5fe9bfso4268766b.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 10:03:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749056588; x=1749661388;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BdQGqhIQcXP7dsPfNkEdiTmcnCKK5h488sLxxJBhbs8=;
        b=iU2V8Jf8NTi0CB6iQkPzS+VGws26bwZTfpSHFSri7PL5A3pfjays+CrFCoLZpWKwYw
         XifUbrvRYoGJjMFo9FNKnlPcIeOybnz2oUpSZovLWZEQt1us/xzzNYWbnSJ2GdYNUUd1
         M0X488RF9et73wVFj0vFLccdjRRTE4pvEpd0AS2/ho4cPXIZiyCdHPXayeASBP17MXc1
         gHuEh3YZ2DFW34xsbBIarKawrXw3JOqzF3ZeqCFW0CRt9zY58bIcprumEM2OfOujYOMf
         LXhU5kh1rYZd9Uxj5pmbFa/092qqu+TZ/tfxB/7iq8hLtFxLMex3qv1jugqWPwZ7j9Wk
         /P8g==
X-Gm-Message-State: AOJu0YxSV0Dnr6sRMzsNZnTyHznjxs/sTI1lmQMe80n26CmaioHKGLoO
	Diw2Hz1Kj7LR7cIsQ7k7XaNi1X54l0gOSGOFC1+2oFWRarvOKA3SU0XchQVhcsrexczd8D4FjAC
	rN3mckauLWKJpXTdfhCfJafgBSMmML95qQYTebRv8DMLVIZrWTeH+IkagkmR3w6LGVA==
X-Gm-Gg: ASbGnct9wGWOxW0aUJyNl2uwl78Uo42E9b/DZvVlX2tr+6mUV2+hH1emoEXQEL7f7mZ
	tIyKRBjncIxEg36inNMngT9GIUaWmG3IiaHpQpskZeCJJQF8Y3Qeq9mSj/SsRfIjvwj4LHGYgDg
	ujIdUnSEn+igGR5Eafjk9vcH5H+yw182ZxrybTjesQlAZxrINg9Om7Ga30tnjo6vfXjyeHGTd2h
	PsBxk9dZHfQzhrKHBJNgpaqA0c1AZZ9pNFaqxtSy2V9+0sBZfFg576Y++BGuCpLQBD/8BPlx5E6
	V5A41kSq
X-Received: by 2002:a17:907:3fa6:b0:ad8:8c09:a51a with SMTP id a640c23a62f3a-addf8c30aefmr329525966b.4.1749056587554;
        Wed, 04 Jun 2025 10:03:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEts9xRj/XK3SRKIWyfVZvu6UAgFyS0hpnI7mT5nnKFo1hg8wg/AtXBkeW4IXe7ZmieN8tHNQ==
X-Received: by 2002:a17:907:3fa6:b0:ad8:8c09:a51a with SMTP id a640c23a62f3a-addf8c30aefmr329518466b.4.1749056587038;
        Wed, 04 Jun 2025 10:03:07 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5dd045edsm1116783966b.119.2025.06.04.10.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 10:03:06 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id C8F371AA9171; Wed, 04 Jun 2025 19:03:05 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Byungchul Park <byungchul@sk.com>, willy@infradead.org,
 netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 kernel_team@skhynix.com, kuba@kernel.org, almasrymina@google.com,
 ilias.apalodimas@linaro.org, harry.yoo@oracle.com, hawk@kernel.org,
 akpm@linux-foundation.org, davem@davemloft.net, john.fastabend@gmail.com,
 andrew+netdev@lunn.ch, asml.silence@gmail.com, tariqt@nvidia.com,
 edumazet@google.com, pabeni@redhat.com, saeedm@nvidia.com,
 leon@kernel.org, ast@kernel.org, daniel@iogearbox.net, david@redhat.com,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, horms@kernel.org,
 linux-rdma@vger.kernel.org, bpf@vger.kernel.org, vishal.moola@gmail.com
Subject: Re: [RFC v4 06/18] page_pool: rename page_pool_return_page() to
 page_pool_return_netmem()
In-Reply-To: <20250604025246.61616-7-byungchul@sk.com>
References: <20250604025246.61616-1-byungchul@sk.com>
 <20250604025246.61616-7-byungchul@sk.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Wed, 04 Jun 2025 19:03:05 +0200
Message-ID: <878qm7v3qu.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Byungchul Park <byungchul@sk.com> writes:

> Now that page_pool_return_page() is for returning netmem, not struct
> page, rename it to page_pool_return_netmem() to reflect what it does.
>
> Signed-off-by: Byungchul Park <byungchul@sk.com>
> Reviewed-by: Mina Almasry <almasrymina@google.com>

Reviewed-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>

