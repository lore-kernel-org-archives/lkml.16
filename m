Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1132E1B414E
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 15:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745509226; cv=none; b=GE9dVMmOE0rse7fADkj+nfxACggT2avRTi6fKGoSzsryDhXHm04Z7bvOqQ6MOw/1aHkA84xcehQor4UFoi7tyw4gxYjdYKMU95Uxy4gCVkqTQzzU2wnTRFHJ4sDw6sI7VxDcVmHA4xFcbx0hEUOVdhqZVVOiqgc74v1IAPGGOM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745509226; c=relaxed/simple;
	bh=2kU4zcvrL7YbCjnkq7n+jO3UxoN5TmVVEjgW6RQAS3I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 Cc:Content-Type; b=rGeATBeNUIiLKQ2O31zmywhDt9qceR4zWEViVJSilhVyDfhWAT6xH6TZiXao/hb8DeDULKosNW8eOqm8nC/ws8gvib1a/4HKa9jUWwkb9JJm0J8DWyiZNtQySw6I2pUZN1Vci+YH765USNhFJFFOPrCP/86Rxgktlti1xjXy02Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LMBwdwf6; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LMBwdwf6"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-736a7e126c7so1142352b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 08:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745509224; x=1746114024; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pElVRnbM8O/DhK/o5KfXpu3krpqXcfDKNkQNvTEfW/E=;
        b=LMBwdwf6eKrFzDglb1kzXnPXxONx0B/bqXqb5AQebsMxlyWDJLC1QQh7JwHqsg+1t+
         B3LTZJ4E5Ia5M2o6cpbd9VoJBm8mQHcyqxNZoRC4848OodgC6pPxRli5wFm7ZPMjc+/N
         9CJO9z5a5OjiWdSM8Yb9rQ4XdZuJ/DxRrL+VY2jsTqVlPiBqusITYXJ9u/o/gwGHnkAm
         +aSh5SUueUsAnzNCs76db2sQXfY2VB3EuJ0M5yyr8cVXFMPpGyJGtvAcszZhhUvROCNd
         k1u6CWZAA3Ng+U4DnsPFu+FF/yx8uPUO+V3YKpXVtFvCdFcSlRtzo/PTzaTakI4T+6x/
         RbHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745509224; x=1746114024;
        h=content-transfer-encoding:cc:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pElVRnbM8O/DhK/o5KfXpu3krpqXcfDKNkQNvTEfW/E=;
        b=FJBL1XZFq+nkc/KNzvVUuwCXxt1GfyxZtupCz0yEqLYkyj6HYxJm3ZgjdqH5ocj7oz
         z3hXl46gSNX6KjA4OfVg6ib+y8uJdYimjPE1elWk4LOxlOLE8u+eTkbS6EnUeT1+JPDs
         kzbZ8kVKKLJe/Szi2ZuXDbxc5IdF0rhKNebFds0DZnoiDTlX8UpIoJ+K6lTGeSdX9syr
         Kgz3cOaZS/wkpypVJzL7AlsJTuc+F0MZGJulMJheINTKwFOJMp8wqd73zErTG3I4YpIf
         F60VAXhC96rKG7+/DE73wOMzggMPvtA+3SDChym29DazDQ9HxwGiphuZyWh0TRmu7Ne+
         x9Bw==
X-Forwarded-Encrypted: i=1; AJvYcCWWTImh+Q9cDeleDmL7B+tVQlMSQxY/5pLt0/UmRWpdZTs5LVSqSeTUn5jXfBIU1RZ1CiBit5q2pCQ5shM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzihUdPxp3+Y7ruNRKNn7I+sS7PwdYb2RL4a2SHEt0vRCItMVBb
	1xjx5lZNCKFlCoCwSZkueFZ0uCdkd3OgVoWi9avv7mgaiAYkSrf22DH+s8j6LvOJuu8wIAAM85X
	fJINLviu+swCCjT72QDlLZmLP2BY=
X-Gm-Gg: ASbGnctLFzO6isUU8SQ8dGrGQRU8rGGgRQjYAAftXTZJZJvS9/Y06I7UTner540Kzmb
	OvJ4cOnLuBR9xU87txn0iL1TkTnZPXojeGtg5KOFayRUFB3AT7PeaKVOrwjTuQausyopXyeFL1i
	3IedTZV9jvmDi0xJkCOJ0/Pw==
X-Received: by 2002:a05:6a00:1c92:b0:736:34ca:deee with SMTP id
 d2e1a72fcca58-73e32fb2b6fmt232027b3a.7.1745509224234; Thu, 24 Apr 2025
 08:40:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424152822.2719-1-stephen.smalley.work@gmail.com>
