Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4401EB5C2
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 17:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749056620; cv=none; b=Ak0FmwN+g/M4+I8Hba7JBzWjV5hlKYJMn0DYfQojp2FC4/jjVU8TFDzTmSG1oV5GVgigT/otY0tXYrkyWy9ucwOm2UUhuDezbHK9LekRu8ZDSeYjP1ROoDSrDRxPXr2tx7MceRje3t8ULjk4Us1I5esZc6ZrLk2d5X2Zlzsw4Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749056620; c=relaxed/simple;
	bh=jayrpGQ8EMuNrxluCYCn92f4Z9jqZ5yLz/s/cukRdq8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OLbDK68NzqJ1fzhOwHS39O88whPAERGuuEoyX5qlkmagglrPRuE2STTD629lb/msSWjndsPWZxMQYirydbsnA+1O5MFeOvPwyd3wuyamYoPsA+q8X8uJKGe1jwGLF/MWJtkoe9UbFfxbUzklik+GbxtJqJnhpDVB/KGEuA797NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NfJojYoi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NfJojYoi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749056618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jayrpGQ8EMuNrxluCYCn92f4Z9jqZ5yLz/s/cukRdq8=;
	b=NfJojYoioFhA8YQ6Zr1J5w9TwqfFXsqGbf+EgQt0+GgAc/rbjouSdi7BvpfbSB0f2TpkQV
	pbjDO+LwRsSyIKHRyRe3RbzPEdRayB779m321u7UJS1blKKqugiWFfh+yGbSyOyzSMGhv+
	uPB6GRAi37ojUFOJPbwKKmGKb+/U6Bo=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-LTulYyNyPw-_zFv0FPWqbA-1; Wed, 04 Jun 2025 13:03:37 -0400
X-MC-Unique: LTulYyNyPw-_zFv0FPWqbA-1
X-Mimecast-MFC-AGG-ID: LTulYyNyPw-_zFv0FPWqbA_1749056615
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-32aaad533c7so143861fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 10:03:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749056615; x=1749661415;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jayrpGQ8EMuNrxluCYCn92f4Z9jqZ5yLz/s/cukRdq8=;
        b=T4xE7i6lv+lczf7I1oDeGI7FeYFCBbQZD1pOL+sVgB75DafRgFCMZ7sRgM1xmDH2b9
         gT7pAHY91U5QZj4MH6HOl78GvuCGyPomYlu+Mt12s76aeuu4WmOjC9nMk14fRi1A+546
         RbNuKOyamcp+WFuwH/VNY2Agx0NASLpHQa+oDNUdtk6dQUS5EpnQ2i9XF9s4zjMesmXS
         WI6tiJ7ByREs9KEMYI3qSeuHYK8R5VVaIVXcnjfHadNCBHF09CvDZ0CCe1WxURhNIkKh
         3Go26qEO9iIVZwlUjiojIMQJcJrzKOjPE8M39TZTKPn0+/d1j1L96Hys3d20aypCIlv9
         QfRw==
X-Gm-Message-State: AOJu0YzeVxztjLAHOSoavRIT4EDe1sdiWA/b5xFS5kKqoJuuG/3Trj9F
	ZLek0EFI/2vajtarX1TD2GcUSdGc+LAnqyLi2utlnd9J+qLUdRPVPBn2Lo7CsCeFBVzq3XFSuUY
	xhclVwx5VgKHZGg3haavyEUpequyUKxoqPtOtsjvJfaMx+MxkkQMrPTyWRS5dSpxtRA==
X-Gm-Gg: ASbGncs4OHyqgbLOt6TQj5Qui04A0scemAmIH4YSHzJyrnPDhWWcsReWhO7ohShzJiO
	nCkDd1rvOqicT1oO/cYPVCu4FuzrTm0RtubUyUkdn5g0JH8lD/CI9nUScW4Mtnw5O0w6fZ26/0o
	SU74r4/Wjpd7cnFu05ooafYq5DyO6Iw21sSZbD5Y0giHKbTbr2UOvaetb2zuHDfscZfEjCCYdCK
	CtI+5nAMir5hLXsCbMr8DBY8SXdasvGOwMs6/YW8OZHj/4qla1U5Wij+mB7vSPde7q5pvtLB2jt
	WREoRH3K/VHx7v0toxZ26UHW+0qnoM3+al2jCybEZ5MVIh4=
X-Received: by 2002:a2e:a581:0:b0:30b:b908:ce06 with SMTP id 38308e7fff4ca-32ac79599f8mr11789881fa.19.1749056615276;
        Wed, 04 Jun 2025 10:03:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhvowgSTP9uwRV+BqJt6GC7sN1OE+Dwxjsqttfw8aGqFJyzPj9td+LDCaCRBwp+P5agViq4g==
X-Received: by 2002:a2e:a581:0:b0:30b:b908:ce06 with SMTP id 38308e7fff4ca-32ac79599f8mr11789411fa.19.1749056614743;
        Wed, 04 Jun 2025 10:03:34 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a85bd26d7sm22115981fa.106.2025.06.04.10.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 10:03:34 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 74C7C1AA9173; Wed, 04 Jun 2025 19:03:33 +0200 (CEST)
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
Subject: Re: [RFC v4 10/18] page_pool: rename __page_pool_alloc_pages_slow()
 to __page_pool_alloc_netmems_slow()
In-Reply-To: <20250604025246.61616-11-byungchul@sk.com>
References: <20250604025246.61616-1-byungchul@sk.com>
 <20250604025246.61616-11-byungchul@sk.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Wed, 04 Jun 2025 19:03:33 +0200
Message-ID: <875xhbv3q2.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Byungchul Park <byungchul@sk.com> writes:

> Now that __page_pool_alloc_pages_slow() is for allocating netmem, not
> struct page, rename it to __page_pool_alloc_netmems_slow() to reflect
> what it does.
>
> Signed-off-by: Byungchul Park <byungchul@sk.com>
> Reviewed-by: Mina Almasry <almasrymina@google.com>

Reviewed-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>

