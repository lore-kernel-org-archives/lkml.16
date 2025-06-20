Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639D826C385
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 08:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750408755; cv=none; b=Zy+zJVX1j+SlNs27ZCRQ7bcS8anN54TsRBfvlJJwkRbkk4ylIFAP2u1D+Xt/yXVcu8UpdECS1rdAbNFlZfonQWBJNakXKgmB4AkWbKKpc0W+mKntgHvgtfwW0HsRm9czc+nYbWhYE+f93QwYdRqwNN1ViMgMHgioi13tTfnuLF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750408755; c=relaxed/simple;
	bh=nW0F0O/hWqw37ehBTiHOaKNVn3q7ZPdsEdlHH98mdbM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=V0UeQFGb2l9R63AtNDLczrhhzjw00pfoQRoa7qmjnsrlfpRaVt9CO9O+TOIqR4ArkG5pPJex5xYtIFGcmrv3ce4nlaCeT92a46H7kncxOpVxKdkHQOoHFXdEFhan/K27jDs2Iq2n2L3Tf3e0AGAsip4bnG/JmnDwtIhDi9T7wFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Q9xiXWaU; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Q9xiXWaU"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-acbb85ce788so293429266b.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 01:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750408752; x=1751013552; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6V7zu0Kxpdwv0OZSUsLSOjM7ZQH3dEZE86mrHpx7mAI=;
        b=Q9xiXWaUVze6+3GxmnW8BlyGUQCfzbUuMCDHKuvU9se1IwGuIfLyzdveR2kcLu5Udn
         xBSlTM/JaO96BhWAbE4WYr2MzkknDj7NFwNZ2zqGVcLOp/JB36tJ1uLmtYDTErgwTidQ
         tmkldF6E1bTWV2zSrIeiJu4laeHtsAUdhr5m6QIb1kvRJRQZ3JVSofIYgf9SHw/kI2xL
         CMS4nO7AooBQ7lStCAXLR5+YaZU7pbcEqyFHcgmdWD7q02R3NrB5xVaYsSIsTDlxilP5
         js3OU1+BWZL55bsKeeTa9P5GHHvs1qfsewrTSmYhY6/psnV8azoc1lj+Mkd2G/oUHxpo
         Xsng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750408752; x=1751013552;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6V7zu0Kxpdwv0OZSUsLSOjM7ZQH3dEZE86mrHpx7mAI=;
        b=jvNee009A2FmlfIsFZWjIax8XmPz4K17B9M5I45uEnDbaYEmFvtX01wF/5LttbL5p8
         Q7H4lJ6TRyVZf13pFt9JE3WjCXpEhOKj9CECV1CNUpFSIwYazLeM6X5ox6j6lpw1An/h
         +/frQHY0m3OoLnZ6rTx2IFlnBfNHWaS8BciMzOxM01rx8xHyJmSdenPmUTnIk4WySeSu
         kV+GVUiVPwAzkuci93Cku6qd8t5RN8o/rMmch2ViuaFpqRvbtWgmnvFs1E0SoNGVkq6b
         GAz+B8lXhhl+KIf2ERONWZixWrjFNI3yYlqztf5E3+uaZDJmvOFyoKLP/afYxIF54hgC
         Espg==
X-Forwarded-Encrypted: i=1; AJvYcCUJLzEiH4wqL39Wgem6kI8w6bctroNnAQzewVi/jXaTuTqTWy0ieTgUD/7lQ2++gpT4T9cvyUpyOFvSvbE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWUu/coneUmqtig0rSzTxzdMe+PQygvDlXWm8+iWSzea9dgccl
	TAF4771wRsTx97sEl5nsCU3Z3EMP34wp6H2idUpvH0SjtJVf6uXkEmq4rQDPWuGyqCE=
X-Gm-Gg: ASbGncvC6SDPYzIccDhd/zbpu8jgPspeEeULu72qWFiWdkO3v5PmVSp46rAcX9wdyDC
	mNBKSuu02gUijFkjw8G9p65diOeY5LCthfv8LNL2/wfjv9NtOyHWGGHxH2tezUmewSLKNjsxont
	Z0w1Zqu9FrBT6qIemqB1K5jr99z+5wFWiw94i1OTACxvh3nk5A1PoGiytB+BLX1IEdRHnReUwu0
	7wWHZevrZ8PjE5pn6eyws3qqplukFUBqiHVvDCQlWbGmDF+a34xIzudtEQb/AuX4BaUkCNPSGbW
	ik9PIhH1wR9xNM3I6C2qIXIP0vdfA/fFGWeGYxORGFO24B0dtk+LSCZO2St9+jRu9e6vhabUX9Q
	odFbRj/TCVppJu+dRW8eJvy2pesZZFK4=
X-Google-Smtp-Source: AGHT+IHnn+pgrcY80rrdIAItBJEQnsl8DLBgDjOptwBLYFl+zdmUZHUQXrI9nz0s+HIckaBRB9p+5A==
X-Received: by 2002:a17:907:9816:b0:ad5:55db:e413 with SMTP id a640c23a62f3a-ae057a284e5mr172285466b.26.1750408751642;
        Fri, 20 Jun 2025 01:39:11 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541b6e36sm123747666b.120.2025.06.20.01.39.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 01:39:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Jun 2025 10:39:10 +0200
