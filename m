Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A9819F11F
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 14:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747147758; cv=none; b=Rc5x2siN89lnxvNOfdC90paOzdGum5cGcdX9ofWRhXFpO4TgdnY5oRfK4pYfm+Iswbf9U1xc8lbu44blnrafJEVHS/RXAmdDZl2Nk7ClJBEPgFiemCdzrGtuLksMHHxpl7Kd4y8/c96dezrgneG62l+WyCKxAtX678DfQtB5Vg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747147758; c=relaxed/simple;
	bh=IH30o/V3WHvNch/5VZ2PDe0ULLqMzq5nHXYVrtZBu2E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RBhy0BqfN4pBz0s4MwSxUydHxTISURwjBlxYJ+n/3s7MEL0uD3xfjWYs82/Y+ENMlpBQm+UdvtOxrgYxchD+3qUKM6tHzK5OzBsQkjjccslQjBpWo/ZUbQpaZYNWHevh8TJmLTq8NZm0T19hWBfwfJwRfBpd9FTWl3L1mFOFqA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=bj/xFq04; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="bj/xFq04"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-476b89782c3so64245061cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 07:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1747147755; x=1747752555; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=INtm454eLGLygSZvRwYLObcd+22LA4H68yKi06CR67c=;
        b=bj/xFq04riIveZFr1+ySeYCrlH6QCPcXUGVirrPJmk6D2LvMpt1IbcEle2EP9n2/bj
         Oo2xkZwjMTv6+rASJOyFwDrwS9QG93e6a7yx87fJPsHDyonf1ADOVD/SeRTIWHKCJUeC
         Ak1FKvcMWHGfeNSdEOo7UE4lX8xwPztdxSymE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747147755; x=1747752555;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=INtm454eLGLygSZvRwYLObcd+22LA4H68yKi06CR67c=;
        b=l8HOr0QMi3ByAxAIHTDTajKrEXo3hBYcg5NPC3Hl9GNzCtoH2JriXgYKAAPIbKj/Qq
         fGxpoTywKgZALjnqM0QJ31EyPF3i37G4NGfnDIENL3gJx7Eg1K5NfksU4KfG/9gA6Zkz
         HGIsdw2xlHyr4LtobPqZBvdoKsDaPLqFGQNpAWkL2clkOiyZ6lmlrc9NfOSSIB/A/Niw
         KMYumAcqgir8K+t0zZtjG251Gj+fwhd1KfV+8+ZLtNQWjfXhy37YN0tcxmoDoff1DVs1
         jLKv8ez+nHktakNdYMqF4YtgUy3Ihxre69+CpQKRhgqbruOVpQhqs/2veY7VcQO5pnTi
         P3vQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZhqVafnCocYdeseZ9gXozjp10ZPezyWTgI6l03yvdrmMlSPuu2I5FOx7FyP41+P5lMu2y/uAuLl0cxNM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpDVgfC8tnrGZLq3C58OgdPokZXieigsP9Sa3p5PZinjDASuu1
	lURO/JwujGttnJBEMyMfOLgqNRsWtZjaoTnvwf2kHdqwAdeCl9D2vZl+oqypZVozhmHbwHcGXz3
	lIllSUc0lwEmrGETaWibJ0ONDGHZEKXiU2EejdQ==
X-Gm-Gg: ASbGnct2ZkodHakZ/8fpjqpcEFOnuXNWSxHsi0AR3owsXClZKIyw7kxYxRupWI/Gysq
	FGj3vNrXMQF7RV3Ej7fb9mBbjgTejlY6Q3094Bb53yvUak3uMsXbnjnWOHDTzTTkdbQsKI+dksq
	9hN2jc/WMsb1cu2sfu3hL7G2D/3y415Ao=
