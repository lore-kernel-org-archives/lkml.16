Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D66D225413
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 21:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749676900; cv=none; b=kCb+x1cTt2cE0m5DZdUBX6aJ+avTMuU4vGmCGpt+HxEGjwLuMQOYPbLt2xxAVurZ5QByBlLOXIww03oyZkrpZE+DhBl6G+LQbKgAF995bkwYolttdLvqTlQ+1kF8ho6ecyl92GI/1b7Eghcjh4z+rmIsRhT2M96dIIjdvq/lhas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749676900; c=relaxed/simple;
	bh=M6HxvA49p+fK8bp/m2l/SRceWAjSLs3kZZfYsnrgxUg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YAwW+Ekwj/tmRthL9RhImBc7FLfP8mHsyB3wR+K7t2mKRkq8riXmyPKrMkOGaymvY/CSi3eFx86pXWdsv/iEs79/tVEz91wxEgaoiC3RpCWqz1Q8xKxNoJPa09hbFxGgR+R2Ydp8OGSoOO34I3Onl4GkZ2x8m3d2uV0Esq04R20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ZEw3xTYh; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ZEw3xTYh"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-607cc1a2bd8so660811a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 14:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1749676896; x=1750281696; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OgzdZm4+49mKePkx+kNZ7H8LSMYhd60zWxBKo/56OGU=;
        b=ZEw3xTYhQtfK1GfVgl2KU6awL5GPzlwb6Ba6X1ue3Xuqs5H3MhGtQu7PW+ldn4ej3g
         LJ+s32gQ6FVR9/MKdSFbjqCbu8Rvt+p+rxp90X9SORXwkZKKEwNdNiZST5oF8rBgOOim
         xoMDwEUsiznoSYFtBKQBQYMAiIQ4lWfAsZiqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749676896; x=1750281696;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OgzdZm4+49mKePkx+kNZ7H8LSMYhd60zWxBKo/56OGU=;
        b=BMX1Hw22xNK/nogfadb4N4brXbfYu9wrChDToc/Q8NTdI2DTHub7zdjZj4nkzRB/Y2
         jDvuwAyvgbVZaT+xs7UF29Jz9jVegYgvu4iQIh6vJczDBHsvK4gERByNnQhKnyau8Gdc
         hqJMLYzw/nEhqO5ecEuWNSd+oVoIRVRUb75aSMJ+e++tSrG1a+o3viZKxGLrr7ihWb1L
         0OtokFvGEpINvRxxbJwlSGZ/aqNPBdyS3+E/XsZYoXzB4zalJsea20fTNXWpUbssQgFr
         0uPM/j2367hZkZBoD3WRsQz8fZpph7b+5pw7ya65H3F4GEojfid62UZvEAnKEI9SRkyM
         PWkg==
X-Forwarded-Encrypted: i=1; AJvYcCX/j77FoYyI/Uuw1njBkgl8tkE2osLGkA+LH12pXpUC8SM02osYZ++6QJJeaUEqB0MFBSAx4k50QUPVvOY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPAYFRtS+nXmEdCBU2QlAO4D1Go0QeP3uXFcWCJbnZliqFCRAU
	MgheziT74xbtQZfIrbP9qpOhoWqU8MGf2aZHfyMnJ/F8e6PCHKKuVDGGSM5eZ08Ywmet/zIWNGf
	0yXG07aw=
X-Gm-Gg: ASbGncvDuGFXPz/jjAaIJysSS/zPT6E+q+AlxTXQc2VXi/DApD0CmnETZAVC6M9Kvec
	X56ph5T2MCb12W7u/ABxxwBMOEcu4G+pvB6yEEWolkBFyQPBQJx8h+uOmlAH4EfE4ioi2LJ9poI
	orlvFZ6i2uWWSmEy1L+91MPXxEjnIFTskcQa2r6bI3yyptwoJAwn97Ln6ZtwMEmXzPJOUSUWBWz
	DmJaYFtgi1zY5RBkgPy1KJHRPIz13B5UNGWkpN8Aj4ELbAvZixnO6fVlMb3ROKjq/ZLzZiAQHe3
	drDr2Hey/2HHyKatctJdPa9kNCviu3lKpEkeOtNubEwuG0ugfh98t4buPci4VyLzbEVf6t2ADmP
	JdYDSTkjHMHg8VwufKRIKZFDbYe48k1oTtpnA
X-Google-Smtp-Source: AGHT+IHZ6pSYqpIWq7TvXf7mo9UuxaQO8F+GhoXy8vmjGqV+nHdcl4xEj7vNf3vR9wcSq3dfIJipEg==
X-Received: by 2002:a17:907:c8a3:b0:ade:7513:5471 with SMTP id a640c23a62f3a-adea93b1f1dmr53898766b.39.1749676896510;
        Wed, 11 Jun 2025 14:21:36 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adead4ca957sm13544166b.11.2025.06.11.14.21.34
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 14:21:34 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-607b59b447bso618341a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 14:21:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXCT/Rioyo3YbUzTXpvuSe2FsTnx0FarKfbDOXhY+cnsLhYJs+m1TW0dyN4UOs2nHUS/XnfbydEWaUrAD8=@vger.kernel.org
X-Received: by 2002:a05:6402:34c8:b0:601:6c34:5ed2 with SMTP id
 4fb4d7f45d1cf-6086a8d8175mr280985a12.4.1749676894398; Wed, 11 Jun 2025
 14:21:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <301015.1748434697@warthog.procyon.org.uk> <CAHC9VhRn=EGu4+0fYup1bGdgkzWvZYpMPXKoARJf2N+4sy9g2w@mail.gmail.com>
 <CAHk-=wjY7b0gDcXiecsimfmOgs0q+aUp_ZxPHvMfdmAG_Ex_1Q@mail.gmail.com>
 <382106.1749667515@warthog.procyon.org.uk> <CAHk-=wgBt2=pnDVvH9qnKjxBgm87Q_th4SLzkv9YkcRAp7Bj2A@mail.gmail.com>
 <20250611203834.GR299672@ZenIV>
In-Reply-To: <20250611203834.GR299672@ZenIV>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 11 Jun 2025 14:21:17 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgGMd31KshGecZJCupkGJQteupgk1SqswBsbHadMfpVhg@mail.gmail.com>
X-Gm-Features: AX0GCFtJBJ0_GDTJQXbaSb0DbKUaXWaGBcUByl4A2_DrwE75v36idPEAZwBhho8
Message-ID: <CAHk-=wgGMd31KshGecZJCupkGJQteupgk1SqswBsbHadMfpVhg@mail.gmail.com>
Subject: Re: [PATCH] KEYS: Invert FINAL_PUT bit
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: David Howells <dhowells@redhat.com>, Paul Moore <paul@paul-moore.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Jarkko Sakkinen <jarkko@kernel.org>, 
	keyrings@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-integrity@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Jun 2025 at 13:38, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> Speaking of the stuff fallen through the cracks - could you take another
> look at https://lore.kernel.org/all/20250602041118.GA2675383@ZenIV/?

Also done.

Well, the script part is, it's still doing the test-build and I'll
have to make a commit message etc.

              Linus
