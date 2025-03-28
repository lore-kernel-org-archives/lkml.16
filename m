Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60AD11E0E1A;
	Fri, 28 Mar 2025 21:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743197107; cv=none; b=uVYYEmauRm88ut6F/FWP1JHmfCQmqLZBejt3tWs4v6Xj9SIBuPIvRjqpu9zmaqJQT8ZElOTH+2DeJwsBh+uznCNhqF+InY/2DyWwKP4wu9hpC2W3/XorlMSp7w4Nx01YpJITMGW84/845ltPh4GusC+9vXlSXq7CjSSKMh8LVUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743197107; c=relaxed/simple;
	bh=iRheyvxIqIYLa9JOCgwHAjEqkd8E/FYkbC7bWI3wxmk=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=KoFXjKHZ/sgK6mrY94EW6aRQsK+iYWWImjKjy7FpyaHR75WQnmdshR1paG9gbK/dyhAfTy9iuPmNnpICac/Ov7cznvaSOru0nLIrBmvrMJSfwaNC1snZc7UsqtLWO7i4e5i5FD7Gyy0ZVVFu5T+Vaz+E5n2UYC2krzjzA1MNaM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ElFeKmcG; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ElFeKmcG"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-223f4c06e9fso51394315ad.1;
        Fri, 28 Mar 2025 14:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743197105; x=1743801905; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T/oLXnE+vNP3txORzinWauPBUlDD406kUrH1NV2QFjs=;
        b=ElFeKmcGHfcjH/kPvDmXVWIblXBXAqbwzR0Pv1g+81fTgwoS0rlDqbwCHPwSKLQ995
         DYwxwsm3BH+VIzAAtjqoRnKTQ56arO2WqxJmUSBrJqwb7sPpnU0OjsDh8cHJgVLUGzXT
         UalMOmIgFD16rp8gpfmZ/twgnm/Wovu8ugX3z46X/QXPNrexP22GF5u9w2ErbGFiT6M8
         a7rHack5xR1MTx0Mduq/oa+Uyjt8H2JMaNOM2/N6QtN9i4vZSKBhu1ts1yHrMSgYKHqw
         A3vmlKvlxWaiNOW7Ye87XYEpZ4+K/o4mptoG+/xjfj3I+gM1HZluBJvTBqHJGFP6yCGn
         JpdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743197105; x=1743801905;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T/oLXnE+vNP3txORzinWauPBUlDD406kUrH1NV2QFjs=;
        b=UYR9X44Ll6XWwMaDYvl6WSvkDoFCmhOzDzD3oQ1In+LQ7264CLySOO+UaIL3+3xEQb
         2EDm/af/u0qDlr7Nvoq7/ISqML5iPSZdYuK5Lkpzi+6NIEVxE8pkfMANc2Rr7+PxyCP0
         v+c1uWO2DzBw4zqy3LdxDszmwMkfZtHh3hXKJ6BXjrwJeEnuj841TGnO4edgxSc/aqoO
         2SAp4eKLA07ohKNP/jB7kRtvkWW+pvqm2IHVWPYCES7Bh4nQjWN2uKMxz2Q6tHjJZ2NM
         zqOBFkoz6BOC5EwS/vBAA4VvgaRuLELCkMcAtV+UwYI6V/UQ7H5CXJDwBc671CCl3mp7
         ZWRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXXivIfJOqiHMLnylFEGn0y8DbLW6C724oEi88dHtEd0LlPVJpaYsiA8vK2BtlpCh+bfVI1sa3Phb3OghyIil9Qpcgjw==@vger.kernel.org, AJvYcCWYWncIdqQLfBelakvZgBBkhXNl1Rme+PdsXFhk+URKRQ9gRyyKDHAn71fvPgOKlu2AvkWMZQY079jqEQs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaxgzEmvY2RYEoPfRvolYuOJlSRX34iXGJAFj7+IMLo7/sQQpH
	t9WVOc51ewzkuRN+IcyfU7/au7CK0HE3ji0lpvNZICujcPAzJCrv
