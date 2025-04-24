Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2976D84FAD
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 06:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745477508; cv=none; b=YcydHW0TnkZ8tGNxtTwQWDgH0f8uGAvjAJZ7DSJuOYWodCx5rPkCuvBQZgzBov6wm9QfFRzSwhMQ2/UrkdAGC80ET/XE2exsHOfFFBrvmhmYpjDcffTuuM1U6Rq25tuO3eGtR53xoHTfurnvYUoKAxSkKWBfVoBuC+nEKqN/4jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745477508; c=relaxed/simple;
	bh=Ag3AWLUDndS0X7tDtdLw2MCcWUiP9y71LnjMPVxxiLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QPOTrMLsTKLf+rPG55vlGAiTP5Ve6d/vZR5dM9XPmpBTzbEVsYqzcdLBhtsd+PeHnRwlywJoE7Hx/JZGOp+jPReAPMZ0HEiL9do3JCib7xvDPeqj1LioCQfio4GtmI+TjsYpyyJbHUqTjifmG1m69f57vQEr8oFCEI/hAeps9h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sl0KBnba; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sl0KBnba"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aca99fc253bso96427666b.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 23:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745477504; x=1746082304; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UCdBlRSLitkZVgraqiDyH6sqV6PnXuRYUb+hiEOC3cY=;
        b=sl0KBnbaknSDEFtm9LY6TIFJ1DpZYXR894X43cL7XKb61gkRmH1tuoYgR2ED1WAB/Q
         TXx1gJAyp11z1c+9Dhy3xxx155o+W6+Fym8Ej7UJsItBNp95K3A7nEX2ZjQJf6+wLTyH
         XLW/Q9a8t+opJjvrFYdGtH2SeX9Wdr32C4+5uzj++3y1F5rEC8Wbd3p0r878K/Q30s6W
         WjEff+SFbnNrJxFpH6kKPNLo97AQftwdg60nz894mEo5Ny1H+EVSsj1E4ljf2JFSvpPS
         DFEytZhZU8zUJbpQJtVLfxL//59SZDnhP/jcABSZ0PjI2HLirVj2oCRfzgHKmUANbSyB
         YmWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745477504; x=1746082304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UCdBlRSLitkZVgraqiDyH6sqV6PnXuRYUb+hiEOC3cY=;
        b=HHLp4oT9QEcvE5SddeA0eLizWuajtZ/1K+fpJFWYQnpmsXrYRB7U9msNT+BQHrqgcN
         VLSmNLQpvi2qKwjWrU63fdOwnSRde3JYJtjVVBIws48uuls7snIQD+VjXAxdM7UXejAP
         F2RDteFuXyXqTnon0u1LP1hmtHp5pgSWKBI925qqp1DfioTTPx1kYz35irsWtwSmEnbT
         djZAkLIXssWVuTD0P5jIHowoneg11+3JNx6j0IIQhZcBVUxKElKsTwrJuVPMyyZnHX2z
         T2QpTri2XcbA2JgCL1zm2vSOYgv1tpa+UR7Gxv8OOBL06EdReRwLWdGxmJR2RrtaDDcS
         ocrw==
X-Forwarded-Encrypted: i=1; AJvYcCVYuWu3yh4ZtnVsahR4tzXO1f3xd+S/XVwkBGqpBqMaKf16z4eb4xyQeW2RjKwygHwSmG8goHaO7DRh+ao=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjHq/UyeKCXYf+K7S5mUqCj+F9z2uKMVhDPtQpnL9kRwFuwhz8
	ISV44C313aQUEtRBTk2OhJifBckh8nstqGUFf1WsPm0FhfboqIYSpp2GgsuWPA4EAoX/k4R0Q5S
	nU+7Ky8pH8zjEN7qceICoE1CjOSrZFgIgu2bu
X-Gm-Gg: ASbGncu/EFYXvosAS5EOBz5I2QeLk//VJ/Rpq60cBMulLHuhfSVbdY7UImSdRc+J48V
	loxyVV8o/xWsz4SM7pfmF2NKqxxp1tJvnr5RSPYfBpqxBbZTg/5go2DsPDEW74tv/zeDDLyaYkq
	WRxAJkvMHC3W3CFJuTXFrsuw==
