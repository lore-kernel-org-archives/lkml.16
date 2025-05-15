Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575224B1E44
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 20:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747339415; cv=none; b=CUVRSOrW7ndKpRcymNQLrPQ43lNVoWHUEE7LtUYPxs1F+nT5u/UpIdJUm9wyeHcZiHDy1ug2JDhmff+kaq4uhF74kGCHPAhNbMWqs2NlksXs6r+gUTLqTxRk9kAqiBjScCRv8VuxAYv4mr6dgCRfPNvajokz5qtZLE4ZQ4TcFY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747339415; c=relaxed/simple;
	bh=sCWBCil7pb7kxTCcpgTJG5V5Xzq7C7Xue3LLDzZUlhQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lDqmprrq7sVWq4LPJVzxRR8ZO6zOjIl922eIT8+n82hVg+DarSFLniquolcf7bChnh29qtljbkr6hv+C4TNA1hqfPhBQB4AGDbGX/6MY2O+ou7bo7PqJAuEJTrrlOWGDx542HuJp3NVxpJ1Q5cGEl2ichkSwoWYqdB4t5jTxJ10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EupDt8b+; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EupDt8b+"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4774611d40bso65251cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 13:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747339413; x=1747944213; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sCWBCil7pb7kxTCcpgTJG5V5Xzq7C7Xue3LLDzZUlhQ=;
        b=EupDt8b+8EhCuuCJHf3v9NzWC/r6/x5Bv20CX/UVoggqgmAd59lGNkNtlcDD1evkAZ
         X8R7pQ4qWzKH9bDUkezAZ9pskVLHs8s8q6qA39UrQ8bQgyQhAlDbkrtP9I85bHOX/YGo
         WiEnCk8UPm+7YuEQCF+9gGNND5lvFKCTASNFVZtmmm+YEECekJ8aiWBREsAlms1XG39k
         /RfXxWaER/KN5ERBWt+EQ+QD7sHc47AxwIFk00zq2lC68esKWXojw9EdLe5xgFZxEu66
         0ym1ypwZV6v4mkYzaQWeeF5bqHzIlUTAvFy0ite+tOjK9T6HXRZVSN2JL/hzVMHmlGfQ
         2Arg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747339413; x=1747944213;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sCWBCil7pb7kxTCcpgTJG5V5Xzq7C7Xue3LLDzZUlhQ=;
        b=Q6+bUz9g/xMG4NW9zhYVV6u7x2ziRlf0RAiFf9z+vJvEUE1dOLcXfFNzlLhE8w0Ze+
         Jl38Jcyy0D3qlJjMEXrwZGF725kJ6tKOv4xQeE75EZoc5bA2m+yWXninMpD4rj9KF/o0
         mIz1u/Fy69XwdGC2eZAo24X70efH/cCoA4n4pnbsPL1wPkGMRMmvEOYEK18bmxufKKxy
         4tquYn5idXCznJCrkEY+ZOy44/eWkZv85b003TnI2Q6qyDc2EXawNvVWt2OosQ7cYjyR
         44598nDSFfnmlHaWDShv0yJ2qkIeKaWK76lmWJsuh7xetx7xyvDsOpkH34Ivsjby7+jA
         wWOw==
X-Forwarded-Encrypted: i=1; AJvYcCUjBEOU0Xj0MgEyOJpQaCufBrJpRjMsy5WFTOFPWcdnVfjb7ANjtLP1+5dwUxzE/hyEd80nsUftCn4qbFQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr04vqxN9ki+kzedg38510aVKWJRtBjUXu0+m5dKm5ri5lYHI6
	uQFryYVO1FHZPR2blucMNWUkR4f3RbwMvJgfe7S9TXpx3TRrQyr3LWm0M1S7PwWAbyoRqdFfRAW
	ItYkAAp8toRX6ym47Ai4/xJmATlUNrjVVBsnmTPRB
X-Gm-Gg: ASbGncvXnjmqz+BZ1JADbR4DZ3KUFYDxhv5Lw5EWf+r7X9Kcw0jOzbEfJw9A9j1deg6
	I98Ib7u3O/EfZXUb7fCepd1RDPYw3apryY6RXmn10cgg3JoemU0VouYzIO5UU56hUPflF5cOxTh
	OO/EvgwlgrIzYc+6cYrQBfEMv83CsWTTu2/F5B+C6iy74naXZg4tkaA9B1+93I
X-Google-Smtp-Source: AGHT+IFx+em8XfEeGLyD7f/98BnU3d6CKECWGW3OqkghqanJcCJmF9byttNgyRFlCJsaVOHAdBjfs+z3bGSZBoxwJn8=
X-Received: by 2002:ac8:7c4c:0:b0:486:a185:2b8f with SMTP id
 d75a77b69052e-494a1cff1afmr6072521cf.8.1747339412843; Thu, 15 May 2025
 13:03:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250422181729.2792081-1-salomondush@google.com>
 <CAPE3x14-Tsm-2ThihT3a=h9a0L9Vi8J4BbiZiTV6=6Ctc1xryg@mail.gmail.com> <18aa42a73584fcf50b07d7a43073e55fb4c3159b.camel@HansenPartnership.com>
In-Reply-To: <18aa42a73584fcf50b07d7a43073e55fb4c3159b.camel@HansenPartnership.com>
From: Salomon Dushimirimana <salomondush@google.com>
Date: Thu, 15 May 2025 13:03:22 -0700
X-Gm-Features: AX0GCFsCV1sb00fFgZAMaeeyCnu0EqKHlroVAnK-IBJHOTTo1bvieTMgGMV1pvU
Message-ID: <CAPE3x16MrkQXFasVaaHBxhH2QvQ4H5cDiE3ae=-nYjuEKV-NBw@mail.gmail.com>
Subject: Re: [PATCH] scsi: Add SCSI error events, sent as kobject uevents by mid-layer
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I agree with the recommended use of ftrace or blktrace for tracing.
However, our primary goal for using uevents was not merely for
collecting trace information. We are using uevents as a notification
mechanism for userspace workflows to determine repair workflows (swap
/ remove a failing device).

We are open to any feedback on other notification recommendations for
such use cases.




Salomon Dushimirimana

On Tue, May 13, 2025 at 1:27=E2=80=AFPM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> On Tue, 2025-05-13 at 12:00 -0700, Salomon Dushimirimana wrote:
> > Hi James and Martin
> >
> > I wanted to follow up on this patch! It's a decently sized patch, so
> > it might take some time, but I'd love to hear your thoughts and
> > address any feedback!!
>
> I think the first fundamental question should be why is this a uevent?
> It looks like what you're obtaining is really tracing information on
> the retry and we could simply add it as another tracepoint in the
> existing blktrace infrastructure SCSI already has.
>
> Regards,
>
> James
>
