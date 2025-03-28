Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666CF26AC3
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 03:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743131971; cv=none; b=t+pRPnqwJtr6Bonmv13h0gOIm7okNdlX5qY81rDhrKpbh0lG+paX7maWqlErEPDDSypQebQxTA9gZMcUiMqzw5kCTiN6+ww5zReo/tV9/VjDrai1zT1qdhIkTICc61TP7oW+sWfyyU3Rawx4m8O14UTZH3/qaWZPSXgAvrFHV/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743131971; c=relaxed/simple;
	bh=xKLuiiCpu+xoq8OZoIrgZ9qQlZBmUq22oML5u8RNPpE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iAotK1PzlXC39YsS1c0XqI9/sib3LlN39yGHKBguutc2VASxZgG26ELts9kANm5QOwDIk8c5BoHOd4vgkubfWsb7qVPZSzM6lkLyEJ5XDqFNkft7VkRfFzYXZUWtcM266kSzyCLDAY3VEUlzoam2CYLjfILLc8pu67TA+bJ7RKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=dWR+L8+Z; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="dWR+L8+Z"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac3fcf5ab0dso273686666b.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743131967; x=1743736767; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J/tfxKxdG8KAKlbVBr2ltb307rk8npaeHZxIMX8F1YI=;
        b=dWR+L8+Z657zIrZ4wAimG8mj3T+JZiSGYvIttB5b9D4JVmegpQBRkgk9UxT44qI9i8
         7gfepRWue40u/g6F4riZhbmDIxkG3M1oHdAMeXu/a4HZU9816xpU5eVHlFmxRhTqlHrt
         xR6/HrPFAj0c5W0CIrO8NC/c4VgWHgf41UuCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743131967; x=1743736767;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J/tfxKxdG8KAKlbVBr2ltb307rk8npaeHZxIMX8F1YI=;
        b=Xgmc9sVn8JZVfj7nhiE7/NQjbUnukjRQX7unLUstraWsWk3ytN50cRo22TbPg9OjUo
         68sVSAfUNbJbYarCjx2fs1MakS44gnx++xdcMtLuDWRF72BX0ntFgIa4MX+j3xIROOrV
         4k90d5W6/aHB+0a296OizAkbDSEAmeA6LZhSWlRfLo5Ur6p0JV+ISQIX0uZfAp94tOse
         M+h9se5jfxVsjrRpEiuvjrLgMwViBF/XFIzm1m/YYsAcSV8jaOOPhqrxhxKh4RdjUkIv
         3LcxjytnT3vTew7vu51S0kwRdOiWUGe11iSeajE4Cd2HdYu+9uDtuuThk795nRyd4jOu
         TNYA==
X-Gm-Message-State: AOJu0YyqhXbOHdUzuxuoqUghz/tbLId0gClzUz4zDwCvJW1mnV+RbLgQ
	4B8FVzz+mgiKQw5+ZU8H3H32la2pCE2DwkuaaQW6Q3gm9GPlc9QLTslggEzuBuMYndjNToI4nyn
	B6dU=
X-Gm-Gg: ASbGnctZT3pPzr61btJgtsAqcRKfqfGE0S/aqM2y755aVg9o8pO6sAI4ylUO/V/Ooa2
	X3oSgDGrJRIlCgZU+xzCbJpOBXshSl48VK9IdAT18hL4ymNkGUaNxlMZv5hPFFWmUgJfv/byFpX
	mqjbYlG+MJgibq7R/tnrFEugq9q4wSn6Pm80/Mm7c7+RRJZKhOdZ7SSQ44Pu/g4vYgoqhjSi1FP
	tn/i+zonwMOMBOO3RR5zMVI+1M8JD4FED5HLYl332dNA/yfCr3QUToY/2u5EfwI3YXPf6aMfA3s
	YxGaLBDkv3uL4Nlw0ccALmJqC3vfiyFL2c3GRZkwTM6Y5nqsJq/KKn8h5Mt4fQXdsY/xJYrWgEH
	Z/1k4yI86wNYOutKJ9j0=
