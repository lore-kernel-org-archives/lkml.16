Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2161EEE6
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 21:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745098360; cv=none; b=JaHdSlVBw5ZCzgzKVJrhPDoW/MYPASSFwYynb72TthPHXnqVWuuJMBMnfEQjCvmUt0cwIvUazjqXoOUu4w9hyDH0MMV7qcrg1KsILFC75rTJD0/WIlFHrrx4iV3xB+8O3YjI0ZIq1rOcR/ve4VWBFF6V/cuT0FWY8z3n+CK9b0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745098360; c=relaxed/simple;
	bh=vt1Qyz2ybsUF8oGImK8H2swVwtc7A2pWsx1VjYfS/ms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F5GH1T8DGe5EDRZto12QlWGOTnpN1YaKnHO0aPy2LsluSOfGvr+zHm6FW19iUrtJryGzCYChRE1TY9Tg14oMjXNhGnvcVZCaOBUSXGFo4Lpa2xl8QCXiBD6273NdVieH8uA7WCKgUQSBVYOBF43SpY/CfSMPkCRLXeIdYBXOhVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=T+63lEu3; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="T+63lEu3"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2295d78b433so33831585ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 14:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1745098358; x=1745703158; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NOpxvDT2hzdXC/Lk44TDPK4RjDKnxL5gg9PE5JOWs0E=;
        b=T+63lEu3S2wTgXgJ7e79I+xw5Q9Iz/03ZqxfG2eNVDOsgbxiMDiiMaUCAnqfzEOk3z
         35RuXykiqXl+AB78CAGR8Op8zbrE7Rl56cZozNFE2MknO2R1BhXCDT3im8BvIMrgqNGW
         W+/WgJ0v+8PyMtMUB4H5K85RggqHXWO3e+2w421gmhpKbOMroAhrxfb63x+hooDGcJoy
         MsmM9qfyvQuQFsxB4mW0xrUyHjT1y0Er+BEnECJm8gMce7zv4H+H60zuVoh9lAVFRf5Y
         9AIkBDm2NppMBcMU/hvIvpbbgDlYKf5HOfAf67os3zuS7nqQhuuutsNy5vGSKDVC4x6D
         7mNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745098358; x=1745703158;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NOpxvDT2hzdXC/Lk44TDPK4RjDKnxL5gg9PE5JOWs0E=;
        b=GglR71tpkKNKMSj3dI6JtHzrKFs+grCx0d55sVHybP9VY3JtKPB+r2jTSdUQ1dG6ZM
         dP0Xi6/zmCuvlGPd6mfzyoRZb6D/KQgOwPbcnaDHjEDXHg7SvJEp31Ii/XDwegDo+EHk
         DpQIy1GD5JTbQfxfmV2Vr+NgnsnSZMSJsE2DaY9FHMHDZ3DFP7z1nuhHvM/nDuJ/mFM7
         hIDXi+IgfA7hV8Hk6EGfY3RCeMABZqh8LROtVhuuBAm+TMW/3Ns04tos+QYo3PDWwg1T
         J1VYA7NFjsR3xaacdOIUVVq+bZ9G47Sbl0yFAeTTBASwdTezzfjkBQCFHlwh1TtnDrwE
         E3dw==
X-Forwarded-Encrypted: i=1; AJvYcCX7iQtJhbkkc/iRJado+ZoJXXndPGSUQChjSMx51+yArAgesAm9mZb+elCNob4xjW/DHhyDYdondqtNvtg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMhjG5K+awNlZfeKWx5g2I9CVhJcJbBVyUjH2LnW9aAP4cqYv0
	Dx2DEj8EJVkZQcl0HQqdATJl6bakE0u4mnjkBBWpv8Y1Ah9SPVdz88wJTi++nWCTV9y92b+HWu6
	6+PcaRGA0NV7nqotE9z9u6e0c06M=
