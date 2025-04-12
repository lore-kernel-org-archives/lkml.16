Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8540F1E531;
	Sat, 12 Apr 2025 00:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744417839; cv=none; b=NEbi20Tu6nFDc6ukJVstphsqwqI4FfKOU061jQYiyEj0uks4tJFjXMVPBbubS/NhWYlH7/WZ5qJRSu/3H4PSRCtXICNVD49dvsJQXGxK+/KKlcmEerw4VSxNXgKTk2tsMO2ju46ECjtiOi5FQlM2uSkShDDKka9Hht+w7u04nho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744417839; c=relaxed/simple;
	bh=ig6r7KAfGrfJNgL8UvjEGKSzoBVL+3lyCrcGgmAns1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k3dC8yRca2kuNgAlhGlNV17yFCVXJQ7Dk2aou8MSI7iJtJsaYQuDqts8t+565wN8iL2rrDXL7G5flW0FRI+NFidXKq6IL4PJWpCdIZ3Xewn3xyOkiN6TetsDy4gdormGScMToh6IxVq1Rp9MFPuwfbTKffqBeQK14pc2xFU8N/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=OeQB0JDQ; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="OeQB0JDQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1744417830; x=1745022630; i=w_armin@gmx.de;
	bh=AC339whnnmmgztMoygwbhbq5TRUkn1r0Fc+XoQoirlo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=OeQB0JDQ3Z21B9ppbGAGKLOBeu01OeJd9qH6XxTsQZWM134z852zwYvxx7oQ34w8
	 f1Wo5GyVwEjz8HyCxRsPmqLt/UHj20NjKfT33fZVx6KDT0Y60TANCBi6OPshQpH1O
	 38JLhWIuzoS569YUgAstIJWF4nfr8OqsRbJnh9mdw1OdojKk8KCfj8QPNYktJJlnX
	 uVUgOr1JjN8q3pSdqWqCs/d1hj0b1BAx4mRDZ0cre39W06EnD++2X5yy2OKXWEwHW
	 /7ItlPFtkwI5EGfrAn4wQDyrtUHC1NQr9kzHvfxwuoi9WUouUyPK96IOfKIn4cKRi
	 aDAfUKWzHbkDr5vxXA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MqJm5-1tH5iI2ob5-00hl1M; Sat, 12
 Apr 2025 02:30:29 +0200
