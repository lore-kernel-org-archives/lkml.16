Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453962459F5
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 10:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744798906; cv=none; b=lR/E3FYQo8X+Y4tHEK38FsMuV8+RcBw1lZiqVs90GnXj891OyqSd4Ft2M6TAANIG1+diELhmr2pSqea1k+yqt/I5pS+KWdxw9pO12FAFA5ttYPWg6b/ZyxZOUjcJTQKICRB6yLW4vls8baDMdTOXgm1a81ZSWoTBj8V6UwQv/i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744798906; c=relaxed/simple;
	bh=GzLpijeCN/xnc0MpcoS27D9qekhAtoTNeNrAopBITXk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WnZnV5/pzZqtnG/IVCCRKvk2tHQFmR5nBTXNug7NqT8UxRV5uq3rK/j1+aA3pffKUEeKShXwuMVgikXWMDhLr7PUm4hZ5cD1MZ5ojhuBE6pETbpS+juIJBpfUmRf1l/QIoR1VHbsY18YFORXx0i6FFAgxev8p5dklGARJvZ4I7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VQPdSe7s; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VQPdSe7s"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5f09f2b3959so9602a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 03:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744798902; x=1745403702; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gI/k9ZhlZw1nLIMCv8sLSEHLegOn6Koki046UAaZhLo=;
        b=VQPdSe7s3XPRRIatL/vuIpF0gatOl6byF0DEdjLjRJh12vEaMay7M0Bu9vGRDp/vUL
         Ixv9/LROG2lJikblql+I559f1vHm0cb9xaCx/tSAKFWDzbwGfIALR1+s5Lh+Ge8bjDgW
         aoQe06cimOz31neSTApal1zsQBFB//wNc0M3G1y6hsY7Av8BuhFHAjqcOiUhEspuyNMH
         AgghzFk6F2Ra8iZJCz1j1ZSdpvOyhv2KSuHg8AhLC+RBUx+dzgBpAUzOUKJ/ZFdn2cUj
         EUYPJK9qsiKzB/YPRqVRi/xX5TC4jkcIFDJhQ11gpVtMGRNGV6Kvf1dfUC+jhmaScZ2p
         UhpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744798902; x=1745403702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gI/k9ZhlZw1nLIMCv8sLSEHLegOn6Koki046UAaZhLo=;
        b=YBzzSTH909I2izvoYh0do4uwceFYsl/fmPCSM9qjz1LrvKd7uRsfHLckiIDpjlxcUu
         Y/4rU+ZYt8miTVDkSbwy2MDVIKnVlmoWie08jReez8rVGAz8EOOp6PjfD29FTEEvudoh
         qrEbhfBChz5Y56oNml7xY6V5iqJv6qA4jOl0J+afZ/fLc8q9SF8cZlsua3lCSjbik4GY
         0hA1W132qiGwz4XLBL3ThocSX+Mou9nSwIWCODT72QZTXzrTe8ZVdTu2f4/6TDISIMqP
         iU1hxtCafBiRWd6T79wljbHJ04L3UXv7orjjFsB6spNMQKoCxoOW6Dxm0cw6lV4eYWgv
         sIeg==
X-Forwarded-Encrypted: i=1; AJvYcCXifb4GXzUMLBbb6e8ixPWXnFYScWGwSCFJ8hxSwFN0Zj0bWibk1gyRzu/zMP+qoZt5P2OQp4SJbApx9KA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWfbX/zZWSpEu14+V5a3VL8NMMoNxNSONLN5lLYDpUsw86hPDs
	aqoBKVDukDSKHeIvquq7dUsvPIzTFptlnQOIt4WioaX5dLWUq+QyQce/6787PwKoPoaxmXJrpxF
	gNZ4r7ZN2B0/Zg+sBr70czr4TJjfXmTQjw6HZ
X-Gm-Gg: ASbGncvMeAD01J3Fih91X9xZVUjNUmwt4UIawQW+yD5zR2BAE3QloS3gI/3XihlbvnR
	lGWL1F9w1L2g2QeSiIdjNyfpMYYsBy5TC3CHOnSMUjOW5Nz2/OtPTMzUp27Eqno1ASVWSqvWJle
	HGIyJjEbTLXQkwKE3QtxKHxFojdLYMcARzfWiolbLFHQlilh8heZd3
X-Google-Smtp-Source: AGHT+IG0YsgU3ftiWo0K6lBwOj8sW/iLoTyVfIdyazBDTtja0alyxnkkoDAOkqtdSVB+I4ZxcIm+Daz0cCs9UTP+gPs=
X-Received: by 2002:a50:870e:0:b0:5e6:15d3:ffe7 with SMTP id
 4fb4d7f45d1cf-5f4b6df5699mr35534a12.7.1744798902226; Wed, 16 Apr 2025
 03:21:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408035833.844821-1-guanyulin@google.com> <20250408035833.844821-3-guanyulin@google.com>
 <2025041107-guru-epilogue-a4b6@gregkh>
In-Reply-To: <2025041107-guru-epilogue-a4b6@gregkh>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Wed, 16 Apr 2025 18:21:00 +0800
X-Gm-Features: ATxdqUF7ff6_Wg9zdoYu9aYlwaX5VUj6KNg2hBrNvQ6G3MnjCzU81IwJo-w1lB4
Message-ID: <CAOuDEK2av=TmLu5L5xMryh9jCu0hsXNwcC=ZJjnjrtkwG0+bPQ@mail.gmail.com>
Subject: Re: [PATCH v11 2/4] usb: add apis for offload usage tracking
To: Greg KH <gregkh@linuxfoundation.org>
Cc: mathias.nyman@intel.com, stern@rowland.harvard.edu, gargaditya08@live.com, 
	kekrby@gmail.com, jeff.johnson@oss.qualcomm.com, elder@kernel.org, 
	quic_zijuhu@quicinc.com, ben@decadent.org.uk, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 10:01=E2=80=AFPM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> On Tue, Apr 08, 2025 at 03:57:22AM +0000, Guan-Yu Lin wrote:
> > @@ -733,6 +734,8 @@ struct usb_device {
> >
> >       u16 hub_delay;
> >       unsigned use_generic_driver:1;
> > +
> > +     refcount_t offload_usage;
>
> You now have 2 different "refcounts" for the same structure, which of
> course is crazy and will do nothing but cause massive problems.
>
> I know this isn't going to be used to "reference count" the structure,
> and surely you don't need/want the atomic properties of a "real"
> reference count, so why isn't this a simple integer?
>
> thanks,
>
> greg k-h

Thanks for pointing out the blind spots. I'll change it to an integer
in the next version.

Regards,
Guan-Yu
