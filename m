Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245A3126F0A;
	Wed, 30 Apr 2025 03:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745983620; cv=none; b=cfUb/WK4poxYXyy+faj8yb739JYpgr+oEAUG6Q3i3BDqoh3pIfkqjJrjBRGs2+jvrrqeO064Me687TuPWLsCTcN6rDFlJ/xUGXe1KRQgYCrRab8c3KMWOhXr0EbYnbGZqbXgv+8wGm2ooXBCXavoLWmODejE/KdqIl/iU+RwVIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745983620; c=relaxed/simple;
	bh=WilsSksG91onpFhS75sG+QENiDrqEJLtr48/FCDL+JQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=Wo+ts+C25I1S8JeIf3BZVQuehO+jche5SBAoEWbZgvOBRDkUZieVeiNi2sv0u9LAfuml7Q/6Emdlfyg3I6eUoLQ6EL9SRQlWgWBhGsKdy1zp099jPqcdNBHo6CAVbAULPW43qKf2w8gLm26kdwahB1YoA0/jaY8exqG/GMzfD3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TRn4Ghi3; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TRn4Ghi3"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-306bf444ba2so6446707a91.1;
        Tue, 29 Apr 2025 20:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745983618; x=1746588418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CoxN3TaliehdYwer6YmRGsqtFDYD4eVxZVRdPbdq2i4=;
        b=TRn4Ghi3CUBhNfqyLPKSadSm5X9VZAPqoVQVmIdtd7Jt/OdL3cs4m6rK5vgTdbPmtX
         9jTO5RrGl+VveiXGTYBX7PNKMavO6H/6hKEYqSU0mE08gw0WGbi9WVJlsVyZNTMtfLFE
         5YuQizBf0dXwmCJaBXxnbA5hTm/xIFjUvJN9BDuV/OeqC8P1ke8xshfxU5M44BtgHxxR
         H7Sc8G6oIzjE0GqF20i0B2cOpizgW9cw4BmV3v8nVEHGkuqZscxIrqZ1xKWeSAWUlfBO
         1dkFrHK79PQCLZsfWvWLlCrvlvoFCA5h5E0jOjPj9KOBpnmVXLoPZjYwujIgF22NKkGM
         ER5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745983618; x=1746588418;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CoxN3TaliehdYwer6YmRGsqtFDYD4eVxZVRdPbdq2i4=;
        b=a51rRTV0Xy50PXsdUJM44jSp8PhfkWY/t3EvpfRUSy0UuLrOABXuBOF0bm5L8Qw6yZ
         MUM4gcqpSL49fmeJJ2QH5G+rNIyRyiYwWzppllv5cUT+kOHeaKmxM3K2ZXc+3jMbLf7y
         HU+TwTkAFWP5u4aE5655dmcJ9tHTV3OdeY7l0FbCKa81HpH8vkVPTVR1BW0XGLIunYwa
         6nQLaskIgQLOJeLvFDLddMZP/8mgwnu00//QYpEEIqrDdloVb7qzKzyds55SBMOYlKv3
         8hMfbqYMcQb8HIm5wyqK4wFa8qF/B3ygO81I131lbI7kgZtK/bolfxH+mjzIQn282wXF
         3s+A==
X-Forwarded-Encrypted: i=1; AJvYcCWvBo3inv8Lke0Ie+eqDBsV862OdcWsSLXeXgosHY2xQgOSPFiI6Lyd0Pt4vJkhyXxjypJFFRkajmtN2IeoXdMva96Khg==@vger.kernel.org, AJvYcCX9iA6WVBt7uGseGUuNSh/6anGl9DTZCLq3bD6vngtQhs59rQ9XCgOvWuRfwv6Vc8YCsGt4CpG5K7o=@vger.kernel.org, AJvYcCXr+aMlQxLuUBe7ANNarBYvDH1F8kQ2obqW4NquYa8ieXui555tA0CvMPmRU8F9UxocIGcbpJ+fBaX+EkLF@vger.kernel.org
X-Gm-Message-State: AOJu0YwzvQRSvEYBPTNV244AGsch29+dpaKyG9PeyJrjdonpJR+c8+rM
	UWTcoFA1qTs57cXPrKluNYUcBoU7l8oqRqhaxTka+yGlZk6Dk789
