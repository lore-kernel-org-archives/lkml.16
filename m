Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E4C42A80;
	Tue, 13 May 2025 19:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747165643; cv=none; b=gy62OXQeG4ivkYrsyctG4l8OwmRKSQbz307dFkYm+gBt71tjxZpNrawQriEVW0sy8DsxkfXQzaRblu8n2EWF8W4/78Q4zw7jWZgbH15CSy25knPty5n5vbqjtzNBxZhBl70owlmrIfOElgJKEdZ6IUa48iItO1sQkeB4yexozbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747165643; c=relaxed/simple;
	bh=kQXIKFkHopB881D/+rcYsW/DSTtHXNPYYrm1SPaK0tc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CHnemhYGq/qAxFs1prjnLIZmoqgvmgCHs6HjtZWirBNt/EoyAIhjt6OTNpy38h+DekNdbatV4zyXUXffmHRwuY7JssfzuGGU+5DvQXSnJDGEWGIdFJH1ZEKq3nxUu8JYbbe73ARLboHsjm/OFrL7Xt6mCx0Le7rqmBhQ0B8Suuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=BmeY3436; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="BmeY3436"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1747165634; x=1747770434; i=w_armin@gmx.de;
	bh=Fo3Xxh2RrxttsgvFoCkccAxMzFFBRgehDBGJ7ejlRqU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=BmeY3436aXbXXnqf9fvOb13jxL4tUxNN26+v0xjXaeZwyzmWauKs61Sg6UR81AFd
	 bDImGXYzcroaszPo7VTDNKD0TaP5k0yiieE+FLljE3dxI+cKk/g+fXrQB//yo3YWS
	 ZnSgqltZIaTI04vEGlDlRJ43hqHw+IMHZJ7u+mRKFTLbKZtWAUzR8d3748TVNClSL
	 P4XMuv3Sj+vB//TLvrOlaMPe63mp9ueNbtpYkwSJuvzh8NOtRwNAAlC4R/7F+LCZd
	 bSEaAlIOil7W4N83GVRpUNex6R3PkuVX4IQ5kj7ykNSkCS5avfqyVXlyuffkCFyXQ
	 LImj9qI70QlyCNKKhA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MPokD-1uaBk11slX-00MNtI; Tue, 13
 May 2025 21:47:14 +0200
Message-ID: <487100c4-f507-426a-b6fd-58a4cefced47@gmx.de>
Date: Tue, 13 May 2025 21:47:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/10] platform/x86: msi-wmi-platform: Add unlocked
 msi_wmi_platform_query
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Kurt Borja <kuurtb@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20250511204427.327558-1-lkml@antheas.dev>
 <20250511204427.327558-3-lkml@antheas.dev>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250511204427.327558-3-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:93LxcMH+J0ZDaeNsAsDqPjI4w/OnB1nvcgp7bMHWSh9nSsv6eq4
 TlsuWDZMShZinvJvJ7x745xasQ3DdOSLTRK4iB8X2kXxk8G62iec3/kFjMTgBsZIOFn+2Gz
 2Jn+Y4r8jJVWRRlMQ8IwmlvPJoAudo5L9PmOXN+X4PJBnqPzHkC/Mp0gMGbhnUYR/OINXAd
 c+GReJ8b2UkLiedCPF9rQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Sm3Rgi+gKPA=;Pv2cyXgag1k4vfBoiXqhm2Tlpst
 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
 T+62GQJ9sK3DDpUeIPopkuDRHveihY7RED

Am 11.05.25 um 22:44 schrieb Antheas Kapenekakis:

> This driver requires to be able to handle transactions that perform
> multiple WMI actions at a time. Therefore, it needs to be able to
> lock the wmi_lock mutex for multiple operations.
>
> Add msi_wmi_platform_query_unlocked() to allow the caller to
> perform the WMI query without locking the wmi_lock mutex, by
> renaming the existing function and adding a new one that only
> locks the mutex.
>
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>   drivers/platform/x86/msi-wmi-platform.c | 27 ++++++++++++++++---------
>   1 file changed, 17 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/platform/=
x86/msi-wmi-platform.c
> index 41218a9d6e35d..f0d1b8e1a2fec 100644
> --- a/drivers/platform/x86/msi-wmi-platform.c
> +++ b/drivers/platform/x86/msi-wmi-platform.c
> @@ -140,7 +140,7 @@ static int msi_wmi_platform_parse_buffer(union acpi_=
object *obj, u8 *output, siz
>   	return 0;
>   }
>  =20
> -static int msi_wmi_platform_query(struct msi_wmi_platform_data *data,
> +static int msi_wmi_platform_query_unlocked(struct msi_wmi_platform_data=
 *data,
>   				  enum msi_wmi_platform_method method, u8 *buffer,
>   				  size_t length)
>   {
> @@ -156,15 +156,9 @@ static int msi_wmi_platform_query(struct msi_wmi_pl=
atform_data *data,
>   	if (!length)
>   		return -EINVAL;
>  =20
> -	/*
> -	 * The ACPI control method responsible for handling the WMI method cal=
ls
> -	 * is not thread-safe. Because of this we have to do the locking ourse=
lf.
> -	 */
> -	scoped_guard(mutex, &data->wmi_lock) {
> -		status =3D wmidev_evaluate_method(data->wdev, 0x0, method, &in, &out)=
;
> -		if (ACPI_FAILURE(status))
> -			return -EIO;
> -	}
> +	status =3D wmidev_evaluate_method(data->wdev, 0x0, method, &in, &out);
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
>  =20
>   	obj =3D out.pointer;
>   	if (!obj)
> @@ -176,6 +170,19 @@ static int msi_wmi_platform_query(struct msi_wmi_pl=
atform_data *data,
>   	return ret;
>   }
>  =20
> +static int msi_wmi_platform_query(struct msi_wmi_platform_data *data,
> +				  enum msi_wmi_platform_method method, u8 *buffer,
> +				  size_t length)
> +{
> +	/*
> +	 * The ACPI control method responsible for handling the WMI method cal=
ls
> +	 * is not thread-safe. Because of this we have to do the locking ourse=
lf.
> +	 */
> +	scoped_guard(mutex, &data->wmi_lock) {
> +		return msi_wmi_platform_query_unlocked(data, method, buffer, length);
> +	}

Please just use guard() here.

Thanks,
Armin Wolf

> +}
> +
>   static umode_t msi_wmi_platform_is_visible(const void *drvdata, enum h=
wmon_sensor_types type,
>   					   u32 attr, int channel)
>   {
