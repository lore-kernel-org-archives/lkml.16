Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B04199237
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 16:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749056384; cv=none; b=nATzDfJdl2m6F1iS51f3Hgjcqpr7A2QYodI5PFr5OW4NIZArCY+oDCgN5vGJIS6EbUH4ZzwCSBL5pZAQV8KwkfPIGEnRxzvYt955RQxUZc8fFFINn+ldmYVF5X4kS/L3TvSNRi6d0u8KoN5eIfa853+uAFrFM5HHkvjKp4qxCRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749056384; c=relaxed/simple;
	bh=TisxmFxL/O31Am4LeVuPkcK1xwB3+HHPha7PZiRcrV8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cDqM7spJQLXsckx/DkGKTPMN/JNGyrnwqAyFXIXR5GtlE0ZY3vdhV6tBAZ/4ixJbC5KxQQrB6+iiEKUa3x0jeDazdL1BqetNE4l1y4cm7IcOvQ90S8rIa/Tu1emT30/fNqy2NnyaUVzMa2nHIOZtBVLJqrvcJcijujbehJGbZM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gBt9+c9J; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gBt9+c9J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749056382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RcDq3LrKSOS2wxrwTduRvwlyf6+kgRTg7vc6C+v+3YI=;
	b=gBt9+c9J1qHaBqJCg4JT/z/ogrWIBvKWE2eKGh8hM+PxXd+AYlLWwddiYEExWu2hG/mO+J
	z4+NWrjE+2LAeSAFEgcqSlGjT1Uxy1OWsu+MS4ky36qT+E2MB329vZy08wMFs8H63LOwhi
	FKoM5GqGGTz3eUM4h3sL2wkxH6LhJVY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-674-6w1GgkI5P_Cy5vSfdwRIWw-1; Wed, 04 Jun 2025 12:59:41 -0400
X-MC-Unique: 6w1GgkI5P_Cy5vSfdwRIWw-1
X-Mimecast-MFC-AGG-ID: 6w1GgkI5P_Cy5vSfdwRIWw_1749056380
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-601ed3871a1so80715a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 09:59:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749056380; x=1749661180;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RcDq3LrKSOS2wxrwTduRvwlyf6+kgRTg7vc6C+v+3YI=;
        b=k18mlKB7jX+9NnBgP3Ae8lPzQ3A9aACAMgLUYjtmi8LlmfV5bomEjqj/23mp3SI/qG
         LYc8bqyWRvfvlAgEvDyHYb6FIsrGPvFLm46xnl4T7tGpDz0XCP1+OBuKPsxx2dZpLMNO
         PtJzj/fOh8uV4HuUMT35qcC3QcIbTj+LD9b7M5UDOXY8l0iyMFoGRVVe7GqR+ocNZ5JD
         FwOYuLJjef6xh1vPU6hS8v5Y6Cx4C66eziWJxtp4ga02k8AxhELBFHifFSvfskIzgSUm
         yO61Wbmq468Vm/+OwFCM3rZLUENbn97k21FrqG2DI/kvFFExs0qsj2iRJk3DhIxe8jh5
         m15A==
X-Gm-Message-State: AOJu0Yy6xIIaAV/x80tLGPamsJ9biOtg3kpt1L0gbNFM8uVBPx/zO0tC
	5Te/6ToAXHDYFZDqhrFClKx6L3L4c8AbVLVONQ5tvUXk31A/0/KsIvhCeUQZjjMsfHFRYNLMXwg
	Cw2Jt+7DgjWmX58unvDNfuVD+eoUwveCs+ZLEcKttUlRj+Csy1OAOsqNcL0XwEvslrg==
X-Gm-Gg: ASbGncuxh+0626UiWauvgcJ7PWNIwiJpf4p73gfGRgySk6OZWBuUliIyse1AJbbNSsY
	V2sRjXXXQxQ8fd410HDd/Yioyo0ejwkOlTvQ5nLcNLctZLvVdRP4qgUm6yuOsHcWUYGCQzmtsoy
	NPgeyK71eMpUUqrBSFvgFQyjQvuVxGl+yEMSHDOHU9osVnf2HbR4a+THrdSqCM6TbsrQXZ5rucy
	IiNHAuYIOQyaml3BnSkLeieuiWyaYaa3zHXpTXGMCwPw8DqS0PuUNsv3XEG9qZjRJ4ICRzeGiX4
	vHz2dKLq
X-Received: by 2002:a05:6402:358e:b0:604:b87f:88b4 with SMTP id 4fb4d7f45d1cf-607226293a8mr293577a12.2.1749056379672;
        Wed, 04 Jun 2025 09:59:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZxMOZadu+KBXSHu7RkEeaN6qtSvGLWFm1vInB8dLTiO0dgyXATXc6Hz79i4hKaPIEOdbWXw==
X-Received: by 2002:a05:6402:358e:b0:604:b87f:88b4 with SMTP id 4fb4d7f45d1cf-607226293a8mr293550a12.2.1749056379325;
        Wed, 04 Jun 2025 09:59:39 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-606d7e17dd7sm1783024a12.48.2025.06.04.09.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 09:59:38 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id C55081AA916A; Wed, 04 Jun 2025 18:59:37 +0200 (CEST)
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
Subject: Re: [RFC v4 18/18] page_pool: access ->pp_magic through struct
 netmem_desc in page_pool_page_is_pp()
In-Reply-To: <20250604025246.61616-19-byungchul@sk.com>
References: <20250604025246.61616-1-byungchul@sk.com>
 <20250604025246.61616-19-byungchul@sk.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Wed, 04 Jun 2025 18:59:37 +0200
Message-ID: <87ecvzv3wm.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Byungchul Park <byungchul@sk.com> writes:

> To simplify struct page, the effort to separate its own descriptor from
> struct page is required and the work for page pool is on going.
>
> To achieve that, all the code should avoid directly accessing page pool
> members of struct page.
>
> Access ->pp_magic through struct netmem_desc instead of directly
> accessing it through struct page in page_pool_page_is_pp().  Plus, move
> page_pool_page_is_pp() from mm.h to netmem.h to use struct netmem_desc
> without header dependency issue.
>
> Signed-off-by: Byungchul Park <byungchul@sk.com>

Reviewed-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>

