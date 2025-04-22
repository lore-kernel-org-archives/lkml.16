Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC59244693
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 20:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745355296; cv=none; b=BAVOm4Dr/UgCfYvgOqulG76cMlS8LNP4dxZfx/04JnVRCE3hNcfTtjj6uoBJy94IThr5i9AeEFF9Yy07qLLT0PWPdp8cNL+dlQxtz1znsb/XNTzHE1seCxnNmOY3PwuXVoTj8tT+HuDGXi9zvohzFkZnQBxwT5WvdLGdC6fehPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745355296; c=relaxed/simple;
	bh=KwzvkXe0blAugUn90Fj5tIzRzj+wckM6NLbfvnfqeDo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UFGqYFGBY62KXNwbvjJIXipmKNhkJgZOosTq3ew0B8pdj2MsmnC70jh/r6KVOqHkr2YcIQaSXWaM6e1xXa8ERCxQOP/Im8P0gqrpIqeLicxB1Hqcs5vV9gk0eAMMo/lwfFWjgkGR7WyiGDpZ799aMuW2MqlYGhRun+lySYL64yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=LHOi+pgR; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="LHOi+pgR"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c597760323so524324785a.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 13:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1745355293; x=1745960093; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=h2racLDTZ4BkogFjHmNJhfnBse5H17sx7z3H/zKT9ZY=;
        b=LHOi+pgRdejzKZ94k/OQ5SlJApRjgwlPzWN9WjxZY8/dZooMZ8qDLAJ35tWzo2wDJ8
         Kl/Z979P384FddF5Re83uYZfEMTZD6Ga3lbRoZtMWR6XTw+4jS/4seAIVwe1dy21Zl8C
         YDufE/TME2FSfAu+y3dtDO5Kmt4v9vV/Z+dmiNg6peUxzMlH1kmkGda+nAD+HydySG2l
         DfwJnkDSPu47hixYxnBbONqW+qTs2fQ3OdNL+0bIRZjAxhaU8GnXtKLlBP6zfTq7FGhQ
         PQ1YGd+CfztedCXeZ7PQKmoHsxYswvKexgG93wrGaXpSluBZxn5i45P2ox/Vt33QUqgq
         Xjgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745355293; x=1745960093;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h2racLDTZ4BkogFjHmNJhfnBse5H17sx7z3H/zKT9ZY=;
        b=q8AMQBJ0m4rtVrx45y7n74NCT4K8mrDO6EzIuf2oaemUnW5CIf/49Ad1VlyRIcCsk9
         dNaIGIuv7xFuPQSHDMpq6aJ6q9DQFUnD5DH6pBtl91zBHsWWkS4/HTw3DQB9gM7xjQjL
         Q1tzsz7TkhRxdEQhp+awcekJPpKFYstRJRgStOsdZXlq1F9EEuO46xRUSiFVeIZwRUr3
         RKZB/HtsLpSPuUByfd7tbppD2n6CDoU6rsUFKEvv77rZBrLdc5o3E36g5WqraKo2t8zW
         IzUCYQwVuahszwtglo1oC3C9nAWFEUOftYStmoXqKTw7zqmreCbMJhBHnYa/F3OxmG2t
         O2zQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgFA1c9V4PL6NazxwB2e37AMu3JQqHzagl2siyMsBfZz2QOmUqTPhff86g/T8tdPsWoR+LmgakN8RYpIY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhLqcKGdYU/Wqm2KHk7WZLHmx8OIVxXCtserbA5WJFc+xfl2Sy
	a8lr3df1ghnaxj+eEYpi5PtN8QE2+doGq0hZbxmYuBSUqofQu44DVUWHwE0lb20=
X-Gm-Gg: ASbGncuRj5AZ5wA3NJt2wqEegsXstIcbRO8U8igSUqcSOvJFxaVmL2iNwMvfv+8Ftp6
	QfsyA5GLYAchbUrmMhbAtNSgZqZuMh9Dhn0C+ffa1EaFtSjWXMtXfjARsewk+lceOFn345osW+7
	6vJwjChOSJdi2Z/Mwo22W0yEVDF+Ki0vDFYl4lnvFrZEovHJ0VdN/WHcQCk0pYCLanHt0Fd8Ovn
	PycxN9/1tgoRiQe2AUw4oV78zmOpQozx+vwWVnSA6ReqyKIb9ymx2CHGB6qDfWh7R8FsjlMwU3N
	tD4I5gULcO6Y2k58IdpBmSiQIJ7h00A8t9swWLViW+g1sw==
