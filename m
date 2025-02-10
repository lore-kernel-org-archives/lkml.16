Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FFC2F22
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 07:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739173994; cv=none; b=i6leBVpOyj0xt+e8kvCvp6uHk3LW/ayi33I4u1SrCZEDH1N1EkhthNhCizj3m38U88gNfsar+3jzG4MMYSHixktN9IKr1UHNZT3fItAt9xgj72iNf5u3gXNis9c+YNXkXErSY9CKUsoMQ71saHFHDBYI2xJFmDVLHc2vnrma2rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739173994; c=relaxed/simple;
	bh=N9Nb0pktKII2Ub2eQbtJTenMU+mV/G1GmndQokFDo/8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CQ9e/JACEq9KYmvOwkcYfJew4Qu9i+Qu1+bjpw4dx4btGfGaeFNzXbOCvh/RlA37M3DNOTcRRJbIuKACeKfNIEiNfd5ZiY52dg+E34TcI8eZbHtqaEUjrVo3qE//0dMcVpNmrGCkospSfr3oszeFiCuqJdKM4XL8SX8vmgXz48o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kF2xrgAb; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kF2xrgAb"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2fa0c039d47so5667408a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 23:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739173992; x=1739778792; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N9Nb0pktKII2Ub2eQbtJTenMU+mV/G1GmndQokFDo/8=;
        b=kF2xrgAbbXIOFONzrZ06u9dAgiKwSaB3Ta/DhyPH2KquqHcyvBqfosRkHGPUn4DefI
         lPVp1yZyoVC/4j6uS8BCTfX8nZakO8blAD7Eh08d+InX6GQ6sW3gR+/5hzO0P/s6g59U
         WRdQU7xsYEbgkQz25/tjxAo6yF788apMm7il6vK0tQgUDzqWUvmlymTlHUX8gzwXDrVG
         NE8aSte7dWaxbauEaYifS1ovd+ZablflJD08P6gVh/S+UNdw7PSvUDSNkv5TgCgPNNRU
         o/PwRZ0i/IFgRdx6sQ7pUvDcgXGhGAprd9PXsTnZ0gmM6PhZBYOgJsbV+ZZP8PxGPat6
         UXZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739173992; x=1739778792;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N9Nb0pktKII2Ub2eQbtJTenMU+mV/G1GmndQokFDo/8=;
        b=JBo/A+fO1U5YsI3mvy5Eth9lLf5nYD8Ojg8+Jf/8V8vjV/ASYpJjp6n74aRUVI+EO/
         mYpeo8EACSsE/HkzuM/E4vQ7J4HuyDwMedC0YWpc97iVnZNx+vzZNb51y5k4QxJFdt8t
         GKtTyIa3DQSRgicnK3MTMK95muvYi2+FGjcHi2qIe6isjW6ctlbSVOcql11GRByqkJZ2
         2IjMj/sLqXaOj3s/vwqg3Jurra3utoo2A42nBH4KCwmQf9cKBnjkB9zpCyfjCcOlLs1G
         qGWiY+vGn689S4DPjg0devx1ThTimjXNLhMGRM+6OYJ+ykZZdQ44E81rgQYUpPEjcAQ6
         gPmg==
X-Forwarded-Encrypted: i=1; AJvYcCWBTJc85XTEk6HN9tvibV/MvqiuyKyuTyiDWLoA3gzq0MwIadS5cru2qGJZwJZx9Enn9nl/oIlTd0pSxHA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWk/o5qCtQPUPah8ywawUbldAX+6dvfbBJvRgb3IRa4FATpPwG
	GUMgZLtiuzZECTxGiJj1pp8DVcXdkqN+qj9t8rLRad20QxlIN+sReQUvZJtJq2y36klebi03ESW
	T/LNb11CY4TLASyWVfxbevy1bUvk=
X-Gm-Gg: ASbGncv0xlazrtyWb6kCjxl/HC7keE/TyoNYKE27nTFerYkJMhO0M2JVO6+1tYQRMqA
	TVcpAXqaSaI3Z/+UFgZxxUmc5ZFUJXJS+lgxJh2eOQcGYHNbpVt1lERCUmzx8+NfFPl2UWFY1
X-Google-Smtp-Source: AGHT+IGYwtiNs1daRmBy1KhDukrupoBRwNgyFx0NxH4pRt/R+CK7zKFxUkct1jJMcUr+wT/tCXPHoWC2sdAz73vB7+A=
X-Received: by 2002:a17:90b:3647:b0:2f7:4cce:ae37 with SMTP id
 98e67ed59e1d1-2fa2417806emr23591132a91.18.1739173992168; Sun, 09 Feb 2025
 23:53:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207081846.362919-1-linchengming884@gmail.com>
 <20250207081846.362919-2-linchengming884@gmail.com> <1c1da131-a7b1-4c2e-9866-d7833a134033@linaro.org>
 <CAAyq3Sb4WZtjq6-jYqHYympSxLgf=Oifcf2BmV+pVLJGc8=oYg@mail.gmail.com> <87210c38-2e6d-4f14-8a4f-ea02288604fa@linaro.org>
In-Reply-To: <87210c38-2e6d-4f14-8a4f-ea02288604fa@linaro.org>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Mon, 10 Feb 2025 15:49:03 +0800
X-Gm-Features: AWEUYZmUvI2sgweezm6gJOEeRjRVOv03SUts67qUkiJM26UcK6C_PRmcDURr6c8
Message-ID: <CAAyq3Sa3XLQ6F1B7mdcgx7U5RyTec_Wmh09oMnVOJVFp-JwF-g@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: macronix: Add post_sfdp fixups for Quad
 Input Page Program
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com, 
	richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, alvinzhou@mxic.com.tw, leoyu@mxic.com.tw, 
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tudor,

Tudor Ambarus <tudor.ambarus@linaro.org> =E6=96=BC 2025=E5=B9=B42=E6=9C=881=
0=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=883:48=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
>
>
> On 2/10/25 3:27 AM, Cheng Ming Lin wrote:
> >> Also, if you touch all these flashes, will you please update them and
> >> get rid of the stray flash info fields? I'm thinking of name, size, an=
d
> >> no_sfdp_flags.
> > No problem. Would removing these stray flash info fields from the
> > Macronix flash warrant a separate patch series, or should it be include=
d
> > with the current changes?
>
> separate patch please, because removing those fields may introduce
> regressions if SFDP data is not sane. You'll need to do the usual
> mandatory tests when removing these fields too. But it's worth it,
> you'll have cleaner code paths. Thanks!

Understood. I will submit a separate patch series to remove those
fields, as you suggested. Thank you for your guidance.

Thanks,
Cheng Ming Lin
