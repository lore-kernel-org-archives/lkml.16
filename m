Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B3D25A65C
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 17:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738605356; cv=none; b=bKYvHTXTQsDuQ2Im7iNiRYilWERlbDPdOI49Vs1qyEhCZg8h1nlKRAC+n7WtcLFB83Ldi8+CHQFw4ZvVtjQZfUSIoswS3hzZqhfcp7fG7Py/6JplRRo4leTQ9sRTrL8ETAXu0V1XUeLe2GLOwgoF4Tu9vOs8ZOKTsw4xiv+ElxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738605356; c=relaxed/simple;
	bh=8e8RzsOJJ/IPXEk6jFz3YCAiTioi4qy++c8Lk+elKrI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PxR1d91LhZWM6SjfN/N83FfZIminQORc5F2igZHp38SP15ToZ/srahp1KgXuLo7Ivy62I3UVoPpGJxME4x8AGXuhCr+WnUWF4cfv6CFt4ae7M3MeoGMS3P2VTrKeSGhZ8qIT5u1/9jL69dDkJ2JeQL4TrQdYZHAc17PTSPxfBNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z2Ww4YH4; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z2Ww4YH4"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ab68a4ab074so579507066b.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 09:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738605353; x=1739210153; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SAQHvdvrqS5BkvseXrC++pTbIaALiULGra7PwXB+XpQ=;
        b=Z2Ww4YH4ClAP6U2JoX8CRsCoWNTtmW6v6C7G0BXMglFjZONRJ48v1yctNWv2wEnvvv
         v8CAIg+0SNbKUOGv8POcnKOSi/Rbzmmblz22OU1f6xTmKozjrO+1SbA9qz0/3rvVNGjT
         TtgmjFsQMqrr1oiQc9RahgUoJjrf71xuIZwzI3Yd+AFzGnbAAgDsU4LhfTa/UC8x8Ger
         kHIT4Yx9959kWpdjZSy7VAsGR65kFJEXkXqs8HC3Q8mG3oK/KtFq0DokHYd0sTnh9e03
         vsWnHoYklhyCg8jqRIvab+5/hSfplf8qILy0zvqqiH8IKl3zR0P+FTzAJKDw9oRpdZlL
         6ymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738605353; x=1739210153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SAQHvdvrqS5BkvseXrC++pTbIaALiULGra7PwXB+XpQ=;
        b=Ugz+R2Ad7FpEJfBdFB1bYEnSr2CIa6HGNjk62pydvlWNrb6Bgml/xPICKfmYuQVX3v
         OlmOt/DTsseuUpeQZFX+1M1iGmh2uEEqb/96ysE2eqF1Pl+f/9wQssiS7fRbftEFFfB3
         mDjvKIXKrEeSJ7E3+VkWgpEsx5aK0GDbnsGDRWayHvwhp0t5+YmSAuUNnImHS/vf09VS
         zlvtzB/pY/TdQJjeyj4qD1tfpSzAfyPC3quvHUMHQO3qr3NZz3gjAeuGnKjTwXbNfXp+
         3I+RUF46R2r5BLxGTJgBmeURxuqimlccrzmoYO+XvcMQ+6/b7vQCM+TgkYieFIt6XNzD
         AkaA==
X-Forwarded-Encrypted: i=1; AJvYcCUp5jG4vMWm9Gg5Bf16VETOEFKZu2Zo35CUy8mzFyZZJFaDTS66KHqh4oi+M2bVuF+RBInKrT1gzLWNnkU=@vger.kernel.org
X-Gm-Message-State: AOJu0YztrcwjddRAgTuTyP65Dyfb7yJBCYERsTnRf7S+meq6egWq43dp
	Dm3lP+nX85m10Vd/n/rvhmgFkM6Q5aOBu0eDcnrSQ4YpaTJtWOyfGfYd4LOEnxYaa6KtWt0dron
	33xTZ0++8uAPSOJGIMMVKVLVvx/Q=
X-Gm-Gg: ASbGncuiQwN2Xgi7Tg94SC2cSLdnpaCHg9dIK9a4/4aF1NDj4ZAxznzs46d3HEu02LS
	pUcBRMUW8HC/YnPV1X+h2GnUDXYGqhXPWyQRB25IC9QoP+eKjGCsdR+n2f28gKecxZMO+STE=
X-Google-Smtp-Source: AGHT+IEtm/SX1sQBNwg57zqZoD5XtCJMb4nE0ceLKF1Zpom0tPPv1Q3okJvhClprHDPRLznwwtLCyvMBTlNODCOQnPk=
X-Received: by 2002:a05:6402:a001:b0:5dc:7374:261d with SMTP id
 4fb4d7f45d1cf-5dc737427bfmr34603992a12.7.1738605353193; Mon, 03 Feb 2025
 09:55:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250201163106.28912-1-mjguzik@gmail.com> <20250201163106.28912-2-mjguzik@gmail.com>
 <20250203175123.GB1003@redhat.com>
In-Reply-To: <20250203175123.GB1003@redhat.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Mon, 3 Feb 2025 18:55:41 +0100
X-Gm-Features: AWEUYZlbvHvPufmBaHPz_csfz_c4fuvAVdfpLeRzOEKCPVQGg4LsT_Gr6u3hzVE
Message-ID: <CAGudoHHauoo9nhUHF2R-UqMbyT5O8TcRxmGy-+QCRNk-CAO3pA@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] exit: perform add_device_randomness() without tasklist_lock
To: Oleg Nesterov <oleg@redhat.com>
Cc: ebiederm@xmission.com, brauner@kernel.org, akpm@linux-foundation.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 6:51=E2=80=AFPM Oleg Nesterov <oleg@redhat.com> wrot=
e:
>
> On 02/01, Mateusz Guzik wrote:
> >
> > +     add_device_randomness((const void*) &p->se.sum_exec_runtime,
> > +                           sizeof(unsigned long long));
>
> I won't insist, but do we really need to keep this ugly "(const void*)"
> typecast? and perhaps sizeof(p->se.sum_exec_runtime) will look a bit
> better?
>

Thanks for the review, I'm going to wait for Eric to chime in before
doing anything here.

As for the thing at hand, I tried avoid messing with it in order to
reduce discussion. :->

However, we seem to be in agreement this should be augmented, so I'm
going to do it in v4.

--=20
Mateusz Guzik <mjguzik gmail.com>