X-Google-Smtp-Source: AGHT+IG7H1gakbIZ84kGicq0NVQy0jmgb+jY1czwu6X0ujlQIaddI3Iuf1eaCrSBqUaX2okXmWyUXQ==
X-Received: by 2002:a05:620a:bc4:b0:7c5:562d:ccf8 with SMTP id af79cd13be357-7c927f76f3cmr2993734385a.8.1745355293398;
        Tue, 22 Apr 2025 13:54:53 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:9913::5ac? ([2606:6d00:15:9913::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925b778b5sm595240385a.102.2025.04.22.13.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 13:54:52 -0700 (PDT)
Message-ID: <a2cb7a26f120558ab7b84a6f954188c8e61f37a8.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mediatek: vcodec: Enable HEVC main still picture
 decode
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Nathan Hebert <nhebert@chromium.org>, Yunfei Dong
 <yunfei.dong@mediatek.com>,  Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Tue, 22 Apr 2025 16:54:51 -0400
In-Reply-To: <1f1e41700b16eef7fe790b9b14d6ccfd157f67ad.camel@ndufresne.ca>
References: 
	<20250211-enable_hevc_still_picture-v1-1-0c06c0c9add2@chromium.org>
		 <f257832e823d23c8324a9eaf7890dd4b6d50a6f0.camel@ndufresne.ca>
	 <1f1e41700b16eef7fe790b9b14d6ccfd157f67ad.camel@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le lundi 17 f=C3=A9vrier 2025 =C3=A0 14:28 -0500, Nicolas Dufresne a =C3=A9=
crit=C2=A0:
> aLe lundi 17 f=C3=A9vrier 2025 =C3=A0 13:45 -0500, Nicolas Dufresne a =C3=
=A9crit=C2=A0:
> > Hi Nathan,
> >=20
> > Le mardi 11 f=C3=A9vrier 2025 =C3=A0 16:34 -0800, Nathan Hebert a =C3=
=A9crit=C2=A0:
> > > Mediatek devices that support HEVC also support the main still pictur=
e
> > > profile, but today, the main still picture profile is excluded.
> > >=20
> > > This removes the skip mask for HEVC, and enables the main still
> > > picture profile decoding.
> > >=20
> > > Signed-off-by: Nathan Hebert <nhebert@chromium.org>
> > > ---
> > > On Mediatek devices that support HEVC decoding, HEVC Main Still Pictu=
re
> > > profile is also supported by the SOC and firmware. However, this
> > > capability is turned off in the vcodec driver.
> > >=20
> > > This removes the code that disables HEVC Main Still Picture profile
> > > decoding. Validation of the decoder has been done via V4L2-backed
> > > Android CTS tests on an MT8196 device.
> >=20
> > While its nice to know that you are working on upcoming SoC, we need
> > confirmation that this is working on all the upstream stateless
> > decoders supported: 8183, 8186, 8192, 8195. Ideally testing on 8188,
> > which I can see has merged support without the linux-firmware file to
> > go with it.
> >=20
> > I'll wait for that and Yunfei's ack before picking it. Yunfei, please
> > fix the situation with 8188 in linux-firmware, and CC me.
>=20
> In case this is useful, we recommend providing fluster scores for the
> codec, which in that case runs some public ITU conformance vectors.
> Since most of the testing has been done with GStreamer, you may be able
> to find old report and confirm it it works. GStreamer does not
> currently filter the profile/level (on my todo), so it will try anyway.
> IPRED_B_Nokia_3 is the one vector in the base suite that expose that
> profile.
>=20
> resources/JCT-VC-HEVC_V1/IPRED_B_Nokia_3/IPRED_B_Nokia_3.bit
> =C2=A0 Stream #0:0: Video: hevc (Main Still Picture), none, 1920x1080, 25=
 fps, 1200k tbr, 1200k tbn

Ran the test myself on MT8195 and can confirm it passes if you ignore
the profiles.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

>=20
> regards,
> Nicolas
>=20
> >=20
> > regards,
> > Nicolas
> >=20
> > > ---
> > > =C2=A0.../media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
less.c=C2=A0=C2=A0 | 2 --
> > > =C2=A01 file changed, 2 deletions(-)
> > >=20
> > > diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcode=
c_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcod=
ec_dec_stateless.c
> > > index afa224da0f41..d873159b9b30 100644
> > > --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_s=
tateless.c
> > > +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_s=
tateless.c
> > > @@ -152,8 +152,6 @@ static const struct mtk_stateless_control mtk_sta=
teless_controls[] =3D {
> > > =C2=A0			.id =3D V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
> > > =C2=A0			.def =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
> > > =C2=A0			.max =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
> > > -			.menu_skip_mask =3D
> > > -				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
> > > =C2=A0		},
> > > =C2=A0		.codec_type =3D V4L2_PIX_FMT_HEVC_SLICE,
> > > =C2=A0	},
> > >=20
> > > ---
> > > base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
> > > change-id: 20250211-enable_hevc_still_picture-26b35eb08270
> > >=20
> > > Best regards,
> >=20
