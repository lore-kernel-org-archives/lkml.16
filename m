Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B08D202F6D
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 20:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746648626; cv=none; b=YgBXHBUdASDhi4CbcD6evJFvGnPbI1kgkdyV0N6XMz35Vntu9dw1d0JDtlWZxmKQZ0ICuAwjIUOM9vcC2ZyZbeN5NFeCfbamYKPt3gufnYEDi/Wy+KRNaIYHvXu3PIxp6fqe+4On35OHmNT8ZQhUy2tKBHgKPI2tfHzA57S4038=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746648626; c=relaxed/simple;
	bh=fCVjwCn4xZyEXegMjpL82M9OYf/7NCLuKcF2+VPwsN4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VBPOscQTXub4boIaYofkJLi5yfF36ZOwRxEjOA9Gpg7Sc82YmUa4blCoVn8J3tO49XkabzEzExEvQ4n3rXcnZTGIJZWo7oYVP1DHcZhAUxFQYy3yJmzl/GbHHAl0yMcA2Z8p8EB7I1zWFVX7TC7MXRXBZMi5gxEEBdxlvxio6i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=OFe5KjdK; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="OFe5KjdK"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e78effa4b34so72749276.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 13:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1746648622; x=1747253422; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ekY7BJ7WiYIDpzZxnM9t3PLUraHpkr8ihNGY2FZPIE=;
        b=OFe5KjdKWI5HNCWZeXGR0NeIIA5DhfySOJg0/UHdr60h2SaFVPpPp27q/RKdzqcYYa
         0+fehHp+tpiDRthd+h7beAt3lT4ZNjcEWBSF3AZbrPyiHaTPCCBKIJIZHn/PkWrHfQuR
         niJ3JLSyIeO/K/H3RCwLgYI7jLS5Vwf2ljyb8+lrl6srsqnEY1xCtV9kg+iBX/PJfUM5
         9LUsH2woJli9ls+pjQpLvomhvRS8ix1j5oEyCQ/fN1DNrsZTWWwDkSnFL1XhPvnrhDRH
         VAAgQJctkli5C9IsZyeP5MCk0X36r2eGmWSnMlBNGcPGrMgMKQlfYN6v5JXrOPoQ9gIl
         +aCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746648622; x=1747253422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ekY7BJ7WiYIDpzZxnM9t3PLUraHpkr8ihNGY2FZPIE=;
        b=BrIdlEi6NTBc92g/jZgOPb0cOEaiAE79lECOAbhdJMrFHMZWvoeXZGVF7CZGP5Zo8D
         4PEv5Nzyyft25iY7WgO+4CKaK+pnFbDp9CeW6AGv9cPhQLPE+sPbcQSYN5mBIaZhXa4A
         GDHO+cyECVrsvDhKTYbMT1eErrnXFvaDCuQSIIRhju5BtN1IXawlUruB9HulWFAMAAXh
         YOzDLZAQTPFOmul6SIqe0fIchg46AK4LorKbxHWZWeK8B0IigQu6/SXUKjD0tS9/72ko
         pcKl6HdaZdXtCrOPTYl5o8mZrgAUZWPqQPj2TTn+SuG/nLdxkvpRyVxZH8smZI+f+TMA
         ZrBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPFK/gTcIJVTiuTkThl7x12MJRpCRJtZsh/axIaFKXRJVfUK32+vvm6PEC6P+Lkt3iAYkqGAoxpYVtJwk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzONRDAS9Xl/936n30aKGidU9etwYbTW31s9rDBdUDt0E6e+6Um
	xY2XIcbi6O0sclwwBTebl2kaMwZk6YODgKcKE19Y5GGRJKR3s/kaBdxUZV75gv9gKsH2BigCQDL
	ttPYaaBwyu4G01dL/55qAV/mJ0nZINl/p6cKU4rzqRs+kwnA=
X-Gm-Gg: ASbGncv3/yeQVFCaPYK4QVRKbisSLiGsdgORaa5Kjyis6cEM4XM9Zd0mpMLKHp9v08h
	mEfoR59WK/g1s5jJZmnqWd5NJ8FffVDiaPU2AhzHUXDbftRE2WBzLxkg/5CQQw7Gh6yFA3s4huY
	Y6bSnAVjSkWW4vViEwYZLDzw==