X-Gm-Gg: ASbGncuuIdbaibK545oSFPIZNinHt9rRy2OYVBUZbV3AnEEo80VlPstH3WT9uArDk9L
	TLIpFbcLZt4s3+gkaDhCqRsfebwU0fQV+kpyDfkQLW1T14QHHnkhIwbgm2w3gRd+WeK+M/3rygc
	5MrPZHjmBuOrDO4DIWlJnId1Dh2LqA/QGhnrHtJVmkKLwHPg80JcJOjkZ97yUZpS1/xfC49kuAu
	lHEYsIoBEhRI9m81bIuv7pIwXHAFV80XF0Q/Xs+hRVer2R+Z+tYPWkBlqlJksXNgoI1u2GDut59
	76kUUi++yf8mGK06drfDZbCQi5WM+scRm3mIeKAn+l4670hX
X-Google-Smtp-Source: AGHT+IHDifrhGdSa6UfqKvi7bvBswPTgtLSONMP+A91RwO8mqnGVzwxmGu1xU3zFHqlNzJQznEL+9A==
X-Received: by 2002:a17:903:98b:b0:224:7a4:b31 with SMTP id d9443c01a7336-2292ee06c99mr15066435ad.6.1743197105364;
        Fri, 28 Mar 2025 14:25:05 -0700 (PDT)
Received: from localhost ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eee1bd1sm23527565ad.68.2025.03.28.14.25.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 14:25:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 28 Mar 2025 18:25:02 -0300
Message-Id: <D8S7STGMNHO8.FOJPC4C803BI@gmail.com>
From: "Kurt Borja" <kuurtb@gmail.com>
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "Armin Wolf" <W_Armin@gmx.de>, "Hans de Goede" <hdegoede@redhat.com>,
 <platform-driver-x86@vger.kernel.org>, <Dell.Client.Kernel@dell.com>,
 "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 09/12] platform/x86: alienware-wmi-wmax: Add a
 DebugFS interface
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250313-hwm-v6-0-17b57f787d77@gmail.com>
 <20250313-hwm-v6-9-17b57f787d77@gmail.com>
 <09fb8477-9b41-ceb2-4f0c-bc6477a5874f@linux.intel.com>
In-Reply-To: <09fb8477-9b41-ceb2-4f0c-bc6477a5874f@linux.intel.com>

