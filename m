Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91E1224CC
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 01:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743125541; cv=none; b=TFD28k8EJJhKeTbI14+59iatvd8Xq8evMN9EvriBMwvNGDVnqskilaSlp3xITcv+e8ThzaaYi4QHTWEY0QRBalt/bNH/xCCSsk+wSONMYt2XOPCYxfohiq1jDU5EtdZ8KvfY8pborPlVNueXs/UYyAJVSuflhVC+GUzKwSCEsE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743125541; c=relaxed/simple;
	bh=Az9d7ZNIWC8NtvhwKFq+k930wrJytpLyAq0Iwc+QHS4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lGeXXHF1me4KxzQwsmxqsoKHAl0NZUP2+rJjcOK3pOHWbnJssXU5j9d9tHR8JHFh2yigldPRPWhDp2RgWDyvtIxg6y+UAVOaaePSpLzxh37TMyGwkn7SH9O3MSnYUK8ZhW4jk3cu67zg53fzbrPz9ZqrZ4lWIRQg7oywy10oq9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=f6gqixMT; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="f6gqixMT"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aaecf50578eso278091166b.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 18:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743125534; x=1743730334; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EwXAznYKMKf9Xjvy7VQePCArGbmup4GqAOYD4PRfII8=;
        b=f6gqixMTQ7QqxwhAA0KIS1n/BLhkFjqJ6LPouDMgqM+fH6XEyp56uixeeB8apOAK9x
         8dwUQstLrSAUd5dhELFx/xL8XI5hJz8lYxU0PYMI0EkNBWydr7osBHzi+Ovli785tuqX
         PKZ+HTCoKUq3scOnO9NcZQdEmU48ULlulzt3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743125534; x=1743730334;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EwXAznYKMKf9Xjvy7VQePCArGbmup4GqAOYD4PRfII8=;
        b=Cy/EbIYmWXqVt9OxlI5u+vBAWMJuOFCSecp7NEtzLfPl0AlN0lZvWMle+13mAUFQbk
         HwAVHzyB4TAzNR+WBOHE2soFi2SG8Yl5LGUHOpjD7NXfhnNRtGAiloQEONsgfoWo71hg
         zF6CxST0Mn7dZBd2Ov3ehYkL8k+L/6IHdpBpiS+VcPdL2pFr/vNgdpKIfMGdbgzM5OO3
         FytLVkGV2TZNKgHA9nrQuKH2IfNi3xioNBrxaarOMlf0CiNATZucL5tnmIaQqy4BWi1e
         kwFdPcFUD9tlnX90YIt6kgxb2LIh9LKQqVS8ENU8lIpLhQasywsUUKLixet3PyIh8Lzs
         1UXg==
X-Gm-Message-State: AOJu0YxjeRbIc7KNDtbnjlZCMfDCotCa/DS6+tkS5a0A1LYMYgFzmOeU
	c8/enIZNKUAL9MIhJfd5ifs8v29G88IvQ1xf9wnO65LegmQsHMZT8/Oc3B1ubfk8VVfyvaGAO5u
	h5Tg=
X-Gm-Gg: ASbGnctNo2D2HLXZF8X9T2kW0gJ8OgedIz2ZxdJJo05m+HnzMS9242epNb8WlTLmCEk
	AoyASO/A6JspD/q0zwyMhdraSCgMtRNDX8iAnyJCBel0u80ZCdWUzgflVZNH+iHIySdPE1PR1yB
	6IRAucMR3sSf/PmaLDib5vJmQ3Jsp4ErWrPMDw2xh+Wcms3tU2vlA84vdS8ntLsRIIPmkYq/05h
	Ri1vJBejK0zVy4oozO8d/A4M5wX7BRG8R89UozA+hBIxUx0vnWQKWGuyBGyaOricWRM7CJ0IB0Y
	thF4Jw3ygB1ZPuXHAEf84U2S/IUkO2lcaS6wbx+C58PFfH+r5Vsvb3Z4p8eG29UjfNUYjgIaFbn
	c3GfSXVArhITYzx7598g=
X-Google-Smtp-Source: AGHT+IGRZbhcmzBNmlnoevUl0lz9pFUg2HiMGjHCQqKOu7vsqHOSNb9b6ZD9/UatrSO27CnvQQ1LPQ==
X-Received: by 2002:a17:907:74c:b0:ac3:8895:8e99 with SMTP id a640c23a62f3a-ac6fae4899cmr480060766b.3.1743125533697;
        Thu, 27 Mar 2025 18:32:13 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71961f8acsm76800566b.98.2025.03.27.18.32.12
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 18:32:12 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac2a81e41e3so322083466b.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 18:32:12 -0700 (PDT)
X-Received: by 2002:a17:907:3f93:b0:abf:6ec7:65e9 with SMTP id
 a640c23a62f3a-ac6fb0fa6damr561148366b.43.1743125532138; Thu, 27 Mar 2025
 18:32:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327171037.032bf7e7@gandalf.local.home> <CAHk-=wgD9MQOoMAGtT=fXZsWY39exRVyZgxuBXix4u=1bdHA=g@mail.gmail.com>
 <20250327212447.24e05e7e@batman.local.home>
In-Reply-To: <20250327212447.24e05e7e@batman.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 27 Mar 2025 18:31:55 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgW4QfXuR0StSz15jqCs-suuPhfDajKr1bH2qS73cT4dA@mail.gmail.com>
X-Gm-Features: AQ5f1JqFc_Cw4aru5t8bfVwMsXfGUD4cilU5e8HOqCLAoB0TmmIrJMjfunmRAGs
Message-ID: <CAHk-=wgW4QfXuR0StSz15jqCs-suuPhfDajKr1bH2qS73cT4dA@mail.gmail.com>
Subject: Re: [GIT PULL] ring-buffer: Updates for v6.15
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Feng Yang <yangfeng@kylinos.cn>, 
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Mar 2025 at 18:24, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> The pages are never vmalloc'd, it's only ever vmap()'d on top of
> contiguous physical memory or allocated via alloc_page() in the order
> given. Thus, we do not support non consecutive physical memory.

Christ, that just makes it EVEN WORSE.

Just keep track of the actual original physical allocation, then!

By all means vmap it too for whoever wants the virtual allocation, but
remember the *real* allocation, and keep it as a 'struct page'
together with the order that you already have.

And then you never use vmalloc_to_page() - or even virt_to_page() - at
all, because you actually know your base allocation, and keep it in
that form that so much of this code wants in the first place.

Having a a nice reliable 'struct page *' (together with that size
order) and keeping it in that form would be *so* much cleaner.

Instead of randomly translating it to (two different!) kinds of
virtual kernel addresses and then translating it back when you wanted
the original proper format.

The random crazy hackery needs to stop. Really.

               Linus
