Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608974A11
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 02:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746583698; cv=none; b=LigVc30HPj6DkJ3mxnJajHpuHZ+t24p17zzfXss2FC0Xt4w/quJRAaqmfjzNw0FwOhrqJnU5xvXZlrc5hIin2eaQ0F8SWorBqQWeqomwkf9diDqTuwesFwn/tG0rD2IFPwTMrAs9kWZpDNtsrEwI2LzNdspbnlK8UJmj3eGAL00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746583698; c=relaxed/simple;
	bh=qSMkAw1f8q81qejiBhHJHWaRJ9DONSFXrsMIQ0Kcuag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cLA9gbQ9jPAEWOTEuTyHEcvC7VT0jfGQiootCyE1Sok+KhfrS9eaoKonlL31++C93q9GRCtzvj30ldQzNRAUOrTNzQ+RN9O6/2r7/beOvw05uJ6Bk9mCLybrjhQluBXq+BOly1JNi/MuZQl/fTnPDj2t9XiwlKBOFanHm7F46WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dkaqkVx+; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dkaqkVx+"
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-879c44a1dc4so2107241.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 19:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746583695; x=1747188495; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c+qrFXkta/PnXyYE9c+0VrJXrgpjBrI7s8joN+UR3x8=;
        b=dkaqkVx+nI7V+CAQddB1gM3+85ryX/c29eOSTLepQU7hgoiG2zyS4DJ99YmJYRTX0t
         IVBBk/YoP3+zBK0tnMdxdHNPVbHPfSYP3uV0iw23nYNgPslQy9lmAxN99CBZjzgjyBF5
         MQZqE+V00B8sPWWereHpr2F2ib/7btOIdSBLkH2ydzhxXmkuNVWjkrwqyASOacLBogA7
         lFkU2JMkkEd9Cn7yicRbO4QGvww4UNV/loAd5z7jMR2ycvDFr9knP2HUbaicD9OAE/To
         +t9xMrGAfLGyRKJUceUH5SUY663REwztMXKTV6P/Z5AsrHDV8ceSBqUuGFkaKaapqZeq
         QjKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746583695; x=1747188495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c+qrFXkta/PnXyYE9c+0VrJXrgpjBrI7s8joN+UR3x8=;
        b=b3bi6JztrxElgJEO4esq0s/22GORiVKwG3dIOcPpm7WipLcYXKQTdcx86TGRvSxtxG
         8ApiiiZ2j486nB5WQwifJEw00I6B0946cWESvCdBM/fK5y8b/+nW7Jm24/SKOvl/qvPg
         cHqXNGRs43t+hi8GLBcNu8PHHpq1jrvNgSBu5RFPuLugVWNrIFmpZJRfxCHRwB7/0qIJ
         Uwm5ltax4loWuUAH7127sFcYQnPgaCHyMQal6810yFsfv2hmTUYbwLL/yRdlMaqi0R3p
         lxTgbmgogEaI4q0QVTQY9A1PLtt7/YLA+8Yz33z4dq60krW9UT4EkdZKEAtmNZ+3GlpD
         Gb1g==
X-Forwarded-Encrypted: i=1; AJvYcCXvwN3U1DPkxZuzKOzaRdnvRjmvwzoTZXYItqJmZ8uEXqN3Q3o2kckJjC89uC2xfWEQcQcsmdC3x3U5XCI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPaCdY+uGJFU8nnxYxL2bjCEkv9fL68itUrWDTdh//3DP7kyw5
	0LE39ZA6CkLXqHdO2OMBKYh3AJb7ZeXSTGqcfShDQA1x4a3yLsjRVLRrLRXy6/hFeTgkkGnq1yS
	3BOWGh4l7TJr0/MU/hvA3ecAFms6/uOOy
