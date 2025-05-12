Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B172522BA
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 19:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747079383; cv=none; b=bb57jfaeYGTRUo9aa3N+Vxy0RS6qLlMqlgvp7yR+fqqN2ZOgw8rrgKnlNT5v/Qk6plvCm9qQMrJY8/UuLlaKBiPH3MHSnNO9WRIhmKmzqLcl0hJ96brrurjEiQ/EdKnvWNF7+J6Pw0guTxFOFLAOSc+IEyClT4cO25zpFLU7q0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747079383; c=relaxed/simple;
	bh=N17w45e9OObph1kj0UgkzzKxjQ5h8eJTUcwmELzcFU0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eKLwLLNINj2DFvpvW5cTXtQfS5QH4Yx8WXJ9He7elKzQ+EgufMYRuWYUCSHrP5QqwGuAntxoxDxMKqYBCjWl2rzAssLM4AG+IrogVzx95Wsc4rm0IeFR+X7uIV1LgBaHjAd2O3/iude9taBws4XrGrd1lLqA0SK+V4GHkiimYeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fY/sjf8m; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fY/sjf8m"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7c5568355ffso492153385a.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 12:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747079380; x=1747684180; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dMTXikdJJ7h9MO7B+FNlh6XzfJ9Orfz34hUTKNgSUeg=;
        b=fY/sjf8mUzoJ5vbRAcknYqZvLFtTXCspxzY0lfvs2JUoU49Q3HyIu63TPYpZYqmDVu
         419ll0l15GseCUOwW1GIksIXOUcOFsZrVU6IXfQuixhzZI/Sk23VV1XJzEwQQOwE8Y1y
         oA32pRYtsiWlZyhnliEhXPcvzLLYEg2EV4buGcZyFCLW6UNKp1Nb7TI0vnk2Dbl156Up
         pNRDvKu7ybMtIGWY0HjGcZJKM1qNZk3x5lTR3kJLxOrWLkSBfI8BtuoE3vXxBQbSonZ3
         gexeilkyLfBkmuRhr8XWr56fHKx9Atjif0vnV6F/I6cy/jGZ3sMjClWDzkKxx6B3XyrS
         bMmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747079380; x=1747684180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dMTXikdJJ7h9MO7B+FNlh6XzfJ9Orfz34hUTKNgSUeg=;
        b=Ytn7XH1QU2DqXpywE/csDA99DRmPjGmj9yMzkCeq/Y568QXgILE70zOvxSgwkiokvx
         Sc0QHOEtHEifZXDjKxI5wlERW1VcgDLMbw81lCxs28k6rfvKcdg+gsGL3Qe3zEiiWb59
         MFT9zufOLLZP1s12fWV/DlJVpZcoO8GUGAsYNDrV5JCpUe2FaPNTCxYqPJj3uWZ8dV1l
         2WLDdzNKU2sXMbAB+roaTo2jwgqP0ULoXmqUHovTejLqFStsUcXwUdmKK5hc+Ik8NioL
         bkbrrqY1K0b9N51frfDqsjmx3+Jwa4084GJpJZ2lQjlpyWoVMpG4LIOgprDcb66iA36c
         D67Q==
X-Forwarded-Encrypted: i=1; AJvYcCWJPoNL+BkQ8XmIDyDKASJs0kqWWOAXK61EwXRKyj5irK3LQgUJHBlGWdE+O9/3sOSwIbYTyVjvYvBwTzU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIheRVymQXyFWWB1C3tjLo8eb3YzvjBt4EdflMlT+mfyvXPyjA
	UN/dexFv7TDTSidkJBPbdTX/meKGlH6ziisXNePQzOck2uyjZF+pTR1P9uxEEXfWXDepwB8FT2R
	A12t+TJzH3UB+MvQQbYwAGU+bKYk=
