Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAE928B419
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 14:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748444066; cv=none; b=MQFpIu2wxby1kNedTDttYHKHz3FaDLFd/yh7GmKu+kw+vYIyGsuHQVYGYPjCNG1hJmwDrxByQfjalsURA/cyPKVkj4zSTlgJMR5j8oZZTLzLxHhTX/JYrq4ZbzopObzEc3z4tbf4GnXdgtnhzfzK6rfNzi12zPE0Ghwcl3bEjrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748444066; c=relaxed/simple;
	bh=OLQTEynOWLTW2J82I3GAFi2XTNtVPRqouMqsxTdKyrA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dgotu/cK7uDi1SfUFSc5sXr3mwLj6fHj5BQimE2DgUoKxnrQT9DovQSh2o/FNbALfJDCnTXnM1YyFQ2bhf2/BWxLFZgo/ctgCVPJ5mGJBDeZgR5BFwN19E4t2KLlS7bdnPX7hUF8GRggZv8ITMmsvzQ42Jc0gjbQbe85nUqWNuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=nuCVo/Tm; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="nuCVo/Tm"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-476f4e9cf92so30573931cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 07:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1748444063; x=1749048863; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OLQTEynOWLTW2J82I3GAFi2XTNtVPRqouMqsxTdKyrA=;
        b=nuCVo/TmE7nmJDKY/+7G/Fy8f30qRvkosEx1abFb/W+krsSKu4Uii8CPEO6gqCkGjJ
         Y+OQPGzKlr8NKb+TNJi8YoqCA0bl+aEbrcSyvjelx75jGIKU5X2a7a1M7V9f3Z82iiuD
         SP8EAIHnogoXUEHxLC7UgSavDyttjkMTjNu0dl41oZsPuuE/EIvWL0OgFY+8hTQxPT3h
         WhLFvPNQceyXyEgvcrt/bsf0C0kJcwgURKNlFzsbttHpO6fuj8DJwTM7+umuvZ/ic8EI
         bZYUWprE7LmF1WS+Ly/Ny9aEHhj6vF3fMNEOkvRW2uONPd5EzQudBY/J9iR7LwjKcU1o
         B3Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748444063; x=1749048863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OLQTEynOWLTW2J82I3GAFi2XTNtVPRqouMqsxTdKyrA=;
        b=RVTfUd/7NOzim3B/8cA+MP0jgJJEsfHl6Kz7i8uij3h124ofTkePVOvZwSwFkZZfhr
         IwjCAvkIRVrp+7Vs/C00qd/+s18u648JffVAJs5F61+Qkz6C9gMMP3HLF6A/CaAEtrWS
         i2fhWuzbrw+7OhyCIRQdM6DvjqCfS52mUMVENZmUzUfZR6LzgqtihckAd79Qx2nbu0nm
         3Ojv0goyteKnWyYnwjJaAk6WlPkSmLyZn8JDxNBZhZyR/9xYCSNZPCcw3ExFBQn4k7wt
         TNmjnHS1tJapV2KCHo95xWfgEbqBJFgS1p8H/8uv5GE6Z+FXipj095UNzj3YcV9aF20I
         tkHQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0ebd/I0hOPW89HCfykjaIbKfnVCY4kmPRv7aAisok1Qm43smkilculswzHxLmqf/TVB2oRTp4t3X8cqg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLbgJ7fTrEs4QePDt2p5butuFTp4+hOyFgFjyd78ebbSagifMr
	OykMNc4qx614rCH7lFAaFct+6AxTB/mwiICG7ZNAQ3ucQGegaAmMcVufy7DhBq0p5nELuaiBKPl
	uvbzvsE7qVBH0vl8qxbCQsSURenQKTeIV/DVRdcjlqQ==
