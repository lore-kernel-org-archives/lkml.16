Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C622E2F18
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 13:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750165343; cv=none; b=pHGstM2KuXtbDGtvgVLSIWRfXi/ehLMGW3je+Nvh7dPB30eLnEk13hBcYuKmRscgcrEXxfBwtOozfOescsIpT/5pT5NgM+loYCIkHnC9KfchGDQGmSOwCls9/WmlwWNjRecMLWdkpOQPHy2PCWcYNo9rxHpEZJX+XWTOn64gvg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750165343; c=relaxed/simple;
	bh=hivB+dXHgRfjrGL6GmS+WrnxltFxrNiXvd8BH0IhvP4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U4WIZQ9jfakQO6WgVtFNhOAL8aKv29m3IbwZNMgpvbFk2s6tBuh98NVcRuGplsrs7pR4Xf0lx4qrIpnbKq+o0w1JbkGvQq7K7/SCjrHNpmIPEBkKeBtM1JDC6Nm1bS++MutjZDiBforAGoBoKW6mB00C0EsMQ4jRoL0XQrUStEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nk3DxSVy; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nk3DxSVy"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54b10594812so5870494e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 06:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750165338; x=1750770138; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QwCxDdGoBWfUjiiVuZKb9ARlDqK974ap4X+wrWrD4eE=;
        b=nk3DxSVy458PuWJk54MLn1nfgoiZI10Sc2XiRVyIFL9PJF+1DCSxBnnwelDRXrsH+P
         rw97qIzigJ5QPpn/lhv2mqydY2nkzqSL4KfKlCPiOo7xFvJcT190hkqrV3jNZOzCcA/E
         gPm1xf4xLrW6sHWHYBdCFuYTdtwwVIAauGvIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750165338; x=1750770138;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QwCxDdGoBWfUjiiVuZKb9ARlDqK974ap4X+wrWrD4eE=;
        b=na7g6Pb5UWPj2wRASN3JSPB6ZxVca+AohloS043VoUnhncLgrKI7FYEkxEJeHZK3Rl
         HDHj0ijP4q++Ch3nUjKvC0slfn8pVyWFpZ8whLwJrWZkZ9Zuwi/3qGXwWD4epU/I0RoU
         kMqzyaQ+CHVQ55MTbRESiQmMwbTExbLOVjs+MrHHQFlMpWih+AzWzqA26XHMHWl8Xbc1
         OVrFylaxddG7kJdLKrPKHzNp0+Pr2SszLOINDlpw+5et+aA6AtXnlTzrknfeZ/JNbknG
         3cXiMcPzxyiSK61ejKYnWDnSuG1aTRErGI8b5f/xQ7oGd6pLoEg2we77muFilmEUKfqu
         BJug==
X-Forwarded-Encrypted: i=1; AJvYcCU6m455xm9uJ3j0B+6b0xprPTE918sJQiRVJROEKWRbtjAvhI7SFMjX+HftmOAJvhS7ecWU6w4yEdhyFi0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf5q0LxFs4LUptRV+5WEJDoYoEwd2c5zLjgIGJKvmoFYGI1EcO
	T6eC8CE7W7xeiiQ7osDLjc3R0RO7c4jU3ziJt0FZIwrcHULFkQovVFM8fkYOgE8iPiE3lP9h7FM
	76wU=
X-Gm-Gg: ASbGncvlgUHeTqJhpRzAoZ0jCHlFRY0qd76bvtQ2fYyoMCJel7gI/EUii4v0QxnPX9c
	eM20vYUTFhGI2+YlkRRRGZI9IeX/TmawMLajWROuDQu30oQXhlvCBlqAn+2hZdjnkiTTs93zt87
	H9tYkcU83wTD5vhjtlmV9PQQ2ubCiL+//eNI4rdK05l4dLP7mqahxbapx2az/di7ECVDRqJZ+Ft
	OxnHTCL/qXYMbtChyUuwb0VeEixKKvyyHkFR52cOl4a7d+lQEaP0okUbCWXgWrJd3UBExgkV7c7
	zDtKWUgKZ9CiDEkYfbpsKHTBLR4i+ZjQbRIrrbXvJ8gKgGNunxPl5gHklze7xXZ2DLONTgkKjvT
	J8eILy8CfVDi5iwqIhxzliQoy
