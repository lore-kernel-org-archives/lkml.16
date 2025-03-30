Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3281C5F39
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 13:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743342046; cv=none; b=sX3cBQV6AqO409dSjk0B7J8Uyfn/JABD7w5vR05GjnOZG16445qOXXfWkI+nSoSFcSaIiFA9Ks0RAEG+hXS8v4DYQf7Lh35RQLu6ZMHfcQCwXte6wx4PDtVI6LGub3IZr35o9Mnj5QSpCDL0BQb54tUSbAIklIAgXntYFfawtQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743342046; c=relaxed/simple;
	bh=AzbIDTURk1/ZlCJhxGl4l2okaIBkk6ggWWvSj3ORjU8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rPT4Ur/hEZ7ulCIr3QXOQUpIgrnnprWJvnlWyMXtYBc5cRBrXuaVxyH+rbz4Zlm9yFlHW3Gmzn8s3A0oUtEj4a5PjBu4TdpzhecEU08P1kLvNF16vG81cCyhufmQrDUl1StWuuyWINhkiBZIjGUkd9VJnZi8E6Lvbx85jkGDeSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e/HrX/XA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e/HrX/XA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743342042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lrzbGR6N+hFcHlPVzb3NUni2wGtFwScmRug3LxSD4IA=;
	b=e/HrX/XAE/OftcuKCQDI3bnfdzJGvYTnE772mOBR9akVq5o0UhYFc+oL7FKcNGzIFb/hrs
	UY9R7iBIYvxGF90yD3iUB7iC9QExb1liMrlLk/DRI4HUSMlAcsGiuVRFVKjJYh3Kt0+RMl
	lyHqrouuISmO8yZIUQa9IqZ+bROEIt4=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-O6II67tpMDixXX09mQTTGg-1; Sun, 30 Mar 2025 09:40:39 -0400
X-MC-Unique: O6II67tpMDixXX09mQTTGg-1
X-Mimecast-MFC-AGG-ID: O6II67tpMDixXX09mQTTGg_1743342039
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-524021ac776so1014693e0c.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 06:40:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743342039; x=1743946839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lrzbGR6N+hFcHlPVzb3NUni2wGtFwScmRug3LxSD4IA=;
        b=kYojvM/w1ysvpyqCmVOpVfX/anzHdtrlIo2u/OMskZMexZ7T5ZXpLHpISrjxHG3vp/
         NVM3vxLDGm/vKIzeo8hWL634NvZtpSpioWkR3KEsqbvfzB9VcMcG2q9URBu1CBikgQqF
         8QhYo0NovFcAy+BrlPVwMF/qkJMOPTUjjJGX1mco5YpaHSZhdfmdtVnDQjdEmOXvUQHA
         MX3Cp0TZONx2rqTti51Lw5DiUbbKYKyK2H1qiUl4e7+IbdZaVMPnnBakpxblG1xHdv+6
         iRuN4qkmWqQ3tAkz5B/l6BRkXJr6cYwcEEl/kw/kVwhHEmUC7I48JVmE8rEWS1OhAq8c
         H5Kw==
X-Forwarded-Encrypted: i=1; AJvYcCXqUVlPYqMRe/Nyrs76PdK7B6MDMXT2OvtWB+pbWbgojekUV/Z+Dy7ghdOt6qIgOQg07gxLjClLOXdAvM0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNNsyJL5caE8toqEFwuGyY31veTHlcfsw8MN0eTxJfM1JrPFVF
	C665F+surNRZtSX1qBjdblhN8oCszPs6meHtPUYd12wnP11quqzUjnsI0Uoo76xMtobyOgyPavO
	kqXvHauSMW5hK3sD4uLeOhAx55VcQLEbsB9/E7uFoubikTqbW1Wi/bqnpjF5xTeVRafyzQg8VpZ
	fGX+k9gQsE3CHAs1/A8bWA8LWU3vlzw5pwDU69
X-Gm-Gg: ASbGncvzfYk1zqcBtVNfYY9Z8FRTTSvhtiPEwULA6XaPDj4En28aLzYXyrRBRjattvB
	MD4+jJzVdZHGt2ZYkxQAb5LbRZeiTgr0AwC05pZJcbIwlG5A20bevUULm6BSFSV4WP7hh9tQ=
X-Received: by 2002:a05:6102:5123:b0:4c5:1c2e:79f5 with SMTP id ada2fe7eead31-4c6d396cec5mr3005395137.16.1743342039422;
        Sun, 30 Mar 2025 06:40:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4c9QW2IwAFyXx28tQjmaxC/xPN5DsLHbqF8VtB4EE/5P1E4VbuQsBZkrB9jqFfoUq3Aft081vmQFhfs6rbbw=
X-Received: by 2002:a05:6102:5123:b0:4c5:1c2e:79f5 with SMTP id
 ada2fe7eead31-4c6d396cec5mr3005384137.16.1743342039085; Sun, 30 Mar 2025
 06:40:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319064031.2971073-1-chenhuacai@loongson.cn>
 <20250319064031.2971073-4-chenhuacai@loongson.cn> <2025031943-disparity-dash-cfa3@gregkh>
 <Z9rYQy3l5V5cvW7W@t14s> <2025031942-portside-finite-34a9@gregkh>
 <CAASaF6zNsiwUOcSD177aORwfBu4kaq8EKh1XdZkO13kgedcOPA@mail.gmail.com> <CAAhV-H7ECQp4S8SNF8_fbK2CHHpgAsfAZk4QdJLYb4iXtjLYyA@mail.gmail.com>
