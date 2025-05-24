Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B4B1C863B
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 00:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748046622; cv=none; b=Yh6EunOPEHy94Ip+9wBVU+eP+0nI/V+eNmUan5rpWzYUEkhu4qxxC8+qwWvZfoZ+BdtyVBX+aakanTxlnlOTLya3RtSZiT1VTAhRpRu5j7861RjGh5Sv7eo5RpenNFWeC15mNNxeS1LBGA8ovFO6KVDur1HvM+JXBYMXFJmIgy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748046622; c=relaxed/simple;
	bh=Z3vQxLcTpDMFbmhqz80TZkS1cBKQmNM3Hvh7L+Ojb0c=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KUyjUxxBNGBAX5KeXSpDpWQ+nv7fxbfBz3NHkt3fe9hPoVtVSJarIbom4NOu4LPcIfiD/2WcNcsHQ2l47ACDUftnFlwrdHN8RXOHmTFap8IOJ5b+0EgcHFPltJtEuIqLd0qnH9cEigWNfxyaMM3qYbDD1OCg0FbUdhvU4OJtTL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=XyZBH6vi; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="XyZBH6vi"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c542ffec37so37945585a.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 17:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1748046619; x=1748651419; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Z3vQxLcTpDMFbmhqz80TZkS1cBKQmNM3Hvh7L+Ojb0c=;
        b=XyZBH6vizpgpRCeZTyKCanfnijS/hfS2cqHTp68TiMC2+Rpkt1qIzoAIJxU1ET9OWJ
         x6q+v9DyfJ7y0AYGt4tvsCsQYgeb9yL7R3cDjmPCP7VhDCt2IVMuZRDVIPnDamW8YJ0q
         vadw/4btZjnz6gm2QHFx8oO88bhxmEy6s5liOaG3S0H2nSgK9PvzaMkmvjRwdXFr+nS8
         mpKJhNqRAvfFm+Wh+X8AK32vB1GmRblw+vAspkOQiBZaRtDRPZqbFZPDs8CqwkqMPpwf
         EMIRn07nBYutQqGXxKCOlc10TOyYnuS2rg6w+ywH/jDW5KXYw7DlEMayChptN0XodZ5N
         Xi9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748046619; x=1748651419;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z3vQxLcTpDMFbmhqz80TZkS1cBKQmNM3Hvh7L+Ojb0c=;
        b=K4i91JcwpW7PfYsZrsG6In1wmNfBbMVcHL5zxV3UIB645Xw+EBojNL/7H2L8e+wz2N
         cS3pruy6suskg68WgCnRPL0yo2cJmydm2Hc1HyjRBtZePwiEkOu+iWt2OiabktvlltJT
         RRRSew5XPrMNVcBlJtj9VeNcLXpX8rWJtHHRJSUfXXkoAPDyV+XMAiSmrQdtNUMN2JRM
         VhyCS/9uLfc+9ce+MdYQx1jfcZf5z9DOU9LRzYHbYW6WHZieGf2+RGY3AUA7ci20fDhf
         e1ANJETnb8rNFxbVOrTB3RkoXt2hjOXdz5feB26ElryJPYO8AzTiE/YwhKLGE3+gh6VF
         XiZg==
X-Forwarded-Encrypted: i=1; AJvYcCW3tzMYSZk4sVbY9OhKNAVAOeVruEZxmPggSC3mhi66dUQAyr6+uQRb6otPZ3x9BVa1W99QyWAXgM0kNmE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdBREU+g0SD0tFblvQCjArCqTBi9os3b4/GVKyOCiCbV79g47J
	J01l2P6cFIFg3iG/cyNCRFNb+ArEg+pZ1vWnZBCsOuqZH219/7Kyf+xlkNx4l20w8kz0Kkfsv+0
	bn9SgQ+M=
X-Gm-Gg: ASbGncurW7PMzMGFsMXadO9x5/49ZHC6AOQBzPgRkAvzOT37+IfcDK29E40z/GODcIO
	Ts6X7Rbw2llhf1G8FPl1AujzGZM6RGxdx30lGn2qEY29s1Mpgm0RoIb70FpYhNr0cnL/3v37DCc
	6KCBzE/RXqZF4SdJNcmfT26q3B0G8iPEn8a7g6Hpe8VSuuG2Fm+8BQQnHeIIAlnQQi/seajA4vK
	ud6zW88wjuadY+aJq/PkVbIHIHnlMrqcDciG1s/DcKWG1PHE29JkTGOTucMCCrzEq0fJQguScmm
	plXNu2XzAaN38p31w477+tmjO7YziYAQBZ53RSuAIs3UL+orflK8fJb1
