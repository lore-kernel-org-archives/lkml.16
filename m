Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0985F2F22
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750080709; cv=none; b=eH69szHMe8MRZVrIpdzOACDdv0mC+XzORr6Yz2pqk1DNm5Nue+LAnALwXmJs0lFA95sECCAg+JbaSR+B3h5YDJotueeJfdffSCt3ptUVjbh2Sgy27DYfjU1HdOpTziU7AwDkt/u2xNRU9fMbvfo1hSwjWEQjm+FRQB/9yYYNYYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750080709; c=relaxed/simple;
	bh=m0xDa9ZTBRWR3WEPuMDj1p5g5v0dW/WC0ZmNJsPiMFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QbqqG0NJkzO3lYpouWU5SuBWGmpbMg84cyTNvCd4iENjqHQGganiExGJ+IxtJDL+WNBchhFSBksN64T9SiCYhLXqVvozn6I6QecCLLoRFzvnYmL3iSjB1dMTi8QgUB+5TWIQilue0PeSuXHBA7sung2vjyzD7khCGN9L+XrLZV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NwOGIKPE; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NwOGIKPE"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-553644b8f56so4615516e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 06:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750080706; x=1750685506; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cFZjyKywdT02PV/9aLASI1hk4Et6724oI1TOwqTcszM=;
        b=NwOGIKPEYuzWIp/NDuJtBPUmgDoUXgRbbsjsSyUIPFLCtT5Zw+PTXX/0zcaKgRX6eo
         EmAzUd/nQ1L+2Mo7VYhVRzhSVqyUqgtxlCnqPq/f3m0FIIc1PQAaJJQBl70lP6dAgby4
         xQHXcftfjrZtKav2+Z3SLyei+uZDy9QEWgA4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080706; x=1750685506;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cFZjyKywdT02PV/9aLASI1hk4Et6724oI1TOwqTcszM=;
        b=haYF7jybv7m2JP8kdm/05XXXZm6tyDFE/1gBOe1SAf2pM5Mmj4jpbnkYDtL1gfT93t
         xQyaaceg0u/vEAc4yf70YhTX0ekMzDaeK04774k50TDDMkdZWCcqNQHd6ofvAD5qIv9a
         07MCPuaIg5rMFFiiMna/ribMRTj4RdJOcWtWx3Ic91frL5tYWr6cCA1JrKvcIrajUuCH
         Ja0zZmD5W1g1g9XTlHmDPC+i9YE6fSvOVVIwyOEyv5GSa8eGZkU98dAx7nZtZNrQJqoQ
         XdjeUUIHUBv8eC82+l6cniLJzt9jJFst/518REcJmrk0hqpRO+eyLqeoIqaOQbY/31cK
         lZVw==
X-Forwarded-Encrypted: i=1; AJvYcCXWHHBAeKQhPGFMAJG38zfLpHJVAvF1pU31Ag1vPDMY/Nw0OR2f9odk2+//7PyC5XT9Tg1Eh+I20BwgKoQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqGUsi6uAX34rI2n2R6WmHDd2KuFZaRMo03qnWE40fBdih3pwi
	9ZbPswbwJy9OBJuqGtoymIUCf4WtzczHUMa64YE3ZKl2ssI9gToW9mZno0NByVUPQewKjHkB5hQ
	X+V4=
X-Gm-Gg: ASbGncsw1hl1ZvrlrUlJCy6WI7gkmo0W2ZDePX9C3gPbcuTPLGu7L+O4Mu2M3QefgND
	bL9ceeC9KV+TFF9scDiQ2u/AZVOwoIA09V0vyBh4x6lOAlWdqrDy1idR/wzxcMBAXILH74qMcNC
	eMYRWDzBkm92H9GzZZYpwHX4p/s3uW5NPyP+TEKOxzCeM+n3dQ/o3E6GvnvIinAasfA9cAJVDgk
	hfx/fBLc7G6IBrTrLD9LxPjpCB2bmBmEjbfwNN7PqlAIQihF0Xwa++UYAMJ2z71urSxDcrSjhoY
	CfI4ZsSfd98BkAOJPdgA6vINT4jeLHTZdhXRwh3WDhpNSjAj6oSeuzCPHHku+eBMpDsMD/f/HJg
	9zAF6qTUlYf8winukNB1Rtab+
