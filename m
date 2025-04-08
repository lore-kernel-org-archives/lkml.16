Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691C27462
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 13:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744120629; cv=none; b=ezi26GW7zNkkX5dPBbeqfnD/IstlCI7hFj/kPmQzYHnBEpgc1g5dGb7C7qQPnNZ/EVqGlE/BQoJZbtx6Fuo5Ji/fP5dDsBBDYVsS+1luAI/e6CCnTH+ypuQgZBcTlHCvwVUq2zU4H1cXN+CqZ/q+qrd4M8O0upXFu8H8rfSudcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744120629; c=relaxed/simple;
	bh=2so92eGIuLP/Dz48O8WH4Wzz5lLMtSv7e/gqN2nblHw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BaMOqQFc2W5me3anV4dirLeaxmy492gpzLAzfOB2Hr6dOwRrr3Cr7M9iqpRav9b7RJxfxIX8L10kv2L53HNTMfQYOhfpuv9UZw+fmlwJuR++lR360RnWBzhS//nIxwfTN7XIHWeHJMzsGjQVST4s3TfDJsXlBoenbg9wmZTs6IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=zQMZDdlp; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="zQMZDdlp"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac25520a289so981457366b.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 06:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744120625; x=1744725425; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eKjdH4Pw3NpQPLkg+gCbs76LHGbj5tkScdwQ0i1YzGA=;
        b=zQMZDdlproWmSYuoyr3TRVkvE6oQJrUFM+F1je0Gfp/mzWBvym3oxxE24F+XzPRHyx
         nYWx1I086PHSufzp2DlG21J0CCcpPK1GVppy62mPZ9NBcBxp1Jpv0PoTVYEg+SknyuRq
         yo9MAUqhTkQV9NVc1sAly3SFK/pVFiu86OOvMw5H4gCGlRQ/ElK56m26Dw4QvXNidPc+
         /ADtCNAd2VRUYKEtF8Gmm0NEnVlTk+uAXdEk/qKyiw1S6hxf527axHSc8AW6k/hcTcgG
         Hno2WTTmq1IkVRXErHdaFSvkKX2Q9bluGeZ3CGS2uRS3PNeWeL3MW5h66IJ7N3TsjDCc
         IRug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744120625; x=1744725425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eKjdH4Pw3NpQPLkg+gCbs76LHGbj5tkScdwQ0i1YzGA=;
        b=ka+4TfuyN6FA+DigbU84cdli5DndCoGKmVqXZJSVycGiHCbbOmsfjSaxCkgNuE1TNa
         ZksTaxqWZh8P/kvVL07+Zvih00uEZzkGEexzwaqEsZsNm4EjWGSEn81GlsCIiATG7m86
         dWB8guY12kxNgyI6dLgQVfDbAOYCGYvl0AkhMbf1zWjafQh0rmR6QdSXiRpOkQuTeJda
         lsfTADdN/m+SDuI1uyHKzg/wm0NNxQ5O207jOkqPH3TFMGTIGHVAcolu0uZ9BkqMJsqA
         slU2BdSxotMWHqVqoyPeQLhfxKOOyTu5xiKc86fy91aF5f9VkMObCNLCfT9VecshC/ay
         7exQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6JDxfU46dSrqa+HvYNkXDGqrZviuNMy7Z9ugpvz+zz4fziyUki1npZ0dyhdvEN3l9KB24zlRZsvXqhpg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsdtZmGHGmhxCSiZBdUpsuj6mGOs9nl62Jy230AEAhYnfZC1UQ
	xYNzOGc8VaawS7uTp9CQadNLaoyR6Jbmw7EfQy9ddEY3ZX0u/rRboA07XvSvbjJ28L6l0NgfFZd
	Cr39gJPCWBrv90exR0SNAEL8MfFKDzrj9mb+j7w==
X-Gm-Gg: ASbGncvN/QnD2+MF25pUpInYq/r+0Q9UQITlfnyT7XOyz8WtFE3SppaEavMj7Yl6EnZ
	3l3COEh9O9oiu4Zthy/s4o9Xlmz5fRFlCl7grk0MlX9Slakq2NTCj9KcN4SgEnxPF+9FMmVO8HH
	yfNy2BoHqYH9YwNty5YeTEVB9fWpUfrLx65rSwJ97wJuJ1tyLecQTYiTSi31qz
