Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8291E5714
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 16:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749056364; cv=none; b=sio/AQc7Xedwyyp2Y2a8Yjcd40fii6PVen00zUn8mcZ4Xz7KLUs4dkH+6rTdJLKeCtEx46Z8vkJSJEC0bQ4U19Zwrhp0/frPk4S1bDAQFMsT7YDxUlV9Sz/yWRhxzskQQD+0wnUza1n5AQcSV1I3hSvzN/FA0tnen6vK6JhIpCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749056364; c=relaxed/simple;
	bh=AwLlp//63F4GIVocx29/odhVq+nfcN5ufbpel09x4kk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=G6ENExg8GrZH90wL/yoyJgYFJgI7QF/704WMUFyCp6ImC8hV8/GCbmB5NChETvFBkCZ2rDDeOkWznOVZUFe6SCcGd+6aGsFQektcIVj2gob/u1ovl0Via+25VvavyIyYybt72GzKOlayBoX6c+5U4O0QEg2zfInH5J4Lueb58zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZVv59Uga; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZVv59Uga"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749056361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AwLlp//63F4GIVocx29/odhVq+nfcN5ufbpel09x4kk=;
	b=ZVv59UgawJsysdOnA13WI8zKUnVZiBUG4EmtlbGuasyDuPdHRQH/aoOBdBOkIh7QniKbzw
	u8frrlUXwpT8iDl5wezwFzcRPURCTNcFihqlHVt/GCh9MUuOZV89kydguEoQoRuNtamR3H
	f8GxB2bKMDEuyceBTNSZZuX6/zPv8NM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-450-euThyyFCNBieWwcb94z3iA-1; Wed, 04 Jun 2025 12:59:20 -0400
X-MC-Unique: euThyyFCNBieWwcb94z3iA-1
X-Mimecast-MFC-AGG-ID: euThyyFCNBieWwcb94z3iA_1749056359
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ad5697c4537so12496566b.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 09:59:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749056359; x=1749661159;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AwLlp//63F4GIVocx29/odhVq+nfcN5ufbpel09x4kk=;
        b=Y1Raec2OSVkbitT12p4woIpJwqCetbT3lFnn8hOPqeMyxpEUQyE1IYBXX/0FaOhH/D
         8gDkHLWzNAAdV4LEdOCLkvGRdVEEkPIJobuYympg3JXyYB9CcqEaCw5ENdIJWzsFyUYj
         T8B7+yUJLDtZxCrwrVbHD2UumCaCzp34jPfdbyxEAPtEsfBqZqyZdvv/JmW5SY4p5CMs
         lsVwUZFOphXBO6mvF/FK0/ZTyaNIU/WY83TaOJPFYZ8ACveRaeJe/cGz+uUMfPIqntP6
         Eq59r8iz0nv2jGljRf+jlonRkSVP4bfLs9YQj9EVUceeIjgJ/bdK8ndfRCH3ww8d/vkF
         aAsA==
X-Gm-Message-State: AOJu0YxMl7E0a37J3Y8u5dFn3x29GoQ0M1PZe/ua26nkwLCSnGwk0o8w
	alxFUryey5us5rXtgfM3JfKeJjzqMm296BVudxzrDXrnJcwcc8hJAF0kR8/VVQbpitTNg8QVy+/
	w4AljWpsLQSXZwfAN4DwRZnAtKngXGAY7kEywKUWH7kkBnDA0maGypFfDCAn2CkxXFA==
X-Gm-Gg: ASbGncssA/lDU7xeNqaDpbBe5DrGuNr26DIH/SiTcSSquYJk18Ee/njW3dW51r1s3c5
	md7N3MM6K3OQ5P3ue52HfLLTliRCt88/odl/3mbqbpD0HvKYMLROoefAmcJxJupGwJoI4rVzFFY
	9MR+4rCbF5XB9IAMhSgyrQAWq4/peM/O52xf7VEQrKQGRyFnaW9P8MkKeVYoXe3M03RJumpNl+5
	i9LL0aCqzMuG8llm7lVIJpx+wNo6NiPRtwUuv/PyazKKu1Nh0s7Nqv6yFugRWsohkt045weL0+e
	cbfYn8B+
X-Received: by 2002:a17:907:3d02:b0:ad5:7048:5177 with SMTP id a640c23a62f3a-ade07826795mr23292966b.23.1749056359069;
        Wed, 04 Jun 2025 09:59:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4ivvclbp7JuzcZvieRJ0FZQ1qJdp5hxjTJ3O1n+o2T0S7e90wjVjWqBmgYnG1KObQxDSmLA==
X-Received: by 2002:a17:907:3d02:b0:ad5:7048:5177 with SMTP id a640c23a62f3a-ade07826795mr23290366b.23.1749056358629;
        Wed, 04 Jun 2025 09:59:18 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adb2d1e2d32sm1031777366b.60.2025.06.04.09.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 09:59:18 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 1929B1AA9168; Wed, 04 Jun 2025 18:59:17 +0200 (CEST)
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
Subject: Re: [RFC v4 16/18] netmem: introduce a netmem API,
 virt_to_head_netmem()
In-Reply-To: <20250604025246.61616-17-byungchul@sk.com>
References: <20250604025246.61616-1-byungchul@sk.com>
 <20250604025246.61616-17-byungchul@sk.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Wed, 04 Jun 2025 18:59:17 +0200
Message-ID: <87h60vv3x6.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Byungchul Park <byungchul@sk.com> writes:

> To eliminate the use of struct page in page pool, the page pool code
> should use netmem descriptor and APIs instead.
>
> As part of the work, introduce a netmem API to convert a virtual address
> to a head netmem allowing the code to use it rather than the existing
> API, virt_to_head_page() for struct page.
>
> Signed-off-by: Byungchul Park <byungchul@sk.com>

Reviewed-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>