X-Google-Smtp-Source: AGHT+IFeucp4vLOq8TzGobA8jtAyBOVPE38Mafjdl+xhU6F3aqGvV8jY8EN4ygvx/CjmginLhUvgBQ==
X-Received: by 2002:a05:6512:10d0:b0:553:2ef3:f72b with SMTP id 2adb3069b0e04-553b6e68a16mr3855193e87.3.1750165336758;
        Tue, 17 Jun 2025 06:02:16 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac13f0besm1924867e87.84.2025.06.17.06.02.16
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 06:02:16 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-553c31542b1so2235585e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 06:02:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVRL+OfwCL1cq2u1jxZ3BFtFVquHrtbPLcBvRz552+jpIpEzje7DyHY/O758JUO22NGR6E0Imgj5HM8/6g=@vger.kernel.org
X-Received: by 2002:a05:6512:2314:b0:549:5866:6489 with SMTP id
 2adb3069b0e04-553b6f31234mr3198961e87.47.1750165334708; Tue, 17 Jun 2025
 06:02:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-keep-sorted-v1-0-2fa3538c0315@chromium.org>
 <f9275079-842a-406e-8bb7-b22a22b7c7e6@kernel.org> <CANiDSCt18PUWo2Z-9T2nBMMJfpRcdAGhO5S0jE85-1ZPO1qD7g@mail.gmail.com>
 <b78cde8b-23b2-48c5-b8c6-b935a403963f@kernel.org> <CANiDSCuPP+EOCps0gjH_bpJWsbyJDBcD+NoOeTB-sSUjUr0=Sg@mail.gmail.com>
 <61600bf6-92dc-49cd-bad9-a7342ce2fef9@kernel.org> <08a426ae-be6e-4cbc-aaaf-7197bf839632@jjverkuil.nl>
 <20250617125343.GB10006@pendragon.ideasonboard.com>
In-Reply-To: <20250617125343.GB10006@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 17 Jun 2025 15:02:00 +0200
X-Gmail-Original-Message-ID: <CANiDSCvTQzur1UqEKdwkd9vKcPQhG1sjWvbtwyf0jokFY-S2tA@mail.gmail.com>
X-Gm-Features: AX0GCFvXv_wP2CeSoip02hb0L6n1uKzrxqB73o9WKz_cufCcvR4pJCu5P3eXUss
Message-ID: <CANiDSCvTQzur1UqEKdwkd9vKcPQhG1sjWvbtwyf0jokFY-S2tA@mail.gmail.com>
Subject: Re: [PATCH 0/2] media: uvcvideo: Enable keep-sorted
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hans@jjverkuil.nl>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Jun 2025 at 14:54, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, Jun 17, 2025 at 01:52:50PM +0200, Hans Verkuil wrote:
> > On 16/06/2025 15:38, Hans de Goede wrote:
> > > On 16-Jun-25 15:31, Ricardo Ribalda wrote:
> > >> On Mon, 16 Jun 2025 at 15:26, Hans de Goede <hansg@kernel.org> wrote:
> > >>> On 16-Jun-25 15:22, Ricardo Ribalda wrote:
> > >>>> On Mon, 16 Jun 2025 at 15:05, Hans de Goede <hansg@kernel.org> wrote:
> > >>>>> On 29-Apr-25 15:47, Ricardo Ribalda wrote:
> > >>>>>> When committers contribute quirks to the uvc driver, they usually add
> > >>>>>> them out of order.
> > >>>>>>
> > >>>>>> We can automatically validate that their follow our guidelines with the
> > >>>>>> use of keep-sorted.
> > >>>>>>
> > >>>>>> This patchset adds support for keep-sorted in the uvc driver. The two
> > >>>>>> patches can be squashed if needed.
> > >>>>>>
> > >>>>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > >>>>>
> > >>>>> I've no objections against these 2 patches, but these need to be
> > >>>>> rebased on top of the latest uvc/for-next. Can you send out a new
> > >>>>> version please ?
> > >>>>
> > >>>> I was waiting for HansV to say that keep-sorted was useful and then
> > >>>> add it to the CI.
> > >>>
> > >>> Ok, so should we drop this series from patchwork then ?
> > >>
> > >> If the series does not bother you too much in patchwork let it stay
> > >> there until HansV replies to the makefile series.
> >
> > I did that. Basically I don't like the keep-sorted annotation unless it
> > is rolled out kernel-wide. It's not something we should do just in the
> > media subsystem.
> >
> > That doesn't mean that a patch fixing the uvc_ids order isn't welcome,
> > but just drop the annotation.
> >
> > If we do that, then patch 1/2 is also no longer needed. Although it
> > feels more logical that match_flags is at the end. I leave that to
> > HdG and Laurent to decide.
>
> .match_flags is first to match the order of the fields in the
> usb_device_id structure. Is there a need to move it last, or is only the
>
>         }, {
>
> construct that the tool doesn't like ?

The },{ construct is fine.

The tool sorts all the content in the block

Eg:
{
 tail= AA;
 head = BBB;
}

is sorted before:
{
 tail = CC;
 head= AAAA;
}
It can be tuned with a regex:
https://github.com/google/keep-sorted?tab=readme-ov-file#regular-expressions
But the syntax is not particularly nice.

This is why I moved "head" to the beginning of every struct.

Anyway, since keep-sorted is not going to be part of the CI unless it
is adopted by other subsystems we can ignore this for now.

Regards!

>
> > > Sure that works for me.
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda
