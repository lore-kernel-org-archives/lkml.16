Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6205E13B58B
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 03:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747713052; cv=none; b=ECiHNUi+yjYaBWP7Fsu9qEQ7X4Q6xkX36qWaUGaV/jjPdcf8u1dzCHy0jjbEg32cuJxI2j4/w69ryK24X4vnoPTQaNt2E7EUqfpj6NdB6DFhisFAzrfP7W0cgE867nqWK7J3t6gbZLaWDSnSsjI+1N7FGKNbW3nKTepq1qbwsMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747713052; c=relaxed/simple;
	bh=0dpsM6J2eGG4wVOxgNLFXskU2KWD25k5b7+CNKqyx8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TDnRWQzSeDd9tGG4Wcq27v+VXu7xYNyGp/96HcJuRPdjyRnuhq5tECzo9hFqy5DaVjemzVOSLWWVJHd0tNo2syi4uMujkFalhcOF5Psya0da0Jt7ROMRNrh94MAu/PSqsjp32K1w8jCV9VryrJkH76e7TjGXIKkZMeC7qbbIeQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LifW6fVz; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LifW6fVz"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-32909637624so28120781fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 20:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747713048; x=1748317848; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HYdj+bJIsJtgt3154G/5pOH4AVBqxBVjujHHkLYPMcY=;
        b=LifW6fVzxaR7Z2iTbDq/RLD4bYP86UmFsba/QPz26UNy/UlJPrLitnSuL8znxpuCPq
         FGOe3AURm+UpI3Hs7Kpld4UMS/Ls/0D4y1svBqYqdtmjJq4TBm0jKIdo4x1Ckpuliqor
         r0kYY3i7EQpZnGZRRYOMRS/t1tDANSM41vuR3taOYX8/hdz/4TChuhEYXIOc1QtdJKTq
         PbHJ6qvPt2lWk4eCIWPeqGXcC6B1VmKFVXWzr2grRJmA0tzZI+EGLSsxhtKblliaFZdK
         vPy8h2In8eDkyirJHADKJEQnOsnW4Gy5O1Xv9sQmHPXUYXueVPk+nyMDuGGHS5KcWlyz
         B6QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747713048; x=1748317848;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HYdj+bJIsJtgt3154G/5pOH4AVBqxBVjujHHkLYPMcY=;
        b=sW3RZste2zFaui9uSEXDydk3zgT12ZeNYnlJE+MPMgcIyus3fbfM75OQW4hAEZglcL
         XaqQZTnIg89Irif6ORbefszALUfO2ZvMc1k1PWWZF+7qEaCFWi7pRt1p6uL/qqbVWz2W
         21Uzeuxwguatr3+14cFKLkN+FVu0btMEPr3QFxzmcxe7JVZR+o+acQ7anFXJNm0y9gxT
         EQXurD2PbJu3HNfcC3ZdrWqJ3gV98u3B96x/T1wrxUFadu1h0isnJJEVamFFn7HqKxCF
         19tFDgwg4J27iu3fTxbHz9StC1D/3QsP3npJo9wdy9TaSRdXJaBXJK9QbzWfueLzSfNe
         /sNg==
X-Forwarded-Encrypted: i=1; AJvYcCVXezMWAV7hqviBslil+t7JJhkp/yqs1kfPwXFUjY0XS5d127zsGqrP+gAdGduL+Vgs01VLH13BjxOF7JA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5mww7WOS4P7Qz020yAtUXTM3XRRoNPs8ZQpZqn5lou5jasLyj
	tW7IzPuz2DeMun3BuxC2JoBVbwvBGO94GZljAQT3kYuOxxGsjaDRlzs9mhcldYxskOxsE47mEwK
	N/cRnlX9MdTh9qhL6UrnBoBInOw8/iZk=
X-Gm-Gg: ASbGncth/PiheLeNtSfWq3rQuNanWx+ypBMqrlmVDtJosZVz4vVl4Ov/oIZF8pB9pKx
	oVB73TAsoiG2LYF2/bqDGJWOgzQF3hDETQNutHZjHbYSMOSvf60MjVUrZfkPzCFkhOmYTWGMS8A
	ioqVB+Dapf8HoGNKmpOAu1SiXRqgqgmeNc
X-Google-Smtp-Source: AGHT+IET2DGq452q9rAbrOwwqsOYJk4lcDjWkGmidydLLMrzoyKoG2CX94AhT8gHlMfg1hd9STj1tLek/ZqIODkZJfc=
X-Received: by 2002:a05:651c:2214:b0:30c:518e:452 with SMTP id
 38308e7fff4ca-3280771e0c9mr50872371fa.13.1747713048270; Mon, 19 May 2025
 20:50:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514201729.48420-7-ryncsn@gmail.com> <20250519062605.2357-1-21cnbao@gmail.com>
In-Reply-To: <20250519062605.2357-1-21cnbao@gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Tue, 20 May 2025 11:50:30 +0800
X-Gm-Features: AX0GCFujiyVXBw1NCKW1NJElWjLorE0Qzqy_JyDu_-XDxeORjA1QdwnggC6Lk9g
Message-ID: <CAMgjq7CspZEc77Vv4ZTqNbcx3dYgdj2bOz1QHS42w=nYJZeDDQ@mail.gmail.com>
Subject: Re: [PATCH 06/28] mm, swap: rearrange swap cluster definition and helpers
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, baohua@kernel.org, 
	baolin.wang@linux.alibaba.com, bhe@redhat.com, chrisl@kernel.org, 
	david@redhat.com, hannes@cmpxchg.org, hughd@google.com, 
	kaleshsingh@google.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	nphamcs@gmail.com, ryan.roberts@arm.com, shikemeng@huaweicloud.com, 
	tim.c.chen@linux.intel.com, willy@infradead.org, ying.huang@linux.alibaba.com, 
	yosryahmed@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 2:26=E2=80=AFPM Barry Song <21cnbao@gmail.com> wrot=
e:
>
> > From: Kairui Song <kasong@tencent.com>
>
> > @@ -889,10 +849,8 @@ static unsigned long cluster_alloc_swap_entry(stru=
ct swap_info_struct *si, int o
> >               /* Serialize HDD SWAP allocation for each device. */
> >               spin_lock(&si->global_cluster_lock);
> >               offset =3D si->global_cluster->next[order];
> > -             if (offset =3D=3D SWAP_ENTRY_INVALID)
> > -                     goto new_cluster;
>
> We are implicitly dropping this. Does it mean the current code is wrong?
> Do we need some clarification about this?

Sorry, my bad, this change has nothing to do with this commit, I'll
drop this change in the next version.

>
> >
> > -             ci =3D lock_cluster(si, offset);
> > +             ci =3D swap_lock_cluster(si, offset);
> >               /* Cluster could have been used by another order */
> >               if (cluster_is_usable(ci, order)) {
> >                       if (cluster_is_empty(ci))
>
> Thanks
> Barry
