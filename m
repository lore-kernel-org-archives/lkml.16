Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798AA11185
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 21:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747775080; cv=none; b=ZVJeBl9QL9AgshrS5V/eF4oYLvH5CtW2fu6oYVBJ+6OXBCRNnIw/WGAYmEG8/qf1cul/ctqgsOafbYB/bPYvg67sFPwxJxUA7UnO+F35jLI1OyosEdR5c+Hhl01/rh4tXFphYivTL2wlwHAZXZjAjLyjUeOS27SykFmwF2C4mQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747775080; c=relaxed/simple;
	bh=+0fk8uCaFo18Kf0MRV/43eFPSKdgOZ74kwi42fEg8X0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Mwvl2S0LNy/0qJo9t+XwlElEwdDXkT1+gWwjuINqbG3petQfFHp6Iv2prwoDbvIIYwFZrCyjM5+nZO1FtOuGPIBmuoWJrdNsfC3SkBZnw3Q/Z/TU1j3nERpG9///dBGO2H+gG2LoHYp4vA2YGLlVoZ4NkBK+aP2Gmg5KCkKERw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=jhcR6Sz5; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="jhcR6Sz5"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-476b4c9faa2so85230531cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1747775076; x=1748379876; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KqItrUF4ptaBPjuoyGDGzHkCvCHQr1VtbdWE1plJfJg=;
        b=jhcR6Sz5kiEe3B3JTs19wVbgVkH8NpD/do5A0Ff8alP8nsT0+iBgclqshuhy/RWSqW
         cWasZ4HApqZTQyUA3o/tj48M5udDEi2mwuECiIRXG7fkhfEZR25NOrpNfJx0/0caccyi
         DYkgH/Hou/2F4T6gWyOhkmfoBfAmjac7Pvqw+coHwf68I38FjR85dSABNXKYjcSBagkr
         bFpk6lGWnvIRnJeEsGiL99WPhS+R0kkJPDtFSoNXRE+MCrYi8toNHMAnsQGGCk0/L1d0
         fwbm9XZvGxciQZbcAVVfZGPRlMnYpZcqdgKBNWzFqH5Uj4xVtRRqcn8HNx73X8VW+299
         nj1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747775076; x=1748379876;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KqItrUF4ptaBPjuoyGDGzHkCvCHQr1VtbdWE1plJfJg=;
        b=Fz5imxkBluXJbMDUF0rxo2rPbMzlrrmr9OKTI0IeWMd1rcADgrvSgxTeRCo4XsEUwa
         eGu39uqB06YiNzEci8KYvwWX3vSHDWw70Y8F/LLg/YlvaehbWK7CEWYU0g+Axys9PSgt
         RurvZix9y80CMM5XuEdonkKyKZcTLzghKgRXvZcfFGe0dDa2lLGSJaizGbXI5wfIs1BU
         qdfofRJoWj1zNbUWXKEUBwml9z+ZS8jdO95PLcREXf74MUq94bRuUq9dRNIKJHmL5scg
         UA9OPcPLl2qUppHykOKN0sqG+FY3Dd41kGHZesfbNe5hHtoViPAxDtUPgzxhJ2u2JXzB
         JTGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXj5/3QCDFi02RO2WgFKuGqJu/mzbGusX8A2GOoGEUT2DLTv14Ru2aDrO60mtlnHBjuy8FmI+tSFMuRcCQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsB8vt96rMAzxbjai4TcyLFGQ9vUluq6XvZPaQhCGdIzziomGV
	ziI1KQFrBoD7RhFFUkGjpQeSBJHSnx8yQJ3N75Pgc+Me5Enlvjpjl7ltrsPWfzLWHRg=
X-Gm-Gg: ASbGncsR3pbr+0NWt/sKdeTkVgxL3NDfmi7aLUb2oeHbIgMdXLN70NST7S0TrnCPIRH
	9tcpdZJn3CEHnmBQZ4/+eXY6kboxXmNCohQDB+/IJOd9wvj1U+xtY1dFeX31oeZ0devlAmPzR9b
	DO/TX8TjBGGEvd3UkhfBdtC1FMnPHvmgKznfmz9ZrOJ4g+iE/VKgU7Cb9cVYH4h7U19p09NFgRS
	su71wW2l9b0bMvHStieIXamSfYW0aaIZoRfGkWmOF1B69JNF2QusvYwymY3L1LoF1dvo1pt60XE
	/2TCRNREjZzz69zYR1v8ovIybZUzxlKkXMBZ1+VIXgXJ0qCY3XjQNg==