X-Google-Smtp-Source: AGHT+IHGeyS5GzF1KKHBmTnr0KgYda4bVKubCtgIBqB6yIp5B87N5sZptbz4fHrf3oRXVpVpYibPEFrx+l9TaWOdLT0=
X-Received: by 2002:a17:907:7e8f:b0:acb:86f0:fed8 with SMTP id
 a640c23a62f3a-ace5721fe68mr130762666b.12.1745477504191; Wed, 23 Apr 2025
 23:51:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <50dc6bdc-ee62-41f1-b8e5-be64defb07c6@huawei.com>
In-Reply-To: <50dc6bdc-ee62-41f1-b8e5-be64defb07c6@huawei.com>
From: Sandeep Dhavale <dhavale@google.com>
Date: Wed, 23 Apr 2025 23:51:31 -0700
X-Gm-Features: ATxdqUFCZEOg52wqG1DDPFBO0bciOIAyOiGm-f5J3gO3y1YmMicJ7X_BAGWYg7g
Message-ID: <CAB=BE-R4uPFeBSt6Z4Khv6_OjAu9=WoJR-VGG8eG0spAaovE1w@mail.gmail.com>
Subject: Re: Maybe update the minextblks in wrong way?
To: Hongbo Li <lihongbo22@huawei.com>
Cc: Gao Xiang <hsiangkao@linux.alibaba.com>, LKML <linux-kernel@vger.kernel.org>, 
	linux-erofs mailing list <linux-erofs@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 6:50=E2=80=AFPM Hongbo Li <lihongbo22@huawei.com> w=
rote:
>
> Hi Sandeep,
>    The consecutive chunks will be merged if possible, but after commit
> 545988a65131 ("erofs-utils: lib: Fix calculation of minextblks when
> working with sparse files"), the @minextblks will be updated into a
> smaller value even the chunks are consecutive by blobchunks.c:379. I
> think maybe the last operation that updates @minextblks is unnecessary,
> since this value would have already been adjusted earlier when handling
> discontinuous chunks. Likes:
>
> ```
> --- a/lib/blobchunk.c
> +++ b/lib/blobchunk.c
> @@ -376,7 +376,6 @@ int erofs_blob_write_chunked_file(struct erofs_inode
> *inode, int fd,
>                  *(void **)idx++ =3D chunk;
>                  lastch =3D chunk;
>          }
> -       erofs_update_minextblks(sbi, interval_start, pos, &minextblks);
>          inode->datalayout =3D EROFS_INODE_CHUNK_BASED;
>          free(chunkdata);
>          return erofs_blob_mergechunks(inode, chunkbits,
>
> ```
> This way can reduces the chunk index array's size. And what about your
> opinion?
>
> Thanks,
> Hongbo

Hi Hongbo,
I think the last call is necessary to handle the tail end which is not
handled in the for loop. But I understand that if the file is
contiguous then the last call can reduce minextblks.

Does the below patch address your concern to conditionally call the
last erofs_update_minextblks()?

Thanks,
Sandeep.

diff --git a/lib/blobchunk.c b/lib/blobchunk.c
index de9150f..47fe923 100644
--- a/lib/blobchunk.c
+++ b/lib/blobchunk.c
@@ -303,6 +303,7 @@ int erofs_blob_write_chunked_file(struct
erofs_inode *inode, int fd,
        lastch =3D NULL;
        minextblks =3D BLK_ROUND_UP(sbi, inode->i_size);
        interval_start =3D 0;
+       bool is_contiguous =3D true;

        for (pos =3D 0; pos < inode->i_size; pos +=3D len) {
 #ifdef SEEK_DATA
@@ -332,6 +333,7 @@ int erofs_blob_write_chunked_file(struct
erofs_inode *inode, int fd,
                                erofs_update_minextblks(sbi, interval_start=
,
                                                        pos, &minextblks);
                                interval_start =3D pos;
+                               is_contiguous =3D false;
                        }
                        do {
                                *(void **)idx++ =3D &erofs_holechunk;
@@ -365,7 +367,8 @@ int erofs_blob_write_chunked_file(struct
erofs_inode *inode, int fd,
                *(void **)idx++ =3D chunk;
                lastch =3D chunk;
        }
-       erofs_update_minextblks(sbi, interval_start, pos, &minextblks);
+       if (!is_contiguous)
+               erofs_update_minextblks(sbi, interval_start, pos, &minextbl=
ks);
        inode->datalayout =3D EROFS_INODE_CHUNK_BASED;
        free(chunkdata);
        return erofs_blob_mergechunks(inode, chunkbits,
