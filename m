Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A3D1C6FF0
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 10:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743764135; cv=none; b=uhYOYaRoKo1qzTjkFUK6JcgV5Qhq2vGjmNe8+NzxljmFaIqKQNvIv7Yn+Im1/KW46iHgQj+epV4guvScKeUSfutFC8CKCfXnv28xXXXohpp4/duCTbvjySXXyei4OHW5vw7MErSNqj6xx1oAfgd4uQqmVlZup6eZ0OZLrKyWd8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743764135; c=relaxed/simple;
	bh=xqpAS31ZBEZf1xiiFrun1Td08VTphpaBJc/wf+7M9LU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cVuUZ+pd/CxCBQodCDE2HkaEj9+RRZep9nlnj5XwbniG5V1BBEgp6WjjQLcd651gTgsRc7k1aS98rwnkozcGSWpwvU3D0xEiVcsLZ5NbASAUI3nKAPunly+i7RY1eWLJebGlyiVNcbjBk0AysZamliEzMKBH+LA4Xq7Q3+cq2l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C39i1eQU; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C39i1eQU"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac2a9a74d9cso340255566b.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 03:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743764132; x=1744368932; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zqE+w6GsaVP58HzUCQPmIwumDxQp6utIDBfgrrVwKrQ=;
        b=C39i1eQUIeLdroKLct7EHkgJ2KeIdMMXIbdCGiJWbI6l3l9wURoRSVzPUrDBhAdVTI
         XqoCmXAkeaOCsZPQ1hih56R/XSaUeMqn+Yum0FsDUYo0Pc/coIhXphD2tGsVoqhS5Tzy
         frATG6RDZ5CDxA501B7lZvwRLe0m7DBD8oRVtvm78O2MSD8AdYRVxvYc/PIdQlVgavmr
         elQQ0yQfk+iAGVSJZ/EYHvLDxhR4rIYoCEgJRYuMIdFbHloomwmIwR2cFWctN7N02sub
         axKKR3TEvu+a2VXjIZj5gZ2KBUnYAUxDJU2quub8JJ7xTOi1VD/uwvgBZmYFWZwnvz61
         nH/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743764132; x=1744368932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zqE+w6GsaVP58HzUCQPmIwumDxQp6utIDBfgrrVwKrQ=;
        b=DYZx4D3vKWIHwji1z67PthS2zwqzhftFVMKmZUUBoor9/DiRBcVHhOyvfzNbM3V875
         MblWWzUbUl01r+0NZxmbJSpNKTCSvgBsnwbT3zRyKldaPPAtSv2yqeWtVo//7KYHWtSD
         qlTVFxOGdqbOI8ZBQTTVZkeVBxX2O5xFWnJrXp9b5tkVJ1VoNRtmV3Av5OwvChhkOUMu
         R+9BGmId9AnsK9JuVNmNo1B9OfdcaSCVV18ujMPRXBLjvc4z72JC3r+ZXAOf4tgZT2Wz
         4aCHW7+2y7VsOwakS1RinFPxr9pTj7iNUVjDM8Gt6VvseARUK/YhpWai8yGjcrIbXZ8B
         /ajQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAtBg4maxN7RgYYRceBXRXeSkdfb4dsw8ILeh+tnAjEoD9e7/M0i7WxR2H4PrRQBxnXMcbu8id12RM9QM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzceR3AS/sLANygwDtAGa6Jkb35pvCsDBzpO1dqhw0YJnGoLqkS
	xrAnB0AgyS9B4Zrr29VICQ2KsH4V9vacKIuNxxASKw1InD9mQ1+tAlR2VxcQcrb8gIaiNqSsi0+
	QIdmBkaqFMPDyaDb37VGCug/ZC8TMgUVVQ6w=
X-Gm-Gg: ASbGncsOcdaN9PpoTEuvWO591OzA0BDD7V5A9j2KxgU/yUfkawTr6+1z8IMy/BPRDzS
	SX1cyAEbluceyFzn0fURtA7NYem1m8J17J51Mh6hwbH7P0oA48dryfWxI/xp9/evlazbPGdFVmT
	zRLP7nw5jEVTPGckAwL5/6X1KlwCNO
X-Google-Smtp-Source: AGHT+IGNinU4zi/m+31hZicDCxBzNvfcIDFQS56Y1d4Nr7DOmJNAN9EwAxywt5r/kNUc3HaR+BFRb6Jc5r9alOYlVhU=
X-Received: by 2002:a17:906:7955:b0:ac7:9835:995 with SMTP id
 a640c23a62f3a-ac7d181d57cmr304131366b.5.1743764132001; Fri, 04 Apr 2025
 03:55:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1743755621.git.abrahamadekunle50@gmail.com> <6852a0c603010345d646a9d1bba06631ee5c5cbd.1743755621.git.abrahamadekunle50@gmail.com>
In-Reply-To: <6852a0c603010345d646a9d1bba06631ee5c5cbd.1743755621.git.abrahamadekunle50@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 4 Apr 2025 13:54:55 +0300
X-Gm-Features: AQ5f1JqUozPnFgJdIT4pOelHcSqCJ5l6BNg2OqqLHneV3VukMeWc8lpWOwr7854
Message-ID: <CAHp75VfqbO43KgMOuvuF4oGVp9m6UqbYJOtxTZoiiHwnXd13-g@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] staging: rtl8723bs: Prevent duplicate NULL tests
 on a value
To: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Cc: outreachy@lists.linux.dev, julia.lawall@inria.fr, 
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, andy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 11:51=E2=80=AFAM Abraham Samuel Adekunle
<abrahamadekunle50@gmail.com> wrote:

...

> While at it, convert '& 0xfff' cases to use modulo operator and
> decimal number to make the upper limit visible and clear what the
> semantic of it is.

I think there is a consensus now that this should be a separate followup ch=
ange.

...

> +                       psta->sta_xmitpriv.txseq_tid[pattrib->priority] &=
=3D 0xFFF;

This also has the same semantic and may be changed in that patch.

--=20
With Best Regards,
Andy Shevchenko
