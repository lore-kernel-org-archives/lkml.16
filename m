Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83E42BFC83;
	Tue, 13 May 2025 19:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747165347; cv=none; b=if2Gxc5RQ1Gj5BHN4ZpvN7QpD+d2gKm6OyvPwn6KEVB78+Qv9IDxsVUycdOHyKffMQ/1EgSkMdgKI2SQHZGvYJLmDf1N0EWDVqacfLvjVn/8ke7krU3wjraCrN+tM8eJihEpnZufAF6cMUkvTExL7l+P3xAx6O1vAo/o0M32+pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747165347; c=relaxed/simple;
	bh=8BN5j7cNFXmmbrRrvFPjdbDL/2JU79dE/kdWYSSmOL0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FcyeLBxqoVpJGegAF9I2/6xiUKFTWZnRapsuoxFDMV5YYn0tQ5C7Wp4P3gEGKv7g1OQpJpdBO8/Z6VUk2HVCIpbbrTsXXdYADrKiSPndvFtBYWEuAlBxOUwW5/B1Sx2neZIWrGIS8m4IbaxuMi0Gh7iWQmvFF65+I8uSQNRUs2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=UCQyny97; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="UCQyny97"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1747165343; x=1747770143; i=w_armin@gmx.de;
	bh=fddHqwrhkHOiCUxiWGVuWeBgKP7fSVA6+8wEaA+CJ7s=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=UCQyny973nbwNnAn98OV+e62BjRzuVM1L1d5tZdc5Zh6lGsOejdLEL1cij1YiykV
	 RSSZY2mDGCEU3+Cvov26x9gC1Sgvw03nNoG8zXNZm23SS/k6dagoPalcOyOz/i7Kx
	 YgFNtNk5u4xkkiAItAjqI2NIzgsYNwaHYOuTUbnWqJ8cBwh42tV4kandwFasYd9Eg
	 JHfBH8Y1Mzm+kCKp2iJi459S9tXx1ogiWekQQpBlGtqglWXsWI2n5c9/BBlPKqS8s
	 jeorR0MPusDJBOHdNR4Mf6VDn0vKG/7QponDYJR6HVtxWpdb6OdUHzbhvId53zHUL
	 CKAWfIx6d974lS1U1w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTRR0-1uR4cc2XnQ-00SZqk; Tue, 13
 May 2025 21:42:22 +0200
Message-ID: <d6842862-935f-4b3e-9f67-69e09307b851@gmx.de>
Date: Tue, 13 May 2025 21:42:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/10] platform/x86: msi-wmi-platform: Use input buffer
 for returning result
To: Kurt Borja <kuurtb@gmail.com>, Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org
References: <20250511204427.327558-1-lkml@antheas.dev>
 <20250511204427.327558-2-lkml@antheas.dev>
 <D9TQ1OS3HDY7.DR4X47HLSEND@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <D9TQ1OS3HDY7.DR4X47HLSEND@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:n6niDBNBzb3ookZc3wB0Z44lPc5zCUL6P5R0iPEjP2hMvi9sZNl
 +Bl0OFPhKgqi6gJaLM9+WCZGoXrLtnoOLmsj35jL40mvq8Uody5UM5RI6dcbJCT4VXDp9sy
 ld/pHFM1X0Yt4cWIgFBicbLwYRHr4nV6DPnLlNgkfkj06dQ/FCirXtxLLP5BmGKDlpFeIxX
 6FLs1IQpy6uObDqJvTmkQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:enSVlC81VmA=;8b4eaoABKJmEVompC8esl5kBQxL
 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

Am 12.05.25 um 01:31 schrieb Kurt Borja:

