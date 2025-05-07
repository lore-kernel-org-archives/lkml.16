Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A898F5E
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 01:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746580555; cv=none; b=XE6o/LCoL8TGlYBOMxH24WoeIs8ep+e30joiHtc7H5Hli6wJERPogaK+5N/CnN6vZBDBmhE//SLsrwxn0QqBAX9m856KsBY3K1aW9H+qF6PQZoJuU0bFwGGcIPoUGJod8JCANX5vcovsnByd10YPIa1p9RVUicsjbpB+3m40glg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746580555; c=relaxed/simple;
	bh=PJGXADhPgftHf4790J6bTo3LvncDFYONRNlduMuQnLQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dPEG7j9iaNRgkvrLIzS4EBKcsCQioFx205UlSp1A7+zX2Xru69iZf+VT08PZvFSH7K2lewSjvEmRtl2jZoiQPFptCA6hWV+N0EThUDB4JwglcfJDcIZCMQlXMy9oHNkM59JiQjHowu6Kgs3YKEsiMdN1Uzg1xOH7JEgnDKqweSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ghv7mB+/; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ghv7mB+/"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22e39fbad5fso53605ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 18:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746580553; x=1747185353; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oI9dvuYFSW41PetZu8+C11r8U9aYDixgfsHjUdZoR8Q=;
        b=Ghv7mB+/SjUpHzvJNIUSJUBfDP9d/j42r/qarfES45zUEoFJkNTd90LRgUyCV04Z53
         qq9bSk4pVAhIFJQVVTNBVNZpcf8PZhVg1pOAy/TBpOEzAKUKvf0hjXy8Yau/MM6pid3j
         WtLnatOe8v24pZRsbwrbGHJFxY524lRZJrT1B8hIIHVvERxBlf+O7F7rUO5RI4uwCnfc
         IdzE4tdUUhcBk63XjXmryYfxZ1PD4anlgQ2Se/7OV1HAQj+AWILuuvoC89sRKrgcdOdu
         THXQ+e2sb0eF3c7Et95ljooJPwsaqBpgrreMhYb/VHSM6jGWmslmpnGFg+abhKGM3xD2
         F5vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746580553; x=1747185353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oI9dvuYFSW41PetZu8+C11r8U9aYDixgfsHjUdZoR8Q=;
        b=uBId36fqw4Z3okgXFvVHnaly7kSWv/vT02lqfJ4QLURvsKQlcJDNlfkXkTDob0QqOW
         edVds6hQ19uYXKJJlXSyHAVOshT1n57YFUJyHyFeFvpa70RAFjLarN8kYv6NfADNx5U1
         EXpaVeItra/Yv0IVDsA6E1Ko5Lpahq2RjHRH4K7VsjEGvLouewxkmJr946e1Dg7bACks
         PH8JXPXh3yJjmhpMjIv+bV0W2KoF8ezKBNN2dxpVEGrdNugA8qq6ZjtgBGf/7cs8vN+o
         O2vU2Uixb2jPmksDESPh3GBQQx6AcPBip9/eY6lGmSTudqnfDkY/ihnx8C7QeK4KewZi
         8rKA==
X-Forwarded-Encrypted: i=1; AJvYcCXn5z0TF8+yECSVJL1u1HHE9Bm8I6UoyJK+qYANcbt8WegVd40+3tgDRpZXe6LlODzj1fReFdEYQN5czB0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzG1UpPKT9JtzG0vgWg10zrsMpRgwagDTdlDV6xnrgcj/hLzs+r
	PlpzceFCdswXLgLLe0F7nWuGs+HwZLT8FajH3/aPNaOBFWrkb1qO+cm15km2yzMFgpQTRRToani
	SG83y4tE1EFImGbv9MyYPyttmtLxqjosLZgjf
X-Gm-Gg: ASbGncsULc5JFEr5RWJlbFefKtFoLuMSeqpengxIp1rQS4PV7hqQdnRwJ9dgvvyiYtq
	tV+crACWb7sVyizppcrw11EwMjkWfhsBf74tp8srQ1TkBR6t+oM7ogjxywP7nWDZmgnN0UEhIIK
	4ahleCQ9s4d+VYGO/USLDEWc2yh+FtTxEhr6V0BVhSbCSCDlaYgtc=
X-Google-Smtp-Source: AGHT+IF64r1XV/UTd8/0ODGcdklsJP9ZXTT9L0J+KnSI3mOMSiLbsNkGeaQ+3WDmuLUAtwcZxubdXugCorUmCh9N7IU=
X-Received: by 2002:a17:903:198d:b0:216:6ecd:8950 with SMTP id
 d9443c01a7336-22e62a2f82dmr714135ad.19.1746580552732; Tue, 06 May 2025
 18:15:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502130828.4071412-1-kirill.shutemov@linux.intel.com>
 <20250502130828.4071412-6-kirill.shutemov@linux.intel.com>
 <55c1c173bfb13d897eaaabcc04f38d010608a7e3.camel@intel.com> <aBqxBmHtpSipnULS@yzhao56-desk.sh.intel.com>
In-Reply-To: <aBqxBmHtpSipnULS@yzhao56-desk.sh.intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Tue, 6 May 2025 18:15:40 -0700
X-Gm-Features: ATxdqUFj6OOGJl4u4NDEeHbj2QFi6gwUbyBFBzHWdPZhV4mq2dQvBXHS3gCPlyY
Message-ID: <CAGtprH9GvBd0QLksKGan0V-RPsbJVPrsZ9PE=PPgHx11x4z1aA@mail.gmail.com>
Subject: Re: [RFC, PATCH 05/12] KVM: TDX: Add tdx_pamt_get()/put() helpers
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: "Huang, Kai" <kai.huang@intel.com>, 
	"kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "seanjc@google.com" <seanjc@google.com>, 
	"Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, "bp@alien8.de" <bp@alien8.de>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"mingo@redhat.com" <mingo@redhat.com>, "tglx@linutronix.de" <tglx@linutronix.de>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "Yamahata, Isaku" <isaku.yamahata@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 6:04=E2=80=AFPM Yan Zhao <yan.y.zhao@intel.com> wrot=
e:
>
> On Mon, May 05, 2025 at 08:44:26PM +0800, Huang, Kai wrote:
> > On Fri, 2025-05-02 at 16:08 +0300, Kirill A. Shutemov wrote:
> > > +static int tdx_pamt_add(atomic_t *pamt_refcount, unsigned long hpa,
> > > +                   struct list_head *pamt_pages)
> > > +{
> > > +   u64 err;
> > > +
> > > +   hpa =3D ALIGN_DOWN(hpa, SZ_2M);
> > > +
> > > +   spin_lock(&pamt_lock);
> >
> > Just curious, Can the lock be per-2M-range?
> Me too.
> Could we introduce smaller locks each covering a 2M range?
>
> And could we deposit 2 pamt pages per-2M hpa range no matter if it's fina=
lly
> mapped as a huge page or not?
>

Are you suggesting to keep 2 PAMT pages allocated for each private 2M
page even if it's mapped as a hugepage? It will lead to wastage of
memory of 4 MB per 1GB of guest memory range. For large VM sizes that
will amount to high values.
