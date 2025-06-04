Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0442728E5F9
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 14:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749048707; cv=none; b=QaNK7sMNDomLFwe2vfspyaD2Lf84a+Gzj04O6xG2txwlKal2JYGxg/Zf2kUt3jqUFgyP8f28s8A+Ila9D+YXxgNdTlIVuvyUS0YSkTix3FY4xBWov/3gABlL8d+96T2dG3f2ty4n3RfznH94oiC5JsneGUtZPyL2DL6E1yhUJeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749048707; c=relaxed/simple;
	bh=veZA9K4vWZMYgmiPCVxICQpb/n5o5wxx2w15FU1JhmY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A/BgvX42jjHfNWY6MS7CEU+RRUQmp2D02f6uYGiXzrJipDo1QsRfcvTKVn5Ic4oxrE38lHA6oDsMd4pq+cpjSTGlwCPzI6qlzbK3pUVV2TiB9L5rM2GyfFF3+3vfotJk7a9/vILQI8xdQU+LemSAoicchfk1xJ2c/zbEdsRlgbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zhr0gPrR; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zhr0gPrR"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-312a806f002so500722a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 07:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749048705; x=1749653505; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AVa8Qq+qX2ca3yq1SCHBs+6bwMYdjHXn9QCvwLrSQxQ=;
        b=Zhr0gPrRHlCSHleRAz1HiDb2aWbw2wGD+UZxejXRd40XiAUurE/YaK+2/niib2MeKf
         7SMiiuywAV8t9MeVCoDw5zu+atn9bwfvC1Wy33SgDnbEuVR8oSzxfwPvdNOIEKzgEJ2i
         68Mu9eoQxNgNf4jH6nktmkAmeLJof10jK6lHloZLpmRVqmQQhmAJPnW8Xj4edSzEgplm
         XW6kC0HoVLkoq+Khuda9+ct5ZRA2PCLBH91aiyXIAaRFaq+rXXsL8c4mrzqcR8iFLN1Q
         Yk8O4oNRVmOFRhbmCXmVEAYGfWyg62y5Tr2aqvYozsYVx3VqaYtlX3a17NNTkkGkVakY
         QyXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749048705; x=1749653505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AVa8Qq+qX2ca3yq1SCHBs+6bwMYdjHXn9QCvwLrSQxQ=;
        b=hCUwgEFjlVVfMUj5MqDVYWdGHA42vKa5bGxRRLje4KCIRo+U9L9WmoE2FRlBo18JlW
         XQy6gfLRyoRQj6zCvUfNw879WgFj16DKJ3AQWoTlwDIplWfqfJ153j0Txp3MwctI/cKB
         VXs4Mx+BUnxk6tS2++PG2ZsjWf9dPLQdvo1wlX/9wdejH9R9plxNo6HYRiwvs13hxHXT
         UgyRqlbH2QIP2ENBlC+STyoMtQ5TLWnxsbBzMjgcvIbLX4G1245vDN2jvKihjxf+O0z3
         Qxgp0adXAdEjezeqTPofM+SCsSoYCHgbxVWiXwBmlkp4eiE4iKAhcNguvQOqX8Y7j1xN
         Bqng==
X-Forwarded-Encrypted: i=1; AJvYcCUe5UBQ3+FiLGrnWDLDowWcNzjWVgvTB8WvON+tvnBtnehxX0A7ck7K55joil7QNA+FYtZUdTSBsuoS8nM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2vgimVg7mzwoJZ53mCVhTIeZDerzR8yF7ndOxPv9aiKgWlpl1
	3sJ3eaEJop4CeNQ50aCB8n7GwPD301QWbJDAf9u6Zt+34FP0ckcz21hbCKhVc0G3mdTHILfqS8q
	p22tMjYp7ng1dFg8vI3ts24tVX++sQRUT6w8a
X-Gm-Gg: ASbGncuBNX8AbxC3OPNG/cUzKqlFsskbOrHvOD6tq/fWLoAS5siiNEVTBLOjL1T2xxE
	ZGZrrkTSj2p2TIcjEy9i1PGufN1JHsYYeAa4bVDpMz2FjiDoGFajqHIbnhE+39sOAwSWwTMnKiK
	JsKqkRM58O0mYu1YLhzfENUc7Spr0+T9r/4Q==
X-Google-Smtp-Source: AGHT+IEXhbBU5Ad6IMEuXf05cu8wNhInf6Dr5JPGtJC47oiJd4VMATt6Jx4PUI5odSmqlnX6gbZ4IHvUxsdlUZ55jno=
X-Received: by 2002:a17:90b:180c:b0:311:c939:c842 with SMTP id
 98e67ed59e1d1-3130cd7eab2mr1699539a91.7.1749048705130; Wed, 04 Jun 2025
 07:51:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604143217.1386272-1-lizhi.hou@amd.com>
In-Reply-To: <20250604143217.1386272-1-lizhi.hou@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 4 Jun 2025 10:51:33 -0400
X-Gm-Features: AX0GCFuFLQhl24WQZAscJZ2gULKE1SWhCQ5ymXTk-y5XTHc0fhk0LJCRP8nA58U
Message-ID: <CADnq5_NMamTAd0whqwr+xcokFThCNX7T7qFBfX+u3vnS6oc=tA@mail.gmail.com>
Subject: Re: [PATCH V1] accel/amdxdna: Fix incorrect PSP firmware size
To: Lizhi Hou <lizhi.hou@amd.com>
Cc: ogabbay@kernel.org, quic_jhugo@quicinc.com, 
	jacek.lawrynowicz@linux.intel.com, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, max.zhen@amd.com, min.ma@amd.com, 
	sonal.santan@amd.com, mario.limonciello@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 10:42=E2=80=AFAM Lizhi Hou <lizhi.hou@amd.com> wrote=
:
>
> The incorrect PSP firmware size is used for initializing. It may
> cause error for newer version firmware.
>
> Fixes: 8c9ff1b181ba ("accel/amdxdna: Add a new driver for AMD AI Engine")
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
>  drivers/accel/amdxdna/aie2_psp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/accel/amdxdna/aie2_psp.c b/drivers/accel/amdxdna/aie=
2_psp.c
> index dc3a072ce3b6..f28a060a8810 100644
> --- a/drivers/accel/amdxdna/aie2_psp.c
> +++ b/drivers/accel/amdxdna/aie2_psp.c
> @@ -126,8 +126,8 @@ struct psp_device *aie2m_psp_create(struct drm_device=
 *ddev, struct psp_config *
>         psp->ddev =3D ddev;
>         memcpy(psp->psp_regs, conf->psp_regs, sizeof(psp->psp_regs));
>
> -       psp->fw_buf_sz =3D ALIGN(conf->fw_size, PSP_FW_ALIGN) + PSP_FW_AL=
IGN;
> -       psp->fw_buffer =3D drmm_kmalloc(ddev, psp->fw_buf_sz, GFP_KERNEL)=
;
> +       psp->fw_buf_sz =3D ALIGN(conf->fw_size, PSP_FW_ALIGN);
> +       psp->fw_buffer =3D drmm_kmalloc(ddev, psp->fw_buf_sz + PSP_FW_ALI=
GN, GFP_KERNEL);

Why do you need the extra PSP_FW_ALIGN in the allocation?

Alex

>         if (!psp->fw_buffer) {
>                 drm_err(ddev, "no memory for fw buffer");
>                 return NULL;
> --
> 2.34.1
>