X-Google-Smtp-Source: AGHT+IHMi0b35guHXrgTtiZ4j0wyseNTm6kwyQgLvmBJw94DJ3doIxx6ELS5Iqpew7qaDUBqUQqKzwbuOQT9yZ9ZyN8=
X-Received: by 2002:ac8:57c8:0:b0:477:c04:b511 with SMTP id
 d75a77b69052e-494527633b0mr258676151cf.31.1747147754944; Tue, 13 May 2025
 07:49:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509-fusectl-backing-files-v3-0-393761f9b683@uniontech.com>
 <20250509-fusectl-backing-files-v3-2-393761f9b683@uniontech.com>
 <CAJfpegvhZ8Pts5EJDU0efcdHRZk39mcHxmVCNGvKXTZBG63k6g@mail.gmail.com>
 <CAC1kPDPeQbvnZnsqeYc5igT3cX=CjLGFCda1VJE2DYPaTULMFg@mail.gmail.com>
 <CAJfpegsTfUQ53hmnm7192-4ywLmXDLLwjV01tjCK7PVEqtE=yw@mail.gmail.com>
 <CAC1kPDPWag5oaZH62YbF8c=g7dK2_AbFfYMK7EzgcegDHL829Q@mail.gmail.com>
 <CAJfpegu59imrvXSbkPYOSkn0k_FrE6nAK1JYWO2Gg==Ozk9KSg@mail.gmail.com>
 <CAOQ4uxgM+oJxp0Od=i=Twj9EN2v2+rFByEKabZybic=6gA0QgA@mail.gmail.com>
 <CAJfpegs-SbCUA-nGnnoHr=UUwzzNKuZ9fOB86+jgxM6RH4twAA@mail.gmail.com>
 <20250513-etage-dankbar-0d4e76980043@brauner> <CAJfpegsmvhsSGVGih=44tE6Ro7x3RzvOHuaREu+Abd2eZMR6Rw@mail.gmail.com>
In-Reply-To: <CAJfpegsmvhsSGVGih=44tE6Ro7x3RzvOHuaREu+Abd2eZMR6Rw@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 13 May 2025 16:49:03 +0200
X-Gm-Features: AX0GCFvyVWM0cut2uVH6adta3DCW-B3pHCICF0MF4L8XeLO3CDW5Uw88AbDAlUA
Message-ID: <CAJfpegvFsWyUsDcN7qQOEArc6WF9xre+gkC_kjgbyXPBHM84kQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] fs: fuse: add backing_files control file
To: Christian Brauner <brauner@kernel.org>
Cc: Amir Goldstein <amir73il@gmail.com>, Chen Linxuan <chenlinxuan@uniontech.com>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 May 2025 at 09:57, Miklos Szeredi <miklos@szeredi.hu> wrote:
>
> On Tue, 13 May 2025 at 09:39, Christian Brauner <brauner@kernel.org> wrote:

> > The xattr system call as far as I'm concerned is not going to be pimped
> > to support stuff like that.
>
> Heh?  IIRC there were positive reactions to e.g. "O_XATTR", it just
> didn't get implemented.  Can try to dig this up from the archives.

Here it is:

https://lore.kernel.org/all/CAHk-=wjzLmMRf=QG-n+1HnxWCx4KTQn9+OhVvUSJ=ZCQd6Y1WA@mail.gmail.com/

Quoting Linus inline:

| IOW, if you do something more along the lines of
|
|        fd = open(""foo/bar", O_PATH);
|        metadatafd = openat(fd, "metadataname", O_ALT);
|
| it might be workable.
|
| So you couldn't do it with _one_ pathname, because that is always
| fundamentally going to hit pathname lookup rules.
|
| But if you start a new path lookup with new rules, that's fine.
|
| This is what I think xattrs should always have done, because they are
| broken garbage.
|
| In fact, if we do it right, I think we could have "getxattr()" be 100%
| equivalent to (modulo all the error handling that this doesn't do, of
| course):
|
|   ssize_t getxattr(const char *path, const char *name,
|                         void *value, size_t size)
|   {
|      int fd, attrfd;
|
|      fd = open(path, O_PATH);
|      attrfd = openat(fd, name, O_ALT);
|      close(fd);
|      read(attrfd, value, size);
|      close(attrfd);
|   }
|
| and you'd still use getxattr() and friends as a shorthand (and for
| POSIX compatibility), but internally in the kernel we'd have a
| interface around that "xattrs are just file handles" model.
|
|                Linus
