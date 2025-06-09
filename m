Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53161221552
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 19:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749495734; cv=none; b=C+HiFgwaunJCtnEs1XvCxU50Pw9ofL+j3HDHuZZOukAzhOlJVGTRIRJoWtZASMlUgxejP16HlYq6dvdxMkJiNBdKWHyL/mjpMFYuZWd8F0dBh5V3X2E2SvMgX2Z6AZpaVWtLTpd7isK1RexVfI4EZbsCxc4LYHIYjQ6HRc5wBsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749495734; c=relaxed/simple;
	bh=OZTfqoL2OcDtWlZ3pnF9M6AJVam8XHJEZjA+dcwD7is=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vx7FG8lT6uQaUIuWSvsG7GNznIrofdnubgb3QdwocmMtbCnuW0Pxs42XSCZvBZ6ORCqJeRI1+6wfSgh0hnbSTnvd8zRrpbiOM0dhxnJL3ny+I8bRFC5M0V77jhzvZf8yz2+7T5Qj5m8+zkWnk1Denp7a5NORQ9S95ekTcBEUzgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=X7oBkT1W; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X7oBkT1W"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-47e9fea29easo69111cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 12:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749495732; x=1750100532; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GyTDJzBzlJRnsZyjzOICzR9Mkv2ePG1yNOP4xbIItDs=;
        b=X7oBkT1WAZ6t5q/4NJWCQvuODImPuLGYh//v+/sR4QzfqpA6A5HKNiSnv9vOmDmsAT
         mbB86uBB5X+edeantLfcpYbrCNeOjoPoYYwa+PzpQrxiF76b5zuDQbbB/aBIY4oxHUvn
         NONEpNzTFbDpeSSZ4J+TOKuvOoFhxCWTS+MXNFcTwEy7Q2KHSivZZnQ5srqrd8u1CFQ0
         YkCUwlQANi3PmsOq7UgbosM8TAp36lv0XGGRWrZhHEsfEu6o2BFcGqLTSgS1RuyHKP/E
         QfpVXxp3t+VLmtyzcVzE+D9j3ifQZHH6PL5oyoWQJ0wh2+ZLObsaUnhQ9A3E5R6QvtKi
         u+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749495732; x=1750100532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GyTDJzBzlJRnsZyjzOICzR9Mkv2ePG1yNOP4xbIItDs=;
        b=Ra0R6cdMJx+egp77pcRa6J6eT7FyiMkyWpERGLq9BWgX1euxLwfMTkO2yylFaXbXAo
         LF5ZskXTVFNW5fUwR6HH/tk2qbMCO3OEzoykTcvFpYSRc4cPvtc9VJLH0dDMS3aZJMRe
         gfnfE2wg8sC5a1RpgyDhFDIpZFJIbfwqoK+YlQ9Z9ZW+1wp0PD14Ew/gfq5GoG695IlZ
         N11nOKL9QRFb/J6QIfpJ0g5f22EXSXnSvpt1SWjzRXUCw/inbCmR+m1vkDKYVolOHN7w
         +WvbwnD4nlDwHfpBNwx2usoksbqZG2Gs5QcaALQwuxm/M6QdQQWwSWuPdlgbb62v5oE3
         5ZLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIcOqnkRg+17CHO6WQu6BkrEeRx1WvsHB0VMY33nuG1IUkNzkXIkS71j7T5Xzjj/H8jqz+Gxbz6r1pZuE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwigFq6ebrEL+B/+p9qlk/ZLmN3TyL/AEV5guTdpbX8ubPR3Qat
	WernS0Xc6nlcKBzaErA1KpZkW2niSwtBl1tEFkzOAROuFLJPqo58GL6VG6EOpln0233BLuiydW1
	zWouCUookE3It1bigyI4/A7ipUtGUeWlFAI1SYZe+
X-Gm-Gg: ASbGncvWCsQ1h2TpOZiSGpNrPw7aGbhWWJUWN80DK8OzHIM62n+69cQt630noTOlvA6
	swkRLHNemFbI7+qVuUVtq5bUgJ1NC4xD1k4S0QiuHWmxZRAk964ZEAOCxk2aaotlq+UDSOmTXOz
	gtwY1i5XqJDTfQi9WFGRED2eJpu4TeUpYTRFhSFE4BHwzWSMwCSmj3BoV1ZYQ0HmvC6QSuB9Y=
X-Google-Smtp-Source: AGHT+IHozTXc/tPXsLEr/JHPv0DSquqgQ1lZmBviZQOZhRZVJltPN1/2qyx5gpZIHGjNVpXQyp9x5xXjp/TbbVd7mgI=
X-Received: by 2002:a05:622a:11c1:b0:494:b4dd:befd with SMTP id
 d75a77b69052e-4a6ef9d2c13mr8141361cf.8.1749495731878; Mon, 09 Jun 2025
 12:02:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250422181729.2792081-1-salomondush@google.com>
 <CAPE3x14-Tsm-2ThihT3a=h9a0L9Vi8J4BbiZiTV6=6Ctc1xryg@mail.gmail.com>
 <18aa42a73584fcf50b07d7a43073e55fb4c3159b.camel@HansenPartnership.com>
 <CAPE3x16MrkQXFasVaaHBxhH2QvQ4H5cDiE3ae=-nYjuEKV-NBw@mail.gmail.com> <727641384722bbdbbf96176210a7899f1b9795eb.camel@HansenPartnership.com>
In-Reply-To: <727641384722bbdbbf96176210a7899f1b9795eb.camel@HansenPartnership.com>
From: Salomon Dushimirimana <salomondush@google.com>
Date: Mon, 9 Jun 2025 12:02:00 -0700
X-Gm-Features: AX0GCFuPOmyIxQJPp_J0pnfo1NGjd8wYt6a7sUe9NuQixSiRnlMp6XuzWTCV86o
Message-ID: <CAPE3x1735+kU2yRb18OroQoaXQddZTx6XjT+0pghBNYcO3h+zw@mail.gmail.com>
Subject: Re: [PATCH] scsi: Add SCSI error events, sent as kobject uevents by mid-layer
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The team considered the use of SMART tools. While hdd smart data
has info on data command errors, they are not suitable for non data
commands that we use internally. We are unable to use tracing due to
overflow / overrun issues. However we are exploring some other
alternatives like eBPF that can fit well in our infrastructure.

Thanks,
Salomon Dushimirimana


On Thu, May 15, 2025 at 1:11=E2=80=AFPM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> On Thu, 2025-05-15 at 13:03 -0700, Salomon Dushimirimana wrote:
> > Hi,
> >
> > I agree with the recommended use of ftrace or blktrace for tracing.
>
> Great; what made me think of tracing is that your event emits for every
> error or retry which seemed like quite an overhead.  Conditioning it on
> a config parameter really isn't useful to distributions, so using the
> tracepoint system would solve both the quantity and the activation
> problem.
>
> > However, our primary goal for using uevents was not merely for
> > collecting trace information. We are using uevents as a notification
> > mechanism for userspace workflows to determine repair workflows (swap
> > / remove a failing device).
>
> If you're collecting stats for predictive failure, how is this proposed
> active mechanism more effective than the passive one of simply using
> the existing SMART monitor tools?
>
> Regards,
>
> James
>
