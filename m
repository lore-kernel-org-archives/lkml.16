Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A7F1DDC00
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 16:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749056092; cv=none; b=HRNoTehAbwddXhwb4oj2UGhVnyLXtEgdxZeTjfFLwDwJihECxkZZG8AvO75L2bbZXHupQ91eDdSxkzhyJPV0F+Iv3ds/2sA5/JeFnbKEp3VoMi6TiHi0QxGFYLc4ADYk07z2r5UzkNjeUNyhqLdlc3IzmgezI3xarKvcWRt1JNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749056092; c=relaxed/simple;
	bh=W01do5wY76nWoxIg5mxKnfoZrGLR+i9S8Z7A2Dc9Ies=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tbRjkMqD0S0yuyABZaxmEDQ4V5tLassGrIdPPHTp/KJVVDu/9/pBbhCsJpDPBgBK0pwELTh6pV/BjPwakuuJ94v8O/eAyAAm+PoKgzv+1A2S1BFLeS5TBPoMBJZ0oLaWRb0fWix5ZfHQvSrJpO5lN5dbQPcihGMkSo+olZvf83o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I3svuSBm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I3svuSBm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749056089;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W01do5wY76nWoxIg5mxKnfoZrGLR+i9S8Z7A2Dc9Ies=;
	b=I3svuSBmD0ZYhc8GwaEwWk8eQ37WcUqwoPSTXWPWO+8nJDa+8pA2vU/F3KyLd2tRFSxyaY
	eq/FgzwkfZ9emlUwI5RxQUWqm93oeZuDsi3ukUdI9HT1iizaOuQw0AuzZ2cQ8KZHms8gSn
	EHoVxxpRGfRm5URnHRRMqkXtmAq1zJk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-489-4mzViDvOPMOAYHkplT0xrA-1; Wed, 04 Jun 2025 12:54:48 -0400
X-MC-Unique: 4mzViDvOPMOAYHkplT0xrA-1
X-Mimecast-MFC-AGG-ID: 4mzViDvOPMOAYHkplT0xrA_1749056087
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-adb2a6688a4so3391566b.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 09:54:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749056087; x=1749660887;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W01do5wY76nWoxIg5mxKnfoZrGLR+i9S8Z7A2Dc9Ies=;
        b=ihT9IoHa5So2MtqP+p00ukr9CP78JfxZezB1AaNhFychXtd/K1V1qdF8z3BMAuyMt0
         limDrKyqfqoosvGNDRs+hfg8gRgI4+T7FgBQ6pxjQ1PPWOr/yLsvNUGnVRVXYLO4aR0s
         FbD8tS9+45hvWcapTUizB0K4cBZTihXpK0mWPa+C5mLjex4CSwEGIo5EoDKUxVqZp14Z
         yrJS5Pe8TYOMvq1UIY94Q21FRGxHvESLYSRqjFzcwOQKK659AxNhL4LtOS4YNvsNBlu/
         B5e1jEjx4DEuMsC6rY34fEgBeXjCja3Exhzc8cSaxLh5Ayhm4SS9AOE+tJqLzVgBa3cD
         8URw==
X-Gm-Message-State: AOJu0Yxr+T8x18/krRDhZd9Q2ORv2z/l4Akedj1TgrHTYEJFf6D2ELLU
	T48amtcKPJH6LoIeA3USP8wFkxSpgCP5dUmNSDHGch64kbLX2M7y5y6ESWTgFGCBxkYfuBCbSJ8
	6Q55k2DfCy0hcRikQrvOfD277HlD1MjufvlMDN/4IjqE/NLTrfphUPNt0XifHx172dA==
X-Gm-Gg: ASbGncto94NAOHL4z4GUUSlFWK5FGrZZV06jJQlkwTdN6mksOqXXFUUUDROFkqVHyUq
	XHyW7z+xBEVeDhnJOG7KWbnZXrApoISKhrkjE8ZA03FyfaU/qV+1F2iFiHoO07pvxq0cTMsxzV6
	8j9Q7J3VT7ukcrMcPm/H3nI8yheTTYY/vTQGUd6dmimSPdA/eRbG9EQH7QFCqr3rHQ25r4pvX8i
	+KYkYmikiFFDtdzNEnmCLVG2bjuovpKu2hVHaWUn+X/hCSTze38JK+lB8Y9oJHrysNUDfQdwjr7
	bZCT+uM7LTzJypOexomh/W9shPd6oHBpXDmW
X-Received: by 2002:a17:907:60ca:b0:adb:469d:2221 with SMTP id a640c23a62f3a-addf8fb3392mr316906166b.45.1749056087034;
        Wed, 04 Jun 2025 09:54:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4qiEZwqMaU8PlogC4zz14GcOUJ6vF7+mDiQZEwc00xgVAfFjugss6CGYBiTVHOcZyOXoQUA==
X-Received: by 2002:a17:907:60ca:b0:adb:469d:2221 with SMTP id a640c23a62f3a-addf8fb3392mr316901966b.45.1749056086612;
        Wed, 04 Jun 2025 09:54:46 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82e7ffsm1136170866b.68.2025.06.04.09.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 09:54:46 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 286601AA915C; Wed, 04 Jun 2025 18:54:45 +0200 (CEST)
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
Subject: Re: [RFC v4 07/18] page_pool: use netmem put API in
 page_pool_return_netmem()
In-Reply-To: <20250604025246.61616-8-byungchul@sk.com>
References: <20250604025246.61616-1-byungchul@sk.com>
 <20250604025246.61616-8-byungchul@sk.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Wed, 04 Jun 2025 18:54:45 +0200
Message-ID: <87y0u7v44q.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Byungchul Park <byungchul@sk.com> writes:

> Use netmem put API, put_netmem(), instead of put_page() in
> page_pool_return_netmem().
>
> While at it, delete #include <linux/mm.h> since the last put_page() in
> page_pool.c has been just removed with this patch.
>
> Signed-off-by: Byungchul Park <byungchul@sk.com>
> Reviewed-by: Mina Almasry <almasrymina@google.com>

Reviewed-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>