X-Google-Smtp-Source: AGHT+IEdDR8OXzB8US60Ph044RM+6ozSx842gNCE6DrnFPv+fhbjtE54fFC5D64DrrpFCuVDHM+uHA==
X-Received: by 2002:a05:620a:45a7:b0:7cd:53cc:c60c with SMTP id af79cd13be357-7ceecc2b5d3mr205043985a.37.1748046619377;
        Fri, 23 May 2025 17:30:19 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b2fc::c41? ([2606:6d00:17:b2fc::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd468b7400sm1254895885a.66.2025.05.23.17.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 17:30:18 -0700 (PDT)
Message-ID: <b1d8b6407bcaea4e12ff1c6c206c8d3b591ac2a9.camel@ndufresne.ca>
Subject: Re: [PATCH v3 1/5] docs: uapi: media: Document Raspberry Pi NV12
 column format
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, Sakari Ailus	
 <sakari.ailus@linux.intel.com>, Laurent Pinchart	
 <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Florian Fainelli
 <florian.fainelli@broadcom.com>, Broadcom internal kernel review list	
 <bcm-kernel-feedback-list@broadcom.com>, John Cox
 <john.cox@raspberrypi.com>,  Dom Cobley <dom@raspberrypi.com>, review list
 <kernel-list@raspberrypi.com>, Ezequiel Garcia	
 <ezequiel@vanguardiasur.com.ar>
Cc: John Cox <jc@kynesim.co.uk>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Date: Fri, 23 May 2025 20:30:17 -0400
In-Reply-To: <20250423-media-rpi-hevc-dec-v3-1-8fd3fad1d6fb@raspberrypi.com>
References: <20250423-media-rpi-hevc-dec-v3-0-8fd3fad1d6fb@raspberrypi.com>
	 <20250423-media-rpi-hevc-dec-v3-1-8fd3fad1d6fb@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le mercredi 23 avril 2025 =C3=A0 18:20 +0100, Dave Stevenson a =C3=A9crit=
=C2=A0:
> The Raspberry Pi HEVC decoder uses a tiled format based on
> columns for 8 and 10 bit YUV images, so document them as
> NV12MT_COL128 and NV12MT_10_COL128.
>=20
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
> =C2=A0.../userspace-api/media/v4l/pixfmt-yuv-planar.rst=C2=A0 | 42 ++++++=
++++++++++++++++
> =C2=A01 file changed, 42 insertions(+)
>=20
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst =
b/Documentation/userspace-
> api/media/v4l/pixfmt-yuv-planar.rst
> index b788f6933855..b5b590f234b0 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> @@ -827,6 +827,48 @@ Data in the 12 high bits, zeros in the 4 low bits, a=
rranged in little endian ord
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Cb\ :sub:`11`
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Cr\ :sub:`11`
> =C2=A0
> +V4L2_PIX_FMT_NV12MT_COL128 and V4L2_PIX_FMT_NV12MT_10_COL128
> +------------------------------------------------------------
> +
> +``V4L2_PIX_FMT_NV12MT_COL128`` is a tiled version of
> +``V4L2_PIX_FMT_NV12M`` where the two planes are split into 128 byte wide=
 columns
> +of Y or interleaved CbCr.
> +
> +V4L2_PIX_FMT_NV12MT_10_COL128 expands that as a 10 bit format where 3 10=
 bit
> +values are packed into a 32bit word. A 128 byte wide column therefore ho=
lds 96
> +samples (either Y or interleaved CrCb). That effectively makes it 6 valu=
es in a
> +64 bit word for the CbCr plane, as the values always go in pairs.

Could be nice to mention that this has a verticalement alignment of 8, allo=
wing
to represent it as a 128x8 tiled format with a column layout. This was hand=
y for
the GStreamer integration your showed me.

Nicolas

> +
> +Bit-packed representation.
> +
> +.. tabularcolumns:: |p{1.2cm}||p{1.2cm}||p{1.2cm}||p{1.2cm}|p{3.2cm}|p{3=
.2cm}|
> +
> +.. flat-table::
> +=C2=A0=C2=A0=C2=A0 :header-rows:=C2=A0 0
> +=C2=A0=C2=A0=C2=A0 :stub-columns: 0
> +=C2=A0=C2=A0=C2=A0 :widths: 8 8 8 8
> +
> +=C2=A0=C2=A0=C2=A0 * - Y'\ :sub:`00[7:0]`
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Y'\ :sub:`01[5:0] (bits 7--2)` Y'\ :sub=
:`00[9:8]`\ (bits 1--0)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Y'\ :sub:`02[3:0] (bits 7--4)` Y'\ :sub=
:`01[9:6]`\ (bits 3--0)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - unused (bits 7--6)` Y'\ :sub:`02[9:4]`\=
 (bits 5--0)
> +
> +.. tabularcolumns:: |p{1.2cm}||p{1.2cm}||p{1.2cm}||p{1.2cm}|p{3.2cm}|p{3=
.2cm}|
> +
> +.. flat-table::
> +=C2=A0=C2=A0=C2=A0 :header-rows:=C2=A0 0
> +=C2=A0=C2=A0=C2=A0 :stub-columns: 0
> +=C2=A0=C2=A0=C2=A0 :widths: 12 12 12 12 12 12 12 12
> +
> +=C2=A0=C2=A0=C2=A0 * - Cb\ :sub:`00[7:0]`
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Cr\ :sub:`00[5:0]`\ (bits 7--2) Cb\ :su=
b:`00[9:8]`\ (bits 1--0)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Cb\ :sub:`01[3:0]`\ (bits 7--4) Cr\ :su=
b:`00[9:6]`\ (bits 3--0)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - unused (bits 7--6) Cb\ :sub:`02[9:4]`\ =
(bits 5--0)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Cr\ :sub:`01[7:0]`
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Cb\ :sub:`02[5:0]`\ (bits 7--2) Cr\ :su=
b:`01[9:8]`\ (bits 1--0)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Cr\ :sub:`02[3:0]`\ (bits 7--4) Cb\ :su=
b:`02[9:6]`\ (bits 3--0)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - unused (bits 7--6) Cr\ :sub:`02[9:4]`\ =
(bits 5--0)
> +
> =C2=A0
> =C2=A0Fully Planar YUV Formats
> =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
