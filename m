Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53F02459C4
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 06:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747637011; cv=none; b=h+39BHsGWX1oLeVud+j67a72WSqVxMsSmblaSxv5AZzSm8l4pLrziH8Jrx3NoMZ/0THEEEi24xmFlbItv6OFyY+d2nFXxk5go3S395A3V5qp9dfifVqaiAe0cTRTswCc0vpuvRbFJDDI90B5iFTj2VThfWeNSc2G6/eEldYk8Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747637011; c=relaxed/simple;
	bh=04HsNv8CBzaQtdlPDlkFSwLi7tGyS5XkVBBnZ14l0LI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c3I/cXPiDqrPGpAwlE01QuvFNERIiL3THkM6r7N8EB/HgDYrcNG09RGcQWTw8mO3Og63bTmn9jFIrDNAOUQU+m+WtR3mhkHU8GiWvz2sVp6+wpmIAz6e2hSbRV5T+IO32Lha5YIJtwD3SfsRq2qR9KEIgq1YkuCOCXpdxJC/fMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FAbvlPM1; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FAbvlPM1"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-601ab204085so2329468a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 23:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747637008; x=1748241808; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=niRuJgiYnQwDy7VGIGyhqtewi5msGlLjN6lHsdQjCVY=;
        b=FAbvlPM1smh6NTlloj9meLyEdkWiolBEfX+0i7QArp92GcwjBtla/dic3Uaj+5AmkM
         ZzbW7/IJwC5yA3WIZyDoIfg1YM+Oiy3UkqSzp8RN7cPEpyJszltq5GOQPB5Vj4vHIVTo
         w8B7TATmKVxViC2TUBx4xYCiu2UAqcB+I9F/NJuxeKLutwk2UefCNNTmSf+w1ta33Yvu
         GPDSnehpAci0qGXvsjjz5Z/PRGLZkQRLcon9zDptCMmnfSlD9n/cWyOeh8C0x2/SNxWM
         lGQRbBx0bj89hBsSaAT82hTETnMi3z6WvJ7lmVMFKD0cupHB2M1wTulZAL9XZr+pwlL5
         pCOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747637008; x=1748241808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=niRuJgiYnQwDy7VGIGyhqtewi5msGlLjN6lHsdQjCVY=;
        b=CcCLsgF5yDlVKbj2Ps30N9ynGRXrR9plYZux8TCB8dI1wU0B0N7TEManFMSOYipLkb
         DafpepduL9nPVHziqevAEW2YqZ6iQfdMuuZyf2OTbFgXP9aQ1EjV5cz+ZdzdklpMbgBa
         64sFoGyFngrr78cbgkYkfe5mXv3ITqqhuxk6xL9nJtj4wp2VKYBwzKPatigOnWvSni1f
         506xIw9Q90/cnQYyckyVYUnJ8Dy2fU0qNxh15UnHk3yln0FfSb7wmkekm4imjpN1kDDu
         5NGzGdgTTsNbQKyODI4X+cFRnAS4OZ2GpkXGwf74qMzKE6+bIDFH2ejZnu/hbhHv1hjG
         kblQ==
X-Forwarded-Encrypted: i=1; AJvYcCWw/W6B07g43EVIybyE/rtFOKAn2Q+eiVuPL0YOJOllLyIqXctklQX7N4tdTiZSUxUiuGuGSyGuvXjl8hI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6MGYZRi2JbHs0HpaxGSE0NTuUM7qDMMPWcveAbvCUGccszJGZ
	ReOQ7bj+PWH7nLk/TYG1SgvTvKl/ll5yiAiKM8tH4xNDVtjUCDh+CMK/77tvAP1nK0SPQbB9cD4
	4ZASuiR3vm1rQHM6XdMEtkENr5Jm8r/o=
X-Gm-Gg: ASbGncv2pBws+Q2jXdeCZI8oMYZOefoXsvRNlbHNUOOV1seDd8QCwyMBQWd6exgN5kx
	Lr081U8krdfl/CjFig9tP+36ZeCU9eb/3bgP0Eh4lyh/7ICDPntyee4I4OpED/ANFJuTIahaOpm
	7NfbapKLYJS97I67I0E5jsCzTNyPw1XKtZ
