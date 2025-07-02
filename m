Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB2130AAD0;
	Wed,  2 Jul 2025 14:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751468163; cv=none; b=Gtagu38+8XteW+7LvIuVFpH0gcRolzYBo63k0vRO81Ox7I4QWAqIzDUyIX6QlRLw4ewxeAX0K+bTqZYSGJVYcP2v3nS0ceLxFl3MbeL6O5Zzs+nvokGOqQU6yJGALr+2h3RAEfhIabYnOzmm2Eita//xrqz5V9MvgJ6aQrYmgPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751468163; c=relaxed/simple;
	bh=Dlr641/jaRt8XQMPWF8AiBsdrW+iNEiGMzhd7bwiQN8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=INlGuaNAM2Rq2sGTcXQ8ZT3T9ALbJpsmngTsINV6bwI6qQcnqi91YoGmeKZ68muGNvrZNLwKddAq2lzI/GMIAF8bthCsyBjld+gmulVL4DyBfXRdv42DIXGC1mcpHg9IRYG/DejPz+QbevLvrXAaG5H9f/90qeTN3d0PvE1FRo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZDpPgf5S; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZDpPgf5S"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-60dffae17f3so6494668a12.1;
        Wed, 02 Jul 2025 07:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751468159; x=1752072959; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S34LfcZO7mNIrklHTL3tRuBy4Dtgu5OYviVtTOiNfuk=;
        b=ZDpPgf5S/VXmEvHM10yl41n6Hl2EP822OWN8RUeHUOxT9tKLv4FNee9JKBeijNMIgY
         M9Yi2gfV5XVUUf2m8UI3PsgjDxP31IS53SjVcbpr59sMECGlYNyDgm/ODWag3VPX25j0
         8Zw3d8qtkJEXsIvCvjX0IViHUYmoV9cUhHD5hLOSgKbO2xqUXsIfKYIOoGCaKsD1ARYt
         wIwvZWI+Gbo/6U8Tb/IRQY2wQDPbfJ6xY+PIOAA8YqeWdOQf5J0cD1A4S635y20EKn2q
         iDsuhS284x/TO8h01ilNdCifxh7+wnLi7Ms2Eppt1mmXb4Y1CQC6W4Nj+B11YhFosdzL
         yUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751468159; x=1752072959;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S34LfcZO7mNIrklHTL3tRuBy4Dtgu5OYviVtTOiNfuk=;
        b=s38n+cloCfXi+ziDUbGsWiz402j0rV6MtXEo547pTlTamLTA9KvNeSlZmnRK6fcD4H
         Cy4BgvFaJeE+dgA85pN1DcvoRu10HjMISS2GdGUrvEZGFjfpYsNZxTTT4shXNPJyxBRt
         yyLUNdXHlWZT7inRzVbgH+poMjgKEOQnnIymZ8x6Yf//DRnWDwEoypEO1ij/gd8eGumK
         HARBUqllYEl0l9trsaPUfxWyf/Nfoem4i1tKBsyeKom2XHkiIi1ht8zeYivmSsMom4Ul
         JTLzavlGkrI3Hv8YIT5ZiNodvefDwyedBJRA7wK0CC996t4TOPWEQw/c1/nve/xKouuX
         oKVw==
X-Forwarded-Encrypted: i=1; AJvYcCUyFfZMgOcxRikMn1yBqPU/wq33FXARsOqHor3x8hLbk3RH3vYcpE4I//Yujy1L7JbLQIbqgZ4j4XM=@vger.kernel.org, AJvYcCVxNuUzVMeqDt8pZOdT0x3OpnLNnk7t1iw0CcDBm+dGf/FwxLnTypg6ok9vZgtuAavDPeIICQggZtWKRM/o@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0+JeIDiKr9swSrVKq3Got5E+x5PHzBllnVVg6GbzdkIBZRALj
	QrdZYpR7pjFSNpwEnYifOQRJ9J9OWOoMpdJ56TEEy69Zwthk0kOC3cQiqzFsPt5H5tEYZ0JXue7
	rl9G+RKENf89pL/8Olr20LYwQD2KEFMbrMr0OplsfYZB+
