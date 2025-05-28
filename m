Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD3A220F57
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 21:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748466949; cv=none; b=G0PIQ82enYDjqKrdcwgs7SH5MaNHVISKQDa42JvIsobKFFtlkhwbGfo3ax8tHDAzRwIFwxuLI7xqxvQi5D5SMZ/TRzQ+LK2OixkXGBRydGh4KMXGeM/awKLaZqU3ojfS83A2UAl0Xdabb1gaI5cs2T6FQkUD3zshoO1PaQWF34U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748466949; c=relaxed/simple;
	bh=6TB92iJqefXqaOhc1avT3ptbHkZ+VPv9uvMonohUfjY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mko7umPj1WSBCkfeV4wnW5nUQIkHsSNC8UDpGX5EvgaKoskCq2nvShgmSwFtvOxy8HpIMFH93FwLXEq0JvYOwW0bGCUTnO7PZi2gQLQsgzmgvb40nXpoEj1FUazDHG6ZB+KMnRWTLe2hNWfb4KLTcCtfA9sjVIA2M7sMpoJp8Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LOePSfXh; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LOePSfXh"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4e591544d42so76799137.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 14:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748466947; x=1749071747; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=51BC5jKO33s661gXyiUDadI1PrOdwbd9xDeNJxZWYJc=;
        b=LOePSfXhKod3bDaB38wpbNtpXHj8gVwhBILZA3LX7Z/+yvqaxAZOQqcFBfqNBnka4L
         V7Dd3MhSh/7TBGtkhpTofW2HdE4Zg/AAzuHzWWh0M/XVQZRt0mgz5PablcKhOD7T+w/J
         rQx1x1T9S3Jgjx18M694eTURfItLW7HSumgcs9hW4U8A16uP1HzxUbRfuQV9ruoDC8dy
         1EFh5Gddq01iw8B6FE/aqcpv1ZewuIYNB6byc2RsYi04fARl4s5v/w1LFnp1mS+MY+VM
         1HyAcrBa0awCFo3Tj0I3owFImrk94uqa39sUiCN9GpkJUgdeVZ2hXSz9GOKnX9G1BwML
         TpjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748466947; x=1749071747;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=51BC5jKO33s661gXyiUDadI1PrOdwbd9xDeNJxZWYJc=;
        b=S73b88pQxQqA2/VzE8WhQ8Bbxi2YjkPasoNQQV2JZQBqKjfnkUoqruuU4o8laeETV/
         ZPQgio5GlE1nfcJKHPCVMqHx10g+o2W2/++O1vnc4lLkobdkWnwW+P5CneUcNSGMC7Vy
         efgMN2ea73RnzEVg9oxKPf0YhVzQkXVg0t5VTg166rRCt7fzR3JXrSqPPVWdm8Y0NeI4
         tTGCd2ZIpQVjgw3+DV8UHXGXk3SZ+cVblU7SVySuf+zhmUuHIPbfkETF866jrEjoLXiC
         x+R08PWhCJqfYvn7lzfjxnxceCATV7fXO6wvmAvbWQuNjGR7l1ysb42ypXobaQnuWjms
         WP4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXVV3n0PAorrZBrAiFVjJqJ1fehUaZg8GyXX1aZIGPTLwzmECni9mqpu9R2AHZAnUZ/Ga53PpyA266zlY8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCyGAcg7TVnuvFyRze7lNQ8hBpykw4Rk2g7UxuhxfgJMI4Gt1/
	0SlX/scLUyZRLR+xbmf6jJsOQPPW1xwh4NClQGLAnvyZWB02ZejRTmwB1KRxuXYo+svhn03Yr+w
	UkOCBkcWNDUpaXx0FnWFfl0ib+214yu8RJf923rJP
X-Gm-Gg: ASbGncs8fmirxfB00VTZRQeatmm0vJeKsii4pBHZATK1MAmHUIWS/oC72v7je9mPsdK
	CLueEEqeabV8KwQdHFnwr1Jb7RbKGXOkpQJIASFVY9hKIjEhFNahgVI2I+TQE0Do1B33Px0pHeg
	b1ZGzHzAn2V3YaSix6sM01zSSPSATvC/BqPEJMwEGs4P4XiR5AvitIJXEQg8J42cbLWBsyDi2y
X-Google-Smtp-Source: AGHT+IEGjOs82kTFAU/Z31a+vH3Qzfatibe+2Qf0paK/asZmHcpx8dE1IgvJTlZDLnKNENdG06sLfEKF7hXQmR772zM=
X-Received: by 2002:a05:6102:26ce:b0:4da:e6e9:1f56 with SMTP id
 ada2fe7eead31-4e4241f1005mr15436061137.23.1748466946407; Wed, 28 May 2025
 14:15:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528174426.3318110-1-dtokazaki@google.com>
 <a0bf24c6-58da-42e7-b686-03a893b38ecb@sirena.org.uk> <CAOC4094v+MyrWgbkDJZ5KJhzuTmmgAuS-XacbFt5jHK3aYtOrg@mail.gmail.com>
 <f1084652-9a1d-4d2c-a7c7-9f40e380f5a6@sirena.org.uk>
In-Reply-To: <f1084652-9a1d-4d2c-a7c7-9f40e380f5a6@sirena.org.uk>
From: Daniel Okazaki <dtokazaki@google.com>
Date: Wed, 28 May 2025 14:15:34 -0700
X-Gm-Features: AX0GCFv7MoeBQkPF5SI8TR13qspbgej9rz94jeuiM1MPCfRMK72J5uqpJwNutLc
Message-ID: <CAOC4097gBTJWAYLTO9c9-NgJmZ1Vvq7KzUxkuoOvByhm5fOQuA@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] userspace-consumer: adding is_shared flag
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Zev Weiss <zev@bewilderbeest.net>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 12:20=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Wed, May 28, 2025 at 11:32:19AM -0700, Daniel Okazaki wrote:
>
> Please don't top post, reply in line with needed context.  This allows
> readers to readily follow the flow of conversation and understand what
> you are talking about and also helps ensure that everything in the
> discussion is being addressed.
>
> > > What is the use case here?
>
> > The request is for a regulator to be controlled by two different
> > subsystems. One is a userspace HAL and the other is
> > a kernel driver.
>
> > Alternatively I could expose sysfs nodes in the kernel driver
> > for the HAL layer to connect to, but it would add coupling
> > between userspace and the kernel driver that might not
> > otherwise be necessary. The userspace regulator driver
> > would add some abstraction between the actual hardware
> > and the sysfs interface.
>
> Presumably the HAL is working through some driver since otherwise it
> would have no access to the hardware, that driver should extend it's
> interface to cover managing the supplies.

The HAL communicates directly with another subsystem via a mailbox
interface and doesn't have a kernel driver.

> This coupling seems
> desirable, we end up with one kernel thing which knows about the whole
> device and the firmware description is not dependent on the fact that
> there's a HAL.

I see, I can make a local sysfs node from the kernel driver to be
exposed to the system.
