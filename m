Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79978288CAC
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 13:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746623267; cv=none; b=psFV6VDyxSUZyTYZrMIuD04yMibsTGYWEYIH1qKHivVH06HAhq74NIuL/nr5qaRrxu07/0BGfq5D/o0tdsHhGyMoUf9ye3MwtHY8WP6293g8PtIRg7TUXbAkYQJTjqGKSJy6/k8IJZffZmXg1+iEqg5HYOEuLkW5kqgDZfqR4NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746623267; c=relaxed/simple;
	bh=Kwhind8WBcIbv/C9JP+oZkXJQzZQNAjQBy+HdtDo3Bc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FO9dfQCUR3M80qhrtoCRcyIwstmTVrLDSpWaDzSDqvbiKuB/wCq9zD4dEhlkKOoMUNC9Nd40+yWm1ME7k5DE9cryPLPn9DaTnUwSPD1OFQmVjcx4C5XWpGelqCdcY+uhAImOYIr95Lu275pbgX3jIlHW7TC8qAPJBu9VD9V2QYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZmOSEiHx; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZmOSEiHx"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-736c062b1f5so7078526b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 06:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746623266; x=1747228066; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kwhind8WBcIbv/C9JP+oZkXJQzZQNAjQBy+HdtDo3Bc=;
        b=ZmOSEiHxg0Vac29XtVT9K8I+ynrp3RW1a4eIhcy59a4kjskoYsAI3/b76SOp0o4ip/
         R1momVfrn4VhtYG79IKQ1eN+5xrXIep0HuJz87S9bfBCKBk+NYvpueM9uSd2b+lTSFpJ
         gPafeJ/irKYb/vohgi5GzEUZbOAnOd5GCRtdFxfWjGEkUyjJuj/x6ZWtw4gD7hD04mJ0
         xN1NJp3maqqQ88KJ5jAiAvMDxnvbc2VRNICfgUk97qRNXXfttx6Q+p/3+kONSfdqcULF
         aDTBAM5TAQyqemc1qtmSAG4qrAYkHZwQwA/mJl7PRe6ZQvt5KLC9C96qhFF4DJoSK08P
         0YBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746623266; x=1747228066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kwhind8WBcIbv/C9JP+oZkXJQzZQNAjQBy+HdtDo3Bc=;
        b=hO5p34U0oV3/YLN0P1lSGgAKsp07XhFGvTrADurdFkxKIrcGQ2AYKdXsB2/KNqcQ2C
         +4DUWD8voG0cR9pGczF2a3qw8M0JGJrqJwY2UAkHl98lHGfMKwKK7kPZApB1phnNAE2M
         3gHnOA+fuUk+1+ntN+Xm0HYNG2iAl7zS3VzJ94A8xqGC4c2JJHRipsEfDaJI3XdULkjF
         TJfoTu6mXGXCSdk8QKVSTEhj9JVu6/AFcMfK0jr3y1T7nzJAviLK1b3Q92lFEgbcS6XB
         UlhTDZVYcAJIvW6tZ+XZRH5QkGArahoeMCA7r6GsxPzRkHAS3sWVX+0JWbmHNZa8MwdM
         Hoyg==
X-Forwarded-Encrypted: i=1; AJvYcCWXOwjTeiocbmHgS7EoMJK1zf0/3SBtKBEqXFTbgdNEnQMmixmTqgDYVigRZqf6sKsjnVTpnXpnDIA0vEU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCJnxsWt0+OpxuQWSSvyjU3Q0Myv6lbyUU9laikjtOHJgb+eu9
	mtlS5LmhV8eY0kWJjt4wdQsvERBK0BrKAPX0AKsdpkkgYyFQKTLJvCGpOj19un2X+5SS+5cCB2T
	eSTJPTs0pG6kyk+iLq+t+siDkC9Q=
X-Gm-Gg: ASbGnctqaOGCsaE71dHOCVRxspKJmvKbhadCR3MqCF0dlWdihRmgOoVL7939XxivYKc
	WwOsjgLkPfcmrHYISpXAWBmdS3jT4PUEkb4l/3lWmXOHwFAs9rtE8bFA4k+5fPMV4eDnKt7YlO0
	iwOOOWdtAB08S3t9rPWHhy
X-Google-Smtp-Source: AGHT+IFsKM4SwlHcHAqI93o6LX5eVmvP60jHJkaKXXFf09vtRVqDaqjp++7kfmVIDfCN4TiGj/BBGOqa2OYaD6AqCDI=
X-Received: by 2002:a05:6a20:d817:b0:1f5:7cb4:b713 with SMTP id
 adf61e73a8af0-2148c0f6340mr4688620637.19.1746623265625; Wed, 07 May 2025
 06:07:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507112131.3686966-1-tomeu@tomeuvizoso.net> <CAOMZO5CK11wByq3BL9XZgvfFv1_kp94CNFMYDaEJ=WxcEFATJQ@mail.gmail.com>
In-Reply-To: <CAOMZO5CK11wByq3BL9XZgvfFv1_kp94CNFMYDaEJ=WxcEFATJQ@mail.gmail.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Wed, 7 May 2025 15:07:34 +0200
X-Gm-Features: ATxdqUFtN2tIUuHmsB_NiGnAxikFEfXFsc3gynQ1WlFKNFdiLvGY_6sLmBCbXaI
Message-ID: <CAH9NwWeBKXbFkCydXq9mupAosVFS+Wvazq_Bmkt9D4CJNP5YNQ@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: Fix flush sequence logic
To: Fabio Estevam <festevam@gmail.com>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>, linux-kernel@vger.kernel.org, 
	Lucas Stach <l.stach@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, etnaviv@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Hi Tomeu,
>
> On Wed, May 7, 2025 at 8:22=E2=80=AFAM Tomeu Vizoso <tomeu@tomeuvizoso.ne=
t> wrote:
> >
> > We should be comparing the last submitted sequence number with that of
> > the address space we may be switching to.
> >
> > And we should be using the latter as the last submitted sequence number
> > afterwards.
> >
> > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
>
> Does this need a Fixes tag?

Yes - based on the READ_ONCE(..) line, it should be
Fixes: 27b67278e007 ("drm/etnaviv: rework MMU handling")

--=20
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
