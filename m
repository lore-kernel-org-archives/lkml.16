Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFCC2557A
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 10:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748772503; cv=none; b=AffUjHmmSDwrElivLQHJ+uu3wYraCIHB5V+R3V+GuHzH0ioYwx18wcVCqLCZEGzI0RpNBH01p/p95JphvA3OuBdX4AaSux8MCecbfDQCJU3WUXOnH77+TRpNHovyKaOTF3Rfeeq+zT9NSmxTSPZJ5v0oGcJhihtEBtji9TN+MKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748772503; c=relaxed/simple;
	bh=HAqqkQhnXVAKzdrtZyr3RRPBA83EYmLyR4lq7hAUb2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Espe66o5MYLkHJl/SAW0JoPSxBvye8krCMPMMvxXBnps4oEtnDuF/p4B5Ah46MgmfgM9D2WOfd+DSsA8aEHLXFompVL6GjoutrGD7t9VrLt2IT3GOCm2PTscE6HceSp+9kocTFZn9NhoTPWG1XfDpDJJY9uXODiZBbAh7Lq4zxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UKTlDy8j; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UKTlDy8j"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ad88d77314bso619793266b.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 03:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748772500; x=1749377300; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6fPiywOSKETPbwSw1Rvi5wLhnJZFlc7Zk83IPpMxs9o=;
        b=UKTlDy8jk6qYnLxF3MawHSBnxI68G1TwHOhYrG3TOpbH8154AWc1RHSTCH4f3c7koe
         NO8lJN9Sdpk57ylf1RPrAlUkSmff4FAqS9a+2UCXCDPsCyPB2fqILYC2SbZNHTmQv8sn
         Mq7kkGvOEC0BQ/Ql++RTNs6PajslfM7SLD/48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748772500; x=1749377300;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6fPiywOSKETPbwSw1Rvi5wLhnJZFlc7Zk83IPpMxs9o=;
        b=KK4+o6T8JjPUnR4rvHW9KPxg6C8UCgJimhhAEuEkq3Zg2oFN+T+tykFq2QNPtKSHrG
         v2dpVPFVUGs+oPl+mi2Co/lEPHku0hXasN39PsGrFCKHmOhW2+9r8lmBNaWQZsUMfpNA
         E04TN1I6U8mqlZX/fHX89+bmPb6FcoGRN1aN73SAqnLijWT72wY2uZs8+dfQMflBoAyG
         dMsLYzsn4dTdTb0yjKT2TxVwcjdiSiEa0dxC0cCCgeL9OfF9HynJel2dw0THmyH5+nxA
         0m4bHw/L8l8GrHY9XMF2K4XgODOEtfc6+WVdW13p2CW+sGrMTJtHvfhdb3NIykdUsbGp
         qKyg==
X-Forwarded-Encrypted: i=1; AJvYcCWgdKNuGQzpC4XIioBWx8X3UpcgiTQgqdrdBd2d4uu9xURkUxp+pa6beeSO9LHcVmGoY1wKrRJVrZWGa5c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMxAUpa2yPZmafIQvHALCUl1rwM1kQgeU5SvR7sVTioP1w0lP3
	hiReuVWe0QaonPw4YU8V1LFmhx4XwJ5qBNG2BRN6v43JqxKNffH5UejaOWSLqhYbtP3e48Kvkfh
	wmUXKMg==
X-Gm-Gg: ASbGnctBjl0K/CZtM5nvI+xMApCC7i3zeW26RQW4hLtjY7G+xOXSyP+8MKvAK+DivU3
	Qf3Dg3SPpG/+WoFMRqdGmBa8NBNCdx+OCwuMLtc2vLrE6NpTTx5R8eEhRI7qwiCTgBomt8crDhn
	GMZhytc2qLDlkAKA9EZLC35J+bCFL7IzKR5ozTv+xpkDsJ3WxhEVmSZA7O4LHKK11CXEAZynw74
	XCM2TozwcW1RVseSji+qwcJ1MbjxroRp6y3DCjWAQO2Rl6JN5YXp9iPQ0Hqcdn0JfLI66pL6919
	6rQF4ajnLV+HTsVHhu/1nXXhxpyEO3H+pf+vJm0GjOhd8SXbgOKSgHmsrAzaqO0e7MjA3VmY3w7
	79Zs2U12v1cwgLCbuwJjmatPY
