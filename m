Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1774F28399
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 13:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744981926; cv=none; b=QOtKBhSlPrtFlFne6tpPGVuCjWkmWeuPkByHTve/UileusoN1T524FefcaXvw3SgLHydWXjRJXSCYVHoCCQxIVJam9EafG7KoRuAFoqeEEF3WpmGvI55I0PoUCVcYgciNI+Q4DY9eNe4RMChDtFeUubzwOMOX45yfaq00O9EmSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744981926; c=relaxed/simple;
	bh=Fpyrr7Bk+jIkRZ6OSahA38xlx+xTco2EMP0Gwx5qCPs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hVVucZxD384pweHUtR1SZEo8z8DYdaISOcU0m7O/0Y0WRbI7ynGTZL4cXxdTsCEVuSuwY9oMzUS9evH/6zCW8zFHaOzQkTNZh9lR1PcUX6Ekg5jNeVu8wA71g1Yt37t+Sm91iGkXqyxyJVia5LjNtooOYe5ClojNHyTUosSa2k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=BCwP7gHG; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="BCwP7gHG"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7c592764e54so217666085a.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 06:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1744981923; x=1745586723; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aMAgxXTmZLXXT9p3fPBY8vuGF8bkgr7l60OmevMYynw=;
        b=BCwP7gHGskKa2yvM6JNu6BG4B8gT5gHHWnMBLBG0lXuYTWPpnXFkE3SapTtbzY4fYf
         R+CgF94ZKN8tiANXjr6LoVV23SZHDyoIwQBhLIIa8cf/6Ts7NP4iEUAQdn00ZLfUe08Y
         cZgRifqpKviyCSl2uYzzpzwgnPIyB9s+vxIJI6naQgjSp9nHUpZahNquh3n72hDwO+CG
         mxmxQFtP1hc//dMNm5JuisL/Hz5puqy++FdDcv3USgWQFbhG5psenB+h1yJ2eVl84F+w
         Npej5ZDO95Ftr5aF1cven1ZkbdnL+AGS+NLIRS+7w3HKv5G1vMUKkbdHRB0W6Q4LO3ns
         SKRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744981923; x=1745586723;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aMAgxXTmZLXXT9p3fPBY8vuGF8bkgr7l60OmevMYynw=;
        b=rQ7eNAsM6G6nw6HSjXmh091w/1IrrrP6rnQRPHEM6XOYWk6HMiiFXz7yK3n2Dabdut
         Oq7vOptzXR/MJOK0cUW0Xk2rAgZJlXbcHXGJxUlxUpHDykkBosgtf0s4+1CGuvoXD1Vn
         aC9amp6mbzY5aCU/ENy4gEQon8NSqpPjQK9UvAIP03YgspXOrUule5osHuUZhJC7K2cG
         uERW141o7M6en9b7EQnDn31yyBgT1ei6D/7B3Ghhxjgs5Tf58NjkDqsQmd+/o46lI4td
         +KYXfEzvm+9xtL0Nrg3XysPflVVs3Muf1FhD+hSlxgs0rhYFBQ9dZE8CvJEmV8/cXKpY
         HGNw==
X-Forwarded-Encrypted: i=1; AJvYcCUE74QCrvM7NjTvYAJMQ1A58+JJaEc8rZhmEcv06OFbisCmBh2D3YPqLJrsKEf7rjFr3OhacBiMmSM4yE4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCBT6AjQUNw0yBsEV+uIr5j9f54N2iRgGFrTt24ftsY3ElXhEi
	VpTdZEe1qeS/AsaUnnvNoSZs9UM+wKg+mNRytGAoj7QK2ylCHGzTBCJNAKAWDFs=