Message-ID: <05f7b5b4-c692-4647-96d3-4935280e4097@gmx.de>
Date: Sat, 12 Apr 2025 02:30:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: msi-wmi-platform: Workaround a ACPI
 firmware bug
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, lkml@antheas.dev,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20250410212853.334891-1-W_Armin@gmx.de>
 <60a6574f-d6cd-671c-89d8-0307b440937e@linux.intel.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <60a6574f-d6cd-671c-89d8-0307b440937e@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:tDGg2/ScB69pq3K3p+t3Yyiw/NSBpscJ0bIKxPfuENKXF71onpz
 YwWR2eVagYf+ND828jQswZNz8kklRXPpFYu+pdvysWHJdWDxL2xzWu1XSr41JYQY7MNZAT0
 0d+M9ZkIYu4j6jNOHP+HoOMstSZEMUVn9dzo5O6VWsfvJFriICX30prkvP35QzGRfw1Nu3/
 o0H60tZ7wHi9CvXSFSrag==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:b0BbQi1DMy0=;CPPfu7a+yK9zuR4uZ8h5C9tJRJz
 SQSYSM7ecUWZ8ZTnJ4YMUdmfW80ozI4NY5r8TZkkfbS6Q+TT86NMIgWeegJdUvjh4us7dZU8R
 n1tievNwZFCpobqkO89J+9SFolsQo8cok25+4MzGgyqnnWSQ/z239wgKM9G92XNoWgozRBfWz
 E146rP72b0A6X05BqDuyiYhKVK4BYLRob3xD9x+VVNQ5q6CUZIFpWU9D5Slp7gEFvXLRPbab5
 QwaIRsz9Z+Cgqm2Dck/mLxkaDirHv9Y18hUN1GHSMSyqKlkrosXivMkezIFWbsMrRc6ob9tcS
 YpiFFKMh63VcnzfxGiDD7U5s2DT9Yg10mS2xamjldlYnK1IfNQp3Er2A7Xgz+Pk9lm+f9+s8e
 ed+T66ZMl6dyXvxx2L375fiwyQv7PpdCMm/kPmL11Ghbp+zSqI2d1w89InfJC1hG1SFuk0yER
 IxO9w3Oe8Yk6nfeSfhjjZowjqYdhazatzWgTAbq+z4GakAXwDVR6gdUj4cCFmMn4BpCf/V5Te
 75FV6twA7RzpWPIAx8S6q95V/jpqEeK73hGxADyIeVQndv97k4aAPCH0rJmFMpaawoMmmMjha
 zaBkBPcTz+YPEJDMNIPBUJdkhQWd50zOn0WfydOJUggfOjNgcgmQQD66FDY+NBSsoJqMbV/SB
 eZHYT1efgl4Z5U4eAay2EgrQuQRwtAfv7O4TaGdNN4docxSiR2RlxaUht7dhW9t4raASyE2AX
 h5AoV2h91Tfq0VlDPK8iE4eqngV6KC2SKdH4w/Xxqcy38B1wEzMTAyqtm3z+vwUxg4qxIp5oI
 +X9P9kgPLwoi0EfvTl6XHzesmusQvLs6Outl1Q3DC/fEc0+G4wR/5LQTifKGEH+2NwM67LyE6
 Qxh92Fkq9HpjSeysGCkrnciZ3jaZ+PyJnRQ2RAwfQ2H7NvkdrovuW8IcufCjZevjhwpyufC2r
 om4yrtrcbg/xHKgv4rq64klThnCQ/w/aQfwrPGeaZN6eC/FwRh3/yuaUHfIDNdb+XgCbxNirf
 oRpSvOCTswggkvLA8p5aDa/FWs9EeNeTCp/SbJonJ+FBB+88ul7WPRBbQDah16ZoouP3tpi/K
 UNLT+9eOUyj8aBCQ4FEUYc/O/ZioT3gvzfekXrCjbtcdrTRAzskgBV0j+9Tb7sjQ9qa1FS7TO
 nk3kGKVNNt2MtfItSqO5jVHq2CrIpu+OqsCog5Z+FdggVvQ+1TeLZCRrnu+TkQqsW05JoWShP
 N/1Yu1dnYBK/9/dRo914vlOBcWaUZzet9CFyf2LLZh7zMWMbUAg/gsb4U5yNdEa0LFfwDer+Z
 hTtwZkNuEFnvwe8Jb9k/uB/NXdd6qo58RiwWIcmfvN5tBKSuwxkGGPrfnqQBm2HjlSBDQD7HA
 bsO8ueV/MyYWUFgf4WcughcUP+xA9WxmxQRAjKp+ehS/fBWnovbV+4BfMbTTzkn9KXtBRXH2E
 DbwhPBbvOfdFR7iuwhv2zI16URsM=

Am 11.04.25 um 15:53 schrieb Ilpo J=C3=A4rvinen:

