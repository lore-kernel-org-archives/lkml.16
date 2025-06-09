Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D557BA36
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 13:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749476129; cv=none; b=SH6Hmpqirhcsk2w3abFhKeKI2GsI0z/55wVpB7RqhKN5DbsYVSRT5LBAzpOFLNMdZsxJUD5oTH/u1jgji/OQKvnXLn1pF1Sn4dZGMzj2aWdBe86MpuhBGrvcQfha/vMYpdK1zx218x8Hj/GPXz/bdQcWStALen5LwExwsyO178Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749476129; c=relaxed/simple;
	bh=2xC2FJu2FXTT+2h/iyZqo673k9e6gATkD34bvQ+eLOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fsE5WlW6H4UC27sVG3Nf5hLvnDeSmiTl/ZZG3tSPI/LZmVm3zWe2oB5BGaeN0eUdAs1qNAekABVg00/bdOKMZjeaFhvGwh8+zqukHjQya6ivXgx5pUmDANLeOQRZzSzE8i+7d16tnRtEE4/NG1Zp7x9Cki4na3n/FlznxJg/tDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XPQkxoUn; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XPQkxoUn"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3131aa07b50so572972a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 06:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749476128; x=1750080928; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kR77AmYEmMIchXiqyUQZ2QG2OUiyQNsZAcRzINVkNVo=;
        b=XPQkxoUnbUylSC98dyUOqfp6zBE+1Pj5EUCn7xKoiQF9u6sdp7GXq/X4jENud3eHdP
         TE3ECFj5YEyeUAO7MXzg1rIjJB+uLMfE7/cxyQxC/LRzYUXLtarX6vNhfCe1Ubevr1eS
         HNdPJrs6i9gvccKIAEX2kwoRGwcY9mBGQLzkNX43U0IctAUR4IRpdhts2qPhwZK7i9f9
         3s8NZEr2e0Tl+sVToJ8AuMqE32lxn8Jmvi2kLtT/Tq50J4USRo7ndluGHCqhStZgHJbY
         iXu45jxf4uZjVTRp7d5Ksh9SGEHR4eOmB5bVkixi/yCktj/yVTVcs44eaCElLYw54qfW
         hqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749476128; x=1750080928;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kR77AmYEmMIchXiqyUQZ2QG2OUiyQNsZAcRzINVkNVo=;
        b=Kgi/2D/NhTxCbhfsYYrvHw8QCnlmPE0Nx4MiuBF/NkGcnCCfNh4IdlLZAmdX9RfYJx
         AQHN9NtaLDwATODjxknortnX22DQeW7598ov4FCRrhgP02nPED9+wK2N6MyzBlpJj4np
         VeUtafEMe9KdUM4wqS5k/jtm0xqFPEeShjpjwyw9o4j0eAr5xfvt7gXP17unuaq8JnWk
         OW6qws/eDaNn2uJzzw6g84vL0wbhfyngq1dTEfnO178tbfKeJaC3YNAioCiJdFT7MpUH
         joeqsMcs65NyDveMQJipFYk9y9KkD4hiNkUH2onta6nIG74PmL+AnOqeoHFOLjDnd6vE
         IlAA==
X-Forwarded-Encrypted: i=1; AJvYcCU2puWDPdodVRvtaZ4ct5QHXv4978lV7WDiji34Gu5wqKaCHlqv39hAvFwDmBI00Auu3e/yqX3zoubeseE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBkSNycv6vqSLv0K+JsEBnh4Z9k0DVtYtyMZWyLNUAO6jdGEmv
	htbB3nigf5+xwRZUyHn2gnrao9s8pT5KeER2VGa2eZFinjMFFWsMkw8RJvGEhgU5V5aroqQkfVu
	ILM5v4S30jM4SyCvzrpm1UuEttxtjKO0=
X-Gm-Gg: ASbGncvMmiKPlc+xL/gsbpuvgjh7xEarI5NwOJuhT2/ffisVbiDpjhAZ1owdq86bf7r
	FIdW/86+5/elCeXjWLoJlaoR1diDyt+zcKDm3Yqp875//p/nhMtRDXqDfhNupEMcXFHdKwca9zD
	RpOVCFG+Aq60tWCmTS03wF0y5MS9tsAPTcgNPXg4Ot1zke
