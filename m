Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7D429CB3E;
	Mon,  7 Jul 2025 13:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751895827; cv=none; b=hvOvKwt3ESXSDkjIAedYBvDqiTVlcBbb6PUu93v2hyzSbkVf7eqddlwRC224h1s/QBmADZg9uDv00GbuNuwl9bUo0Ke3dh9xqdRIGUQU2jS4g2qyxLUB9FuwkiQJmpb9SPZfJVZL393oyItPX0GT1YC2cJSpGkNepYMq+k9MAKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751895827; c=relaxed/simple;
	bh=J4AEHDJIG2VhVpwkNrZvA/v+izbZKmF1qdr2u2Chf3Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jUm6gOaT7Qdzn0URyWUyutllVkYuD8N2YAy6iIeJbVIcbj+ySm/WxT5WBhTaXJ+UwBs9Ujbh0m9jnMP/d1E6SehkMV56WqnOGK7TAq9PyU/RA4j70FUOHpvXTPxfW3naz/dGP4gzdIZrpQu2D0MBlfZChwxNi95jT/Eb2WyEBCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UFi4qhaA; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UFi4qhaA"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b34a71d9208so2034535a12.3;
        Mon, 07 Jul 2025 06:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751895824; x=1752500624; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZGsbuxfJDD7WPNaohkU8W6/CVJp+eMGr8CZHm95Rw+w=;
        b=UFi4qhaA41EGY+NGjxGN2xWCALDw+SQBOL9TM72tTZEiIQK++v8016v0yeFzCnk07g
         AKeYlX1w84pw5TlI3gmz3ynS9tgPxR2MB+efhVYE3voR5u2K1O323g16by3vwha45ls7
         nAH1SObj06afQYf4AwbuTS6awxptSn+VDafsdWORaK1Em0eJGUxnDkPqG2xOQl7fr4pk
         loabxVG4vIDVJIM4tIT6urfRrXH0nUuFMk+slzg0o7AsH9NWaIGG58CdBORSpadjHZTZ
         MLH6zNtOtqNTc+mPK92xJYyjewxscqp0vj78dwNgzNkuIvER04TpjMw/XORW0mHGjLpH
         B2/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751895824; x=1752500624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZGsbuxfJDD7WPNaohkU8W6/CVJp+eMGr8CZHm95Rw+w=;
        b=c6AO5mArvKflGJwz9a4MYh44SucAmqd5ycB5mT67ZA61S82SEtP/XGFNoEVxP12Up1
         XG203W27SIsN3ekh4rODORh2PrxCLaK4w3O5XISwxq2Xqvww9MjIRmyFJLIFVOgOYFgA
         xSUt/zCs7vNewkEQMleQoKTEl83RLokgYXWjTuZKOHlDpfZ8Lir6zwa4afJt2TNrb+ed
         48PglSGtKhggikPlTHs7vmZ/blOp+TQKsE7mV0wVZ2GUwDLHmtUVtH6yS/rJmh2garYI
         fzbxzvQ9CFzB0tTHXXnA353JOjUTI+TJk3h1x3MQEFASu9Wv2m/eMMyPpeGnvfKO0Iao
         585A==
X-Forwarded-Encrypted: i=1; AJvYcCWahpzwh5Zv0qNOtjGVKHvU8I89J4zJpKWM3Me3fYrrJDM/hnRGahEqxTVbJyctxMq2Yb3Heb7P99djWzOj@vger.kernel.org, AJvYcCWsZQ7MRLtd6EpbK8D2pnHNnIuLvDusjL6SwWYYUdXhzOZqMALHD8DLTXn9I+RYB26GvZ34/oRPSNc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKbbHppOR8IjAefxXcs/5ZOByqJ+OBC7NhooR/GVAlBoaVZoPG
	+hUnJW8IjJHbJHGRE9guAiW6+TK6CTh56B4PCee/uMW/cNQzrFsys3JddH9FTl3WUxxDNNWCZao
	zlUjIdls8KiN7oLXIf8Mz38vnnUDZHcI=