X-Gm-Gg: ASbGncufIOG5GYGCJUU3WfDc0Jw41qNHfwVIHEuRwcjw9gAmevijofXYBZTcMwcLju7
	6eUmhWGW6ZGb0G+WWcLiu4PWttQej1BBolNI5xo/Kxqe8i2n6WhjJjrf8hxLg8slkwGT8AAIecP
	Xm78cY1+WzArBC8KK07fb60UBivUMnvcN7vBatN+1A4/1O3MeJoipBZkaoB6sZxfVD4j9D/cgs5
	4H4AX0ZfAhblEYphxkU1nwaiacH0H/TqJfD8SVQQNEPUvsHgxnA06f76QGs/ZifA7N6NajNh/1I
	ulQwdM6lVHEIzWqPANSaR0bD8iKNIFx1a5g79+5wy0yWEyM8
X-Google-Smtp-Source: AGHT+IG/BfiknV+NeM8W5Lds+DILJsQE4YX7yEK8fIdyoqMxdmY5sYGywFhJYK5VBdlK5Q9B86J6Ew==
X-Received: by 2002:a17:90b:5824:b0:2ff:618c:a1e0 with SMTP id 98e67ed59e1d1-30a333608d8mr2084748a91.29.1745983618391;
        Tue, 29 Apr 2025 20:26:58 -0700 (PDT)
Received: from ?IPv6:::1? ([2607:fb90:8ee3:c96c:ad2:9358:5231:4c28])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a3471ef7asm427704a91.9.2025.04.29.20.26.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 20:26:58 -0700 (PDT)
Date: Tue, 29 Apr 2025 20:26:57 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: ALOK TIWARI <alok.a.tiwari@oracle.com>, Hans de Goede <hdegoede@redhat.com>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>,
 Mario Limonciello <superm1@kernel.org>, Luke Jones <luke@ljones.dev>,
 Xino Ni <nijs1@lenovo.com>, Zhixin Zhang <zhangzx36@lenovo.com>,
 Mia Shao <shaohz1@lenovo.com>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 "Cody T . -H . Chiu" <codyit@gmail.com>, John Martens <johnfanv2@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 6/6] platform/x86: Add Lenovo WMI Other Mode Driver