In-Reply-To: <CAAhV-H7ECQp4S8SNF8_fbK2CHHpgAsfAZk4QdJLYb4iXtjLYyA@mail.gmail.com>
From: Jan Stancek <jstancek@redhat.com>
Date: Sun, 30 Mar 2025 15:40:23 +0200
X-Gm-Features: AQ5f1JqlN49O0YbAefe9zsMhgmZfVN4so5yqycLf8bVS7fVGBKegjWIhLF_QxkU
Message-ID: <CAASaF6zvEntqKZUzqRjw4Pp5edsRHdd0Dz7-RD=TTMc1n_HMPA@mail.gmail.com>
Subject: Re: [PATCH 6.1&6.6 V3 3/3] sign-file,extract-cert: use pkcs11
 provider for OPENSSL MAJOR >= 3
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Huacai Chen <chenhuacai@loongson.cn>, 
	Sasha Levin <sashal@kernel.org>, Xuerui Wang <kernel@xen0n.name>, stable@vger.kernel.org, 
	David Howells <dhowells@redhat.com>, David Woodhouse <dwmw2@infradead.org>, 
	Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, R Nageswara Sastry <rnsastry@linux.ibm.com>, 
	Neal Gompa <neal@gompa.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 30, 2025 at 3:08=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> On Thu, Mar 20, 2025 at 12:53=E2=80=AFAM Jan Stancek <jstancek@redhat.com=
> wrote:
> >
> > On Wed, Mar 19, 2025 at 5:26=E2=80=AFPM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Wed, Mar 19, 2025 at 03:44:19PM +0100, Jan Stancek wrote:
> > > > On Wed, Mar 19, 2025 at 07:13:13AM -0700, Greg Kroah-Hartman wrote:
> > > > > On Wed, Mar 19, 2025 at 02:40:31PM +0800, Huacai Chen wrote:
> > > > > > From: Jan Stancek <jstancek@redhat.com>
> > > > > >
> > > > > > commit 558bdc45dfb2669e1741384a0c80be9c82fa052c upstream.
> > > > > >
> > > > > > ENGINE API has been deprecated since OpenSSL version 3.0 [1].
> > > > > > Distros have started dropping support from headers and in futur=
e
> > > > > > it will likely disappear also from library.
> > > > > >
> > > > > > It has been superseded by the PROVIDER API, so use it instead
> > > > > > for OPENSSL MAJOR >=3D 3.
> > > > > >
> > > > > > [1] https://github.com/openssl/openssl/blob/master/README-ENGIN=
ES.md
> > > > > >
> > > > > > [jarkko: fixed up alignment issues reported by checkpatch.pl --=
strict]
> > > > > >
> > > > > > Signed-off-by: Jan Stancek <jstancek@redhat.com>
> > > > > > Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
> > > > > > Tested-by: R Nageswara Sastry <rnsastry@linux.ibm.com>
> > > > > > Reviewed-by: Neal Gompa <neal@gompa.dev>
> > > > > > Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
> > > > > > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > > > > > ---
> > > > > >  certs/extract-cert.c | 103 ++++++++++++++++++++++++++++++-----=
--------
> > > > > >  scripts/sign-file.c  |  93 ++++++++++++++++++++++++++---------=
---
> > > > > >  2 files changed, 138 insertions(+), 58 deletions(-)
> > > > >
> > > > > This seems to differ from what is upstream by a lot, please docum=
ent
> > > > > what you changed from it and why when you resend this series agai=
n.
> > > >
> > > > Hunks are arranged differently, but code appears to be identical.
> > > > When I apply the series to v6.6.83 and compare with upstream I get:
> > >
> > > If so, why is the diffstat different?  Also why are the hunks arrange=
d
> > > differently,
> >
> > He appears to be using "--diff-algorithm=3Dminimal", while you probably
> > patience or histogram.
> Hi, Jan,
>
> I tried --diff-algorithm=3Dminimal/patience/histogram from the upstream
> commit, they all give the same result as this patch. But Sasha said
> the upstream diffstat is different, so how does he generate the patch?

Hi,

I don't know how he generates the patch, but with git-2.43 I get noticable
different patches and diff stats for minimal vs. histogram. "minimal" one
matches your v3 patch. I don't know details of Greg's workflow, just offere=
d
one possible explanation that would allow this series to progress further.

$ git format-patch -1 --stdout --diff-algorithm=3Dminimal 558bdc45dfb2 |
grep -A3 -m1 -- "---"
---
 certs/extract-cert.c | 103 ++++++++++++++++++++++++++++++-------------
 scripts/sign-file.c  |  93 ++++++++++++++++++++++++++------------
 2 files changed, 138 insertions(+), 58 deletions(-)

$ git format-patch -1 --stdout --diff-algorithm=3Dhistogram 558bdc45dfb2
| grep -A3 -m1 -- "---"
---
 certs/extract-cert.c | 103 ++++++++++++++++++++++++++++++-------------
 scripts/sign-file.c  |  95 +++++++++++++++++++++++++++------------
 2 files changed, 139 insertions(+), 59 deletions(-)

Regards,
Jan

>
> Huacai
>
> >
> > $ git format-patch -1 --stdout --diff-algorithm=3Dminimal 558bdc45dfb2 =
|
> > grep -A3 -m1 -- "---"
> > ---
> >  certs/extract-cert.c | 103 ++++++++++++++++++++++++++++++-------------
> >  scripts/sign-file.c  |  93 ++++++++++++++++++++++++++------------
> >  2 files changed, 138 insertions(+), 58 deletions(-)
> >
> > Should be easy to regenerate with different diff-alg for v4.
> >
> > Regards,
> > Jan
> >
> > > that's a hint to me that something went wrong and I can't
> > > trust the patch at all.
> > >
> > > thanks,
> > >
> > > greg k-h
> > >
> >
>