X-Google-Smtp-Source: AGHT+IF48flZYNk+YO92lTcI4xK0KZJsxFwCMsBP9ivkrbDJj57LOF+fPF5jQfMsA9Cn6stG3kjzEOQY6ms+eoLQc1s=
X-Received: by 2002:a17:906:f587:b0:ac1:e881:8997 with SMTP id
 a640c23a62f3a-ac7d6c9f74fmr1690319666b.3.1744120624595; Tue, 08 Apr 2025
 06:57:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250122-add-mtk-isp-3-0-support-v8-0-a3d3731eef45@baylibre.com>
 <20250122-add-mtk-isp-3-0-support-v8-4-a3d3731eef45@baylibre.com> <b68208ea56f297fab0a0c290e73a8671366735b6.camel@mediatek.com>
In-Reply-To: <b68208ea56f297fab0a0c290e73a8671366735b6.camel@mediatek.com>
From: Julien Stephan <jstephan@baylibre.com>
Date: Tue, 8 Apr 2025 15:56:51 +0200
X-Gm-Features: ATxdqUFS9UWyQm5VlU8vEK9QeSLji9-pVMuKN2hnPjsQ_fZ62HhsLvXH6NYRKbg
Message-ID: <CAEHHSvYcet16TrWRbE=nkyS-0jXNbB+=knL0zUKLbnqcYBaSpA@mail.gmail.com>
Subject: Re: [PATCH v8 4/5] media: platform: mediatek: isp: add mediatek
 ISP3.0 camsv
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Cc: "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, 
	=?UTF-8?B?QW5keSBIc2llaCAo6Kyd5pm655qTKQ==?= <Andy.Hsieh@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"mchehab@kernel.org" <mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"paul.elder@ideasonboard.com" <paul.elder@ideasonboard.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"fsylvestre@baylibre.com" <fsylvestre@baylibre.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"pnguyen@baylibre.com" <pnguyen@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 20 mars 2025 =C3=A0 03:18, CK Hu (=E8=83=A1=E4=BF=8A=E5=85=89) <ck.=
