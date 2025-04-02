Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8A610F9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 15:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743608102; cv=none; b=Yn4RM6qmLalI0tmNfWXMA27bLapeiaBcQcWInKgAseZh83EmgoWx36BvcNfGem6cMZ32werL3RNaBYYvJJWhJh+eD4owO2dp2ABukotUATx6fE7F1Lf4NdGcVa+1GZ5zFaQFoaeXYZ95TQXF2MSK9ct1bCJJheVZgx/CnkeAhpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743608102; c=relaxed/simple;
	bh=K682Bd58fkkp1pJQ7mnKCEx8s1kZZBJxAHAaFRvYPxg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pAfOkGO/Byk3oMBK3Ngb0QgOLPwluOZBNncvBWmtwYOlRh5VsKXuFRsWX4n2O9xz8UXFPoam0X8Ob7YZjyJhrVxEc/1kUy/NXEgUdOPvywp7VrCiXob/4rpmtYfH1XFdIC0lS0kYLx2WYevbV+SuWGibN1Rxb2aPznchdLglAw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=QrnQHdsa; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="QrnQHdsa"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4769bbc21b0so61534681cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 08:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1743608099; x=1744212899; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TMIWEgwFtWafyi1/bv5jf0ov4gPA0B6DmtDQeyIS7xQ=;
        b=QrnQHdsaqIs9LFfnwAsh+/jc2YYPcPd4gsCkxbzuILcL3t4qjjymITswk+RnXZrHIy
         ZT91neAYxeTOQUeFHAVoTf5TBVtrUlfeb+bg6rAsqXeo77zVMpl2oVCBvrICfqv3ST6l
         QtjcbFMsVXUL1iTA7Rwg9+vgnXbkzU+kXwLcoNcS2D7ipPRPnkKT7PN94A+h+G+YzWxY
         +3iFP9GBdansaYlsl6jUXWYcOLCOK+X9R41zJb6BEI+uOO4Hu5H2lOLDKyqD8do4pYdH
         dqwW1eQkEmt8YvMpW7/DyKfCZ0wIlZfZ3Xl/rYkN3DSmoC373mAq2JP/p5Tr871R1R3X
         Wzaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743608099; x=1744212899;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TMIWEgwFtWafyi1/bv5jf0ov4gPA0B6DmtDQeyIS7xQ=;
        b=ga8PILHI7S2rFUfXWXzUAlC/7izP5dY8qQt7eCoXX3+uPOLcVxRKj0OMYtRr3JA1iw
         R1Blwyr+U2y6CMoZYazzK/EK1jEK+QmRo4otAYK1pERDGj0OeVjJcxDGaq/GhoE9Dm+X
         Vr4oskkvNtMu5zrai7Zgs3qtgXzEVMxPeCThju3uYcskKxhKlavMP4LbyLfY9F9Z+TdM
         EmydcNx2xS4L51HjWJVDoMoNZbXUALkvD57tCOO6EDmQSVPWX2KtKFv/nC8FgmQNIt1f
         p0ntOZ77D7V7WQUJWtf4ZlrwH5KDMLQ2WzItroR5SoxnR+P1sYH35bw8S5J0pcdZC8+S
         Xb+g==
X-Forwarded-Encrypted: i=1; AJvYcCWOycEtWI/oR1co/NE/SCZO33AZRrloidIxZ3CVCZaSdbFV3j3J7tAh6aFEliG+dKkJz3swgxvuEx93CbA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4XDtS4ppD08yHD0nKlSfG0wgWv0Cq2Yyuct0iSqpRc1MqQstl
	yT/6EUtq6gSprwYPVZTR1t8Tp9jQ3FuYeQ91q35+wDZ0TNUwe3sql7Vd/WAc55I=
X-Gm-Gg: ASbGnct6if7q8zbW64VMMGJoWXpJvxHRSzsCJvfxiFVkK1jq4EOgFMvtz7ruUDXKIsR
	3Do73vqNaihaU0fqo0qR4UaOZAZuwzBXkQsbJDaLT1DXPdIoj+/VZ3UnVzzpC41Lg4fUKCTc5kE
	mSj9pZjh/aK2a4EBjWylm7yLvvBPCLiwPxvq7SR2t7dojHx3/couDpHCZ5eqbd1O9kfCEyPWaUl
	KUpVryAGJv7vAlNEt/0nIKPFeTQGk1eFDfDiKHfHWhBygJAlfYhhx6MyNTJeLPDS3MdGr9Ow43+
	yOc1L5qn6CQOBHTCNec/ZdXNsaCVoIdbsp3Vd+y4AWK2mOUi9A==
X-Google-Smtp-Source: AGHT+IF86UTdqujtK2ylyC4iKj51JDYDBGg0ZkrtMCZ8qTcR6Ji/O+4OQfsimKWJomrOBg7nwZAemg==
X-Received: by 2002:ac8:5991:0:b0:476:9e82:6515 with SMTP id d75a77b69052e-47909fa7e14mr42821291cf.23.1743608099524;
        Wed, 02 Apr 2025 08:34:59 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:e976::5ac? ([2606:6d00:11:e976::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47782a7fbf4sm80192371cf.39.2025.04.02.08.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 08:34:59 -0700 (PDT)
Message-ID: <8fe576366e52d530d0507d8475fb52210a27b6df.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mediatek: vcodec: Correct vsi_core framebuffer
 size
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Fei Shao <fshao@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Yunfei Dong
	 <yunfei.dong@mediatek.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Date: Wed, 02 Apr 2025 11:34:57 -0400
In-Reply-To: <20250314075703.4167532-1-fshao@chromium.org>
References: <20250314075703.4167532-1-fshao@chromium.org>
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

Le vendredi 14 mars 2025 =C3=A0 15:56 +0800, Fei Shao a =C3=A9crit=C2=A0:
> The framebuffer size for decoder instances was being incorrectly set -
> inst->vsi_core->fb.y.size was assigned twice consecutively.
>=20
> Assign the second picinfo framebuffer size to the C framebuffer instead,
> which appears to be the intended target based on the surrounding code.
>=20
> Fixes: 2674486aac7d ("media: mediatek: vcodec: support stateless hevc dec=
oder")
> Signed-off-by: Fei Shao <fshao@chromium.org>
> ---
>=20
> =C2=A0.../mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hev=
c_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec=
_hevc_req_multi_if.c
> index aa721cc43647..2725db882e5b 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_m=
ulti_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_m=
ulti_if.c
> @@ -821,7 +821,7 @@ static int vdec_hevc_slice_setup_core_buffer(struct v=
dec_hevc_slice_inst *inst,
> =C2=A0	inst->vsi_core->fb.y.dma_addr =3D y_fb_dma;
> =C2=A0	inst->vsi_core->fb.y.size =3D ctx->picinfo.fb_sz[0];
> =C2=A0	inst->vsi_core->fb.c.dma_addr =3D c_fb_dma;
> -	inst->vsi_core->fb.y.size =3D ctx->picinfo.fb_sz[1];
> +	inst->vsi_core->fb.c.size =3D ctx->picinfo.fb_sz[1];

To Yunfei, this information is copied to be passed to the CORE, is that
value not used by the firmware ? I can see that everything else in the
driver uses the picinfo structure. I'm simply trying to understand why
that didn't break anything and what is the implication before this fix,
so I can determin is that's more or less cosmetic at the moment. That
being asked, I'll give it my:

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> =C2=A0
> =C2=A0	inst->vsi_core->dec.vdec_fb_va =3D (unsigned long)fb;
> =C2=A0