X-Google-Smtp-Source: AGHT+IG1VcMTqyPYa6vBaM0Byxrt+QLTx4jQtzuy24aF5Zq6YfdWo9ssrtsIFu2Zn0tqY3GFAuD4Mg==
X-Received: by 2002:a05:6512:3b11:b0:553:b000:aba4 with SMTP id 2adb3069b0e04-553b6e8b24amr2089642e87.13.1750080705900;
        Mon, 16 Jun 2025 06:31:45 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac143cf7sm1543519e87.88.2025.06.16.06.31.45
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 06:31:45 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-551ed563740so4886726e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 06:31:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVou2bEuuz9F/RILEVi26IF9DP6tJ345ymnJ/6XCLDCLtjA3HU8+iixixWB+83cQ1H/BmnJqCBKqqztUMc=@vger.kernel.org
X-Received: by 2002:a05:6512:33d0:b0:553:ac33:ff24 with SMTP id
 2adb3069b0e04-553b6f4e754mr1978325e87.55.1750080705035; Mon, 16 Jun 2025
 06:31:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-keep-sorted-v1-0-2fa3538c0315@chromium.org>
 <f9275079-842a-406e-8bb7-b22a22b7c7e6@kernel.org> <CANiDSCt18PUWo2Z-9T2nBMMJfpRcdAGhO5S0jE85-1ZPO1qD7g@mail.gmail.com>
 <b78cde8b-23b2-48c5-b8c6-b935a403963f@kernel.org>
In-Reply-To: <b78cde8b-23b2-48c5-b8c6-b935a403963f@kernel.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Jun 2025 15:31:31 +0200
X-Gmail-Original-Message-ID: <CANiDSCuPP+EOCps0gjH_bpJWsbyJDBcD+NoOeTB-sSUjUr0=Sg@mail.gmail.com>
X-Gm-Features: AX0GCFsixqfKOBEpaXaDDSaZt4bOT6_Z3RDRodQ_BZOXv0uKrUSHZfq9BTHf7jM
Message-ID: <CANiDSCuPP+EOCps0gjH_bpJWsbyJDBcD+NoOeTB-sSUjUr0=Sg@mail.gmail.com>
Subject: Re: [PATCH 0/2] media: uvcvideo: Enable keep-sorted
To: Hans de Goede <hansg@kernel.org>
Cc: Hans Verkuil <hans@jjverkuil.nl>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Jun 2025 at 15:26, Hans de Goede <hansg@kernel.org> wrote:
>
> Hi Ricardo,
>
> On 16-Jun-25 15:22, Ricardo Ribalda wrote:
> > Hi Hans
> >
> > On Mon, 16 Jun 2025 at 15:05, Hans de Goede <hansg@kernel.org> wrote:
> >>
> >> Hi Ricardo,
> >>
> >> On 29-Apr-25 15:47, Ricardo Ribalda wrote:
> >>> When committers contribute quirks to the uvc driver, they usually add
> >>> them out of order.
> >>>
> >>> We can automatically validate that their follow our guidelines with the
> >>> use of keep-sorted.
> >>>
> >>> This patchset adds support for keep-sorted in the uvc driver. The two
> >>> patches can be squashed if needed.
> >>>
> >>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >>
> >> I've no objections against these 2 patches, but these need to be
> >> rebased on top of the latest uvc/for-next. Can you send out a new
> >> version please ?
> >
> > I was waiting for HansV to say that keep-sorted was useful and then
> > add it to the CI.
>
> Ok, so should we drop this series from patchwork then ?

If the series does not bother you too much in patchwork let it stay
there until HansV replies to the makefile series.

>
> >
> > Right now it is probably just useful for the Makefiles and uvc.
> >
> >>
> >> Also for patch 2/2 can we not just add the 2 keep-sorted headers
> >> and then actually run keep-sorted to auto-fix things ?
> >
> > Do you mean removing the annotation after running keep-sorted?
> >
> > We can do that, but we will be unsorted again in the future after N
> > patches unless we add it to CI.
> >
> > If we do not handle this automatically I do not think that there is
> > much point on this series.
>
> What I meant is only add the annotations and then run something
> like:
>
> keepsorted --auto-fix drivers/media/usb/uvc/uvc_driver.c
>
> and submit the result as a separate commit. Assuming that there is such
> a thing as --auto-fix. The reason for this is that if the sorting is done
> by a tool there is last chance for it to accidentally break things.

keep-sorted can work in two modes: fix and lint.

If HansV finds it useful I will refactor this patch with the extra step.

Thanks :)

>
> Regards,
>
> Hans
>
>


-- 
Ricardo Ribalda
