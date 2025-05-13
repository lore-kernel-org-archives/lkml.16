Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33EC1DF27D
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 09:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747127206; cv=none; b=P3r3aZCuDDzEjSzfrKE/lK6AiXG26BDvGjg3cFg6i+MGPiFH5pju0MF9i2PWjtlucwUzBJQ7vDSv/DXPzFTCLlvVMeHVpGpsbi0KjsFgK1kgUKs7pW4Q+vQsCdGZ3+q7TeboBl29B+RqMDgfaqo7XmGrdQvvJ9U5iEsRTEZb7YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747127206; c=relaxed/simple;
	bh=4JXnrDjbBRWUCUzqI7XuQqhjOnEHpPKflvyo/B+9eAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BGYaBeDLniocE/FvqMgCiTPRrSmQ7DbdRjEoeEHpLD8hcNmNOZIPXS6akagfDMneZ7T7Tu7Ek6GKpaAIrxzcFGz7vnukCfvgYfh/XXG/vcPv56TJj+Ai1I8vroA6QT2GMxVV/sG+gBtBBPJJxjFvTdxnWb9yKC5H8t6sj2AI7JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=AclFfwo0; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="AclFfwo0"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac3eb3fdd2eso1007755866b.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 02:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747127203; x=1747732003; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4JXnrDjbBRWUCUzqI7XuQqhjOnEHpPKflvyo/B+9eAo=;
        b=AclFfwo0Ki0vvTh/KKQDUosLWZsti+QtFlMMQa8afOBY4Bj0hcME7v0tRReXVZ4bLR
         fIsB9snt/JL94mTejY/KPhtZuLUHiTp9VL8275jCJL5u6DdLQVmCtdI07q5qh1MZ+IaC
         eupNhuBzgJ6xdemW3OehtqmKXobHEHgIdonRXK9nX6cluYIYRlV0Cpif2uIVOcg+vZuP
         m04AAx+3lgqFhNyS7kbrw+2H8lCbXtuUy/8TVkr+CGoFlOz2gSZONFQXCNNiiSWJQW1k
         rthEDBWlVRyKZvyDozB3dVW/ecX9mccMv1hndd20ajXx9Xtatv9Aq6T6sM3olw5PWB2l
         DyWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747127203; x=1747732003;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4JXnrDjbBRWUCUzqI7XuQqhjOnEHpPKflvyo/B+9eAo=;
        b=bH5T79S8qbr7oWfUOalkCo3pL3SNR0q/3gpLPSwEtVyLXhN5twN4Uv+ellklU2mJdK
         mdHFTxa8AtM8sfpcnufrEtjLO67DdlJrckrXEOS8Y/caW8Czu76T53XoKrokC2H2REgz
         fLFN9VaNGedWTBLJTtZr9s8KUS606oTa4qenrZ/bm8SxCyzJEBEHQbEEIKN2MI0Upuvd
         3EBckQVGrLw2qSQpLME+LztFZyDZU/G6qCvymTgUs4bclsV1/Pfzk5bNZB08i9EFFke+
         yGrnEaGCsfOZ5ukgvMiXhgm0DtQ0NCOFFvgX2tmkYBBJtrXXEKsGVPJj+lNEuzwRZCMs
         fYEA==
X-Forwarded-Encrypted: i=1; AJvYcCXe+o9Cwq2B+ZbrtNBB/wd6ancMkMibajeSxnICKy0cm1kocQRInJTibEQkSvwi4TamyNaClH4X7v4vJck=@vger.kernel.org
X-Gm-Message-State: AOJu0YxX1Sz47ikit0onIj54lSBaRxZSjEiPA6pFymaSvaRDohtGEBnA
	47RILKhuXVobvSn0uyEtELVJBF9KWU6ntHwO+9j4R1YmD9WlvHGEXh5LRRtKEhY=
X-Gm-Gg: ASbGncsFfS+9Q8EcID+PHT+IqBReSDZiCzmj8HuYLabUIMDTEHtmRsPdj9VvYMLDxdG
	ZOuXxfwDO/tP8iNGsrfE+ZW6k8R3aXeVJoRetDJ9yBLxu1mgaiWu4CP5xSMK6uQpkl/rIGaeDZJ
	0i3D8pGTR3iWyPQcm7ausBB9dCGf8fT4xgmsVpmtk6qKxbd+1Qv/zVk98GxNDvVPnmvufwA+VHa
	8+WJ+FzbNemVLsQpVU0Ih6MkaROYzs2M/O7LEw/C+m4yL9AtCWWHQzTu7oVthUrs/9Cok4qmJh0
	s+++yDkX5o+XuElpHBekCgz5thHFDrHnHTlwuCnKm3Qs80s0YJnvjFVJNty1cziB
X-Google-Smtp-Source: AGHT+IHTD9e8DpzOq7QjUNfa3EU2ZKEgjaPScG5ZmzWhfjrlNHySvY0t0oMIPh+fYDu0bwltQlMkbQ==
X-Received: by 2002:a17:907:60d4:b0:ad2:55e4:454e with SMTP id a640c23a62f3a-ad255e44890mr729748766b.58.1747127202975;
        Tue, 13 May 2025 02:06:42 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2290a4cc2sm641295266b.183.2025.05.13.02.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 02:06:42 -0700 (PDT)
Date: Tue, 13 May 2025 11:06:40 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Tejun Heo <tj@kernel.org>, 
	Chengming Zhou <zhouchengming@bytedance.com>, linux-kernel@vger.kernel.org, 
	Chen Ridong <chenridong@huawei.com>
Subject: Re: [PATCH] kernfs: Relax constraint in draining guard
Message-ID: <yxzbobrza26uiezc3fpcvtsv64wnn5hkk3urmqhdox4ae2d6zs@lkznubanccwj>
References: <20250505121201.879823-1-mkoutny@suse.com>
 <aBlJlqfAlayxfMc7@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2lw2lx4anlopd32o"
Content-Disposition: inline
In-Reply-To: <aBlJlqfAlayxfMc7@slm.duckdns.org>


--2lw2lx4anlopd32o
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH] kernfs: Relax constraint in draining guard
MIME-Version: 1.0

On Mon, May 05, 2025 at 01:28:22PM -1000, Tejun Heo <tj@kernel.org> wrote:
...
> Acked-by: Tejun Heo <tj@kernel.org>

Is it correct to expect Greg picking it through his repo?

Thanks,
Michal

--2lw2lx4anlopd32o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCaCMLmQAKCRAt3Wney77B
Sc8xAP46GjmlOO/Jl+vmtWf12vVlYpNaO0ujYy06DX3DWNUjcQD+Mc+yTmy/NZhp
utdMQViHW2yp4F1c/XsECLagMvKPGAM=
=LFjz
-----END PGP SIGNATURE-----

--2lw2lx4anlopd32o--
