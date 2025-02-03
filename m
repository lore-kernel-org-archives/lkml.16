Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F8D15383A
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 18:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738608827; cv=none; b=hjKt5YGu6Cfk0fVErZmU4NzLE8TtkCWQ2v2iUK9jKL0yPZbKXLycaableutAIW5gqO0L/3GInIF2G9EQwMI1rwxiW6B3Wyq40swIlfv9zqTs/W3xnhAWOmPc+lUg1GgRsJQpz5l6pBegXvwDbhyMM1AGdU7BJkbZh2B5wiDZcw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738608827; c=relaxed/simple;
	bh=Tzvsmu7a1GZ/Sc0y85udd8754ZpYAms4FVKSR2PqAUw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H2XwU8RrFnExqTFNWq9cARQ9PljgqlnLOFDCTszmwxgaIq+kG60QoGkGJMUg00utC47SjF5Rvypw8k3E07QLmwXwuOKX7vr0Vv8Qq+4OgxXb/eLYATaDmbpTargz1n98ewb4odIS/QvycELTiRRnXTYn/JO4OgP+IstTvZUtuQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X42iaBjb; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X42iaBjb"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5dc75f98188so7549354a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 10:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738608824; x=1739213624; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V45orYruD99ZGljVryaLEniUB/JJelA3I5hj+yh3ILs=;
        b=X42iaBjbwtIg3ASe7S9ubfXgM6DHX2ayLAYZYY64ULZ8tcr3BvKNGAE+N1JhtukKB0
         DZfUMa7aa9l/jokYp5P/pjGxS9og1VA5FesKUKOfJ7gxogU0Jc6PBrwK29eLK+HkKQKP
         FnoM2DQRGvA+Q28VvsDgpcFUE3a/UULKkKnpt9+iWypyyOuBUoqUcRf+dSUCik8MbK6o
         UcZWL0FLkrNsKUN0RiIrV3ENXS6R6snhjDDp9DH7/yiEyt8cvl8Q4J+EPicy527njJT7
         U8arQBjTJZaF2gpRuV6M3h8CCH/acdSA0OFiFON44k7YdICIFs9ZyVq5xkjg9iuXGX1+
         oSeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738608824; x=1739213624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V45orYruD99ZGljVryaLEniUB/JJelA3I5hj+yh3ILs=;
        b=ZR+hmfWYqqJAk1FHvB//4Y49wuJ9QttExQ1teFeY22yDdmcsq6QXtudTj0ybrSiw0g
         rYucr+Ry1gvrf/5ak8+UttFUS0AGVrf8hQzCXSdwSaZJ8jLtVJlvwtlDPWVPLAelr3Rg
         RYzP5CpTFceMyyDwL2lo1RJV7Dj0jWfx48R6g9Ff2h6X0TGq03b4wwQqU187FRPxb/VG
         tFA7Ou221823W4djNCEwKkpwMgKwJcylTiMtWX44fztBSNXtXk0RoLM18gn6HFSyzGHo
         yyMPajtWNCek4UjnAGx7VjFhK2PsyIbB0mE9f3m5CH1jgccd2w/5PjkK/M/oXM/Ft9Fm
         TlIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpNsfDEzVM7/zynNW957bnD1xdw4IovGrHdXlUPbcVZhhtl9CWvyi99hvmiuHGCcOrMs3Wi0OPh2VgmpM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzD7BPKLpYrZc64GEf/ZtZ3L6pp2wadaV2MEiQdJhsJ6SD+YLf
	6Kp0Jp6tsB+LyJ7wiZLWEX+nuIETGnHSDVDLccFBZssqnFycicT/fF2A23qsQzv7kdhNfzuz3ks
	zGDTHyTH95ynCn397j1SWVX1MEOE=
X-Gm-Gg: ASbGncsfG9BEKx7Oa3vIdyfwpev/+HOjVSYMrEm5lpi2HitKKLjjNyLYk8zZYCtodep
	Ide+C4arAx7Qrf6ZBiAHAJLbSBiHXxUBg9cRW79vLw9j7pNea7ZoBLBlU3QfvnjdDslqUatY=
X-Google-Smtp-Source: AGHT+IF95caPTmXSHw+ZnuWO6ClkTBoAkbTbyf2uJM36DwW9BUz4Zoj9UJGfUtgpjHYOwF5cBpgNY5soNE1vVAgyjS4=
X-Received: by 2002:a05:6402:a001:b0:5dc:88dd:38b3 with SMTP id
 4fb4d7f45d1cf-5dc88dd3af0mr10516798a12.12.1738608824094; Mon, 03 Feb 2025
 10:53:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250131001806.92349-1-vishal.moola@gmail.com> <20250130164836.1163f66bede77ec4bcc9d4b9@linux-foundation.org>
In-Reply-To: <20250130164836.1163f66bede77ec4bcc9d4b9@linux-foundation.org>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Mon, 3 Feb 2025 10:53:32 -0800
X-Gm-Features: AWEUYZkvEN5prL1F_CZmkbE0FLPWU535lcJANzU1EwMBGd12_iUZqYIrGpcIM-U
Message-ID: <CAOzc2pyKFJKxkTs989rMzRaMSwR+EBXDiCB-2xBRTiu=Y8FLvw@mail.gmail.com>
Subject: Re: [PATCH 0/2] vmalloc: Introduce vmap_file()
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, hch@infradead.org, 
	urezki@gmail.com, intel-gfx@lists.freedesktop.org, 
	Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2025 at 4:48=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Thu, 30 Jan 2025 16:18:04 -0800 "Vishal Moola (Oracle)" <vishal.moola@=
gmail.com> wrote:
>
> > Currently, users have to call vmap() or vmap_pfn() to map pages to
> > kernel virtual space. vmap() requires the page references, and
> > vmap_pfn() requires page pfns. If we have a file but no page references=
,
> > we have to do extra work to map them.
> >
> > Create a function, vmap_file(), to map a specified range of a given
> > file to kernel virtual space. Also convert a user that benefits from
> > vmap_file().
> >
>
> Seems like a pretty specialized thing.  Have you identified any other
> potential users of vmap_file()?  I couldn't see any.
>
> If drm is likely to remain the only user of this, perhaps we should
> leave the code down in drivers/gpu/drm for now?

This function is generally useful for file-systems that use the pagecache.
I simply chose to highlight the most obvious user that benefits from it (an=
d
so that the function is introduced with a user).

I haven't identified any other specific users of vmap_file() myself. I know
Matthew has some other ideas for it; I've cc-ed him so he can chime in.

>
> Also, the amount of copy-n-pasting from vmap() into vmap_file() is
> undesirable - code size, maintenance overhead, etc.

I wasn't particularly a fan of it either, but I couldn't find a more readab=
le
way to do this (without reorganizing multiple other functions). Aside from
the initial flags checks, the rest of the function is slightly different fr=
om
vmap(), so calling existing functions won't suffice.

I considered passing more arguments through to vmap(), but I think that
would make the code more confusing, especially because the 2 functions
have some different usage prerequisites.
