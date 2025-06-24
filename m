Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5D726CE27
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 15:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750780104; cv=none; b=IRmVXbgX5HMww8Kd1roS+XkNUKfsN/i20k/Y7D4g7Bd4jUyVH86s3PfmmMkJIWsgrJYW6fNTEU8mmB3tVBYOUxWzxT6yd7q+2O2TkGn98wvYo85vHBxtkmmNZ02qNWP158CrfI/8xov0EcEhCLZB1NsKfoVGWv+rjrEYQRGiZQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750780104; c=relaxed/simple;
	bh=rqei9qBreDzFSqhyPq1Txm+8zbw8z7r1ww2hWrMKJh0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QQI/F10cNJ9+Q3KlkqnkTpAyxReoZH5pcOltBvclZm1b4tqfQt3kA9VUIiv0dn4SIhHaSlgzctPN3U+883ULzMcDBsRkZ2t836Bm/Qikl//I73YFqebqSqEAGhVCJciRwR0UkUKI4XGqSAP2e94Jg3MxC8eqrBjKVvPC7U+4szE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=BhHSA2zl; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="BhHSA2zl"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e7db5c13088so4326241276.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 08:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1750780101; x=1751384901; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kRkzc87wo0o4+fEkDS/rWH1wXvAXrHEHezkVOh191HE=;
        b=BhHSA2zlXOnHP1d+OBpbvliqHEb/R4UbyTKaLTYSLe5qun23JSomAs3HcV8dyuFrc4
         j/B+wiMipVBz5QTW0lzYvsF3iD6+x7IXyFMYxW0fk9A3cUnjBHfncBbAh3LzW++0G8Uq
         GI15R4dP6hQmvJdwLfBcMIX3CepUGLwhrFTZGBfU6whn68MS6JZPj8J+UtgJmQfTOVfb
         lE1Kur3f2QwWAuZL4HLzmvrdOra5JMqid01VXgCafnB67lXUwnbI7IpR1oAw50D2xpfL
         5NNPlUuQEPcplxs1q9JGWSlQrf4tHa9zwgRY5nQe+EWmOZ9+liZrstyaamJLYJQRN3B6
         0XHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750780101; x=1751384901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kRkzc87wo0o4+fEkDS/rWH1wXvAXrHEHezkVOh191HE=;
        b=Zq8rDJ7RoFpKgJl1OlYTp3HZsrmqCcIGDat+pQ5fPlLOSZbPHRmlH/cE1FohFRvuhX
         VtVOv8As60vrC90Q907fRDkgL63UEXyLK39Xp7K1S8LXvewuh2SyT3aF2t6ZAZAqcsVC
         FADo9OqWs1eV1jeF6HcmJSw7KzLHmldhomJoh8eF5w5eYS0dNG20aKaxxlt8TmKbOmPh
         ZWxbKyfgqF0vogOdPnOEKodY15tT+4h47aKEUlKWnhBjsMNYArp1dkWgSVspehpc98/4
         DSp+LsQaZ3z26uMsVteB2oSHyBOtdp0GLjuG/RYVPp4S2WCrRABbaLhK0D9ZwkbGkUSH
         dOBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRiU0I+zD8CD6M0zqruhTAAfPNu1rAQNLGv+1FslfMmiyhrWNqdxtg8sjQbH3CKIq1Rc7Ahm5pANXH1wQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPCqPHcXuvix57+ra2muorJ6oQwOEYexDOHUEQwADhZg6yfagd
	1H83wG/2d5gnMQYR0kqzmB01OncbJCC+raSRjDqrqrrSoYSCYmDPVKLyXuf881z7W17nzmmoyjJ
	Pa4HEg1PJyWkfFsPC/Pp5fwmHzOdyq97P20fbhROHPcogKp06JjA=
X-Gm-Gg: ASbGncv36izVc0ZipCt7+Qlx81x+ZWf+iRkWBtY2UbnkGdVA9qCR954c8l9jhIYwo4/
	cdh5llyEwq9mZE8QAtTsrw2KtcHBeIhKKTkcwkR0F6oDL5rYyE0itiJxydyshveJcMunCPnY2hv
	5NGnjaTVyrDHOaHDOwGM0MYESPeoUxVnCMELz+9HUiJVE=
X-Google-Smtp-Source: AGHT+IGCpAeeUvZuZrw41qBq6J0MfQKxEfqrEfdYhhQKITSwhrGmgEUBNlv5e3NpZvf1rvm31aCzNc2JqujqgB8FjeI=
X-Received: by 2002:a05:6902:1501:b0:e81:4f52:9983 with SMTP id
 3f1490d57ef6-e85f1e276e5mr4942310276.19.1750780101225; Tue, 24 Jun 2025
 08:48:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624014108.3686460-1-yuehaibing@huawei.com> <aFqZxu_Slzmux6jj@lei>
In-Reply-To: <aFqZxu_Slzmux6jj@lei>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 24 Jun 2025 11:48:10 -0400
X-Gm-Features: Ac12FXyLFEZgUbk_F14XoflEPfnghAr6Ptvan38PrR4N4Rw4pEnI3vksc5gaw-o
Message-ID: <CAHC9VhQ50UM6LxnUT7PSrGKNdbuUFJmZQmir1HtrQg_C9j6x2Q@mail.gmail.com>
Subject: Re: [PATCH -next] security: Remove unused declaration cap_mmap_file()
To: sergeh@kernel.org
Cc: Yue Haibing <yuehaibing@huawei.com>, jmorris@namei.org, serge@hallyn.com, 
	casey@schaufler-ca.com, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 8:27=E2=80=AFAM <sergeh@kernel.org> wrote:
> On Tue, Jun 24, 2025 at 09:41:08AM +0800, Yue Haibing wrote:
> > Commit 3f4f1f8a1ab7 ("capabilities: remove cap_mmap_file()")
> > removed the implementation but leave declaration.
> >
> > Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
>
> Hm, how did I not catch that?  Thanks.

At least you weren't the idiot who wrote the original patch ;)

I'll grab this for the LSM tree in a bit unless you want to take it.

> Reviewed-by: Serge Hallyn <serge@hallyn.com>
>
> > ---
> >  include/linux/security.h | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/include/linux/security.h b/include/linux/security.h
> > index dba349629229..e8d9f6069f0c 100644
> > --- a/include/linux/security.h
> > +++ b/include/linux/security.h
> > @@ -193,8 +193,6 @@ int cap_inode_getsecurity(struct mnt_idmap *idmap,
> >                         struct inode *inode, const char *name, void **b=
uffer,
> >                         bool alloc);
> >  extern int cap_mmap_addr(unsigned long addr);
> > -extern int cap_mmap_file(struct file *file, unsigned long reqprot,
> > -                      unsigned long prot, unsigned long flags);
> >  extern int cap_task_fix_setuid(struct cred *new, const struct cred *ol=
d, int flags);
> >  extern int cap_task_prctl(int option, unsigned long arg2, unsigned lon=
g arg3,
> >                         unsigned long arg4, unsigned long arg5);
> > --
> > 2.34.1

--=20
paul-moore.com