X-Gm-Gg: ASbGncusJR0xE4md2JZeWX5BCaM+aAoxEV8Rh+MYmp9NOp1aqH07xyVTWWt4XTgKQai
	+p+51xwB63FYvBCHKTdy3fo9lXo1KDchX6+D3jyx9cO3BvLu6M0fRT/1ldwCzyPsrSmvnZLtJHv
	DqyHdb5wuu/weUZhXRG8i1rw==
X-Google-Smtp-Source: AGHT+IFGG/EFE44jHQPco6sg4x6ua9hc7r7AEXYdg1rXn7toxfyhfCDLkSX/VWAeKMgeiBIJEhaIgcho8CEMgZGeh4s=
X-Received: by 2002:a67:e708:0:b0:4d5:cbbf:456f with SMTP id
 ada2fe7eead31-4dc737d1739mr1634787137.10.1746583695176; Tue, 06 May 2025
 19:08:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506030100.394376-1-xiaqinxin@huawei.com> <20250506030100.394376-2-xiaqinxin@huawei.com>
 <CAGsJ_4zBz0oZGpP3dTzsjmw0oJbWm=vkKRS_kjBso7cvKJGjuQ@mail.gmail.com>
In-Reply-To: <CAGsJ_4zBz0oZGpP3dTzsjmw0oJbWm=vkKRS_kjBso7cvKJGjuQ@mail.gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 7 May 2025 14:08:04 +1200
X-Gm-Features: ATxdqUFB9KwDvzR69E_IJlSczMXQzzrRWd2WU62tnUQyjqIE1rn7qXrRg5eqsAI
Message-ID: <CAGsJ_4yEmSGGKFxCT_wioEOaLxAzxNiryR42_hW9-vbu8WgBUg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dma-mapping: benchmark: Add padding to ensure uABI
 remained consistent
To: Qinxin Xia <xiaqinxin@huawei.com>
Cc: yangyicong@huawei.com, hch@lst.de, iommu@lists.linux.dev, 
	jonathan.cameron@huawei.com, prime.zeng@huawei.com, fanghao11@huawei.com, 
	linux-kernel@vger.kernel.org, linuxarm@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 1:52=E2=80=AFPM Barry Song <21cnbao@gmail.com> wrote=
:
>
> On Tue, May 6, 2025 at 3:01=E2=80=AFPM Qinxin Xia <xiaqinxin@huawei.com> =
wrote:
> >
> > Fix a problem about commit (8ddde07a3d285a0f3cec, "dma-mapping:benchmar=
k:
> > extract a common header file for map_benchmark definition") accidentall=
y
> > removed that padding, which has completely broken the ABIs.
> >
> > Signed-off-by: Qinxin Xia <xiaqinxin@huawei.com>
>
> Please add Fixes tags and cc stable.

We are *NOT* adding any field.

Also, the subject and changelog are not appropriate. They should be somethi=
ng
like the following:

Previously, we had a padding field in this structure to allow for future
extension without breaking compatibility with user-space shared data
structures. In other words, the padding was reserved to maintain a stable
interface for potential new fields.

However, in one of the commits, tiantao accidentally removed this padding,
which could lead to incompatibility issues between user space and the
kernel.

This patch restores the padding to bring back the original structure layout
and ensure compatibility is preserved.

>
> > ---
> >  include/linux/map_benchmark.h | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/include/linux/map_benchmark.h b/include/linux/map_benchmar=
k.h
> > index 62674c83bde4..2ac2fe52f248 100644
> > --- a/include/linux/map_benchmark.h
> > +++ b/include/linux/map_benchmark.h
> > @@ -27,5 +27,6 @@ struct map_benchmark {
> >         __u32 dma_dir; /* DMA data direction */
> >         __u32 dma_trans_ns; /* time for DMA transmission in ns */
> >         __u32 granule;  /* how many PAGE_SIZE will do map/unmap once a =
time */
> > +       __u8 expansion[76];     /* For future use */
> >  };
> >  #endif /* _KERNEL_DMA_BENCHMARK_H */
> > --
> > 2.33.0
> >
>
Thanks
Barry
