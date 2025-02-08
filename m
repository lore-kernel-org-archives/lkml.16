Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851EC137E;
	Sat,  8 Feb 2025 04:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738990593; cv=none; b=WVIBieXnO9ZTSdcVepX3l5lugG0S+PSrPKjQzdqYpZkFpN/WRoMVmXb2Kxhq0ZFnfD888HEpxVQ7dMC1CY/8yzZA4iAceOZW/vN9f/ItV3rAea+d2vT5HA3Xkpk1GPsAaxXXt+Nrcm/Sou3EKutulV3VYShY0D3POmPtMi5Hvls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738990593; c=relaxed/simple;
	bh=1xH0rXlxslCsvMagEgTmTkga4D1lQaTTjagj+kgbe+M=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=EHTpD3KOzqAWpaT1oG8uqKiWbJWLNjBL7JvKr7BejsiPWoe+Kd2Ousy9LJN5I9231Ml4K7keJCjUXkntmheXHAIPugBSEo3mSO4fbfXX7qEk0OzhNi6tRkafII4ehMLJABud3G3KuuFIdjghGssi9OrE++xGq6jm4gH07+doD3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TsD/02yM; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TsD/02yM"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6f6ae4846c7so22766447b3.1;
        Fri, 07 Feb 2025 20:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738990590; x=1739595390; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tDTR9wmDUXxWBvJfcOonLq9hCC3mb/PA0wHV0DIQuyY=;
        b=TsD/02yMVg5yxP2iFsyeUjFkWjesFddX/Vf1DCCqJRp/Fm1ny2HoK14NIIW6FR2Qc+
         tfhKc3XzVHW/LoNodWHOTIL9L6lWhkA9u+cBefuUPPdY13N4O3DoVT7u1YvVO1Aes4rG
         qfxqb9TBVHieK4LXVwLG0yWFNYS9q4tFmRcEAnI+zFzewned2mnwr3Z/EDZNTUBXhwC5
         Icp4NzAnc7/cFBdVhlwwtKU9BPXWrYJNUUokhhXP3GY8TYmgckig6zZcdwl4Ezk2lGC1
         C3KbO8pAFnZO6bREjma6w+5uNO4U0B3uOGax2CShbpzO3W0F1Taru9z5WnAhtnHZUgbk
         qIYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738990590; x=1739595390;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tDTR9wmDUXxWBvJfcOonLq9hCC3mb/PA0wHV0DIQuyY=;
        b=Cb7eGtNIj2l0ZhYWYt8NML2Ki7/vq2G3dG+tAkDbKBPUbsTMF3SOiPhfLtRVTv+Svr
         NRt07mCpjFM5AHlQgR1nbLsh5Ci2gQhabq3A48LK2HliRIe/ockQ8DZadhyH7VD0b+Et
         XCwvjf4Jm/ZEchCXC4Hvc1j/W9tq1TJhnJcIvFV2DKKIxsXOjERh4rImYmiURY/Y+Da4
         efBWFUnIwvfKv3mSi29qAiJjfI6hSWgto3RGiOI0M1N/U1Bkvoi3olhulP2kVpmP1z7W
         /6svIela6SDQCTS6eFw2lkx06uCs1zEmW71y2a3NMi4B0r4qIiieFSk+LiyE6i6Pk2GR
         zLpw==
X-Forwarded-Encrypted: i=1; AJvYcCX4iAT+fN72GhNdR4YnJuRY+zkfVjwZWfkfeIWC470mDJDF3mGZT/E6G0M59DqKYZ5Ke8zkxCiBFhCARW1S26uobyvzVA==@vger.kernel.org, AJvYcCX62RskSW1HbvLVs8JglyTWCgyhh3EonIzUXTZjYAYg9KJzJg3t/y4fYSlAb/O4ly+vG3v0VQ9fkHHFNew=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9xVXXvuSVVPtTR0DgH9aL+MjIMcr39VOKrAgvjRAv6pVLFx9s
	I8IpbTnkCBjiquc2rn4j7a+X0ZHRTveO9d1Alon3FeltezRUZCsfkqlZ/A==
X-Gm-Gg: ASbGncvYSsncsvuDK3JFz/kcjAMN9Vn5PRNn/5QRHHe/2A5yJFQA59VzLvHIQ4zccXu
	bUh6VLmAJVl+iFbb7D9jD3196Het1/kf4otR1lZnDDs1UZPU6UmGz+3d1m/3GnvFVhcOt58qpsO
	25qLbcT7PY+itoiViSExx3qfYx3HLGITHt60r2ehG5ttl0Ml+ug0upBTk5Symx1fh7aLI04TuQM
	aBE9A8SldMcFHRip1b7YtAc2aCjyv1zfFaxbWQCp0sPj5EPAQC42vG6g1OHMnxksendcMJPGNaA
	zdhtqgc=
X-Google-Smtp-Source: AGHT+IGl0nFf/LVFmPHl00CIJamXl59Pe4edXJOlNf7Ij4zjfD8DLqu9S13x5U4uEfr+7ZMij6oXPg==
X-Received: by 2002:a05:690c:6087:b0:6ef:652b:91cf with SMTP id 00721157ae682-6f9b2981ae8mr55437877b3.27.1738990590281;
        Fri, 07 Feb 2025 20:56:30 -0800 (PST)
