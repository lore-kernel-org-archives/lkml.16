Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9D882899
	for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 22:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743028864; cv=none; b=eRF1YPFo+6HjIianiymHP0gHllkDwe0UEQlwOLvQM63/wbYu47Tto1LobpoVRaO+OenrkAixwZjk0mDyF82xhAhLpcRvBD8DZO30jjKkyJcyvSx/LlmHETsyJrp36OI+tbTs4E6nM/suWyCHyZTbFlcZUNFMS5C0kTyLygG6P9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743028864; c=relaxed/simple;
	bh=QTPpgTyCOHd4BJPeY2buBn0sbwn91/ympFJZZ9fXfVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HefBtsClM+wip99NRF2PfJZ8srnY1Fi9sJsgJuVUW67nhf8ghxdFL6gMM/ixD9hpn0MNue9FQZrtrEyuR/XKeTsILpiA3ylyodX9cTvrYrAF3KqN0SHuOJ2Yj2x+xhvj5yBmxmmJc1fxvsQVa+1oG2stxCdTlHeUxNq2WrYbn/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ogqu1Y9n; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ogqu1Y9n"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e5cbd8b19bso1817a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 15:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743028861; x=1743633661; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kCAjqCKmDiWM+c5x9zuKEJ8IWxkQGJKcWbRaE9Ofars=;
        b=ogqu1Y9nsFZ9fmffSDe0WKbE43fOOtrNF11uJdwzrKqIzA1GGVE6NomnTbnbD7Np8w
         KGrwScRg/1rF2CAdpfpKz64tPliTyZKhaYUo7jOanZOjsdQtin60u8+7THWOaRayA7NU
         saAfndo96Z+A4ostQJ1BCxuw1lS2p3gmagyzGBTL8klz0o1uQ1AW//+Fgub0uupKVpFo
         Owj1Dg+sW7UR1hDzHKZ0APahXVsb7ZsbP5w6DamK8rq/IYEWrRF3nWqOBrWjggoR+Nc9
         4GwIr4oRsFDeCQh7oJ9LSgOhAnr2y+s+km0UwDEq6zkgp4WtRFf+Psdh94sVipQVwQpt
         VsRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743028861; x=1743633661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kCAjqCKmDiWM+c5x9zuKEJ8IWxkQGJKcWbRaE9Ofars=;
        b=vEGDp7vZ1O8xfkRB8cRwJMzbNXZxm3rQUkca2OVwOnekACfJsgz0LrCkVtTrG/FOnU
         AuSmHOPfL/X86jES5KS0TOAnlsoMXMcutRvx+9BjiBZXf4XTQxt9GabcYa/77Xwjt2/0
         uJrEi95qFCWN2gzch19lqWYTzRq9QZbUH0Xn0Onje4rlpX77xBpsS5dFSDmKOzi64jnh
         l8Vbei8+b+Z6MpdPa2r4fs1iDKH+8jR6eq/UAswiywdjI1Yci9N43HxrmI1xV0WaYWRT
         lRoVFaxZw5AV1jz68aUL2+6xvCXI7XIAssBb1Y+yZBCicxRUcoSX5H5tCWPRlSum9GJB
         a/fw==
X-Forwarded-Encrypted: i=1; AJvYcCW7bWYlSvJ2f4Mi7Ti4JWli6BKbfPLibke+hTPviBjZM5gBOmMn53ApvSj9XQLyozk4Vybo/qL3ZglpftE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPEU4rSdJk9i+2VaW1R1qYJibuAqQxQqzU1ed5Cf9WX5v/4le+
	BzSZ18U4uPaQLf8gTNelwo/6BGsdPmXmYNeblaFCGx+A8nYl8Rndr7DDwT8MOQI0CBHw/GuNB+e
	/EMnuiWlk5/iNM048K8H5/05ggv7YjOI3qtHV