X-Google-Smtp-Source: AGHT+IH//FcNrpfzB5p1hkbtMK1YjCZPGXXmhl0+jBqjpxGo86dKcXG7ivQizirQ1VfgGrELI5MNRA==
X-Received: by 2002:a17:907:db03:b0:ad8:8b51:ddb4 with SMTP id a640c23a62f3a-adb322a2dc0mr869019666b.25.1748772499866;
        Sun, 01 Jun 2025 03:08:19 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d7fee29sm637478066b.19.2025.06.01.03.08.19
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Jun 2025 03:08:19 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ad88d77314bso619791566b.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 03:08:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUFN5xK1NBY+tHgJM1FW46DUvBE9jbpuilPvgzaIawO5yp59X6bBaRn1XzbRIwPrAloihFy7/B+cR4DDGc=@vger.kernel.org
X-Received: by 2002:ac2:4c4a:0:b0:553:2418:8c0c with SMTP id
 2adb3069b0e04-5533b93b8e2mr2836561e87.57.1748772095532; Sun, 01 Jun 2025
 03:01:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412-virtio-media-v3-1-97dc94c18398@gmail.com>
 <CANiDSCsmbiveo4GHX54_q7-1CeKiDAVaGnb8+jsCybM+pyA7Fw@mail.gmail.com> <20250601113425.4d5a3d89@foz.lan>
In-Reply-To: <20250601113425.4d5a3d89@foz.lan>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sun, 1 Jun 2025 12:01:22 +0200
X-Gmail-Original-Message-ID: <CANiDSCt9nGP=r8VxkZH76a1i+xEd+RCJ71=6qx0_iPYdrn+GoQ@mail.gmail.com>
X-Gm-Features: AX0GCFtIPDaP18bEvuALb1ut3l5M3rfFZRAycu45EQi_pjllJ8ZUhbJMMnQNECo
Message-ID: <CANiDSCt9nGP=r8VxkZH76a1i+xEd+RCJ71=6qx0_iPYdrn+GoQ@mail.gmail.com>
Subject: Re: [PATCH v3] media: add virtio-media driver
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Albert Esteve <aesteve@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	gurchetansingh@google.com, daniel.almeida@collabora.com, adelva@google.com, 
	changyeon@google.com, nicolas.dufresne@collabora.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	virtualization@lists.linux.dev, Alexandre Courbot <acourbot@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Mauro

On Sun, 1 Jun 2025 at 11:34, Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Em Wed, 28 May 2025 18:23:02 +0200
> Ricardo Ribalda <ribalda@chromium.org> escreveu:
>
> > > +static int scatterlist_builder_add_userptr(struct scatterlist_builder *builder,
> > > +                                          unsigned long userptr,
> > > +                                          unsigned long length)
> > > +{
> > > +       int ret;
> > > +       int nents;
> > Could you initialize nents and sg_list?
> > old versions of gcc are a bit picky
> > https://gitlab.freedesktop.org/linux-media/users/ribalda/-/jobs/77042562#L4381
>
> Please don't. In this specific case, ret is always initialized:
>
> > +       struct virtio_media_sg_entry *sg_list;
> > +
> > +       ret = __scatterlist_builder_add_userptr(builder, userptr, length,
> > +                                               &sg_list, &nents);
>
> nents and sg_list may or may not be initialized at the function,
> but initializing it is wrong, as, when they are not initialized, the
> ret code shall catch it (and if not, we *do* want gcc to warn).
>
> So, if our CI is warning about that due to an old version, please upgrade
> the version at the CI runner.

The main version of gcc works fine. It is the minimal version (8.1) required by
https://www.kernel.org/doc/html/next/process/changes.html
that  complains.



>
> Regards,
> Mauro
>
>
> Thanks,
> Mauro



-- 
Ricardo Ribalda
