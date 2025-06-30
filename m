Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E35C9478;
	Mon, 30 Jun 2025 23:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751326946; cv=none; b=G+K/oiTf3pcpNlxBj7TYKPG3Dn9V0wdmg5IoFne2XJznpS8WLw10teVj6nHecWKEwFvyQ5erkLqud9SnpEAZ9qcpI4upNzwppVTgfji+VNP3uBNHMYDfak9tL0/6TdrSbMfjuIk9dRJa8EimpXfY/ogtVdpmRxoHR5tVQxZf+90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751326946; c=relaxed/simple;
	bh=rh3nlERas9TapPRz3K7+kNhZCoAnY4Uej3U2bGe2vWc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IBZwYud5ZuJKH/AN0cSp+CuCacEAb1He1M1nqUrrHmfsiIfYjcnyqOA8tAiNO/v0xqb0/cd5bsB/O8EZ/R33JNPfbhUIXJO/ZNe7yzqsbDFocTzlAN3bi1naqKK153B8hw7j4odgzSa12uRJ4BV6hOmxaAKkQ04gaBo6jvBiq94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LqPLfz4S; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LqPLfz4S"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-32ca160b4bcso50464941fa.3;
        Mon, 30 Jun 2025 16:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751326942; x=1751931742; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rh3nlERas9TapPRz3K7+kNhZCoAnY4Uej3U2bGe2vWc=;
        b=LqPLfz4SlZ5WNu/iiMD18iwe3FvMXxA8wmyCxyPqxmXIJFNSjPVcgXUN7SkVbTwOBP
         XZg0OvcX/W+7FzV67p8YFxHpd7ExjapCbOFNXe1FJ6dx8XLmPKfbpdK57iQ/Wpa6Lztx
         SP6FjJnJAaK5hETo67SHXhWdG32MeYVOH/xM8n0Q69R/opq6mOjLK/iTX5b0gxjRyXGT
         IdvmH5kw3SWcQKoE7u2MaV++Lwz4CDBwH1K4ePrmTnyfZlOk80ljfeH80CBthabZcrlC
         yXAs1XKKaFme9J653VDS0BdliQlgMFCigp9QxG3vA3KrbuWZAO/A1AU+wLaGZapf62aF
         ZzBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751326942; x=1751931742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rh3nlERas9TapPRz3K7+kNhZCoAnY4Uej3U2bGe2vWc=;
        b=knHwNrENtBRlYSF5ZcGCOzcZT5yMkEcoeE5x1EEMLIKeM51gbDB3fNDaAFyN69jUGD
         femjqcE54ms5EgDzpVSeXp52mtTRp4ZIYZT5MFnQli+jqY/2Zu75ck+jsbY+5wEVj2g7
         C+3QlHH54Kqcx1+Y15EOCYhfw8DjZo1c2JgFJTOqzFxDVTtRHDlQl/X3mDbWdtUqT3U6
         /XRmvNcMOEqXmszYJU238rYIel/JcxOd5S3Al/9jfyiqJZ07ZleJWh3J6ffQ2dAHeff1
         kamoukeUOSFbyJbsq3A5ggZMcdxGCTpetfSMthX1Mq0b/+gYKzZ/qJjoFmvz8UU8Qs3b
         hZJg==
X-Forwarded-Encrypted: i=1; AJvYcCUEVfrXX/Fi38MGh6vfI65Jc7W9wayD5lGEM4U0dHGcxDQPICabM753ptKYjqiL0OlDCEaTcAlzDHlg2ro=@vger.kernel.org, AJvYcCXINA0mFQFujSzqHYkj+V6oftRB6GzvF7Hz4Sk1rC9o2iVrGXlWJ1WOKuNIHa1lU65BmQxHeANP87KbrmJVOQQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwESOoAt9g4/YCtnac4XJnP6xJ+4pj/MhJPi44BDFrxwfyeWGSR
	/DpmU3+7E/qvLC0+SLgt7x7DQZhRDQjv/oWnsWOzbT5cR2jXl4mBJNWw+AoNZgk/90AV/7Nae1J
	K9RluSqduFWDgJlIQoFQxEI6wnb4YD3E=
X-Gm-Gg: ASbGncvMTLQ1MRs/0pfoDuzAmzgB2+nSw54Bqwe6DSQbodz/e64YLSiMDZ7+ply23uc
	0syTh4YNypzn2r7WXoawjrhotS1e9jqE2xLDtSWeiRn9TAbh7BEFtMOlDrGl37n1BObsrWDOwmq
	wnuBw9pVtNR2aCiB9oY38SpOWyckaFWC638FG3Kg2/f3qIlbtKlPkOuVnDrcusUfNmtuCHmL0+L
	DAbbmSpcUNvk2g=
X-Google-Smtp-Source: AGHT+IHKzwFuoYiGs6BLNRBsw8vLVl3ZXjxhP1rnGprP3AKMDdferKDe9NwQpCgMCX61IGef+wM83Dp+Ied0IFzrm6M=
X-Received: by 2002:a05:651c:204e:b0:32b:78ce:be8e with SMTP id
 38308e7fff4ca-32cdc50d4a5mr46014941fa.32.1751326942269; Mon, 30 Jun 2025
 16:42:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630221511.3325123-1-vitaly.wool@konsulko.se> <20250630221628.3325244-1-vitaly.wool@konsulko.se>
In-Reply-To: <20250630221628.3325244-1-vitaly.wool@konsulko.se>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 30 Jun 2025 19:41:46 -0400
X-Gm-Features: Ac12FXy9kUEqIQu19neiqOoDWD6nkOAKmaRhgRzttoGkJWGOKVJd6rL73W37dDU
Message-ID: <CAJ-ks9me9i-zkJcZerixEcyxQK764ubL9KQ22kM6B48du_fBig@mail.gmail.com>
Subject: Re: [PATCH v9 2/4] mm/slub: allow to set node and align in k[v]realloc
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, 
	linux-kernel@vger.kernel.org, Uladzislau Rezki <urezki@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 6:16=E2=80=AFPM Vitaly Wool <vitaly.wool@konsulko.s=
e> wrote:
>
> Reimplement k[v]realloc_node() to be able to set node and
> alignment should a user need to do so. In order to do that while
> retaining the maximal backward compatibility, add
> k[v]realloc_node_align() functions and redefine the rest of API
> using these new ones.
>
> With that change we also provide the ability for the Rust part of
> the kernel to set node and aligmnent in its K[v]xxx
> [re]allocations.
>
> Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>

The typo (slub) snuck back in.
