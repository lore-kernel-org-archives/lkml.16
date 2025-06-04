Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5492A1E633C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 16:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749056229; cv=none; b=lWWNJ2kfD/emz2GSb6DkLkbplhVNWa7jsjjgeOgKgrdqMeRqmE4RXyFVQTW5wdhugmVviA/LRYzBSREtCoGXclLjFLOt+2Q7mREyPCnlv23FOUAomBC0insazzEbkjM09N/fpROqlwXB8hoA8AEXgPgsqs62BXT7SBQdCDV/cP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749056229; c=relaxed/simple;
	bh=Gw+d+3S7IYA06FhUQyd+hYu00sNtRnUnl76qT+h9VuM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pBGY8Wt4ALYyE+PMlFRZniWkiM2SiTn4TuHhSbT1YXVaDWBgl/2Qe/ZXNsBIC373981WUxcXQV/nJCgBezZNVYO+ulfT7KbKKAGiEaD1x2rm9DvwcwQccqo+yGqYTd0pp3nbsSZo/GzzkCwI7vMNw0NsR+tIWix1CuNehbywIQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C21mvKqk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C21mvKqk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749056227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gw+d+3S7IYA06FhUQyd+hYu00sNtRnUnl76qT+h9VuM=;
	b=C21mvKqkLS0A/YrHS/EtdqzOYjc98nNuFpGO1bflNmzD7R9KSJTSTkheFTCtQV9dZaMjrM
	Ecd/InFBn1gFdVjXuNrYkzZAJvI3JnKs+tNejMEM3B2EKgMiKe36Qx53mxuQJ/tWlBmAAT
	IhvAPgpcB1SQ7LAncp3Q6sET49Iuczo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-nHu2NNCgMb-_wPZ8tsBZqg-1; Wed, 04 Jun 2025 12:57:06 -0400
X-MC-Unique: nHu2NNCgMb-_wPZ8tsBZqg-1
X-Mimecast-MFC-AGG-ID: nHu2NNCgMb-_wPZ8tsBZqg_1749056225
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ad5697c4537so12338066b.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 09:57:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749056225; x=1749661025;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gw+d+3S7IYA06FhUQyd+hYu00sNtRnUnl76qT+h9VuM=;
        b=E+mhSLj/o+bcT3++H3m6c2lYXK+GjHqqmFHEiojXhiJ8wZubRcqPscqk9KPQW5M5dG
         6u9vYTMueJ1O3RLIEARyB775umvK8UT6lFDgjsQLeejH78JVoY16h8V4Me7Bymt+oaU4
         alSyUbrNE7DJhFbwgbePGzbkiBjuwp/4y62EIie8LAt+YXQi4jCEUYKcbVSddlp2Z4ZI
         leI3obPtqEITLuvc4CP5gOSUIe9MUyn+j+RIcJir8724kj+0KG9niOtLHHfkrNhdSMK/
         9Nj7VKSZTR3xxGHfX0PgI1EEkyNTh5bCNPfDs2IFvTLpk2j8SOwIPA9GE83YJziQgUOJ
         N2rA==
X-Gm-Message-State: AOJu0YypkU9hVOfrfQqoqZ71mZyTrTt+KeW/ArVE7vSwTUNOTHwQZaQ+
	2s0IaTOOoPKiO9odEsPGfrukQCAZhPDFcAKRgvidmBP3B3NoIW1daV+Eugfc3D++Roh8pL4jC0S
	vY2kz/vXw/3QtuYPHize4zhJvwiZwcoo7Gu/4V81nG6dnoJvzz7e7N5ENUqDsvud+JQ==
X-Gm-Gg: ASbGncujP8yarN6WjJDg2z7NKm7NogC2bDZvhR1W0+X9XO91bjz/4U+lcF/dD4+MjGA
	VeWnn7etV4TgC2k65urA1jRsJEIAyeG8P4FsjSvU+xUY2+v/H7UYWdGdS4gqxSQULIg4dsc1QpT
	jpN/rpQPGB4ufOasTZ4krJe2/H/3QT2MS4O6B84v6ssMq5PgYZyoMchm7iXKbyqfa2kalSiKkT/
	lkmqZv+MKRQUfPv/cagqcw0eHDaP6SP/PiiyH3S60C4TQMIsYet3MCr927EHmzdtX5H7wFivHQH
	ZRah7M1KKFjVZbhMie8=
X-Received: by 2002:a17:907:1c26:b0:ad8:942b:1d53 with SMTP id a640c23a62f3a-ade078951c7mr24902266b.27.1749056225228;
        Wed, 04 Jun 2025 09:57:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqG4TOAjPvMml/YdZyEoQ+QahksC02aQ5Whxm4dNHjvxJYD+wb6qalU2zcWL3KxMHhCO06XA==
X-Received: by 2002:a17:907:1c26:b0:ad8:942b:1d53 with SMTP id a640c23a62f3a-ade078951c7mr24899166b.27.1749056224800;
        Wed, 04 Jun 2025 09:57:04 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada6ad6ab8esm1110204166b.185.2025.06.04.09.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 09:57:04 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 59CA91AA9166; Wed, 04 Jun 2025 18:57:03 +0200 (CEST)
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
Subject: Re: [RFC v4 14/18] page_pool: make page_pool_get_dma_addr() just
 wrap page_pool_get_dma_addr_netmem()
In-Reply-To: <20250604025246.61616-15-byungchul@sk.com>
References: <20250604025246.61616-1-byungchul@sk.com>
 <20250604025246.61616-15-byungchul@sk.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Wed, 04 Jun 2025 18:57:03 +0200
Message-ID: <87jz5rv40w.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Byungchul Park <byungchul@sk.com> writes:

> The page pool members in struct page cannot be removed unless it's not
> allowed to access any of them via struct page.
>
> Do not access 'page->dma_addr' directly in page_pool_get_dma_addr() but
> just wrap page_pool_get_dma_addr_netmem() safely.
>
> Signed-off-by: Byungchul Park <byungchul@sk.com>
> Reviewed-by: Mina Almasry <almasrymina@google.com>
> Reviewed-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>

Reviewed-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>

