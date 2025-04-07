Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9650207E0C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 16:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744042640; cv=none; b=kCpoxqHcPpFKDTRFLnE1awivWrfJIs099QlqoarEAheKrZGoBonRRPg0lEMNwqY1vYYpu8qUUN0W0r5CXBXvHrAGhd7E14pjnlecGxhHKDW06LxBZ7cnUvKW2cZqBd1Y/VfvrWhWcyQPMhE7DfVilUQsLlxvZNZKK2FxRCRO6qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744042640; c=relaxed/simple;
	bh=M1Ww5unhqTe1EyqMmMPiP4uQRre5NADcj59S0PG9HlY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QBtlCE/wZpXsIGowTQuyIjMSxgd/53rJQRyUXUJ6Cp4YYBvIMOETLOXi/tSYnpGqDW8ggeQB/IZnEvZwT1eXuFj1/Q0U8+FOJTNyUJjO6db34t2L8bqy7BXM/zLOKZZ8WoUDg24gJozZ2WyINiFgdL6QJxqXBk9D0ybUk6v0368=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eXsnlvd3; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eXsnlvd3"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ab78e6edb99so661167766b.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 09:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744042637; x=1744647437; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z5dWdjDoB7tV16wie4HuXtECtARsTapeiDBOI2mjVMA=;
        b=eXsnlvd3mfYxlbNO1hxRb69ozi2A16+c40wDohrkzF38XoXYBowrNSFMbuGALSnMpb
         EIUyFoSIORgzu9JT2qk2saEboSJYZrqdyKrMh4OjJUrvQYkYHlw9sCG1f0fZhah2L1HK
         Frs8nRVfRZUG1EYNle0XRXP3REUzshsytvYsP4UGfBh236VCUlfe/UBLxr73FIXWSDbR
         0fkI3PxggFOSJn8Yd+I1foe4PSEMjVSnAJ4SvbnHuQXc7CHwhVSZrajRZx7K877k5As0
         Wb5EFU+0XsGqQCmDKUACZb4lswhiZMzE6Vx5+BZWbtbETR6gJ5vDlvcV3drqByAjJ5oV
         RZgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744042637; x=1744647437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z5dWdjDoB7tV16wie4HuXtECtARsTapeiDBOI2mjVMA=;
        b=CwxcehSXkCUQBijQim5p/oQsPcP7+7jISGA7ppRX1h9XlQzKCVm98NzEdnyN+Xw1Jd
         LrvCvmGjiehtkq+b3idU4138gh2PU8ZmenI4WWvB8+eX1lP6QG8Ztw4pGjOTYuTOSCTw
         7QFoWweNv3TRH7rnP9pYye5DY1PD91LGwOJa/1dFmqWjW5cAnDUPutvu+ysoB6agYsgh
         Mo/g14LrOdGRLalMx5e19g4mmbzEZLHA5AdpsRjViIie8OL7wP+L70BDXxE+cG+YVF58
         UOYmOdmr9wb+KwW6j75PxQBaPklBQwhSI99Qey8eKSKtfgOvoF8Ye5sJs4qxu2r8KdT2
         W+Ig==
X-Forwarded-Encrypted: i=1; AJvYcCW04MVPshKs7KQy4N/Z2q0+Cy4Dom06d+TwsripEHnXTnySNzAwDFuqIdpBcDhiwhwS5iUUOdGeV+7ViFg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzPCYZZzHfF7CUk9pXzUA7zYfsu8YOeE9zVqCdOU/Kb5Qrzjsj
	C3HlXR16vSJnQuv7OqIGsk7ZpuPTmt4BIFk63fX7UfFAHqNOFxwi7VkpCcuawBRGkgdtgXoVqCO
	1hJEB6asL4Ry1NeinM0aqe321RDc=
X-Gm-Gg: ASbGncusdC+YUVFL8XpF+91iNyMxJb7u74rCEAPehCtdjd2NimyT1fZeoRDj9Jha11L
	MlMa5ts9K6yg1DXOoXVXuI1MXU1crGz68MRXPAQTL0Ait+wID1af0dZCKcQAvjBgtqSPaQlLLJ8
	YCacpij9XEBp8Y7kFLN4vtA6fztIjC
X-Google-Smtp-Source: AGHT+IGNu05igSzsB9qr+safVkgEWAEilmeq1LaVE8+q905EG7rWD56u1oRjMkrKzXWg1zJRa313vmHYEdMtarh8ilM=
X-Received: by 2002:a17:907:72c3:b0:ac7:9acf:4ef with SMTP id
 a640c23a62f3a-ac7d6e9fe06mr1100759766b.56.1744042636891; Mon, 07 Apr 2025
 09:17:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z/PyMXTjCHduOhKX@HP-650>
In-Reply-To: <Z/PyMXTjCHduOhKX@HP-650>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 7 Apr 2025 19:16:39 +0300
X-Gm-Features: ATxdqUGyZhHukxzKPlEcZ8ruaP7I5jVWDX33j5hs0O4jvIHR1fBTUQZaL_QgaYs
Message-ID: <CAHp75VdtUhUBL5d103RunY5EvgmTQVH48S21N1-1KmDM0q44Aw@mail.gmail.com>
Subject: Re: [PATCH v5] staging: rtl8723bs: Use % 4096u instead of & 0xfff
To: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Cc: gregkh@linuxfoundation.org, julia.lawall@inria.fr, 
	outreachy@lists.linux.dev, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, david.laight.linux@gmail.com, andy@kernel.org, 
	dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 6:54=E2=80=AFPM Abraham Samuel Adekunle
<abrahamadekunle50@gmail.com> wrote:
>
> The sequence number is constrained to a range of [0, 4095], which
> is a total of 4096 values. The bitmask operation using `& 0xfff` is
> used to perform this wrap-around. While this is functionally correct,
> it obscures the intended semantic of a 4096-based wrap.
>
> Using a modulo operation `% 4096u` makes the wrap-around logic
> explicit and easier to understand. It clearly signals that the
> sequence number cycles through a range of 4096 values.
> It also makes the code robust against potential changes of the 4096
> upper limit, especially when it becomes a non power of 2 value while
> the AND(&) works solely for power of 2 values.
>
> The use of `% 4096u` also guarantees that the modulo operation is
> performed with unsigned arithmetic, preventing potential issues with
> the signed types.

...

> -                                               psta->BA_starting_seqctrl=
[pattrib->priority & 0x0f] =3D (tx_seq+1)&0xfff;
> +                                               psta->BA_starting_seqctrl=
[pattrib->priority & 0x0f] =3D (tx_seq+1)%4096u;

> -                                               psta->BA_starting_seqctrl=
[pattrib->priority & 0x0f] =3D (pattrib->seqnum+1)&0xfff;
> +                                               psta->BA_starting_seqctrl=
[pattrib->priority & 0x0f] =3D (pattrib->seqnum+1)%4096u;

To reduce churn, it would be nice to have another patch _before_ this
one that makes above clearer (by adding spaces) as we already new in
practice that it's hard to read:
So, this will become two lines in each of the cases, and in this patch
only one of those line will be touched.

...

Besides that I haven't found in the changelog if you have looked at
the entire driver code and checked that all usages of this field is
done in the same / similar way and no need to convert anything more
that these.

--=20
With Best Regards,
Andy Shevchenko
