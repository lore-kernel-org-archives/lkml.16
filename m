Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B613428A1D9
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 19:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750102667; cv=none; b=kHSZSGeKpCkHZCM1bC0Hdjm1X3kE52OKPb1NtttFyKq89ZG4c+qYlKBo9eRujhKSBwsUh0BiUCBcFngp7j3yYf720xSfgZdHrkchRP7jSbS3PJsfrS6LfS/xOL4NyrIPeXhNSxwyjDhwUSs57IyrWL78BIh09C9nF29sBziqt+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750102667; c=relaxed/simple;
	bh=MzrFurt+HBpg9fZltfNFjomT7VYJETh208VSpb61j2M=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aLmcN/81VmBkhpl1vIP8ighbafloN+R5iarXyJoPQV4MfvpxlevBe8H4WYhDPSMFTfbyQhbhwvbGavJckRe318DCe2GaVQ3DFrzOaawAl+WrwKfNwGf2FQSOntXau7lzzMPdAG6XS/bLedwidEgs+NuiYC1HQPXhBJaiKP9S1HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=gTIirC8b; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="gTIirC8b"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7d21cecc11fso947740685a.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 12:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1750102664; x=1750707464; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=O2YgCoNVubGpzpwZU+Tpj9HlgT+VclFnu+kN+9dMbq0=;
        b=gTIirC8b0Ea1vcCA3zC9IYL0lklFYs3aOuRar7F2auuw0p7ubJShZKLmqiXPeNj5fr
         wSGJloGBxxPvZhBCF+8f7rxqNaDwJs4BKKGVZ3VDaK7v0al+ZcaCIJ7riwngmB+klYXz
         2GbfbsUeZn08GkG8m6Rt2p5y+RFerKjZc/UI13gOXV+sLzmdfOoYnG9uQVtalo3w4ivD
         z+7anlevFM7ll5kOd9MWVnwuzPd1D3h4vxZ8F9t344QcHVhpNgUm77CW/t09od4C1KpJ
         OBJLA6ZQGS/V7UHQOAlMhWXdSr4g/oAjycU14wFN2EETaNkRqyYyvhNxL82FE1UViOWT
         4uyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750102664; x=1750707464;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O2YgCoNVubGpzpwZU+Tpj9HlgT+VclFnu+kN+9dMbq0=;
        b=JvHWQTjIHc8Dgamw5lcFcCvl3OBdXIl4AGVm90jCccKo7WDpu+tCb8f1rsiuhC6HnH
         9htk7+BH8PJb3ixG/t0aYXv/Fh0lObryTk+0QBGp2MhY0zrQmTDT0/+ypY/OgyRn5PRU
         jYB/GtlvQY3hiqDVGdWdCitCZDV3qN7klmZm5F7JZ38uxsnORmMyGcZtVxL5dlcLqoMJ
         +pKmBRfOmPOTM3mZfGW59mIMEDnj1gzPg3Cfk18QEatn+isIPIGPq2T9WO/arCFREe24
         66vPIazLTA/ZRtuh2HebSYH3B692lN2LClAKeYjwjwsroelui411RsDI9Z9v1vDsrlEO
         AI7w==
X-Forwarded-Encrypted: i=1; AJvYcCXN7DtzB4InuBolAeJk7vWjlVyL+OWl/MQ548APmrPeQ4At+YWeOEXRfo7/jy9hxK1K7SXKDPYW2vpXIlo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz41WgsTLm+oF/dKGaMYDVXu2DB4YqJBBg88qGL8kodnvehddPE
	DS7B+mOaPGIDE/ewkdIQW3VdYEF5B0w7vicqhL8NmDX26DWKw+WOddup8msi2/Wnsfc=
X-Gm-Gg: ASbGnctmkEjLJN4LvqICnPsyyPN52W8uC/LS5OINYjKu6wOcZP+iYzc7FJPV+0TJgge
	SMCrJYi1N5HTZM8PrDzsM2ukj6PMHFIjPKMiTNZRT5MGSvAwhfwe8xPqWrp+FtsUTIny1yYWWT6
	T8FKMgKxjSKOp/joqyUXjGXJ1Z9sjcqfAcLJSpqmXkGBL5tSBtDBohZhiZWOeE8becKIvYt+gFI
	rixNkvbwt/Xp3Grjjkdsp5UYPS8EQGQSQGdQ7A92ADG6AS5Fz9KweDN94UzSDjeC9KQm+akwN29
	4Us3dcu/OF6QtFW6dnQHRm8NTsNYCXX30uVc6FUc3ink7ta0tXZTwXztD3gpRvAqAq0t3WAeWnC
	AUg==
