Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683A91CF7AF;
	Mon,  9 Jun 2025 20:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749501174; cv=none; b=or9wDIxfoc0/yXC4R+oe7eVAHQDElypyYWWND/pfKb74Jw1fMAac2+0crnNwWSj/sY3EH11a83GQrmnsYvZk78F2C7sR6vdEA9fpeNp8jB6oy6FlDLUY6ZPrTh7iakR5y31MAkVApc8elisFnN6iZA/f1HwsPGtvl8jFtaTtvSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749501174; c=relaxed/simple;
	bh=smOKQlyhKjQukF0aXiYyuQbS9EWlJvDyPq0X+IMEKx0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uHD87FXjs/xZXHNPkWYUN67gPBRJeAcQ7Kxa+TEca8rhVD4ayZsiqeM9rLzaiGUJmuC4NxOjeiJt0AWSGhL1ZvHQ8crvxQxA2qiGotZtti2i+lwrDjeMTdcJql3TULl4607Se05i7kSwTJPqSqzt7NSXs4Oj+2OpxPQMo6DbkUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HB0l2ac1; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HB0l2ac1"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a35c894313so4251183f8f.2;
        Mon, 09 Jun 2025 13:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749501171; x=1750105971; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fGp7IgckCtKKIeH8vrBlmb/psah8M0E2VWFW5sVOdaQ=;
        b=HB0l2ac1WhaFaGJ5aZdePs1UOLmLkSSkvQNz3f7gxr566CoNi+cQgSLV4Ohe43zs8y
         xcZ3FTnFtnC3YQ2q8F6iQWf2ar7fv5/7xKdxSD4iicOOaCoMjSzSEtBiY7h+0Jt+BZ4L
         t2M2B4DQE1/+SbmLf+JFpTUvvEng+BDu58CcP+Gcudy/EcI5pwlp17q4wqG7pY2SIcQr
         ofX3yTvd9GvcDKl5aRVIvzPBglA0JzcVOGMse6W5pwL77vZAXhCG6CRUA6t8oP4i2mvr
         Pe2nO3KRg5XY0kbiGslAbzSsAyTsjjLpcHIs1/2KRFTqR3wIjkaTBFATecDiL1TDp33O
         ggZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749501171; x=1750105971;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fGp7IgckCtKKIeH8vrBlmb/psah8M0E2VWFW5sVOdaQ=;
        b=UV5rsfu6LHX0qEiaRxdTv7mKUJhM/MwUEUuG+jLnbWudsHZawUaDgvBWfQxo0OtkCo
         Mb0ujChQbhvjv4APP6ej9cLGQ8Z3moO71PdpEvW3EHaTJaz2vy9XKIA+5bhDHlXuBNqD
         nMIzOZTD5zbSEtinlPVgcObZUuxUbikKsNsHKSSaebTlNmshthGHUOBx7e3Z7Qcu7t/8
         nRRwjnavv+gI0JhYC7azw2CP9nlCI8lAJLjKx3XfINtXX9jUicryBwU9JdrxYWtSJMJS
         i0w9kCnjYZ1TzQnMMObMUBKc+Qb2p/XNv4TYMUSzRdESvJOd0zY64g7mcuXCMFfVz9Hv
         mN3Q==
X-Forwarded-Encrypted: i=1; AJvYcCU1YjfXgij5g9v7uGkOHz6REQEwBX5DGXJk73/KVki3PWhpmx5XxNoBDpPtKAk4VCCzK9w6Avjp9yYu@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh4VnJa9+MlLlX6ktCLWSV9Yh/hlHjNvQdYQOaDH664kxYZJSh
	GEVE2LTIBNXVzAfDgxFSfF6iOyxS8CYeEwJrExxmbgqnS6MrhOPGsAblNNynCYdL3r46o7ZjMvq
	e1EncQnDRQvKlhwd9WNqxBqZ754/oyQ==
X-Gm-Gg: ASbGncsiQQpkFGmE4CIMkfYEgEQI+kFjRBGhZTjcJYlcNWrhYKat8ufoiT7Jq9q7K4b
	ZAnBMcQt9xub4VozvnB5K/XHApTzybwEl3U79h2SRJ+i1EDw2RFuz4xtM8PzCbXcxWoAqKSatIB
	ch9FStRt8vmll/oonOLUGidTd6KAgdoMfdJI9KKoHhvAM=
