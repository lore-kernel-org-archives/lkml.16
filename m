Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01A04A05
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 13:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744897207; cv=none; b=nodeQ/6sTJ9hQCvqdwfT6iHfMjjDD6OXk19fBS3R5vPNl6FRDoapaCvk/U7MvkCe+yICfspYMh+CxvxbGZIVWOuHSMcjZdfvxVGUQ/64WEyrro6QlI424T9u9lu5V58K6ESNfcq0CA+osSliLkkHCFu4Obfahp8ZQQ0mk5HFGPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744897207; c=relaxed/simple;
	bh=Po6jtuQUXfnvs1Q8pYHk8exmHIfvXH6RF3vd2XiCm2A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kEgQ0106KhnAwHQzmi1VhBrxM9yoMsgRATImkb/SXdiOpceeEHRNQWwGu2Bs4ryehg8uDKQj5nriHQ3ZCMkvHTCvfxwGJOP5EqFETBnW40nFSpDT/uI395aMky8s449pMKva4I/8vQVQQwkiJpNae0UIdZDINH1RJPEFz2wGri4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Tf5R+dJU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Tf5R+dJU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744897201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zcbQrKkHnBeEO0liSW6jmala/g804rGL1ImFAEkY+zQ=;
	b=Tf5R+dJUP35ii7gOxUwBM3DtpR7Qv9t7Xs1gYhsngYC6DT39FRlieeVJQRQl8x4+W0Kheh
	bQqTAcqIKOP6wvzQy20UDIVmEgGosBbS7o24E8+23IxqMfKSgqtwjVqK+6yvxGKo3zhu4g
	GXprynsVc8EL1jh0p0t6lJQVxLd0i1Y=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-a0tStZ7bPGyU5X-dZw9jWA-1; Thu, 17 Apr 2025 09:40:00 -0400
X-MC-Unique: a0tStZ7bPGyU5X-dZw9jWA-1
X-Mimecast-MFC-AGG-ID: a0tStZ7bPGyU5X-dZw9jWA_1744897199
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2242ce15cc3so8452315ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 06:40:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744897198; x=1745501998;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zcbQrKkHnBeEO0liSW6jmala/g804rGL1ImFAEkY+zQ=;
        b=eh+VCeIrLyB2HJGbZjuNJyN101+Q88d50MRhTXB5EnkUU2fGNUr/wwz8taPqLJaK3N
         JJ8tGgXacrMi7FiS82SFiZRwGo0d7kvRrSoJ+Ck6yY1DkMgDZqihvb52/Fsm8ovHwKTP
         LR9zj/BNrh0cRpoRv0P1BISmPip1E27jgSgHqNfKCRV6bYTjtmRcdovl1mbWmngqEo/3
         sgHUhsvzMaGYntCgFk72+40Tdjp0dPheHA6hwZ3ylhaMpNLF3wsz0XAIV5LI0ds3mKmK
         GedCsY+jJjfmnO+YbSB8e6wOcwAw+FxvpN9UpT6JSu5KdMZm61ubBsJGHC/Am/BTK8L/
         1IGA==
X-Forwarded-Encrypted: i=1; AJvYcCVZOB0+KKjvpWuH599wmgktk+LdTFHWbQL0/4VDhntZwNW0ySaW4IYbYtEdIhVSLHnhuXKSR971/Fcz2ko=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQWnzpSczTfA0YRuC/W4RRuCyTt+yyZwyoBiBtuPNSvH8UsdnJ
	98mPj/ElNcodRhZlZ/OjBdVKC9p0RpOF2h1MkFphQgWefXvoRoBB4NTGeXAsGz9NINiSCdG9tSB
	U9Ip26hGwhMb0rJcGVV1UIhyxGzbvMpfWZBTBkfdNjryJ5jG2SyNUPyFC3ALVlomWKcdUkSGnPt
	CZGntK0v6UP5s36YGJmxlmRq2VXRXUYQ2fCHrDdM6ZnAh/
X-Gm-Gg: ASbGncvXdCDAp1THWHHrTnW7mbrIFnPLQh8S/FCVHk+Ulbe/0R+3nlexCS0nbyCqdJ/
	ZOKlK+FaZB5KC/TJh8m3yrzw/zPGEors9N2AurBnKLkLuObHuYKqWg5fTk4ZUnYCZB0k=
X-Received: by 2002:a17:903:1cb:b0:224:721:ed9 with SMTP id d9443c01a7336-22c35981e16mr89182935ad.44.1744897198402;
        Thu, 17 Apr 2025 06:39:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZ5rAGqIr1cPSxbdxrx7vXjd8oPl3FugfkE48mT3swqzsCyWHYDjO/wTTUzbLLvTBWTzhmtw26XXyoqf17mf4=
X-Received: by 2002:a17:903:1cb:b0:224:721:ed9 with SMTP id
 d9443c01a7336-22c35981e16mr89182705ad.44.1744897198109; Thu, 17 Apr 2025
 06:39:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417083839.937319-1-nichen@iscas.ac.cn>
In-Reply-To: <20250417083839.937319-1-nichen@iscas.ac.cn>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 17 Apr 2025 15:39:46 +0200
X-Gm-Features: ATxdqUE4N1weN2vFZ1XfAv7c3eJ5m5rjb8xCU1XP4Da_-Lcn3QJQunSg8dg0C5Q
Message-ID: <CAHc6FU6g5k5-D8E5HjS99TLhRRXDG8xuDYT4JX3Pp=HqY+b9cw@mail.gmail.com>
Subject: Re: [PATCH] gfs2: Remove unnecessary NULL check before free_percpu()
To: Chen Ni <nichen@iscas.ac.cn>
Cc: gfs2@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 10:45=E2=80=AFAM Chen Ni <nichen@iscas.ac.cn> wrote=
:
> free_percpu() checks for NULL pointers internally.
> Remove unneeded NULL check here.
>
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  fs/gfs2/ops_fstype.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
> index ea5b3c5c6e1c..8f9bb6677db7 100644
> --- a/fs/gfs2/ops_fstype.c
> +++ b/fs/gfs2/ops_fstype.c
> @@ -64,8 +64,7 @@ static void gfs2_tune_init(struct gfs2_tune *gt)
>
>  void free_sbd(struct gfs2_sbd *sdp)
>  {
> -       if (sdp->sd_lkstats)
> -               free_percpu(sdp->sd_lkstats);
> +       free_percpu(sdp->sd_lkstats);
>         kfree(sdp);
>  }
>
> --
> 2.25.1
>

Applied, thanks.

Andreas

