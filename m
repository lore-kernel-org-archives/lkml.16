Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3797F12E7E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 04:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750997927; cv=none; b=CPKe8PY0tCWjnRHpUUniROFaMFajuAte9TGXDzk3ukpKmJUkBYv/APIk538vaJKlXsYegN3XAg/yMDl/vit5uedXxF14jsCSsEM7d05FtDnSkR4/TGMzuwWERwMsZXc7FusgCuUfctu9VaX4YgNFPVeq2zIdshwnNBPk1JlywNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750997927; c=relaxed/simple;
	bh=vnE1I4Mx74SeCFjMsbUt4Z8knhyyQuvPiC5Wko6L4nU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sf8jkHiGoV4qDlj6gC9afYRpDyfGUdaktC0rcJd40dA5r390kesKHVm2lnkvvOksEGWapySVZzQSCb5T55CoHqln4h0S9QG/H92M9brE60mGTiPFiNEkJPRQUepKUS3jk5MyVHdUBLDbNJd5z+nPlDR8Kw2OGA9CZdd5fqajjW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Op0uIzoB; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Op0uIzoB"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54b10594812so1880783e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 21:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750997924; x=1751602724; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8t82WOgljbjAJy235x2fO/KB2OhACeVta1dkXnb2jvc=;
        b=Op0uIzoBxkxJRSkHtSaHdvI7QOUeEvHBWAc7147SnjErc46Tcu/yS/obluaqtiEjbd
         n4DlOt09ahSCWJlosio8EK3dzIL8Y+4GXEyOW3WmuH0KsQjhCrcYDVCipn8q9QwJMzQ3
         qlfY0hsL/PjATHLmNPmGLe80+lHtRN4j76CW9Dh5LDBrLS1vMU/HK+69XlnI8M7mJJHj
         ENeo4DHAnKHmyjavWgjImOpSTgLYP+/a8M3Tjgh36AzZHrOGbzEvcsN61VUEjfnnOo38
         sucs+IlT+xVIVUqIe3gc3Hd/AuJjptQuEK7tlUWxinlEdYbbxumlSlyJS/YDoeyklNvm
         vnhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750997924; x=1751602724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8t82WOgljbjAJy235x2fO/KB2OhACeVta1dkXnb2jvc=;
        b=MJ2FfJ/+YJzwrjwjjzg7p/OSE2fqB06TDa0CWKp2rMvqcar7m50gf/FXUAqDeLojq4
         AI2wOzCCVT0eU9pSYW6VKjBiJNKr5GveOraGHQpVbZF7jUfiIG0x93pQ0hd1Wfj7Qy/1
         RY6/VNpjsfokEPX0N93OF/1pCrGZIgRiJGneBFC/dTmwmxbSq27hHPwaDPdlz3JBUiQ/
         4Ujn+XO5Bayz0rdiXWRlVac7aL9uSmTIgZkvab2v/jjKoSGsxcyhrWdgJo9s6O664yZc
         OkVuBl0i9ei1vLfngybmzVGXoT2/xjpooL2dF70khQuqQbl/Se71EDTAe0fenOfXmjUf
         t0aA==
X-Gm-Message-State: AOJu0YwS7dt27epa1HZTyaxB0uwZ4bZ3qyp89pDzTT5D4q+5nbuZTQbp
	dxFbzoIflx5eQQlExN5C+1FO4wA8jgJddTPvYF4zWRx2tJKIQ0Ebn2KCpjQKVtJiaV0NLyf0cyz
	gowntK6esrcoGL7u8DAdsKa3gINVl8nuzl2ZuQ8wSxqjdxDsBvQwA7iQ=
X-Gm-Gg: ASbGncvPHTv0oUYxwFwQJ29mm18g43V1IzHvTXqFCchMviXWd9oH4dP4ffVYzu3IHHC
	JXaKzBOubMRVH1NtWLaTrdvgVLM6snLjmhWuJiHejbFh7ygmorzJDEFO+ZhTdjNvgoQCdEOu5S2
	+WQ8sxAUkFkFnq+LZt1EHAdr4SzPoMyryGMYAiu3mwDdPNgRnKBWslkY9W2NiFJNn9cVis61wn
X-Google-Smtp-Source: AGHT+IEbVRw58ilxaIlZe1goTFVY66x9DDIQfysAIxkk3qNfcZyJs188QMsK2gKbw3I74XPTb1bizoehc0UgRlQwQk0=
X-Received: by 2002:a05:6512:6cd:b0:553:2cc1:2bb3 with SMTP id
 2adb3069b0e04-5550b9e5b30mr555590e87.36.1750997924074; Thu, 26 Jun 2025
 21:18:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625182951.587377878@linutronix.de> <20250625183757.868342628@linutronix.de>
In-Reply-To: <20250625183757.868342628@linutronix.de>
From: John Stultz <jstultz@google.com>
Date: Thu, 26 Jun 2025 21:18:32 -0700
X-Gm-Features: Ac12FXwpF-DZ90vOuLHW0-i4h3baVzthw0f4v39k-ywGAqmwVfr6zg0R2Fdv0cQ
Message-ID: <CANDhNCp+Kw3ZGC6Vuuhq=FXKS+AXba4k5==qP+JV4miiN1cXGw@mail.gmail.com>
Subject: Re: [patch V3 02/11] timekeeping: Provide time getters for auxiliary clocks
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, netdev@vger.kernel.org, 
	Richard Cochran <richardcochran@gmail.com>, Christopher Hall <christopher.s.hall@intel.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Miroslav Lichvar <mlichvar@redhat.com>, Werner Abt <werner.abt@meinberg-usa.com>, 
	David Woodhouse <dwmw2@infradead.org>, Stephen Boyd <sboyd@kernel.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Kurt Kanzenbach <kurt@linutronix.de>, Nam Cao <namcao@linutronix.de>, 
	Antoine Tenart <atenart@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 11:38=E2=80=AFAM Thomas Gleixner <tglx@linutronix.d=
e> wrote:
>
> Provide interfaces similar to the ktime_get*() family which provide acces=
s
> to the auxiliary clocks.
>
> These interfaces have a boolean return value, which indicates whether the
> accessed clock is valid or not.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
> V3: Remove misleading TAI comment and use aux_tkd* for clarity - John
> ---
>  include/linux/posix-timers.h |    5 +++
>  include/linux/timekeeping.h  |   11 +++++++
>  kernel/time/timekeeping.c    |   65 ++++++++++++++++++++++++++++++++++++=
+++++++
>  3 files changed, 81 insertions(+)
> ---

Acked-by: John Stultz <jstultz@google.com>
