Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29AA8EEDE
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 20:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747601025; cv=none; b=FmPbvaRXuBMf9Mtl7g5EqUBdfOHpmYnl331VF81sVU8hu+6JXkRCyR20g9HJEiK7hRBLQaTPBSH57tE1percWDTd6gaPEMQdSKoNUxMeamhjmTYV7XJmKNcm90rdGFwmreQVoWcIryPurzPFfY6u79Tptcs31HMlIm1eDleaKJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747601025; c=relaxed/simple;
	bh=UTTljIQsb/KpGsJJRGfTkSAUt9OYUfQN6NFER4p2aMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KxkfehT3OfKSnioK0379MWQ3bmbCbl+M/WxarMBeSAEoHsUrLLVKJSOvqcOcnRxtECXdhmIoHewT7+mCM/9a7qhGqE3z5c4ggNVLxHfSj2OBfqiQ351VnjdtFYwRDdW+Hnb0LF5IimMrBPhpS4wNyzgXRqfoAO1f13rX+uDuXp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0Xm/2m3X; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0Xm/2m3X"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-231ba6da557so207615ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 13:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747601022; x=1748205822; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bh74PobViRerifxVNc+5npj74h3zxCkB9eoqU1AHUXo=;
        b=0Xm/2m3XSbpAbUnoGhGyAbIcRoWZt0B5V4yakPy9PZDMHhK2kCa0wgm/j0S6Adchx5
         oYQHJ7PsOoSA4UU4zDViP9pcg6ZuCr2irUwxNBrxHQS1tsuBdHUilfOZZdQ7UOsJpvOj
         LgOEaP7D+4BEc/aYzQkidmLj8sq5xEmRUwff0V+ad+n+RCgQ525zuUmJfeKievXA6wyc
         Smv2xRuozsXuQtWDtdBUqao+y/M+gyiplSA2QbeerDXYEwUuqzbtgVwIZzQHr+8Lbxea
         KfFMYY1q6hD+TEUNvgdB0AzXdftdB+tXz1PJAjRmwt451Cv4++Q3ZsVQJIgh+LLWR5nh
         fRRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747601022; x=1748205822;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bh74PobViRerifxVNc+5npj74h3zxCkB9eoqU1AHUXo=;
        b=wifPSjtSzMa5Pdf9ghRMmzO+CacW8YUSJ4IRpAHjmPvQ3tC7N7OSNn/0XkCirBOSdW
         6Wbhr/KoojovLKSC801cKU+UHV6HlRc+0N5OCrMIYSnmLrL/7YTkfXEanArI0xpCiGDz
         nyZOI5Ft/CRkani++/LsgAhCm8gBWpKxk3ZSRwmwvoscnnyS2FNhdtPqgtBkczC4OH52
         FzrqDGNAvEqJyrBeLLWe/PjyIvnlKpDL7+CMUz8H+lti8IOOjZyMaiImwIiuFKCD5Dvl
         jItD+fKq0OmqrljYwDLmhttyllFl/bNv5sFTcTHYAl0pGaUO2OpUSRobM8U/wj16ERvA
         liaQ==
X-Gm-Message-State: AOJu0Yyo8WKd/Hd2X8ZJA54A/S9AF7UvJW8JTRchsOgZ7nTLeyp5DG3R
	0rFcncsThD2OD4Yp6m+GsamPQwnve4qrxR0pXLihU+s4IUq531pwRguGkSZfUdJ33g==
X-Gm-Gg: ASbGncu51+4Dw4+OoR1jwV0NV/M/EUNda33EiTJOs/afwchlck9PZh/Ev3L23tqtXzq
	YWmkGsJegPShOmsc7KVaMAXSJUQjZfOm+iaZohQnVD8zpIjoBRjLidr95aOWL8qKGAjZGJCjZtI
	K1R+uVzdpJe3zkOjLyk2QU9IeDFtnpG787tJtZNMe2KNLMZfpqq/cxg/1NhDzObZhAmck6JiH9v
	6rHpjcjR8hqXG0Mr/3WSyRmdLPPP4Hv5DoaoMnAL7284lxmaazIquFuHc7ILN2AR0fRjrQGh++4
	XJG3GT7DDfJj0HZaNhTCqGHQK2/nQHIUEW/e+OMUp/riczPZgglo8tWqssYhM1eUcR+VEikZDpP
	DajUiDx5AO6Gf93M/yH0=
X-Google-Smtp-Source: AGHT+IG1ny58ekp00G+b5KDe/adeI3qwRhbfB3pLjESyAcGVOXMF8Xm1/8BFekrlUNyxD+rLis7E6A==
X-Received: by 2002:a17:903:350d:b0:21b:b3c4:7e0a with SMTP id d9443c01a7336-232041436acmr2120875ad.13.1747601021894;
        Sun, 18 May 2025 13:43:41 -0700 (PDT)
Received: from google.com (3.32.125.34.bc.googleusercontent.com. [34.125.32.3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb084936sm4830392a12.56.2025.05.18.13.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 13:43:41 -0700 (PDT)
Date: Sun, 18 May 2025 20:43:36 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Anish Moorthy <amoorthy@google.com>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Rename get_unused_fd_flags to get_unused_fd
Message-ID: <aCpGePN3w0efNtpr@google.com>
References: <20250515170945.278255-1-amoorthy@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515170945.278255-1-amoorthy@google.com>

On Thu, May 15, 2025 at 05:09:45PM +0000, Anish Moorthy wrote:
> The current name can be misread as having something to do with unused
> *flags*. And without a get_unused_fd() function already floating around,
> it's easy to resolve this by dropping the suffix.

I don't understand the "unused flags" argument. Did you interpret the
current naming as "get the flags not used by a certain fd"?

Note there _used_ to be a get_unused_fd() that would take no arguments
and thus the naming behind this _flags() version (just FYI).

> I'm not sure if there's any appetite for refactors like this: they're tedious
> for sure. I couldn't find any discouragement in the docs though, so I figured
> I'd just post the patch and let it find me.

If it helps, this kind of patches are usually tagged as "treewide:" and
are often implemented using coccinelle scripts.

Also, for this patch in particular I would:
Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: Christian Brauner <brauner@kernel.org>

> diff --git a/drivers/android/binder.c b/drivers/android/binder.c
> index 76052006bd87..e162d92e8c1d 100644
> --- a/drivers/android/binder.c
> +++ b/drivers/android/binder.c
> @@ -4618,7 +4618,7 @@ static int binder_apply_fd_fixups(struct binder_proc *proc,
>  	int ret = 0;
>  
>  	list_for_each_entry(fixup, &t->fd_fixups, fixup_entry) {
> -		int fd = get_unused_fd_flags(O_CLOEXEC);
> +		int fd = get_unused_fd(O_CLOEXEC);
>  
>  		if (fd < 0) {
>  			binder_debug(BINDER_DEBUG_TRANSACTION,

This is the only reason I found this patch (binder), and fwiw the
renaming looks OK to me.

Cheers,
Carlos Llamas