X-Gm-Gg: ASbGnctmRYJ9DdRf0qocp/R5fUTu9NVlkFfKuZZ7gj7HDpMB+FDhj4d+HDFls13GBYK
	1Px6MpBM4Se9J8FFoS4FF0NM6eZlySzNCj/lpQKOuEI//J/hw+8jw0d+mAxsSMWePrPpXseviVe
	BfuOe1GIfl/JsAN59pFguZd7yeAyt+oFjOyL+omK1udI0BNZaA
X-Google-Smtp-Source: AGHT+IGrpjrSZ4lzhZLxWLUqWJbiRuSjy7nh4CVBwDjunzKDGXsvF/U9FV+Z8JwBH8udn001TPY5JktJ2bqNTe9svcc=
X-Received: by 2002:a05:6214:2405:b0:6f4:c824:9d4a with SMTP id
 6a1803df08f44-6f6e47c339cmr219478296d6.13.1747079380108; Mon, 12 May 2025
 12:49:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250306205011.784787-1-nphamcs@gmail.com> <aCJF74ILruXJOAkQ@casper.infradead.org>
In-Reply-To: <aCJF74ILruXJOAkQ@casper.infradead.org>
From: Nhat Pham <nphamcs@gmail.com>
Date: Mon, 12 May 2025 15:49:29 -0400
X-Gm-Features: AX0GCFvdaGZ9PaaGs7rOIL1C_GePTsIggpX1S9q_GEMZu7HHQ7dObqQsP2beVKs
Message-ID: <CAKEwX=PZkb4+nA0YL_jSmr66roPoAiw5ZEN9nV9KqdwymAw-rQ@mail.gmail.com>
Subject: Re: [PATCH v4] page_io: zswap: do not crash the kernel on
 decompression failure
To: Matthew Wilcox <willy@infradead.org>
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, yosryahmed@google.com, 
	yosry.ahmed@linux.dev, chengming.zhou@linux.dev, linux-mm@kvack.org, 
	kernel-team@meta.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 3:03=E2=80=AFPM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Thu, Mar 06, 2025 at 12:50:10PM -0800, Nhat Pham wrote:
> > -static void zswap_decompress(struct zswap_entry *entry, struct folio *=
folio)
> > +static bool zswap_decompress(struct zswap_entry *entry, struct folio *=
folio)
>
> Hm, why do it this way?  I had it as:
>
> -static void zswap_decompress(struct zswap_entry *entry, struct folio *fo=
lio)
> +static int zswap_decompress(struct zswap_entry *entry, struct folio *fol=
io)
> ...
> +       err =3D crypto_acomp_decompress(acomp_ctx->req);
> +       err =3D crypto_wait_req(err, &acomp_ctx->wait);
> +       if (!err && acomp_ctx->req->dlen !=3D PAGE_SIZE)
> +               err =3D -EIO;
>
> which allows us to return something more meaningful than -EIO.  Or is
> doing that a bad idea and we should squash all decompression failures
> to EIO?

Not a bad idea, just no usecase yet. From the POV of
zswap_decompress()'s callers, any decompression failure is handled the
same way, no matter the cause.

Where it might be useful is the debug print statement right below
this. However, zstd and lz4 only return 0 or -EINVAL, I think - not
super useful.

https://github.com/torvalds/linux/blob/master/crypto/zstd.c#L163-L165
https://github.com/torvalds/linux/blob/master/crypto/lz4.c#L61

Not sure about other compressors.

>
> (also i really dislike the chained approach:
>
>         decomp_ret =3D crypto_wait_req(crypto_acomp_decompress(acomp_ctx-=
>req), &acomp_ctx->wait);
>
> that's much harder to understand than the two lines i have above)

I can send a style fix sometimes if people dislike this - no big deal :)

BTW, hopefully you don't mind the Suggested-by: tag. I know it
deviated a bit from your original suggestion, but the main spirit of
that suggestion remains, so I feel like I should credit you and Yosry.
