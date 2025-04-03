Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594CC1FF615
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 20:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743712720; cv=none; b=dr3jmVCqp4iF0q1+Y6HK8Feb/mA3BLcnKWnNR3D2LLT8SfAong38L2bGbc5w+q3gl18XhVqyT4FvqEZWwpfj/LrdFNFsb+lzN7HhZaELouUvb9ldBRHwdunFxE/7Ty2t3cMGsXWRohHht7tyRv19pzMG4A+DnR/JG+EZSmMQp5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743712720; c=relaxed/simple;
	bh=LQNorl+FxeZ9WjYAnsEddepH/Io+6JtiYR/y5xPvq+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RYB0ABmeTTHAgEfHpQRyPj8IHzTlZBoUbm9O7U5j3GuQqP0Ptx0vwfkBtNgS5yIWtYksnNOqp18/TBIVzRHi4pZtF374G7cuf2otWgBTYrxHu3uCWfCqNJQPwu2mqwKx8y6XTkEhagv2cyDlSLZ7mUeeszMgkICPHUc5R4HHb2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eFN1twnp; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eFN1twnp"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-47662449055so7375831cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 13:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743712717; x=1744317517; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CgJaLBC/vvLHRWUfTxP8meiFEnp76vjgOWeU9IZXJJ8=;
        b=eFN1twnpUkAuAwHQQ1TnyKOtDJAsY71+gOiW4p+LY7OhbK+0BO2uTc40+9gCkP1AX9
         YVfjYUA1ym3P+xxIzJPA1b6nC6w0ZrQskNcVEPmjFPHwKQZz+AOdUE/1q3IPlLERkVfF
         +6GpCDTzCAMSjCqynwu/30DRkU6PShBf9v9KtyLHoDY6Mi4Nfo7LLINtHMFV0lveMfpM
         dpLkjRgSe3TMxrwj/CghdFDqusfxNpGFtRUmDfjf6Pt7Q9xox0b/kv6k513lgmF4F8YN
         MET7tp9Cz/X51Qqe065k3PEv/qjpsQWZAmqYlJf1yID5Vk8dhy+DqvPcD11dOnv3mxCg
         Lpag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743712717; x=1744317517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CgJaLBC/vvLHRWUfTxP8meiFEnp76vjgOWeU9IZXJJ8=;
        b=WRv4AtjlBeXdr5b8bnQUBQCZzKk+AV34ouh0fkD/3kEZa4Q2m/jnQe8PVNPCym5EJf
         UPYh3a/PsHC3fPUEZozzpT0zNEAKRCXDMeA64tD+Tpu/pu2Wl8B4fDG12jJzKcvm5k+n
         zxufJ1YRhdkJL/DoKNcpyvL0umrLQNKEMTZ7zVz8iRM5detmbf8B4ca9cdiSJfYX9P2M
         SiGqWD8cpA8xdo0ICbPhbh5bSBmC8JECSWawVvQj3b6msLKP8SilApsLLZ4cbV7aw77e
         O8DguVtzIM6rZEfoi5OkQVGinIxWMCy8L/1Swwjo84YYzOuc7SY+r2K9MQCY1PlXyvY7
         eEIA==
X-Forwarded-Encrypted: i=1; AJvYcCWJrYgWahuNrx2DmlQrU6mcg5qy0Kn2TnrEV03crJbIIxp4lbOcIZn4oznZBzKYjjzDv7V246TXNQywU6o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPqNwQfHwSuIhhhoNHP42fzSxqERpJApQukDoi2mPDJ5/sYqtr
	51SiM2cCp24bVF3ZSft2JKM5yYxRGaQJ6wOHht0mdLS/EDDSpBy4No44V2ADXgUu9QbVc98CXNw
	ZWHT6C9r0Q0Oz23cEI+NkjiWQlSQ=
X-Gm-Gg: ASbGncv/Ovz4zv6I5liR4+I34UlRFjk7EWFN7/Z7U578CG+WvpEebBskfcOhrUi31oQ
	eqqErLVI8eJ4+72Lpi9moAgvgJBsWMLSPysszkdNXCxZBu5WGNAKVh7qgZiyfo2HSjRdPTAV9oA
	B6bLt+ru+63OSNklgdPpmk3elNBJ09q5kZU5xPbmaQVA==
X-Google-Smtp-Source: AGHT+IEMSliei2l649c31YPpt/ggB9tdVf1Zi3+20JU2QrQQbAiEI8KNTt9SsCchr9zSmEJqdJm0lS29wCdwTyhsG64=
X-Received: by 2002:a05:6214:765:b0:6e8:955b:141e with SMTP id
 6a1803df08f44-6f05852affdmr5326266d6.21.1743712716802; Thu, 03 Apr 2025
 13:38:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJD7tka6XRyzYndRNEFZmi0Zj4DD2KnVzt=vMGhfF4iN2B4VKw@mail.gmail.com>
 <20250402200651.1224617-1-joshua.hahnjy@gmail.com>