> On Sun May 11, 2025 at 5:44 PM -03, Antheas Kapenekakis wrote:
>> From: Armin Wolf <W_Armin@gmx.de>
>>
>> Modify msi_wmi_platform_query() to reuse the input buffer for
>> returning the result of a WMI method call. Using a separate output
>> buffer to return the result is unnecessary because the WMI interface
>> requires both buffers to have the same length anyway.
>>
>> Co-developed-by: Antheas Kapenekakis <lkml@antheas.dev>
>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>>   drivers/platform/x86/msi-wmi-platform.c | 53 ++++++++++++------------=
-
>>   1 file changed, 26 insertions(+), 27 deletions(-)
>>
>> diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/platform=
/x86/msi-wmi-platform.c
>> index dc5e9878cb682..41218a9d6e35d 100644
>> --- a/drivers/platform/x86/msi-wmi-platform.c
>> +++ b/drivers/platform/x86/msi-wmi-platform.c
>> @@ -21,6 +21,7 @@
>>   #include <linux/mutex.h>
>>   #include <linux/printk.h>
>>   #include <linux/rwsem.h>
>> +#include <linux/string.h>
>>   #include <linux/types.h>
>>   #include <linux/wmi.h>
>>  =20
>> @@ -140,19 +141,19 @@ static int msi_wmi_platform_parse_buffer(union ac=
pi_object *obj, u8 *output, siz
>>   }
>>  =20
>>   static int msi_wmi_platform_query(struct msi_wmi_platform_data *data,
>> -				  enum msi_wmi_platform_method method, u8 *input,
>> -				  size_t input_length, u8 *output, size_t output_length)
>> +				  enum msi_wmi_platform_method method, u8 *buffer,
>> +				  size_t length)
>>   {
>>   	struct acpi_buffer out =3D ACPI_ALLOCATE_BUFFER, NULL };
>>   	struct acpi_buffer in =3D
>> -		.length =3D nput_length,
>> -		.pointer =3Dnput
>> +		.length =3Dength,
>> +		.pointer =3Duffer
>>   	};
>>   	union acpi_object *obj;
>>   	acpi_status status;
>>   	int ret;
>>  =20
>> -	if (!input_length || !output_length)
>> +	if (!length)
>>   		return -EINVAL;
>>  =20
>>   	/*
>> @@ -169,7 +170,7 @@ static int msi_wmi_platform_query(struct msi_wmi_pl=
atform_data *data,
>>   	if (!obj)
>>   		return -ENODATA;
>>  =20
>> -	ret =3Dsi_wmi_platform_parse_buffer(obj, output, output_length);
>> +	ret =3Dsi_wmi_platform_parse_buffer(obj, buffer, length);
>>   	kfree(obj);
>>  =20
>>   	return ret;
>> @@ -185,17 +186,15 @@ static int msi_wmi_platform_read(struct device *d=
ev, enum hwmon_sensor_types typ
>>   				 int channel, long *val)
>>   {
>>   	struct msi_wmi_platform_data *data =3Dev_get_drvdata(dev);
>> -	u8 input[32] =3D 0 };
>> -	u8 output[32];
>> +	u8 buffer[32] =3D 0 };
>>   	u16 value;
>>   	int ret;
>>  =20
>> -	ret =3Dsi_wmi_platform_query(data, MSI_PLATFORM_GET_FAN, input, sizeo=
f(input), output,
>> -				     sizeof(output));
>> +	ret =3Dsi_wmi_platform_query(data, MSI_PLATFORM_GET_FAN, buf, sizeof(=
buf));
> s/buf/buffer/
>
>>   	if (ret < 0)
>>   		return ret;
>>  =20
>> -	value =3Det_unaligned_be16(&output[channel * 2 + 1]);
>> +	value =3Det_unaligned_be16(&buffer[channel * 2 + 1]);
>>   	if (!value)
>>   		*val =3D;
>>   	else
>> @@ -245,13 +244,17 @@ static ssize_t msi_wmi_platform_write(struct file=
 *fp, const char __user *input,
>>   		return ret;
>>  =20
>>   	down_write(&data->buffer_lock);
>> -	ret =3Dsi_wmi_platform_query(data->data, data->method, payload, data-=
>length, data->buffer,
>> +	ret =3Dsi_wmi_platform_query(data->data, data->method, data->buffer,
> Is this logic right? Shouldn't we pass payload instead of data->buffer?
>
> Better yet, I think we should write the payload directly to
> data->buffer and drop the memcpy hunk bellow
>
You are right that we indeed pass the wrong buffer here, but we should onl=
y update data->buffer
if msi_wmi_platform_query() was successful. That why we have the call to m=
emcpy().

Thanks,
Armin Wolf