X-Gm-Gg: ASbGncun3a2nu6Xkh//D1iV5GxiVr9S7mCjWga6hgDXqWzTx698QON7uLRxCOgw8jPS
	kEh9CDA9C7ctvPbZBUDRDLa1IVo+EXHti9E9+OFjDrLEqtLimlbu6MYV9fZjeO7zn1+gSj62qgw
	kJsyCeYSGH1XDLoMxWOY4oGOsToNwvrxWwxhROCn3a
X-Google-Smtp-Source: AGHT+IEipULtuHP8NgolkdOGZlrY+wJ98orFgKSxJBZZ4sZQQx6BiL/ks+Oa5sABai8uN1rdHCGApBJm6ZxwNh0g7ck=
X-Received: by 2002:a05:622a:1b10:b0:472:28d:62b0 with SMTP id
 d75a77b69052e-49f47a0ddb2mr278495661cf.41.1748444063296; Wed, 28 May 2025
 07:54:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417142525.78088-1-mclapinski@google.com> <6805a8382627f_18b6012946a@iweiny-mobl.notmuch>
 <CA+CK2bD8t+s7gFGDCdqA8ZaoS3exM-_9N01mYY3OB4ryBGSCEQ@mail.gmail.com> <aDW9YRpTmI66gK_G@kernel.org>
In-Reply-To: <aDW9YRpTmI66gK_G@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 28 May 2025 10:53:45 -0400
X-Gm-Features: AX0GCFs1Qbwk6LJZXavFVBcYckw_C3R55DAtQO0SII537wDbPP_9ie9BDYZJ2Uo
Message-ID: <CA+CK2bAUfXQ_CSKs4MaaNNcgPx6MRjE6Jk85tKGYUOQBG8PFNg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] libnvdimm/e820: Add a new parameter to configure
 many regions per e820 entry
To: Mike Rapoport <rppt@kernel.org>
Cc: Ira Weiny <ira.weiny@intel.com>, Michal Clapinski <mclapinski@google.com>, 
	Dan Williams <dan.j.williams@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, 
	Dave Jiang <dave.jiang@intel.com>, Jonathan Corbet <corbet@lwn.net>, nvdimm@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 9:26=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Mon, Apr 21, 2025 at 10:55:25AM -0400, Pasha Tatashin wrote:
> > On Sun, Apr 20, 2025 at 10:06=E2=80=AFPM Ira Weiny <ira.weiny@intel.com=
> wrote:
> > >
> > > Michal Clapinski wrote:
> > > > Currently, the user has to specify each memory region to be used wi=
th
> > > > nvdimm via the memmap parameter. Due to the character limit of the
> > > > command line, this makes it impossible to have a lot of pmem device=
s.
> > > > This new parameter solves this issue by allowing users to divide
> > > > one e820 entry into many nvdimm regions.
> > > >
> > > > This change is needed for the hypervisor live update. VMs' memory w=
ill
> > > > be backed by those emulated pmem devices. To support various VM sha=
pes
> > > > I want to create devdax devices at 1GB granularity similar to huget=
lb.
> > >
> > > Why is it not sufficient to create a region out of a single memmap ra=
nge
> > > and create multiple 1G dax devices within that single range?
> >
> > This method implies using the ndctl tool to create regions and convert
> > them to dax devices from userspace. This does not work for our use
> > case. We must have these 1 GB regions available during boot because we
> > do not want to lose memory for a devdax label. I.e., if fsdax is
> > created during boot (i.e. default pmem format), it does not have a
> > label. However, if it is created from userspace, we create a label
> > with partition properties, UUID, etc. Here, we need to use kernel
>
> Doesn't ndctl refuse to alter namespaces on "legacy" (i.e. memmap=3D)
> regions?

Hi Mike

ndctl works with legacy namespaces just fine. We can convert them to
devdax/fsdax/raw pmem, create remove label, etc.

Pasha

>
> > parameters to specify the properties of the pmem devices during boot
> > so they can persist across reboots without losing any memory to
> > labels.
> >
> > Pasha
>
> --
> Sincerely yours,
> Mike.
