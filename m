Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53D2233707
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 07:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743580711; cv=none; b=tiXoOevf0TlXCmefJun38payKslfz5xfbyiajmz+z44W9mlXkVCHzVXt4TU0eJWvM79VyVvUfwcYrAsNZuqR0ZltJLJZAajXFiaB0G+I/+CDHAOCVUjGZBP4gLwQWscv9tsyH97l5prw8o/6NLq5ghE6UwNYKhxOro7elI4i7fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743580711; c=relaxed/simple;
	bh=xNZG4kFoGbGB7pheqiYG3iEXKZBGzv6hERVCUWp27mQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GNQUxGi+9UiaTAoVm4VRd/iDFVGhX9DY0p2u7ZANv3cQ4eni7tLRndV6LH4O73qwp5oUVMhAoE1B9BahgZ+uDPfHkM1nalsSP9ZIP6AftoU+Lem/QE+X1cuI5j3idiJWXtqRHya8XrX3rB8zv2Sv/Pn0tP1K/zSkajyTqpXiIGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TF6tKAZg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TF6tKAZg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743580709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xNZG4kFoGbGB7pheqiYG3iEXKZBGzv6hERVCUWp27mQ=;
	b=TF6tKAZgY3OnyDfVa38C/GBuaJwBAtv8OGEu+47r0k7UsPZowXnAgG9t4Sg9wDQ8oR9nEb
	nh/MnTn1OO81qxvQXPpYhow0buDoW80VVEgtBocgT93LOj5aNbEoJPipAtmM6LBFJEOQVf
	WSL7ZJ6wcKIivb0RlVimC9kz9tMu9ag=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-416-AR6EqWimN52MwICGhQnTGQ-1; Wed, 02 Apr 2025 03:58:27 -0400
X-MC-Unique: AR6EqWimN52MwICGhQnTGQ-1
X-Mimecast-MFC-AGG-ID: AR6EqWimN52MwICGhQnTGQ_1743580707
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5ed2a1bfec7so5272868a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 00:58:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743580706; x=1744185506;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xNZG4kFoGbGB7pheqiYG3iEXKZBGzv6hERVCUWp27mQ=;
        b=jGnp0weHTIj0YUBAt5nqWv8t/I/HSpVJdw97YHzdhK5A0nUQBpVQ9Rky+TGRQld4Yi
         O3Whfi/WFNf47T9mATL4jCwwOiQj4Mzt06biZukXF065iGbw+hV1dz/Xk82sbJoTnHX2
         L9TjwYk4zAG73OP8kzhJeub+vsDRTGvRqlFMXs2E8xwCraRsY7KxZ8jH2jsw3cTR3pwp
         EkAJpF+J8Gk8px3stu2ij3IT69SDdWUBBVz/p1+tEOkFFILAu5ZKV3aNFcSrrbTba8hp
         qOFax7Y9pioPoMoit/SB2WR0XqaKeS785VoAMqMo6uFQXAlrSQUVwXfk4QTTrHsMAh57
         G7jg==
X-Forwarded-Encrypted: i=1; AJvYcCX1X26fVTDpE7Cxc32s/ucbl4fVNwLzM1Mzz6CgN22k20lUnbDe+/CU3/7HrmTqpfUUPe436fnHxYRDEwM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcYXAjBKv7FER+RNhcHclUarTnQ+DYeqBfTarKMpYMuKYuZk41
	+7xQB1JMZ6KHhS2f5QOOFfCrQiM+s+Br7HYqATY3jsRlIqznaGch9JwM8nbTUnfV/+5FvD3GgFe
	UjxyrsW0aHVSHDdx32jR3v7mUtVZB1CfCh5hITq0hdJiiQakz6hsgKm/2Gz1+GA==
