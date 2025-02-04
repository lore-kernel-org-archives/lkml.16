Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57F120AF8D
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 12:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738673673; cv=none; b=dzPLuUeIGd27q8v3L186m+I+wfVIg4nAxmozgGBCVwpHj8XkEd0rgwdEdYuJFo4H37g8NMODYhZOzNa4GlkVK8ZAiXUQP8kMA/RNUUPffHL84lX5bmu9LwiiUn0nSpvlQtIr+5BA5tUr0gywLpLsilBScjai+e0tcZA618Jfa94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738673673; c=relaxed/simple;
	bh=ynSUJ63SuLhCXyf2usS1JVLKxrhDuZv8kV79M/Jon+I=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=JS6Dl4R1T/JI53Np9iqTozOITpHA+fPhdd5ba7x3f7EMU8jov/M7bdShKNq+QiSkQCum3hDZbFW94IEp2MUuX79COVo+GOsQAkyhdoZYFzECl4PUMFkuqtKLEs1gyr6MdCbOXZZa8vqtmZszCvKsTtDlALQnuBYDmHp5eyp7DrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=LxDLjHsZ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="LxDLjHsZ"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4363ae65100so64788455e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 04:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738673669; x=1739278469; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fSDieL9GBtvsQS7Ye0zV4eVocVG/YaV0pHO+Q0/Wne4=;
        b=LxDLjHsZPwDJHzkD+Eim7w5Zmh4tZJddvIc26w2ntrXWaPAcPVrs9D+/dkx4bgJvIH
         Tqlv/kNkn840rWVSTbjF+yDxbg882vYfVskYls3e+MMo+K82eFSG46lIhSs9fKocNzae
         m78PVoCyZs7WZUUHPSTCUoV8FVX38o9hN5m0yrNB6c3mLIDdGCNK95oU/LXr43LxrUqe
         aWmBdXsAgSACZJLm/A1vzQcziT7VzJVKvQVONOZgbg0o7eP3v9kaSPaRrh2wK3ZUYnMK
         YoI8Y3phTWWXT2L+qWhFE1LqB88TPEgttiAA+V1PIQZ7T8VLbE+o8j7CG2mpZRDuKxvZ
         oRcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738673669; x=1739278469;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fSDieL9GBtvsQS7Ye0zV4eVocVG/YaV0pHO+Q0/Wne4=;
        b=qTEAHEYGlSydIeVuKB8+7cvBcb/pB8BXRMZWdAry2d0g3XKEwP8ezA6U3u6QGIiday
         qGnvEhpN9bnN7nM+vveZQKFuFg5oiFGgNoN/kmcYhXqvs7iVm2+14a/b6Fvhk+vBzBcf
         1u3bE6TqdvrXhB/piXYckiRK7AA6EEdlw88WQeSQ8Q5qCGJPOglwzUDaxitOb7hpHIEs
         oVEEH9NV9fVq/lQrCDDYuayeE15OvcnrUTdRzLlSH/8GdGVWAIRjAZ8CQDftZPTaDyAx
         dalZHUimxSFPjs71OEYnhPilVFDjBrzOTdFx/qwUTSOwShijuUstV7CJBO8A+kRJNDUW
         s1MQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHwMqAN06dUOmc+oCMWxjODMlNjEBTyb1YOXeU5OrIEV3Gj993ZSnTpybD69a1tg4Y1kMFlt+V5Pyabgs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWf2k0+Zz6t+cthI7mTvbMqPm8oU8MBkAvqpxWiKglTIHvuSup
	8tDALcOoatPFrfmn6fa4O8J6jzDQPtorXE/oMt54lBoMDEuCuuYgGtGrjR43nko=
X-Gm-Gg: ASbGncvW0d6+gSr5wEKJk10PiR4cCWbEROCDgWDiwnmygM6Zk9bvWv1cI11I7+KDlqw
	FLdYOd/xicdnsEC4ioGjSb0RxmYm+qtu+u6QKBM+49smTyZtszLwwP3ooTH2u/frzt5l/RubGAm
	sdqJ3/M6+L8+tbs2g/OL+uJZ0c945kqJvMrR3U62voD71mgr1DL/yhbIx8kT4biX7nwS1JGbwhV
	gLj150Wj1QlHKIvmqQawa39akmcBNY2L+T+T2PVh1me65LmjckNYtS+vCPhNtObbpUEu2VUIngi
	i/YpCuzETo1X01jd0drH9FDxmVmUQMVNYT/+NnIET5aSW4AfzoFxgG8kaLOwrqDIFpFSLA==
X-Google-Smtp-Source: AGHT+IFouneBDH4lcmisK2CqC0lJVk1uEkk/8hKiuwfY//uH+O/ijh/ARezQ4p0atRjAsVemu/oJlw==
X-Received: by 2002:a05:600c:3d05:b0:436:18d0:aa6e with SMTP id 5b1f17b1804b1-438dc3ab518mr293284155e9.5.1738673668943;
        Tue, 04 Feb 2025 04:54:28 -0800 (PST)
Received: from localhost (amontpellier-556-1-148-206.w109-210.abo.wanadoo.fr. [109.210.4.206])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390692a66esm14765885e9.0.2025.02.04.04.54.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 04:54:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 04 Feb 2025 13:54:27 +0100
Message-Id: <D7JODK8W4W9W.3OO4GRGNDU5ZX@baylibre.com>
To: "Jonathan Cameron" <Jonathan.Cameron@huawei.com>
Cc: "Lars-Peter Clausen" <lars@metafoo.de>, "Michael Hennerich"
 <Michael.Hennerich@analog.com>, =?utf-8?q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, "Jonathan Cameron" <jic23@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v3 2/6] iio: adc: ad4030: add driver for ad4030-24
From: "Esteban Blanc" <eblanc@baylibre.com>
X-Mailer: aerc 0.18.2
References: <20250130-eblanc-ad4630_v1-v3-0-052e8c2d897d@baylibre.com>
 <20250130-eblanc-ad4630_v1-v3-2-052e8c2d897d@baylibre.com>
 <20250131181437.00000097@huawei.com>
In-Reply-To: <20250131181437.00000097@huawei.com>

On Fri Jan 31, 2025 at 7:14 PM CET, Jonathan Cameron wrote:
> On Thu, 30 Jan 2025 12:08:26 +0100
> Esteban Blanc <eblanc@baylibre.com> wrote:
>
> > This adds a new driver for the Analog Devices INC. AD4030-24 ADC.
> >=20
> > The driver implements basic support for the AD4030-24 1 channel
> > differential ADC with hardware gain and offset control.
> >=20
> > Signed-off-by: Esteban Blanc <eblanc@baylibre.com>
> Hi Esteban,
>
> Just one thing in here that actually matters. Question about scaling of
> the common channel.  The others I could tidy up whilst applying if
> nothing much else comes up.
>
> Jonathan
>
>
> > +static int ad4030_get_chan_scale(struct iio_dev *indio_dev,
> > +				 struct iio_chan_spec const *chan,
> > +				 int *val,
> > +				 int *val2)
> > +{
> > +	struct ad4030_state *st =3D iio_priv(indio_dev);
> > +
> > +	if (chan->differential) {
> > +		*val =3D (st->vref_uv * 2) / MILLI;
> > +		*val2 =3D st->chip->precision_bits;
> > +		return IIO_VAL_FRACTIONAL_LOG2;
> > +	}
> > +
> > +	*val =3D st->vref_uv / 256;
>
> This is a bit non obvious.
> A comment on this scaling might be good to have.
> Particularly the lack of / MILLI
> (I think that's a bug?)

Yes I think that should be:
``
*val =3D st->vref_uv / MILLI;
*val2 =3D 8;
return IIO_VAL_FRACTIONAL_LOG2;
``

So I guess that requires a V4. I will address the other comments there.

Thanks for your time,

--=20
Esteban "Skallwar" Blanc
BayLibre

