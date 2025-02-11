Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B901E32B7;
	Tue, 11 Feb 2025 05:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739251140; cv=none; b=gFIn9k/nJfhsVW+5c/pTUiV+bfHbOFTi2Sy1DRW9VhwQrEMEEqm9GIsLt0xsUyUEgZN85oQW1pcy/1SLJ8hQ7re9cCTSrfjHxXRt2N1UVLp93DJXNtrjeULWdHw9ZWjmn5R++tH/5o1td42+AL9bJYz62gxx4rfJhtJrWW+VgNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739251140; c=relaxed/simple;
	bh=vCpVS8jOZHbPPE/OgBcFBOxXGX5qaeUoEsJTt/C2pg8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=uKWPmT8ajBbSXSWNH4FqXTZnRbdio6KQSLUHNsKj2+2XHApKLjMoOE57R03/2YgZVEHVrZ8+9eWDZYWqwR98xeFzYJJlOtp1GJxqX8c+Duije05iOLQzWMkr/VVhBGkmDcw7HzI/OtmxWqZuLQuvOI+CJ/3F1Njo2VQpSdSW4Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U2b3SAJB; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U2b3SAJB"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e5ad75ca787so4407356276.0;
        Mon, 10 Feb 2025 21:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739251137; x=1739855937; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5FLcaTqIq+5/22Fa0xh0wsEUzfZy2dYLRFZvFZsw6xw=;
        b=U2b3SAJBZOI7Eb+CLUD2cz0sY7Kx+SRjC+pcvlJH7g0akuANO2jR0edHNhiGrz4ASq
         Cavi1xxWX+nbsR/7UNJuEow2VIVRfTdOtZXmAfyxnxLx2+4q8dmchGN8m6ato0Q4SNWy
         D9eyi86qkEOHkiVNvnNqbZxBxedB4h1b5Wo7vrlL7lysBJs1aeuj1FbC4Lq6b1aRBLB2
         F2owxSebx9QYKZyrB9ykkGo7MctRAug7DD70Mn3CFkKoSmBu16WuZNiCH6u/Bym4aoEl
         vxecL+3+o9kAZuUb1CjdzZa865oAp6VKALEZLlZyI1s/92oOV6kJyPz8ihZZKtTjwD58
         cWWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739251137; x=1739855937;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5FLcaTqIq+5/22Fa0xh0wsEUzfZy2dYLRFZvFZsw6xw=;
        b=uMpiALpTMIJlvXOJfFamAuktHfHSQJwSkDXJr0/xjyGI+D10VVTk2iW0PbMdXton0Z
         GqFq+EHg6DpWtT1xbdq6u3oREmTYzNLwQ2ByAu5osfwthRiobhU0CCp4o96j71TupvWY
         BIW7kegwvL47GVAPvonlzXSOicU4rHC+6fpG9n5mpAL99xRf2mZJLZLcqLAn0V1U1Uvq
         QJ3+N64U2XAne2/fB/3vM4FUIuKYtbOylBnw1gVlfWabFkCMSSWCGZ3bXvU8yDrnQrD5
         uzbp5pwVz+n6JJErTY08vaBSOUDyZ1MKgvE+qSNilifyXmcImSU0tgMUbLegDmweL2v3
         WRTA==
X-Forwarded-Encrypted: i=1; AJvYcCUmz1a1+uczRzmthntzqRvhvnT33zTz9pVR8bI10dFG0ckHUnyD7wv7pjd5DRTP+VToTRxODs4nPWiGAinGWfj5ec8tgg==@vger.kernel.org, AJvYcCVOFwr3dnPjm1xKULJXoJtPHbkOcadZfG2+IHB130jOCD6+MRvtWGWuMLo4hvO0w1vEuzv8FJMudMGkWSQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgRnAoLX75CYOEFrgYol89/3HWnaaej5L5YHDOCKrawIHfKg90
	wHLnbyVqWS2a0aNPLgNbcLubV6JAWytC0ZQluJfrnZC0qaeNvUbO
X-Gm-Gg: ASbGncuWfHbaWFO4qmV1AJ9qcB4atJTBW39J23E4QFG7ugeHPz9YFp40QOwUOIOJP+0
	f3fXqR9P7B3lw9tfITQqzgWYRd89idH6ZE+lbzUaoxDzihDc23TYLgZRPCjVyr5yKoQf7FUL5y+
	XXXJNc1OLWSufICamHB1FJzd+KcO9T4tdE6WJb3ubw4S2oB5B9fEwT5GV/OKn3bheF+junVR82O
	h4ADfOIHywvPPzUx1R3nsOTJ9sz1FfteOUOkTHbeIn0psh/KPU3R0Pm5sYJvd2jeD6uLpgLZkSx
	PArPnFs=
X-Google-Smtp-Source: AGHT+IG2JDBFmsNOysv14fjTvcjSExz9fFVSy5eowYU5Z6oWJyUxJHR8TtwFmA96mHGHNSw+/vhieg==
X-Received: by 2002:a05:6902:12cf:b0:e58:b99:6a5b with SMTP id 3f1490d57ef6-e5d944affb9mr2710073276.8.1739251137257;
        Mon, 10 Feb 2025 21:18:57 -0800 (PST)
Received: from localhost ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e5b3a1ef167sm2961722276.11.2025.02.10.21.18.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 21:18:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Feb 2025 00:18:54 -0500
Message-Id: <D7PD2KZCQJ4Z.BXO2PAN86IKH@gmail.com>
Cc: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
 <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] platform/x86: thinkpad_acpi: Fix registration of
 tpacpi platform driver
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Mark Pearson" <mpearson-lenovo@squebb.ca>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <mpearson-lenovo@squebb.ca>
 <20250210201656.4165-1-mpearson-lenovo@squebb.ca>
In-Reply-To: <20250210201656.4165-1-mpearson-lenovo@squebb.ca>

On Mon Feb 10, 2025 at 3:16 PM -05, Mark Pearson wrote:
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
> ---
> Changes in v2:
>   Modified approach to instead revert to old platform_profile_register
> method. Will revisit using devm_ version in the future as more testing
> needed.
>
>  drivers/platform/x86/thinkpad_acpi.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/=
thinkpad_acpi.c
> index 1fcb0f99695a..85d01bd5dc31 100644
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
> @@ -10665,8 +10665,14 @@ static int tpacpi_dytc_profile_init(struct ibm_i=
nit_struct *iibm)
>  	return 0;
>  }
> =20
> +static void dytc_profile_exit(void)
> +{
> +	platform_profile_remove(tpacpi_pprof);

I just noticed this will be called even if platform_profile_register()
fails, as the comment suggests.

We need to check for IS_ERR_OR_NULL() before unregistering.

--=20
 ~ Kurt

> +}
> +
>  static struct ibm_struct  dytc_profile_driver_data =3D {
>  	.name =3D "dytc-profile",
> +	.exit =3D dytc_profile_exit,
>  };
> =20
>  /***********************************************************************=
**

