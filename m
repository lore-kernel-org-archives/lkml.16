Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B6E21C9E0
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 23:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738712201; cv=none; b=H95XcV/enui1IxDbQjiTv8RBMUnGbHw6gPki90LPJACdP0L7tJgLx8uDG2IcHanwF/30PJ54Znyund1aaUKYwcoRLXdtoQSSwWZTCA0IJ2XatbvTHEnJGoMoyawSvm6PUO9y3GD6FTEpzkn6hPh3jh+laddyyiJQKsi/s4LVhtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738712201; c=relaxed/simple;
	bh=1v1YWtCj7WC7A0RcZPHUb/XtNYgDS+FIsq6RHpMq4ZY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tfx3UXnUAFuaWm/J0rNMRwtzDb1gjvi+lnlDw7yZO3d4neMqhxRaY34SoB9cSgat13aFD71kJxeXBUO5C3dGKMm0XcAXdGi6fxUsORvjuerh2oVOSp16gETgCUPs2C5R/8gNdJKyV13/4GazKKG9Oyt0JlVoJAZa2CqI6Lv0P68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sln7n8YD; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sln7n8YD"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6e2362ea655so47253666d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 15:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738712199; x=1739316999; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ycj9u2Dva2MHKVI2wTs7L1cktbKbr3X42oYcY3Nlf18=;
        b=sln7n8YD+pcglBZOlwbcVkbW+sPHG/tKoRjZfrPsp0GHW6j5t15DdLFJMoY2xZJgV3
         BOjio8SqPo8VQsz9j/LBA7V/+OPkYdBW39mDodW7f2zMIEt7ZKWyB+NCVoXaB9HJyty7
         sclLAKJgWwipVfU1U1V/uEt2/W/+cisn6crQN3Zyo6IA8p0bih0Lo4rfDE5spbCchvvB
         slmSmZJLpJVRjrk9pMWFHffX04Yvb/suRcyZH9+aGT4zUWRZ2XdgsiiKhK8im5OP0qfk
         lKoBLu8uvA6at0jfYiIYlSXNaQY1oXOSW4Ns9mDhBc0CPKo+fkHK2z7uVtykol7iUxU6
         t2Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738712199; x=1739316999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ycj9u2Dva2MHKVI2wTs7L1cktbKbr3X42oYcY3Nlf18=;
        b=tqt5jstpBrzTm9ZQ6pp+3ilM5fbgdRr63SQLwl+7mmbwNM5HszxhbeRgkkDg3khrwM
         NpYpM2HIjuXM4uXjx82qs/vEcxsTc7BD6SkZPJwlNbSy//oLzLNvbRQ/iaJ8ea7c502K
         mieTWzj823ui5K+XRn2DvgoNJBqxbPmlvkK9gWfWNshkc1N4FowOZmg9J18qRqpMq0al
         /0w79QwAYbLnBr8x40faVh9wHBrj4TLFNW68VzDilehq8z43k97VxrvPOMCMCpBwwp0+
         FWIypnwzUXUIyS4g8E/8Mo3ZqnHxcGj2AKYPWte9FDfGPiU+PeYR/XNnAvKGxQj7TGN8
         V9FA==
X-Forwarded-Encrypted: i=1; AJvYcCWwOjuuU8dgTZ/NyWCDIs1jQ7zIm4SGuSKy5I/+Gx2TXyYYOwiZEHAoklrh5V826TnxbvbMlBoPjYIiR5o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh/B3Js3oYwWlJDvL45toDIoREnR7iSOlYhmvq7POHwjXuohn1
	UmaQSwp7jdOHO5YjYRo2Jyufjws1pTgjKpprWtjCGkJhhr5YqUPb4/Z5DPIFvU0sYGq5AdI7QAI
	nXLO7frxpPlqMGPLt+f2n3Y7eI+Z63FhaEHaj
X-Gm-Gg: ASbGncvbwh8XL2uTll4IXhMbjd3jmuz8lsQlBNA6tlTT+kj6Dfqk/7cG1e8Wpfowew1
	o7GdGsBYFcAbRuC2lHIimrIQIa7GD/ycw/nXbbP+Rir9DrQGQaf9FLDdVZJa9R8+/bt5YUxTL25
	KCOyx7oIlA9PKSuwTqvmMW8tNJqw==
X-Google-Smtp-Source: AGHT+IG4N7xPpxY4+Q/365LNkiP0z9kl78Wy7YRrw6YzIgo2GFiiqEAHANRAs2P7VXQNtxqiSLaWT0Bqz2KMyEBmNtQ=
X-Received: by 2002:a05:6214:3198:b0:6d8:b115:76a6 with SMTP id
 6a1803df08f44-6e42f9166b3mr13380306d6.0.1738712198970; Tue, 04 Feb 2025
 15:36:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250204000102.3989779-1-royluo@google.com> <20250204005452.fchcwx6ukv2xukiv@synopsys.com>
In-Reply-To: <20250204005452.fchcwx6ukv2xukiv@synopsys.com>
From: Roy Luo <royluo@google.com>
Date: Tue, 4 Feb 2025 15:36:02 -0800
X-Gm-Features: AWEUYZnENPg0UsfP4Soec5_ZkhznW_3qXdvOK0XjfcDVRDETMyK5YD68YgBF1_U
Message-ID: <CA+zupgz3JXoxUEHiezEHenTZXSRJ5A2HHjCTvYoo+DqvL9=C-Q@mail.gmail.com>
Subject: Re: [PATCH v1] usb: gadget: core: flush gadget workqueue after device removal
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"andre.draszik@linaro.org" <andre.draszik@linaro.org>, "elder@kernel.org" <elder@kernel.org>, 
	"stern@rowland.harvard.edu" <stern@rowland.harvard.edu>, "crwulff@gmail.com" <crwulff@gmail.com>, 
	"paul@crapouillou.net" <paul@crapouillou.net>, 
	"jkeeping@inmusicbrands.com" <jkeeping@inmusicbrands.com>, 
	"yuanlinyu@hihonor.com" <yuanlinyu@hihonor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 4:55=E2=80=AFPM Thinh Nguyen <Thinh.Nguyen@synopsys.=
com> wrote:
>
> On Tue, Feb 04, 2025, Roy Luo wrote:
> > usb_del_gadget() can lead to new work being scheduled in gadget->work
> > workqueue. This is observed, for example, with the dwc3 driver with the
> > following call stack:
> >   device_del()
> >     gadget_unbind_driver()
> >       usb_gadget_disconnect_locked()
> >         dwc3_gadget_pullup()
> >         dwc3_gadget_soft_disconnect()
> >           usb_gadget_set_state()
> >             schedule_work(&gadget->work)
> >
> > Move flush_work() after device_del() to ensure the workqueue is cleaned
> > up.
> >
> > Fixes: 1ff24d40b3c3 ("usb: dwc3: gadget: Fix incorrect UDC state after =
manual deconfiguration")
>
> The reference should be targeting the udc core. Probably want to Cc
> stable also.
>

Thanks for the review, sending out v2.

Regards,
Roy Luo
