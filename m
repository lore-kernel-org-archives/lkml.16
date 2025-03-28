Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54DD20E01B
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 02:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743130105; cv=none; b=VfE2Nw6V3blBO108JafsZJWsvMPG8EglXzqLjB8LoqAbYvh+KdMetGlyHkK3VGcYD/QK5f5FxjsNE8gW/MAcyLYjW7qVW6FD6Xzs3xvIVI4oMVW0RJ4zY0FxWsGNF3emMVmJK3Webr4zzqFYBnY3t1GN+hagOTUW59P7u4H10Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743130105; c=relaxed/simple;
	bh=e2On1fb6O58TqnEGWKGy4iYqXb9CpFoYz2GpFoxnHc8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BVJociggfA7DnUuvbXFBXG547oH5qMlRqV8KgMxzgr8qKsTgggq0UjCHnKCzVuZHfvbmx/A0TlUsIv56/ADVYoDyRaZtgy2BXVzNfeYIOnJyEKmFIBMExhEi/OpGLkvfDnCAL/W8BU31l46ejrwCbd/Lp3DFp2LazAwqmzUNOMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=TwPdQG+Z; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="TwPdQG+Z"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2ff73032ac0so369206a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 19:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1743130103; x=1743734903; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7oUlXQTE4USpfOU4bhU00bGxcL8wzVl02D95/iuVNsI=;
        b=TwPdQG+Zr+zu+i+rhwmwMbnNn0LNCa4+IFv3ruOwspG036U6LDjcECbk1js/zF47iw
         96+p1SQsv/bRqz1Kx54GYguR/SF5dzzKwzjFiO8kKwiiN0Hm2IOd9RTDNCG1PGqwwtzT
         XAJiS6Bu9SL424Dy8WLhKdheHTmlXsim2+vOeUH3XInrODcmV8LCWQwspwhfStm+fhVA
         h49zv30/pQgx1JlwOAiA9we8LKqtch9oemq/k3ZuXujOj0yAPPn74p3khv1OYZOCrT8K
         oECKZZ+HXaHOp35CiJ+61vBRqMxm6tx1e1YKQOFTkaKEDVWH/105PHdudjLSsZgDh5fr
         Q+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743130103; x=1743734903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7oUlXQTE4USpfOU4bhU00bGxcL8wzVl02D95/iuVNsI=;
        b=HnZuHEFrdhXjH1FQ4jJTVcoDhQLnb1GfYYKpl3hXr27oqk+o4twmbhaE9MorrtxMQE
         tB6rtQ6WUMRNx3K91Ggn9ZlNAEWxwXDV8dwSHGJHqUW8JG1QrVg8iiLVCv46cWfzUsjJ
         LOijbdXb6OayT9YS0pXYlDo82hk4NmdOYx8lHGhDPnM3U6xhxlwOyA4aVmZzdtAgL8UA
         bMiFqGZ1YnI7NerMqva7Sb6W1RSAl/KDlP6NXj888Je0y8NCSeJN1kva783h8Pt6gssY
         gCoFBstOKD74VK8DqMq+BVFdWf73O+kF0h37n4SfKbM/jlcQrDOd+Sk2xlNJ8cZLdNUg
         jhug==
X-Forwarded-Encrypted: i=1; AJvYcCWmQItvnV9Q+xoBHjPKqr2R41X+j1qbOW7KK9UvPUWT4q7dbUo/s5043IkoJGVYTbCwU6X6i62cqPYltfA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn37N/4Mq7IMn5mCq3kn2NDcTc/6Iqv/nKZBIxISlkzTiy4pqQ
	66CsY3rM446pTd2FuHDmhBRWxP5Lcxzq3IwHBL4PMWwmC92rbN/O4RaRA+5LrAqBLlRoDSOP6aQ
	Yngj9KFWndcKwQPPLgor4LuGdNwm/BnFIrx9EOOS6a7lMQ79lK3Y=
X-Gm-Gg: ASbGncvt1YO0kCKs28nEiJot2vCU6zcp8imGrrdbqN5p31pP8PgY+hGHcR90gwiTPDl
	BWycT9Sq0nLlqP29pkZocVwbPVd2BNaL5ipZaow/Nu+6GFY0aGhHw+3kWbrTF2ZT2Kua6R8aNAt
	z3cvV1ebEuQSLNIwjWxGpaVJ3/
X-Google-Smtp-Source: AGHT+IH5+njc/B9zdYdMwIxhAZN2UDtU62BqIvQxdf8FL37O1ElaoBnGJuHjBhevSMlUpnHeDnICzSch78C6MeU5HDw=
X-Received: by 2002:a17:90b:4d07:b0:2fe:b972:a2c3 with SMTP id
 98e67ed59e1d1-303b1dba5e1mr2943196a91.0.1743130102743; Thu, 27 Mar 2025
 19:48:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250321205722.3947901-1-csander@purestorage.com>
 <20250321205722.3947901-3-csander@purestorage.com> <20250327104232.GB10068@lst.de>
In-Reply-To: <20250327104232.GB10068@lst.de>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Thu, 27 Mar 2025 19:48:11 -0700
X-Gm-Features: AQ5f1JracAj1NqSM2tKPDpP46TcYNxt437uXCSHVplEHIBbua7GDryFHdYertZc
Message-ID: <CADUfDZrqrAQzcf14B1ZxJoxVWOg2giXNCop18WG=62eMEHO7Mg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] nvme/ioctl: don't call blk_mq_free_request() in nvme_map_user_request()
To: Christoph Hellwig <hch@lst.de>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, Sagi Grimberg <sagi@grimberg.me>, 
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 3:42=E2=80=AFAM Christoph Hellwig <hch@lst.de> wrot=
e:
>
> On Fri, Mar 21, 2025 at 02:57:21PM -0600, Caleb Sander Mateos wrote:
> >       ret =3D nvme_execute_rq(req, false);
> >       if (result)
> >               *result =3D le64_to_cpu(nvme_req(req)->result.u64);
> >       if (bio)
> >               blk_rq_unmap_user(bio);
> > -     blk_mq_free_request(req);
> >
> >       if (effects)
> >               nvme_passthru_end(ctrl, ns, effects, cmd, ret);
> >
> > +out_free_req:
> > +     blk_mq_free_request(req);
>
> We'll want the request freed before nvme_passthru_end here to avoid
> deadlocks with namespaces scanning.

Good point, I'll send out a v4.

Thanks,
Caleb