On Fri Mar 28, 2025 at 1:18 PM -03, Ilpo J=C3=A4rvinen wrote:
> On Thu, 13 Mar 2025, Kurt Borja wrote:
>
>> Add a debugfs interface which exposes thermal private data.
>>=20
>> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>> ---
>>  drivers/platform/x86/dell/alienware-wmi-wmax.c | 90 +++++++++++++++++++=
+++++++
>>  1 file changed, 90 insertions(+)
>>=20
>> diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/pl=
atform/x86/dell/alienware-wmi-wmax.c
>> index 823b579260555085ef6ac793b806738a756bb9da..472e6289fec5be0db0a5cb8e=
76718b750fa558b5 100644
>> --- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
>> +++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
>> @@ -11,6 +11,7 @@
>>  #include <linux/bitfield.h>
>>  #include <linux/bitmap.h>
>>  #include <linux/bits.h>
>> +#include <linux/debugfs.h>
>>  #include <linux/dmi.h>
>>  #include <linux/hwmon.h>
>>  #include <linux/hwmon-sysfs.h>
>> @@ -19,6 +20,7 @@
>>  #include <linux/moduleparam.h>
>>  #include <linux/platform_profile.h>
>>  #include <linux/pm.h>
>> +#include <linux/seq_file.h>
>>  #include <linux/units.h>
>>  #include <linux/wmi.h>
>>  #include "alienware-wmi.h"
>> @@ -1252,6 +1254,92 @@ static int awcc_platform_profile_init(struct wmi_=
device *wdev)
>>  	return PTR_ERR_OR_ZERO(priv->ppdev);
>>  }
>> =20
>> +/*
>> + * DebugFS
>> + */
>> +static int awcc_debugfs_system_description_read(struct seq_file *seq, v=
oid *data)
>> +{
>> +	struct device *dev =3D seq->private;
>> +	struct awcc_priv *priv =3D dev_get_drvdata(dev);
>> +
>> +	seq_printf(seq, "0x%08x\n", priv->system_description);
>> +
>> +	return 0;
>> +}
>> +
>> +static int awcc_debugfs_hwmon_data_read(struct seq_file *seq, void *dat=
a)
>> +{
>> +	struct device *dev =3D seq->private;
>> +	struct awcc_priv *priv =3D dev_get_drvdata(dev);
>> +	const struct awcc_fan_data *fan;
>> +	unsigned int bit;
>> +
>> +	seq_printf(seq, "Number of fans: %u\n", priv->fan_count);
>> +	seq_printf(seq, "Number of temperature sensors: %u\n\n", priv->temp_co=
unt);
>> +
>> +	for (u32 i =3D 0; i < priv->fan_count; i++) {
>> +		fan =3D priv->fan_data[i];
>> +
>> +		seq_printf(seq, "Fan %u:\n", i);
>> +		seq_printf(seq, "  ID: 0x%02x\n", fan->id);
>> +		seq_printf(seq, "  Related temperature sensors bitmap: %lu\n",
>> +			   fan->auto_channels_temp);
>> +	}
>> +
>> +	seq_puts(seq, "\nTemperature sensor IDs:\n");
>> +	for_each_set_bit(bit, priv->temp_sensors, AWCC_ID_BITMAP_SIZE)
>> +		seq_printf(seq, "  0x%02x\n", bit);
>> +
>> +	return 0;
>> +}
>> +
>> +static int awcc_debugfs_pprof_data_read(struct seq_file *seq, void *dat=
a)
>> +{
>> +	struct device *dev =3D seq->private;
>> +	struct awcc_priv *priv =3D dev_get_drvdata(dev);
>> +
>> +	seq_printf(seq, "Number of thermal profiles: %u\n\n", priv->profile_co=
unt);
>> +
>> +	for (u32 i =3D 0; i < PLATFORM_PROFILE_LAST; i++) {
>> +		if (!priv->supported_profiles[i])
>> +			continue;
>> +
>> +		seq_printf(seq, "Platform profile %u:\n", i);
>> +		seq_printf(seq, "  ID: 0x%02x\n", priv->supported_profiles[i]);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void awcc_debugfs_remove(void *data)
>> +{
>> +	struct dentry *root =3D data;
>> +
>> +	debugfs_remove(root);
>> +}
>> +
>> +static void awcc_debugfs_init(struct wmi_device *wdev)
>> +{
>> +	struct dentry *root;
>> +	char name[64];
>> +
>> +	scnprintf(name, ARRAY_SIZE(name), "%s-%s", "alienware-wmi", dev_name(&=
wdev->dev));
>
> You'd need to add include for ARRAY_SIZE() but can't you just use=20
> sizeof()?

Sure, it's 1 byte anyway. Though I think I use ARRAY_SIZE somewhere
else so I'll add the include too.

Thank you so much for your feedback! I'll send v7 this weekend.

--=20
 ~ Kurt

>
>> +	root =3D debugfs_create_dir(name, NULL);
>> +
>> +	debugfs_create_devm_seqfile(&wdev->dev, "system_description", root,
>> +				    awcc_debugfs_system_description_read);
>> +
>> +	if (awcc->hwmon)
>> +		debugfs_create_devm_seqfile(&wdev->dev, "hwmon_data", root,
>> +					    awcc_debugfs_hwmon_data_read);
>> +
>> +	if (awcc->pprof)
>> +		debugfs_create_devm_seqfile(&wdev->dev, "pprof_data", root,
>> +					    awcc_debugfs_pprof_data_read);
>> +
>> +	devm_add_action_or_reset(&wdev->dev, awcc_debugfs_remove, root);
>> +}
>> +
>>  static int alienware_awcc_setup(struct wmi_device *wdev)
>>  {
>>  	struct awcc_priv *priv;
>> @@ -1290,6 +1378,8 @@ static int alienware_awcc_setup(struct wmi_device =
*wdev)
>>  			return ret;
>>  	}
>> =20
>> +	awcc_debugfs_init(wdev);
>> +
>>  	return 0;
>>  }
>> =20
>>=20
>>=20