X-Gm-Gg: ASbGncuVInN/WFAf0tgMv3fSUjJSwmO8AYM1EDAxlzlQTP8tmahHwqBVrxJVKMyyqMo
	7rP9olXE9Jz7ab0fW2efYfpu1w71MY4TpPDcJv+tqAA2PAWqm4fK4xa36N1jH8r023XHzdc989u
	QgeIQMW16IK7Lk1ZB3N/tOiWCMU2ev6efugM66Id/0ZvU=
X-Google-Smtp-Source: AGHT+IHCEqavMSJODrLTljm46mako9PS+GfEa4EIPBB/UT8YujbWBkSGLagwXsUuebN+t4VZEV49aqN6Nk14poXWsTs=
X-Received: by 2002:a05:6402:42c8:b0:607:f31f:26de with SMTP id
 4fb4d7f45d1cf-60e52cc6eb2mr2893432a12.1.1751468158524; Wed, 02 Jul 2025
 07:55:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630192443193j2wDCmmnHGLns9ki1GXcv@zte.com.cn>
In-Reply-To: <20250630192443193j2wDCmmnHGLns9ki1GXcv@zte.com.cn>
From: Alex Shi <seakeel@gmail.com>
Date: Wed, 2 Jul 2025 22:55:21 +0800
X-Gm-Features: Ac12FXwotRrLlSoxuekGOpBvg3j-FGRPeRXWTHkUWfF-T8pYqlVrrsj85n2E0iU
Message-ID: <CAJy-Amn_8e+Vveab65rVmo1=UOax6UPWxgq59bDYwx27_u1nfw@mail.gmail.com>
Subject: Re: [PATCH v4 0/3 linux next] Docs/zh_CN: Translate networking docs
 to Simplified Chinese
To: jiang.kun2@zte.com.cn
Cc: alexs@kernel.org, si.yanteng@linux.dev, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, xu.xin16@zte.com.cn, 
	yang.yang29@zte.com.cn, wang.yaxin@zte.com.cn, fan.yu9@zte.com.cn, 
	he.peilin@zte.com.cn, tu.qiang35@zte.com.cn, qiu.yutan@zte.com.cn, 
	zhang.yunkai@zte.com.cn, ye.xingchen@zte.com.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jiang,
I cannot apply this patch on the tree:
git@gitolite.kernel.org:pub/scm/linux/kernel/git/alexs/linux.git
docs-next. Could you like to rebase the patchset on that tree?
And it's better to pick up your alias translation patch in this
patchset too. That would be much more convenient for me.

Thanks!
Alex

<jiang.kun2@zte.com.cn> =E4=BA=8E2025=E5=B9=B46=E6=9C=8830=E6=97=A5=E5=91=
=A8=E4=B8=80 19:24=E5=86=99=E9=81=93=EF=BC=9A
>
> From: Wang Yaxin <wang.yaxin@zte.com.cn>
>
> translate networking docs to Simplified Chinese
>
> Wang Yaxin (3):
>   Docs/zh_CN: Translate netif-msg.rst to Simplified Chinese
>   Docs/zh_CN: Translate xfrm_proc.rst to Simplified Chinese
>   Docs/zh_CN: Translate netmem.rst to Simplified Chinese
>
>  .../translations/zh_CN/networking/index.rst   |   6 +-
>  .../zh_CN/networking/netif-msg.rst            |  92 +++++++++++++
>  .../translations/zh_CN/networking/netmem.rst  |  92 +++++++++++++
>  .../zh_CN/networking/xfrm_proc.rst            | 126 ++++++++++++++++++
>  4 files changed, 313 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/translations/zh_CN/networking/netif-msg=
.rst
>  create mode 100644 Documentation/translations/zh_CN/networking/netmem.rs=
t
>  create mode 100644 Documentation/translations/zh_CN/networking/xfrm_proc=
.rst
>
> --
> 2.25.1