X-Gm-Gg: ASbGncudRf5rM5vCiYuOOE82hM0cIZ+FvfmgYyGFRHjhmGOqVVUdQNBpRnxVadbVppv
	UWDIaTX/blvfBIpiVltgUbDVgJkZ0XmKcWCIOGbwh0YkEE+JY78MOPnLq2XXqmGu3Zprw3aW21o
	O5TJQDVAcRPAxc8V5yImxWP4+izhtEvhVF96DTdNRUB7gGWSBnfsQKaI9KJUalluiABJMYuO3tL
	JZz8MLFqE8WnL8l2LQR+XxB2hc7PVTYy0WKpTfJO7lGk0LK+mAs7h9MBZv48FybEwqxr2cQyt8o
	HBpvQnXQynmb8OcMWYupnjuTB9sZhj+xXyyvFhm3IQIGcw==
X-Google-Smtp-Source: AGHT+IH/XoxSUArL6cVz4iPViec3wwwSipsn5opstVs0fi+r5E8l1PRZpdXcrSGXm10//nNhqxZmPA==
X-Received: by 2002:a05:620a:c4a:b0:7c5:af68:5019 with SMTP id af79cd13be357-7c927f97bbamr406396985a.13.1744981922969;
        Fri, 18 Apr 2025 06:12:02 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:9913::c41? ([2606:6d00:15:9913::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925a7147esm106040285a.14.2025.04.18.06.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 06:12:02 -0700 (PDT)
Message-ID: <4549d9abf5f93fb6f417d0fb8f73877272d7c495.camel@ndufresne.ca>
Subject: Re: [PATCH] media: imx-jpeg: Drop the first error frames
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: ming.qian@oss.nxp.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	mirela.rabulea@oss.nxp.com
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
 linux-imx@nxp.com, 	imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org
Date: Fri, 18 Apr 2025 09:12:01 -0400
In-Reply-To: <20250305022513.2312731-1-ming.qian@oss.nxp.com>
References: <20250305022513.2312731-1-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le mercredi 05 mars 2025 =C3=A0 10:25 +0800, ming.qian@oss.nxp.com a =C3=A9=
crit=C2=A0:
> From: Ming Qian <ming.qian@oss.nxp.com>
>=20
> When an output buffer contains error frame header,
> v4l2_jpeg_parse_header() will return error, then driver will mark this
> buffer and a capture buffer done with error flag in device_run().
>=20
> But if the error occurs in the first frames, before setup the capture
> queue, there is no chance to schedule device_run(), and there may be no
> capture to mark error.
>=20
> So we need to drop this buffer with error flag, and make the decoding
> can continue.
>=20
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>

This seems like a relatively important bug fix to be, perhaps you can
offer "Fixes" tag to this commit ?

> ---
> =C2=A0drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 9 +++++++++
> =C2=A01 file changed, 9 insertions(+)
>=20
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/med=
ia/platform/nxp/imx-jpeg/mxc-jpeg.c
> index 1221b309a916..0e6ee997284b 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> @@ -1921,6 +1921,15 @@ static void mxc_jpeg_buf_queue(struct vb2_buffer *=
vb)
> =C2=A0	if (ret)
> =C2=A0		jpeg_src_buf->jpeg_parse_error =3D true;
> =C2=A0
> +	/*
> +	 * if the capture queue is not setup, the device_run() won't be schedul=
ed,
> +	 * need to drop the error buffer, so that the decoding can continue
> +	 */
> +	if (jpeg_src_buf->jpeg_parse_error &&
> +	=C2=A0=C2=A0=C2=A0 !vb2_is_streaming(v4l2_m2m_get_dst_vq(ctx->fh.m2m_ct=
x))) {
> +		v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
> +		return;
> +	}

Looks good to me, an alternative implementation could have been to
merged into the error branch above.

 	if (ret) {
 		jpeg_src_buf->jpeg_parse_error =3D true;
=20
		/*
	 	 * If the capture queue is not setup, the device_run() won't
		 * be scheduled, drop the error buffer so that the decoding
		 * can continue.
	 	 */
		if (!vb2_is_streaming(v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx))) {
			v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
			return;
		}
	}

With or without this suggestion, but with the Fixes tag, you can include in=
 your v2:

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> =C2=A0end:
> =C2=A0	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
> =C2=A0}
