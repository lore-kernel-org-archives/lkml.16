Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D1A17A31D
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745444237; cv=none; b=j4bOEeHJ8enP/w/ppjOVEd1Zt5N8Hkz50y0TAFoe5lABvCpVpPIClczHsYkxaYsvzqC0jSYPKRrOOCFb2+nHGEx17pYA5VD0hBFthDJx3KO/FBg0Lf/m1+HNBIPHWelKPEJ/7PN/rGsnJocnwVikInSizcbgnDIeJe8xtg+7Seg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745444237; c=relaxed/simple;
	bh=YRcSwbBolFQc8nSwL5sHrbHpYScE/u7Jhma2RqHz+j0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CuTGN1yhfBBcHVue+s4xyIitoHwJgnw2AQHscOQyx8GYWOHNvzsxWiRkXfDE+dy0HwrO+fQ/Z+FYC1W+f9kMfm8BOmKi1o6COdu+kQsFJBgzE1wO4lNXTTpHWfZK4Doi8+DvfJ6RvAjbkSzqmvwoswXxghzym0W+HeLNgubgZn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PQikW6i6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PQikW6i6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745444234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S6zpdAzGqU8En65zRDm3svQdlzjoBQCqoHavCUGrR84=;
	b=PQikW6i6NsHR9+TaHuZzwOJ1CV9G6ib6BM6p02vjQF1Dup3nX+By0J/HXYR1LZKjOEYqyI
	JYtt8Ch8trKMlw+w+Pos45YngRoDYr3ODa9FYCpsms3D2aJkvbGj8iNeqeKEVSoJb9TSPa
	kbD/O2QjfGSRDoLb2X6sqTTNpSHpXA4=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-5aZj0WBXNzSUjH5ymlUUqQ-1; Wed, 23 Apr 2025 17:37:13 -0400
X-MC-Unique: 5aZj0WBXNzSUjH5ymlUUqQ-1
X-Mimecast-MFC-AGG-ID: 5aZj0WBXNzSUjH5ymlUUqQ_1745444232
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2265a09dbfcso4457655ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 14:37:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745444232; x=1746049032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S6zpdAzGqU8En65zRDm3svQdlzjoBQCqoHavCUGrR84=;
        b=ZMMdYR48PEhC9tKTXecoLzAtLlcsfTgebCoFeIxgTSvXacJ/PGaxKVEBkfyeaAFM/M
         m0Treg29UtQsz8tOcwx1AqcuXGlKG/LObZZ+kzp3iKjfUa5CV0i9BJ+1Ge9M8Yxo0l9m
         /nMCLv9q/BGVA2TTQEXONqp+XXEv2M7QO6vWrAp3Pn0by5lv/7xKSrYfJIj8dbXuDFh2
         S8yuPoNft1VZOxPFBzOOyqcwDBLQ0cOhTeXmxEXv45RY84LCoz7li+mQ1b23MV1+/I82
         WVqTD0mfZwa3If10BJRa2+mZl3ggl+c5jHC/l/PVnUu17GPm2fWdAbVgFzulZc4ODyqA
         U0qQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8IgjoEKTfGe24Ad0gwWe2rqigZx42Duj4LrTtckcxbPaThVoVyBvYY2+KkBhZSOVSLbTdxydnOQMPNng=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkR/EtpvxbTUsm7qo73ONBHHBDNZeizwJfM0MM9YGRczzsVE1Q
	sitPagOnYLO87kFxpJNe8OZz4rWnp2bfzL6q1a4/8m3T3W0zMTSTYFYrUdpFXueGnG2iVoLGanT
	U0GwOqnc5VNPNlEraF7wkPwSmGFj2O7P5MyP18X0/MvVASxYk7AnCyJFQozJahMKd5+vGxUThbQ
	UTgcWhwX254h2nPVJnfq/SNj4gzfKqECTKNpzs
X-Gm-Gg: ASbGnctTlFS4UOGAVOcg4wQ5SwqQJCmEvMAEzqwIWTytcQrQrbfflIesNg8aAtZyicm
	mGAIEpn8X5vb6Gtz+5Ozp3/wzAs7U8CXIovfEm6xnTL0dyodFEW/0UTNgxMXCfceuqlA=
X-Received: by 2002:a17:903:1a05:b0:227:ac2a:2472 with SMTP id d9443c01a7336-22db3c1ca14mr1355515ad.28.1745444232106;
        Wed, 23 Apr 2025 14:37:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6sgY6I2pxXuZTSudbtJ4lUZ6TLEnhs0F3igYXH6AZ+EY6Zv83sSbUFt5Qk99Fog6na5uT4lIOLxW4lG7nCS0=
X-Received: by 2002:a17:903:1a05:b0:227:ac2a:2472 with SMTP id
 d9443c01a7336-22db3c1ca14mr1355385ad.28.1745444231858; Wed, 23 Apr 2025
 14:37:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250422092250.71bd2347@canb.auug.org.au> <20250424071419.29a1b93e@canb.auug.org.au>
In-Reply-To: <20250424071419.29a1b93e@canb.auug.org.au>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 23 Apr 2025 23:37:00 +0200
X-Gm-Features: ATxdqUHnxJLIdPIRzb9QzmANW3tx9w6vylH638YfSUGCvlQgJ0mMbewFLAbbspg
Message-ID: <CAHc6FU4FDOTHVWZw_+CwwpKQ62K-fhaV-mStdDW73MnGq0TqLQ@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the gfs2 tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Steven Whitehouse <swhiteho@redhat.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 11:14=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
> Hi all,
>
> On Tue, 22 Apr 2025 09:22:50 +1000 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > In commit
> >
> >   ae1d809fd0f0 ("gfs2: deallocate inode in gfs2_create_inode")
>
> The above is now commit 2ba70fb39555.
>
> > Fixes tag
> >
> >   Fixes: f1046a472b70 ("gfs2: gl_object races fix")
> >
> > has these problem(s):
> >
> >   - Target SHA1 does not exist
> >
> > Maybe you meant
> >
> > Fixes: 9ffa18884cce ("gfs2: gl_object races fix")

Indeed, thanks for pointing this out. Should be fixed now.

Andreas