Received: from localhost ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f99ff6a8c2sm7886057b3.77.2025.02.07.20.56.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 20:56:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Feb 2025 23:56:27 -0500
Message-Id: <D7MSPR52PB4E.N0X1UFVQOODZ@gmail.com>
Cc: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
 <mario.limonciello@amd.com>, <platform-driver-x86@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Fix registration of tpacpi
 platform driver
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Mark Pearson" <mpearson-lenovo@squebb.ca>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <mpearson-lenovo@squebb.ca>
 <20250208091438.5972-1-mpearson-lenovo@squebb.ca>
In-Reply-To: <20250208091438.5972-1-mpearson-lenovo@squebb.ca>

Hi Mark,

On Sat Feb 8, 2025 at 4:14 AM -05, Mark Pearson wrote:
> When reviewing and testing the recent platform profile changes I had
> missed that they prevent the tpacpi platform driver from registering.
> This error is seen in the kernel logs, and the various tpacpi entries
> are not created:
> [ 7550.642171] platform thinkpad_acpi: Resources present before probing

This happens because in thinkpad_acpi_module_init(), ibm_init() is
called before platform_driver_register(&tpacpi_pdriver), therefore
devm_platform_profile_register() is called before tpacpi_pdev probes.

As you can verify in [1], in the probing sequence, the driver core
verifies the devres list is empty, which in this case is not because of
the devm_ call.

>
> I believe this is because the platform_profile driver registers the
> device as part of it's initialisation in devm_platform_profile_register,
> and the thinkpad_acpi driver later fails as the resource is already used.
>
> Modified thinkpad_acpi so that it has a separate platform driver for the
> profile handling, leaving the existing tpacpi_pdev to register
> successfully.

While this works, it does not address the problem directly. Also it is
discouraged to create "fake" platform devices [2].

May I suggest moving tpacpi_pdriver registration before ibm_init()
instead, so ibm_init_struct's .init callbacks can use devres?

Thanks for noticing this!

~ Kurt

[1] https://elixir.bootlin.com/linux/v6.13.1/source/drivers/base/dd.c#L626
[2] https://lore.kernel.org/rust-for-linux/2025020620-skedaddle-olympics-17=
35@gregkh/

>
> Tested on X1 Carbon G12.
>
> Fixes: 31658c916fa6 ("platform/x86: thinkpad_acpi: Use devm_platform_prof=
ile_register()")
>
> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/=
thinkpad_acpi.c
> index 1fcb0f99695a..1dd8f3cc5eda 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -270,6 +270,7 @@ enum tpacpi_hkey_event_t {
>  #define TPACPI_DRVR_NAME TPACPI_FILE
>  #define TPACPI_DRVR_SHORTNAME "tpacpi"
>  #define TPACPI_HWMON_DRVR_NAME TPACPI_NAME "_hwmon"
> +#define TPACPI_PROFILE_DRVR_NAME TPACPI_NAME "_profile"
> =20
>  #define TPACPI_NVRAM_KTHREAD_NAME "ktpacpi_nvramd"
>  #define TPACPI_WORKQUEUE_NAME "ktpacpid"
> @@ -962,6 +963,7 @@ static const struct proc_ops dispatch_proc_ops =3D {
> =20
>  static struct platform_device *tpacpi_pdev;
>  static struct platform_device *tpacpi_sensors_pdev;
> +static struct platform_device *tpacpi_profile_pdev;
>  static struct device *tpacpi_hwmon;
>  static struct device *tpacpi_pprof;
>  static struct input_dev *tpacpi_inputdev;
> @@ -10646,7 +10648,8 @@ static int tpacpi_dytc_profile_init(struct ibm_in=
it_struct *iibm)
>  			"DYTC version %d: thermal mode available\n", dytc_version);
> =20
>  	/* Create platform_profile structure and register */
> -	tpacpi_pprof =3D devm_platform_profile_register(&tpacpi_pdev->dev, "thi=
nkpad-acpi",
> +	tpacpi_pprof =3D devm_platform_profile_register(&tpacpi_profile_pdev->d=
ev,
> +						      "thinkpad-acpi-profile",
>  						      NULL, &dytc_profile_ops);
>  	/*
>  	 * If for some reason platform_profiles aren't enabled
> @@ -11815,6 +11818,8 @@ static void thinkpad_acpi_module_exit(void)
> =20
>  	if (tpacpi_sensors_pdev)
>  		platform_device_unregister(tpacpi_sensors_pdev);
> +	if (tpacpi_profile_pdev)
> +		platform_device_unregister(tpacpi_profile_pdev);
>  	if (tpacpi_pdev)
>  		platform_device_unregister(tpacpi_pdev);
>  	if (proc_dir)
> @@ -11901,6 +11906,17 @@ static int __init thinkpad_acpi_module_init(void=
)
>  		thinkpad_acpi_module_exit();
>  		return ret;
>  	}
> +
> +	tpacpi_profile_pdev =3D platform_device_register_simple(TPACPI_PROFILE_=
DRVR_NAME,
> +							      PLATFORM_DEVID_NONE, NULL, 0);
> +	if (IS_ERR(tpacpi_profile_pdev)) {
> +		ret =3D PTR_ERR(tpacpi_profile_pdev);
> +		tpacpi_profile_pdev =3D NULL;
> +		pr_err("unable to register platform profile device\n");
> +		thinkpad_acpi_module_exit();
> +		return ret;
> +	}
> +
>  	tpacpi_sensors_pdev =3D platform_device_register_simple(
>  						TPACPI_HWMON_DRVR_NAME,
>  						PLATFORM_DEVID_NONE, NULL, 0);

