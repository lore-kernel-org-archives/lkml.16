Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949C91D5159
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 02:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745721952; cv=none; b=KAwHClZZ5lvUTGTdAqEHLhxfRo/44kadY+fZJxvg2SwWvPn5faVm+qGBXmW+ceyqInrR5vS0LQKADLfwa17FoghNiXzTbAj1JWDNMxox54+syni5t3SADctveqhZ8r8H1rF71RSyOwRSS7+Qy0tRzlPMxQK228C2D/MukOQPI14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745721952; c=relaxed/simple;
	bh=9HyWmovfxbdO9WlvHm/CrZCGdDuQYBCiz0YIKAxiQIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UuYZe22rks5DlqkyBdHjcyuxo4TZ5EQL7+I1cXcPltkCuW1S7nltXSQAQzOUdj3b36RRAgmTkQX8GASYlDrmtSzZ4PeF1/ZkpE4wCY5tmAyXDmx/KrGu2nFPPGNAi6r3V5gNqDbWzG5NtLLB2jpWX2JnrKAtAS66I3cMnszMJD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F8qyf2oo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F8qyf2oo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745721949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5lOD5wJKRJSGzLBcfg1idl+BdURTBGXU653f/FvKAjA=;
	b=F8qyf2ook5WUjOC8eDxwf7LWmqHqkQ5RRfw7vB+H0EMXBndZpBQ/f85qFeLNrdZFxNMHk+
	67W081A8a3G3kwEXCK853KE4f6PR+E+Vd5z1hU05+CpFgw7kjZvuA3d38hw+3vyhHQnaJI
	SD97eQd4+vPkiJsUoK4GEAGzjWCY7T8=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-ec878nO7PAyJCJDy6z0KFA-1; Sat, 26 Apr 2025 22:45:47 -0400
X-MC-Unique: ec878nO7PAyJCJDy6z0KFA-1
X-Mimecast-MFC-AGG-ID: ec878nO7PAyJCJDy6z0KFA_1745721946
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-30c4cbc324bso20025831fa.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 19:45:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745721946; x=1746326746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5lOD5wJKRJSGzLBcfg1idl+BdURTBGXU653f/FvKAjA=;
        b=BeJuq77rP+cRBIKQw4ryJV2gZazt9jIsgIgvtgEwuidaixrH+KDUH2fw18vZBxZlNI
         NUnpq2PSS2iA7wGW+K+dHTl5pSH34rLHcZHxZf2GW4256nDdXH5pVS/3ZGqtKAyIn0ov
         LLMD5cQ6En5aMiu5YJfUxmg/9zDK4rx9iju0ZBefI2O1ISpAnkg2ZIsRt1UFHv9FKYYY
         bF8VQzkAhxkejo5dq9JCmKyChzScEqx59HyWd/X6dayBWvItgJQQrcYipGKlLVAVlkJn
         dooEjp9l2kCdYLdq56M5TCZ6SZJ6WhaZ7p3G/H+dm/JstTyMLXm4V+2VTzvezHtv6UDA
         qGcw==
X-Forwarded-Encrypted: i=1; AJvYcCVDhXG1iY0vEzRXTTKdU0MLRa7gM/8TKsbsYan39QfqUe78hiOmYUkXBcMgD0zGk2u9kjmvQaZIbByyMDI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7H/8+oFyRze5hsLOkzt3FZDdxk0BQSBFwdr6iRfe9iQXoTy1p
	xHw2Rz+6QjJ4n49x2xBNgKSIlwQdBd8AeFmixVtlE7zAeMuvcy9ZC1lpjOlOQWtGWl2sUOHy8HP
	jlti/44NWBTd2NK0ySCKeS6jvnFoRcWt79oB7g+AmsydgwlR680a6qZFcxhn+aC+q1fxNf6ZejH
	+3mO7PculGLcEyVLuK+y+5sl9s8StAjOaJnw6S
X-Gm-Gg: ASbGnct0gXBlnpAfv+PgEHgKmYPzvjt2vW8Osf1XXReoXWh4SrEXAwqQGOgguJ1OOZR
	hqwOHanuEVF2vllgO0Tb9E84EPQP/Mvk3o7ZQG/PdGAS+Ct9tbw5UMOxSUKeCdXYKHaHJQQ==
X-Received: by 2002:a2e:bc13:0:b0:30c:1441:9e84 with SMTP id 38308e7fff4ca-3190614e2efmr19465671fa.13.1745721946225;
        Sat, 26 Apr 2025 19:45:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGS0Yc4bGIbl2/v9OhZ9z0uTs3mIqptakH90A1Qqw9fP/ktQZ1u60ZhGAtb0KMTfZsMAlADrGR3uW4Ef7E40xE=
X-Received: by 2002:a2e:bc13:0:b0:30c:1441:9e84 with SMTP id
 38308e7fff4ca-3190614e2efmr19465581fa.13.1745721945851; Sat, 26 Apr 2025
 19:45:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250418010941.667138-1-yukuai1@huaweicloud.com>
 <20250418010941.667138-5-yukuai1@huaweicloud.com> <CALTww29aehPQcbcy0j+V69r+RVgzNPwNhpAQ-7wWMdD-VPfNgQ@mail.gmail.com>
 <f14eac30-ab65-85b2-3e65-de6d50ea15e2@huaweicloud.com>
In-Reply-To: <f14eac30-ab65-85b2-3e65-de6d50ea15e2@huaweicloud.com>
From: Xiao Ni <xni@redhat.com>
Date: Sun, 27 Apr 2025 10:45:34 +0800
X-Gm-Features: ATxdqUFJRCKVD9aqKTI3GFPq-KDsm4Enqte1rPq47L--gyfTK3VWtePr_uH3814
Message-ID: <CALTww29b1MN8Q-ayFLxnRA=+=J-jrR90nrDrrY7xs1C_2k8KXQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] md: fix is_mddev_idle()
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: axboe@kernel.dk, agk@redhat.com, snitzer@kernel.org, mpatocka@redhat.com, 
	song@kernel.org, viro@zeniv.linux.org.uk, akpm@linux-foundation.org, 
	nadav.amit@gmail.com, ubizjak@gmail.com, cl@linux.com, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dm-devel@lists.linux.dev, linux-raid@vger.kernel.org, yi.zhang@huawei.com, 
	yangerkun@huawei.com, johnny.chenyi@huawei.com, 
	"yukuai (C)" <yukuai3@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 27, 2025 at 9:37=E2=80=AFAM Yu Kuai <yukuai1@huaweicloud.com> w=
rote:
>
> Hi,
>
> =E5=9C=A8 2025/04/22 14:35, Xiao Ni =E5=86=99=E9=81=93:
> >> +       unsigned long                   last_events;    /* IO event ti=
mestamp */
> > Can we use another name? Because mddev has events counter. This name
> > can easily be confused with that counter.
>
> Sorry for the late reply.
>
> Sure, how about, normal_IO_events?

It looks much better, thanks for this. I guess it's a typo error about
uppercase IO, right? We usually use lowercase.

Best Regards
Xiao
>
> Thanks,
> Kuai
>

