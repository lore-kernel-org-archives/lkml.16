Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9C4219E0;
	Thu, 26 Jun 2025 06:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750920943; cv=none; b=XsdWHy+H7UjJzhW7nAiT3zDzOYikOvEeSxgM/RvOtdkyca4rydShGWfTmriInVjFF9YT2dnI3Ob5t/qVYatsEdUt/fmCWtYzFAb1R58okHUeuO080jKd9a80JbBdqTWoRbEKA0LBT6lJCfHWfl8EjlMS4+jEdeQ1HdLlJpGEkjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750920943; c=relaxed/simple;
	bh=6lB68hPkjrHY665AbKt29s5K31RYEXTgEqeaNzUEZSQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dab9TappiygWjQU6dwZD7ItfVlsUJvzH9rvhD3v5r84EYROu3WlMivJcTF6NEjImgrGBMGc+qE9GsM3lh7gr51XeH9/COQpkZcpbEnait9wNYn5aPuvQsakInFLCvqQrnsj9niSI3DBpdcsM1KzQm6RjasMMpyeUABbj8ngeqno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jT1zocZn; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jT1zocZn"
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-86cf3a3d4ccso70432839f.3;
        Wed, 25 Jun 2025 23:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750920941; x=1751525741; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W19DxCupecPWn8c98PocInKxtCZZgrUgI9zm1Er7U/M=;
        b=jT1zocZnyAUTmzqAt9fGbv9jmg5kOmS/XFlVO92qjmLng3SGZsxFf3ziM0b0/CLVHL
         y/lE0Y4uLPhwzDB3rEpU6dZUGFfk2Xq3+LTLirCyIKqVQa4Rp+F68pYr+CWLxkJYw/h0
         rmM01L6pAYoozRvSMQgyrzB/AAUlR/uJ3slbhaF17RAlOPZbb3/EmTJmZ+Qxkm3WZ+Iq
         yXssuJmsLKekOF56BpIZSS5hKxmSeHIJ7ZIa9nj5omsDbR8ouLgvJkzSI1EsGavsu4qH
         CO+HbI+EywdxDFHFSTr24ztOaRvKX3Q5ky0Nnr9EXY4Teq4JUDGtjcgS+92z5HD6uLqt
         lcaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750920941; x=1751525741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W19DxCupecPWn8c98PocInKxtCZZgrUgI9zm1Er7U/M=;
        b=VFChK4uPTVjZDb2tyTap1WIAnwlDoo7y9LtgwqIrW1unVCekQJNI9dhvEojajWk99/
         29W+mDG33+I0tY5KGJH655WcBXVmPWu734iaXqMD1Jv/cN2KqtRW7IQkrn7oI4Ky0WoO
         S19oRQW4otT1sq0FYViJ6juISPuOqCHtw30p4D2DzIq2F/wcSf3NsfhyTTBzXll0//D9
         YI/82FMdexU2LWubEBhDgeNlm5SyTBFUN/TTJlCpyDIy2PxC/CgL8q6BaOOBU1VLxOIP
         iEclTDkSneaGcwNI15uc+apAJ5w1BIQPG6huHWuwhdF76hSfpPDefLzDirSeaj0FsKaX
         idDA==
X-Forwarded-Encrypted: i=1; AJvYcCVk/bm/Z9MatQ7BlrBCyROaRBt0jsSC6WDl+7G9ME4/j5hn44tHeHTvtDAr0SC3aOlLlJGGqEaf59XhRZM=@vger.kernel.org, AJvYcCWDBttoZWRkJpimeldpOegsA0xFhxmSkL15IG9adeK0h2aaRgzAmr1xWGiUNXXDlIHuftgRA2CfjnxA1l4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfOoKd84MpWgptAURVVMtH8qm1kt7om7PJ1HFq2H0y/0ivk4CZ
	6HVlDIrkVZzx9lClmoNdtbwZC9QIMBEgZG+fE+86AR6KNSSHmmV4awi7vqkiNDd51h2cezjOL2O
	1v5+xRZaa6Xjz7IgAuaWLVZMOCOlUk+4=
X-Gm-Gg: ASbGncsZPoVlVLFpxIaxtT63ZDp/dOY5KtfyByrEY99jGbA8xew+nE5n4AJMbVAv3Lq
	jk/Gbl+ej+A0tjDgddfZiSIBEVc4/sfCkwlWpaLRmBHAFE3YFY9ZyLeQPtANIWlwYTvflY6J7GL
	UMme6V+pgIqCVeDUU1jH/DLCM74T8LHt3Sr/mAt8iGbIx7W84o1/VfdQ==
