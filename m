Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36B31F1306
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 16:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749056081; cv=none; b=YEg+l/1jBaCFxQcNjTozGJhIoJlCHJxFDu9c/wQdTYfHb8l38dp1LgOaqUlLdWTQK+71/Fu+wHw005DkhumWeLolXdl8PQqRnVj87FZb6LjVvG4Lhz6lqFDvouXICZ2Qzd6DmSTMcRG7ZqkoDZU2eGxgaTPtqIXYVBAPoKm6JDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749056081; c=relaxed/simple;
	bh=tcd0Zzewl9fyLQbRjA4EgreSr8MAtbggVIRO6sDPbgk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=sxby5W7jXTn6JBsf2Xw/J47OSp8bUlTPqkzU1AHY/QiGtMIMwqEVuBV1y9kST52VNozQw/yhccg1caWMG0ysFJPWdGWHWoC5Hke4qyqFFBdpYcg2IKWcgns3ateSGEXVnoi8b592UWlJ4OvrEeVgHekHrYlgnpb78gMSSOY5u6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=icXspVYL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="icXspVYL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749056079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tcd0Zzewl9fyLQbRjA4EgreSr8MAtbggVIRO6sDPbgk=;
	b=icXspVYLppPhFIJOs+7UyET7C/99Cx7SzcEAUjeDGFcDC9l10NVhMpBWxN+K/C5HMatSFI
	sVzPhHW/FKpjE3cPRwz7K/EWiAVd8FHgkPfGmzrvfZMuWkzQO3QiiJo7GOfC8/YcRQmh5W
	3LGrCXnYgPTFEMB9MZviF0tfxoVBlfI=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-271-FxfIfxDMPy-ju0WBlupz6Q-1; Wed, 04 Jun 2025 12:54:37 -0400
X-MC-Unique: FxfIfxDMPy-ju0WBlupz6Q-1
X-Mimecast-MFC-AGG-ID: FxfIfxDMPy-ju0WBlupz6Q_1749056076
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-55328b79ec3so72186e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 09:54:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749056076; x=1749660876;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tcd0Zzewl9fyLQbRjA4EgreSr8MAtbggVIRO6sDPbgk=;
        b=J4YryhwlZ8AKQk2yudlaJoCAAyhXvSBFp6MsbcjZ+prJfS4Dw183LMJ8L3SrWTd6Mn
         414r5f41Vytu7VBMGRhalMwC8Xc4hAk2nAnbmerhv1nSI5EfmixsHMckT2phC8UDlT3M
         9LpcMOGY/up586usWKuv+nSNVpGh9/UiFNYCSYmQOPFIWUlert22qp5pOwdqXjo+XMiP
         RTlCIzRD/9qyd16laT2qWtoeRGzbU+kXu2qscNhUmSfMBPrMujqPATt665DDWjstf2C8
         Q/JuvaBtu/smsS0sDTE7HTwVFBHFXAvX1gEmYLv8s6nqOHpJPLLvNQVgaXSBvSVAxcBl
         pwMA==
X-Gm-Message-State: AOJu0Yx7sNGhwpiJ5y4tXNnZY8qeTJqIwhXtnoliTqPCywRXs1/5SB/P
	Et4QIcKdJFNSRLQiv76PeOVj92PnhIGPqererWcd5juvYP0MQep41OJlWcP8ajBShPvB/fCvtYt
	ivgNtsthRRowDIzjFQkXZncTkfMQFwRDGfK0ud3qFdF//LlZjLU8IM4AuRbviBBKsqg==
X-Gm-Gg: ASbGncvC2qmEEezOt2tPJbNQnYcySJCRK5KFhGPHepMHeaAfjtx2JLmNMGAs6OabhP/
	YAd30z5zejB7uxp24+aIbxKB0e6hB5PZuZqiUKt8N3N3IrOxzjTBrtg26fV7ruP3q6RPB2gmC/d
	iPlMxuqvJ7/vOZZCc4I/LYwYAhOvWNTTJ/SdoJHLkFSAr1idH9siEktpstbN/VpdrayHzOKT1yw
	nRft8L+BNYm3Hkkswluu4o3aD1MXHt31v0QohOxHIZrihJjdjTa4oG2Ng3QbUqZqXSPRKNGX2ny
	VCBX2gGzayw3UFIWGDM=
X-Received: by 2002:a17:907:7eaa:b0:adb:4085:fb88 with SMTP id a640c23a62f3a-ade075beddcmr32537866b.1.1749056064122;
        Wed, 04 Jun 2025 09:54:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+FyEzbRQ7ljsnYaqZEY9RyRG/Pit4hUmUJvWYN4/otGwuEi027SbI5iZa7eBk4SkzaaVb2g==
X-Received: by 2002:a17:907:72c7:b0:ad8:93a3:29c2 with SMTP id a640c23a62f3a-ade077dafb1mr27934766b.14.1749056049265;
        Wed, 04 Jun 2025 09:54:09 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada6ad6abc2sm1124547566b.173.2025.06.04.09.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 09:54:08 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 9A0E71AA9158; Wed, 04 Jun 2025 18:54:07 +0200 (CEST)
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
Subject: Re: [RFC v4 03/18] page_pool: use netmem alloc/put APIs in
 __page_pool_alloc_page_order()
In-Reply-To: <20250604025246.61616-4-byungchul@sk.com>
References: <20250604025246.61616-1-byungchul@sk.com>
 <20250604025246.61616-4-byungchul@sk.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Wed, 04 Jun 2025 18:54:07 +0200
Message-ID: <874iwvwiq8.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Byungchul Park <byungchul@sk.com> writes:

> Use netmem alloc/put APIs instead of page alloc/put APIs and make it
> return netmem_ref instead of struct page * in
> __page_pool_alloc_page_order().
>
> Signed-off-by: Byungchul Park <byungchul@sk.com>
> Reviewed-by: Mina Almasry <almasrymina@google.com>

Reviewed-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>

