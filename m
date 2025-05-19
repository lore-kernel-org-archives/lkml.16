Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C4084D08;
	Mon, 19 May 2025 02:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747622050; cv=none; b=TGa7bt2ePxZ0+Iso8hNmTQ+FVCiqdS5oEfLA94XImdhNIJWgCPDsvjVF6xKG+Y9mmmjEuF3x+qunzh9F8CvZYMQnXj7EUJQJg+dmc7F96FXBGqBIBcK2ELtOX64zv5W9mJ/+vcbExqk7B55NkHSVLNIvFaYrFfSulJSZP50S5sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747622050; c=relaxed/simple;
	bh=liBE+eS5wQwq4exkRnrYKMaPtzJIV1T2VcbkD1RsyXU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r6jqBVC6tUz3kcnJhoVxYmAsjm5YZE73yCtURMgNO7V3xbHupzevafbVjpxg6UA4/S7t8j3SPcnKRVN/8ERpQHw+eAYrTHc3bGzzpjYuLJuxws+uBOox42p0dNOYCnP38XfoNRatDc/Hxw3U5j53PFCnzGlnYHhB9XOKd2DNrvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=MXijg4bR; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="MXijg4bR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1747622026; x=1748226826; i=w_armin@gmx.de;
	bh=4GwvlDvkgNGf1b1rWtpYGjX4ZJQD5ltpTXQuemwZicc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=MXijg4bRCyt6WcfrUg8V0t1Y2dkEO3o4gQFWvIIarrN7IAgoYfyBKtxLjIz0+BlO
	 KgOEDR2QOLsEqW6XDSEsV0QMEg/0/gqASHpigrZY+OG79nvsg63kIyOJseY5ME4hk
	 a+m6G3Km03zIGZXggUSFglmfvZvXOgv0Fgs95xaoi2vN4hqgnFvePzSwD31upcTDs
	 /nXSwUU1FbpfVHvUVvXyafg1P1HNlrrTNuLdjKVreq2UZHUy0nPMdx8iq1E8RIUTN
	 qDPMMaBR9nMNV11TrePNU2c7bHw/tZGyDNBVk6++GynJOLopvr/djWnDGzeJXYFcb
	 F4YkzRxddeBUDCjDYw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MPGVx-1uc46Z2B5B-00Ios3; Mon, 19
 May 2025 04:33:46 +0200
Message-ID: <32592180-ca0f-4c10-a998-265e0c6d0d51@gmx.de>
Date: Mon, 19 May 2025 04:33:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 09/10] platform/x86: msi-wmi-platform: Update header
 text
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Kurt Borja <kuurtb@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20250511204427.327558-1-lkml@antheas.dev>
 <20250511204427.327558-10-lkml@antheas.dev>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250511204427.327558-10-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QaQx1S777Qmd3Y1KHXuSWpE8lMsKES5FogtUhysE2wKhR+pfTmc
 mor+cwmO36KODjGNBBdimhYFl+iDJaPIHj2dFrB+EMZqx79N+R9El5j4Oa1BQlwXgQwKMqX
 cr0A+6L0VKsvUp0W2ndSCK5Iq6ODMUcu6GB1iv7MINCTLKlmSXQ1XptRBt3WivmVSYesPGB
 mfOdGgfldmeZX5QBX0sNQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:H36e3SHzJW8=;M8LK6SUk0Bf95kXKEgov0HSxePx
 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

Am 11.05.25 um 22:44 schrieb Antheas Kapenekakis:

> Update copyright information in the header and specify
> that this driver also applies to handhelds.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>   drivers/platform/x86/msi-wmi-platform.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/platform/=
x86/msi-wmi-platform.c
> index eaf0eb25e349b..7dafe17d4d6be 100644
> --- a/drivers/platform/x86/msi-wmi-platform.c
> +++ b/drivers/platform/x86/msi-wmi-platform.c
> @@ -1,8 +1,9 @@
>   // SPDX-License-Identifier: GPL-2.0-or-later
>   /*
> - * Linux driver for WMI platform features on MSI notebooks.
> + * Linux driver for WMI platform features on MSI notebooks and handheld=
s.
>    *
> - * Copyright (C) 2024 Armin Wolf <W_Armin@gmx.de>
> + * Copyright (C) 2024-2025 Armin Wolf <W_Armin@gmx.de>
> + * Copyright (C) 2025 Antheas Kapenekakis <lkml@antheas.dev>
>    */
>  =20
>   #define pr_format(fmt) KBUILD_MODNAME ": " fmt
