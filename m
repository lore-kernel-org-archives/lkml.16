Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA8226156B;
	Tue, 11 Feb 2025 17:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739295782; cv=none; b=aFxhVSZvr5YWn7/SZw4viHMOKAhfv9oiRsK3+Lx8YoOQjXLw2/PLIxk+4JdSW7lDoxOrq6wuSrTnFf6DQUt8uGvH3ElEvQ4j8kesy4k7arj77rrq2k8aFtbQS+vKw6ijfxBEa46d6PYpR1FSPrmGrfop/MFDYTth1pxym58Qinw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739295782; c=relaxed/simple;
	bh=ChKjvMEvJSMWtX9KEj2DnE9NZQt69bxJyqUBh1QvPuo=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=V61oYamORLRIbgCDzUCkov+8shMhO0hjk8S3p3MKPKZdR7sAEApKSupuY/yeSn2jyh/TvFRIoz0WWKtmdlnjKfAfalWPeHZ1OJ2sUxVJALc54bee5swP5UIBPCGvpguxuy0xBo1XXVIiwuFAC1MVyFDbb8M8ryDpzGi1W1yBYGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F6z4feJB; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F6z4feJB"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6f9b8291c49so33974477b3.1;
        Tue, 11 Feb 2025 09:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739295780; x=1739900580; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NQVgQEEbOB9T8VGP0f+NZEWosrFRbZaF4Ld3+nAKzx8=;
        b=F6z4feJB0oiIWJrsQZR+l33kEkDMaYRpAMDOrKtHDuYA6C19EjPjUGpEgo3LM1YL0C
         lmvVhXXHZlo9Vr+MBinxQafblSJ+9VSvAMc63GnxWaz3NU8GPXShXr6HPjGizn1+22Gb
         A9auffvpmSOe/RBL7IUQ4VnGALGoPglItj9Q/ApkSGQ3QfWVK2a7xCA2ZFxVtwqzZSTq
         EZCXYPK4Q9urwdjWxNvXEO1JNNZ3QdRoDAObNmRCgF/03/yvqfldrhG+WmcsToUJJY6z
         nuFSQFzYWUKxA95CoMoP6QxBqB4Kg3NhCFptEzqMsFBAagxKpj5JMmY+L+64ijSrp1ft
         fr/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739295780; x=1739900580;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NQVgQEEbOB9T8VGP0f+NZEWosrFRbZaF4Ld3+nAKzx8=;
        b=CNmlS7drwfn6fts/I1rHh65baMBexG7d1haz1PgCCEuKkgOcX3CoQDyhuwNmqugFqH
         lvezLo0OlPTT0Giwhqs+fcDdSrWFnz12Hw+81S2DZfgpkrKJAnb5/jFWpix6AZKTmzF9
         FRsdgDvVHxoxvUKgu0xhbT1GqAF3Qnnmq8zoKQsRz/DYbuQ2o4nWhjO5LFoWbSNyBwSf
         aEiMcqkIjfQx/yOUsQYvEx8UQ9sqnjrW8AQutYErmyq76r4aBOiowmcAT115pQChEMIp
         EmMX3fSPbUwrQfbUXZWbTkONmZJhKX3i1g+Xh28QVoCRxtQGBl2N2CSoQmxHmhJD3+eY
         bGmw==
X-Forwarded-Encrypted: i=1; AJvYcCUM6Nb3b12NzdNkG4d+wNEvKdpWOoozsuWgPbYZkiw4kbF7edsUq9G9TK7aUHTX3vKE3XxwQ9AHe0aYufU=@vger.kernel.org, AJvYcCVve34xeu/gCn00LDJfmDJ4hxsX0im8WjgkgXAfewzvVFg6V+aeue32HppWD7Detdd6Abq2DnIg9DcPKQbGYyjUfKb66w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYzs9U6lrjhSRqvLAnTn4tdat38H8FviX3/ASnvQl09pkoXAtt
	ltMB2wwbPe8IvG0ti/wGcuhoAd1z5rm4U2/zw94iMx2qza72CDO9o/JxVA==
