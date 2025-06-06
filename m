Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55ACD1A38F9
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 16:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749226408; cv=none; b=SmbB1Ob7HAG5/aRm6sHtORQDMcI8xzVB2t+fQX3mx6xaHTH5eYQyhwGmcHeB7h2zZ3xr3bn/JLyPgZlhcInGpDLGOHkqhmqkeTtRwqf0JpHCu4bFCD24rCH348yyT6PNUFui8HdUJ4Yi56oOROn9aVc+eXSv18Sbe1R0oEvAXyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749226408; c=relaxed/simple;
	bh=3c+OLiucfxV1ODvVU6ZZSFapIkuKRd0oSKGghYOHS4Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QfqKj6H2Ux+WTQHe7+XmGukjl/VqHt2PKqKFMBUkpi8x0v+kJGolmyL7u820kloYFegGomsZqMW8jDgKWeVQdDV9LJ3RGi9z7iJXhfj1qloieRZSJqV7Aybf0zMRuUtELzCgJsjkLQkfL7UvO23n8DQzEPC41CgTkdV7bU4bHTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=UvFYjfJ7; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="UvFYjfJ7"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4a58f79d6e9so21728681cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 09:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1749226406; x=1749831206; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3c+OLiucfxV1ODvVU6ZZSFapIkuKRd0oSKGghYOHS4Y=;
        b=UvFYjfJ7E1AYqFNifHJ5vAD1nNFuopa6CqxKS7CzMVV/zdci4oALssnI+fKuU0bZIE
         54K38UM6kiDb+UTarbiwFst1UU/sCv4W62u2CH6v4wUWp9qQluFTFNwyyJWlWmkdiBh3
         9nIsaak6uIFKEiO9EkDUqZNIEG08+hZUo5QBI1ESMZQgyhNaKdzsNETC0YmFExWflKoB
         JKUwscRQ0Y3/bI5WU5lZeHUQPRsnAYBj0fDOMUEFpAhFqdGHnYVZHDf/7EaWeyrr/sP0
         OrrCoJiE+ra/XIZkh8DIXwXjZwtMJ026l1OZPG6mrgDcufElcIM41E0/iDYQA+7bkf6C
         YXaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749226406; x=1749831206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3c+OLiucfxV1ODvVU6ZZSFapIkuKRd0oSKGghYOHS4Y=;
        b=dnB3XBzWn5N1zbClBEcE3EENBcTKUUO6zhUQ2ni8S40YFUfvY876cUVqyODeVPNGTI
         E5lf/NFRk9+nEkUbw/qstcjDZgwamNNj1ikghlq3wRRz9z1dWFAB4AKvnxOfSRiz7XD7
         jINzNGLTKL1WJNCwMDMZ9xR4CHc0KWNvZKuttVUczTGSJpA06syzMZjvF2ykuNw+9YXA
         EoKXkHkKGn01tlyZ9m4Q2Ae8b466agd5xR2hyoosU0Gi0gCb5xQPVoTJnhcRY0PUlAuH
         UKs7zTnmhFHhtkn2EHMXcUAg1PCNtOlQN5aAHb/CpbIsNBx6QMmGy7SQMYGjrBGySlQO
         qgdQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3nShEPr3S3i+WihgCP56hVRN8d0RggwlP7LplHLfizCEFCmRhR6b2dKK7lYvHaK7pP2OBI15CWgNMmUE=@vger.kernel.org
X-Gm-Message-State: AOJu0YycIFAcFtqmMdlm4tF7/AqMnRk/BNT1hSWCUeDGHBidD5aaTUc0
	eqmv4aHolN5/udHzTroMjuklvES/VGuzYntioJUvN6uS84vtaxazZknkQ3XFnBxgCA/hE8Qpd8l
	bJLhyrE4mz8IGJqRfxnhPeGIBF0ExMir15eJyU9btRQ==
X-Gm-Gg: ASbGnctPJey65RMWj4XBBlt3ZL4YixT/Voe98Mn3/vxHXz/2mA3G68ruBsLQ3PKziTc
	8x7px8VizshJHmRMVH1WnChPsLrkUnvblW7fW4m1pjBdTEmUorfQoee68AIo2CP37Go4najcpgD
	nzFYr4QC/keEqceJ8VegSXL3S0Xu0q189KERfOFBCa
X-Google-Smtp-Source: AGHT+IFvzMrq1D8K+hzBBEnf8MX2QMLz487m/utY5M5EEZJ2BtgId21E4drPVwNqY3sPf1S055BglVV7u01P7fkvw7c=
X-Received: by 2002:ac8:4f83:0:b0:4a6:b603:c37e with SMTP id
 d75a77b69052e-4a6b603c3d3mr34513811cf.2.1749226406222; Fri, 06 Jun 2025
 09:13:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
 <20250515182322.117840-2-pasha.tatashin@soleen.com> <mafs0msantryd.fsf@kernel.org>
In-Reply-To: <mafs0msantryd.fsf@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Fri, 6 Jun 2025 12:12:49 -0400
X-Gm-Features: AX0GCFuCUPrJe40udzBKChlGW4OEJnp5DLFei3Onke-YT3nN79_JOUAzGKiEZOg
Message-ID: <CA+CK2bAc6joxJPCTdNkn8JxWA0MWtQfASiwNuHA68Nqt+7O61A@mail.gmail.com>
Subject: Re: [RFC v2 01/16] kho: make debugfs interface optional
To: Pratyush Yadav <pratyush@kernel.org>
Cc: jasonmiu@google.com, graf@amazon.com, changyuanl@google.com, 
	rppt@kernel.org, dmatlack@google.com, rientjes@google.com, corbet@lwn.net, 
	rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, 
	ojeda@kernel.org, aliceryhl@google.com, masahiroy@kernel.org, 
	akpm@linux-foundation.org, tj@kernel.org, yoann.congal@smile.fr, 
	mmaurer@google.com, roman.gushchin@linux.dev, chenridong@huawei.com, 
	axboe@kernel.dk, mark.rutland@arm.com, jannh@google.com, 
	vincent.guittot@linaro.org, hannes@cmpxchg.org, dan.j.williams@intel.com, 
	david@redhat.com, joel.granados@kernel.org, rostedt@goodmis.org, 
	anna.schumaker@oracle.com, song@kernel.org, zhangguopeng@kylinos.cn, 
	linux@weissschuh.net, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, gregkh@linuxfoundation.org, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, rafael@kernel.org, dakr@kernel.org, 
	bartosz.golaszewski@linaro.org, cw00.choi@samsung.com, 
	myungjoo.ham@samsung.com, yesanishhere@gmail.com, Jonathan.Cameron@huawei.com, 
	quic_zijuhu@quicinc.com, aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 12:03=E2=80=AFPM Pratyush Yadav <pratyush@kernel.org=
> wrote:
>
> On Thu, May 15 2025, Pasha Tatashin wrote:
>
> > Currently, KHO is controlled via debugfs interface, but once LUO is
> > introduced, it can control KHO, and the debug interface becomes
> > optional.
> >
> > Add a separate config CONFIG_KEXEC_HANDOVER_DEBUG that enables
> > the debugfs interface, and allows to inspect the tree.
> >
> > Move all debufs related code to a new file to keep the .c files
>
> Nit: s/debufs/debugfs/

Done.

Thanks,
Pasha