X-Gm-Gg: ASbGnctUf2SqPE/7xEppF7MuwdJ+CJMU9090yXhdt7lWGIocceT5qMOyQiwZxnt+WNk
	hrFr5C/EP/ZmVibecQSaUruE46tYPhn4yhKqdRohpMuhyeOyUfgNRYy1t6Z4hsCh6pSypA5jHFd
	TcwAjnc2zFB50hfH9jb2Gy2zIekjGFuFWEN0CC85PTgGGN9wrAHjbp0Lu4k/farcrugYJKJ2Yqm
	j0w72iNMdRvqFutx+im4Ru6iGS3y3G3Z7rG7a6tAEkONcw4g1xKhdxOLTEuiVHozQPjuz+2b4Va
	PVDdxvBXlV3od0nv4tIXBONgm2zycAYlzdOVfwL6IDfdkRadP8Vo+a6uHNNjIdUElDgbltW8r4f
	9/Fo62NmbwlCbim68bq9OPYMpzn1axG4eGGGHEuBoIxkwYLTy75A=
X-Received: by 2002:a17:907:7215:b0:ac2:c06:ad9d with SMTP id a640c23a62f3a-ac7a16c1267mr109993666b.14.1743580706555;
        Wed, 02 Apr 2025 00:58:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYj6cd0a2ZmOIrY2+9xoa0kFQ790CUzhth/mn7wiW3bHJ2mcwrNEVMrfPgd8xSJJfNJC6BBQ==
X-Received: by 2002:a17:907:7215:b0:ac2:c06:ad9d with SMTP id a640c23a62f3a-ac7a16c1267mr109991066b.14.1743580706042;
        Wed, 02 Apr 2025 00:58:26 -0700 (PDT)
Received: from ?IPv6:2001:16b8:2d97:6a00:6929:a9f6:5863:aac5? (200116b82d976a006929a9f65863aac5.dip.versatel-1u1.de. [2001:16b8:2d97:6a00:6929:a9f6:5863:aac5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac719223e1esm877349966b.7.2025.04.02.00.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:58:25 -0700 (PDT)
Message-ID: <323da53fe2ec06c9cc5d1939a9e003c5bd2a0716.camel@redhat.com>
Subject: Re: [PATCH 0/2] PCI: Remove pcim_iounmap_regions()
From: Philipp Stanner <pstanner@redhat.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Philipp Stanner
	 <phasta@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Jens Axboe <axboe@kernel.dk>, Bjorn
 Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>, David
 Lechner <dlechner@baylibre.com>, Damien Le Moal <dlemoal@kernel.org>, Yang
 Yingliang <yangyingliang@huawei.com>, Zijun Hu <quic_zijuhu@quicinc.com>,
 Hannes Reinecke <hare@suse.de>, Al Viro <viro@zeniv.linux.org.uk>, Li Zetao
 <lizetao1@huawei.com>,  Anuj Gupta <anuj20.g@samsung.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org
Date: Wed, 02 Apr 2025 09:58:24 +0200
In-Reply-To: <Z-U5vIbVDZLe9QnM@smile.fi.intel.com>
References: <20250327110707.20025-2-phasta@kernel.org>
	 <Z-U5vIbVDZLe9QnM@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-03-27 at 13:42 +0200, Andy Shevchenko wrote:
> On Thu, Mar 27, 2025 at 12:07:06PM +0100, Philipp Stanner wrote:
> > The last remaining user of pcim_iounmap_regions() is mtip32 (in
> > Linus's
> > current master)
> >=20
> > So we could finally remove this deprecated API. I suggest that this
> > gets
> > merged through the PCI tree.
>=20
> Good god! One API less, +1 to support this move.
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>=20
> > (I also suggest we watch with an eagle's
> > eyes for folks who want to re-add calls to that function before the
> > next
> > merge window opens).
>=20
> Instead of this I suggest that PCI can take this before merge window
> finishes
> and cooks the (second) PR with it. In such a case we wouldn't need to
> care,
> the developers will got broken builds.
>=20

Normally Bjorn / PCI lets changes settle on a branch for >1 week before
throwing them at mainline =E2=80=93 but if we ask him very very nicely, may=
be
he would make an exception for this special case? :)

P.

