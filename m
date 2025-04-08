Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938A924394F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 21:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744146732; cv=none; b=I/SWthKwyUN6uFJYHfMcs2J/lNCc+MtVQKMDqdYU0I5Z/fah9KIxLQNTfjN0grK37ln7yeXcAQo0p/y62Exe8FLweAByTyCHXNrvd3iS1/ZQHhDB7sjNA3AXi0cIepwGKvo4+ixUR+7FaCLe7ZjdH14g4joCGjCg0C852HyNLVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744146732; c=relaxed/simple;
	bh=nojSFlVcSyIQcnEdfe6GX8xr2qQICvdL/DiJTdnBrCw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tktyfzT4lMLUwig43ksEj0uKS0rlv8Lr8UOTcwXORcILE7qb6S63ddC0JQiX1pJLZ7DcsIg/22eMxPion3z0+AZ/fKhGXTImtzbEG9zTfWXH806Vr6L+1h/CdfyEDVfrsEFclxg8ywumsqmgvZnAoXMZPemfFDNubdH3jLTflF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mFSeLMhQ; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mFSeLMhQ"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6f0ad744811so32543746d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 14:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744146729; x=1744751529; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nojSFlVcSyIQcnEdfe6GX8xr2qQICvdL/DiJTdnBrCw=;
        b=mFSeLMhQ0TC9RIhWVWNrhxCNWqpBOu2GbKO2gf2c1clmefVq9QeocgCWOd/aJEMSTP
         C/3SpQaO/d7+lFZR7anocAiglc576Hj83w9TbPPexGHwbk1jJ3w9DirPcTeaCyKQCYUT
         voFTKjekUSWw+bP3Fo8WKh/Lnypq6u8GLq+oy1GxTBLXLUthXmUrm1s9yURMZ45NT7Yh
         aMOdP/9i97SZ/Rqs/M1mXMbUebFU8FECNxoBu6Y5R0OO/RIHQ5sCFiTjBTIYynPBpDL2
         vKEtDjbfyUisQ5QC6RMklfWSj5/1iIBa2vs9OrvrNBbVQVNtgSbYXLAGfwCqmBfWeDVo
         A/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744146729; x=1744751529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nojSFlVcSyIQcnEdfe6GX8xr2qQICvdL/DiJTdnBrCw=;
        b=M5Ikc+TDF6bUAj9P2xCrJHgbx7u15UdwhYarktqFFuWQaQEUaV04EuObZpedSjLyu0
         cBWV7fxjfRCBKVH2aZ0T6ZB72/JgSCpthdQ7VWJc2JaKQBJ+xJQaXCojQF7O7DgZIIgH
         RZrtJgUKmxj3+pudx2KX3PROU8xrr9jY9E4svpwXM7Ex2srdSPsSM6Cryfxb1w2I8Uym
         O8XeILqmxWEDfE3h7Gw2tTiWpn7sMWnAGoT7F7cAAKR742C1VrOrKOZw3Dbvh4T7mMH0
         b6wbSSJwyC/I+13JtwU0IWK2IdI/1TtZL7pEaTI8Rat2SGr5QctTztOI9WV9k3qt/gvD
         UUoA==
X-Forwarded-Encrypted: i=1; AJvYcCUK6P0R4Kfq2uf7RDJtdNlrbF/cUJ+0BcJwGa+TBabB4lDidKmmGaMVYUhblLgLo/DWNQfGUZ3zfZlXh64=@vger.kernel.org
X-Gm-Message-State: AOJu0YztdPkasj6Qe9yGYy3s7fBJtTFdypGjQ/sTFGTYb25GnyNr/xKG
	gcHgdQ4sRkQCb/sByFr1hd1qmGMbr5E+dGBDWDDQaOFTqz9hJ32rALIK3jS8JVvBLy5t6rNfW2F
	PDgbInEQq/oWPcc3dWa+WrgBV50p206jLwxY=
X-Gm-Gg: ASbGncvPvV6qhod2TgfPjYHtXKT3pJgYYcOl5Cx4aASWh9IbvNOEwr7rJ/BaFICeHU3
	L/CSEez0yhz4HyPzbYfSfeLwUXs7V8d3QGRHBJdKAnQgZ6RdlEwcLKYeSOXFa4uxk409fVFB7EA
	Oc/YdOC89lAIUVsCbIMZXRRDdgVTpZboN0A4po67ieGJIpRZ1B5KSRzdX3jfHXPL43w8w9
X-Google-Smtp-Source: AGHT+IEv9ekYn/0Xa3K/HDTyJit7j9QjQxCq/pWIh1vT4jWUvxJoY0LpaZLnkQdm2tjJDX9Mg2Ipjc0YDXhZDSZL3bc=
X-Received: by 2002:a05:6214:1d08:b0:6e8:9e9c:d212 with SMTP id
 6a1803df08f44-6f0dba25c4fmr12781026d6.0.1744146729387; Tue, 08 Apr 2025
 14:12:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1743810988579.7.125720@webmail-backend-production-7b88b644bb-5mmj8>
 <0dbbbe9d17ed489d4a7dbe12026fc6fd@beldev.am> <f8063d3fa7e148fecdda82e40b36e10a@beldev.am>
 <CAKEwX=NMjfC1bKTVsB+C7eq3y=O0x3v8MW7KxUfhpg6UUr23rw@mail.gmail.com>
 <f023ba8341f9b44610cc4ac00cf0ee33@beldev.am> <CAKEwX=MXD9EB242WkB50ZBmZgV-CwrAHp=_oE+e=7yHDfrMHtg@mail.gmail.com>
 <3f013184c80e254585b56c5f16b7e778@beldev.am> <20250408195533.GA99052@cmpxchg.org>
In-Reply-To: <20250408195533.GA99052@cmpxchg.org>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 8 Apr 2025 14:11:58 -0700
X-Gm-Features: ATxdqUGe66tCEnADy_Rl2l-6ZAMQMIeuxX6rPnLrvjqmPV0SV9JCUJw_1bUTGWg
Message-ID: <CAKEwX=Ma9phmURz5nyJm0MQrWmXGFLFBPwr8-Cx=zbc473rx9A@mail.gmail.com>
Subject: Re: [PATCH v2] mm: add zblock allocator
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Igor Belousov <igor.b@beldev.am>, vitaly.wool@konsulko.se, linux-mm@kvack.org, 
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
	Shakeel Butt <shakeel.butt@linux.dev>, Yosry Ahmed <yosryahmed@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 12:55=E2=80=AFPM Johannes Weiner <hannes@cmpxchg.org=
> wrote:
>
> On Tue, Apr 08, 2025 at 01:20:11PM +0400, Igor Belousov wrote:
>
> So zstd results in nearly double the compression ratio, which in turn
> cuts total execution time *almost in half*.
>
> The numbers speak for themselves. Compression efficiency >>> allocator
> speed, because compression efficiency ultimately drives the continuous

Yeah good compression ratio =3D=3D better performance, assuming we have an
allocator that can ensure a good enough storage density to take
advantage of the compression ratio. I think the experiments show that.

We don't need the no-MMU upstream-speaking, so with this I struggle to
see the point of inclusion of this new allocator.

> *rate* at which allocations need to occur. You're trying to optimize a
> constant coefficient at the expense of a higher-order one, which is a
> losing proposition.
>
> This is a general NAK from me on any new allocators that cannot match
> or outdo zsmalloc storage density in common scenarios. I'm sorry, but
> I really don't see any reason to do this.

I'll wait for Igor's and Vitaly's response, but this is a preliminary
NAK from me too, I suppose.

>
> We also should probably make zstd the zswap default.

Agree.