Message-Id: <DAR846ZKJENY.KINMYGVYAY97@fairphone.com>
Cc: <linux-arm-msm@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Sebastian
 Reichel" <sebastian.reichel@collabora.com>,
 <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH 09/11] power: supply: qcom_smbx: add smb5 support
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Casey Connolly" <casey.connolly@linaro.org>, "Sebastian Reichel"
 <sre@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Kees Cook" <kees@kernel.org>, "Gustavo A. R.
 Silva" <gustavoars@kernel.org>, "Bryan O'Donoghue"
 <bryan.odonoghue@linaro.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250619-smb2-smb5-support-v1-0-ac5dec51b6e1@linaro.org>
 <20250619-smb2-smb5-support-v1-9-ac5dec51b6e1@linaro.org>
In-Reply-To: <20250619-smb2-smb5-support-v1-9-ac5dec51b6e1@linaro.org>

Hi Casey!

Adding a note here, I also plan to look into what (if any) changes are
necessary for this to work on PMI632 (which is the PMIC for
sdm632/msm8953 Fairphone 3) since that's also SMB5.

On Thu Jun 19, 2025 at 4:55 PM CEST, Casey Connolly wrote:
> Introduce support for the SMB5 charger found on pm8150b and other more
> modern Qualcomm SoCs.
>
> SMB5 is largely similar to SMB2, with a few register differences. The
> main difference is the new Type-C hardware block which some registers
> are moved to.
>
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> ---
>  drivers/power/supply/qcom_smbx.c | 367 +++++++++++++++++++++++++++++++++=
------
>  1 file changed, 314 insertions(+), 53 deletions(-)

<snip>

> +/* Bits 2:0 match PMI8998 TYPE_C_INTRPT_ENB_SOFTWARE_CTRL */
> +#define SMB5_TYPE_C_MODE_CFG				0x544
> +#define SMB5_EN_TRY_SNK_BIT				BIT(4)
> +#define SMB5_EN_SNK_ONLY_BIT				BIT(1)
> +
> +#define SMB5_TYPEC_TYPE_C_VCONN_CONTROL			0x546
> +#define SMB5_VCONN_EN_ORIENTATION_BIT			BIT(2)
> +#define SMB5_VCONN_EN_VALUE_BIT				BIT(1)
> +#define SMB5_VCONN_EN_SRC_BIT				BIT(0)
> +
> +
> +#define SMB5_TYPE_C_DEBUG_ACCESS_SINK			0x54a
> +#define SMB5_TYPEC_DEBUG_ACCESS_SINK_MASK		GENMASK(4, 0)
> +
> +#define SMB5_DEBUG_ACCESS_SRC_CFG			0x54C
> +#define SMB5_EN_UNORIENTED_DEBUG_ACCESS_SRC_BIT	BIT(0)
> +
> +#define SMB5_TYPE_C_EXIT_STATE_CFG			0x550
> +#define SMB5_BYPASS_VSAFE0V_DURING_ROLE_SWAP_BIT	BIT(3)
> +#define SMB5_SEL_SRC_UPPER_REF_BIT			BIT(2)
> +#define SMB5_EXIT_SNK_BASED_ON_CC_BIT			BIT(0)

<snip>

>  /* Init sequence derived from vendor downstream driver */
> -static const struct smb_init_register smb_init_seq[] =3D {
> -	{ .addr =3D AICL_RERUN_TIME_CFG, .mask =3D AICL_RERUN_TIME_MASK, .val =
=3D 0 },
> +static const struct smb_init_register smb5_init_seq[] =3D {
> +	{ .addr =3D USBIN_CMD_IL, .mask =3D USBIN_SUSPEND_BIT, .val =3D 0 },
> +	/*
> +	 * By default configure us as an upstream facing port
> +	 * FIXME: This will be handled by the type-c driver
> +	 */
> +	{ .addr =3D SMB5_TYPE_C_MODE_CFG,
> +	  .mask =3D SMB5_EN_TRY_SNK_BIT | SMB5_EN_SNK_ONLY_BIT,
> +	  .val =3D SMB5_EN_TRY_SNK_BIT },

Since there's already a driver for the Type-C in pm8150b and pm7250b,
can we remove this? Or is additional plumbing between the two drivers
necessary to make this work? Maybe Bryan can also jump in here.

Regards
Luca

> +	{ .addr =3D SMB5_TYPEC_TYPE_C_VCONN_CONTROL,
> +	  .mask =3D SMB5_VCONN_EN_ORIENTATION_BIT | SMB5_VCONN_EN_SRC_BIT |
> +		  SMB5_VCONN_EN_VALUE_BIT,
> +	  .val =3D SMB2_VCONN_EN_SRC_BIT },
> +	{ .addr =3D SMB5_DEBUG_ACCESS_SRC_CFG,
> +	  .mask =3D SMB5_EN_UNORIENTED_DEBUG_ACCESS_SRC_BIT,
> +	  .val =3D SMB5_EN_UNORIENTED_DEBUG_ACCESS_SRC_BIT },
> +	{ .addr =3D SMB5_TYPE_C_EXIT_STATE_CFG,
> +	  .mask =3D SMB5_SEL_SRC_UPPER_REF_BIT,
> +	  .val =3D SMB5_SEL_SRC_UPPER_REF_BIT },
> +	/*
> +	 * Disable Type-C factory mode and stay in Attached.SRC state when VCON=
N
> +	 * over-current happens
> +	 */
> +	{ .addr =3D TYPE_C_CFG,
> +	  .mask =3D APSD_START_ON_CC_BIT,
> +	  .val =3D 0 },
> +	{ .addr =3D SMB5_TYPE_C_DEBUG_ACCESS_SINK,
> +	  .mask =3D SMB5_TYPEC_DEBUG_ACCESS_SINK_MASK,
> +	  .val =3D 0x17 },
