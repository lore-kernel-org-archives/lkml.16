Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DE3261565
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 07:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744096895; cv=none; b=IYelxIVWh5k+MpOdCDcW85qTxVTDBNm5OziC1QT2SG5YvaALJExvpqn0yQTJgdEmi1qCM6Q3Z06X9l8tfoHJiXnnwW/rMGNEq9mist38SHNQNssbG5G/MFcwwsgeg4uvU2L639WIlO/4P4w67NPg3FLyHRmt1Ik12BbQwuB6/j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744096895; c=relaxed/simple;
	bh=GAYhAibCXnT2iIMaWhc53SkhgEeh2oob6G0EF+LtTIk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X0CZIZj4aIJ03zI2En+NHf8QJWQiNWGcKa7xTTLjvF84X8Fehg9XBTBh/50NS0yBDvrBAmMpbRfC+4GlWEG3US/jM6sb95y7T+jziuTi3SYT7m70g4LUFhfBEOtgR2B4ZF4bDw86yPDQyNJV842+YVMvI1F2eUayT5zXLrCUUq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TiBYXLdh; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TiBYXLdh"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aaecf50578eso834322766b.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 00:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744096892; x=1744701692; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/9wBcdi+1ChLSfZxD60WKrjeGjQc/e4DMdb0/Izcq8=;
        b=TiBYXLdhAgyDFl/RD0gNuICoCGUXyq3XBR41KbGrp7+Rnsufgdxi4uzTZQB+KnIBXg
         mpA+aVj79TI6J4lL0+obRqCBsvh7+wJgEEojfNo4u1qFt5kpg9gKO3NU4dd8qx01kTOD
         VUfnYt1S/6eNdjwKV61vCY6GydgWJjlbTfekLOTz174LP6V4aKPBzOKu5CcsTqYNS+NC
         DdV/A4t8VjqaCaJLazyFt0VgsyY2sFN11bH5VB1q+jQVugJhlybVq3L+LOyyGPVMl9zg
         4rFIWghCWLnJsTkX9BcRW9K4kJhO2SKX+dgvIaIlTY5ZVu+juS84l3yaro9izR/8w59i
         4u2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744096892; x=1744701692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9/9wBcdi+1ChLSfZxD60WKrjeGjQc/e4DMdb0/Izcq8=;
        b=bjlIZJiNt1B0Q9jo0cdSN6APhsW3k2Seos820/6aTzWev1SYa0cm+17r2vlqRjvMHZ
         Yg1+7OMOorbK0uevExWYEuTVn9X8IlW0txOX5XNtU0Yu7wm4i/aK9GPFUkyUA+TrQ8MW
         B1uLmWAU7zNFjKUwNSMFCQzNZuHz50SBZNdyN+Nceefo0Whg6Lf0srB9O1cj6nJyNd5b
         /xmLCs0UaL4Oc1H3rTpWBPLzV5gmBrNCh5oauumDcI/Z06eMsNRbjuKp5gd9hnOm0W52
         58xQ7bq14l48rMpreXG34D4uZuPSgIJfzuKKxAeQklV7SOq+33OaAc4NnBUjDvj2EXwD
         VLdw==
X-Forwarded-Encrypted: i=1; AJvYcCVIly7SGOZY1Cy+Ofxqp07S0DoM6CIZdbxHQ0AqFMxG+Sek4V6wp4FygelI8NJZtRMma/mG8pqVwMGuwhc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRRAWZ7MnYtHfB52D3xAAXDJaIOWfh7V36HRNIf9Lef0aDVdyW
	4AshNJxOakOW8Ck0YXJf7e+jve+XtLEtlZNblJ4itu0VaFGszyHCV/xskA+F57JbMRKQixdGwpE
	WdA4KAFfgVLlmVsQH3K/pQ3n82is=
X-Gm-Gg: ASbGncvs0MsCe1ni5TBy+TNHxKkNmNB0oSmPA9EoPptH9p/vbcBED4Uz721jvVRUHB6
	OHfw8764vixmVxr51uZKOuY6AtenIgPF8pKUCm0HbVMSHjHKZmvqdqdy6hQ9GyjNlzvgJDaaOqs
	SO1QvFTYf8ntOxCm2nh4cYdNTFtg==
X-Google-Smtp-Source: AGHT+IGSP+aFSQIOdfdECZNfP2qZ3tPc3LXJOlFI/NIKtemYfrFu6w7o4mQVVgOhgKfBQfD7PKtLQjGVQAodmYu7FlM=
X-Received: by 2002:a17:907:2d11:b0:ac3:413b:69c7 with SMTP id
 a640c23a62f3a-ac7e76232e7mr757236566b.39.1744096892130; Tue, 08 Apr 2025
 00:21:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1744061673.git.abrahamadekunle50@gmail.com>
In-Reply-To: <cover.1744061673.git.abrahamadekunle50@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 8 Apr 2025 10:20:55 +0300
X-Gm-Features: ATxdqUHFeb-mGDJkzsYgq3knAo3STMDoWq9TflHo97hzR-vPrqFymzz6p1lSzGA
Message-ID: <CAHp75VcCdS30LHPMwk3HO1o6db_0p+LDQoASx-7oCVw__MpMdw@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] staging: rtl8723bs: Improve readability and
 clarity of sequence number wrapping
To: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Cc: outreachy@lists.linux.dev, gregkh@linuxfoundation.org, 
	julia.lawall@inria.fr, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, david.laight.linux@gmail.com, andy@kernel.org, 
	dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 12:54=E2=80=AFAM Abraham Samuel Adekunle
<abrahamadekunle50@gmail.com> wrote:
>
> Tha patchset adds spaces around binary operators and also
> provides clarity on sequence number wrapping by using a modulo operation
> % 4096u, in place of the bitwise AND(&) operation & 0xfff.
> The patches are required to be applied in sequence.

...

> Changes in v5:

This is v6. Are there any changes in comparison to v5?

>         - Converted the patch with the subject "Use % 4096 instead of & 0=
xfff"
>           patch to a patchset.
>         - Added a patch to add spaces around binary operator.

--=20
With Best Regards,
Andy Shevchenko