X-Google-Smtp-Source: AGHT+IE9eGdn2q9nrMivy1PDTWnn2AtAdrp67H8VrWzKCbbvNLD/0n7maPe9v5pI2/6b0zqxBN0BiDP6g0jnNg6Dzfw=
X-Received: by 2002:a05:690c:9c07:b0:706:aacc:d551 with SMTP id
 00721157ae682-70a2cad406amr14338047b3.7.1746648622007; Wed, 07 May 2025
 13:10:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507111204.2585739-1-alexjlzheng@tencent.com>
In-Reply-To: <20250507111204.2585739-1-alexjlzheng@tencent.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 7 May 2025 16:10:11 -0400
X-Gm-Features: ATxdqUFSGHLB_3GwIuKxTFWUJweW90nEeRxEVCljRPRLt5iua4c8odgJMYbAlnU
Message-ID: <CAHC9VhRx6SUqYHm7Nv6JKVzpANsnt-qPONcVqZh=hXOsWMqDBA@mail.gmail.com>
Subject: Re: [PATCH v2] securityfs: fix missing of d_delete() in securityfs_remove()
To: alexjlzheng@gmail.com, Fan Wu <wufan@linux.microsoft.com>
Cc: jmorris@namei.org, serge@hallyn.com, greg@kroah.com, chrisw@osdl.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jinliang Zheng <alexjlzheng@tencent.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 7:12=E2=80=AFAM <alexjlzheng@gmail.com> wrote:
> From: Jinliang Zheng <alexjlzheng@tencent.com>
>
> Consider the following module code (just an example to make it easier to
> illustrate the problem, in fact the LSM module will not be dynamically
> unloaded):
>
>   static struct dentry *dentry;
>
>   static int __init securityfs_test_init(void)
>   {
>           dentry =3D securityfs_create_dir("standon", NULL);
>           return PTR_ERR(dentry);
>   }
>
>   static void __exit securityfs_test_exit(void)
>   {
>           securityfs_remove(dentry);
>   }
>
>   module_init(securityfs_test_init);
>   module_exit(securityfs_test_exit);
>
> and then:
>
>   insmod /path/to/thismodule
>   cd /sys/kernel/security/standon     <- we hold 'standon'
>   rmmod thismodule                    <- 'standon' don't go away
>   insmod /path/to/thismodule          <- Failed: File exists!

I mentioned this on your original patch, but I'll mention it again
with a bit more of an explanation behind it.  As you know, we don't
currently support dynamically loaded LSMs, which means the reproducer
above isn't really valid from a supported configuration perspective,
even if it does happen to trigger the behavior you are describing.
This may seem silly to you, but you really should stick with valid
configurations when trying to reproduce things as sometimes when
developers see an invalid/unsupported config they may stop reading and
dismiss your concern with a "don't do that!", which is surely not what
you want.

At the very least, I'm personally not sure we would want an
invalid/unsupported reproducer in the git log for the LSM subsystem.

> Although the LSM module will not be dynamically added or deleted after
> the kernel is started, it may dynamically add or delete pseudo files
> for status export or function configuration in userspace according to
> different status, which we are not prohibited from doing so.
>
> In addition, securityfs_recursive_remove() avoids this problem by calling
> __d_drop() directly. As a non-recursive version, it is somewhat strange
> that securityfs_remove() does not clean up the deleted dentry.
>
> Fix this by adding d_delete() in securityfs_remove().

I wondering why we don't simply replace all instances of
securityfs_remove() with securityfs_recursive_remove(), or more likely
just remove the existing securityfs_remove() and rename the
securityfs_recursive_remove() to securityfs_remove().  Do any existing
LSMs rely on securityfs_remove() *not* acting recursively?

> Fixes: b67dbf9d4c198 ("[PATCH] add securityfs for all LSMs to use")
> Signed-off-by: Jinliang Zheng <alexjlzheng@tencent.com>
> ---
> changelog:
> v2: Modify the commit message to make it clearer
> v1: https://lore.kernel.org/all/20250426150931.2840-1-alexjlzheng@tencent=
.com/
> ---
>  security/inode.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/security/inode.c b/security/inode.c
> index da3ab44c8e57..d99baf26350a 100644
> --- a/security/inode.c
> +++ b/security/inode.c
> @@ -306,6 +306,7 @@ void securityfs_remove(struct dentry *dentry)
>                         simple_rmdir(dir, dentry);
>                 else
>                         simple_unlink(dir, dentry);
> +               d_delete(dentry);
>                 dput(dentry);
>         }
>         inode_unlock(dir);
> --
> 2.49.0

--=20
paul-moore.com
