Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EA51EE021
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 08:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739262247; cv=none; b=qCoqn20xm2ipMXVj6a/iJcqjjRS40tJDHrA/Y68xWgBTTo+tu3P25nVVafhxNGnvZROOrH7nmaUiGDY1i1XJfDbaWTBpydzYShX5wK/gjvC3TV95g4Uz9qJS7xr46VUXa8b03NyAuRSbfFZZ+mv0hWBjvy5MFqPpcETwk2nyP1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739262247; c=relaxed/simple;
	bh=ifRLaJBktqmTpnnCcmwfpSFvdxOP2c2F4flLBgStzXE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k5JcHwITimAfPRSX9RiOmXJJ6k771RCc9ZwKzDXM3ZWCXw3tY9texmJdzbm3mHqcmAzFFFeeETVb2fM2Wp5vqiTWwHrI/4T2/IlYW7Fm4aalVuhi87YwViPDCF5EjwRWtYOkM/7KK9ZRPrZNa9HwDsM/T80WHD4CESQ7LonTLfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ftv/MSLa; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ftv/MSLa"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-46c7855df10so99388151cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 00:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739262245; x=1739867045; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ifRLaJBktqmTpnnCcmwfpSFvdxOP2c2F4flLBgStzXE=;
        b=ftv/MSLaFgXO5IRPUhY4W8hqUlH3yFG/oNWjWHcS2WsscRbshAS2zxJNyGj3WBk99s
         NJ0IOUraYb9Wnd/DEkv+7YEWH0k/wL8xOreeAv3DImj1JutpNatWMvjd/K0L5ivBPqN7
         fvqUDHeArWybPcqsqGwhh4s8dzFt48Om5Qgn0SI7hvqfzDtyv+4Y1qX05vIeHUgk1iK2
         Z/zI7OmAJMa7/QgCTx3K/b3hV5hsID0L6e6YgjnKXW7Fw7ZwGzdNRPz80Iv0hnVFuvuq
         GS9HadOj9uJPx0m/TG6pgVrHxjXGdxfOuIL7XXCOb0s/K2HWb/y8JA7QYW868NP2ZmYL
         h6Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739262245; x=1739867045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ifRLaJBktqmTpnnCcmwfpSFvdxOP2c2F4flLBgStzXE=;
        b=qVA2+hXfnXDpMAJ1XbNXS6EDKM2RqiPNQtFeNkGlFyjLeFYXn2ppyuWlr+uLft0RGg
         oHYtqzaLAVc/XCrRuxHpUiSn0io1bCEdvNoayTzkvXQf2H3HvLw5c9IAYMha2zzXZbSe
         hiKDX795MjhvN8XAWZuRkXHPyDBgiFKihjyIAcJwxxa+y5qnwcnFQDlrxFrc9IRvQsEQ
         oXPn5cgQwVWMf0bOhRrcbK4e9qhDqGxrUvXj0KG4YF9yyF+XRv3jhi7GkH2ya4NdSwNH
         KuXbWbieB55m9Dz4Z8dCHbUfqVyQeHxyCXkeuY+Gl5QNUU3Na/GKm9V6UpegFRJGJzoy
         cG2w==
X-Forwarded-Encrypted: i=1; AJvYcCXC/qIgdSeaAWsndqCTTZ7bSGYpIbPR4B4Zrjx8LofOwaSfhrWoA0JXRfVLU7Sj8Wx6OJMZJBww35Enibo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfXs6rmOYMZN5qBDikZxxFv8xZ8mp75CKGqDP580RL/gzpiscE
	NjQ6thr7cJd7dFlJnflaIdJ81MxbFKXu6sYO/gYmzeMHb71DUz0JJIHQC4lJ5IEY98mVRzUWiiJ
	PJDfjJmL9hsFkOjkHgoqXE1BgGRt5FZ4hjtLm
X-Gm-Gg: ASbGncuiJiURC5CLfGEYdZncQk+I/FRreHcj8yZ3UV8s7QD88vjGhrQ90mzBybf50Tu
	MctZZontLnjTIRg6iedinyEdU5BV9U0ZbAKXKSLvnw5ej4Kuqxb1CSW39ouMoGMWrclDjJ478F1
	anV7o6+9sKK94W7m4TtoMZgzXSHg==
X-Google-Smtp-Source: AGHT+IEvG6S6xcs56xjN0nAUZZfVaTqnDAf5ILSFNzFLCOwaS5lU1oNUSBNzc9q69gPfSSzsqPjwgrmOwYvAwkgXN1A=
X-Received: by 2002:ac8:7d8b:0:b0:46c:71f6:819b with SMTP id
 d75a77b69052e-47167b24764mr273409231cf.49.1739262244899; Tue, 11 Feb 2025
 00:24:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250115083215.2781310-1-danielsftsai@google.com>
 <20250127100740.fqvg2bflu4fpqbr5@thinkpad> <CAK7fddC6eivmD0-CbK5bbwCUGUKv2m9a75=iL3db=CRZy+A5sg@mail.gmail.com>
 <20250211075654.zxjownqe5guwzdlf@thinkpad>
In-Reply-To: <20250211075654.zxjownqe5guwzdlf@thinkpad>
From: Tsai Sung-Fu <danielsftsai@google.com>
Date: Tue, 11 Feb 2025 16:23:53 +0800
X-Gm-Features: AWEUYZnc6i7aRRZ6RIQtCX8U-116xZHmxdqCHXzanRXGs3ByiGoUulWq36x3aKs
Message-ID: <CAK7fddDkQX1aj5ZyTjh1_Pk+XME3AY=m5ouEFRgmLuJjBJytbA@mail.gmail.com>
Subject: Re: [PATCH] PCI: dwc: Separate MSI out to different controller
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Brian Norris <briannorris@google.com>, 
	Andrew Chant <achant@google.com>, Sajid Dalvi <sdalvi@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>Because you cannot set affinity for chained MSIs as these MSIs are muxed t=
o
>another parent interrupt. Since the IRQ affinity is all about changing whi=
ch CPU
>gets the IRQ, affinity setting is only possible for the MSI parent.

So if we can find the MSI parent by making use of chained
relationships (32 MSI vectors muxed to 1 parent),
is it possible that we can add that implementation back ?
We have another patch that would like to add the
dw_pci_msi_set_affinity feature.
Would it be a possible try from your perspective ?

Thank you


On Tue, Feb 11, 2025 at 3:57=E2=80=AFPM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> On Tue, Feb 11, 2025 at 03:16:11PM +0800, Tsai Sung-Fu wrote:
> > Hi Mani and Bjorn,
> >
> > Sorry for the late reply, we just found out some problems in the patch
> > we are trying to upstream here, and figuring out it might not be a
> > good idea to keep this process going, so I would drop this patch
> > submission, and come back once we figure it out a better way.
> >
> > BTW, May I ask why upstream chose to flag this driver with
> > MSI_FLAG_NO_AFFINITY and remove the function dw_pci_msi_set_affinity
> > implementation ?
> >
>
> Because you cannot set affinity for chained MSIs as these MSIs are muxed =
to
> another parent interrupt. Since the IRQ affinity is all about changing wh=
ich CPU
> gets the IRQ, affinity setting is only possible for the MSI parent.
>
> - Mani
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D