X-Google-Smtp-Source: AGHT+IHg5L1LnATAiuBzkKLspOuWrCkqOalfc5A589kj0iiOhCdWAsv0cllP21x6GsWbso6aFUBAew==
X-Received: by 2002:ac8:6f1b:0:b0:48b:5656:bb01 with SMTP id d75a77b69052e-494ae352f98mr248655851cf.10.1747775076215;
        Tue, 20 May 2025 14:04:36 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:ec4::c41? ([2606:6d00:15:ec4::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494ae3f922csm75736131cf.26.2025.05.20.14.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 14:04:35 -0700 (PDT)
Message-ID: <3e794e17ab846e29fb5922dc94b969b8cf9334a8.camel@ndufresne.ca>
Subject: Re: [PATCH v4] media: amphion: Add H264 and HEVC profile and level
 control
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: ming.qian@oss.nxp.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-imx@nxp.com, xiahong.bao@nxp.com,
 eagle.zhou@nxp.com, 	imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org
Date: Tue, 20 May 2025 17:04:34 -0400
In-Reply-To: <20250512020137.211-1-ming.qian@oss.nxp.com>
References: <20250512020137.211-1-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Ming,

got one final question below...

Le lundi 12 mai 2025 =C3=A0 10:01 +0800, ming.qian@oss.nxp.com a =C3=A9crit=
=C2=A0:
> From: Ming Qian <ming.qian@oss.nxp.com>
>=20
> For format H264 and HEVC, the firmware can report the parsed profile idc
> and level idc to driver, these information may be useful.
> Implement the H264 and HEVC profile and level control to report them.
>=20
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> ---
> v4
> - Fix a building warning reported by kernel test robot
>=20
> v3
> - Check H264 Constrained Baseline Profile
> - Check H264 Level 1b
> - Remove support for V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH
> - Remove support for V4L2_MPEG_VIDEO_H264_PROFILE_STEREO_HIGH
>=20
> v2
> - Add support for V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE
> ---
> =C2=A0drivers/media/platform/amphion/vdec.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 59 +++++++++
> =C2=A0drivers/media/platform/amphion/vpu_defs.h=C2=A0=C2=A0=C2=A0 |=C2=A0=
 12 ++
> =C2=A0drivers/media/platform/amphion/vpu_helpers.c | 123 ++++++++++++++++=
+++
> =C2=A0drivers/media/platform/amphion/vpu_helpers.h |=C2=A0=C2=A0 7 ++
> =C2=A0drivers/media/platform/amphion/vpu_malone.c=C2=A0 |=C2=A0=C2=A0 5 +=
-
> =C2=A05 files changed, 205 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/platfo=
rm/amphion/vdec.c
> index 85d518823159..55067d9405c2 100644
> --- a/drivers/media/platform/amphion/vdec.c
> +++ b/drivers/media/platform/amphion/vdec.c
> @@ -232,6 +232,35 @@ static int vdec_ctrl_init(struct vpu_inst *inst)
> =C2=A0			=C2=A0 V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE,
> =C2=A0			=C2=A0 0, 1, 1, 0);
> =C2=A0
> +	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, NULL,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_MPEG_VIDEO_H264_PROFILE=
,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_MPEG_VIDEO_H264_PROFILE_MUL=
TIVIEW_HIGH,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ~((1 << V4L2_MPEG_VIDEO_H264_PRO=
FILE_BASELINE) |
> +				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
> +				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
> +				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED) |
> +				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_HIGH)),
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_MPEG_VIDEO_H264_PROFILE_MAI=
N);
> +
> +	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, NULL,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_MPEG_VIDEO_H264_LEVEL,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_6_2,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_4_0);
> +
> +	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, NULL,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_MPEG_VIDEO_HEVC_PROFILE=
,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_MPEG_VIDEO_HEVC_PROFILE_MAI=
N_10,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ~((1 << V4L2_MPEG_VIDEO_HEVC_PRO=
FILE_MAIN) |
> +				 (1 << V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10)),
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_MPEG_VIDEO_HEVC_PROFILE_MAI=
N);
> +
> +	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, NULL,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_CID_MPEG_VIDEO_HEVC_LEVEL,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_MPEG_VIDEO_HEVC_LEVEL_4);
> +
> =C2=A0	ctrl =3D v4l2_ctrl_new_std(&inst->ctrl_handler, &vdec_ctrl_ops,
> =C2=A0				 V4L2_CID_MIN_BUFFERS_FOR_CAPTURE, 1, 32, 1, 2);
> =C2=A0	if (ctrl)
> @@ -1166,6 +1195,35 @@ static void vdec_clear_slots(struct vpu_inst *inst=
)
> =C2=A0	}
> =C2=A0}
> =C2=A0
> +static void vdec_update_v4l2_ctrl(struct vpu_inst *inst, u32 id, u32 val=
)
> +{
> +	struct v4l2_ctrl *ctrl =3D v4l2_ctrl_find(&inst->ctrl_handler, id);
> +
> +	if (ctrl)
> +		v4l2_ctrl_s_ctrl(ctrl, val);
> +}
> +
> +static void vdec_update_v4l2_profile_level(struct vpu_inst *inst, struct=
 vpu_dec_codec_info *hdr)
