Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAE92DFA39
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 10:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744797972; cv=none; b=uoBle52UxtN9ghSrZFMuaimkvwwmRr6jgw0HiOGqrqWu3AwZRhnXdwiaxYkRGcxtdnul+BAzApbykKrq5I2Upxy1e3cOMvm37U8XBI8XDfKnVuXNHIxZCARwMn6DfK3+0Ed4770RBrAH4UqTLg8d/LSmle6oSnne7fs+BObBFLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744797972; c=relaxed/simple;
	bh=2IcbjuyAVM4kLhvW0gDdafAXht8sirWnrRq3F/Gm0hA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qj3/sPVTCrXSOOX4Z434mejae01ElSJ8KhGE1y9E4TXoqkBSPO4Wj7UsS638ORvPkv8oVNapRF9qNGFdUi+SMzeOPob8ySOHtNJC2vK9jiuPR+3moJ2iqYoG9nWGNl0kC8KwPTggrhJgZF21Yx2Phrbb3GDwdpUQc5BIu/1w8Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qDAwAVhb; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qDAwAVhb"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5f438523d6fso7529a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 03:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744797969; x=1745402769; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oJtO5p/6ZsGHTmasHcgl8RQRMFMxAkQzPoyy/PT0rL8=;
        b=qDAwAVhbyh1j7xqLWYCZmU7OhzS+D/YSoxijZdC6bT5dPIuP+dBwrA2wS3X6MhVzcR
         2Il0b8MvhDFvFAbVE0OwaXjjOKN5XxxMBbyiyzM78vpmKNhXKeFjjYiYgoOTu/9zbIDL
         wiOf54On9z43wWQAFr4RhA4lWdmP3PbR/3pAAFiY3DTeS5uVYUrYg47zpmRslZED0HE3
         L7NLfFicZncYUuPg28Qom/07aFjQt0jb1Rcy2PNrz5HpEOrX5kLkvO1mj7g2Gndtk88B
         EOJ8/lg3CN4T7EDLjZYDcGj+S5mtXWPslXrzcCmTg3TjnHJ5XKZCESg9JU5wJgrhYZzl
         cXBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744797969; x=1745402769;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oJtO5p/6ZsGHTmasHcgl8RQRMFMxAkQzPoyy/PT0rL8=;
        b=c0nxHUOdOiuK7qU42jFxa32O7tdApgrq1XVFYadMWiGj/E/GVWehrT6o6AQIXGJJU9
         shL5RJv8/4Xs0WtTnWfvMdcRuFgSEGPEPvd5iXaCpSUzjp6BbziQywMhGaJLZrsfqYqQ
         QVt+r1+MYEchdnCSPxHRk4IsTQyzg534TN3M20oQ1odnCCnOY6udUYljM0Pq1QHAzeF7
         lCoYfrdrxDrKmfilcdrD7TltVSUuyP2SKjSGjlSksMqKI3pr+dUCt734CbFT0E5QNNX6
         TSVktgeqgh0t4IEZeAxp5YtyOvBIcQ04Nkrpmtnso/4s1ACoKhiqwYlZOJNwgPP2E4US
         qKig==
X-Forwarded-Encrypted: i=1; AJvYcCXIvm33JV+74+izVHgQBOeklCl+RCuWfu71Ki64YCF1Oc4496lUj0uVn/BowEsw91T0b9foaG8y0BScgbc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0yFDpdOKeAhqyci9QHEp0R9o61pKxBb2bL2hCm+S+oD8DWVd9
	CpLS3+ytakX1fDlnuJ4QXUmji+4+kk6DDOpGvp7gNL8jrGfMLn0tHXvlN+m3n8/OL5q+3mmsxKS
	4wzC+DweCh4s6AvtQNVYPg+em/wCKo0qP/Nbu
X-Gm-Gg: ASbGncu0TTbWjv+PslUzKGkjHZTDIfnxyyheVPCdn7ilD6I/LHVPJNMhqZxMe/tb+AZ
	dqVhdMcAJ4/wzntLomyIE9jMAV3pPIz6PHTSAZ2VRL9PQ6vgieUZZoYmn20ricUjP+WdFVOJJnY
	2v2mTvkZ7DMFnfrPA3H9iSKSsG9bWCHVbevrGABA++1QABGw2Krdtj
X-Google-Smtp-Source: AGHT+IFFSblm/GfnDiFSG1MLMOppLXh+oYcsUvCfbwn5ir+K9snJXxGTAxtAyqmuqMenSvvMadnZW3B6voE0rCrc9yU=
X-Received: by 2002:a50:9517:0:b0:5e0:eaa6:a2b0 with SMTP id
 4fb4d7f45d1cf-5f4b6dc8e63mr35464a12.5.1744797968923; Wed, 16 Apr 2025
 03:06:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408035833.844821-1-guanyulin@google.com> <20250408035833.844821-5-guanyulin@google.com>
 <2025041140-fernlike-reconvene-b2e5@gregkh>
In-Reply-To: <2025041140-fernlike-reconvene-b2e5@gregkh>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Wed, 16 Apr 2025 18:05:00 +0800
X-Gm-Features: ATxdqUFJFRm6-kvXF9DTZ5ctKMay55IyEenq8Hx1UwGOVHXGa1wo5iRkeFUV09U
Message-ID: <CAOuDEK3b6vM_vyLDHjxYWu1UCaZ53hNse91bjkoB7vPaebEMPg@mail.gmail.com>
Subject: Re: [PATCH v11 4/4] usb: host: enable USB offload during system sleep
To: Greg KH <gregkh@linuxfoundation.org>
Cc: mathias.nyman@intel.com, stern@rowland.harvard.edu, gargaditya08@live.com, 
	kekrby@gmail.com, jeff.johnson@oss.qualcomm.com, elder@kernel.org, 
	quic_zijuhu@quicinc.com, ben@decadent.org.uk, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 10:02=E2=80=AFPM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> On Tue, Apr 08, 2025 at 03:57:24AM +0000, Guan-Yu Lin wrote:
> > @@ -736,6 +737,7 @@ struct usb_device {
> >       unsigned use_generic_driver:1;
> >
> >       refcount_t offload_usage;
> > +     unsigned offload_at_suspend:1;
>
> Please take a second and think about how the memory is now layed out
> here with your new addition.  The tool 'pahole' is your friend...
>
> thanks,
>
> greg k-h

Thanks for providing this helpful information. I'll reconstruct the
struct to minimize the effect of new additions.

Regards,
Guan-Yu
