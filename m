Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B9B19CD1B
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 07:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748243067; cv=none; b=uR/iE5viFO3VHF/SQeoVFsG7zEILo4m8VeXjOhjWKSMJE+N1vASzuktAPLJAykwug4uM8tVz26/BHfQHz8hTpc8fjXqjZa0TE/qbf9yA2GZ4I9rP0KhvOzx+jD9wANRybNHwYdtk2L5oHZn02ZstGnoHmpr6UzVYp5PhPwAdD/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748243067; c=relaxed/simple;
	bh=/KjtSwvPWJ1jRSl2ED9yyTGBt2MsUlLauotMZbELXeI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TUcGbyrSsPb3vwwqWbnKnFkWL9fu56Z+tywrnJYkXwDZhkq5tVp8WLEtLOwq1D4xMpjQvDh9c1X7XBiDFKTVn7geRDd6lWr6W/+8hZijf8jtj+Pkj9Q+OWyeiRWRs9QqPB80QtPsXadBAU8Wppbhs3xqrKh2EJYozI9L6GRDCCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Vc8g1cOX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vc8g1cOX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748243061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZsSqa4El9fWisOjdIZpyGfNCohIxqbRRIDaHJl1MAcg=;
	b=Vc8g1cOX6i+6wluOw+6FpbSX61PXgQKXtQPsCAnVJVWnA2Sp9CR/L+1umaxrNjzF2T3scg
	RvvH1/PYDRSu2BHx8Ixaob9KEGUxq0EaMcWoSNbOt5gvSn+AKFRQO50FBzjKav61VsV6hT
	zaxfiG9e2SR7p+jwSnd2IPpFV6VcN5c=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-35-FXZa4aNZNJetE_Ma2OJAGA-1; Mon, 26 May 2025 03:03:49 -0400
X-MC-Unique: FXZa4aNZNJetE_Ma2OJAGA-1
X-Mimecast-MFC-AGG-ID: FXZa4aNZNJetE_Ma2OJAGA_1748243028
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-550d7bd9a7fso944064e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 00:03:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748243028; x=1748847828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZsSqa4El9fWisOjdIZpyGfNCohIxqbRRIDaHJl1MAcg=;
        b=nqbZLazUAnQHhKyVDVefOTP4/XEZLDKuoXSjML9kDZuC9/QzgIIDOyZDtNuX2+ynIM
         9kv8+5y5yosuIs9ed9FhgHH+wpETTs0wHyI4XWD7Z++lPfkEbNWdn9y/KtcHANnmpSP0
         7jpHt9gp+PN8QFfYQOBMetS4cOHGFZj2UUhya4em3Z2p9m1Tp0XzQxYqCi26JmS1Gc9N
         gbzfFD1tuOPk7oXXEV3ah+a1G5PYy26W9mn7k8XAOA/1KO8r1neb6DgA2OCrJXGZ8fTf
         WSUn0hthOqShp1OpnyxwpaQGnXa7URq9p6bnsXbg9PRbjK7bIXYSEUExWXdaGZLiq4LV
         wEcg==
X-Forwarded-Encrypted: i=1; AJvYcCX6oP+WoGaR8aInvJVenEYlNzE1kDoTmukwky3ZfIE7XSmyxMe1i+lMT/Q3GV2B439h+vcAzTG8aEfVQ1Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh3R8L8oqzIsYkt4LBCV+PSC7hyVcaEZEEHi5Vx4SUBunRTuw/
	akqO/K6PM3RowGE4X+mv4UE3ZvrauwQIBhw0geE+c+paAFnLT6hw6wCAswVOK7p284Z8TskDzNW
	bdybO70iEmRXyrYMfzqow8vx9XKlHz/Uxdpzjl4myM48J89CQEAnPRual2JtFDnA6ck7PZ82MUl
	/wIKOfRp/sTWrw/3xHcyucRou6KTjjgbCZgRCzHp1o
X-Gm-Gg: ASbGncuo7j4UCEftpC3Fxg+wsZuOZalqvVWC1lDC02G9rDDv5pe7cc3iPdTAK4rWSgS
	QiBuJyLmUgK0rCV8zZxEHjy7Yx1z4LNaFiWXzAvmh3wYZR9wi3e7VraDM166Ev5mesP1LLQ==