X-Google-Smtp-Source: AGHT+IGN5ofvK1QLhB3Iq9ZsAFvdbt7jcq5u8oDxQ3gRMavs2JTZOTHJjHcBA7M6zkSdgURMsiy7Cg==
X-Received: by 2002:a05:620a:2a03:b0:7d3:8df8:cc04 with SMTP id af79cd13be357-7d3c6cc98efmr1651311785a.35.1750102664586;
        Mon, 16 Jun 2025 12:37:44 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b699::c41? ([2606:6d00:17:b699::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8ed6630sm559553685a.89.2025.06.16.12.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 12:37:43 -0700 (PDT)
Message-ID: <3d08da09653034128c48e97c1f6fad59c2ff5f35.camel@ndufresne.ca>
Subject: Re: [PATCH v7 3/5] media: venus: Remove timeperframe from inst
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Ricardo Ribalda <ribalda@chromium.org>, Vikash Garodia	
 <quic_vgarodia@quicinc.com>, Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Stanimir Varbanov	 <stanimir.varbanov@linaro.org>,
 Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 16 Jun 2025 15:37:42 -0400
In-Reply-To: <20250616-test-v7-3-b8c0f98494fa@chromium.org>
References: <20250616-test-v7-0-b8c0f98494fa@chromium.org>
	 <20250616-test-v7-3-b8c0f98494fa@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Ricardo,

Le lundi 16 juin 2025 =C3=A0 15:29 +0000, Ricardo Ribalda a =C3=A9crit=C2=
=A0:
> The driver only cares about whole fps. We can infer the timeperframe
> from the fps field. Remove the redundant field.

I do have reserved about this change. Video standards commonly uses fractio=
nal
rates for videos. If my memory is correct, venus uses Q16 ... So with this =
change,
we now round all frame rate passed to encoders to an integer, which will in=
troduce
error in the resulting bitrate.

Perhaps it was already broken, but if so, it should be fixed instead ?

regards,
Nicolas

>=20
> Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> =C2=A0drivers/media/platform/qcom/venus/core.h |=C2=A0 2 --
> =C2=A0drivers/media/platform/qcom/venus/vdec.c | 15 ++++++++-------
> =C2=A0drivers/media/platform/qcom/venus/venc.c | 16 ++++++++--------
> =C2=A03 files changed, 16 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/pla=
tform/qcom/venus/core.h
> index 5b1ba1c69adba14c3560a4bc6d09435529f295a6..9cfb860e01e752bf9856a3550=
f59c8c7b43647d2 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -413,7 +413,6 @@ enum venus_inst_modes {
> =C2=A0 * @tss:		timestamp metadata
> =C2=A0 * @payloads:		cache plane payload to use it for clock/BW scaling
> =C2=A0 * @fps:		holds current FPS
> - * @timeperframe:	holds current time per frame structure
> =C2=A0 * @fmt_out:	a reference to output format structure
> =C2=A0 * @fmt_cap:	a reference to capture format structure
> =C2=A0 * @num_input_bufs:	holds number of input buffers
> @@ -484,7 +483,6 @@ struct venus_inst {
> =C2=A0	struct venus_ts_metadata tss[VIDEO_MAX_FRAME];
> =C2=A0	unsigned long payloads[VIDEO_MAX_FRAME];
> =C2=A0	u64 fps;
> -	struct v4l2_fract timeperframe;
> =C2=A0	const struct venus_format *fmt_out;
> =C2=A0	const struct venus_format *fmt_cap;
> =C2=A0	unsigned int num_input_bufs;
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/pla=
tform/qcom/venus/vdec.c
> index fca27be61f4b869840904cc0577949635bc63cab..7d6612234d18a49573dc502d4=
8ee61a900b63194 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -471,10 +471,12 @@ static int vdec_s_parm(struct file *file, void *fh,=
 struct v4l2_streamparm *a)
> =C2=A0		return -EINVAL;
> =C2=A0
> =C2=A0	memset(cap->reserved, 0, sizeof(cap->reserved));
> -	if (!timeperframe->denominator)
> -		timeperframe->denominator =3D inst->timeperframe.denominator;
> -	if (!timeperframe->numerator)
> -		timeperframe->numerator =3D inst->timeperframe.numerator;
> +
> +	if (!timeperframe->numerator || !timeperframe->denominator) {
> +		timeperframe->numerator =3D 1;
> +		timeperframe->denominator =3D inst->fps;
> +	}
> +
> =C2=A0	cap->readbuffers =3D 0;
> =C2=A0	cap->extendedmode =3D 0;
> =C2=A0	cap->capability =3D V4L2_CAP_TIMEPERFRAME;
> @@ -487,7 +489,8 @@ static int vdec_s_parm(struct file *file, void *fh, s=
truct v4l2_streamparm *a)
> =C2=A0	fps =3D min(VENUS_MAX_FPS, fps);
> =C2=A0
> =C2=A0	inst->fps =3D fps;
> -	inst->timeperframe =3D *timeperframe;
> +	timeperframe->numerator =3D 1;
> +	timeperframe->denominator =3D inst->fps;
> =C2=A0
> =C2=A0	return 0;
> =C2=A0}
> @@ -1622,8 +1625,6 @@ static void vdec_inst_init(struct venus_inst *inst)
> =C2=A0	inst->out_width =3D frame_width_min(inst);
> =C2=A0	inst->out_height =3D frame_height_min(inst);
> =C2=A0	inst->fps =3D 30;
> -	inst->timeperframe.numerator =3D 1;
> -	inst->timeperframe.denominator =3D 30;
> =C2=A0	inst->opb_buftype =3D HFI_BUFFER_OUTPUT;
> =C2=A0}
> =C2=A0
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/pla=
tform/qcom/venus/venc.c
> index b9ccee870c3d1238e04cef5e9344bd992d86d737..4979392aa20b6dc94895c7089=
878531b92b57754 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -401,10 +401,10 @@ static int venc_s_parm(struct file *file, void *fh,=
 struct v4l2_streamparm *a)
> =C2=A0
> =C2=A0	memset(out->reserved, 0, sizeof(out->reserved));
> =C2=A0
> -	if (!timeperframe->denominator)
> -		timeperframe->denominator =3D inst->timeperframe.denominator;
> -	if (!timeperframe->numerator)
> -		timeperframe->numerator =3D inst->timeperframe.numerator;
> +	if (!timeperframe->numerator || !timeperframe->denominator) {
> +		timeperframe->numerator =3D 1;
> +		timeperframe->denominator =3D inst->fps;
> +	}
> =C2=A0
> =C2=A0	out->capability =3D V4L2_CAP_TIMEPERFRAME;
> =C2=A0
> @@ -416,8 +416,9 @@ static int venc_s_parm(struct file *file, void *fh, s=
truct v4l2_streamparm *a)
> =C2=A0	do_div(fps, us_per_frame);
> =C2=A0	fps =3D min(VENUS_MAX_FPS, fps);
> =C2=A0
> -	inst->timeperframe =3D *timeperframe;
> =C2=A0	inst->fps =3D fps;
> +	timeperframe->numerator =3D 1;
> +	timeperframe->denominator =3D inst->fps;
> =C2=A0
> =C2=A0	return 0;
> =C2=A0}
> @@ -431,7 +432,8 @@ static int venc_g_parm(struct file *file, void *fh, s=
truct v4l2_streamparm *a)
> =C2=A0		return -EINVAL;
> =C2=A0
> =C2=A0	a->parm.output.capability |=3D V4L2_CAP_TIMEPERFRAME;
> -	a->parm.output.timeperframe =3D inst->timeperframe;
> +	a->parm.output.timeperframe.numerator =3D 1;
> +	a->parm.output.timeperframe.denominator =3D inst->fps;
> =C2=A0
> =C2=A0	return 0;
> =C2=A0}
> @@ -1454,8 +1456,6 @@ static void venc_inst_init(struct venus_inst *inst)
> =C2=A0	inst->out_width =3D 1280;
> =C2=A0	inst->out_height =3D 720;
> =C2=A0	inst->fps =3D 15;
> -	inst->timeperframe.numerator =3D 1;
> -	inst->timeperframe.denominator =3D 15;
> =C2=A0	inst->hfi_codec =3D HFI_VIDEO_CODEC_H264;
> =C2=A0}
> =C2=A0