> +{
> +	switch (inst->out_format.pixfmt) {
> +	case V4L2_PIX_FMT_H264:
> +	case V4L2_PIX_FMT_H264_MVC:
> +		vdec_update_v4l2_ctrl(inst, V4L2_CID_MPEG_VIDEO_H264_PROFILE,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vpu_get_h264_v4l2_profile(hdr));
> +		vdec_update_v4l2_ctrl(inst, V4L2_CID_MPEG_VIDEO_H264_LEVEL,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vpu_get_h264_v4l2_level(hdr));
> +		break;
> +	case V4L2_PIX_FMT_HEVC:
> +		vdec_update_v4l2_ctrl(inst, V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vpu_get_hevc_v4l2_profile(hdr));
> +		vdec_update_v4l2_ctrl(inst, V4L2_CID_MPEG_VIDEO_HEVC_LEVEL,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vpu_get_hevc_v4l2_level(hdr));
> +		break;
> +	default:
> +		return;
> +	}
> +}
> +
> =C2=A0static void vdec_event_seq_hdr(struct vpu_inst *inst, struct vpu_de=
c_codec_info *hdr)
> =C2=A0{
> =C2=A0	struct vdec_t *vdec =3D inst->priv;
> @@ -1189,6 +1247,7 @@ static void vdec_event_seq_hdr(struct vpu_inst *ins=
t, struct vpu_dec_codec_info
> =C2=A0	vdec_init_crop(inst);
> =C2=A0	vdec_init_mbi(inst);
> =C2=A0	vdec_init_dcp(inst);
> +	vdec_update_v4l2_profile_level(inst, hdr);
> =C2=A0	if (!vdec->seq_hdr_found) {
> =C2=A0		vdec->seq_tag =3D vdec->codec_info.tag;
> =C2=A0		if (vdec->is_source_changed) {
> diff --git a/drivers/media/platform/amphion/vpu_defs.h b/drivers/media/pl=
atform/amphion/vpu_defs.h
> index 428d988cf2f7..f56245ae2205 100644
> --- a/drivers/media/platform/amphion/vpu_defs.h
> +++ b/drivers/media/platform/amphion/vpu_defs.h
> @@ -134,6 +134,7 @@ struct vpu_dec_codec_info {
> =C2=A0	u32 decoded_height;
> =C2=A0	struct v4l2_fract frame_rate;
> =C2=A0	u32 dsp_asp_ratio;
> +	u32 profile_idc;
> =C2=A0	u32 level_idc;
> =C2=A0	u32 bit_depth_luma;
> =C2=A0	u32 bit_depth_chroma;
> @@ -147,6 +148,17 @@ struct vpu_dec_codec_info {
> =C2=A0	u32 mbi_size;
> =C2=A0	u32 dcp_size;
> =C2=A0	u32 stride;
> +	union {
> +		struct {
> +			u32 constraint_set5_flag : 1;
> +			u32 constraint_set4_flag : 1;
> +			u32 constraint_set3_flag : 1;
> +			u32 constraint_set2_flag : 1;
> +			u32 constraint_set1_flag : 1;
> +			u32 constraint_set0_flag : 1;
> +		};
> +		u32 constraint_set_flags;

Shouldn't this be u8 all over to match the fact the firmware reports this o=
ver a single byte ?

Nicolas

> +	};
> =C2=A0};
> =C2=A0
> =C2=A0struct vpu_dec_pic_info {
> diff --git a/drivers/media/platform/amphion/vpu_helpers.c b/drivers/media=
/platform/amphion/vpu_helpers.c
> index d12310af9ebc..886d5632388e 100644
> --- a/drivers/media/platform/amphion/vpu_helpers.c
> +++ b/drivers/media/platform/amphion/vpu_helpers.c
> @@ -509,3 +509,126 @@ const char *vpu_codec_state_name(enum vpu_codec_sta=
te state)
> =C2=A0	}
> =C2=A0	return "<unknown>";
> =C2=A0}
> +
> +struct codec_id_mapping {
> +	u32 id;
> +	u32 v4l2_id;
> +};
> +
> +static struct codec_id_mapping h264_profiles[] =3D {
> +	{66,=C2=A0 V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE},
> +	{77,=C2=A0 V4L2_MPEG_VIDEO_H264_PROFILE_MAIN},
> +	{88,=C2=A0 V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED},
> +	{100, V4L2_MPEG_VIDEO_H264_PROFILE_HIGH}
> +};
> +
> +static struct codec_id_mapping h264_levels[] =3D {
> +	{10,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_1_0},
> +	{9,=C2=A0=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_1B},
> +	{11,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_1_1},
> +	{12,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_1_2},
> +	{13,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_1_3},
> +	{20,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_2_0},
> +	{21,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_2_1},
> +	{22,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_2_2},
> +	{30,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_3_0},
> +	{31,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_3_1},
> +	{32,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_3_2},
> +	{40,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_4_0},
> +	{41,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_4_1},
> +	{42,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_4_2},
> +	{50,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_5_0},
> +	{51,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_5_1},
> +	{52,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_5_2},
> +	{60,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_6_0},
> +	{61,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_6_1},
> +	{62,=C2=A0 V4L2_MPEG_VIDEO_H264_LEVEL_6_2}
> +};
> +
> +static struct codec_id_mapping hevc_profiles[] =3D {
> +	{1,=C2=A0=C2=A0 V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN},
> +	{2,=C2=A0=C2=A0 V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10}
> +};
> +
> +static struct codec_id_mapping hevc_levels[] =3D {
> +	{30,=C2=A0 V4L2_MPEG_VIDEO_HEVC_LEVEL_1},
> +	{60,=C2=A0 V4L2_MPEG_VIDEO_HEVC_LEVEL_2},
> +	{63,=C2=A0 V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1},
> +	{90,=C2=A0 V4L2_MPEG_VIDEO_HEVC_LEVEL_3},
> +	{93,=C2=A0 V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1},
> +	{120, V4L2_MPEG_VIDEO_HEVC_LEVEL_4},
> +	{123, V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1},
> +	{150, V4L2_MPEG_VIDEO_HEVC_LEVEL_5},
> +	{153, V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1},
> +	{156, V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2},
> +	{180, V4L2_MPEG_VIDEO_HEVC_LEVEL_6},
> +	{183, V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1},
> +	{186, V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2}
> +};
> +
> +static u32 vpu_find_v4l2_id(u32 id, struct codec_id_mapping *array, u32 =
array_sz)
> +{
> +	u32 i;
> +
> +	if (!array || !array_sz)
> +		return 0;
> +
> +	for (i =3D 0; i < array_sz; i++) {
> +		if (id =3D=3D array[i].id)
> +			return array[i].v4l2_id;
> +	}
> +
> +	return 0;
> +}
> +
> +u32 vpu_get_h264_v4l2_profile(struct vpu_dec_codec_info *hdr)
> +{
> +	if (!hdr)
> +		return 0;
> +
> +	/*
> +	 * In H.264 Document section A.2.1.1 Constrained Baseline profile
> +	 * Conformance of a bitstream to the Constrained Baseline profile is in=
dicated by
> +	 * profile_idc being equal to 66 with constraint_set1_flag being equal =
to 1.
> +	 */
> +	if (hdr->profile_idc =3D=3D 66 && hdr->constraint_set1_flag)
> +		return V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE;
> +
> +	return vpu_find_v4l2_id(hdr->profile_idc, h264_profiles, ARRAY_SIZE(h26=
4_profiles));
> +}
> +
> +u32 vpu_get_h264_v4l2_level(struct vpu_dec_codec_info *hdr)
> +{
> +	if (!hdr)
> +		return 0;
> +
> +	/*
> +	 * In H.264 Document section 7.4.2.1.1 Sequence parameter set data sema=
ntics
> +	 * If profile_idc is equal to 66, 77, or 88 and level_idc is equal to 1=
1,
> +	 * constraint_set3_flag equal to 1 indicates that the coded video seque=
nce
> +	 * obeys all constraints specified in Annex A for level 1b
> +	 * and constraint_set3_flag equal to 0 indicates that the coded video s=
equence
> +	 * obeys all constraints specified in Annex A for level 1.1.
> +	 */
> +	if (hdr->level_idc =3D=3D 11 && hdr->constraint_set3_flag &&
> +	=C2=A0=C2=A0=C2=A0 (hdr->profile_idc =3D=3D 66 || hdr->profile_idc =3D=
=3D 77 || hdr->profile_idc =3D=3D 88))
> +		return V4L2_MPEG_VIDEO_H264_LEVEL_1B;
> +
> +	return vpu_find_v4l2_id(hdr->level_idc, h264_levels, ARRAY_SIZE(h264_le=
vels));
> +}
> +
> +u32 vpu_get_hevc_v4l2_profile(struct vpu_dec_codec_info *hdr)
> +{
> +	if (!hdr)
> +		return 0;
> +
> +	return vpu_find_v4l2_id(hdr->profile_idc, hevc_profiles, ARRAY_SIZE(hev=
c_profiles));
> +}
> +
> +u32 vpu_get_hevc_v4l2_level(struct vpu_dec_codec_info *hdr)
> +{
> +	if (!hdr)
> +		return 0;
> +
> +	return vpu_find_v4l2_id(hdr->level_idc, hevc_levels, ARRAY_SIZE(hevc_le=
vels));
> +}
> diff --git a/drivers/media/platform/amphion/vpu_helpers.h b/drivers/media=
/platform/amphion/vpu_helpers.h
> index 0eaddb07190d..6c0554ccf3b3 100644
> --- a/drivers/media/platform/amphion/vpu_helpers.h
> +++ b/drivers/media/platform/amphion/vpu_helpers.h
> @@ -6,6 +6,8 @@
> =C2=A0#ifndef _AMPHION_VPU_HELPERS_H
> =C2=A0#define _AMPHION_VPU_HELPERS_H
> =C2=A0
> +#include "vpu_defs.h"
> +
> =C2=A0struct vpu_pair {
> =C2=A0	u32 src;
> =C2=A0	u32 dst;
> @@ -70,4 +72,9 @@ int vpu_color_get_default(u32 primaries, u32 *ptransfer=
s, u32 *pmatrix, u32 *pfu
> =C2=A0
> =C2=A0int vpu_find_dst_by_src(struct vpu_pair *pairs, u32 cnt, u32 src);
> =C2=A0int vpu_find_src_by_dst(struct vpu_pair *pairs, u32 cnt, u32 dst);
> +
> +u32 vpu_get_h264_v4l2_profile(struct vpu_dec_codec_info *hdr);
> +u32 vpu_get_h264_v4l2_level(struct vpu_dec_codec_info *hdr);
> +u32 vpu_get_hevc_v4l2_profile(struct vpu_dec_codec_info *hdr);
> +u32 vpu_get_hevc_v4l2_level(struct vpu_dec_codec_info *hdr);
> =C2=A0#endif
> diff --git a/drivers/media/platform/amphion/vpu_malone.c b/drivers/media/=
platform/amphion/vpu_malone.c
> index feca7d4220ed..ba688566dffd 100644
> --- a/drivers/media/platform/amphion/vpu_malone.c
> +++ b/drivers/media/platform/amphion/vpu_malone.c
> @@ -908,7 +908,8 @@ static void vpu_malone_unpack_seq_hdr(struct vpu_rpc_=
event *pkt,
> =C2=A0	info->frame_rate.numerator =3D 1000;
> =C2=A0	info->frame_rate.denominator =3D pkt->data[8];
> =C2=A0	info->dsp_asp_ratio =3D pkt->data[9];
> -	info->level_idc =3D pkt->data[10];
> +	info->profile_idc =3D (pkt->data[10] >> 8) & 0xff;
> +	info->level_idc =3D pkt->data[10] & 0xff;
> =C2=A0	info->bit_depth_luma =3D pkt->data[13];
> =C2=A0	info->bit_depth_chroma =3D pkt->data[14];
> =C2=A0	info->chroma_fmt =3D pkt->data[15];
> @@ -925,6 +926,8 @@ static void vpu_malone_unpack_seq_hdr(struct vpu_rpc_=
event *pkt,
> =C2=A0		info->pixfmt =3D V4L2_PIX_FMT_NV12M_10BE_8L128;
> =C2=A0	else
> =C2=A0		info->pixfmt =3D V4L2_PIX_FMT_NV12M_8L128;
> +	if (pkt->hdr.num > 28)
> +		info->constraint_set_flags =3D pkt->data[28];
> =C2=A0	if (info->frame_rate.numerator && info->frame_rate.denominator) {
> =C2=A0		unsigned long n, d;
> =C2=A0
>=20
> base-commit: b64b134942c8cf4801ea288b3fd38b509aedec21
