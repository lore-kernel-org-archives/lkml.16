Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75981242928
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 22:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746655991; cv=none; b=rVrhuAC9ZkYCdK/ruCn1am4VHT7Tx5nJJnQ5VqpeI1utSW+3XKUGEe/90wpIOA6ociiiF4oWwSmzcl0+YJkQ113HN7T03JYpwgDlSHvi3lN35AuhRpttvujb038X4cDnNeSGguOpBblyrOoXU5UOPeG2kHqLg96XHn1RLRzi044=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746655991; c=relaxed/simple;
	bh=YdWrWz3ZtdDCuUNMSZehjP/jint9xFF3sKvvIvZSRDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jBx1K10XNoXQ3GQ7mb1Nm8wZkMbOQiDqs2JnJ2MA0zhEscn1cgGEd1P9ajQbiMIb4vxGi0DeQ6eNzfJfo4xQAO/7gctBrB7zGNy6ENE2abpyIRhmdiOlj16S1LwMRv85IigGWdrFKV7cag1KSqNn3vBM7mkXtywEhMMhDiJMpg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=GAkKNHv6; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="GAkKNHv6"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-708b9b5299eso3391477b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 15:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1746655989; x=1747260789; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S8icWB/oIrX/HgcLARDHS+J6ctl2NAQ5/4rcyDqZz2U=;
        b=GAkKNHv6BvXVXyNgRgMDZq2sKPDLmdaTABIBlcDhF4jlFN+ARQ6EvA5MUnOqHzMkwF
         G2s2gLuA5gbcG3GSQweaxllwxyw6bysGVyo7GwCB5QeHjVLIKZg3aW9zgSGd3vOXOZ0Z
         3othp9xVTS/gm1GU4IPZPz/t1nju8YpIVRMhufUl7BnO4FFd6blItWIJNUm4tJbGOuHV
         wsTkcJZe72orsO6nPQmtM0hRiCXMPzQuMo0hYt/FzzDGNJIG2uwcCj80O3VMd7MIWpW4
         NHzaw19nr7/Q8jkLyTkKPut8ZwJmVkp3N4yb17E3nivUNjaQXuffr+FPVHW97V01Hb12
         1pjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746655989; x=1747260789;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S8icWB/oIrX/HgcLARDHS+J6ctl2NAQ5/4rcyDqZz2U=;
        b=A7qVRIEJWhtNeHipPPn0S6m+vW89WJU2ubmNPi+RBRvhnIHQtV12wML6miO4peiJEO
         BGFXMGyrAnl8yj9YM3Bf9r6yNnwf5FZKiHk/ORtpOrUIfbhGWQ5I62VrVhRIt8vruw4j
         8ASz+qlZp6s6mNK9LSj1gq3kZE7XqW1flMnzyjcMrWu1PI/Kbyr5f6sP8aXaQWEy38Zn
         Wsz7zxZ1ku2LEZOIpMJ1kBaQgioHyOMw71NioMQVRc5HITsZIgbXp5LpTc1NKxsaOOww
         JzP2w8lYIr16UrlNbyUNvwlMlr/QmgSRWKxroEbI9YWz7T8sboda7TgWUY7jNBT9gTJM
         KJoA==
X-Forwarded-Encrypted: i=1; AJvYcCXxVAy98H1BIKwcQrEx2JawYyOAbTLp6q8AgLneb4pB1zd8M64l6Ra6lG7ImVUkxzG9Ed/FKVatitFR7Gs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwswUNFjCt5tRQL3rtBnUPtblM/GIVdD5BEtAh5STABkvNsClNF
	TOCkSZshM2/vICi1Ja0OU/P9IXAz3Q6pjHjaSGJcMTIJxn7w4PPBn0DO3T6ORbK2UCIQvXXm0PB
	g4a72OGFpvrFcfV1MXsgE4Kt8fecs14IcG8QB
X-Gm-Gg: ASbGncuVa3gtOohbbXCco05cax+nQ7CdXuyoN6ocWQK6dVANeVdSbLpt1hzMDTdsrS7
	LPQqbWLRR9R/GOP+TkasOYm55XDDQd69tdmQPBlXXvxNFxnQWBPw2wkK3BY38fxe+3gL3ceij89
	i5rwOrWD1GUUU+c/go7BcE8w==
X-Google-Smtp-Source: AGHT+IHTCvYdc4odka87i+iikS8LAezFf+6/A6Tt3o8F08N9z96rpAljDv13alcoYAwKbSxuL/6ejDA67pfnCk+qTL4=
X-Received: by 2002:a05:690c:6012:b0:708:2604:4a10 with SMTP id
 00721157ae682-70a1da383f9mr73554767b3.18.1746655989211; Wed, 07 May 2025
 15:13:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507111204.2585739-1-alexjlzheng@tencent.com>
 <CAHC9VhRx6SUqYHm7Nv6JKVzpANsnt-qPONcVqZh=hXOsWMqDBA@mail.gmail.com> <20250507212329.GY2023217@ZenIV>
In-Reply-To: <20250507212329.GY2023217@ZenIV>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 7 May 2025 18:12:58 -0400
X-Gm-Features: ATxdqUHJQjdJboeHkSfNksr62Yf4EKEM9bAdRYV7SYcjIV4GMSrXhAmnRg3v_RI
Message-ID: <CAHC9VhScmdZLz7W=FN+mfWjf5LB7jbTJm5g-iy35hvvMgbKRfQ@mail.gmail.com>
Subject: Re: [PATCH v2] securityfs: fix missing of d_delete() in securityfs_remove()
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: alexjlzheng@gmail.com, Fan Wu <wufan@linux.microsoft.com>, jmorris@namei.org, 
	serge@hallyn.com, greg@kroah.com, chrisw@osdl.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jinliang Zheng <alexjlzheng@tencent.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 5:23=E2=80=AFPM Al Viro <viro@zeniv.linux.org.uk> wr=
ote:
> On Wed, May 07, 2025 at 04:10:11PM -0400, Paul Moore wrote:
> > > In addition, securityfs_recursive_remove() avoids this problem by cal=
ling
> > > __d_drop() directly. As a non-recursive version, it is somewhat stran=
ge
> > > that securityfs_remove() does not clean up the deleted dentry.
> > >
> > > Fix this by adding d_delete() in securityfs_remove().
> >
> > I wondering why we don't simply replace all instances of
> > securityfs_remove() with securityfs_recursive_remove(), or more likely
> > just remove the existing securityfs_remove() and rename the
> > securityfs_recursive_remove() to securityfs_remove().  Do any existing
> > LSMs rely on securityfs_remove() *not* acting recursively?
>
> It's a bit trickier than that (there are interesting issues around
> efi_secret_unlink() nonsense, as well as insane refcounting grabbing
> two references where only one is needed to pin the damn thing)...

Fun :/

In that case, what do you think of the change suggested here by
Jinliang Zheng where we add a d_delete() to the existing
securityfs_remove() implementation?

--=20
paul-moore.com
