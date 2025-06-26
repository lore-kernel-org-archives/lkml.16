Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E321943159
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 03:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750909711; cv=none; b=oytK22xEuakidffgAAyub61f+QJge2nc6xVwNQ3QHsmdHMcaGrk+nk00CC1mTbvs+QHrE5Q+HlHJhU229a4YFV+Qb52RFtu4Aowf4F6xCpxbJNeY/XSBo5UjfgzrSrI1Mv3FN1fE/KupN2iaB+k6sDi5gxZB0yL5RZSLRY5aSSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750909711; c=relaxed/simple;
	bh=71o+B4nSdgppuXSbz5WU3CUWUOm068rFrA+lQiTAOUo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vAFrS8u047r4NtjpTUYjcwn9MCE6j6yRUMBpzA9I0EO1AnGog8T6crvJCKDrFU3Zk5SHXV6A+I4w1kmOm+6PU1pxv4poVRdmoWz6l7ofEFeHJomY5Gc6wAJRgJuXQ+WvYC5D8AAAHIEROoe1UgvUGYrPrwS9yAnc2z9PLmJoB3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=XItnpuK8; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="XItnpuK8"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ae0c571f137so130109266b.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 20:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1750909707; x=1751514507; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w4XTaD2tNZVnetmUxeEcKN2FJhAWBnQgKVB9ItQiBPg=;
        b=XItnpuK8O26xMyC40tIb+OjQmsq0tsrF2pK5KeItvExRHHkqnYGnYTIN+gh8WrxWmO
         uxto4J5L7evOa/qonlbFk6nC/IQr9zvnBEaiUhNzYelBJbXUaMorcSuJWiOppt59vo3x
         7k2QsZ0U1i0JzHA3azYD0p5mFtV83BkmtavJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750909707; x=1751514507;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w4XTaD2tNZVnetmUxeEcKN2FJhAWBnQgKVB9ItQiBPg=;
        b=mclq5cBVoJvxEaf3/MTX/pYRg7dYWBL7FwLLyiuFfs/O3P1HRLOVX62Rr8dfWBYNx8
         gbr9JywRG8q+Gdm2yyxbYQC5LO75l5sy3omBVCnB//S0V1MZVTXv2hbUpcSRIQcB7aM7
         DHaOKxu8muQtaFZQoReOsi3Q1HUSDnw1O0cIMiCSDEvncBNKn/CgEVxP533zL3mCAcRC
         XNpzxy3GUOA0XaHn7bdpj4YAijn8WU0sd9A539D/rc755TqYPgKrd/zg7pR9zf2U5FMa
         iYByLFT923phfyYZxB7NzoqW5K6IPn4QjY2D3vbQB/O3a3E9qxs+35IeBeCwI4mT4gvg
         LGnA==
X-Forwarded-Encrypted: i=1; AJvYcCWYLrqeFs2THkbcRZ3uI3sF8COXN5IVVoQNUrau/bymC2A/VhoK6jUkCkRAIYnAQJ59rQ4C8UbhpCt3RK8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXSmZ0crE0rdppeq/I/bDNezevHOln23yeAhxqHmUB8jZV9HCg
	ZlY4AMbbK1syXGkqpdOMFgseCo+xYvbjk4wguhpszSOPr7XFboxn2oI0KzBPuqq07Wn7TQW7GQW
	iPjKjfDQ=
X-Gm-Gg: ASbGncvgPb6z4iO7YxD53JzCrTW1C8RpThqPity8ljoPvXOyRMjHLiDuIPQxfBdWBul
	+hD1NLOoLkuFbNI0LIw5twFolVNk5CDtNOY1Ms0Len5+A+MU2HUEtPjizhTeYJgXKRpT+I1aesE
	a8SwMDpRQFmheqiDxOCyHGwptugfP0X016LSGqGTp+418Sbd8kDanO5j6+r+bSaA11tXv5tRSus
	QJODfLU96fSPWH8iFdW0K/s7YD1n/QMyXlS2wZ6ZEGEplzBvSmAgocurVPeTwijJZHCCBnlqLIo
	q4X69ku078Kx9+lmSCh/P6MZKA99Soic4K+WhMvTm2Klfw6XVjIWVvZt4gseJWIoz8KV5wJaKaP
	ZvoRQAz2zs3wN2qfu/8WkMG8t4o+8QAIEfXmS
X-Google-Smtp-Source: AGHT+IF2SIt9F9sM5iD/1PEpiq7s1lgyS3r67jeoO25W1bJNvuYGtXr1ce3dD26l4H916/f6PSXTCA==
X-Received: by 2002:a17:906:9f91:b0:ae0:cf28:6ec2 with SMTP id a640c23a62f3a-ae0d0dc0b7emr218121066b.61.1750909706929;
        Wed, 25 Jun 2025 20:48:26 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0d7ea4478sm45234066b.7.2025.06.25.20.48.25
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 20:48:25 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6088d856c6eso1012489a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 20:48:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWlKHqEk62634gg1LJDxvaJzWlYzi1HNhD3NM/sEimxknYF7liGzEK7PUTaZBCJbi3RlYqqNJ4TZnHJui0=@vger.kernel.org
X-Received: by 2002:a05:6402:27cb:b0:60c:461e:7199 with SMTP id
 4fb4d7f45d1cf-60c66149e7amr1836785a12.9.1750909705477; Wed, 25 Jun 2025
 20:48:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625121529.42911-3-johannes@sipsolutions.net>
 <CAHk-=wjTCAzaw4AXXpxcYc7v7ZjAeyaOOJw7FWXO+gV7v7Cp0g@mail.gmail.com> <0d630dec-41fe-4968-8d6a-7faae8a554a1@antgroup.com>
In-Reply-To: <0d630dec-41fe-4968-8d6a-7faae8a554a1@antgroup.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 25 Jun 2025 20:48:08 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh=_ZmpYtCx11wqsGGdrZRHsPorTzpzh2-QccT8PGKW1w@mail.gmail.com>
X-Gm-Features: Ac12FXycbCEItBxGZBZHR-kJgJKAj9PUK2Osl5wq-e9vxN7XlQjqQ2Ty7F-dNLs
Message-ID: <CAHk-=wh=_ZmpYtCx11wqsGGdrZRHsPorTzpzh2-QccT8PGKW1w@mail.gmail.com>
Subject: Re: [GIT PULL] uml-for-6.16-rc4
To: Tiwei Bie <tiwei.btw@antgroup.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, linux-kernel@vger.kernel.org, 
	linux-um@lists.infradead.org, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Jun 2025 at 19:44, Tiwei Bie <tiwei.btw@antgroup.com> wrote:
>
> The behavior of gcc and clang differs. Clang's behavior appears to be
> related to the volatile qualifier in arch_spinlock_t:

Ahh. That kind of makes sense.

At the same time, I think clang is being stupid here. Yes, it makes
sense to treat volatile specially in this way - just not for an
initializer.

I realize that initializers can be made to be their own data
structures in modern C (ie taking the address of an initializer and
using the initializer itself as an argument to a function call, for
example), but when an initializer is used to set the value of a
variable, the only real thing there is that variable.

Oh well. The patch certainly looks fine and I obviously already merged
the pull request. It does make me go "I wonder how many other places
clang just generates stupid code due to this".

            Linus
