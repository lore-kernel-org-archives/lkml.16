Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B745537FF
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 14:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744383284; cv=none; b=B0lvBYJK+v41tPvrT4jz6PpB+b9QTjK/q3rMUFAdkS1RPpvClmInnYfxCntoace50nIyQ0ni+w1mu2p2nCYb7QJDDc8b4EJuW315DbQdyUbTJD4i8gVMzS2pI5lLY+JEgac6gDAKFgWlnqsQo220H4WGaKP9nYa1CmAQEfCwE58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744383284; c=relaxed/simple;
	bh=eIezD/ylug29m/0E9n8KTA18+3Fnkn4hc9wAgrXcGDs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KQKc/2DN5u5SzYCRpiBBcncwetH+zyREq6Wi5ljM3bZGDsMsqok6SI6SQTpVPI2AZz00O+d9FHquKyjbNTH/Whay6Zzisc4FHF0wM5W77yl0BneNM9Xd+sxLNiptf7xqZDbPkUvMnJp5bmOI5rCruMoIRKGw1PT7BddzH4jwWlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SGz4agnC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SGz4agnC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744383281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eIezD/ylug29m/0E9n8KTA18+3Fnkn4hc9wAgrXcGDs=;
	b=SGz4agnColGkGS76is53CpKvluM/e1snR7DqXhxmEoPlh5qNB95zTwdCXvt7Q9SKlfA9wX
	JO4SKL0SsTTBLb6jEJ8dMsqY651n2v6MUT3rADsDs9noE4cqsWPdAZm5Za8pqYtk4v7FGg
	5M9Fp69gKLBLqAecNMv2g21POi9EqTc=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-7OCCc7ZTMAe39cbrdxlVGg-1; Fri, 11 Apr 2025 10:54:37 -0400
X-MC-Unique: 7OCCc7ZTMAe39cbrdxlVGg-1
X-Mimecast-MFC-AGG-ID: 7OCCc7ZTMAe39cbrdxlVGg_1744383277
Received: by mail-yb1-f199.google.com with SMTP id 3f1490d57ef6-e6345bc7bd7so4582574276.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 07:54:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744383277; x=1744988077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eIezD/ylug29m/0E9n8KTA18+3Fnkn4hc9wAgrXcGDs=;
        b=YhuuFDXilUAX6P+WgfDBCr+oZddvEpbbg0dQgBxPi63hGWvbQ8gy0tBhgpUuoHkYVO
         C1l6LL8qd1/B3enJS7SQ3K17DV54tpwzfgZs43TRGlZmzx/OSdf8hn44yKsBu4zHFK4e
         WJTvt7Zp2PuI8DovJmI9bPMP+sPcMouAv2zh6dS+iiGDrqfDnDfBFC2v/HUuBrK3vgk8
         J1y+PvmSaKLKFCYRRbAsogsygdoJchK37dVpoFFMNjO57VZbfHH3DihEjqlaN4vnq6lp
         3Yajod+XTQ0U7BDvoc//rri2tvFSRWte4RBVFo7l2DmVV0Us43kZUDJz/y9e19AoL+Bg
         al+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU6AFbDNORmdZl71h61qr5ZDPhi9fm7KloXV9KghEq7Q3SUldOOgWfQ8K5HlZ5P5vXwkPfq827BrB33Na4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzki0RRDImt/hDekftcxID840XxbDUqEnuh+a0Qr7aVF9EazAZ1
	TlCBdd10umpqsUv+CVWdWcJJCEibFGl82jifrIWgsxsxbOUuSo051RWgpsJUqRuATtGboOazJA8
	JFqmCbyDqZDPXAURYNsI3HQsEHFf4vT/eVN0sm3J5c+T/511WbZOkxdWRlBNJ0uqil013UGtMp5
	0QH8fihZrwgpAvUb2GbLNShOBY1W1G6yNHCPrA
X-Gm-Gg: ASbGncsmy4wbiTV5DYasRCc6nq04dZSnQHKLUprxfFWQIXv5TGmxoitVcjIDg/nQXD0
	gfFgPVysjIFL6HQNZu3A/pbFYzBrBacNYkuwE6CXgAf7kCVtCnktoAwDOBfntypTeuIPthsqMfi
	ok47yajOg=
X-Received: by 2002:a05:6902:2610:b0:e64:cd91:9c6b with SMTP id 3f1490d57ef6-e704df2291amr4619280276.2.1744383277339;
        Fri, 11 Apr 2025 07:54:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9EhHuwFK1eSJF4vhK7gbADFbwjvKEoRXy8ZAl3D71EQC1R6+/ICnerdqvFsdHOfDHSi8SQ87qKPne+7PucWY=
X-Received: by 2002:a05:6902:2610:b0:e64:cd91:9c6b with SMTP id
 3f1490d57ef6-e704df2291amr4619252276.2.1744383277052; Fri, 11 Apr 2025
 07:54:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319230539.140869-1-npache@redhat.com> <9024776c-7028-4522-a773-8d53d233dabf@opensource.cirrus.com>
 <c559ae66-745e-4403-9b6f-ebc8cf85d2aa@opensource.cirrus.com>
In-Reply-To: <c559ae66-745e-4403-9b6f-ebc8cf85d2aa@opensource.cirrus.com>
From: Nico Pache <npache@redhat.com>
Date: Fri, 11 Apr 2025 08:54:11 -0600
X-Gm-Features: ATxdqUFEnMGFBBYFnjFYQ5hxWKTSkFJJeahcrNctdJFN2mYzO52OAa5ud2kmFMg
Message-ID: <CAA1CXcB-Y5fYdcFx9c+Yj9Bu-WtFF3TeDTzH2ehKFvGEBtGeXA@mail.gmail.com>
Subject: Re: [PATCH] kunit: cs_dsp: Depend on FW_CS_DSP rather then enabling it
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: broonie@kernel.org, patches@opensource.cirrus.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, simont@opensource.cirrus.com, 
	ckeepax@opensource.cirrus.com, brendan.higgins@linux.dev, davidgow@google.com, 
	rmoar@google.com, johannes.berg@intel.com, sj@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 6:39=E2=80=AFAM Richard Fitzgerald
<rf@opensource.cirrus.com> wrote:
>
> On 08/04/2025 10:25 am, Richard Fitzgerald wrote:
> > On 19/03/2025 11:05 pm, Nico Pache wrote:
> >> FW_CS_DSP gets enabled if KUNIT is enabled. The test should rather
> >> depend on if the feature is enabled. Fix this by moving FW_CS_DSP to t=
he
> >> depends on clause, and set CONFIG_FW_CS_DSP=3Dy in the kunit tooling.
> >>
> >> Fixes: dd0b6b1f29b9 ("firmware: cs_dsp: Add KUnit testing of bin file
> >> download")
> >> Signed-off-by: Nico Pache <npache@redhat.com>
> >
> > This patch doesn't actually work and breaks kunit.py.
> >
>
> I was working on a series to make the same fixes to another Cirrus
> KUnit test. That series makes the necessary changes to all_tests.config
> so I took the liberty of fixing your patch and including it in
> my series.

Thank you! much appreciated. I will try to apply and test your series
next week.

Sorry, meant to get back to you sooner, I've been very overloaded.

Cheers,
-- Nico
>
> https://lore.kernel.org/linux-kselftest/20250411123608.1676462-1-rf@opens=
ource.cirrus.com/T/#t
>

