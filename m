Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6DA227BAD
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 21:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748555740; cv=none; b=qImbJ2+6v0E3KhE+bhMuuSZhR4CJ5tUPqoSuNuKXX6acByz1cMozb39CazgV8Q+Tx+OUOeUGgfUe4tlieUoXN+SRz3hW9QXM8qs2eQ1u/QuoPoM7AMpsrgzDc5gF3swI32OgkgNmtHpiug6dicDlMhRysdk4s368sq58wlej00k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748555740; c=relaxed/simple;
	bh=RUCzxjR7IekM1a4kSEH5opLE+rPn0u2uzMkTxuXIyYA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L8p+ggsYiU0SGoLUc1H6JjzTBLRXa0+2mFOHy26ckVepBJCXRNKwJsTp5sZD3S3RcdKJyvx8kmqrlA4K+7Ip4HeOVG99G7f8jTo+zzby4x8eTjks3RYJnXXBSnKfc7k8rgIk9Z52NewNxAXEt9XlTiCS7evFGpFDtu6zAWu2sz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=GIQJfm6W; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="GIQJfm6W"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3105ef2a06cso11732941fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 14:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1748555737; x=1749160537; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUCzxjR7IekM1a4kSEH5opLE+rPn0u2uzMkTxuXIyYA=;
        b=GIQJfm6WwrkyfO/erRCYXQ96yfAclVHDDTkd+tX/bA29ZBAlEVXNbZUhOhFnPM/BG/
         IUCN3EVdf/dfyiJurkV10V2shmHqgpC/4a1BPahJKuG4Fus9QabgQCLGkyYICjaXFvSX
         tKDhCds2ZLxe/sEYYmoAaOHN4PDGndxL04ddw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748555737; x=1749160537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RUCzxjR7IekM1a4kSEH5opLE+rPn0u2uzMkTxuXIyYA=;
        b=eNElmehpOR4GeSpR0ZXYiugoeAiN5eZYi79W5yr3zVrk1d5K9R/DSlnk6QaQFbAnDb
         bD8PWveXudxQUuB00RdidiWCOv/NtLOXml3PyzXyvuGEf5UEyJjzCm5gNQzERTY+kHos
         WqNxEFIk/c9GlCEi9kIDvvWEUMvUDWoj5fuSnqMCbs4wofZZS3GYB3yfd5Wfy/xQFfHs
         oMm5bYNLT6MrayD3eOQm/0a9A5h5vS4DjLV2xNQV4IdgYrDO+Fk5V9KmGvki3GbbxJw7
         CWEbnG4UOoGB1DO4qOJ/dg7nrhltH55QSIg3QnxSJkMtIxypkKD8SWGHgu6z1oBshpcp
         Xs1g==
X-Forwarded-Encrypted: i=1; AJvYcCWv2xvMR4EVf5HV4AqV50edECoegJo0oEFpler933kmBM19DxNpVgv7JHzzf3a/Uk6XpVUmtu3wLciINcI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjVUciiHrO6PFE9hGmfsG6BGFU9aqNsZuYrl2PWQeRHgPAQBjF
	7kKSMV3mZ8qfMisVDOc9BdH49/WKIRNGGRRenpp2JKQ8xfgF45Z7ESIZ1/pXIAbrsNUA1Z1w4ZG
	JH+8Zujgw2P9rIKmTLuoaaOPFVrjA9HO1RSP9/Mhw
X-Gm-Gg: ASbGnctTMnewf/DCWsH1PYTb7zw/b0f/U4EcYo2Xy79ZM33sss80CpiFZ18uaADdTPH
	OqQ/CZ5U/Z/CvvmUfYNWF8PNv0pK4MxCy0I7rh7phT1LBQ7bLgWDvECDcaumharn9WRn33u3KyG
	rfI8PAd+3YhK6QRnU5TvT8HW5rUzq6/avrpw==
X-Google-Smtp-Source: AGHT+IGdOld+7YXP9ssfHUcfkf/2iroyB+O4/3ZxI3cYVzni7X95zPArmZWsOfPC6H6XG+f5Er3SSTs3EBzTon84iWA=
X-Received: by 2002:a2e:ae15:0:b0:32a:648d:5c0f with SMTP id
 38308e7fff4ca-32a8cd5808bmr4820971fa.16.1748555736843; Thu, 29 May 2025
 14:55:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513210504.1866-1-ronak.doshi@broadcom.com>
 <20250515070250.7c277988@kernel.org> <71d0fbf8-00f7-4e0b-819d-d0b6efb01f03@redhat.com>
 <CAP1Q3XTLbk0XgAJOUSGv03dXfPxcUR=VFt=mXiqP9rjc9yhVrw@mail.gmail.com>
In-Reply-To: <CAP1Q3XTLbk0XgAJOUSGv03dXfPxcUR=VFt=mXiqP9rjc9yhVrw@mail.gmail.com>
From: Ronak Doshi <ronak.doshi@broadcom.com>
Date: Thu, 29 May 2025 14:55:20 -0700
X-Gm-Features: AX0GCFtcB-kjJF8l6tUeq4rt-EmMLhhNqzs4zV-Cf05W3_895cC3fyPVPqBPyxs
Message-ID: <CAP1Q3XQcYD3nGdojPWS7K4fczNYsNzv0S0O4P8DJvQtRM9Ef1g@mail.gmail.com>
Subject: Re: [PATCH net] vmxnet3: correctly report gso type for UDP tunnels
To: Paolo Abeni <pabeni@redhat.com>
Cc: Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, 
	Guolin Yang <guolin.yang@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 9:10=E2=80=AFAM Ronak Doshi <ronak.doshi@broadcom.c=
om> wrote:
>
> On Mon, May 19, 2025 at 12:30=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> =
wrote:
> >
> > If otherwise the traffic goes into the UDP tunnel rx path, such
> > processing will set the needed field correctly and no issue could/shoul=
d
> > be observed AFAICS.
> >
> > @Ronak: I think the problem pre-exists this specific patch, but since
> > you are fixing the relevant offload, I think it should be better to
> > address the problem now.
> >
> Can we apply this fix which unblocks one of our customer case and address=
 this
> concern as a separate patch as it has been there for a while and it
> has a workaround
> of enabling tnl segmentation on the redirected interface? I think it
> might require quite
> some change in vmxnet3 to address this concern and can be done as a
> different patch.
> Meanwhile, I will raise an internal (broadcom) PR for recreating this
> specific issue.
>
Hello Jakub,
Any update on this? Can you help apply this patch?

Thanks,
Ronak