X-Gm-Gg: ASbGncuhpw5CNWIJpAEHef5zwiDmzVyN26OMUuC77sqr92WYAAQ9gvG4x5epGgy8T6u
	ZV0Q4IXCXOAUPMc8GH97mqFEYMssRNXweulzlW9cPZzFS8NK2Wl3WpEV6xxRJPnsic00nrrBtBV
	z7YdMFcAb74upkT9rf7eCwWYB3T8UVR6/gADfaWfLZLUC2Y4SSK6RMdY7+VAgdelPI++Q59ESIz
	wP23N/LuBZND+0pqLyf52FsBK6yYxZ3andQj9SQnu56odmYU8zRHQDlByFfQo21JSBaFaWhuhu1
	+AVV73JM
X-Google-Smtp-Source: AGHT+IGGoSmTT5zpidOOSh2K9BoP1r4J335nT+oKqn4JdomzP8o1pLpEQtbpIQrNhIrxAmsuYggDmw==
X-Received: by 2002:a05:690c:6a87:b0:6ef:81c0:5b56 with SMTP id 00721157ae682-6fb1f196607mr5488697b3.14.1739295780055;
        Tue, 11 Feb 2025 09:43:00 -0800 (PST)
Received: from localhost ([2800:bf0:61:1288:72d5:e7e1:d832:2e3d])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f99fce16c6sm22494007b3.22.2025.02.11.09.42.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 09:42:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Feb 2025 12:42:58 -0500
Message-Id: <D7PSW9W74P7I.GBMKQD7EGPXT@gmail.com>
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Mark Pearson" <mpearson-lenovo@squebb.ca>
Cc: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
 <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] platform/x86: thinkpad_acpi: Fix registration of
 tpacpi platform driver
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <mpearson-lenovo@squebb.ca>
 <20250211173620.16522-1-mpearson-lenovo@squebb.ca>
In-Reply-To: <20250211173620.16522-1-mpearson-lenovo@squebb.ca>

On Tue Feb 11, 2025 at 12:36 PM -05, Mark Pearson wrote:
> When reviewing and testing the recent platform profile changes I had
> missed that they prevent the tpacpi platform driver from registering.
> This error is seen in the kernel logs, and the various tpacpi entries
> are not created:
> [ 7550.642171] platform thinkpad_acpi: Resources present before probing
>
> This happens because devm_platform_profile_register() is called before
> tpacpi_pdev probes (thanks to Kurt Borja for identifying root cause)
>
> For now revert back to the old platform_profile_register to fix the
> issue. Will work on re-implementing this later as more testing is needed
> for full solution.
>
> Tested on X1 Carbon G12.
>
> Fixes: 31658c916fa6 ("platform/x86: thinkpad_acpi: Use devm_platform_prof=
ile_register()")
>
> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>

I believe this is done now!

Reviewed-by: Kurt Borja <kuurtb@gmail.com>

> ---
> Changes in v2:
> Modified approach to instead revert to old platform_profile_register
> method. Will revisit using devm_ version in the future as more testing
> needed.
> Changes in v3:
> Add check if tpacpi_pprof is valid before releasing.
>
>  drivers/platform/x86/thinkpad_acpi.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/=
thinkpad_acpi.c
> index 1fcb0f99695a..9f6d7e26e700 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -10646,8 +10646,8 @@ static int tpacpi_dytc_profile_init(struct ibm_in=
it_struct *iibm)
>  			"DYTC version %d: thermal mode available\n", dytc_version);
> =20
>  	/* Create platform_profile structure and register */
> -	tpacpi_pprof =3D devm_platform_profile_register(&tpacpi_pdev->dev, "thi=
nkpad-acpi",
> -						      NULL, &dytc_profile_ops);
> +	tpacpi_pprof =3D platform_profile_register(&tpacpi_pdev->dev, "thinkpad=
-acpi-profile",
> +						 NULL, &dytc_profile_ops);
>  	/*
>  	 * If for some reason platform_profiles aren't enabled
>  	 * don't quit terminally.
> @@ -10665,8 +10665,15 @@ static int tpacpi_dytc_profile_init(struct ibm_i=
nit_struct *iibm)
>  	return 0;
>  }
> =20
> +static void dytc_profile_exit(void)
> +{
> +	if (!IS_ERR_OR_NULL(tpacpi_pprof))
> +		platform_profile_remove(tpacpi_pprof);
> +}
> +
>  static struct ibm_struct  dytc_profile_driver_data =3D {
>  	.name =3D "dytc-profile",
> +	.exit =3D dytc_profile_exit,
>  };
> =20
>  /***********************************************************************=
**

