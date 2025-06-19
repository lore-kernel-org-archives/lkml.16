Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606CD25D550
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 21:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750367060; cv=none; b=GDGJP2wB+V0JHS1yYL1M4SwDxW67R8n2kzSnZkaXYktnSAaB+22cei2wRIbUt9Mp24fwmBmwjUeHFSPSfByDzICIPVjKGrBGrTF2dDz9FjTiH4UDyE3eTzHU8qZp+l/kLJCqbjnpZlrd4MyEXz+s/WaVVtGTjvU7HSzy4ExZQc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750367060; c=relaxed/simple;
	bh=f38j4Iqo8acxnIhtuXkeD3cynLv4OcZQ7P8GpdgZm4k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l53w65UcvgGiUD7nHnAKcdPamOoRuIao5YrS+74i0u1Ieq2wfLcm2heqkr45aZhwA3Hj9jd2P6VQMxIcPGFhhB9rC3LWIShrh46AcDxYOvevp9qKeaLzXgGB8oZQegNNNuEMO7cU62rXGdoPixBylRcYklxI1KP0AK0aIEaZZXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=cW6D1BRd; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="cW6D1BRd"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-70e767ce72eso11171447b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 14:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1750367057; x=1750971857; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lumfk+fpW+/5RKyXlyleHS+MaP2GOeXbKZfOKNMMyIc=;
        b=cW6D1BRdeBH/yBYWcL/wW3xI9TIZwqjiAhDhf9YbmcTVJdcRUbCyG1arPgo+Yy6/aT
         Oaj4L9eF5s//T1+B/suXBN/LTab7Wt8VosVtYC6wWA4gLN0WbwvP46YDVaxLguhLFu1S
         S0WufY4MjC0O4LwZcgY2FgQ8PL4jmfMAJ8fvtoA30rBXnt8C+NtpkIOcLAmwFxoeWr8Y
         V14/jcyLgFMOTcpl3YCy6yyouurTHPnH+kId/uokOJ0Fr3WSjxbZzHpXDgLwuz3+/XbQ
         FURBQqIQpG5Uqg3omXXvKTbMUq2QmjOcLG75sn/DNq+9wrvGnaKN9dEl+ysaV2nHAr03
         yYFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750367057; x=1750971857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lumfk+fpW+/5RKyXlyleHS+MaP2GOeXbKZfOKNMMyIc=;
        b=SRISjAr+D4toyflz8NXKUCmSLlL8hrYBvbYi2M8FuLookGoLRjQ3gZQiARqJIzfAvj
         yQe7/q9FViMAzjeymScU7yjzQ0xFOXUCmb91QqZG1Ty+X9F3BOBcthKxQhHkAT4MdzaE
         AJIXg3/fb0Y4szsCksANeQgRC5HOarAInWxZWgy3yBgSkq4NGuiw5PSRCP0MOcxXbjFd
         VAFwNUJAC+l6I3BApLJE/+IA0JWDkDdxdhQjWOonQHvTM+su/UGdjuB+dGh4l5lt427o
         fYaqrYMS6tBTRqhCGp2yicxXOEz8mBFDYX4xfpP0McR0GYPDKCH79N2VYK528mUz1IYk
         kTtg==
X-Forwarded-Encrypted: i=1; AJvYcCUjrxAunE0YgsKPiwmSdR2y0CAL8GfbCxqSw1VRM9X5/UXh82R279BFm31bG4CE0xhmzEdH6ytx0tmufv8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzemaAii3CHSWNyTyZGg564p1sMJClXrXIAS3KNQ6d1SFddFlPA
	tI1hQu8KHI9QaHqzhhdqZTCtT1sDOUzHnh9HrCCBVjxw7o0A5SGTUc6+/T+F32tRxCF/PLRhEYF
	lZVTXXrePQpTzIZYAIMV3YwC87GzNHVN1UFMuFmyy
X-Gm-Gg: ASbGnctP9Ve0MMT6L5FdIloaGcEXu6vdsqCjCXgkRjeK9szeb4dGEoN7V0PpDE7QDlI
	+fVRQ+W+bx7DKLn8cr4NQ38MNo/iiySzYwqruimqR6Xb57tBL04RV+dDoiiX2eCSFVEg/U/UFE5
	NH9mi8Hsij4xnpDmLnoW47hwgBr81SG/9uunVSw5G8xtutAaVyW9D6oA==
X-Google-Smtp-Source: AGHT+IHTFe77unrYK9C7+eJbf2IZV6JzFgf/SfY74D8DPdljUvrt1WKcgPBYC5tSk0+mGANvgDk4AqDQw6/LqYvuk2Y=
X-Received: by 2002:a05:690c:350f:b0:705:750e:37b7 with SMTP id
 00721157ae682-712c639d784mr9888287b3.5.1750367057365; Thu, 19 Jun 2025
 14:04:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428195022.24587-2-stephen.smalley.work@gmail.com> <20250521003211.8847-1-kuniyu@amazon.com>
In-Reply-To: <20250521003211.8847-1-kuniyu@amazon.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 19 Jun 2025 17:04:06 -0400
X-Gm-Features: AX0GCFuvQDcj0Q4-T6mYoDn82kX6DVurSN3n5y6exOy2D1H3OZ7Mt_ie8lnZOc8
Message-ID: <CAHC9VhT71e7r6eS-j3o+ruciG1jyrBJ8zvrvQgaf3r+6CkgSuw@mail.gmail.com>
Subject: Re: [PATCH v2] security,fs,nfs,net: update security_inode_listsecurity()
 interface
To: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: stephen.smalley.work@gmail.com, anna@kernel.org, brauner@kernel.org, 
	casey@schaufler-ca.com, davem@davemloft.net, edumazet@google.com, 
	horms@kernel.org, jack@suse.cz, jmorris@namei.org, kuba@kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nfs@vger.kernel.org, linux-security-module@vger.kernel.org, 
	netdev@vger.kernel.org, omosnace@redhat.com, pabeni@redhat.com, 
	selinux@vger.kernel.org, serge@hallyn.com, trondmy@kernel.org, 
	viro@zeniv.linux.org.uk, willemb@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 8:32=E2=80=AFPM Kuniyuki Iwashima <kuniyu@amazon.co=
m> wrote:
> From: Stephen Smalley <stephen.smalley.work@gmail.com>
> Date: Mon, 28 Apr 2025 15:50:19 -0400
> > Update the security_inode_listsecurity() interface to allow
> > use of the xattr_list_one() helper and update the hook
> > implementations.
> >
> > Link: https://lore.kernel.org/selinux/20250424152822.2719-1-stephen.sma=
lley.work@gmail.com/
> >
> > Signed-off-by: Stephen Smalley <stephen.smalley.work@gmail.com>
> [...]
> > diff --git a/net/socket.c b/net/socket.c
> > index 9a0e720f0859..bbcaa3371fcd 100644
> > --- a/net/socket.c
> > +++ b/net/socket.c
> > @@ -560,17 +560,14 @@ static ssize_t sockfs_listxattr(struct dentry *de=
ntry, char *buffer,
> >                               size_t size)
> >  {
> >       ssize_t len;
> > -     ssize_t used =3D 0;
> > +     ssize_t used, remaining;
> > +     int err;
>
> Paul: Could you sort this in the reverse xmas tree order before merging ?
> https://docs.kernel.org/process/maintainer-netdev.html#local-variable-ord=
ering-reverse-xmas-tree-rcs

Done, thanks for reviewing the patch.

> otherwise the socket part looks good to me:
>
> Reviewed-by: Kuniyuki Iwashima <kuniyu@amazon.com>

--=20
paul-moore.com