X-Google-Smtp-Source: AGHT+IGQGDTImDb7hemjK0C6CG0zw8Tx7GPZRPnPRwbyqjKhyQQF4dNsCj7gEWhIea0B/s5rk35n1JTdQXkHkaKYrOY=
X-Received: by 2002:a17:907:9486:b0:ad5:7048:5177 with SMTP id
 a640c23a62f3a-ad57048647emr215220866b.23.1747637007581; Sun, 18 May 2025
 23:43:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519041100.7611-1-hanchunchao@inspur.com>
In-Reply-To: <20250519041100.7611-1-hanchunchao@inspur.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 19 May 2025 08:43:16 +0200
X-Gm-Features: AX0GCFt6TX-kpcqo6wFJopSCzFQ-753sUod7TzdE4KcmBnMO8hkNcQ5Eo9TeftY
Message-ID: <CAOQ4uxjU+RC_8Ec62irOy-Kd7H6UGuqpasq1qb5fXmZgkj_tUg@mail.gmail.com>
Subject: Re: [PATCH] ovl: Fix PTR_ERR zero argument warning
To: Charles Han <hanchunchao@inspur.com>
Cc: miklos@szeredi.hu, linux-kernel@vger.kernel.org, 
	Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 6:11=E2=80=AFAM Charles Han <hanchunchao@inspur.com=
> wrote:
>
> In the ovl_check_origin()  and ovl_index_upper()function, the
> PTR_ERR function was potentially passed a null pointer.
> To fix this issue, separated the null pointer check and the error
> pointer check, ensuring that PTR_ERR is only called with a valid
> error pointer.
>
> Fix below smatch warning.
> smatch warnings:
> fs/overlayfs/namei.c:479 ovl_check_origin() warn: passing zero to 'PTR_ER=
R'
> fs/overlayfs/namei.c:581 ovl_index_upper() warn: passing zero to 'ERR_CAS=
T'
>
> Fixes: ad1d615cec1c ("ovl: use directory index entries for consistency ve=
rification")
> Fixes: e8f9e5b780b0 ("ovl: verify directory index entries on mount")
> Signed-off-by: Charles Han <hanchunchao@inspur.com>
> ---
>  fs/overlayfs/namei.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/fs/overlayfs/namei.c b/fs/overlayfs/namei.c
> index 0b8b28392eb7..bc917b56e2b1 100644
> --- a/fs/overlayfs/namei.c
> +++ b/fs/overlayfs/namei.c
> @@ -475,7 +475,9 @@ static int ovl_check_origin(struct ovl_fs *ofs, struc=
t dentry *upperdentry,
>         struct ovl_fh *fh =3D ovl_get_fh(ofs, upperdentry, OVL_XATTR_ORIG=
IN);
>         int err;
>
> -       if (IS_ERR_OR_NULL(fh))
> +       if (!fh)
> +               return -ENODATA;

Not good. This is changing behavior.

> +       else if (IS_ERR(fh))
>                 return PTR_ERR(fh);

PTR_ERR_OR_ZERO if you must.

>
>         err =3D ovl_check_origin_fh(ofs, fh, false, upperdentry, stackp);
> @@ -577,7 +579,9 @@ struct dentry *ovl_index_upper(struct ovl_fs *ofs, st=
ruct dentry *index,
>                 return dget(index);
>
>         fh =3D ovl_get_fh(ofs, index, OVL_XATTR_UPPER);
> -       if (IS_ERR_OR_NULL(fh))
> +       if (!fh)
> +               return ERR_PTR(-ENODATA);
> +       else if (IS_ERR(fh))
>                 return ERR_CAST(fh);

I don't see what's wrong with casting a NULL pointer.
This looks like a dubious smatch warning.

We could add ERR_OR_NULL_CAST() but it seems pointless.

Thanks,
Amir.