X-Gm-Gg: ASbGncvBG3rWOxFeKWoLgxxa7Tf0hwkOmjrKasDMmd95/T7KSorW2SspDpRCRHDh82y
	im4OmG0ZvKyjazD1T0ynZM5nRmoYMNosk4KCJFeJ7eohaP4i2ZDPw4ZthF0ekNGr9Vh3wZU83RT
	vxP8i32ZXYTGldbsG6/XN+dpgPAmWlR66dqQ==
X-Google-Smtp-Source: AGHT+IE21vOhXCZ+0e+Y62cuSV2yJue8B99CFKpOojbrdWLK6qi64Al8ktq+5pMyclA7qwzF8RL5mFM6DvPZizL4J8Q=
X-Received: by 2002:a50:99d9:0:b0:5e6:15d3:ffe7 with SMTP id
 4fb4d7f45d1cf-5edac33de81mr17286a12.7.1743028860754; Wed, 26 Mar 2025
 15:41:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <39FF69551D01924F+20250326174156.390126-1-wangyuli@uniontech.com>
In-Reply-To: <39FF69551D01924F+20250326174156.390126-1-wangyuli@uniontech.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 26 Mar 2025 15:40:24 -0700
X-Gm-Features: AQ5f1Jp0Jo48hdofqbBlQASQBtWdmyqysx7wSPwMT5oCtUtcj5ZzxpqGYEV4jb8
Message-ID: <CABCJKue38PPo8LXSuBN1xyJqSey6Wxe6_+jL=tx7c0R4btNV7w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: deb-pkg: Add libdw-dev:native to Build-Depends-Arch
To: WangYuli <wangyuli@uniontech.com>
Cc: masahiroy@kernel.org, nathan@kernel.org, nicolas@fjasle.eu, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	petr.pavlu@suse.com, zhanjun@uniontech.com, niecheng1@uniontech.com, 
	guanwentao@uniontech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Mar 26, 2025 at 11:06=E2=80=AFAM WangYuli <wangyuli@uniontech.com> =
wrote:
>
> The dwarf.h header, which is included by
> scripts/gendwarfksyms/gendwarfksyms.h, resides within the libdw-dev
> package.
>
> This portion of the code is compiled under the condition that
> CONFIG_GENDWARFKSYMS is enabled.
>
> Consequently, add libdw-dev to Build-Depends-Arch to prevent
> unforeseen compilation failures.
>
> Fix follow possible error:
>   In file included from scripts/gendwarfksyms/cache.c:6:
>   scripts/gendwarfksyms/gendwarfksyms.h:6:10: fatal error: 'dwarf.h' file=
 not found
>       6 | #iIn file included from nscripts/gendwarfksyms/symbols.cc:lude6=
 :
>   <dwarf.hscripts/gendwarfksyms/gendwarfksyms.h>:6

I think something went wrong when copying the error message?

>   :      10| :          ^~~~~~~~~
>   fatal error: 'dwarf.h' file not found
>     6 | #include <dwarf.h>
>       |          ^~~~~~~~~
>
> Fixes: f28568841ae0 ("tools: Add gendwarfksyms")
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> ---
>  scripts/package/mkdebian | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> index 0178000197fe..25edee97fff7 100755
> --- a/scripts/package/mkdebian
> +++ b/scripts/package/mkdebian
> @@ -209,7 +209,7 @@ Rules-Requires-Root: no
>  Build-Depends: debhelper-compat (=3D 12)
>  Build-Depends-Arch: bc, bison, flex,
>   gcc-${host_gnu} <!pkg.${sourcename}.nokernelheaders>,
> - kmod, libelf-dev:native,
> + kmod, libdw-dev:native, libelf-dev:native,
>   libssl-dev:native, libssl-dev <!pkg.${sourcename}.nokernelheaders>,
>   python3:native, rsync
>  Homepage: https://www.kernel.org/

But the change looks correct to me. Thanks!

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami
