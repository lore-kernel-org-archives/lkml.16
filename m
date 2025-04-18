Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF8C16D4E6
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 12:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744977723; cv=none; b=EGho9gIxZw3j8nxPCD9VDdsolmSBj9Rq588buMFrGX5x//3ZKUp3hhsVAlGaedE6/sSJKQIGZG9HvNLeirmtk3rF0x4rQC++Iw+squqq7OSTUkUbX6vK7CP3i3Ab6VOfn4U4GOzTNoaDqjl4z+dgMfBwKuXezlh4KT41guZVmlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744977723; c=relaxed/simple;
	bh=RCrHjO8xAUELr4mqPE7PtuFOQz5sGUAgYI3HTFLYAng=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a/jiuUWkVoQFJLPMngKMpVnzkuv3TGVPS9DOOWzgSTU6sBe7IeAJpo7KP0h4FTVbciNqKEGpRUm0OU/7FfSm/AKyqIHB0HjrVGSj8RQf5pPrYiI2lE0ZiksW1B3VUljs5x0DDxzbuDmfQA/Bj0Fv/YlyDz0+DH8Qkq5wNabAEqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=GGnuHJ0M; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="GGnuHJ0M"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-72bccda48cbso1161297a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 05:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1744977721; x=1745582521; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RCrHjO8xAUELr4mqPE7PtuFOQz5sGUAgYI3HTFLYAng=;
        b=GGnuHJ0ML8ds0IOu5pxZN771yqriszR/+bXDfmhG9l5hHzouhIx/hgDPcSZgeJBIFy
         2EQaJwRx6LH6KAOC5+u2AfRgISkDd8bG5nLvnkb2QG15a3O+FhcfymMExi6pJG/8H4FO
         +280A0M3KnR0K0kxB+956KGttoBwicMN0Bddgb9Yx9Fqj2jmpSK5rpmWR9bOTroamn61
         fLPh2KMqf9aepkJLcmun92X65pve3K9CaLRZw35OYYFXhLEzkQ/TdqnyMdXBR28Szib9
         RKDbFC1QWkw4jq51b8zpK58SGPT7XYwN1VYHFSB7blLRig32tEZA00qqnGs5p1k58cgT
         IHzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744977721; x=1745582521;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RCrHjO8xAUELr4mqPE7PtuFOQz5sGUAgYI3HTFLYAng=;
        b=CVk4nBSMuQnccfwixDlZb/fkIFdj7A0uz2TZ/1t0Ks8QmI+gajYAU8rNriw8BIDJHa
         7OIwh2lmiAJ0edo16M3/JB0HKTTuejMDR36zAtwlA0HzzqTj1Cqlj4r1q5NXRZ0AKJ5t
         41P+FFXZrYHzA3s50nFqqseNzUlyVcn4XrD1GhGBetvL6d/zodtmZAZCMGQSb7Q5nTS4
         rsokOcpo6xbfvZUlZom4mfP6Xa+MizDjNzgAzgPwtCiIb3vBLfCuWafIY54wcV2JCqzK
         CeHvIehkSErJfeBuGX62rChDeXyyxq92j4DdCRnh4gj2SQyFEMFWkZtnUy0KD640ZjW3
         7YmA==
X-Forwarded-Encrypted: i=1; AJvYcCUiNsWm7nloF2cjskNQ8O37LBXoEcMb0rtHtLfZuObSHg+PwDv2F/5X0XNzhYJSTyElyn9wHj2UkoH12yY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk5u+/ehYY2NR21UtgXU7k4A7sSNjBwfUk75FUmpuXaf80yGz6
	TxnXJP2x59yiRUN/tZcReXyxGL0L/0WulBUSPSN4zX3ti3Dz7ZItGDyNkjalh9s=
X-Gm-Gg: ASbGncsTiN3pBUqa6kV9sa2bPZBKEF/amPYp8KU7pb2dc2UCseEoKCzsywofKDgmDKy
	ArmThXvZK4DJSfxb14TdYDjljVo6GwqTLOpgd+l3BtFoMWtDZmRstIhWB6AyXttCX8VUB7MBdcx
	IMlV2L3YIgDvE36oc/NoU7pGSvE9S0rwWRRsRQmMKIV5hIJ0RqjSQBSzbuaXYFnO+YVVgxJEEUb
	3zNkN6gzVTH40rX9UjR5be9vmQQ/HqG3a7Xip5dDi4sAv0DNmY2DeZbvn8XNjFGvf17v5C1gMRp
	LQUVeg1kNU6fRi/9JBWgtlbEdivJV2QRJqyrQPu9tchssA==
X-Google-Smtp-Source: AGHT+IFpmEodtbmgdnihqC7sA3nbhK11fYL7TMUIM5m+Rg8CrSkqO37M6jThPDqqOLUcCHvHUJZ9KA==
X-Received: by 2002:a05:6808:8019:b0:401:16e:b8c1 with SMTP id 5614622812f47-401c0a9794cmr981088b6e.15.1744977721359;
        Fri, 18 Apr 2025 05:02:01 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:9913::c41? ([2606:6d00:15:9913::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2b324e2sm9870316d6.61.2025.04.18.05.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 05:02:00 -0700 (PDT)
Message-ID: <e47bcf7715dc31144b5cb6d81957ab067fdccaa8.camel@ndufresne.ca>
Subject: Re: [PATCH v5 0/5] media: imx-jpeg: Fix some motion-jpeg decoding
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: ming.qian@oss.nxp.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	mirela.rabulea@oss.nxp.com
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
 linux-imx@nxp.com, 	imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org
Date: Fri, 18 Apr 2025 08:01:59 -0400
In-Reply-To: <20250418070826.141-1-ming.qian@oss.nxp.com>
References: <20250418070826.141-1-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Ming,

Le vendredi 18 avril 2025 =C3=A0 15:08 +0800, ming.qian@oss.nxp.com a =C3=
=A9crit=C2=A0:
> From: Ming Qian <ming.qian@oss.nxp.com>
>=20
> To support decoding motion-jpeg without DHT, driver will try to decode a
> pattern jpeg before actual jpeg frame by use of linked descriptors
> (This is called "repeat mode"), then the DHT in the pattern jpeg can be
> used for decoding the motion-jpeg.
>=20
> But there is some hardware limitation in the repeat mode, that may cause
> corruption or decoding timeout.
>=20
> Try to make workaround for these limitation in this patchset.

You should maintain a changelog in your cover letter, this way we know
what has been fixed. You may be interested with "b4" tool, with "b4
prep" and "b4 send" the tool will assist you in doing the right thing.

More details on what is missing:

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#resp=
ond-to-review-comments

Meanwhile, just reply to this message with the missing information.

regards,
Nicolas

>=20
> Ming Qian (5):
> =C2=A0 media: imx-jpeg: Move mxc_jpeg_free_slot_data() ahead
> =C2=A0 media: imx-jpeg: Reset slot data pointers when free data
> =C2=A0 media: imx-jpeg: Cleanup after an allocation error
> =C2=A0 media: imx-jpeg: Change the pattern size to 128x64
> =C2=A0 media: imx-jpeg: Check decoding is ongoing for motion-jpeg
>=20
> =C2=A0.../media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h |=C2=A0=C2=A0 1 +
> =C2=A0.../media/platform/nxp/imx-jpeg/mxc-jpeg.c=C2=A0=C2=A0=C2=A0 | 120 =
+++++++++++++-----
> =C2=A0.../media/platform/nxp/imx-jpeg/mxc-jpeg.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 5 +
> =C2=A03 files changed, 97 insertions(+), 29 deletions(-)