X-Google-Smtp-Source: AGHT+IGfU+CqdloT5GBJL83j24+S9O39U27/9Cv/iwTRCHBLVy+1t7Ge2dAKqKUqXmLkN/deorY4UjIhIhNkkV8HVeE=
X-Received: by 2002:a17:90b:268e:b0:311:e8cc:4250 with SMTP id
 98e67ed59e1d1-3134e3e4268mr5910935a91.3.1749476127603; Mon, 09 Jun 2025
 06:35:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604143217.1386272-1-lizhi.hou@amd.com> <CADnq5_NMamTAd0whqwr+xcokFThCNX7T7qFBfX+u3vnS6oc=tA@mail.gmail.com>
 <e70bdb30-66cc-7e9e-b666-efff3203bf27@amd.com>
In-Reply-To: <e70bdb30-66cc-7e9e-b666-efff3203bf27@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 9 Jun 2025 09:35:15 -0400
X-Gm-Features: AX0GCFtHAdAXqeZYjliT8FlmZt1QcxBvWEaZDPv2NuDeO2whS7UOtK8ST1uKIjo
Message-ID: <CADnq5_P8eFYdPJv5qV+N5JdLCDv4bhWDzpVZCiXTU3jNmgCy_Q@mail.gmail.com>
Subject: Re: [PATCH V1] accel/amdxdna: Fix incorrect PSP firmware size
To: Lizhi Hou <lizhi.hou@amd.com>
Cc: ogabbay@kernel.org, quic_jhugo@quicinc.com, 
	jacek.lawrynowicz@linux.intel.com, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, max.zhen@amd.com, min.ma@amd.com, 
	sonal.santan@amd.com, mario.limonciello@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 8:12=E2=80=AFPM Lizhi Hou <lizhi.hou@amd.com> wrote:
>
>
> On 6/4/25 07:51, Alex Deucher wrote:
> > On Wed, Jun 4, 2025 at 10:42=E2=80=AFAM Lizhi Hou <lizhi.hou@amd.com> w=
rote:
> >> The incorrect PSP firmware size is used for initializing. It may
> >> cause error for newer version firmware.
> >>
> >> Fixes: 8c9ff1b181ba ("accel/amdxdna: Add a new driver for AMD AI Engin=
e")
> >> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> >> ---
> >>   drivers/accel/amdxdna/aie2_psp.c | 4 ++--
> >>   1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/accel/amdxdna/aie2_psp.c b/drivers/accel/amdxdna/=
aie2_psp.c
> >> index dc3a072ce3b6..f28a060a8810 100644
> >> --- a/drivers/accel/amdxdna/aie2_psp.c
> >> +++ b/drivers/accel/amdxdna/aie2_psp.c
> >> @@ -126,8 +126,8 @@ struct psp_device *aie2m_psp_create(struct drm_dev=
ice *ddev, struct psp_config *
> >>          psp->ddev =3D ddev;
> >>          memcpy(psp->psp_regs, conf->psp_regs, sizeof(psp->psp_regs));
> >>
> >> -       psp->fw_buf_sz =3D ALIGN(conf->fw_size, PSP_FW_ALIGN) + PSP_FW=
_ALIGN;
> >> -       psp->fw_buffer =3D drmm_kmalloc(ddev, psp->fw_buf_sz, GFP_KERN=
EL);
> >> +       psp->fw_buf_sz =3D ALIGN(conf->fw_size, PSP_FW_ALIGN);
> >> +       psp->fw_buffer =3D drmm_kmalloc(ddev, psp->fw_buf_sz + PSP_FW_=
ALIGN, GFP_KERNEL);
> > Why do you need the extra PSP_FW_ALIGN in the allocation?
>
> The start address of the firmware is also required to be PSP_FW_ALIGN
> aligned.

Acked-by: Alex Deucher <alexander.deucher@amd.com>

>
>
> Thanks,
>
> Lizhi
>
> >
> > Alex
> >
> >>          if (!psp->fw_buffer) {
> >>                  drm_err(ddev, "no memory for fw buffer");
> >>                  return NULL;
> >> --
> >> 2.34.1
> >>
