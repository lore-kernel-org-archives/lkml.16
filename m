Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D5B2620FC
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 22:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747780094; cv=none; b=TM4YG63f7uoAVR8TPetCv1W2h998E6r8wq1sYQNMrts/WG/1tLX4Szev4qnDvR0d6S+4yse5wSzFEOdrYCLhGknJCWH+5KAJUZbpo7r2vbNhbRdPmoWQOcnmq8wL8fXlmU7DUHpMe4SXGpt73abdd2B5lvZZOucWIknxaRgJvGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747780094; c=relaxed/simple;
	bh=yChqWPEdp9cZ0Ga5eFD3Bpq++BDAWVx2gbBXO4TT6lA=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Y3sZoGG06bLVixMe0wPImWKN6b3UwDzmsmJ2K/w4p2XZUtc6KTY333LJd4yG6KBM5kSF8gq5keRI72Xlr4wPqrkKlmbKCRgEr+cePLRkLXerXcTDLLBqRk/7lRDzreNlcxF0Kz2tnb/zG9UoGOvvxGmZ9Y/EfRjvcOVgSYwZZUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=dMW8B8aL; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="dMW8B8aL"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7c922169051so370740785a.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 15:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747780089; x=1748384889; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lms3OE/sNYy0oTfqz7IHuFMIn+Z4wTwAkMcVtFfs6Vw=;
        b=dMW8B8aLpAvfwOfH2iGB7027kh5XRgpTfde+8QAOPDaxpzhHFMQIibyjjOH0QCoTBo
         MqRwR4w48rWIIedH3pYbgn+Li5ZRqQOPAtGa7FGrdbsP/uBix0GUEiM1UE1nmf72EMMU
         CUmwSayKzTbk7IX9uHQSwcmBW0u8R6hCCIiW02J+PraCXVbiy0Uk5dsfe9C2mmjY6IoG
         Vbu6qH/GyBTEuhhxWUVOxaKeNnVe+OmnT1BLtQmhH2abh2BM18U2pXm8rpC3ZCScHEnH
         sDG7O0ZFvibCBCIiY7iau/RVzZg8CchQj+Ftx4X8JIyVPZp91tQ4jmC+i6wmEn1XFtj4
         uOZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747780089; x=1748384889;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lms3OE/sNYy0oTfqz7IHuFMIn+Z4wTwAkMcVtFfs6Vw=;
        b=Vfwkk1jj1ubYYa6D9ZwywmleOcwfo6jggxz1NvX+cLrxsHqSbanYPStz0b9SQdI7WR
         4oye/ORiAJChdbrcvc777aX2uoLt+OLYtcY5fOX1GtvcXNvzBhCZYy89I9CiWE62dIqE
         B3Akoh9/bRCabW9kUKxH/QkheVL9g+Y1x7AboTCyldgndTFSU4XkCgg5hY+YSwiedvUg
         +7o5WappA2xP4aY1sX995oPveEw2Bw3WGSRpStIFlGjMrYutD25Bj1b51ph8rfnRHiLe
         nD6AJCCYwDmru/26M4u37omcHMzYRyD9qcYxZYDo/niwznTUoHbh0RCU+oz1e1QEcGdn
         XIgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDIix07HOXkbfT4HVEkWYg0dPtjEpGreTc7yeNYvuA+SprNSWNtr4wI2XysohS3ygbgsbSZarqkSTn8ac=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDgIbXY2lSkmCYula/Z/JvJlsPPS3UKTSBfqRoLiolBkOwPajx
	2e/b6glQjslHA7Yq/IUAPgjOe/oeuOGi/wSQoStvLmiJtvNsKsNe+AJcbMIdtHICaeSMm/okBeX
	flcte
