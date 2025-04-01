Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F4D204F61
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 14:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743518414; cv=none; b=qL7y0ePeEy+TpStTG8/SBzJn8vYolri3sT3iztX5CwdR75pA0oeYmid2WbE9SqW8zDBlrxDtrTScUMtJ3cvbeZ3egwgr/IAo48pIWDAxIGZzbbENxgLy4TdrfMaF0pk6J8GS5OkwirX+tWcjUGVAcDpl8Sqx3/qy97u+c2fCunI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743518414; c=relaxed/simple;
	bh=37CXOnT5gVmWSF86orv67Bi2S0ye3+YwEdKEuruGIcI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bjso99WNaUmihzHdyjb9TC7KwdjwcX5K8JgjU7qWCK3RAM73p+eTJvnV3EOR+lVrWmhHGKkmLyimi/i8iAzPHHIXBK+y8wK/kkCGXn+gBIcjBt5OvbTbS9qRrznYKZPd7dClnZI6MWAY4o8Yo7JotTcTjJDozaD1xawJOJMmoSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=atFd0yKa; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="atFd0yKa"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c592764e24so589957885a.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 07:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1743518411; x=1744123211; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=59lR8fyAGZtnyL5JxvCFtODoufn1dWPFxTxyktTFZ+U=;
        b=atFd0yKa+CmxXBBPTL4BqenHYayFz1tW2yoEjhiGHdh1mK5oPh7QEGMjY0RG8iBJSR
         19cFuh67GDbz8ow9EyEMxnt0JoMPSVTcJ9sPE8K61tXHdtZ5wzrt0NXcdhCItB0TrxTt
         M9Cu5Z9kZ2frmSsNbpuCdH+7AoUDrn6av3QIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743518411; x=1744123211;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=59lR8fyAGZtnyL5JxvCFtODoufn1dWPFxTxyktTFZ+U=;
        b=cDroo3c6dI6n2cPpG8zCgDVsmZ8veSYxCcpRRuxjIASpCoLNO++lV94FMA3Aur4qKn
         OBiWk5Uc+T2ph01S7ni136WWN+8SCIQ5L8QbR51+bi61sPv4/M1flKzP7sMfLyGX0dIV
         OKDseMmFwdlqcQoMi8FW3OjGuKuZiqdj8G5KVF8+YfOPxXcqRcTBm2yBL7VnzxTDZQ8/
         gdGiLa7wqSuUx8257bz2PUNbrfodvy7ny43k096mgbtDnLaYe2Q3J9fYG9P9agWt1KEA
         b6JbrXnnAdWmal9IMeywVxleR3mXttayxPStWLMtgVAevfVhxbwkCPdmmFYmEhDnOkMp
         O9RA==
X-Forwarded-Encrypted: i=1; AJvYcCWGM9DP4Nr8XphRrvhvl/c2AZakoZ/9fKoIfd5NRqHZJhx4yz3kp97vcD+agvoo6RbVog7mk/1V8vn80oA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiBT/PogQNC88ppkQ2C8pMyetAv8YGruaRq/r17SbjDnJeCK58
	TDhnYheLG6GTGe1aUu4NnJ31pVTWvGECEOxHjduwWRpkw1YtM9StMFcYqRf1aSBXwK2Q80fgPv4
	NWmSoTyY6mKnCgLlv/Kgm1baJyI7ieIOQJdN4hg==
X-Gm-Gg: ASbGncubiU6PZnvCxhMP2EXBxNjROm5KdSgslPfPPCTAf+VMog5adTjQYc2VnErVcNv
	tGb7IU5aYWL78XmRUWOevzXC1OELpZU6htNGTCxRttiUrzs0oAcAiA0qVafpqvlWwEcbYW3bAaB
	pcdnCnbvEa/yjqwRhP3m1gPjcX7Q==
X-Google-Smtp-Source: AGHT+IHhI8O7b5ijP+loZV7+ENRm+l4fKn9ZXF7CCFAuMczCuXhabLgBeJHdh/tlFRjneE5K6thzWwDmic3IRpqnakk=
X-Received: by 2002:a05:620a:171f:b0:7c5:93bd:fbf2 with SMTP id
 af79cd13be357-7c762a3f261mr25104785a.19.1743518411252; Tue, 01 Apr 2025
 07:40:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250314221701.12509-1-jaco@uls.co.za> <20250401142831.25699-1-jaco@uls.co.za>
 <20250401142831.25699-3-jaco@uls.co.za>
In-Reply-To: <20250401142831.25699-3-jaco@uls.co.za>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 1 Apr 2025 16:40:00 +0200
X-Gm-Features: AQ5f1JrNAk59O3RgftyW1Wtjx9nrelwARZc0n62ROmOd-FEHaOpq2bCBIDppVoM
Message-ID: <CAJfpegtOGWz_r=7dbQiCh2wqjKh59BqzqJ0ruhtYtsYBB+GG2Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] fuse: Adjust readdir() buffer to requesting buffer size.
To: Jaco Kroon <jaco@uls.co.za>
Cc: bernd.schubert@fastmail.fm, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, christophe.jaillet@wanadoo.fr, 
	joannelkoong@gmail.com, rdunlap@infradead.org, trapexit@spawn.link, 
	david.laight.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Apr 2025 at 16:29, Jaco Kroon <jaco@uls.co.za> wrote:
> After:
>
> getdents64(3, 0x7ffae8eed040 /* 276 entries */, 131072) = 6696
> getdents64(3, 0x7ffae8eed040 /* 0 entries */, 131072) = 0

This looks great.  But see below.

>
> Signed-off-by: Jaco Kroon <jaco@uls.co.za>
> ---
>  fs/fuse/readdir.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
>
> diff --git a/fs/fuse/readdir.c b/fs/fuse/readdir.c
> index 17ce9636a2b1..a13534f411b4 100644
> --- a/fs/fuse/readdir.c
> +++ b/fs/fuse/readdir.c
> @@ -12,6 +12,7 @@
>  #include <linux/posix_acl.h>
>  #include <linux/pagemap.h>
>  #include <linux/highmem.h>
> +#include <linux/minmax.h>
>
>  static bool fuse_use_readdirplus(struct inode *dir, struct dir_context *ctx)
>  {
> @@ -337,11 +338,21 @@ static int fuse_readdir_uncached(struct file *file, struct dir_context *ctx)
>         struct fuse_mount *fm = get_fuse_mount(inode);
>         struct fuse_io_args ia = {};
>         struct fuse_args_pages *ap = &ia.ap;
> -       struct fuse_folio_desc desc = { .length = PAGE_SIZE };
> +       struct fuse_folio_desc desc = { .length = ctx->count };
>         u64 attr_version = 0, evict_ctr = 0;
>         bool locked;
> +       int order;
>
> -       folio = folio_alloc(GFP_KERNEL, 0);
> +       desc.length = clamp(desc.length, PAGE_SIZE, fm->fc->max_pages << PAGE_SHIFT);
> +       order = get_count_order(desc.length >> CONFIG_PAGE_SHIFT);
> +
> +       do {
> +               folio = folio_alloc(GFP_KERNEL, order);
> +               if (folio)
> +                       break;
> +               --order;
> +               desc.length = PAGE_SIZE << order;
> +       } while (order >= 0);
>         if (!folio)
>                 return -ENOMEM;

Why not use kvmalloc instead?

We could also implement allocation based on size of result in dev.c to
optimize this, as most directories will be small, but that can be done
later.

Thanks,
Miklos
