Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34624B1E44
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 02:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747274499; cv=none; b=EZsFY5YDK/16peiUhWGzAKTXJgrvL9g8HlpIYL3V+w9Y328hLjAleKJ36529x8SAAPRHmXWkLgYah/BRdZEYvzbGmt9PB3OxJa9ntQ2Xk/m1mI/VxpIzusdoGYE0v4S3mSKF4BIbjENSa2rIay8oFX2xBSPinGLvpoNpU9YYwYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747274499; c=relaxed/simple;
	bh=Ys33O/zgHEEBRUX0TZ7+hETBTcCcg+4QlDnFZ+FeywU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sKWJu2SW1mrUZEhWQO2haJ0g+4New7MDB77mT4CdGsLTywecqII7O4/k9/5lpIS7mUs82py3SGqfDR3l6oApYbvO1qtLEsRPjTAjwsIoenhAYdU4GPlPtdEOr3ARKJBIpTz/mlpF/1d4eNWjwBEvDMMeUcBqcEb2FqVKRDQRauc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com; spf=pass smtp.mailfrom=dubeyko.com; dkim=pass (2048-bit key) header.d=dubeyko-com.20230601.gappssmtp.com header.i=@dubeyko-com.20230601.gappssmtp.com header.b=i3nM6aZS; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dubeyko-com.20230601.gappssmtp.com header.i=@dubeyko-com.20230601.gappssmtp.com header.b="i3nM6aZS"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-550d4b7a076so400421e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 19:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20230601.gappssmtp.com; s=20230601; t=1747274494; x=1747879294; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3igWJBklYuK9G/0qmdyO39ElstyriCzMZS8fl9pAzNM=;
        b=i3nM6aZSvfXtFBi7OBC9WHCtAmwswWTQtadoFx3tu3mO3jJ+AvBHdIZp0DVxfVYFdg
         cghxdPQWzaFwBmPdVZl5A1x66XaL7xi2FRNVFL+jObPWt/ur9gclYeRafPEu8bd55szb
         DDuofG8jwVi+Wb03fsUrj27tIr+l8AL9Sk+rR4xCllDQlQhzUr0CZBpTQuxiEwKpqCWo
         AbwC4lBHwnqDlTfBf/kJswpeGnSnVuid0WEMmvJnSFDx1mKc/Ggdua7OMbg2mT/aFL8l
         Uew+X9EW2JwJVyCC5sJButH8WBrvMsnM2wqG3ZnqcNUJ/Bnpj4TeTDgTmiYOntU13Zr/
         NwIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747274494; x=1747879294;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3igWJBklYuK9G/0qmdyO39ElstyriCzMZS8fl9pAzNM=;
        b=i+YohUwgBYoXmoI6IO5HXcYHyRqmksPL1yPBZeM8ExP84jVHWHvo9f+wn1l7I1/syk
         kvwU2jsPb9+LLioji/tLiao4GuDbg6pmnhqZCGnGnkrL+6LnrHn12papZDQOGxVZ12Cz
         sTvBWzQbUOlwxvyxWGh0J8RAXJnlFhxvURH3j+u/3DxzO5qGM93yp+jgSwbpIXfBv2F6
         Q3kJqZRykZPqT6pxvxlBsEpx1RZE6OgDac8PJE9UMmL4ezsGD7zYAxAuRPD1eL5vNJi3
         WvOyF0s+BibafosDfUHp+hgapxIGIzEw9ky0sRHnFJyYTYAM4BfsvedhVtGwlsRLP4cp
         yDfw==
X-Forwarded-Encrypted: i=1; AJvYcCX2EU4USdUSh5y+oWuL/OrKAh4izhr8hhJ7oUCCTpJiKJQM2jT4upuuw0acRPgeBzL2k8Ds2DXfvNnTh4E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+V/3yW+xODRHaFblxzRwdxQevxQVoixbg/ZvcBiHxM1P4yBfH
	DJMBxh1Md+4mG+aDIs9UxkdjV0cBHkgOsOTpQqq3fa1bHlOj8FfF6mgtYymalME=
X-Gm-Gg: ASbGncvrOPdY/OY7rFCISt+/6R7CpT0co/Zh7PPquBQD/TkRlhs+NDiqbJyJuFF6gtL
	MSlEbW8btwz8eMG/m1vnPrOPdd4MYO2NY5OKw2eSpDHgBljH/Zb0mOYBmdYTTDQ5XS0ZfPRAgKi
	AGW9+W0BHbmC9/2cjcjgEHZBlEXCNTE3v0gqdUPYNMXCKasIhRoGwB9+1EVNp9r6BKVCb09q0NB
	ZSJyoeDbeDsElkhwxmXjWQp92OywMSPyq9IQYVjRPnSIUcb7AwtZtcOF4QAQE33agCrxouyU+t2
	a0teypuZJt3LpriS3YInyZm+G3MxC3Q7AqvA/+N5sSVFKqME47HUPQ==
X-Google-Smtp-Source: AGHT+IEeIBvJX6OKvUbZqPpng9PWrTVmUIp6FebTgR/KxxOKTDCWY581tYEO2BmhEHo+OorC8cDfjQ==
X-Received: by 2002:a05:6512:3e21:b0:545:381:71e with SMTP id 2adb3069b0e04-550dd127e21mr220128e87.40.1747274493797;
        Wed, 14 May 2025 19:01:33 -0700 (PDT)