X-Gm-Gg: ASbGncuxykWhgMRovNbJ3zeof+gw59FF7tI5lnUgD8pKpMVl0sSaL6Ywpo8RWFtm2yB
	y6Z4hgahMlZJnoWFzSdUli9nojdZ94scMl4YH0BnVJGxFrDEm9iPE1f4HE5zDLAjGp38Lq7P+xq
	drJgknHwRdhyTnLVMxhVi/NhEElUYGWvE8akRZv8fmZcKx8bu2ZXhgXxl1n2xoKb/DDA+wobYA1
	MvisykOBHAzgN5fubC1clHZy+6gpZfmY5u1x/nCSTJDjcQhfk4gckx//CFKJXZSW9XiOQPZYaZ/
	2ZjYv9bAhHsNiUOj6wzZHcNJSJeamt7vJsHubpjgmTROdWx4kgfu10SPX+AZ14IeEvX8qJdYAbw
	70WTs+48TrFEdDw==
X-Google-Smtp-Source: AGHT+IHpL8cZf2WFN565+0ROiOlrp0pc2fmKMVUb4mjZFaH8jHRKJpqzsgtzrJbWKBwduWNsVxAN+Q==
X-Received: by 2002:a05:6214:2b09:b0:6f8:f1b8:fbd0 with SMTP id 6a1803df08f44-6f8f1b8fc65mr5866046d6.17.1747780089584;
        Tue, 20 May 2025 15:28:09 -0700 (PDT)
Received: from xanadu (modemcable179.17-162-184.mc.videotron.ca. [184.162.17.179])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b0883b7dsm77376766d6.16.2025.05.20.15.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 15:28:09 -0700 (PDT)
Date: Tue, 20 May 2025 18:28:08 -0400 (EDT)
From: Nicolas Pitre <npitre@baylibre.com>
To: David Laight <david.laight.linux@gmail.com>
cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
    u.kleine-koenig@baylibre.com, Oleg Nesterov <oleg@redhat.com>, 
    Peter Zijlstra <peterz@infradead.org>, 
    Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 next 2/4] lib: mul_u64_u64_div_u64() Use BUG_ON() for
 divide by zero
In-Reply-To: <20250520224314.7f929b5f@pumpkin>
Message-ID: <4qprn4oq-qo64-r3n9-9rs7-345o552qo3s5@onlyvoer.pbz>
References: <20250518133848.5811-1-david.laight.linux@gmail.com> <20250518133848.5811-3-david.laight.linux@gmail.com> <pr79o4o1-5345-popr-r206-8qo76523657s@onlyvoer.pbz> <20250520224314.7f929b5f@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 20 May 2025, David Laight wrote:

> On Mon, 19 May 2025 22:21:15 -0400 (EDT)
> Nicolas Pitre <npitre@baylibre.com> wrote:
> 
> > On Sun, 18 May 2025, David Laight wrote:
> > 
> > > Do an explicit BUG_ON(!divisor) instead of hoping the 'undefined
> > > behaviour' the compiler generated for a compile-time 1/0 is in any
> > > way useful.
> > > 
> > > It may be better to define the function to return ~(u64)0 for
> > > divide by zero.
> > > 
> > > Signed-off-by: David Laight <david.laight.linux@gmail.com>
> > > ---
> > > 
> > > A new change for v2 of the patchset.
> > > Whereas gcc inserts (IIRC) 'ud2' clang is likely to let the code
> > > continue and generate 'random' results for any 'undefined bahaviour'.  
> > 
> > clang does exactly the same as gcc.
> 
> Did you see the recent 'rant' from Linus about the way clang handles UB.
> I'm pretty sure 'divide by zero' is UB, valid options include.
> - Jump to random location in the current function (what Linus was ranting).
> - Jump to any random location with any register values.
> - Enable user access to all kernel memory.
> - Permanently damage your cpu.
> - Make your computer catch fire.
> - Send an ICBM to some unspecified location.

LOL

> If you want a 'divide by zero' error you better generate one. eg:
> 	int n = 0;
> 	OPTIMSER_HIDE_VAR(n);
> 	i = 1 / n;

As you say then. As long as the resulting behavior is coherent for all 
division flavors on a given architecture.


Nicolas
