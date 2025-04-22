Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21735219A91
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 19:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745351222; cv=none; b=j5YNKDo/Yw4uYlIXGDuFWXGOWlKFwBLm5YhsehRxjlaCRuh3+LVhljClcBHFUgQfuHPIl07s2PNZkBJj1QgoiJJ4RklTIqbrGolHLkhvZS1plm6OOW5VfBc3fEzg1gNZT+gJnWIH6NOoS4CFQytehUsQ53KDEsNPcE+0MHSCEcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745351222; c=relaxed/simple;
	bh=t2fNCKroL9F7ZVN7zRq8ikEIYNQqgqm5OYQ+KBoNpnE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O5Wr2JZjncNLXq0cOeVyYWyVJGIO+mL5Rkfd/Lb3zgP4QUxl+MRJQvqMOgNPX9OnZotmWGkHBorMcmH3/nN0QSleD8/N5g0lu53yEUG717hjhHW9AqUTSzdLwlFEtY58vXFjOFMaX9dwtvtY0ZTXsSL3xvnGFTLzMHLqRff/PrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=WpHErqe1; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="WpHErqe1"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c5e39d1db2so296967985a.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 12:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1745351220; x=1745956020; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AZRNUBKg8hwCgXEyYs/1skOhVgOq5no2ClQkvRkjKGA=;
        b=WpHErqe1jgOUWQLxbTmFlO5Q1Ic4DVTdW3nY9SBGuGF3mkBUGpYdF/NemLcm0PNtsN
         xqud7RFnwpVH3/T5eHFxGYd6qoZQMOeeQhOct1XXSIUTlutrQiCwScwP1a5IjZnHeA/S
         nxGnc8inSXDgzBJRex3SIXjbjdHvMz9bKks4CIJhCSonvKkXCYS1m7PUtwZAQnah9fsT
         ncNhoQa6Gr3+el9SlU97//e6MO0OVEIHAg7qSMO0hzH3fFv3MymO2tlqBn5vN6QdZ0N+
         bzg2YBUSpBueZPyedBpTHQLmyehYKB9g6v6pdWgoSqyv3xmJJfPhKjZiAg6A4RJ8sQ5G
         R88g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745351220; x=1745956020;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AZRNUBKg8hwCgXEyYs/1skOhVgOq5no2ClQkvRkjKGA=;
        b=UNLOzZ5bq9unopkBhlPoNDGWbe6sDkK1JqVxvbYs8gcBwZ95d+SiwZltR3nKfodypw
         C2zYfKN+bopW1sf0W2KKdlxf3aUNenu05VqHIJIAhzudHDhGV298HlTwqqd4xBroqMQx
         RQKDlpLyIcAgXfflv3+hc62IKDRgMpRUQUNLC3nlVRIJjghW9t46uWUTJCwTj9misDXw
         ArGRUdU0xka9NbvXUy14LsvFoIZ27kuyxSvKFbJaXUk3DHLJYyAnA4g5xVIVsWplsHFq
         Ns9OKkr0gIJh3T9JnH1ZzGsmaCr75fg/GEyx7mnJC7kRR9+l6hG5FAB7u1m/ENUfav//
         /XQg==
X-Forwarded-Encrypted: i=1; AJvYcCXt9ibImiVFOj5rieegm+lhpArcWSYtZBhixazdID+iaWPWxftamZ+rtJDNH5rE3poiv60YqtZlsQJS6Hs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIUUvG/1Ska0SRdxmrMV3TiGxsAcQ/9q8mZod9DAi/KgCjARwO
	HvpyTviuxB40d/jRCILpV5t+AUFznSI5UEFT0XVX4wmrYpsfNThGtcbDT8sbxpU=
X-Gm-Gg: ASbGncvLWXa9WB3/kFnmWRWXYC03ONiEvHIG2fzEky2TxZe0NNGhivg02yCZMo8HnJV
	y+v4ShCDbgd/fR7tsHLc7ZDmyNinTjT/YMW3/MFUSNqWP5g+VVWCtIspXwk6Pf6oao4WvisBpZm
	pTgB54Q6HDkoKeLVWlq0paMnAnD4Nhwf/A53gG5Uj4hpgfRvKW1h5A73XHHeaYv9TrruEy25cDP
	BCHFzh8uH5vJ4kDP0ZL8Quw5JBZ/4QGfyDlPHqsJ5BVCOr53yD2WSmqNEu43WfNF+wcRLM5FZW/
	lpMUkNAn/Tpqi8Rw+/VrvRDdnBmQJUyioY7z55UJIqpxKZYWqkyA2xKt