User-Agent: Thunderbird for Android
In-Reply-To: <625dd9b6-0015-4ced-8659-66755695ecd6@oracle.com>
References: <20250428012029.970017-1-derekjohn.clark@gmail.com> <20250428012029.970017-7-derekjohn.clark@gmail.com> <625dd9b6-0015-4ced-8659-66755695ecd6@oracle.com>
Message-ID: <E755BEB7-8A0E-42F7-BC61-B4188C28E7A4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On April 29, 2025 1:13:10 PM PDT, ALOK TIWARI <alok=2Ea=2Etiwari@oracle=2E=
com> wrote:
>
>
>On 28-04-2025 06:48, Derek J=2E Clark wrote:
>> Adds lenovo-wmi-other driver which provides the Lenovo "Other Mode" WMI
>> interface that comes on some Lenovo "Gaming Series" hardware=2E Provide=
s a
>> firmware-attributes class which enables the use of tunable knobs for SP=
L,
>> SPPT, and FPPT=2E
>>=20
>> Signed-off-by: Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>
>> ---
>> +++ b/drivers/platform/x86/lenovo-wmi-other=2Ec
>> @@ -0,0 +1,655 @@
>> +// SPDX-License-Identifier: GPL-2=2E0-or-later
>> +/*
>> + * Lenovo Other Mode WMI interface driver=2E
>> + *
>> + * This driver uses the fw_attributes class to expose the various WMI =
functions
>> + * provided by the "Other Mode" WMI interface=2E This enables CPU and =
GPU power
>> + * limit as well as various other attributes for devices that fall und=
er the
>> + * "Gaming Series" of Lenovo laptop devices=2E Each attribute exposed =
by the
>> + * "Other Mode"" interface has a corresponding Capability Data struct =
that
>
>typo "Other Mode"" -> "Other Mode"
>
>> + * allows the driver to probe details about the attribute such as if i=
t is
>> + * supported by the hardware, the default_value, max_value, min_value,=
 and step
>> + * increment=2E
>> + *
>> + * These attributes typically don't fit anywhere else in the sysfs and=
 are set
>> + * in Windows using one of Lenovo's multiple user applications=2E
>> + *
>> + * Copyright(C) 2025 Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>
>> + */
>> +
>[clip]
>> +
>> +/**
>> + * lwmi_om_register_notifier() - Add a notifier to the blocking notifi=
er chain
>> + * @nb: The notifier_block struct to register
>> + *
>> + * Call blocking_notifier_chain_register to register the notifier bloc=
k to the
>> + * lenovo-wmi-other driver notifer chain=2E
>
>typo notifer -> notifier
>
>> + *
>> + * Return: 0 on success, %-EEXIST on error=2E
>> + */
>> +int lwmi_om_register_notifier(struct notifier_block *nb)
>> +{
>> +	return blocking_notifier_chain_register(&om_chain_head, nb);
>> +}
>> +EXPORT_SYMBOL_NS_GPL(lwmi_om_register_notifier, "LENOVO_WMI_OTHER");
>> +
>> +/**
>> + * lwmi_om_unregister_notifier() - Remove a notifier from the blocking=
 notifier
>> + * chain=2E
>> + * @nb: The notifier_block struct to register
>> + *
>> + * Call blocking_notifier_chain_unregister to unregister the notifier =
block from the
>> + * lenovo-wmi-other driver notifer chain=2E
>> + *
>> + * Return: 0 on success, %-ENOENT on error=2E
>> + */
>> +int lwmi_om_unregister_notifier(struct notifier_block *nb)
>> +{
>> +	return blocking_notifier_chain_unregister(&om_chain_head, nb);
>> +}
>> +EXPORT_SYMBOL_NS_GPL(lwmi_om_unregister_notifier, "LENOVO_WMI_OTHER");
>> +
>> +/**
>> + * devm_lwmi_om_unregister_notifier() - Remove a notifier from the blo=
cking
>> + * notifier chain=2E
>> + * @data: Void pointer to the notifier_block struct to register=2E
>> + *
>> + * Call lwmi_om_unregister_notifier to unregister the notifier block f=
rom the
>> + * lenovo-wmi-other driver notifer chain=2E
>
>typo notifer -> notifier
>
>> + *
>> + * Return: 0 on success, %-ENOENT on error=2E
>> + */
>> +static void devm_lwmi_om_unregister_notifier(void *data)
>> +{
>> +	struct notifier_block *nb =3D data;
>> +
>> +	lwmi_om_unregister_notifier(nb);
>> +}
>> +
>> +/**
>> + * devm_lwmi_om_register_notifier() - Add a notifier to the blocking n=
otifier
>> + * chain=2E
>> + * @dev: The parent device of the notifier_block struct=2E
>> + * @nb: The notifier_block struct to register
>> + *
>> + * Call lwmi_om_register_notifier to register the notifier block to th=
e
>> + * lenovo-wmi-other driver notifer chain=2E Then add devm_lwmi_om_unre=
gister_notifier
>
>typo notifer -> notifier
>
>> + * as a device managed ation to automatically unregister the notifier =
block
>
>typo ation
>
>> + * upon parent device removal=2E
>> + *
>> + * Return: 0 on success, or on error=2E
>> + */
>> +int devm_lwmi_om_register_notifier(struct device *dev,
>> +				   struct notifier_block *nb)
>> +{
>> +	int ret;
>> +
>> +	ret =3D lwmi_om_register_notifier(nb);
>> +	if (ret < 0)
>> +		return ret;
>> +
>
>
>Thanks,
>Alok
>
>
>
>

Ack all, thanks=2E
- Derek