X-Google-Smtp-Source: AGHT+IFbS+aOU7AdeF8A8vygcuhjRtwhld9m24XdDeW/iFPxd8B3CUbbuKS3sRFQfJJM9x6sezbefdDtegkqK6+U0XQ=
X-Received: by 2002:a05:6000:2c0f:b0:3a1:fcd6:1e6b with SMTP id
 ffacd0b85a97d-3a531cea596mr11473661f8f.57.1749501170298; Mon, 09 Jun 2025
 13:32:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250607212654.126412-1-alex.vinarskis@gmail.com> <8a688e9f-012e-461c-a916-f06b34fdd913@sirena.org.uk>
In-Reply-To: <8a688e9f-012e-461c-a916-f06b34fdd913@sirena.org.uk>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Date: Mon, 9 Jun 2025 22:32:38 +0200
X-Gm-Features: AX0GCFsOM8DAuGFV23OsqQCHLh964vlF0-CIAi6KT4oEuTxcuiqUGnH24_qyZz8
Message-ID: <CAMcHhXpVKaWX8guog_M+5wHfJ+6uxBteNnV1xCjcDJuGFWOCkg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/2] Introduce dummy regulator consumer
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	jens.glathe@oldschoolsolutions.biz, konrad.dybcio@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Jun 2025 at 00:33, Mark Brown <broonie@kernel.org> wrote:
>
> On Sat, Jun 07, 2025 at 11:25:37PM +0200, Aleksandrs Vinarskis wrote:
>
> > There are two main reasons for this driver:
> > 1. Create a pseudo-consumer in place of real devices which are not or
> >    cannot be described in the device-tree. Examples would be integrated
> >    USB UVC camera (present on some arm64 laptops) or dedicated keyboard
> >    backlight regulator (hypothetical). Instead of leaving regulator
> >    without consumer and `regulator-always-on` property, one could bind
> >    to dummy consumer to save some power during suspend.
>
> Those examples both seem like physical things that exist and can have DT
> bindings written for them, why not do that?

Hi,

Thanks for your feedback. Yes, you are right, they _can_ have DT
bindings for them. And typically that's the way to go for _embedded_
devices that are eg. soldered on the motherboard. In this case of the
webcam on Lenovo Thinbook 16 [1] the proposed option was to utilize
the existing "onboard USB" driver, since it already has bindings and
can be used for that [2]. The issue with this approach is that being a
USB UVC device it is plug & play by definition, it does not need a
dedicated driver, yet we want to bind it to a vreg to avoid having it
always on. Thus, adding VID/PID to a driver just for controlling the
regulator is not very scalable.

Having to add VID/PID for every device that does not in fact need a
dedicated driver has another issue - it was just confirmed that Lenovo
Ideapad 5 uses a similar setup with USB UVC webcam, but of course
VID/PID are different. That would require yet another driver change.
Moreover, manufacturers are known for using multiple SKUs of parts,
especially in these budget laptops we sometimes see as high as 3
versions of touchpad models  listed in DSDT on the same machine. Being
a USB device, the VID/PID are not even listed in DSDT, hence even if
one were to use 'onboard USB' or any other dedicated driver/binding to
hardcode _this_ camera's VID/PID, we cannot be sure whether another
unit of the same laptop model will have the same camera and thus will
work or not.

My initial thought was like you suggest to create a USB camera driver
with a binding instead of using VID/PID matching to be used for vreg
control. Thinking one step further, this in fact has nothing to do
with USB cameras, but rather any device that does not need to be
described in DT as such, but we would want to have its vreg
controlled.

>
> > 2. A great development tool.
>
> That's what the userspace consumer is there for...

Fair point.

Alex

[1] https://lore.kernel.org/all/20250607-tb16-dt-v6-0-61a31914ee72@oldschoolsolutions.biz/
[2] https://lore.kernel.org/all/20250607-tb16-dt-v6-2-61a31914ee72@oldschoolsolutions.biz/
