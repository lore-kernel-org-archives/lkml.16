Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F47165F01
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738867639; cv=none; b=qTclyJ2u/v3VL/vuapoV8aR75Oj5Kz01SYB488oM4vb95G9+0Bqx9dMYhb/a52NE0QX0ocCanoFfGiPPWxdyCuuE/Z/B66sSJoZwEXOd9mb9S5ZOosvtGPS9U+ntKAFMTuXJrxYOpaYWPoaQ8XGNkRr7b8aNlFryyfxx7ayB+D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738867639; c=relaxed/simple;
	bh=3CvL0m3jkteHJzzDFzIlb0Nrs0vGU0J7sc6PiQdecbo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rq0o/lThQCnzlkxP947hfTx8N4x83RBN/RW/tDdcsAgOaEEd2AfL7Z2rck5fffgytxsorBC+nEbHBKN9+BSd98+aKamSrg1dpXgJ1RTsnGC0oTcRIRVjebIce8hveOXLZYur/xUr8Byids2pAO3kErKgMToUwznytwwuMy4bR0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ab70043cd05so247591666b.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 10:47:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738867634; x=1739472434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3CvL0m3jkteHJzzDFzIlb0Nrs0vGU0J7sc6PiQdecbo=;
        b=PZNdRop+y6uQJLZAhPOBb0Q7+SH4DS3oGxhLR8XjCPh5DVA1xnb4pQxYq6lBkQQqBs
         EGIkhiqWijItWmjfEKYZbmvkAtc42Wy5RR3Q1HDhq+f+vXmXR6KfoEuISrvW7WeeV4gB
         NcNz4TmQ9Fjt+9R8aBhlrWTAG+CzBcYRCCmHDgGYRwcMvw5LIeokZb72xzCKuWkgvRtU
         Vtb7/Ezh6Dsbsp2x/m0Ul0dhLSS729upzn7Ys8lgTrYt5vlTakKr42DUyHXFRkdBbjtk
         TpA1c/3Qgw2Oa4hfKEoGj7g61RgU5yJLyccPY4pHNQAIFUh+d1qW57+ZdbLEpntyqJGO
         qngA==
X-Forwarded-Encrypted: i=1; AJvYcCXmygNrxokIxirZAhhmrSYzKrlTrKjHWICS2J3GQEwPezfMxloyCiraqwojQ2ayIxeOYQR1daruIyOg2/c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn73r02ifBz3uJGIxPSradOFVoOMGgJOzY8Sm/2s2h0Z0c2aIs
	RYrYqTsYljWXdiRntVPPkS4LvCTODF31uwUFL/ngND2vSkvLAjRehklkEibL
X-Gm-Gg: ASbGncvo8V2ZdIirDWZO58LBTNNIwS7i54ClWb2basvDS8yLO0mIIz5BJc9bT/6mcjN
	MuXXqrqXJP+hDRq8kYUYTpBVkJUu4iVx19Jlv6j/yYAqvoKu3yi8/MpmW937y/GUGH156Pn5tW1
	EDrv26CqKUdaJcb4YY/yBUmtpSADCNPEJvgL8b1yKxPLD5iWuNyderxgyLCkvMzXm+SPv55/IC1
	wvdBbD12dzLXmw/+INs8gqPz0KD+ift0oZl4gqJYmQzcIQuH/s7eVc0PaWGaBSZkNby1LbkTY+Q
	MX/VmnMPsZ+UI6Gqi4YDyKL35gX6XzuTQLaOnANmXGT7aw==
X-Google-Smtp-Source: AGHT+IGmq3vO8HXIlcePjSkFEYN4myPAu8EnGzaZ7NBPl+CRkiSeO7zfVc8AOdMqYrcv6lab3QPwyA==
X-Received: by 2002:a17:907:c285:b0:ab7:6d4c:a280 with SMTP id a640c23a62f3a-ab789b2928emr1431866b.12.1738867633661;
        Thu, 06 Feb 2025 10:47:13 -0800 (PST)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab772fd61aesm138221666b.75.2025.02.06.10.47.12
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 10:47:13 -0800 (PST)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5dcd8d6f130so2519491a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 10:47:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXla6myNJ6npuSUOXmt8ZkyOYyOSOEw4/BSY1n6Mfj/D5kKtrnIcmdKr6ZlJ0ta9GSiazwqd3HqFb8BeAw=@vger.kernel.org
X-Received: by 2002:a17:906:f59e:b0:aab:8ca7:43df with SMTP id
 a640c23a62f3a-ab75e346689mr814172966b.39.1738867632761; Thu, 06 Feb 2025
 10:47:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207-rm-maint-v1-1-10f069a24f3d@marcan.st>
In-Reply-To: <20250207-rm-maint-v1-1-10f069a24f3d@marcan.st>
From: Neal Gompa <neal@gompa.dev>
Date: Thu, 6 Feb 2025 13:46:36 -0500
X-Gmail-Original-Message-ID: <CAEg-Je_SSTiiq5R9hce-7j5W02GaQqNUj=bFH+FwgjjxWugFqQ@mail.gmail.com>
X-Gm-Features: AWEUYZmC5-xQFpWjOtuSomVEBcmsdobu2wf8xt_sdgJzDJ8BCc8mTMFpWqGxYDE
Message-ID: <CAEg-Je_SSTiiq5R9hce-7j5W02GaQqNUj=bFH+FwgjjxWugFqQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Remove myself
To: Hector Martin <marcan@marcan.st>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
	Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev, soc@lists.linux.dev, Asahi Lina <lina@asahilina.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 1:31=E2=80=AFPM Hector Martin <marcan@marcan.st> wro=
te:
>
> I no longer have any faith left in the kernel development process or
> community management approach.
>
> Apple/ARM platform development will continue downstream. If I feel like
> sending some patches upstream in the future myself for whatever subtree
> I may, or I may not. Anyone who feels like fighting the upstreaming
> fight themselves is welcome to do so.
>

I'm sorry that it has come to this. You've been great to work with in
the Asahi Linux project and it's unfortunate that it's been so hard to
make progress in upstreaming support for Apple ARM platforms. I hope
that there's some reflection on both sides and there's an opportunity
in the future to rekindle and improve the relationship between the
Linux kernel project and Asahi Linux contributors.



--
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