hu@mediatek.com> a =C3=A9crit :
>
> On Wed, 2025-01-22 at 14:59 +0100, Julien Stephan wrote:
> > External email : Please do not click links or open attachments until yo=
u have verified the sender or the content.
> >
> >
> > From: Phi-bang Nguyen <pnguyen@baylibre.com>
> >
> > This driver provides a path to bypass the SoC ISP so that image data
> > coming from the SENINF can go directly into memory without any image
> > processing. This allows the use of an external ISP.
> >
> > Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
> > Signed-off-by: Florian Sylvestre <fsylvestre@baylibre.com>
> > [Paul Elder fix irq locking]
> > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Co-developed-by: Julien Stephan <jstephan@baylibre.com>
> > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > ---
>
> [snip]
>
> > +
> > +void mtk_camsv_setup(struct mtk_cam_dev *cam_dev, unsigned int count,
> > +                    u32 w, u32 h, u32 bpl, u32 mbus_fmt)
> > +{
> > +       const struct mtk_cam_conf *conf =3D cam_dev->conf;
> > +       const struct mtk_cam_format_info *fmtinfo;
> > +       struct mtk_cam_dev_buffer *buf;
> > +       unsigned long flags;
> > +       unsigned int i;
> > +       u32 tmp;
> > +
> > +       for (i =3D 0; i < count; i++)
> > +               mtk_camsv_fbc_inc(cam_dev);
>
> I think you should call mtk_camsv_fbc_inc() only after mtk_camsv_update_b=
uffers_add().
>
> > +
> > +       fmtinfo =3D mtk_cam_format_info_by_code(mbus_fmt);
> > +
> > +       mtk_camsv_tg_write(cam_dev, CAMSV_TG_SEN_MODE, conf->tg_sen_mod=
e);
> > +
> > +       mtk_camsv_tg_write(cam_dev, CAMSV_TG_SEN_GRAB_PXL,
> > +                            (w * fmtinfo->w_factor) << 16U);
> > +
> > +       mtk_camsv_tg_write(cam_dev, CAMSV_TG_SEN_GRAB_LIN, h << 16U);
> > +
> > +       /* YUV_U2S_DIS: disable YUV sensor unsigned to signed */
> > +       mtk_camsv_tg_write(cam_dev, CAMSV_TG_PATH_CFG, 0x1000U);
> > +
> > +       /* Reset cam */
> > +       mtk_camsv_write(cam_dev, CAMSV_SW_CTL, CAMSV_SW_RST);
> > +       mtk_camsv_write(cam_dev, CAMSV_SW_CTL, 0x0U);
> > +       mtk_camsv_write(cam_dev, CAMSV_SW_CTL, CAMSV_IMGO_RST_TRIG);
> > +
> > +       readl_poll_timeout_atomic(cam_dev->regs + CAMSV_SW_CTL, tmp,
> > +                                 (tmp =3D=3D (CAMSV_IMGO_RST_TRIG |
> > +                                          CAMSV_IMGO_RST_ST)), 10, 200=
);
> > +
> > +       mtk_camsv_write(cam_dev, CAMSV_SW_CTL, 0x0U);
> > +
> > +       mtk_camsv_write(cam_dev, CAMSV_INT_EN, INT_ST_MASK_CAMSV);
> > +
> > +       mtk_camsv_write(cam_dev, CAMSV_MODULE_EN,
> > +                         conf->module_en | fmtinfo->module_en_pak);
> > +       mtk_camsv_write(cam_dev, CAMSV_FMT_SEL, fmtinfo->fmt_sel);
> > +       mtk_camsv_write(cam_dev, CAMSV_PAK, fmtinfo->pak);
> > +
> > +       mtk_camsv_img0_write(cam_dev, CAMSV_IMGO_SV_XSIZE, bpl - 1U);
> > +       mtk_camsv_img0_write(cam_dev, CAMSV_IMGO_SV_YSIZE, h - 1U);
> > +
> > +       mtk_camsv_img0_write(cam_dev, CAMSV_IMGO_SV_STRIDE,
> > +                              fmtinfo->imgo_stride | bpl);
> > +
> > +       mtk_camsv_img0_write(cam_dev, CAMSV_IMGO_SV_CON, conf->imgo_con=
);
> > +       mtk_camsv_img0_write(cam_dev, CAMSV_IMGO_SV_CON2, conf->imgo_co=
n2);
> > +
> > +       /* Set buf addr */
> > +       spin_lock_irqsave(&cam_dev->buf_list_lock, flags);
> > +       buf =3D list_first_entry_or_null(&cam_dev->buf_list,
> > +                                      struct mtk_cam_dev_buffer,
> > +                                      list);
> > +       if (buf)
> > +               mtk_camsv_update_buffers_add(cam_dev, buf);
> > +       spin_unlock_irqrestore(&cam_dev->buf_list_lock, flags);
> > +
> > +       /* CMOS_EN first */
> > +       mtk_camsv_tg_write(cam_dev, CAMSV_TG_SEN_MODE,
> > +                            mtk_camsv_tg_read(cam_dev, CAMSV_TG_SEN_MO=
DE) |
> > +                            CAMSV_TG_SEN_MODE_CMOS_EN);
> > +
> > +       /* finally, CAMSV_MODULE_EN : IMGO_EN */
> > +       mtk_camsv_write(cam_dev, CAMSV_MODULE_EN,
> > +                         mtk_camsv_read(cam_dev, CAMSV_MODULE_EN) |
> > +                         CAMSV_MODULE_EN_IMGO_EN);
> > +}
> > +
>
> [snip]
>
> > +
> > +static int mtk_camsv_runtime_resume(struct device *dev)
> > +{
> > +       struct mtk_cam_dev *cam_dev =3D dev_get_drvdata(dev);
> > +       struct vb2_queue *vbq =3D &cam_dev->vdev.vbq;
> > +       struct mtk_cam_dev_buffer *buf;
> > +       unsigned long flags =3D 0;
> > +       int ret;
> > +
> > +       ret =3D clk_bulk_prepare_enable(cam_dev->num_clks, cam_dev->clk=
s);
> > +       if (ret) {
> > +               dev_err(dev, "failed to enable clock:%d\n", ret);
> > +               return ret;
> > +       }
> > +
> > +       if (vb2_is_streaming(vbq)) {
> > +
> > +               spin_lock_irqsave(&cam_dev->buf_list_lock, flags);
> > +               buf =3D list_first_entry_or_null(&cam_dev->buf_list,
> > +                                              struct mtk_cam_dev_buffe=
r,
> > +                                              list);
> > +               if (buf)
> > +                       mtk_camsv_update_buffers_add(cam_dev, buf);
>
> I don't know, when suspend, the register value would be kept or not.
> If register is not kept, I think you should re-program all register in mt=
k_camsv_setup().
> But it seems it's not necessary, so the register is kept and you don't ne=
ed to set register again.
> So this mtk_camsv_update_buffers_add() is redundant.
>
> > +
> > +               spin_unlock_irqrestore(&cam_dev->buf_list_lock, flags);
> > +
> > +               /* Stream on the sub-device */
> > +               ret =3D v4l2_subdev_enable_streams(&cam_dev->subdev,
> > +                                                cam_dev->subdev_pads[M=
TK_CAM_CIO_PAD_VIDEO].index,
> > +                                                BIT(0));
> > +
> > +               if (ret)
> > +                       goto fail_no_stream;
> > +       }
> > +
> > +       return 0;
> > +
> > +fail_no_stream:
> > +       mtk_cam_vb2_return_all_buffers(cam_dev, VB2_BUF_STATE_QUEUED);
> > +       return ret;
> > +}
> > +
> > +static const struct dev_pm_ops mtk_camsv_pm_ops =3D {
> > +       SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> > +                               pm_runtime_force_resume)
> > +       SET_RUNTIME_PM_OPS(mtk_camsv_runtime_suspend,
> > +                          mtk_camsv_runtime_resume, NULL)
> > +};
> > +#endif
> > +
>
> [snip]
>
> > +/* -------------------------------------------------------------------=
----------
> > + * Format Information
> > + */
> > +
> > +static const struct mtk_cam_format_info mtk_cam_format_info[] =3D {
> > +       {
> > +               .fourcc =3D V4L2_PIX_FMT_SBGGR8,
> > +               .code =3D MEDIA_BUS_FMT_SBGGR8_1X8,
> > +               .bpp =3D 8,
> > +               .w_factor =3D 1,
> > +               .module_en_pak =3D CAMSV_MODULE_EN_PAK_EN,
> > +               .pak =3D CAMSV_PAK_PAK_MODE_RAW_8
> > +                       | CAMSV_PAK_PAK_DBL_MODE_2_PIXELS,
> > +               .fmt_sel =3D CAMSV_FMT_SEL_TG1_FMT_RAW_8,
> > +               .imgo_stride =3D CAMSV_IMGO_SV_STRIDE_BUS_SIZE_EN
> > +                       | CAMSV_IMGO_SV_STRIDE_BUS_SIZE_32,
> > +       }, {
> > +               .fourcc =3D V4L2_PIX_FMT_SGBRG8,
> > +               .code =3D MEDIA_BUS_FMT_SGBRG8_1X8,
> > +               .bpp =3D 8,
> > +               .w_factor =3D 1,
> > +               .module_en_pak =3D CAMSV_MODULE_EN_PAK_EN,
> > +               .pak =3D CAMSV_PAK_PAK_MODE_RAW_8
> > +                       | CAMSV_PAK_PAK_DBL_MODE_2_PIXELS,
> > +               .fmt_sel =3D CAMSV_FMT_SEL_TG1_FMT_RAW_8,
> > +               .imgo_stride =3D CAMSV_IMGO_SV_STRIDE_BUS_SIZE_EN
> > +                       | CAMSV_IMGO_SV_STRIDE_BUS_SIZE_32,
> > +       }, {
> > +               .fourcc =3D V4L2_PIX_FMT_SGRBG8,
> > +               .code =3D MEDIA_BUS_FMT_SGRBG8_1X8,
> > +               .bpp =3D 8,
> > +               .w_factor =3D 1,
> > +               .module_en_pak =3D CAMSV_MODULE_EN_PAK_EN,
> > +               .pak =3D CAMSV_PAK_PAK_MODE_RAW_8
> > +                       | CAMSV_PAK_PAK_DBL_MODE_2_PIXELS,
> > +               .fmt_sel =3D CAMSV_FMT_SEL_TG1_FMT_RAW_8,
> > +               .imgo_stride =3D CAMSV_IMGO_SV_STRIDE_BUS_SIZE_EN
> > +                       | CAMSV_IMGO_SV_STRIDE_BUS_SIZE_32,
> > +       }, {
> > +               .fourcc =3D V4L2_PIX_FMT_SRGGB8,
> > +               .code =3D MEDIA_BUS_FMT_SRGGB8_1X8,
> > +               .bpp =3D 8,
> > +               .w_factor =3D 1,
> > +               .module_en_pak =3D CAMSV_MODULE_EN_PAK_EN,
> > +               .pak =3D CAMSV_PAK_PAK_MODE_RAW_8
> > +                       | CAMSV_PAK_PAK_DBL_MODE_2_PIXELS,
> > +               .fmt_sel =3D CAMSV_FMT_SEL_TG1_FMT_RAW_8,
> > +               .imgo_stride =3D CAMSV_IMGO_SV_STRIDE_BUS_SIZE_EN
> > +                       | CAMSV_IMGO_SV_STRIDE_BUS_SIZE_32,
> > +       }, {
> > +               .fourcc =3D V4L2_PIX_FMT_SBGGR10,
>
> In stream_out_fmts[], it does not declare V4L2_PIX_FMT_SBGGR10.
> So you may remove it in mtk_cam_format_info[], or add it in stream_out_fm=
ts[].
>
> > +               .code =3D MEDIA_BUS_FMT_SBGGR10_1X10,
> > +               .bpp =3D 10,
> > +               .w_factor =3D 1,
> > +               .module_en_pak =3D CAMSV_MODULE_EN_PAK_EN,
> > +               .pak =3D CAMSV_PAK_PAK_MODE_RAW_10
> > +                       | CAMSV_PAK_PAK_DBL_MODE_2_PIXELS,
> > +               .fmt_sel =3D CAMSV_FMT_SEL_TG1_FMT_RAW_10,
> > +               .imgo_stride =3D CAMSV_IMGO_SV_STRIDE_BUS_SIZE_EN
> > +                       | CAMSV_IMGO_SV_STRIDE_BUS_SIZE_32,
> > +       }, {
> > +               .fourcc =3D V4L2_PIX_FMT_SGBRG10,
>
> Ditto.
>
> > +               .code =3D MEDIA_BUS_FMT_SGBRG10_1X10,
> > +               .bpp =3D 10,
> > +               .w_factor =3D 1,
> > +               .module_en_pak =3D CAMSV_MODULE_EN_PAK_EN,
> > +               .pak =3D CAMSV_PAK_PAK_MODE_RAW_10
> > +                       | CAMSV_PAK_PAK_DBL_MODE_2_PIXELS,
> > +               .fmt_sel =3D CAMSV_FMT_SEL_TG1_FMT_RAW_10,
> > +               .imgo_stride =3D CAMSV_IMGO_SV_STRIDE_BUS_SIZE_EN
> > +                       | CAMSV_IMGO_SV_STRIDE_BUS_SIZE_32,
> > +       }, {
> > +               .fourcc =3D V4L2_PIX_FMT_SGRBG10,
>
> Ditto.
>
> > +               .code =3D MEDIA_BUS_FMT_SGRBG10_1X10,
> > +               .bpp =3D 10,
> > +               .w_factor =3D 1,
> > +               .module_en_pak =3D CAMSV_MODULE_EN_PAK_EN,
> > +               .pak =3D CAMSV_PAK_PAK_MODE_RAW_10
> > +                       | CAMSV_PAK_PAK_DBL_MODE_2_PIXELS,
> > +               .fmt_sel =3D CAMSV_FMT_SEL_TG1_FMT_RAW_10,
> > +               .imgo_stride =3D CAMSV_IMGO_SV_STRIDE_BUS_SIZE_EN
> > +                       | CAMSV_IMGO_SV_STRIDE_BUS_SIZE_32,
> > +       }, {
> > +               .fourcc =3D V4L2_PIX_FMT_SRGGB10,
>
> Ditto.
>
> > +               .code =3D MEDIA_BUS_FMT_SRGGB10_1X10,
> > +               .bpp =3D 10,
> > +               .w_factor =3D 1,
> > +               .module_en_pak =3D CAMSV_MODULE_EN_PAK_EN,
> > +               .pak =3D CAMSV_PAK_PAK_MODE_RAW_10
> > +                       | CAMSV_PAK_PAK_DBL_MODE_2_PIXELS,
> > +               .fmt_sel =3D CAMSV_FMT_SEL_TG1_FMT_RAW_10,
> > +               .imgo_stride =3D CAMSV_IMGO_SV_STRIDE_BUS_SIZE_EN
> > +                       | CAMSV_IMGO_SV_STRIDE_BUS_SIZE_32,
> > +       }, {
> > +               .fourcc =3D V4L2_PIX_FMT_SBGGR12,
>
> Ditto.
>
> > +               .code =3D MEDIA_BUS_FMT_SBGGR12_1X12,
> > +               .bpp =3D 12,
> > +               .w_factor =3D 1,
> > +               .module_en_pak =3D CAMSV_MODULE_EN_PAK_EN,
> > +               .pak =3D CAMSV_PAK_PAK_MODE_RAW_12
> > +                       | CAMSV_PAK_PAK_DBL_MODE_2_PIXELS,
> > +               .fmt_sel =3D CAMSV_FMT_SEL_TG1_FMT_RAW_12,
> > +               .imgo_stride =3D CAMSV_IMGO_SV_STRIDE_BUS_SIZE_EN
> > +                       | CAMSV_IMGO_SV_STRIDE_BUS_SIZE_32,
> > +       }, {
> > +               .fourcc =3D V4L2_PIX_FMT_SGBRG12,
>
> Ditto.
>
> > +               .code =3D MEDIA_BUS_FMT_SGBRG12_1X12,
> > +               .bpp =3D 12,
> > +               .w_factor =3D 1,
> > +               .module_en_pak =3D CAMSV_MODULE_EN_PAK_EN,
> > +               .pak =3D CAMSV_PAK_PAK_MODE_RAW_12
> > +                       | CAMSV_PAK_PAK_DBL_MODE_2_PIXELS,
> > +               .fmt_sel =3D CAMSV_FMT_SEL_TG1_FMT_RAW_12,
> > +               .imgo_stride =3D CAMSV_IMGO_SV_STRIDE_BUS_SIZE_EN
> > +                       | CAMSV_IMGO_SV_STRIDE_BUS_SIZE_32,
> > +       }, {
> > +               .fourcc =3D V4L2_PIX_FMT_SGRBG12,
>
> Ditto.
>
> > +               .code =3D MEDIA_BUS_FMT_SGRBG12_1X12,
> > +               .bpp =3D 12,
> > +               .w_factor =3D 1,
> > +               .module_en_pak =3D CAMSV_MODULE_EN_PAK_EN,
> > +               .pak =3D CAMSV_PAK_PAK_MODE_RAW_12
> > +                       | CAMSV_PAK_PAK_DBL_MODE_2_PIXELS,
> > +               .fmt_sel =3D CAMSV_FMT_SEL_TG1_FMT_RAW_12,
> > +               .imgo_stride =3D CAMSV_IMGO_SV_STRIDE_BUS_SIZE_EN
> > +                       | CAMSV_IMGO_SV_STRIDE_BUS_SIZE_32,
> > +       }, {
> > +               .fourcc =3D V4L2_PIX_FMT_SRGGB12,
>
> Ditto.
>
> > +               .code =3D MEDIA_BUS_FMT_SRGGB12_1X12,
> > +               .bpp =3D 12,
> > +               .w_factor =3D 1,
> > +               .module_en_pak =3D CAMSV_MODULE_EN_PAK_EN,
> > +               .pak =3D CAMSV_PAK_PAK_MODE_RAW_12
> > +                       | CAMSV_PAK_PAK_DBL_MODE_2_PIXELS,
> > +               .fmt_sel =3D CAMSV_FMT_SEL_TG1_FMT_RAW_12,
> > +               .imgo_stride =3D CAMSV_IMGO_SV_STRIDE_BUS_SIZE_EN
> > +                       | CAMSV_IMGO_SV_STRIDE_BUS_SIZE_32,
> > +       }, {
> > +               .fourcc =3D V4L2_PIX_FMT_UYVY,
> > +               .code =3D MEDIA_BUS_FMT_UYVY8_1X16,
> > +               .bpp =3D 16,
> > +               .w_factor =3D 2,
> > +               .module_en_pak =3D CAMSV_MODULE_EN_PAK_SEL,
> > +               .pak =3D 0, /* ignored */
> > +               .fmt_sel =3D CAMSV_FMT_SEL_IMGO_BUS_SIZE_16
> > +                       | CAMSV_FMT_SEL_TG1_FMT_YUV422,
> > +               .imgo_stride =3D CAMSV_IMGO_SV_STRIDE_BUS_SIZE_EN
> > +                       | CAMSV_IMGO_SV_STRIDE_BUS_SIZE_16,
> > +       }, {
> > +               .fourcc =3D V4L2_PIX_FMT_VYUY,
> > +               .code =3D MEDIA_BUS_FMT_VYUY8_1X16,
> > +               .bpp =3D 16,
> > +               .w_factor =3D 2,
> > +               .module_en_pak =3D CAMSV_MODULE_EN_PAK_SEL,
> > +               .pak =3D 0, /* ignored */
> > +               .fmt_sel =3D CAMSV_FMT_SEL_IMGO_BUS_SIZE_16
> > +                       | CAMSV_FMT_SEL_TG1_FMT_YUV422,
> > +               .imgo_stride =3D CAMSV_IMGO_SV_STRIDE_BUS_SIZE_EN
> > +                       | CAMSV_IMGO_SV_STRIDE_BUS_SIZE_16,
> > +       }, {
> > +               .fourcc =3D V4L2_PIX_FMT_YUYV,
> > +               .code =3D MEDIA_BUS_FMT_YUYV8_1X16,
> > +               .bpp =3D 16,
> > +               .w_factor =3D 2,
> > +               .module_en_pak =3D CAMSV_MODULE_EN_PAK_SEL,
> > +               .pak =3D 0, /* ignored */
> > +               .fmt_sel =3D CAMSV_FMT_SEL_IMGO_BUS_SIZE_16
> > +                       | CAMSV_FMT_SEL_TG1_FMT_YUV422,
> > +               .imgo_stride =3D CAMSV_IMGO_SV_STRIDE_BUS_SIZE_EN
> > +                       | CAMSV_IMGO_SV_STRIDE_BUS_SIZE_16,
> > +       }, {
> > +               .fourcc =3D V4L2_PIX_FMT_YVYU,
> > +               .code =3D MEDIA_BUS_FMT_YVYU8_1X16,
> > +               .bpp =3D 16,
> > +               .w_factor =3D 2,
> > +               .module_en_pak =3D CAMSV_MODULE_EN_PAK_SEL,
> > +               .pak =3D 0, /* ignored */
> > +               .fmt_sel =3D CAMSV_FMT_SEL_IMGO_BUS_SIZE_16
> > +                       | CAMSV_FMT_SEL_TG1_FMT_YUV422,
> > +               .imgo_stride =3D CAMSV_IMGO_SV_STRIDE_BUS_SIZE_EN
> > +                       | CAMSV_IMGO_SV_STRIDE_BUS_SIZE_16,
> > +       },
> > +};
> > +
>
> [snip]
>
> > +
> > +static void mtk_cam_vb2_buf_queue(struct vb2_buffer *vb)
> > +{
> > +       struct mtk_cam_dev *cam =3D vb2_get_drv_priv(vb->vb2_queue);
> > +       struct mtk_cam_dev_buffer *buf =3D to_mtk_cam_dev_buffer(vb);
> > +       unsigned long flags;
> > +
> > +       /* Add the buffer into the tracking list */
> > +       spin_lock_irqsave(&cam->buf_list_lock, flags);
> > +       if (vb2_start_streaming_called(vb->vb2_queue) && list_empty(&ca=
m->buf_list))
> > +               mtk_camsv_update_buffers_add(cam, buf);
> > +
> > +       list_add_tail(&buf->list, &cam->buf_list);
> > +       spin_unlock_irqrestore(&cam->buf_list_lock, flags);
> > +       if (vb2_start_streaming_called(vb->vb2_queue))
> > +               mtk_camsv_fbc_inc(cam);
>
> I think you should call mtk_camsv_fbc_inc() just after mtk_camsv_update_b=
uffers_add();
>

Hi CK,

Is there any particular reason? I moved it at the bottom, to reduce
the spinlock region as you requested in v7.. OR maybe I am missing
something ?

Cheers
Julien

> > +}
> > +
>
> [snip]
>
> > +
> > +static int mtk_cam_vidioc_try_fmt(struct file *file, void *fh,
> > +                                 struct v4l2_format *f)
> > +{
> > +       struct mtk_cam_video_device *vdev =3D file_to_mtk_cam_video_dev=
ice(file);
> > +       struct v4l2_pix_format_mplane *pix_mp =3D &f->fmt.pix_mp;
> > +       const struct mtk_cam_format_info *fmtinfo;
> > +
> > +       /* Validate pixelformat */
> > +       if (!mtk_cam_dev_find_fmt(vdev->desc, pix_mp->pixelformat))
> > +               pix_mp->pixelformat =3D vdev->desc->fmts[0];
>
> In [1], it says return EINVAL when driver not support this buffer format.
>
> [1] https://docs.kernel.org/userspace-api/media/v4l/vidioc-g-fmt.html#des=
cription
>
> Regards,
> CK
>
> > +
> > +       pix_mp->width =3D clamp_val(pix_mp->width, IMG_MIN_WIDTH, IMG_M=
AX_WIDTH);
> > +       pix_mp->height =3D clamp_val(pix_mp->height, IMG_MIN_HEIGHT,
> > +                                  IMG_MAX_HEIGHT);
> > +
> > +       pix_mp->num_planes =3D 1;
> > +
> > +       fmtinfo =3D mtk_cam_format_info_by_fourcc(pix_mp->pixelformat);
> > +       calc_bpl_size_pix_mp(fmtinfo, pix_mp);
> > +
> > +       /* Constant format fields */
> > +       pix_mp->colorspace =3D V4L2_COLORSPACE_SRGB;
> > +       pix_mp->field =3D V4L2_FIELD_NONE;
> > +       pix_mp->ycbcr_enc =3D V4L2_YCBCR_ENC_DEFAULT;
> > +       pix_mp->quantization =3D V4L2_QUANTIZATION_DEFAULT;
> > +       pix_mp->xfer_func =3D V4L2_XFER_FUNC_DEFAULT;
> > +
> > +       return 0;
> > +}
> > +
>
>
> ************* MEDIATEK Confidentiality Notice ********************
> The information contained in this e-mail message (including any
> attachments) may be confidential, proprietary, privileged, or otherwise
> exempt from disclosure under applicable laws. It is intended to be
> conveyed only to the designated recipient(s). Any use, dissemination,
> distribution, printing, retaining or copying of this e-mail (including it=
s
> attachments) by unintended recipient(s) is strictly prohibited and may
> be unlawful. If you are not an intended recipient of this e-mail, or beli=
eve
> that you have received this e-mail in error, please notify the sender
> immediately (by replying to this e-mail), delete any and all copies of
> this e-mail (including any attachments) from your system, and do not
> disclose the content of this e-mail to any other person. Thank you!
