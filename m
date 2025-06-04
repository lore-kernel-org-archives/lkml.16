Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DDA1EF37C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 16:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749056153; cv=none; b=eA7CQ8Wu/1iZNyWn0LJ85LcCz4Js3cAEtUnYDPMegxu2bqr7CAriY/FX+SE4g90ijI071cGEHbv/NNwDMRhp0bAn9/6qNtJvyUwXBWf0HVXbLIIaRwjowHMPifJvKlwXm8L51vyi1q1/19rvRAOw2b/tIyrsHcCXHzkoan+9YqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749056153; c=relaxed/simple;
	bh=8Sw6ZrIatdp9zV8VYnA2N077NI0xfChsEjWe7K4eQws=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NVPU2jNHHSq0KbHKC+SGRDc1m40zhgvCs+7cBudDoao1akuUWp766tnHef57T/YcXqv+URfiVK86USuo/n9J80YjbE3Kdd56qSRg0kQgVnTxqJVcBFNvBHQsVsmxMQ8en5huKMjvgsje28Nf0ZzUFIyi1lTeienPT6eSh56TPNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bj4rCBMa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bj4rCBMa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749056150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8Sw6ZrIatdp9zV8VYnA2N077NI0xfChsEjWe7K4eQws=;
	b=bj4rCBMahxrglJlQwhFjCbyHi7++XPXL15t3/hPuGy4AuNiDw7QafJ1izFDKdxAp3znrhD
	K4r+txjXX5xmrkBy5rWaxSeREy9tbsJY2cVoMjE3stnXnYAtPUwI0tdoz1oXK5LSew8OzE
	rOoq63oNzPfp1G57N/2ibKFz6PgAcCQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-387-s_0IADkQOQebjUXXEERAyw-1; Wed, 04 Jun 2025 12:55:49 -0400
X-MC-Unique: s_0IADkQOQebjUXXEERAyw-1
X-Mimecast-MFC-AGG-ID: s_0IADkQOQebjUXXEERAyw_1749056148
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ad88ede92e2so2136366b.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 09:55:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749056148; x=1749660948;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Sw6ZrIatdp9zV8VYnA2N077NI0xfChsEjWe7K4eQws=;
        b=KLfWRVGWr1dr7qdR9XUfTviM4Aj8S8p/LRxPtcBiv19yMsdiQ5cQ6fwvykh83a7lIJ
         yyfxHZ9WLc2xt60umxrhMwl5xcScaMHd8FvoLEfw2tGM0ozBbypa0EFAXkfCU4yLtB0M
         z/04Z0JZBByVOSGjXE0OyrblTm1Joj8RB6xyeKRyul+t1ObEg0PDW0VcY8/kCiC6EsBg
         g1XuVYxJz8hstsm1FrIv9IOGXxtqKUYB+v21LP5r0gyByy4MM6632UXCGaVAgvEEyq9h
         en/Ml/+2NMIOlMZGmPEHOG4Q2ltOqphqrlefO+uUpKFg8UAlBrGWbdmOcqPWY8N5Cixe
         a9Eg==
X-Gm-Message-State: AOJu0Yx4A23zQXHY2O+VZsROFPsUcllX5022jRgUI7Mp8UhSD7JGzJzM
	p+sIWVXllDEbVzCjaEKwLG69vqGm5iXrNCZgETuOYzpirkobAc46k3o5GEvZZTfVlA3cKU+GpBo
	IGaqKq7q/togGl+slyXbXFwxBfgHk+WOvF8SoL99gAO8rJmuyDzrmXUw+gtRqJM2L3A==
X-Gm-Gg: ASbGncutpvocJa+bozpj+cK/Ev8qXaqfQW7j/2tdU1gVQh/CAE96qkYbNsiaSKLk/9L
	EPz9kYHXXQnIuiD92roDwQImTTY2pFtv4h66d7q4ZIiQtSfjn3kzkPPGuNURkCCVgm7It/yAb5s
	bqLgcSFhDHU0UExHMgmoS2wt+3X5aA5Sc79ip+q+G+fCn9S7Ea1y8bHfmAoJh6/4VSoM33QpwdT
	+4jkJH440mSig3RhUxxMjHZrZZVrA+2fk+GiuARCMg+PaLELLluQkAQSGnfYM/sXVj7gBswkBMC
	4r+HFy7u0F4dcxgmOyv5GEEBIf97MFgTQz0F
X-Received: by 2002:a17:907:6e9e:b0:ad2:4fb7:6cd7 with SMTP id a640c23a62f3a-addf8c99908mr343451766b.2.1749056147782;
        Wed, 04 Jun 2025 09:55:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYPG/Bjmaa00gr70znOgvLxuMNOHBq9tzeMq8cTFVTOyJdUQkjk6QowoSWQ/jATpsw4qluaQ==
X-Received: by 2002:a17:907:6e9e:b0:ad2:4fb7:6cd7 with SMTP id a640c23a62f3a-addf8c99908mr343446666b.2.1749056147365;
        Wed, 04 Jun 2025 09:55:47 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5dd043a9sm1117788866b.89.2025.06.04.09.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 09:55:46 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id EA8FF1AA9162; Wed, 04 Jun 2025 18:55:45 +0200 (CEST)
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
Subject: Re: [RFC v4 12/18] netmem: use _Generic to cover const casting for
 page_to_netmem()
In-Reply-To: <20250604025246.61616-13-byungchul@sk.com>
References: <20250604025246.61616-1-byungchul@sk.com>
 <20250604025246.61616-13-byungchul@sk.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Wed, 04 Jun 2025 18:55:45 +0200
Message-ID: <87plfjv432.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Byungchul Park <byungchul@sk.com> writes:

> The current page_to_netmem() doesn't cover const casting resulting in
> trying to cast const struct page * to const netmem_ref fails.
>
> To cover the case, change page_to_netmem() to use macro and _Generic.
>
> Signed-off-by: Byungchul Park <byungchul@sk.com>
> Reviewed-by: Mina Almasry <almasrymina@google.com>

Reviewed-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>