X-Gm-Gg: ASbGncvHPyFLv8vmJ3qt2/MKKrc0U+NNHPMXuHXqoBR1c0oClviLJZkAzEJoYWuqBGl
	npTM5wdLtCMXbKRmX57HGJOsFMi6tcUwxpSS9czUyhQgbhX8JcKCnDDRpCNdqd2EXfWdkvpYq+h
	hPqUPvYp9pQUpTeOQq4dYI47y/vb8vTUP0Ive/t7PPAkfju7znMMnMTw==
X-Google-Smtp-Source: AGHT+IFj37WtbRywUM+KTsqj6uNTP0kkxFDkEMr3fRtNfVMHXma+9TwwjeKy6w27RY/k8Aks5aR4Y5bN0iDKpZtxKyU=
X-Received: by 2002:a17:90b:3fcd:b0:311:df4b:4b82 with SMTP id
 98e67ed59e1d1-31aadcf7c3amr17247922a91.4.1751895824268; Mon, 07 Jul 2025
 06:43:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250703023511.82768-1-luis.hernandez093@gmail.com>
 <202507052123.55236.pisa@fel.cvut.cz> <b56b9602-d715-4de8-903e-7c97423bf5bb@infradead.org>
 <aGsW36iFMyp4ojdf@archie.me>
In-Reply-To: <aGsW36iFMyp4ojdf@archie.me>
From: Felipe Hernandez <luis.hernandez093@gmail.com>
Date: Mon, 7 Jul 2025 09:43:07 -0400
X-Gm-Features: Ac12FXwtMSLY6-nWpzeOChev97JyLYP55obhTyZdz3c_gEa5zPeHfCEZGF25PW8
Message-ID: <CAGRSKZgTwHRvjZaA-HzHHiA3qhN6i-v=tLR8OsBgiJMe=F6aig@mail.gmail.com>
Subject: Re: [PATCH] docs: Fix kernel-doc indentation errors in multiple drivers
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Pavel Pisa <pisa@fel.cvut.cz>, corbet@lwn.net, 
	alexandre.belloni@bootlin.com, ondrej.ille@gmail.com, mkl@pengutronix.de, 
	James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?B?TWFydGluIEplxZnDoWJlaw==?= <martin.jerabek01@gmail.com>, 
	=?UTF-8?B?SmnFmcOtIE5vdsOhaw==?= <jnovak@fel.cvut.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 6, 2025 at 8:37=E2=80=AFPM Bagas Sanjaya <bagasdotme@gmail.com>=
 wrote:
>
> On Sat, Jul 05, 2025 at 02:36:45PM -0700, Randy Dunlap wrote:
> > It needs something to turn True and False into a bullet list
> > (non-numbered), as documented in Documentation/doc-guide/kernel-doc.rst=
:
> >
> >      So, in order to produce the desired line breaks, you need to use a
> >      ReST list, e. g.::
> >
> >       * Return:
> >       * * %0          - OK to runtime suspend the device
> >       * * %-EBUSY     - Device should not be runtime suspended
> >
> >
> >
> > I don't see any of these kernel-doc warnings. I would guess that
> > either Pavel or I am using some older/newer version of whatever
> > software is causing this.
> >
>
> I think Sphinx reported these warnings on docs-next tree.
>
> Thanks.
>
> --
> An old man doll... just what I always wanted! - Clara

Hi,

I just wanted to follow up with the thread. I had inadvertently done a
reply not reply all after the first series of feedback from Pavel and
Randy. I agree with Randy in that the nested lists be updated to use
ReST list syntax. I'm working on a v2 and spot checking the output.

For reference:
I am running docutils (Docutils 0.21.2, Python 3.13.5, on linux)
My branch was based on commit 50c8770a42faf8b1c7abe93e7c114337f580a97d
(linux-next/master).
The specific error(s):
/home/linux/Documentation/networking/device_drivers/can/ctu/ctucanfd-driver=
:526:
./drivers/net/can/ctucanfd/ctucanfd_base.c:511: ERROR: Unexpected
indentation. [docutils]

I apologize if I should've started this work using the docs-next tree.
I wasn't aware of it at the moment and was utilizing linux-next.

Best,

Felipe
