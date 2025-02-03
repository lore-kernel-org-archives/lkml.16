Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB45150980
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 19:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738610602; cv=none; b=mn3RFAM1vOVY3dK9Zskz9E6VCPRltRzgrLmaps6pNw6bAQ8DWwmLX+L4nyKuZt90zPHa4+i2JbVC3i8nRREqb0cJUxs5nowsH05mGGIjK6Gmd2uJbrrziY7RkAOCHQIY+SCDGcJXcQcgZsWZBt8XVaU3Izwr9pvLvqaQgI4bPLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738610602; c=relaxed/simple;
	bh=7PUz2Du67sLYuCInePbU3ylhwCsERpbtgDzsGTEjY9w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PNN1ko25qaxQlJ4/qnlOYOuHPO3kYTkMjMxKCp6dN6OyTB1PfsNcR1N64HcD2Fbm2meQqpuJmgR3xgb9ChW4nuIPEUNV6UnuiMjFTNVb+x99/W8qDcNnTmYmZPMn9wFL8dv4yk2piFr2Z10kRCQUB9AJcWlRRx0iIJNANjysq44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dgOcHzMc; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dgOcHzMc"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5dca468c5e4so2823747a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 11:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738610598; x=1739215398; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RDFXv1F5Ks9LCWQoNvJmEupSyk0aucGYvgHW1w2j/sM=;
        b=dgOcHzMcPQyueMOEgOTDc+5FJLrvPX8xZl9R/h+mO0ChmqM+j5nGhfPZs41HxrqhdJ
         4YfWAqICmDjt1QeNUrCtvFWC1Tf/jzwLYlzz1Xnv+O7qvwEYtCgeqQkyiWz9LaJimsL+
         Y3duPgZ0lGPmAcHqhK3g1L1lcmBFQbDynYgCBwjNiZGOoA7VYpzjPJetoNqsOcRv/MIS
         Qg2MYAFbQSJMM7s5fkFt9tHN6jp0j8HbToqoeUBjbtbvhnKE6iGRo7VXcoEFhn3GdwaU
         U+IijWbwV1MSK5THwKYOQ54VAD5g2ZoOvadktCXpbQHdH2wqu7kVFjU9vCXoLB3fzahV
         UplQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738610598; x=1739215398;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RDFXv1F5Ks9LCWQoNvJmEupSyk0aucGYvgHW1w2j/sM=;
        b=ry9Olzb6EF4OXGOv3TwAc2LMBbIsnw1IjirFd50DUra4RTQfvQ5wS/rnn1OI6g5pkp
         LNCRApc0StvIXPlfq6BTZlDM2BM3n+w9T4wQjYu4SxTTO4hireVmpvPf1fqL1smfCpV6
         n0n0qfeblztYHe5UaQvJDsEYnWRTSHJjFN8/ZkZ6uTotU71TUmXlaLAG4KFdPH4Ifm6U
         iaJON+Ze4gInDui22CQqzVa1HEEmL/y+90Dt93LP5GnH1UjMdLcxy0PI9PF+Vk7hZWis
         WsH5q/rtNLvjYCt5EoOevBT2uI9VMabCrfMuVnkc8ugUwj4eFRxbSFKvp+4cAHXmztv4
         Il0w==
X-Forwarded-Encrypted: i=1; AJvYcCW7TYKosLxwEsYbk230vqnPITj2jkeAo/m8JBWQYppEu1SpXZy4tjcgFON3aGip0JjaKJnovSMZz+SRFrU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYgBKeiyQV5TzWa12Nz+3SedP1v/hB3YA/zgRWubNFoaEJK0/v
	A02ZeSZBAoNra9r1g2Br8fB9jYWn8RMJfzH7D+fKrBRGrrlH7L52kR8A3SgtPZlYyNiR5UF3lDB
	UVPFgT1FKfPM5uD0kmL4kvQiDaMY=
X-Gm-Gg: ASbGncvwaEeAnzJ+lc+6R3uKneI7RZe9+eItVpdzitFvY3lFwYkQ7Yd8G6+H71/hN3B
	tuLd00XN6mnTtqk2MWEtL0n95wG9zu0n1BcHhpbAFj3lZl/drHGD3168q9LqeaS8gsdhQ8+c=
X-Google-Smtp-Source: AGHT+IEYt+RS4nPclH5WXXjLRmq1WCNXZslhmWAX2Lei07l7NVa+K3GfS4WPsttonT3lvcR+jg3QGIJquw1G4gDT5AA=
X-Received: by 2002:a05:6402:2390:b0:5dc:72e1:63ee with SMTP id
 4fb4d7f45d1cf-5dc72e1647cmr16326070a12.6.1738610598400; Mon, 03 Feb 2025
 11:23:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250131001806.92349-1-vishal.moola@gmail.com>
 <20250131001806.92349-2-vishal.moola@gmail.com> <Z5x3GQAzN3S-plD9@infradead.org>
In-Reply-To: <Z5x3GQAzN3S-plD9@infradead.org>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Mon, 3 Feb 2025 11:23:07 -0800
X-Gm-Features: AWEUYZkX3o6SMugA9aoozPCgNgPCXrMAXYJeYiZLUbTCFY8OHuBfzWm38XDwmC4
Message-ID: <CAOzc2pwCOfniCESzhNg9WE73YXQL7516Fya4Rrwij4CfWSt+Lg@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm/vmalloc: Introduce vmap_file()
To: Christoph Hellwig <hch@infradead.org>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, urezki@gmail.com, 
	intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2025 at 11:09=E2=80=AFPM Christoph Hellwig <hch@infradead.o=
rg> wrote:
>
> On Thu, Jan 30, 2025 at 04:18:05PM -0800, Vishal Moola (Oracle) wrote:
> > +     rcu_read_lock();
> > +     xas_for_each(&xas, folio, last) {
>
> This only maps folios currently in the page cache, which makes it
> usefull for everything except ramfs-style purely in-memory file systems.
> I.e. for the shmem use case in the second patch it fails to swap in
> swapped out tmpfs folios.

Ah, I see. I can drop that patch then. Its primary purpose was to provide a
user for vmap_file(). As you've pointed out, that won't work with tmpfs or
anon pages. I'll hold off on a v2 until there are better usecases for
vmap_file().

> > +EXPORT_SYMBOL(vmap_file);
>
> EXPORT_SYMBOL_GPL for any advances vmalloc-layer functionality, please.

Ok, I'll keep that in mind in the future.