X-Received: by 2002:a05:6512:e81:b0:54a:c4af:29 with SMTP id 2adb3069b0e04-5521c9b49c3mr2194372e87.52.1748243027678;
        Mon, 26 May 2025 00:03:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiI1Yk6wtJQGChMVRuaINop3PCJafppboQa8n3wGOEjdM+iFjM89BfGUysLGx/bSchoPaUn/ub/pVQf6fAwJQ=
X-Received: by 2002:a05:6512:e81:b0:54a:c4af:29 with SMTP id
 2adb3069b0e04-5521c9b49c3mr2194360e87.52.1748243027250; Mon, 26 May 2025
 00:03:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250524061320.370630-1-yukuai1@huaweicloud.com> <20250524061320.370630-9-yukuai1@huaweicloud.com>
In-Reply-To: <20250524061320.370630-9-yukuai1@huaweicloud.com>
From: Xiao Ni <xni@redhat.com>
Date: Mon, 26 May 2025 15:03:33 +0800
X-Gm-Features: AX0GCFvwXVzrH9q1dPb-evKEBo6AYWl9O-76qs7DSfOVQGYh8gvgg_A7YC7NPKI
Message-ID: <CALTww2-bZ83SjNntJOmKmY8J8+8b2tE3JMTXbzcRr3K8yCj9xQ@mail.gmail.com>
Subject: Re: [PATCH 08/23] md/md-bitmap: add a new method skip_sync_blocks()
 in bitmap_operations
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: hch@lst.de, colyli@kernel.org, song@kernel.org, yukuai3@huawei.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-raid@vger.kernel.org, yi.zhang@huawei.com, yangerkun@huawei.com, 
	johnny.chenyi@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 24, 2025 at 2:18=E2=80=AFPM Yu Kuai <yukuai1@huaweicloud.com> w=
rote:
>
> From: Yu Kuai <yukuai3@huawei.com>
>
> This method is used to check if blocks can be skipped before calling
> into pers->sync_request(), llbiltmap will use this method to skip

type error: s/llbiltmap/llbitmap/g

> resync for unwritten/clean data blocks, and recovery/check/repair for
> unwritten data blocks;
>
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/md/md-bitmap.h | 1 +
>  drivers/md/md.c        | 7 +++++++
>  2 files changed, 8 insertions(+)
>
> diff --git a/drivers/md/md-bitmap.h b/drivers/md/md-bitmap.h
> index 2b99ddef7a41..0de14d475ad3 100644
> --- a/drivers/md/md-bitmap.h
> +++ b/drivers/md/md-bitmap.h
> @@ -98,6 +98,7 @@ struct bitmap_operations {
>         md_bitmap_fn *start_discard;
>         md_bitmap_fn *end_discard;
>
> +       sector_t (*skip_sync_blocks)(struct mddev *mddev, sector_t offset=
);
>         bool (*start_sync)(struct mddev *mddev, sector_t offset,
>                            sector_t *blocks, bool degraded);
>         void (*end_sync)(struct mddev *mddev, sector_t offset, sector_t *=
blocks);
> diff --git a/drivers/md/md.c b/drivers/md/md.c
> index dc4b85f30e13..890c8da43b3b 100644
> --- a/drivers/md/md.c
> +++ b/drivers/md/md.c
> @@ -9362,6 +9362,12 @@ void md_do_sync(struct md_thread *thread)
>                 if (test_bit(MD_RECOVERY_INTR, &mddev->recovery))
>                         break;
>
> +               if (mddev->bitmap_ops && mddev->bitmap_ops->skip_sync_blo=
cks) {
> +                       sectors =3D mddev->bitmap_ops->skip_sync_blocks(m=
ddev, j);
> +                       if (sectors)
> +                               goto update;
> +               }
> +
>                 sectors =3D mddev->pers->sync_request(mddev, j, max_secto=
rs,
>                                                     &skipped);
>                 if (sectors =3D=3D 0) {
> @@ -9377,6 +9383,7 @@ void md_do_sync(struct md_thread *thread)
>                 if (test_bit(MD_RECOVERY_INTR, &mddev->recovery))
>                         break;
>
> +update:
>                 j +=3D sectors;
>                 if (j > max_sectors)
>                         /* when skipping, extra large numbers can be retu=
rned. */
> --
> 2.39.2
>

Reviewed-by: Xiao Ni <xni@redhat.com>

