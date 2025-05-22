Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1652690C0;
	Thu, 22 May 2025 11:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747912132; cv=none; b=MA2/DZqiRf+flqS/zQDquw3qyXTVz8UuD8IHJcnlX2uPwMCB/MKTBgwXUTyQppT+jkiuJtb39+0YgiUYpSHclnX+1vr+kq0rRL9c6lLFzuiOMK5F4parmGJ1kxvYEdai2LWKzzam0gXlcz1MvhyAM1LzAHWUEd/pXiSFPkQGbWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747912132; c=relaxed/simple;
	bh=2V58GQ6phC02BvHZJ4qnetRi+UjN+Yv2PP8AsO8zeS0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fi7v+EN/7K6VYeOR43kHnrV5rGLu5D4fLiv/J3+8iPzDjaCebCaIJC55WrSuanWPzhCMuzvhsCizId4YnHUj7M4ZLwvdW/Pkl+/O3v2UtFZ2HU+yp+fGcUw+qc+CVjkzqxbdIzOwcC0i71vlJAcU07rQbjY+jKwi0g3sMp9KVNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IjYkln8c; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IjYkln8c"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-30dfd9e7fa8so9342126a91.2;
        Thu, 22 May 2025 04:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747912130; x=1748516930; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2V58GQ6phC02BvHZJ4qnetRi+UjN+Yv2PP8AsO8zeS0=;
        b=IjYkln8ceH3e6KiXWpbJugVwnpbH376etq+7V6z3REWFuyWOL35wPOkxU2bvTZUR3k
         v1d3iEdDqzSSSOSDzEmQ5QUY97LQlGiCdIjnJgru4gwcZCHAvw3uQ4bju9DBgo+dJZD3
         u4iqXQicKJQn+ziXQY3L8bpBEr5x7a+7z+8QCPB2uyAL1tpQeIIZJu30GHW7mJlkJx86
         3HcMoB02lO66IYusBri93jN64i9xVL2hv+B9i+8ETjLehpAIM2JEFva7d9oBrbkPpHsJ
         MalRQ2Hkil6GfQ6dzsHXk6P0BzZWbcm8rV+Re+Qlr0GBsPLqJkVbKeVZKPiUkwzVeRmS
         Tfpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747912130; x=1748516930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2V58GQ6phC02BvHZJ4qnetRi+UjN+Yv2PP8AsO8zeS0=;
        b=be4sVWFfHR8UsOrVHNCRWBA5Lcmk1+fA9Pf9ZzXTviXyl9OSyxxeUIp21kqGexfWwb
         Th3NEmwO4q++hZojziVsW5P0U/yA3OtHa93fmgvxbpBo4LkIwYXA2WPGYRuy8TdIz1lH
         580E8gIi8MLOrNUHiXVREzuC1hZfvN08FFCvg74E4QILPTnCqTm00znHeYMqlxdPlm9v
         OgtpRIpQZZmjXu2c89817MQ50de6i8QUgkqJtR+A+bKrUzkuPXu5jjeb4VEbbHoDTwd0
         MAJSDleViYcxgRbDuUIOPfZf297hbw5Zbs9GCuRr1oSmPmcewYsvACcDxiEhPSQRxaUW
         haVw==
X-Forwarded-Encrypted: i=1; AJvYcCUwXpVzjO0Bt7NObCTVj4ZTVgMbFUPTcPN8zSjZP/Iy0O+LJ/N9YIBGEQBQNDFEqhzCMgpzUTKW0djS@vger.kernel.org, AJvYcCV1RdXc2D+6mttb6hphRUVSOAE/o74yq49iBwrOROzah5ASsvBXwkkTM/pDlQD1KCE9P/AG1nc8akuFBmI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjgIGV/U3FsMqmrGucGZ0ljwHyB7kZ2LbH3Sy4pWRuCnQQc2M8
	Gn2lDiQF7Laak2R1J9yZYtgtzw7qUHYl1vp/z3s6dQcqlv9e6FjqItiQy5/eLs2A2mJ6mR2EqVo
	L8bbHUW/c7q/5e2/ctkupcJ7yS6RBJA==
X-Gm-Gg: ASbGnctAMiIxFrQcwT2ae8XL5X2XlSeMBaC0qNwOWSgxYyBNarbxTf748U5akhn05tt
	3JUiGSuwZN80m3H0MdLJ/o4xUXLQ4QY+/4Xd1Y9zHi2Pef+WQVUHQn0+31cEdIedBBNQyDcjFnw
	JAWhYhoYmjLKJtwAl/6bbYh7FHHkPohRXv
X-Google-Smtp-Source: AGHT+IFPeY2LRD2+abl0nYii9cYBw9bGVXUsb9X3lJAl/vpr0oP00uQJBGJx72QLpLXu8XCe0nYpeTJpokPn1VMHkXU=
X-Received: by 2002:a17:90a:e18b:b0:2fe:a515:4a98 with SMTP id
 98e67ed59e1d1-30e8323ecdfmr29636628a91.31.1747912130575; Thu, 22 May 2025
 04:08:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521214851.386796-1-jihed.chaibi.dev@gmail.com>
 <DA2IV4ZGT2M8.3QXO3L57VXSA5@brighamcampbell.com> <2025052234-brewing-recall-a7ed@gregkh>
In-Reply-To: <2025052234-brewing-recall-a7ed@gregkh>
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Date: Thu, 22 May 2025 13:10:37 +0200
X-Gm-Features: AX0GCFsvGHSsGIxobg0c8FTEHWDyusmXNeoPwzeRw5AJKnBxbb5CTC7cg7hAh8E
Message-ID: <CANBuOYpm86aJtk9ubkjVSOeM=tctF7upbsyPYOP-Bf8bNnv-0w@mail.gmail.com>
Subject: Re: [PATCH 1/1] usb: typec: tipd: fix typo in TPS_STATUS_HIGH_VOLAGE_WARNING
 macro
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Brigham Campbell <me@brighamcampbell.com>, heikki.krogerus@linux.intel.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 10:30=E2=80=AFAM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> On Thu, May 22, 2025 at 01:47:54AM -0600, Brigham Campbell wrote:
> > On Wed May 21, 2025 at 3:48 PM MDT, Jihed Chaibi wrote:
> > > "VOLAGE" should become "VOLTAGE"
> > >
> > > Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
> >
> > Nice work! I was able to successfully compile this driver with your
> > changes and I don't see any further references to the misspelled macro.
> >
> > Patches which fix issues which were introduced in some previous commit
> > typically indicate the offending commit via the "Fixes" tag. Admittedly=
,
> > I don't know if the tag is reserved for technical bugs rather than typo=
s
> > such as the one you addressed, but such a tag would look like the
> > following for this patch:
> >
> > Fixes: e011178579b57c03 ("usb: typec: tipd: fix typo in TPS_STATUS_HIGH=
_VOLAGE_WARNING macro")
>
> Too many characters for that sha1 value :)
>
> thanks,
>
> greg k-hj

Thanks for the feedback!
I assumed this tiny typo fix might not need a "Fixes:" tag since it
doesn=E2=80=99t really "fix" any functional issue=E2=80=94just let me know =
if you
disagree. I=E2=80=99m just beginning my kernel contribution journey, so I
appreciate any guidance.
Cheers,
