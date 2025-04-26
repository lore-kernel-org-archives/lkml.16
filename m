Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897D32701AE
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 06:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745649890; cv=none; b=ZG+U6do4mqkLHUeu3u/LV2oJo6rC1y5gXAOIqnp7OSnNrb2sIGn2270Y5Ze1/kR2kQkkmiVhrTeuLWcubnsPRFIVJmec1HCiKqMQ7SHwunn5VOYVnEwLQ0gOxnc5vaHQjWiX1GqwoKCmF0DyvI88UUaYPnm5BSDpofD/576ZL6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745649890; c=relaxed/simple;
	bh=XjYgF6vMzcoAdktFrsqIftqhHfqQv0eFv6mrRbclFzM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nFmTC9Litgjvp7kN0aJnfwD/rXI8UeiD/Z3N3SIbkaxLqa2cfWffeB4A4mHj01cruz7p7LTdkDYBbidH/NnLv1LWBaosBgdb9SWO1e4ekJYTLT86lqzjeDWCXtdhXmSJyFEhMrYulTrtdjPRe6BnphhlJBcFS/UIahvwUMcJJ6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FUGgpNaE; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FUGgpNaE"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5f6214f189bso5696527a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 23:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745649887; x=1746254687; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fHME/bRjyKN4oOcPRa/rPGLvfmF0pdDHAEiwSl5KEMM=;
        b=FUGgpNaE/H/TY31Mj0zFvF6ICV9qAzD3lxd8iSy9uAy2jCjo+wU+iKo0Y00Lr++G8T
         A9/8k9u/+BrzKTv2Xwbo0Rl9F1mdUpz2HgAarEJSUExbVtMPv4f3z4QYTVrMm8WibYLu
         /Gm+Z+3b4V5MMcVVfZ+svS+sFYYY7rU3gVzjWe8myr0avuhtyg3T8zTGYQabOLei5FIc
         t1aMyNWlTx+57Y93NCtcyGygU1/hmTUxsLBfrOlLXPFXA1l6kH/JE4/X0zMvTO6c/z7g
         FFgw63ERmO7GVIkYfZ6wSh6kbmMOSdTM2oCHUU7ePiAXNSYm5wpnmBRXYHKlJp9TSPBR
         HMyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745649887; x=1746254687;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fHME/bRjyKN4oOcPRa/rPGLvfmF0pdDHAEiwSl5KEMM=;
        b=vfHXBEHxkq0EduK1hwvN7Pxxc+vj2L9WxJuspQE6ZLIrs5NIpdvS/1rVZ7Vi+o3rhp
         mTQknp4gO5BRF27knw4WEDX46gU5ezw2rT1XfgrPT4xfiuAW5mUsGaMcUIwWn8smvXCN
         bQR6XGQwNbX9nF8bgwyg1FVDqsg1ZqyxHuZpFNUi4kMHLuCrlS+W4HS/ffDUsrinxmrc
         beNXBGfR5CQe8W+ut+/4f/oMKxgRp/Ahzy+4C0qV3BN0Z9qZM/s7JFJdoTusHyVdtE2n
         NcnLJ5zXcK5GA6E+3acGClYiVdbtQGpjb5FurXr37CMslclWQnxjaFuprYBwBXMe7ozq
         2ocQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZ03U1K2+JHbPTSrxkRyUVsZWHC5ys1Z8Rjw5PHl0/L5lCJ3I9QxnLyOskD1IzPthrCLSDbnggjnMwIXg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo/NhdIKlvskgVsJ4vBE3TSxOkH8gC3tnZqedgPdJ+EmgFOa9a
	RAgwYhUCx6ElSqBgJ4X38+5FwpKWD52WwjpghKarL3ypHcT7HuEcswAH1hDALuJ4ADwaN9zaHay
	2jz2BXWMarFzTCh/qt+IrT2xlz8k=
X-Gm-Gg: ASbGncu48qwrBmMtMyhu5URRUa1umZ3WiJp2R54stMITay4vH5NaOpXFBsCbwCJpmri
	AmfW1UdsBaDNmSqwh3uVFqD7RmPYJQ3AkgOKkRAq+nz/rxYf6n9u0SJ5fHnbO96c/pftDzXomvq
	uAFO917EGINrn3hhHE9nHC
X-Google-Smtp-Source: AGHT+IESh3rZBLgETKRl1ROeDzX/G34K5wtO+8A62nhS30IUp5WyZyK/IFihKomh3aMZd2O2VekZK/I1Rrr7DOCs5uc=
X-Received: by 2002:a17:907:6d0b:b0:ace:3214:fed8 with SMTP id
 a640c23a62f3a-ace73a6becbmr418087566b.27.1745649886436; Fri, 25 Apr 2025
 23:44:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPM=9twNOWYCQ6vXZqUAu8G=oxGrKUvcTYz-SL6Jc=4+8ivVew@mail.gmail.com>
 <CAHk-=wj+h6i94DyxGQ2Ez6tvp2sBs70EfY7Lp0N1umpwHL_VrQ@mail.gmail.com>
In-Reply-To: <CAHk-=wj+h6i94DyxGQ2Ez6tvp2sBs70EfY7Lp0N1umpwHL_VrQ@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 26 Apr 2025 16:44:35 +1000
X-Gm-Features: ATxdqUGHpE4_NBal-qN1lACXwjo5KPm8TJfghSYA-Kyv4pw9bObhP-z7YybwtSA
Message-ID: <CAPM=9tx2XsDNFDWkxndpFPNihgf18CK7Ps85vE4ZRvuLBG35UA@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 6.15-rc4
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Simona Vetter <simona@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, 
	LKML <linux-kernel@vger.kernel.org>, bentiss@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 26 Apr 2025 at 10:56, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, 25 Apr 2025 at 16:12, Dave Airlie <airlied@gmail.com> wrote:
> >
> > Weekly drm fixes, mostly amdgpu, with some exynos cleanups and a
> > couple of minor fixes, seems a bit quiet, but probably some lag from
> > Easter holidays.
>
> Hmm. Is freedesktop.org feeling a bit under the weather?
>
> I'm getting
>
>   remote: GitLab is not responding
>   fatal: unable to access
> 'https://gitlab.freedesktop.org/drm/kernel.git/': The requested URL
> returned error: 502
>
> and when I look at it with a web browser, I get
>
>     HTTP 502: Waiting for GitLab to boot
>
> and it talks about it taking a few minutes, but it's been going on for
> longer than "a few minutes" by now..

Indeed between me pushing this branch and you trying to pull it, it
does seem to have died, I've pinged the appropriate authorities.

I've pushed the same branch to

https://github.com/airlied/linux.git drm-fixes

I can try to create a pull request from that if gitlab isn't back tomorrow.

Dave.
