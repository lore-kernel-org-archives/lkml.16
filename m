Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE1F8488
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 12:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749126608; cv=none; b=B+cXwSitodYSTst3RDIZvzIUa+FPztDXMEb8l9gs3ca3n3jA7d0AE1BpPjRMVgd/UUdvfEeo7Mp0KNsgmwV938sJ/fVCI7kwJh2ome78q66cqlX1P4UnDhZWfOuWOHhLowtjUJZXtXnevEd59CS4UFAxf5gjxAeZ9s3XyxEI1aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749126608; c=relaxed/simple;
	bh=MHytYTBz8Jqox6VQpT16hfvjWmYP5f5ufAlb0eIhBvs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iL/3Zab3/eXnsjim1DNJEtMk2PpL1Umr7PK1emzUCHm+w0aluDDt2nGKEVrNJSwlK815HLTfKNrQb6g0nzFXupteyOr/4b8Bv2mAsxkXGk8KAQ3MnQYJabzLUhezkj3E8V2oEravQRGi0xBSLIouRYdSb3mF2kJ3qKw137xBPck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=FmmccjE0; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="FmmccjE0"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4a5903bceffso9481461cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 05:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1749126605; x=1749731405; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MHytYTBz8Jqox6VQpT16hfvjWmYP5f5ufAlb0eIhBvs=;
        b=FmmccjE00KukuLmQlRpGDw74MOuWr/GlhPOqar5CAF9BIOcOISW7QEiiyvkadYc94C
         8CPcZyCfbgWsoGEm9CAtWZx0bKu/pA2VrKwJ1Td7zrnQ6yNHNk/StZq7Nwv0Qqfev690
         0LTPXB0UvzNNr/JwEJpcty8GZ2ZR21LzfNOmIvD/2z140pCg7XZRf+GBRGAYNhBfqHIO
         F/nH92JEyh16VUj/6vUspsGbkxTCAJXDSK3aCpmoJaY3vXEcXW7Kd6ia4UGHZ+IFWHe3
         KfkKQCbSAfO1TQSl6eE7SRblDr1nMd+62Hm+x/UJJUOfRRZTPJYfR5tCogiooY2fr8o5
         SvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749126605; x=1749731405;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MHytYTBz8Jqox6VQpT16hfvjWmYP5f5ufAlb0eIhBvs=;
        b=VB79aI3pGbjttoAFBcgOFONm64KPJkDGraldUScnzHWKXeca9U4qkfS+5Dv2qZKG57
         gNnNAPSgjwURxxAtvYi1N/h/sQqphN+GDM8jIWXNSb6TgSHkC94+nYZkoCrt20C6maMG
         HBZDGC2b34Zx+3p/e3/OXUQmFEHnlVwVSThykezEkXjxU/Pqopmmzi2KpmiOJrrOPj88
         XxOeDSL2f+sOe18KVz4kW69EHGaLNNAkk844ONqGYonHxAk+nSa3jTHPU4cADVgwp8zz
         I76tyFEnuaqp62lHvK25NKZFsublkWbZk0X7YjqTtrCsr4WF561JhWUhusS4fByKlK8P
         K1UQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5EIEH59nXC30A+wItmDKbYP1h6SMT4jv2OxwqraCjbUwP9snqu1JRIbv4Ls0nfge85aVCpq6G97ROLcQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnbAkkssX91h0XUIMCdGS73qgQHvxfQlkNKn6SuZK688U/CoXh
	YoBJ6bAjvB2XaurazdzsoSNXmolUyZn24fm0F/RoUeEUICWUk+n4bMMHAb0ALS8at5PkKBpx+DO
	YaZyC2+qVQ3pbucZ7iK8WJszNH8uAoL5YwqzYQiPPOg==
X-Gm-Gg: ASbGnctlV7i16YLnb+q1GvxANQlKpJixslti5c1qBQJ8Zg0jzWVjDlMrCjWvWd5AtLV
	T5yiEWUSttsLUDoS1w/TIUgqEIF9NTitTe6lsH+VDDGw8U5kRnJH8eZdx5m8btO4oP0qef+taoT
	jRNoH6pU58Y9BcJknXlQx98ybLGJkIFJM=
X-Google-Smtp-Source: AGHT+IGJAH4AP5XYgqu4Dz9W2BoN5h6LEeBf/9Q8A7vKd11Zim4MAapYM0SxBDOcqHNIkaF48u81Kw+0gnFTHvWWddM=
X-Received: by 2002:a05:622a:4010:b0:4a5:a5df:a95d with SMTP id
 d75a77b69052e-4a5a685bf82mr117127441cf.4.1749126605571; Thu, 05 Jun 2025
 05:30:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net>
 <20250604-6-10-rocket-v6-6-237ac75ddb5e@tomeuvizoso.net> <CAPj87rPv7Pd5tbXhpRLaUJCGB8JmD4kfF50WRsEiST2gvtg3Bg@mail.gmail.com>
 <cc21a090-801d-4b32-bac2-01cebf896c85@arm.com> <CAAObsKDMhuqYtn=+xR6-n=Uk+5_rU91OqVKyQ5cxhqfTo5svjg@mail.gmail.com>
In-Reply-To: <CAAObsKDMhuqYtn=+xR6-n=Uk+5_rU91OqVKyQ5cxhqfTo5svjg@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 5 Jun 2025 13:29:54 +0100
X-Gm-Features: AX0GCFvvNcCeZ1g6JOrd8mRl54fhnHPJ-VauKDXwMUlQ5VUcNOU5PCV9zv8SWHk
Message-ID: <CAPj87rOKGcufM0xB+uMCxhs0SdXCHpViyTd+jQ0+=B1kSihvVw@mail.gmail.com>
Subject: Re: [PATCH v6 06/10] accel/rocket: Add IOCTL for BO creation
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Kever Yang <kever.yang@rock-chips.com>, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

Hey,

On Thu, 5 Jun 2025 at 08:41, Tomeu Vizoso <tomeu@tomeuvizoso.net> wrote:
> > Indeed if you're using the IOMMU API directly then you need to do your
> > own address space management either way, so matching bits of process VA
> > space is pretty simple to put on the table.
>
> My impression was that the VM_BIND facility is intended for SVM as in
> OpenCL and maybe Vulkan?
>
> Guess my question is, what would such an accelerator driver win by
> letting userspace manage the address space?

I mean, not a lot gained, but otoh there's also not much to be gained
by using the kernel's range allocator either, and it saves userspace a
roundtrip to discover the VA for a BO it just created/mapped?

Cheers,
Daniel
