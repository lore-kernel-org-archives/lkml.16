Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB0C264609;
	Mon, 10 Feb 2025 21:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739221630; cv=none; b=mLCh+YWodcRo6AcsZl5Bhkly1q5Ey06Y6oTblvEb6De8olS94Hmn4mnfYcJhYReaRU3uZgwElmAnAe3Jy1jA6qzz/OXtE06xOte6PIXoNmERuF95CYyto4miV7Sj3SlEvmldlm+LL7a0kptVsny8qMFlW+w+1iCyQiJMN/PlzF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739221630; c=relaxed/simple;
	bh=+kPqt7rv2eQ+xlea0zrpRcUrZQgB64sz2FU7SSBIwmg=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=Mbg8GIGOLXA170VjTJip4YEJHuOQ3sVNI0IfxqdeDu4Fmkz5GDlNcDFphRSf5l+Rl2V4xkIIOAPMhnJqpunN231yYSFOfpnZIOyhRZwD9xF+mm4hPGXn8TBRvjwK8Yq6sE/4clUhwZPFvTOACj/GtvJmjQPo2v9M+P6U+RJPcFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VGl4ZRt0; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VGl4ZRt0"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e5b1837d182so4803538276.0;
        Mon, 10 Feb 2025 13:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739221627; x=1739826427; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fsvIvPn83x29h5FtGetNQuqdMJAAK+W7Iwpsc5MKvE8=;
        b=VGl4ZRt027JJVcFi2JUQKiuDdAc15QAVQkDvLUf6wy5IozPW2f0cG737U4cYhpyV+H
         9vgUHFjLv70jE1SSmaCr+ICmxPIIq3xH4KU1DzgL2YaDs2a5v0btbKgY0ueyb6EbjCaa
         GG4iKiTUjNuXH2JeZroKuomSkK8t5lwaT/bJvpDbDlBnZ/LB/qDHOq1DOrOVgaGatxCP
         4YgYiXZK/ICJndmHjl7OVJDwOhtcMTuAKP9WvnL2wa0XzGWWnGXFHdpGx6sIN+vrip2z
         WghXhyYDrROhcGWAg8/YpBm3rNg3O0UBc9VauSPbk/R1O1gFvvMrX+4W4Roxe03rQFqr
         /tnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739221627; x=1739826427;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fsvIvPn83x29h5FtGetNQuqdMJAAK+W7Iwpsc5MKvE8=;
        b=qrU0HPWJnCz2u+xX7VSjoylfjVmK0tOHNvfd8vv5QfCWe5tdXEorm6otgYOTANaXAp
         Zpm3bqqo9/0VJsa0wfiuaYXpcjOLgsq1OyKoEZVgxVFgIHkGkg1EuwTJnUReuMk34XwE
         6cWEGInlAX45CZ0cb25UyLmsXtijhUPbsGcZvBlOwOfzl2C1KAVMPMJlpkGprEvswm2r
         4C9jr90MIM7KQh571sR3UX+g6SP/PIUZFfroQRPyepJ7ESFwSyY/g7DBr+0rQ1S6juli
         zG/+THfZfMoF/3Z2F/QND5epiOi5CCL8OeMjAxSFTzCGHGUknPOttkc00kGnMzFdIRLQ
         xfig==
X-Forwarded-Encrypted: i=1; AJvYcCU6OG1a6kZeF+KzSFAmz0elfnSxLzRVhpwRyyzu/iwB++03RDSFiSwA68D1sTxg2hHiakJjDFNAGJfeOvoXHA1hRNfG7w==@vger.kernel.org, AJvYcCUi6+9gihs+sqUWLE4RYiErMgWsJaGzStfqVVDRhWiQfCvParEd+gArKUEmrfvltFO0M8A3wN6QKcpixoQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8fmVBMta2ojICu8M8MoQcXcQKnQZJp8t2eE0ZMMvY8hWmMqZ8
	xYkdVnj04hv5h9oLcbMMjrO6gkzR2DjnZiiYjprsWlmHIDtVOKh7W9DD+A==
X-Gm-Gg: ASbGncsWylWj8shQ6RTB64qqbVy1nMQ917Olp4GqTf1gpxt8/bPzoGszH/Y6+EBwEsg
	4UrcxX2QoR2/jPkgFpBagJAT8MoiF9iGyHkavXDP0geBKcIcfgs7NfUH11uWzA38Nu7QGb9nyoq
	HXAR/kbtCnqUNLZtQF1uVvQyyODZTRlqXmm79cdp4eorSuH5a/ykV4A9q+Q2Bbg0sZLXdBrF4X5
	IG5W5xvGvWZV0G2XuCYKbZRfPK4FEWLQeI7M1Y1x3TMYVoG10nZK29QSvU6WefU9m5RDvW00K82
	5/bq/e6CkQ==
X-Google-Smtp-Source: AGHT+IEhTsp6AiDF9ybTJsMqL0IHWixCS2kK0c4He5Bpcxogyqi3gHVCnRNE1R9UsIvw3ZdfHQUR1Q==
X-Received: by 2002:a05:6902:15c6:b0:e59:a174:85e7 with SMTP id 3f1490d57ef6-e5d94529b31mr1475288276.17.1739221627371;
        Mon, 10 Feb 2025 13:07:07 -0800 (PST)
Received: from localhost ([2800:bf0:179:113e:f067:4e25:4298:6451])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e5b3a48b167sm2799220276.53.2025.02.10.13.07.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 13:07:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 10 Feb 2025 16:07:05 -0500
Message-Id: <D7P2M0PTVM84.2W5QT7R0Y3T50@gmail.com>
To: "Mark Pearson" <mpearson-lenovo@squebb.ca>
Cc: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
 <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] platform/x86: thinkpad_acpi: Fix registration of
 tpacpi platform driver
From: "Kurt Borja" <kuurtb@gmail.com>
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

If you don't mind I can work on this patch on the for-next branch, so we
may use devm_ on the next release cycle to avoid merge conflicts.

>
> Tested on X1 Carbon G12.
>
> Fixes: 31658c916fa6 ("platform/x86: thinkpad_acpi: Use devm_platform_prof=
ile_register()")
>
> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Reviewed-by: Kurt Borja <kuurtb@gmail.com>

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
> +}
> +
>  static struct ibm_struct  dytc_profile_driver_data =3D {
>  	.name =3D "dytc-profile",
> +	.exit =3D dytc_profile_exit,
>  };
> =20
>  /***********************************************************************=
**