> On Thu, 10 Apr 2025, Armin Wolf wrote:
>
>> The ACPI byte code inside the ACPI control method responsible for
>> handling the WMI method calls uses a global buffer for constructing
>> the return value, yet the ACPI control method itself is not marked
>> as "Serialized".
>> This means that calling WMI methods on this WMI device is not
>> thread-safe, as concurrent WMI method calls will corrupt the global
>> buffer.
> Please avoid non-full lines in middle of a paragraph. Either make things
> truly own paragraphs or reflow the text in the paragraph.
>
>> Fix this by serializing the WMI method calls using a mutex.
>>
>> Fixes: 9c0beb6b29e7 ("platform/x86: wmi: Add MSI WMI Platform driver")
>> Tested-by: Antheas Kapenekakis <lkml@antheas.dev>
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>>   .../wmi/devices/msi-wmi-platform.rst          |  4 +
>>   drivers/platform/x86/msi-wmi-platform.c       | 99 ++++++++++++------=
-
>>   2 files changed, 67 insertions(+), 36 deletions(-)
>>
>> diff --git a/Documentation/wmi/devices/msi-wmi-platform.rst b/Documenta=
tion/wmi/devices/msi-wmi-platform.rst
>> index 31a136942892..73197b31926a 100644
>> --- a/Documentation/wmi/devices/msi-wmi-platform.rst
>> +++ b/Documentation/wmi/devices/msi-wmi-platform.rst
>> @@ -138,6 +138,10 @@ input data, the meaning of which depends on the su=
bfeature being accessed.
>>   The output buffer contains a single byte which signals success or fai=
lure (``0x00`` on failure)
>>   and 31 bytes of output data, the meaning if which depends on the subf=
eature being accessed.
>>
>> +.. note::
>> +   The ACPI control method responsible for handling the WMI method cal=
ls is not thread-safe.
>> +   This is a firmware bug that needs to be handled inside the driver i=
tself.
>> +
>>   WMI method Get_EC()
>>   -------------------
>>
>> diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/platform=
/x86/msi-wmi-platform.c
>> index 9b5c7f8c79b0..dc5e9878cb68 100644
>> --- a/drivers/platform/x86/msi-wmi-platform.c
>> +++ b/drivers/platform/x86/msi-wmi-platform.c
>> @@ -10,6 +10,7 @@
>>   #include <linux/acpi.h>
>>   #include <linux/bits.h>
>>   #include <linux/bitfield.h>
>> +#include <linux/cleanup.h>
>>   #include <linux/debugfs.h>
>>   #include <linux/device.h>
>>   #include <linux/device/driver.h>
>> @@ -17,6 +18,7 @@
>>   #include <linux/hwmon.h>
>>   #include <linux/kernel.h>
>>   #include <linux/module.h>
>> +#include <linux/mutex.h>
>>   #include <linux/printk.h>
>>   #include <linux/rwsem.h>
>>   #include <linux/types.h>
>> @@ -76,8 +78,13 @@ enum msi_wmi_platform_method {
>>   	MSI_PLATFORM_GET_WMI		=3D 0x1d,
>>   };
>>
>> -struct msi_wmi_platform_debugfs_data {
>> +struct msi_wmi_platform_data {
>>   	struct wmi_device *wdev;
>> +	struct mutex wmi_lock;	/* Necessary when calling WMI methods */
>> +};
>> +
>> +struct msi_wmi_platform_debugfs_data {
>> +	struct msi_wmi_platform_data *data;
>>   	enum msi_wmi_platform_method method;
>>   	struct rw_semaphore buffer_lock;	/* Protects debugfs buffer */
>>   	size_t length;
>> @@ -132,8 +139,9 @@ static int msi_wmi_platform_parse_buffer(union acpi=
_object *obj, u8 *output, siz
>>   	return 0;
>>   }
>>
>> -static int msi_wmi_platform_query(struct wmi_device *wdev, enum msi_wm=
i_platform_method method,
>> -				  u8 *input, size_t input_length, u8 *output, size_t output_length=
)
>> +static int msi_wmi_platform_query(struct msi_wmi_platform_data *data,
>> +				  enum msi_wmi_platform_method method, u8 *input,
>> +				  size_t input_length, u8 *output, size_t output_length)
>>   {
>>   	struct acpi_buffer out =3D { ACPI_ALLOCATE_BUFFER, NULL };
>>   	struct acpi_buffer in =3D {
>> @@ -147,9 +155,15 @@ static int msi_wmi_platform_query(struct wmi_devic=
e *wdev, enum msi_wmi_platform
>>   	if (!input_length || !output_length)
>>   		return -EINVAL;
>>
>> -	status =3D wmidev_evaluate_method(wdev, 0x0, method, &in, &out);
>> -	if (ACPI_FAILURE(status))
>> -		return -EIO;
>> +	/*
>> +	 * The ACPI control method responsible for handling the WMI method ca=
lls
>> +	 * is not thread-safe. Because of this we have to do the locking ours=
elf.
>> +	 */
>> +	scoped_guard(mutex, &data->wmi_lock) {
>> +		status =3D wmidev_evaluate_method(data->wdev, 0x0, method, &in, &out=
);
>> +		if (ACPI_FAILURE(status))
>> +			return -EIO;
>> +	}
>>
>>   	obj =3D out.pointer;
>>   	if (!obj)
>> @@ -170,22 +184,22 @@ static umode_t msi_wmi_platform_is_visible(const =
void *drvdata, enum hwmon_senso
>>   static int msi_wmi_platform_read(struct device *dev, enum hwmon_senso=
r_types type, u32 attr,
>>   				 int channel, long *val)
>>   {
>> -	struct wmi_device *wdev =3D dev_get_drvdata(dev);
>> +	struct msi_wmi_platform_data *data =3D dev_get_drvdata(dev);
>>   	u8 input[32] =3D { 0 };
>>   	u8 output[32];
>> -	u16 data;
>> +	u16 value;
>>   	int ret;
>>
>> -	ret =3D msi_wmi_platform_query(wdev, MSI_PLATFORM_GET_FAN, input, siz=
eof(input), output,
>> +	ret =3D msi_wmi_platform_query(data, MSI_PLATFORM_GET_FAN, input, siz=
eof(input), output,
>>   				     sizeof(output));
>>   	if (ret < 0)
>>   		return ret;
>>
>> -	data =3D get_unaligned_be16(&output[channel * 2 + 1]);
>> -	if (!data)
>> +	value =3D get_unaligned_be16(&output[channel * 2 + 1]);
>> +	if (!value)
>>   		*val =3D 0;
>>   	else
>> -		*val =3D 480000 / data;
>> +		*val =3D 480000 / value;
> Please put this variable rename into own patch before the actual fix.

Hi,

the variable rename is necessary because there would be a naming conflict =
with the struct msi_wmi_platform_data *data.
Since the rename is rather small i would prefer keeping this as a single p=
atch to make it easier for the stable
team to backport.

Thanks,
Armin Wolf

> --
>   i.
>
>>   	return 0;
>>   }
>> @@ -231,7 +245,7 @@ static ssize_t msi_wmi_platform_write(struct file *=
fp, const char __user *input,
>>   		return ret;
>>
>>   	down_write(&data->buffer_lock);
>> -	ret =3D msi_wmi_platform_query(data->wdev, data->method, payload, dat=
a->length, data->buffer,
>> +	ret =3D msi_wmi_platform_query(data->data, data->method, payload, dat=
a->length, data->buffer,
>>   				     data->length);
>>   	up_write(&data->buffer_lock);
>>
>> @@ -277,17 +291,17 @@ static void msi_wmi_platform_debugfs_remove(void =
*data)
>>   	debugfs_remove_recursive(dir);
>>   }
>>
>> -static void msi_wmi_platform_debugfs_add(struct wmi_device *wdev, stru=
ct dentry *dir,
>> +static void msi_wmi_platform_debugfs_add(struct msi_wmi_platform_data =
*drvdata, struct dentry *dir,
>>   					 const char *name, enum msi_wmi_platform_method method)
>>   {
>>   	struct msi_wmi_platform_debugfs_data *data;
>>   	struct dentry *entry;
>>
>> -	data =3D devm_kzalloc(&wdev->dev, sizeof(*data), GFP_KERNEL);
>> +	data =3D devm_kzalloc(&drvdata->wdev->dev, sizeof(*data), GFP_KERNEL)=
;
>>   	if (!data)
>>   		return;
>>
>> -	data->wdev =3D wdev;
>> +	data->data =3D drvdata;
>>   	data->method =3D method;
>>   	init_rwsem(&data->buffer_lock);
>>
>> @@ -298,82 +312,82 @@ static void msi_wmi_platform_debugfs_add(struct w=
mi_device *wdev, struct dentry
>>
>>   	entry =3D debugfs_create_file(name, 0600, dir, data, &msi_wmi_platfo=
rm_debugfs_fops);
>>   	if (IS_ERR(entry))
>> -		devm_kfree(&wdev->dev, data);
>> +		devm_kfree(&drvdata->wdev->dev, data);
>>   }
>>
>> -static void msi_wmi_platform_debugfs_init(struct wmi_device *wdev)
>> +static void msi_wmi_platform_debugfs_init(struct msi_wmi_platform_data=
 *data)
>>   {
>>   	struct dentry *dir;
>>   	char dir_name[64];
>>   	int ret, method;
>>
>> -	scnprintf(dir_name, ARRAY_SIZE(dir_name), "%s-%s", DRIVER_NAME, dev_n=
ame(&wdev->dev));
>> +	scnprintf(dir_name, ARRAY_SIZE(dir_name), "%s-%s", DRIVER_NAME, dev_n=
ame(&data->wdev->dev));
>>
>>   	dir =3D debugfs_create_dir(dir_name, NULL);
>>   	if (IS_ERR(dir))
>>   		return;
>>
>> -	ret =3D devm_add_action_or_reset(&wdev->dev, msi_wmi_platform_debugfs=
_remove, dir);
>> +	ret =3D devm_add_action_or_reset(&data->wdev->dev, msi_wmi_platform_d=
ebugfs_remove, dir);
>>   	if (ret < 0)
>>   		return;
>>
>>   	for (method =3D MSI_PLATFORM_GET_PACKAGE; method <=3D MSI_PLATFORM_G=
ET_WMI; method++)
>> -		msi_wmi_platform_debugfs_add(wdev, dir, msi_wmi_platform_debugfs_nam=
es[method - 1],
>> +		msi_wmi_platform_debugfs_add(data, dir, msi_wmi_platform_debugfs_nam=
es[method - 1],
>>   					     method);
>>   }
>>
>> -static int msi_wmi_platform_hwmon_init(struct wmi_device *wdev)
>> +static int msi_wmi_platform_hwmon_init(struct msi_wmi_platform_data *d=
ata)
>>   {
>>   	struct device *hdev;
>>
>> -	hdev =3D devm_hwmon_device_register_with_info(&wdev->dev, "msi_wmi_pl=
atform", wdev,
>> +	hdev =3D devm_hwmon_device_register_with_info(&data->wdev->dev, "msi_=
wmi_platform", data,
>>   						    &msi_wmi_platform_chip_info, NULL);
>>
>>   	return PTR_ERR_OR_ZERO(hdev);
>>   }
>>
>> -static int msi_wmi_platform_ec_init(struct wmi_device *wdev)
>> +static int msi_wmi_platform_ec_init(struct msi_wmi_platform_data *data=
)
>>   {
>>   	u8 input[32] =3D { 0 };
>>   	u8 output[32];
>>   	u8 flags;
>>   	int ret;
>>
>> -	ret =3D msi_wmi_platform_query(wdev, MSI_PLATFORM_GET_EC, input, size=
of(input), output,
>> +	ret =3D msi_wmi_platform_query(data, MSI_PLATFORM_GET_EC, input, size=
of(input), output,
>>   				     sizeof(output));
>>   	if (ret < 0)
>>   		return ret;
>>
>>   	flags =3D output[MSI_PLATFORM_EC_FLAGS_OFFSET];
>>
>> -	dev_dbg(&wdev->dev, "EC RAM version %lu.%lu\n",
>> +	dev_dbg(&data->wdev->dev, "EC RAM version %lu.%lu\n",
>>   		FIELD_GET(MSI_PLATFORM_EC_MAJOR_MASK, flags),
>>   		FIELD_GET(MSI_PLATFORM_EC_MINOR_MASK, flags));
>> -	dev_dbg(&wdev->dev, "EC firmware version %.28s\n",
>> +	dev_dbg(&data->wdev->dev, "EC firmware version %.28s\n",
>>   		&output[MSI_PLATFORM_EC_VERSION_OFFSET]);
>>
>>   	if (!(flags & MSI_PLATFORM_EC_IS_TIGERLAKE)) {
>>   		if (!force)
>>   			return -ENODEV;
>>
>> -		dev_warn(&wdev->dev, "Loading on a non-Tigerlake platform\n");
>> +		dev_warn(&data->wdev->dev, "Loading on a non-Tigerlake platform\n");
>>   	}
>>
>>   	return 0;
>>   }
>>
>> -static int msi_wmi_platform_init(struct wmi_device *wdev)
>> +static int msi_wmi_platform_init(struct msi_wmi_platform_data *data)
>>   {
>>   	u8 input[32] =3D { 0 };
>>   	u8 output[32];
>>   	int ret;
>>
>> -	ret =3D msi_wmi_platform_query(wdev, MSI_PLATFORM_GET_WMI, input, siz=
eof(input), output,
>> +	ret =3D msi_wmi_platform_query(data, MSI_PLATFORM_GET_WMI, input, siz=
eof(input), output,
>>   				     sizeof(output));
>>   	if (ret < 0)
>>   		return ret;
>>
>> -	dev_dbg(&wdev->dev, "WMI interface version %u.%u\n",
>> +	dev_dbg(&data->wdev->dev, "WMI interface version %u.%u\n",
>>   		output[MSI_PLATFORM_WMI_MAJOR_OFFSET],
>>   		output[MSI_PLATFORM_WMI_MINOR_OFFSET]);
>>
>> @@ -381,7 +395,8 @@ static int msi_wmi_platform_init(struct wmi_device =
*wdev)
>>   		if (!force)
>>   			return -ENODEV;
>>
>> -		dev_warn(&wdev->dev, "Loading despite unsupported WMI interface vers=
ion (%u.%u)\n",
>> +		dev_warn(&data->wdev->dev,
>> +			 "Loading despite unsupported WMI interface version (%u.%u)\n",
>>   			 output[MSI_PLATFORM_WMI_MAJOR_OFFSET],
>>   			 output[MSI_PLATFORM_WMI_MINOR_OFFSET]);
>>   	}
>> @@ -391,19 +406,31 @@ static int msi_wmi_platform_init(struct wmi_devic=
e *wdev)
>>
>>   static int msi_wmi_platform_probe(struct wmi_device *wdev, const void=
 *context)
>>   {
>> +	struct msi_wmi_platform_data *data;
>>   	int ret;
>>
>> -	ret =3D msi_wmi_platform_init(wdev);
>> +	data =3D devm_kzalloc(&wdev->dev, sizeof(*data), GFP_KERNEL);
>> +	if (!data)
>> +		return -ENOMEM;
>> +
>> +	data->wdev =3D wdev;
>> +	dev_set_drvdata(&wdev->dev, data);
>> +
>> +	ret =3D devm_mutex_init(&wdev->dev, &data->wmi_lock);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ret =3D msi_wmi_platform_init(data);
>>   	if (ret < 0)
>>   		return ret;
>>
>> -	ret =3D msi_wmi_platform_ec_init(wdev);
>> +	ret =3D msi_wmi_platform_ec_init(data);
>>   	if (ret < 0)
>>   		return ret;
>>
>> -	msi_wmi_platform_debugfs_init(wdev);
>> +	msi_wmi_platform_debugfs_init(data);
>>
>> -	return msi_wmi_platform_hwmon_init(wdev);
>> +	return msi_wmi_platform_hwmon_init(data);
>>   }
>>
>>   static const struct wmi_device_id msi_wmi_platform_id_table[] =3D {
>> --
>> 2.39.5
>>
