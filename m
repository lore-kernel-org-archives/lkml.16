Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFC1C8DF
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 00:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738457929; cv=none; b=X2TaMCBpGamINXiTGEkTipiFptDLC1lI2R1Y45oGez8JRHRxZkMtL9f5mDN9f1jl1TVX4y2LE+Ofpm6vn8jgi6Mf/Hg5x8vDT4jCEJaixynPLc031sQEkzGnh4C3CoynMxxy0WCESKkG6Nnymj6AeLnnXDyKm6HfZC2TuXvHZSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738457929; c=relaxed/simple;
	bh=wTdxQSHNowLLmMobvaMcMprIsVZ+/hyqVnL+ii8pks8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HjI7xRe7UAJEVtMT9DVf6dQyHfvpDgwMdrJxkTc3S3Dsf9gVK6l3NOQ32UddTPRy0oXAT/J9ybsxSoe1MoT4r5jSWqtmfZUEnBx/onJNOmPUtraEhIL/yTMLEaPNKGPXKH9237bpc+UgXoSsUTtwGer4C39NRNObWz2+os5smHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=QBZy3e/1; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="QBZy3e/1"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5dc89df7eccso2465429a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 16:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1738457926; x=1739062726; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0i2RBA9AG5RGJ2Y4fhUq4YhT8DGp5O3OFexnsh+308w=;
        b=QBZy3e/1EQGv5gUEtm/pZbPIW/2mikZ8l+LLIY0ItIoA7a0KjshBh2MARq+JNeKymu
         /TJHSywKjXlvfb9OJFn+ozVatQ8cWDcFqUGQBfi90TEkHw8ZxEi1oDew+CVTok60rXef
         vDtQXPRsKRjfXY2CEs2K3wDTofostoLfkdbcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738457926; x=1739062726;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0i2RBA9AG5RGJ2Y4fhUq4YhT8DGp5O3OFexnsh+308w=;
        b=Rz2D69AGU2aRav68TUM/WLVfkp9dm3lFmEjfF+swiG1QOBswfh8+WkqyeDlvmJq3Ag
         Ro6JQGL4OPc8woyVOeDdU3QJTNP827AFCcb5eoRRE0vsvR8S2QzsjaWClYVv5LLWH2kU
         2paR0qZcIOfc4FxaD/0c/wHex/xHOsvueNbZjJ72eLl8HlTnMN2ToS4cy2AYG0qaKDnw
         0rsBQRUfxGsDs2ciQiTTtn0xv7TyqNbWrh+MjTfv3UWNvyKehwg/IlVSzrrhRkfv6EMd
         lKwdc+KjieTnmgQd7vwyjJ+FkJBcO0tOTuHhJJ0NzulUNIcTVkvdGsRRsfI46S2fO4TL
         18zQ==
X-Forwarded-Encrypted: i=1; AJvYcCVU9bHHXkhclPrDAnwJRrfDykgNiVI+h8DvNkUWyn0ipWYWej+mBfCae4NK5bvOhOdoSoEPv5lUqHUTIZI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsaD0aKUrcrKNCfAKIqz/nEaVY6TMLzpHHXhqdGSsyau3KBGN2
	a9SAUveiNaRxEhvU8fD9GIpiE99vvAjiJKH5+THIN8vLGS9WIcb84L9Dvjbc7GxdoBRn6NBWa2t
	LLWhzuA==
X-Gm-Gg: ASbGncvI/NdhAs7ahIfuxfr6E2CKXWHoK6/iMVPzstGsl16JBrD0bnLppIyUhlS5yZ8
	wMJO13CYrWbyyiYAj+AgdjYoVeUqh6W/r5nUZZ3xyPR463rRLughTqRJUysK/kaXH1yPV0vNpli
	bNzoaC1lFW4PvIaOy+Ef+B7FN2wKXSw90Nx1NU810HcBjC+uWXow/yUCTerquDAMja6FVPSI14B
	9sFbvEw4a0FTKt+GtFEzVEi8hteUQJHD9Hy7/qkDC8E1FbJQYJxYi6irJqYiV3+Hntz73MUwkJp
	2KHocNEKWThtTmwtAqHoYoqsvgtiH0rvaWQ2Dr+enyvWIMimsPi+3hNMspy3qS8zLg==