Received: from [10.24.138.144] ([91.230.138.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64bf6ddsm2451584e87.193.2025.05.14.19.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 19:01:32 -0700 (PDT)
Message-ID: <58e07322349210ea1c7bf0a23278087724e95dfd.camel@dubeyko.com>
Subject: Re: [PATCH] hfsplus: remove mutex_lock check in hfsplus_free_extents
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: Yangtao Li <frank.li@vivo.com>, glaubitz@physik.fu-berlin.de, Andrew
 Morton	 <akpm@linux-foundation.org>, "Ernesto A."
 =?ISO-8859-1?Q?Fern=E1ndez?=	 <ernesto.mnd.fernandez@gmail.com>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+8c0bc9f818702ff75b76@syzkaller.appspotmail.com
Date: Wed, 14 May 2025 19:01:31 -0700
In-Reply-To: <20250511110856.543944-1-frank.li@vivo.com>
References: <20250511110856.543944-1-frank.li@vivo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, 2025-05-11 at 05:08 -0600, Yangtao Li wrote:
> Syzbot reported an issue in hfsplus subsystem:
>=20

Could you please add the issue into the issues list [1] (if it is not
there yet) and to assign it on yourself?

> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 4400 at fs/hfsplus/extents.c:346
> 	hfsplus_free_extents+0x700/0xad0
> Call Trace:
> <TASK>
> hfsplus_file_truncate+0x768/0xbb0 fs/hfsplus/extents.c:606
> hfsplus_write_begin+0xc2/0xd0 fs/hfsplus/inode.c:56
> cont_expand_zero fs/buffer.c:2383 [inline]
> cont_write_begin+0x2cf/0x860 fs/buffer.c:2446
> hfsplus_write_begin+0x86/0xd0 fs/hfsplus/inode.c:52
> generic_cont_expand_simple+0x151/0x250 fs/buffer.c:2347
> hfsplus_setattr+0x168/0x280 fs/hfsplus/inode.c:263
> notify_change+0xe38/0x10f0 fs/attr.c:420
> do_truncate+0x1fb/0x2e0 fs/open.c:65
> do_sys_ftruncate+0x2eb/0x380 fs/open.c:193
> do_syscall_x64 arch/x86/entry/common.c:50 [inline]
> do_syscall_64+0x3d/0xb0 arch/x86/entry/common.c:80
> entry_SYSCALL_64_after_hwframe+0x63/0xcd
>=20
> To avoid deadlock, Commit 31651c607151 ("hfsplus: avoid deadlock
> on file truncation") unlock extree before hfsplus_free_extents(),
> and add check wheather extree is locked in hfsplus_free_extents().
>=20
> However, when operations such as hfsplus_file_release,
> hfsplus_setattr, hfsplus_unlink, and hfsplus_unlink are executed
> concurrently in different files, it is very likely to trigger the
> WARN_ON, which will lead syzbot and xfstest to consider it as an
> abnormality.
>=20

Which particular xfstests' test-case(s) triggers the issue? Do we have
the easy reproducing path of it? How can I check the fix, finally?

> Since we already have alloc_mutex to protect alloc file modify,
> let's remove mutex_lock check.
>=20

I don't think that I follow the point. The two mutexes are namely the
basis for potential deadlocks. Currently, I am not sure that we are
fixing the issue. Probably, we are trying to hide the symptoms of the
real issue without the clear understanding what is going wrong. I would
like to hear the explanation how the issue is happening and why the
warning removal can help here.

> Fixes: 31651c607151f ("hfsplus: avoid deadlock on file truncation")
> Reported-by: syzbot+8c0bc9f818702ff75b76@syzkaller.appspotmail.com
> Closes:
> https://lore.kernel.org/all/00000000000057fa4605ef101c4c@google.com/
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
> =C2=A0fs/hfsplus/extents.c | 3 ---
> =C2=A01 file changed, 3 deletions(-)
>=20
> diff --git a/fs/hfsplus/extents.c b/fs/hfsplus/extents.c
> index a6d61685ae79..b1699b3c246a 100644
> --- a/fs/hfsplus/extents.c
> +++ b/fs/hfsplus/extents.c
> @@ -342,9 +342,6 @@ static int hfsplus_free_extents(struct
> super_block *sb,
> =C2=A0	int i;
> =C2=A0	int err =3D 0;
> =C2=A0
> -	/* Mapping the allocation file may lock the extent tree */
> -	WARN_ON(mutex_is_locked(&HFSPLUS_SB(sb)->ext_tree-
> >tree_lock));
> -

I am not sure that it's the good idea to remove any warning because,
probably, we could not understand the real reason of the issue and we
simply trying to hind the symptoms of something more serious.

Current explanation doesn't sound reasonably well to me. I am not
convinced yet that it is proper fix and we see the reason of the issue.
I would like to hear more clear justification that we have to remove
this check.

Thanks,
Slava.=20

> =C2=A0	hfsplus_dump_extent(extent);
> =C2=A0	for (i =3D 0; i < 8; extent++, i++) {
> =C2=A0		count =3D be32_to_cpu(extent->block_count);

[1] https://github.com/hfs-linux-kernel/hfs-linux-kernel/issues
