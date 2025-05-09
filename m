Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1E423504C
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 16:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746808828; cv=none; b=EgD+xDxCRVfzZDZnJNF3r4AKGlHY1VfDpf5HM9/O/Y6YwLNjO6LYkegvNxR4D/xbtPPsAzQ3Ym68uNUMpwBIykaDaTyoA9/lLRwuo15noVykLHn94G3LAqJ7bn14sN5+YtxRnA2sHuTXOQAP93fsNopdPgg02+RVcAo65O+/EoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746808828; c=relaxed/simple;
	bh=ZaydmkJ7eUryQN41xZ/nR0x6nuwulT7i+Qm7Ml1xIEE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nhFuUDgytp0EmghNC463h68aBnaayD79Et4WrXCvEh45Umu01OEKMl7roJmOd4BqbdudIabpkLyHWBj1tE/rkGoakxIOELRCXFcwovTSVo+J7xaNO5RZX7MLCvFatg+bzUjIr8K6A6yPLI2tATdjHS6B7pDWpaFSFP6njcuNV1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jakerice.dev; spf=pass smtp.mailfrom=jakerice.dev; dkim=pass (2048-bit key) header.d=jakerice-dev.20230601.gappssmtp.com header.i=@jakerice-dev.20230601.gappssmtp.com header.b=uI51Jk74; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jakerice.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jakerice.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jakerice-dev.20230601.gappssmtp.com header.i=@jakerice-dev.20230601.gappssmtp.com header.b="uI51Jk74"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac6ed4ab410so336822766b.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 09:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jakerice-dev.20230601.gappssmtp.com; s=20230601; t=1746808824; x=1747413624; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ezkh/c9YOiEB4YMEXS/lI8snDUy5hokGtG1LLPTxPBk=;
        b=uI51Jk74pPlUmJ5NVoQiWj/ik3Y922O7/eRxx/s11vB/sOPtLoG4W7P3e5VYeD6iax
         YS21ykUCkCh6geqoc2cr51R6DkGUg7MhiW27lyov/zgvwk+B2GJG+JOoU9JnnZdHeb+A
         +7Xn7FH+fjuvr3SGnDCd4IVRthXKbYGIjZZ7BYKNEKyoW71g6I/JEE0YE3Og+CP4r0Oz
         NiaH6Up4J5JH47NFcmy6CUkxd9bfVe0IpOlbvBUHLkUG7ZjxLJ46PpA+/zxGMC6GLgDl
         nOt6rShOhCh/PLzh1FKbLtPrN0HIuLEYYjHXEbwOQhOMrKnWpwNjf2iF9Xu2S8dtAAh5
         dxbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746808824; x=1747413624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ezkh/c9YOiEB4YMEXS/lI8snDUy5hokGtG1LLPTxPBk=;
        b=FPu0aQlvww4DJqx+YSSVLexkBCc+hIBb6Lr0l5y7Auw/Dn7oUcBcw5L7N9anZxc+fU
         RxtJYz04fKA3rYCYb51cPb7iHFYHf05cFfl3S7pKoJrLn/89XG95WcFzhHsWi7A3F3JL
         EO1qgjOkeMCtla8O0zeIIMel++Tu6FHdrIAfDy+h8tcqsCG4dAxMFxvJCGTrCM3M4hbZ
         Kfym/885IrkpF72Fbexfp0RTlD+OR7Ly/lTY+96DFanfsk8Zm1NZh4UExbw0BPEtcOYT
         27LkeyxgiS5nNAMT5Hr79qWUSM5HbJFoLGhJwLxS5lwPGYRiecwRyReeiDronUw9b0XD
         iJ+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXsjeOBzzoluIZPnpIyWGdh8sXclQYuxQdSCQSLS9JVwWYGkFPcrRUUJfEiCjik+n2LCnDC2LYhXKp7P2o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz97KI7/VTSMyn9RpmOpR7VUPU8NReB2RPxrrkZ6zFQbj9icYGW
	aj+KNK2gfnTcGllH0X87ZzGSAfznEroU4EYvFIk4RnULKLXhubyabrUY4y+8h7VshzKLemXReNP
	bHEBop8iU8x7sSWZ2RdveSZ06REHLDeYd5H/IbA==
X-Gm-Gg: ASbGnct/UrV9FGcGKg+T9WgYWCCpDuVG3DJqExMYcPwsyI7+HbJZJmqeAsCMlVZ4dDZ
	MLwwJ+1Cv5FMxB4mpSU5qK+FVZ+ZSJq+V7iYtHEikd9D9LOiYr2vkzLaaLU3u4ienQp+2YYReTc
	7Z+Yj3wcyU+uKlxrO48W2L2A==
X-Google-Smtp-Source: AGHT+IELHOq+p1zsugnV+VNzt/Afocg2GfsLFr0ysmipqQxyw3r6Btx8j/xS4gE6FCiiWPehP3G6zP+mSkQ6SxfrKOM=
X-Received: by 2002:a17:907:6a13:b0:ac7:81b0:62c8 with SMTP id
 a640c23a62f3a-ad218f8b0b6mr473399366b.31.1746808824446; Fri, 09 May 2025
 09:40:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506191531.3326-1-jake@jakerice.dev> <2025050927-bring-gusty-e850@gregkh>
In-Reply-To: <2025050927-bring-gusty-e850@gregkh>
From: Jake Rice <jake@jakerice.dev>
Date: Fri, 9 May 2025 12:40:13 -0400
X-Gm-Features: ATxdqUEOyTvQSEbd8Zcyxyv61W3TtwQMih5pSG6mXb-VTjDsGPOoVYP3FimSY2w
Message-ID: <CAFd_ZdCmqfj_Y80ZJih5G5Zn1nW0pE-R+gRFBMWRULjN7SNCkA@mail.gmail.com>
Subject: Re: [RFC PATCH] usb: storage: Add blockbuffer ptr to info struct of
 sddr09 driver
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, stern@rowland.harvard.edu, 
	usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 10:45=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Tue, May 06, 2025 at 03:15:31PM -0400, Jake Rice wrote:
> > Hi all,
> >
> > This patch updates the sddr09 driver to allocate a reusable block
> > buffer. Unfortunately, I don't have access to the SDDR-00 hardware
> > (which I know is pretty ancient), so I'm requesting testing from anyone=
 who does.
> > Please let me now if the patch causes any issues or improves performanc=
e.
> >
> > Best,
> > Jake
> >
> > ---
> > Currently, upon every write the block buffer is allocated and freed whi=
ch is
> > computationally expensive. With this implementation, a buffer pointer
> > is added as a member to the info struct and allocated when the card
> > information is read. The buffer is freed during desconstruction if
> > necessary.
>
> As Alan said, this is really slow hardware so I doubt allocating/free
> the buffer will even be noticeable.  Why make this change at all if you
> don't have access to the hardware to test it?
>
> thanks,
>
> greg k-h
Alan and Greg,

I apologize, I was learning about the usb subsystem/usb drivers and
saw the TODO for this and figured it was a quick implementation. I
should have waited until I got the hardware before submitting the
change. It won't happen again.

In any case, thank you, I appreciate the feedback. I ordered the
device to test this. If I find a significant performance improvement,
I will re-submit.

Best,
Jake