X-Gm-Gg: ASbGncu99tQNBMtZWdmqNH9rZ114Kzuq2xYihP8+xgkKjtisKnfT3KhGhyYuetEwUzM
	45io2dK4hTJx+1kx2RTnrWj40QCZZQo4KhTDxTsSdF1JbJqV5diH1Tb5Kn4A7Tyx1PkOCjtyvnu
	cPkyhqEVw50v8PY6utj2jd59J1pERQaDC9gCc9
X-Google-Smtp-Source: AGHT+IGLlR8UcPQM775uZfby4awG21f1XTwAj2dFL/MhOfyAEZBG0daUZpkUnTjuqdZFSKrcnfs7NqueiXGk5h+tOx0=
X-Received: by 2002:a17:903:98f:b0:224:f12:3746 with SMTP id
 d9443c01a7336-22c535aca10mr96258145ad.30.1745098358068; Sat, 19 Apr 2025
 14:32:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409214422.1751825-1-martin.blumenstingl@googlemail.com> <001d01dbaa48$ead66d10$c0834730$@martijnvandeventer.nl>
In-Reply-To: <001d01dbaa48$ead66d10$c0834730$@martijnvandeventer.nl>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 19 Apr 2025 23:32:27 +0200
X-Gm-Features: ATxdqUEyKysz5d6KQERLrTW5mLuoTSOc_4gWR0BkMuxJYXGSMde_moYAT3tKcVQ
Message-ID: <CAFBinCDtMG1qKM9aax7RBpN+dw7c5MVOoTrX+PzXF1QQBOg_Lg@mail.gmail.com>
Subject: Re: [PATCH] drm/meson: fix resource cleanup in meson_drv_bind_master()
 on error
To: linux@martijnvandeventer.nl, neil.armstrong@linaro.org
Cc: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	jbrunet@baylibre.com, Furkan Kardame <f.kardame@manjaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Martijn, Hi Neil,

On Thu, Apr 10, 2025 at 8:46=E2=80=AFPM <linux@martijnvandeventer.nl> wrote=
:
>
> Hi Martin,
>
> Thank you for the patch.
>
> I encountered this issue some time ago as well and had a possible fix in =
my tree (see
> below).
> My apologies for not upstreaming it earlier.
No worries, we're all busy with both, offline and online life ;-)

> While my fix is not as symmetric as yours=E2=80=94I like symmetry=E2=80=
=94it is somewhat simpler. It
> did make the assumption that only  calling component_unbind_all() was at =
fault and the the rest of the
> code was correct. Therefore, calling one of the following functions:
> meson_encoder_dsi_remove()
> meson_encoder_hdmi_remove()
> meson_encoder_cvbs_remove()
> in case their counterpart was not called, should not result in any issues=
.
>
> I just verified, and, as far as I understand, all of these functions do a=
 check to confirm
> whether the encoder was initialized before proceeding with cleanup.
Yep, that seems to be the case right now.
Neil, would you like Martijn's more simple approach with a Fixes tag
and backport that?
Then I'd send my patch as a small cleanup which doesn't have to be
backported. Otherwise I'd spin a v2 with a fix for the issue that
Martijn found (and including Anand's Reviewed/Tested-by)?

[...]
> > diff --git a/drivers/gpu/drm/meson/meson_drv.c
> > b/drivers/gpu/drm/meson/meson_drv.c
> > index 81d2ee37e773..031686fd4104 100644
> > --- a/drivers/gpu/drm/meson/meson_drv.c
> > +++ b/drivers/gpu/drm/meson/meson_drv.c
> > @@ -314,35 +314,35 @@ static int meson_drv_bind_master(struct device
> > *dev, bool has_components)
> >                       dev_err(drm->dev, "Couldn't bind all
> > components\n");
> >                       /* Do not try to unbind */
> >                       has_components =3D false;
>
> Above two lines are no longer used, so can be removed.
Well spotted, thank you!


Best regards,
Martin