X-Google-Smtp-Source: AGHT+IGRA35FWcTOmjFxHP01AdeLP3FTqalRe1pklGOYnGym+4mR4oizXs7MnkCUU3wkoVAONokbnw==
X-Received: by 2002:a17:907:7f06:b0:ac3:1b00:e17d with SMTP id a640c23a62f3a-ac6fb1606a6mr587283766b.54.1743131967343;
        Thu, 27 Mar 2025 20:19:27 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71967ff5asm86310666b.136.2025.03.27.20.19.26
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 20:19:26 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac2af2f15d1so215455266b.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:19:26 -0700 (PDT)
X-Received: by 2002:a17:907:7292:b0:ac2:9683:ad25 with SMTP id
 a640c23a62f3a-ac6faf46d6dmr553997166b.34.1743131965908; Thu, 27 Mar 2025
 20:19:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327171037.032bf7e7@gandalf.local.home> <CAHk-=wgD9MQOoMAGtT=fXZsWY39exRVyZgxuBXix4u=1bdHA=g@mail.gmail.com>
 <20250327212447.24e05e7e@batman.local.home> <CAHk-=wgW4QfXuR0StSz15jqCs-suuPhfDajKr1bH2qS73cT4dA@mail.gmail.com>
 <20250327220106.37c921ea@batman.local.home> <CAHk-=wiNLcTj2iiE9waSkmpYpu6VQ_q=Zaqi_WmAMiv_MvH4vQ@mail.gmail.com>
 <CAHk-=wjhT_xPdATLmfmdWCM7gKApvTyino_ffko5z1YumJDAHA@mail.gmail.com> <20250327230104.660a4b35@batman.local.home>
In-Reply-To: <20250327230104.660a4b35@batman.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 27 Mar 2025 20:19:09 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh3VnL5Rpuh7tCitOKYDPqWoucFNCh6b3-JR6qZtxCiCw@mail.gmail.com>
X-Gm-Features: AQ5f1JoU0Z4sUiqmC446xEHPXXfEP-GjHgyWlZTHWA9TBvtq18PkGNDRIBQiv54
Message-ID: <CAHk-=wh3VnL5Rpuh7tCitOKYDPqWoucFNCh6b3-JR6qZtxCiCw@mail.gmail.com>
Subject: Re: [GIT PULL] ring-buffer: Updates for v6.15
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Feng Yang <yangfeng@kylinos.cn>, 
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Mar 2025 at 20:01, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> Are you OK with the idea of moving the mapping code into the ring
> buffer code (which I think is cleaner) and then keeping track of that
> to get to the pages with the helper function?
>
> struct page *rb_get_page(struct trace_buffer *buffer, unsigned long addr)
> {
>         if (buffer->flags & RB_FL_PHYSICAL) {
>                 addr -= buffer->vmap_start;
>                 addr += buffer->phys_start;
>                 return pfn_to_page(addr >> PAGE_SHIFT);
>         }
>         return virt_to_page(addr);
> }

I think that would have been *enormously* better, yes, if only because
it clearly abstracts things out, and doesn't do the whole "oh, let's
ask what the VM thinks this page is" which really drove me up the
wall.

It may still be based on kernel virtual addresses (and that
"virt_to_page()" looks odd - you can't give it an 'unsigned long', so
I assume this was untested pseudo-code), but now that code at least
makes it very clear that it knows what the addresses are supposed to
be.

And it also makes it clear that both cases are actually based on
underlying contiguous physical addresses just using different virtual
mapping strategies. So now the "page++" thing I complained about is
suddenly not crazy code any more.

Plus the RB_FL_PHYSICAL thing is not just clearer semantically, it
happens to be about a million times faster than doing
"vmalloc_to_page()" (ok, that's obvious hyperbole, but
vmalloc_to_page() kind of a pig and looks things up in the page tables
because that's what it is designed for).

So yes. The kernel virtual address scheme can probably be salvaged.
But it needs doing things *right*, not hackery.

            Linus
