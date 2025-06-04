Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A5E1F2C44
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 16:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749056202; cv=none; b=HTWNAqCj0Wva+BlKuWZ3gCTAIxOW+3o52UJT3/dFVhTz/KP49OleVFSq/wGobSTc/WVrqdiKgjec6zmzHhVMq+FzPU2os59oECfBBDogLnwE6cULWqhBhGp2Wuf5ccZV6cosMSOsj+4fOrRsp7N40DBSOcFpOTZdjj6o55cUsG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749056202; c=relaxed/simple;
	bh=hHWkN+1W3r8pcWm5IykqgahYA5ORV1Tz/OpKi1g0bhg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ujboKMvBLkbp6d29QuyJhnW02D7XzsKttj8sfDPUDJAT9KhwaxgEAtL1lBKjk+/bwrV32Pt+76mHz2J/5qMSL5PLCWHqp3oSTRqgRPphNvESWSOLXum3HypIva0zbVm5wTfWsgIELur5Bdfw+/4EZ9Bh36kHGRi7Ubi54Mzfuq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FDNhrA2t; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FDNhrA2t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749056198;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2I81AuUlYQ9366SJCkTTKCrVJZ04owtIVy2X3Og2iB4=;
	b=FDNhrA2tBSuNsYVdsr+ntslc40l//cJPdwjELnunNdTvwWlzRmLXNJr0/pNnoqowpA0f2/
	ExQJ4rQ7dyXaEKSKYZTbTjQrLB5h+2Ou2f7AyhHdw9/LOBR5gITCF7Fu/Z2ndev4CS2eL5
	fVtJEo6/sYaXDw4vSdJXJ/kkqp4rXlI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-tpyY9lqCOZ6WIiBppIvszQ-1; Wed, 04 Jun 2025 12:56:37 -0400
X-MC-Unique: tpyY9lqCOZ6WIiBppIvszQ-1
X-Mimecast-MFC-AGG-ID: tpyY9lqCOZ6WIiBppIvszQ_1749056196
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ad89a3bcc62so10975466b.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 09:56:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749056196; x=1749660996;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2I81AuUlYQ9366SJCkTTKCrVJZ04owtIVy2X3Og2iB4=;
        b=k3th6Ff02FUbhIdC/Pxy0SzgobMN67TzE0v8SbFnhI7ERMzhixtbcCr9g1JPYPI3sy
         WetYV0omzfUlWTppZ+VBeg2wXn4+gf4dHN9mFCrVz6Pm+M14OXrJqf5ZhW0EnJjnVWv6
         gZwxaZbRFW0+kWxva/5pjx89vYnwfEZQQml4ppFelX6N/UGYk7klQWJ4uWwPGBLO4y7L
         G/2j7Ph4MxwBrv+jjKo9lXWuUpSkyQRo6jHkO9M5iYjE/DF2cjwcZFPPXV+/r3JQIwaP
         NvDrUDGoc68wzbF8oM3r68fogUbDbojwZmtCodTOI8vVTOw9gS136hD9CAVCEPK+6Cmq
         z9MQ==
X-Gm-Message-State: AOJu0YyQoTlyiby05EcwpmQG+8R1xz7+ttT+T4u0Le0BTkDB5fFRAy7E
	P8x6rcAw5/4O90vUbUpNt+t1Qxaig4a6rUkzlG0pzfuV6SKvXwHow/CL8E+WALTEn5H5FjvRiUP
	V78m43XWw7KWT+HI1RFqhmq+7IdUFphdFq45zToo8TrWCWOmH/wWAY1KEfNtJ3nSLzQ==
X-Gm-Gg: ASbGncv+OtUEhKwkBrlvBuRRXNv2DKntp+g68A/d1Y09YRo49iyJo5hhKQxKtH2cqm1
	i7fMo71pROb1L5EZyo9fSC18T8ZhL6FUQbchSxIIQ+KpmDaPHGCZqPjC+43vL4hYszlTxI5HvZN
	b8UbYGlJvtf053R6A9A9ZTDdyZ6ivl2wGUu1Ir6es1dKl6SJ9DDEif1PmvC78sPISuomRnruXNM
	QURIjG3ugV1hrI8AlDJBrh7xsRFpm9I2Eh8+oG5oQ5cB6xQdx5oZDWjNqEio4T8Pd0nKfUXeVq4
	aCZSgAi6
X-Received: by 2002:a17:907:9410:b0:ad5:eff:db32 with SMTP id a640c23a62f3a-addf8fbbcbamr374232566b.48.1749056195764;
        Wed, 04 Jun 2025 09:56:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyDZZleVWiVesfO9YTAhzLK2xLG6f1Ssys6/5lTY37/ymkAbmNiWcQtPEP0I7NoOuKWqtMkg==
X-Received: by 2002:a17:907:9410:b0:ad5:eff:db32 with SMTP id a640c23a62f3a-addf8fbbcbamr374230266b.48.1749056195333;
        Wed, 04 Jun 2025 09:56:35 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada6ad39f08sm1135981966b.144.2025.06.04.09.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 09:56:34 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 06E6B1AA9164; Wed, 04 Jun 2025 18:56:34 +0200 (CEST)
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
Subject: Re: [RFC v4 13/18] netmem: remove __netmem_get_pp()
In-Reply-To: <20250604025246.61616-14-byungchul@sk.com>
References: <20250604025246.61616-1-byungchul@sk.com>
 <20250604025246.61616-14-byungchul@sk.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Wed, 04 Jun 2025 18:56:33 +0200
Message-ID: <87msanv41q.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Byungchul Park <byungchul@sk.com> writes:

> There are no users of __netmem_get_pp().  Remove it.
>
> Signed-off-by: Byungchul Park <byungchul@sk.com>
> Reviewed-by: Mina Almasry <almasrymina@google.com>

Reviewed-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>

