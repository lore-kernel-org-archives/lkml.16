Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5328E1AAE13;
	Thu, 15 May 2025 10:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747304622; cv=none; b=EjQ+zKUbG7+W5iShTz1sOGB/c4xwt6A1JwhUloiU9kxAjNMOu5nikZOqL/BQiOfE9VL0cXNePaPqRl8NzLE8am9UlGuTfPvbLsk/4N+9189XEVo2LLvhjZ/0euKB9BlqhaTsWpOdPUpSbaEzlMh6D0SrxLE+M1tvRVYVmcrRGmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747304622; c=relaxed/simple;
	bh=LPn993xnWWkvwlm5rudsJA0BQo0qu2yihgm1xOxvsW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VSHLRqjl+JDSd5fBYQP1EHM5Jt4dBJdIl+KMhD85N4M1cydNT4ansepgMGGjlr4N7O0PE5wewkbiyI2+u5zNGOAxHN/R+RmgFxWHiLH2Z/aoYv9dl3PpFRtFpFv5QFkjsOHgjqoATsVRnJk6gJFMe3ac1r/25Wl1Y8fI/XdsJ/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MjU6e95W; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MjU6e95W"
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-86135ad7b4cso34344639f.1;
        Thu, 15 May 2025 03:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747304620; x=1747909420; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zJZrSFBkNbM1G4hOj8s/L4+l2f6c8+4aH2wqD19Gqc0=;
        b=MjU6e95Wr2BTHeJzY+bQZIjb5rdR1nJ0Vex1U64iYdI+2uXKtMourAMFn+Vh2HsFUM
         vc63ofqdHVTH6jUeKbxi2gBEAhoaGtl0lSS03qqEQDEZpVpNw4nxXvHOJjYSPgjZH+ku
         2s/xqUn29w5Lm1EOkcGEb/TWwf15CbhScRfkXS3DN5l6e4yOs5gbBIGT4g4KyCXz9Aoo
         TVsxcve4AHBQS8qsbiplkJJLX9K4ut3gU8Vb+i0v0igFk8HlLUD03Xe4d/ciB8QT2NZX
         TT9D8nvxW8OKP9tr5R8jHDuIw+zCghZILwaQOefcR7UXdgR4kM0v9X9RxxU5efOYR1M5
         P08g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747304620; x=1747909420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zJZrSFBkNbM1G4hOj8s/L4+l2f6c8+4aH2wqD19Gqc0=;
        b=AlfBmRZu7IpkKkG8II9PUEawqpCZOn+NPLHoZcM/xzgHryXCxa0ZZYOFtefP4aW6Su
         G4cwOLUNeaCMeiiGfWfnS2/5bGXvyu8dAWS1pZqCxy+1k7ZA2/ngIbwlFuZcqeVlg4Qf
         Kslxc+f8LgknFbQ/Jgy+hv4i/iuPqaANQGLhhV0CSVUDYQIfXKJe6dJH2ws7fzaf6Bxl
         6coXvCa3Ym7Vh+8jTKKZp9gwJOvdmGF7jetrQOyaNX232uLv+6Nzffvu6++yHCVqwkeW
         6UUPRPRSlaiM4Jtf35WF5F/sxtGOQaRmXH38PX0yO3eGVolxhyuTpa/fy/LHnSnL8umb
         Hz2w==
X-Forwarded-Encrypted: i=1; AJvYcCUO/oI0Rjd7zH4s3OvNzfKQTivCuGbefHjCklj1jy3PyH41OGTtRmWcu78gSdeC2tLJezBtedezneTJ@vger.kernel.org, AJvYcCUlqT9q1S36H6r3uiVEg2KD4s78M7Q0WU+G2yQc4rPpnRswIqr3x+UxVykqS+gq2B95hK4OkmAt4Y4JR2W8@vger.kernel.org
X-Gm-Message-State: AOJu0YzhaYkvPLAIrP0aZmPw409g8RTCchSKxBqtGmxgn/YHJpnsmjyy
	3acDXQ3LDg6nm3IMz0gj78iNIpkuNx6xvTgcz+sTIjZlE3i4I4AjHn5ZNOe5Ht/NqVfsn1gp/1R
	7qdNkIflIhLg/HR1G5oWY51xfXM4=
X-Gm-Gg: ASbGncvq4lU/Avk0nFXxdWbQliMb+85gYzdfbPFaLx7AQttoWJUba7PLIQLVX9b3XPh
	EWYG5DA74oew/StKRJe6KCWmPd5jPPhffw8swgZfelQ+bQPVOi2BzXNCHilTQa7JdsDQ1uA7+zV
	CU2dRJ59yfKa2sRcD9wdIn2nhxWjwcv3qE
X-Google-Smtp-Source: AGHT+IHO5NjvG7NPaTx/Wk84Xf6YXEN9rB+dPDyiQnC6Nqm2qSNMD7m/f1k9O8ljI/qF9B+KJKVTOxllmfRsmBxkeqU=
X-Received: by 2002:a05:6e02:2186:b0:3db:75e6:80d5 with SMTP id
 e9e14a558f8ab-3db75e68272mr38100995ab.14.1747304620350; Thu, 15 May 2025
 03:23:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515051900.2353627-1-shengjiu.wang@nxp.com>
 <20250515051900.2353627-2-shengjiu.wang@nxp.com> <CAEnQRZBJgJpyE-K6fn3_s61-Q7j=mXk5FGMggpaBhnH62w+ACQ@mail.gmail.com>
In-Reply-To: <CAEnQRZBJgJpyE-K6fn3_s61-Q7j=mXk5FGMggpaBhnH62w+ACQ@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 15 May 2025 18:23:26 +0800
X-Gm-Features: AX0GCFs1HwaoDdoFbQAbv3WJV20f_7O_khUEi6c3pJChsc5rxc9dD7nQQ1yVecY
Message-ID: <CAA+D8APSQK8FqGYYmAygF-dhM7N_54Zw-jSz4xWrr5ToGfUKmw@mail.gmail.com>
Subject: Re: [PATCH 1/6] arm64: dts: imx94: Add micfil and mqs device nodes
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, carlos.song@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 6:19=E2=80=AFPM Daniel Baluta <daniel.baluta@gmail.=
com> wrote:
>
> On Thu, May 15, 2025 at 8:21=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.=
com> wrote:
> >
> > Add micfil and mqs device nodes
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx94.dtsi | 30 ++++++++++++++++++++++++
> >  1 file changed, 30 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot=
/dts/freescale/imx94.dtsi
> > index 3661ea48d7d2..77297dde5c95 100644
> > --- a/arch/arm64/boot/dts/freescale/imx94.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
> > @@ -108,6 +108,16 @@ scmi_misc: protocol@84 {
> >                 };
> >         };
> >
> > +       mqs1: mqs1 {
> > +               compatible =3D "fsl,imx943-aonmix-mqs";
> > +               status =3D "disabled";
> > +       };
> > +
> > +       mqs2: mqs2 {
> > +               compatible =3D "fsl,imx943-wakeupmix-mqs";
> > +               status =3D "disabled";
> > +       };
>
> Node names should be somehow generic.
>
> So here, we need to have something like:
>
> mqs1: mqs@<ip_addr>
>
> similar for mqs2.

There is no ip address for mqs module.  The only control register is
in BLK_CTRL.

best regards
Shengjiu Wang