In-Reply-To: <20250424152822.2719-1-stephen.smalley.work@gmail.com>
From: Stephen Smalley <stephen.smalley.work@gmail.com>
Date: Thu, 24 Apr 2025 11:40:13 -0400
X-Gm-Features: ATxdqUG3sr40DXPqU7DwPGb7IBjfQ5iQvZE5Wbb_bSEPGq081PqgLufaGeVqmLk
Message-ID: <CAEjxPJ6V8aApDHaiU2+8pfDzf7S-bpgdFO3X6UHjRdCNFUNhXw@mail.gmail.com>
Subject: Re: [PATCH] fs/xattr.c: fix simple_xattr_list to always include
 security.* xattrs
Cc: paul@paul-moore.com, omosnace@redhat.com, selinux@vger.kernel.org, 
	linux-security-module@vger.kernel.org, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 11:28=E2=80=AFAM Stephen Smalley
<stephen.smalley.work@gmail.com> wrote:
>
> The vfs has long had a fallback to obtain the security.* xattrs from the
> LSM when the filesystem does not implement its own listxattr, but
> shmem/tmpfs and kernfs later gained their own xattr handlers to support
> other xattrs. Unfortunately, as a side effect, tmpfs and kernfs-based
> filesystems like sysfs no longer return the synthetic security.* xattr
> names via listxattr unless they are explicitly set by userspace or
> initially set upon inode creation after policy load. coreutils has
> recently switched from unconditionally invoking getxattr for security.*
> for ls -Z via libselinux to only doing so if listxattr returns the xattr
> name, breaking ls -Z of such inodes.
>
> Before:
> $ getfattr -m.* /run/initramfs
> <no output>
> $ getfattr -m.* /sys/kernel/fscaps
> <no output>
> $ setfattr -n user.foo /run/initramfs
> $ getfattr -m.* /run/initramfs
> user.foo
>
> After:
> $ getfattr -m.* /run/initramfs
> security.selinux
> $ getfattr -m.* /sys/kernel/fscaps
> security.selinux
> $ setfattr -n user.foo /run/initramfs
> $ getfattr -m.* /run/initramfs
> security.selinux
> user.foo
>
> Link: https://lore.kernel.org/selinux/CAFqZXNtF8wDyQajPCdGn=3DiOawX4y77ph=
0EcfcqcUUj+T87FKyA@mail.gmail.com/
> Link: https://lore.kernel.org/selinux/20250423175728.3185-2-stephen.small=
ey.work@gmail.com/
> Signed-off-by: Stephen Smalley <stephen.smalley.work@gmail.com>

Fixes: b09e0fa4b4ea66266058ee ("tmpfs: implement generic xattr support")

> ---
>  fs/xattr.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/fs/xattr.c b/fs/xattr.c
> index 02bee149ad96..2fc314b27120 100644
> --- a/fs/xattr.c
> +++ b/fs/xattr.c
> @@ -1428,6 +1428,15 @@ static bool xattr_is_trusted(const char *name)
>         return !strncmp(name, XATTR_TRUSTED_PREFIX, XATTR_TRUSTED_PREFIX_=
LEN);
>  }
>
> +static bool xattr_is_maclabel(const char *name)
> +{
> +       const char *suffix =3D name + XATTR_SECURITY_PREFIX_LEN;
> +
> +       return !strncmp(name, XATTR_SECURITY_PREFIX,
> +                       XATTR_SECURITY_PREFIX_LEN) &&
> +               security_ismaclabel(suffix);
> +}
> +
>  /**
>   * simple_xattr_list - list all xattr objects
>   * @inode: inode from which to get the xattrs
> @@ -1460,6 +1469,17 @@ ssize_t simple_xattr_list(struct inode *inode, str=
uct simple_xattrs *xattrs,
>         if (err)
>                 return err;
>
> +       err =3D security_inode_listsecurity(inode, buffer, remaining_size=
);
> +       if (err < 0)
> +               return err;
> +
> +       if (buffer) {
> +               if (remaining_size < err)
> +                       return -ERANGE;
> +               buffer +=3D err;
> +       }
> +       remaining_size -=3D err;
> +
>         read_lock(&xattrs->lock);
>         for (rbp =3D rb_first(&xattrs->rb_root); rbp; rbp =3D rb_next(rbp=
)) {
>                 xattr =3D rb_entry(rbp, struct simple_xattr, rb_node);
> @@ -1468,6 +1488,10 @@ ssize_t simple_xattr_list(struct inode *inode, str=
uct simple_xattrs *xattrs,
>                 if (!trusted && xattr_is_trusted(xattr->name))
>                         continue;
>
> +               /* skip MAC labels; these are provided by LSM above */
> +               if (xattr_is_maclabel(xattr->name))
> +                       continue;
> +
>                 err =3D xattr_list_one(&buffer, &remaining_size, xattr->n=
ame);
>                 if (err)
>                         break;
> --
> 2.49.0
>