X-Google-Smtp-Source: AGHT+IFgS/Q0V6U15helS9ADvq78s/nB3ALXSasniZ8+SnkCEwwfFJHhc6L1EiB4G7ySAUTvyb76hA==
X-Received: by 2002:a05:620a:4510:b0:7c5:54d8:3d43 with SMTP id af79cd13be357-7c928053ba5mr2594224685a.58.1745351219854;
        Tue, 22 Apr 2025 12:46:59 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:9913::5ac? ([2606:6d00:15:9913::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925a6e6absm593612885a.19.2025.04.22.12.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 12:46:59 -0700 (PDT)
Message-ID: <39053a9e0767289cf822beb350819d366994dd0a.camel@ndufresne.ca>
Subject: Re: [PATCH] media: amphion: Start decoding job when both queue are
 on
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Ming Qian <ming.qian@nxp.com>, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl
Cc: shawnguo@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 xiahong.bao@nxp.com, 	eagle.zhou@nxp.com, tao.jiang_2@nxp.com,
 ming.qian@oss.nxp.com, 	imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org
Date: Tue, 22 Apr 2025 15:46:57 -0400
In-Reply-To: <20240719075007.384342-1-ming.qian@nxp.com>
References: <20240719075007.384342-1-ming.qian@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

Le vendredi 19 juillet 2024 =C3=A0 16:50 +0900, Ming Qian a =C3=A9crit=C2=
=A0:
> Start the decoding job when both queue are on, except the for the
> initialization sequence.
>=20
> Especially when seeking, the capture streamon may be called after output
> streamon, driver will start to decode job immediately after output
> streamo, if seek to a new resolution, then the source change flow may be
> mixed with the seek, it will cause confusion, then may led to pipeline
> hang.
>=20
> When both output and capture queue are on, it's ready to start the
> decoding job, and it can avoid the above potential problem.

This commit message needs some work and I'm unsure I understand its
meaning. After reading the change, I am under the impression that you
simply say that once the seq_hdr is found, the driver should keep
delaying the processing of output buffer until the capture queue is
ready ?

>=20
> Signed-off-by: Ming Qian <ming.qian@nxp.com>
> ---
> =C2=A0drivers/media/platform/amphion/vdec.c | 18 +++++++++++++++++-
> =C2=A01 file changed, 17 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/platfo=
rm/amphion/vdec.c
> index 6a38a0fa0e2d..ca8f7319503a 100644
> --- a/drivers/media/platform/amphion/vdec.c
> +++ b/drivers/media/platform/amphion/vdec.c
> @@ -1363,6 +1363,12 @@ static int vdec_process_output(struct vpu_inst *in=
st, struct vb2_buffer *vb)
> =C2=A0	if (inst->state =3D=3D VPU_CODEC_STATE_STARTED)
> =C2=A0		vdec_update_state(inst, VPU_CODEC_STATE_ACTIVE, 0);
> =C2=A0
> +	if (vdec->seq_hdr_found &&
> +	=C2=A0=C2=A0=C2=A0 !vb2_start_streaming_called((v4l2_m2m_get_dst_vq(ins=
t->fh.m2m_ctx)))) {
> +		vpu_trace(inst->dev, "[%d] capture is not ready, pend input frame\n", =
inst->id);
> +		return -EINVAL;

I got really confused by this error return value. Its clearly not an
error, but just a delay. I think before we add more on top, you should
turn all these function for which the return value is unused to void.
And use a plain "return;" here. That applies to all similar ops.

> +	}
> +
> =C2=A0	ret =3D vpu_iface_get_stream_buffer_desc(inst, &desc);
> =C2=A0	if (ret)
> =C2=A0		return ret;
> @@ -1555,6 +1561,16 @@ static int vdec_start(struct vpu_inst *inst)
> =C2=A0	return ret;
> =C2=A0}
> =C2=A0
> +static void vdec_enqueue_pending_frames(struct vpu_inst *inst)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < v4l2_m2m_num_src_bufs_ready(inst->fh.m2m_ctx); i++) {
> +		if (vpu_process_output_buffer(inst))
> +			break;

How well does this work ? Previous you made good care of interleaving
the processing output and capture, which I could imaging prevents the
hardware from starving ?

> +	}
> +}
> +
> =C2=A0static int vdec_start_session(struct vpu_inst *inst, u32 type)
> =C2=A0{
> =C2=A0	struct vdec_t *vdec =3D inst->priv;
> @@ -1573,10 +1589,10 @@ static int vdec_start_session(struct vpu_inst *in=
st, u32 type)
> =C2=A0	if (V4L2_TYPE_IS_OUTPUT(type)) {
> =C2=A0		vdec_update_state(inst, vdec->state, 1);
> =C2=A0		vdec->eos_received =3D 0;
> -		vpu_process_output_buffer(inst);
> =C2=A0	} else {
> =C2=A0		vdec_cmd_start(inst);
> =C2=A0	}
> +	vdec_enqueue_pending_frames(inst);

Was this intentional to reverse the STREAMON(CAPTURE) call flow to:

  - process_capture() (inside vdec_cmd_start())
  - proces_output() x n

Nicolas

> =C2=A0	if (inst->state =3D=3D VPU_CODEC_STATE_ACTIVE)
> =C2=A0		vdec_response_fs_request(inst, false);
> =C2=A0