In-Reply-To: <20250402200651.1224617-1-joshua.hahnjy@gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Thu, 3 Apr 2025 13:38:26 -0700
X-Gm-Features: ATxdqUH27xjXKtpV6QHLDb42HuJLxsrQKEFDngpscMUoQkaQAzPemRQ1YdwdJqk
Message-ID: <CAKEwX=Na6kgGLsnknkfsc75hk-Q690z0J9rh=S=BmK2qjVU3rw@mail.gmail.com>
Subject: Re: [PATCH 0/2] minimize swapping on zswap store failure
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Yosry Ahmed <yosryahmed@google.com>, akpm@linux-foundation.org, hannes@cmpxchg.org, 
	cerasuolodomenico@gmail.com, sjenning@redhat.com, ddstreet@ieee.org, 
	vitaly.wool@konsulko.com, hughd@google.com, corbet@lwn.net, 
	konrad.wilk@oracle.com, senozhatsky@chromium.org, rppt@kernel.org, 
	linux-mm@kvack.org, kernel-team@meta.com, linux-kernel@vger.kernel.org, 
	david@ixit.cz, Minchan Kim <minchan@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Kairui Song <ryncsn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 1:06=E2=80=AFPM Joshua Hahn <joshua.hahnjy@gmail.com=
> wrote:
>
> On Mon, 16 Oct 2023 17:57:31 -0700 Yosry Ahmed <yosryahmed@google.com> wr=
ote:
>
> > On Mon, Oct 16, 2023 at 5:35=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> w=
rote:
>
> > I thought before about having a special list_head that allows us to
> > use the lower bits of the pointers as markers, similar to the xarray.
> > The markers can be used to place different objects on the same list.
> > We can have a list that is a mixture of struct page and struct
> > zswap_entry. I never pursued this idea, and I am sure someone will
> > scream at me for suggesting it. Maybe there is a less convoluted way
> > to keep the LRU ordering intact without allocating memory on the
> > reclaim path.
>
> Hi Yosry,
>
> Apologies for reviving an old thread, but I wasn't sure whether opening a=
n
> entirely new thread was a better choice : -)
>
> So I've implemented your idea, using the lower 2 bits of the list_head's =
prev
> pointer (last bit indicates whether the list_head belongs to a page or a
> zswap_entry, and the second to last bit was repurposed for the second cha=
nce
> algorithm).
>
> For a very high level overview what I did in the patch:
> - When a page fails to compress, I remove the page mapping and tag both t=
he
>   xarray entry (tag =3D=3D set lowest bit to 1) and the page's list_head =
prev ptr,
>   then store the page directly into the zswap LRU.
> - In zswap_load, we take the entry out of the xarray and check if it's ta=
gged.
>   - If it is tagged, then instead of decompressing, we just copy the page=
's
>     contents to the newly allocated page.
> - (More details about how to teach vmscan / page_io / list iterators how =
to
>   handle this, but we can gloss over those details for now)
>
> I have a working version, but have been holding off because I have only b=
een
> seeing regressions. I wasn't really sure where they were coming from, but
> after going through some perf traces with Nhat, found out that the regres=
sions
> come from the associated page faults that come from initially unmapping t=
he
> page, and then re-allocating it for every load. This causes (1) more memc=
g
> flushing, and (2) extra allocations =3D=3D> more pressure =3D=3D> more re=
claim, even
> though we only temporarily keep the extra page.

Thanks for your effort on this idea :)

>
> Just wanted to put this here in case you were still thinking about this i=
dea.
> What do you think? Ideally, there would be a way to keep the page around =
in
> the zswap LRU, but do not have to re-allocate a new page on a fault, but =
this
> seems like a bigger task.

I wonder if we can return the page in the event of a page fault. We'll
need to keep it in the swap cache for this to work:

1. On reclaim, do the same thing as your prototype but keep the page
in swap cache (i.e do not remove_mapping() it).

2. On page fault (do_swap_page), before returning check if the page is
in zswap LRU. If it is, invalidate the zswap LRU linkage, and put it
back to one of the proper LRUs.

Johannes, do you feel like this is possible?

>
> Ultimately the goal is to prevent an incompressible page from hoarding th=
e
> compression algorithm on multiple reclaim attempts, but if we are spendin=
g
> more time by allocating new pages... maybe this isn't the correct approac=
h :(

Hmmm, IIUC this problem also exists with zram, since zram allocates a
PAGE_SIZE sized buffer to hold the original page's content. I will
note though that zram seems to favor these kinds of pages for
writeback :) Maybe this is why...?

(+ Minchan)

>
> Please let me know if you have any thoughts on this : -)

Well worst case scenario there is still the special incompressible LRU
idea. We'll need some worker thread to check for write access to these
pages to promote them though.

(+ Shakeel)

> Have a great day!
> Joshua
>
> Sent using hkml (https://github.com/sjp38/hackermail)
>
