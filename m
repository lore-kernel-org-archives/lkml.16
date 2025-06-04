Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE141CAA82
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 17:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749056571; cv=none; b=DE45DS2ie+G+1UoGGI4IMKLtPNvGq+uBsF3E5R+E6Tky9zIyA9v2cxMqgV3EbgvJ2K+QgXbfDan7p/25tYmJuCl41vkjhcSUNVoFrwgHptZdThZkopb4UgtZaJd5KWeY53lqmpaWX55X9Vo1v3ftHFKl1Y6RLLjlezkWLcGQrIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749056571; c=relaxed/simple;
	bh=P92Z/lDShPFdDV0ba/bd+B1EUgMMMMP1rDAJOEmCppY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RatRCFMLVFF8yIVPexMqwUFfa/9l6rYvaUgldY84jAwa+9VZoy8vfX9hMFJc8AVv9hpS4h2nVDv4lv2jawCNcbYhGXUiwm03TgnT8G+Hrn21CnEap7aBgkorvqW0F2HYqI+YlWuL7puOb3dFKs5kOqr6fxdb8eYkBc0oI36qdrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Zn4hnpY+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zn4hnpY+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749056568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P92Z/lDShPFdDV0ba/bd+B1EUgMMMMP1rDAJOEmCppY=;
	b=Zn4hnpY+1dmX0bdbUpIZMnvaJ/25MpMCwmKysbBUv0Ck9wn8E0ZCHonwXYiV0PmQ3MOcTr
	TYPHAPkMmuMQrcgS462Q5ZxEImW/gN2ViMV7dhZq6bsSAZgyF1ZY/n96qhf8IgZi1c9ypR
	36Jx+MAMBqzdCmeBockU/4i9QqdQAio=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-550-cju-VPZxPwi2NKpnQpczSA-1; Wed, 04 Jun 2025 13:02:47 -0400
X-MC-Unique: cju-VPZxPwi2NKpnQpczSA-1
X-Mimecast-MFC-AGG-ID: cju-VPZxPwi2NKpnQpczSA_1749056566
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-602df3e7adcso7873860a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 10:02:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749056566; x=1749661366;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P92Z/lDShPFdDV0ba/bd+B1EUgMMMMP1rDAJOEmCppY=;
        b=ow9ZjPHm9YrUJpRFZpWVC66P+GHILAYC4WBZ3JEBv883Bi1qCFscLVWCYBePF3Q5bq
         A2Vkc2W5DB9/cuf42OIP2BWaIsb082PVxOaspBZSnBxt8wRHa8GjHNE9aDN4fYxjzhJX
         sPujXSwKEycPRsFdaEj9Fcq1JPUD25GqArltWEVet8eMmSSpCeACEn4uNQORhhvpBuB0
         7RjMzY+/6ndo8Y2llcx9ccduEnL1bF8KKB6RiS7ceuazpAweqmrfGg/S5x4UXakOxNba
         hNVDBs0YyQsvv1CNuplWn35qDzIRtzcz2bBSEe8c76L0oxa5Zkr8bgMWUMxMlKsyAbUy
         AO/A==
X-Gm-Message-State: AOJu0YwzHpuF/8488kTjQ3yD0lw2G6QSony/Ov8GxBJLayHe2wkVCjGN
	dsv/nu3oKxhiDE4VuimU/qpawUy/bC6hEpjsgxC8uI5MB/EsMan42dYSfJ+G8BdD+XYvtERH9ak
	ghdd3iXTxpLFNr6DraixsGGm0GAphQDfiyFL3DYdRp7VM8EvNHViEUcQ6+1Dc1a4R2w==
X-Gm-Gg: ASbGncunnkTqaECT0fX1PKTYWiht9i++u9kbR7GQjHJofVV8ekpxNEDjAsKuzLHKeFu
	MdynaC9okb5mzUuGCOjoLzoxhrNlEA8M0RSTEMP4ZUAvARDxr6UmxCk/t51Ntf+JkMitWU7ne3W
	pY1Pxp99wACHVAn4/qa+Cg4MIFOX2ZyJBk6xglP0su2eN2OdFVp8Y78U7/Jo7ykSW29SKY2juWA
	fJofDhGv9bcKql3dKe9XHCW2a3m75jh71GRMUhLc2I40fzLfVDc8LS6nzJ4HnLoZrpVYqZ7/6zf
	5Md7iWU2
X-Received: by 2002:a05:6402:348e:b0:601:f3f1:f10e with SMTP id 4fb4d7f45d1cf-606e98b0c7fmr3783609a12.5.1749056566236;
        Wed, 04 Jun 2025 10:02:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAdY6lpY2ygDLbTrWvUQe7gwiHA2y3sjXZHMWjovtfZAcIj8f4Ly3/xK0aa9hY0kNARvcHRw==
X-Received: by 2002:a05:6402:348e:b0:601:f3f1:f10e with SMTP id 4fb4d7f45d1cf-606e98b0c7fmr3783554a12.5.1749056565710;
        Wed, 04 Jun 2025 10:02:45 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-606da099aebsm1673134a12.63.2025.06.04.10.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 10:02:45 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 39C481AA916F; Wed, 04 Jun 2025 19:02:44 +0200 (CEST)
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
Subject: Re: [RFC v4 05/18] page_pool: use netmem alloc/put APIs in
 __page_pool_alloc_pages_slow()
In-Reply-To: <20250604025246.61616-6-byungchul@sk.com>
References: <20250604025246.61616-1-byungchul@sk.com>
 <20250604025246.61616-6-byungchul@sk.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Wed, 04 Jun 2025 19:02:44 +0200
Message-ID: <87bjr3v3rf.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Byungchul Park <byungchul@sk.com> writes:

> Use netmem alloc/put APIs instead of page alloc/put APIs in
> __page_pool_alloc_pages_slow().
>
> While at it, improved some comments.
>
> Signed-off-by: Byungchul Park <byungchul@sk.com>
> Reviewed-by: Mina Almasry <almasrymina@google.com>

Reviewed-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>

