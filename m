Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2DE182
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 12:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746189663; cv=none; b=LJnC8nM+LXhhG+zWuzgxQkjwANxK8pKcQz+/0NDCAgINsvV3vuZghSZoJzsZswRkq6rCTQurZLfG8IW6VltbaMWlGRORNaTEJtKtLLx+Q/PZZUSaQ2qLiuiMlWRu9l/XIYuP3RolgG345JbHf+WC7V/mneYfZHud4TW4wAOGayk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746189663; c=relaxed/simple;
	bh=bOtEEUIycvqFLsUnTyz0wpMwb0dEP7OWf7Vi7q9yA9s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i0vJTkBKDM7ySOcar1yO6TN9d32uXO6aqLrVS+bwoHEMc5bvuiiJ21mEYAlwsTYvPiSF4Pkq2g4RhwwG9OkkZl8C4oIWAhd62cMwPrWqWStwY7KbHpWw8yRM83IbkiXJOdzDwbZ4iKis6uNxRFuGdKLMmngc86wTdyS+Z82fJq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bkjYpYgb; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bkjYpYgb"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cf257158fso9930155e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 05:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746189660; x=1746794460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uhSvZOHMolBMmIWPYijq03mTie9jF27E0MW6W/YhSE4=;
        b=bkjYpYgbN+7LPJhP5dLqYQ/7AW8gaeGQx7H8f0S/szmG7FI7o42/L/JVB17+32qxfI
         0P+SfjDe22ZGtcaByEO/zCnnD7gU2JpqBJy4fr88R+zf13BRhGvAayfrGdGtYDE3r7Rk
         Ys+c02Q44E2FG98+DJSI+eX3S+QFtYxiWkcbRpza7Q2XuUvguCyDZIobf7Z8iCBY6RUR
         BCkZKZgKD71cCk5C1Xu9YWAK93A2sHlhTNnmK3XacusbXpYkAjzhMg3jvW4ZCqNSz6rn
         Cj16FBEadr3m1bg8qSB7ZNK/wYFhDpF5eqokKTzOAKPy/PJe9mboRTAEjn8hfjuVvTi8
         s19Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746189660; x=1746794460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uhSvZOHMolBMmIWPYijq03mTie9jF27E0MW6W/YhSE4=;
        b=q0E43yBrLo7wT9Pf/QOTPs3oj8QHaExYNiWL0zqnfyCxnEKkib/otJjaeWAzwO3CA3
         SPaOGY+mP6+2YVcJTfxVYbVMR2yi4OUMFMqXFZh9F09xBR+dns3fMMT16WTlUfUJuSiC
         NQXlH568uHolklzYN16nmj+GDMupx5J+GqH+pu3q9KVuXdsithrdTTIMhvRA8dCNkXJF
         YEWMOkhV57SlbPI1TPJJBj2sYmJDITG8J320pdOShcZikTG7pT4sSb7rPYTyVgGeznya
         P05adit44BiDJjXxq36r/2Eh7Xy6NPsHiAXAUisfwtAejYdaVwLOiZs7uBNUJdzGU3pd
         WOzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCAerIeLIir4n80gaj1boLfR+iU0WFylElpNAAUi9goot90KeC76YY+vnjPB0qJvDS4snBjbFcMcx/P+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx66YtrncrgqpPG20IjnEtEwyNIp/GubmRLw49pMTl4b48kdmyk
	540694DIR4ckvGCf8HqapnvPcJ7pVV6kYB/YQ5AJALhziQ14aq8s
X-Gm-Gg: ASbGncuunoBKDwBYfddCnhzG6imyKulKumXn+wLjj0JnsYzyT5/OzappuRLo2/QaDQW
	aP5cLXkJG2yZ3YbIyAbQJX/O6xUlXl+8h6wj5IuOeF46wbpF1m8Ir746eAIAduOsb3FzSRmM/2X
	oGVrFosF4nhrpYpYjztSkK+EIcTDAZG6HYsFeA+LWlO4In46QW8+cAb4LjmaUrQXWcTuuG0cEHb
	yuIQOqh4W65MwqNb3J+Rhg6uH3pjoMUenTSQ1ap1/YF+mY8WTn6qo3CNSYqT6Lf/GL79UTQT2jl
	XwQXCDPKE2cuN4aqF1cdZjFjaCPzxL+IMpduweuU4yb6Eq+qANAfgxLnz6/12IV0TGgN4I6R7l3
	dZ9s=
X-Google-Smtp-Source: AGHT+IGGYxaw8nK4qXECDxluMP7I2iSvnNd1gVRmn5h/xCw9H7UnNkUZCF1GS4idB1M2dYqRS8IPMg==
X-Received: by 2002:a05:600c:3c8b:b0:43d:7588:667b with SMTP id 5b1f17b1804b1-441bbeb3883mr25586205e9.10.1746189659730;
        Fri, 02 May 2025 05:40:59 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b276052bsm89626645e9.0.2025.05.02.05.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 05:40:59 -0700 (PDT)
Date: Fri, 2 May 2025 13:40:58 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Jann Horn <jannh@google.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>, Sumit Garg
 <sumit.garg@kernel.org>, op-tee@lists.trustedfirmware.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tee: Prevent size calculation wraparound on 32-bit
 kernels
Message-ID: <20250502134058.0f3e79cc@pumpkin>
In-Reply-To: <CAG48ez1DPWhT2dhd1iptFawWjteh_=pZ4M6Yq5KKCq2DTArnqw@mail.gmail.com>
References: <20250428-tee-sizecheck-v1-1-5c3c25a2fa79@google.com>
	<20250501210158.5b2c86a7@pumpkin>
	<CAG48ez1DPWhT2dhd1iptFawWjteh_=pZ4M6Yq5KKCq2DTArnqw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 2 May 2025 14:28:21 +0200
Jann Horn <jannh@google.com> wrote:

> On Thu, May 1, 2025 at 10:02=E2=80=AFPM David Laight
> <david.laight.linux@gmail.com> wrote:
> >
> > On Mon, 28 Apr 2025 15:06:43 +0200
> > Jann Horn <jannh@google.com> wrote:
> > =20
> > > The current code around TEE_IOCTL_PARAM_SIZE() is a bit wrong on
> > > 32-bit kernels: Multiplying a user-provided 32-bit value with the
> > > size of a structure can wrap around on such platforms.
> > >
> > > Fix it by using saturating arithmetic for the size calculation. =20
> >
> > Why not just add a sanity check on 'num_params' after it is read.
> > Max is 31 (1024-32)/32), but any sane limit will do because of
> > the buf.buf_len test. =20
>=20
> That would work, too. I don't know which way looks nicer.

The saturating arithmetic functions are non-obvious and non-trivial.
I looked at the code to check where buf.buf_len came from,
without its sanity check the user could craft a request where it
matched the saturated size.

I think I'd sanity check the number of items and then check that that
buffer length is right for the number of items.

	David