X-Google-Smtp-Source: AGHT+IHwMBmagiYehfnzdEnifB4yQU/6UnplTUQv1H0lEqwu0zZ7n4O4uKX5Lmcip85xytB376fVrbXKR02UrAEC1i8=
X-Received: by 2002:a05:6e02:1c0d:b0:3dd:d321:79ab with SMTP id
 e9e14a558f8ab-3df3e0bfa41mr37204905ab.18.1750920940715; Wed, 25 Jun 2025
 23:55:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625130648.201331-1-arun@arunraghavan.net> <20250625235757.68058-3-arun@arunraghavan.net>
In-Reply-To: <20250625235757.68058-3-arun@arunraghavan.net>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 26 Jun 2025 14:55:28 +0800
X-Gm-Features: Ac12FXySMQmkpT_YsYbDsQjt-wcOijwcIWgsdYkyL9-_W9kvTa4M5UfaGlI-Ptc
Message-ID: <CAA+D8AN=K_ERUtc+mOW9Lm_B4wZT_qS5xg6RA2fDwrm9MTaCbw@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: fsl_sai: Force a software reset when starting in
 consumer mode
To: Arun Raghavan <arun@arunraghavan.net>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Pieterjan Camerlynck <p.camerlynck@televic.com>, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	Arun Raghavan <arun@asymptotic.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2025 at 7:58=E2=80=AFAM Arun Raghavan <arun@arunraghavan.ne=
t> wrote:
>
> From: Arun Raghavan <arun@asymptotic.io>
>
> In a setup with an external clock provider, when running the receiver
> (arecord) and triggering an xrun with xrun_injection, we see a channel
> swap/offset. This happens sometimes when running only the receiver, but
> occurs reliably if a transmitter (aplay) is also concurrently running.
>
> The theory is that SAI seems to lose track of frame sync during the
> trigger stop -> trigger start cycle that occurs during an xrun. Doing
> just a FIFO reset in this case does not suffice, and only a software
> reset seems to get it back on track.
>
> Signed-off-by: Arun Raghavan <arun@asymptotic.io>
> Reported-by: Pieterjan Camerlynck <p.camerlynck@televic.com>
> ---
>
> v2:
> - Address build warning from kernel test robot
>
>  sound/soc/fsl/fsl_sai.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index af1a168d35e3..d158352c7640 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -841,6 +841,18 @@ static int fsl_sai_trigger(struct snd_pcm_substream =
*substream, int cmd,
>         case SNDRV_PCM_TRIGGER_START:
>         case SNDRV_PCM_TRIGGER_RESUME:
>         case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +               /*
> +                * Force a software reset if we are not the clock provide=
r, as we
> +                * might have lost frame sync during xrun recovery.
> +                */
> +               if (sai->is_consumer_mode[tx]) {
> +                       regmap_update_bits(sai->regmap,
> +                                       FSL_SAI_xCSR(tx, ofs), FSL_SAI_CS=
R_SR,
> +                                       FSL_SAI_CSR_SR);
> +                       regmap_update_bits(sai->regmap,
> +                                       FSL_SAI_xCSR(tx, ofs), FSL_SAI_CS=
R_SR,
> +                                       0);
> +               }

Which platform are you using?  and please add chip info in your commit
message.

This change can be moved to fsl_sai_config_disable(). that is:

--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -798,18 +798,16 @@ static void fsl_sai_config_disable(struct
fsl_sai *sai, int dir)
                           FSL_SAI_CSR_FR, FSL_SAI_CSR_FR);

        /*
-        * For sai master mode, after several open/close sai,
+        * For sai master/slave mode, after several open/close sai,
         * there will be no frame clock, and can't recover
         * anymore. Add software reset to fix this issue.
         * This is a hardware bug, and will be fix in the
         * next sai version.
         */
-       if (!sai->is_consumer_mode[tx]) {
-               /* Software Reset */
-               regmap_write(sai->regmap, FSL_SAI_xCSR(tx, ofs),
FSL_SAI_CSR_SR);
-               /* Clear SR bit to finish the reset */
-               regmap_write(sai->regmap, FSL_SAI_xCSR(tx, ofs), 0);
-       }
+       /* Software Reset */
+       regmap_write(sai->regmap, FSL_SAI_xCSR(tx, ofs), FSL_SAI_CSR_SR);
+       /* Clear SR bit to finish the reset */
+       regmap_write(sai->regmap, FSL_SAI_xCSR(tx, ofs), 0);
 }

Could you please try the above change to also work for your case?

Best regards
Shengjiu Wang

>                 regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
>                                    FSL_SAI_CSR_FRDE, FSL_SAI_CSR_FRDE);
>
> --
> 2.49.0
>