X-Google-Smtp-Source: AGHT+IGQ+tgM8h4uCgaPy02ivd5OjMkK7nj+tiT/s4LF92HJedNmlmZRWZeh1nuMykkKJf5klwkczA==
X-Received: by 2002:a05:6402:a001:b0:5dc:88fe:dcd1 with SMTP id 4fb4d7f45d1cf-5dc88feddb1mr5862506a12.12.1738457925787;
        Sat, 01 Feb 2025 16:58:45 -0800 (PST)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc724be323sm5066679a12.65.2025.02.01.16.58.43
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Feb 2025 16:58:44 -0800 (PST)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5d3e9a88793so4947785a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 16:58:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVrtFm8B+RQ7kKF7Z1nidjdZNKE0PIHHB5Xou/bSkODy8GCWW3HKefJ77FvP0V6ze8vv1KEM/MvNbnAbvk=@vger.kernel.org
X-Received: by 2002:a05:6402:50ca:b0:5d9:a55:42ef with SMTP id
 4fb4d7f45d1cf-5dc5efc4586mr20023222a12.17.1738457922880; Sat, 01 Feb 2025
 16:58:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1731684329.git.josef@toxicpanda.com> <9035b82cff08a3801cef3d06bbf2778b2e5a4dba.1731684329.git.josef@toxicpanda.com>
 <20250131121703.1e4d00a7.alex.williamson@redhat.com> <CAHk-=wjMPZ7htPTzxtF52-ZPShfFOQ4R-pHVxLO+pfOW5avC4Q@mail.gmail.com>
 <Z512mt1hmX5Jg7iH@x1.local> <20250201-legehennen-klopfen-2ab140dc0422@brauner>
In-Reply-To: <20250201-legehennen-klopfen-2ab140dc0422@brauner>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 1 Feb 2025 16:58:26 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi2pThSVY=zhO=ZKxViBj5QCRX-=AS2+rVknQgJnHXDFg@mail.gmail.com>
X-Gm-Features: AWEUYZkrc1rbpsukghJrnBMXjfiiupnnm33djYsyEN114ENNjNC4tG_tthCj53k
Message-ID: <CAHk-=wi2pThSVY=zhO=ZKxViBj5QCRX-=AS2+rVknQgJnHXDFg@mail.gmail.com>
Subject: Re: [REGRESSION] Re: [PATCH v8 15/19] mm: don't allow huge faults for
 files with pre content watches
To: Christian Brauner <brauner@kernel.org>
Cc: Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>, 
	Josef Bacik <josef@toxicpanda.com>, kernel-team@fb.com, linux-fsdevel@vger.kernel.org, 
	jack@suse.cz, amir73il@gmail.com, viro@zeniv.linux.org.uk, 
	linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org, linux-mm@kvack.org, 
	linux-ext4@vger.kernel.org, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 1 Feb 2025 at 06:38, Christian Brauner <brauner@kernel.org> wrote:
>
> Ok, but those "device fds" aren't really device fds in the sense that
> they are character fds. They are regular files afaict from:
>
> vfio_device_open_file(struct vfio_device *device)
>
> (Well, it's actually worse as anon_inode_getfile() files don't have any
> mode at all but that's beside the point.)?
>
> In any case, I think you're right that such files would (accidently?)
> qualify for content watches afaict. So at least that should probably get
> FMODE_NONOTIFY.

Hmm. Can we just make all anon_inodes do that? I don't think you can
sanely have pre-content watches on anon-inodes, since you can't really
have access to them to _set_ the content watch from outside anyway..

In fact, maybe do it in alloc_file_pseudo()?

Amir / Josef?

              Linus
