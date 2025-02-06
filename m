Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1755322331B;
	Thu,  6 Feb 2025 05:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738819456; cv=none; b=d6GkKGK42FmdQb7VHSuKraplRTxdmX7/0QRuvigpyCQTK1S2YUnmwp3FsLt1PR6yuIj3Kk6drD7ugaARqfcKM7eVkojEaMxy8097VnCUvrcV3dbWs3aHlp7piUsJkK7vutYfjWcY7ZmsdoEB94W2yNFwm1jMjcgStLzmSUcqf8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738819456; c=relaxed/simple;
	bh=yJvkxpDGwTNaijMwj9XOXTsxlkj2PVrqhOisXVINv6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H9rRyTx5aE5FXRFZ1BFP+PQdF3w0ECWBMJ/ypl8uVQksP4C4+twYWssT8mywN9oNtIzvesv4/G9YmFYqIWitytk6CBUcDYQpZ4n1AL3mYCHSV5VHKwmzLlV6vieGbCf/G5I5zBiMBaOzH9bsKCMi/8cwZVV2tGdydc1d3CioUjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=ltI95x10; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="ltI95x10"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1738819437; x=1739424237; i=w_armin@gmx.de;
	bh=hsOHi2sO4JiGzgSiRcyDa6NeBiH19V/EzhD9pSIn8qc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ltI95x10Y0Txm4GFHYorIyF4PAWUoa8hDQ8qrL702DOlCwV79TwoGMFwmpyMqiiF
	 BG6tujY8zDw+d+JsBahQ9r4McwANiEF9kHClOtvMIxBJ+ZxCgokinyPo8os+mrJq1
	 qt3Fn5ooCqfnpnHLEE9bfATIsOdfjoashXgHMyOFS40Sy/XRBCctxVQxGgwaLOcpV
	 D3Z2Qd/v4l7ataKxs25Y7KzxddUub1kddPSihAY4jUyxsTObGO/siPb12s1AbhRD7
	 LQYW2jzo867ntmCzdmFE3rU5D0/VDih3vCElDixaK5IZzywMvN62DHDYdipi/nCCj
	 vum6WCGhzIzxfUJkPw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([91.14.238.232]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTABT-1tqbBK0DTr-00QM6w; Thu, 06
 Feb 2025 06:23:57 +0100
Message-ID: <2a080bfb-643e-4d77-823d-8ca1da907b82@gmx.de>
Date: Thu, 6 Feb 2025 06:23:54 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/14] platform/x86: alienware-wmi driver rework
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Hans de Goede <hdegoede@redhat.com>, Dell.Client.Kernel@dell.com,
 linux-kernel@vger.kernel.org
References: <20250203182713.27446-1-kuurtb@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250203182713.27446-1-kuurtb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:TIFEjza2x5saEzT2gak29J/PsPkdp93MZWxOZyHm3zTT8ypI1ZT
 9KRX5Sa69naRXUZYuLGU4H5KrLTXdMGcGwtdbm9/2YTIvROHz6H4Q4gxl4c99lO0dsHPPYv
 RV+BQrvUtsarC8Q3A8mRBEPic9stQWfWTyC3JWpoN+vE+xCjScMjm6Z/DuKoN16a55s4t/a
 m8qbFQFf11r9k+P0yy4UA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:fHZDobiFZN0=;wXe5Uv3vfTT5qf8MOyrDjUgy9VB
 6G+iZajdJsUlAwGaL4z0FYaCdhV+fvU7ZFNjv14auRCFl+YbjB4nsXMk6pW8ZN830GGMpBCAR
 A/k2GSm9/PDFEq1MgKEAc/rfEoRu3toIJzFeYLOkTn6NHTqR0oJg7oHYOn0f124X7Axqe8wk0
 9PQcir7WvtC/T88Nsvu49LtwZnaPhvkMuuOYvR1b3lxnHfj/tP2snwosEyHjGIpMiyviC97OL
 aUd8RKR6JP9SMrOKcD1l1uQVh2wO+HN+16dX4Wj6cD3blab121yf0pf9Oa4BAhsBAXxcYmHlY
 NRj9S/vz8cjo/t19u0BkmCMfixxJhCIkUp2jhsFD36ZlIAhw0q1O65izaVhSjvVjsxHGg/plS
 lCvIxYZGqBWy3iukaNCPoekwolIT/NVxIIDZbOjoDsZcT/f28FJ1bs3xRzvmgweHpSQrEcwOz
 ZlPBXrdJA0uN8g+MgVh1kDyAv5UrzPFUluUAWAHHErg7norrMO8fbi6LyknKiGEEibIeCiSFe
 oKXexYXgoGwzVcR+JWunj9S9QJTzsLdjgw0MZDH7i5+86IUS1RYOUJbZjv50Uc5mauJ/OpHHz
 gr82ser9j5P+pvcspm2IiSgLnAY3DPLSjSN+q5kZCW/kMpXZOiN5b+qj0QXnl/M1QQztXvJQr
 USxWzZ5tVJA6ueQ4YNoUzz8Te/NnfX/TRIwRs+FMrnUGz+uWRhRGBvAxXnB2KafZEASJyQT5J
 cfwsy9clfg8caAKeHoXLhP4EJt8+LS+t4uR3iLAGkrHlohzTnMa1ncv0irBzs/LdrGkPIm3zy
 0rG8VUQGE1BI1UOhPimmL5uPIIO6vKUH1EXdNxq0UKpqmuyRXlEVOa6jD71PkCL3HFImc2NAs
 o8eNEVuQZsKRVdw0+jd6svqr8vPx9j+GHvgC6FGkQZe6AV5oZzcOAPwwCwEgHKMhMAHahUNwr
 ouVrsGPd+FnFX35lSCnpAAa16dfR2pLrEMtMySC2arf/9LPNYqdAabpzgif90WOr0JxJXFo+a
 Tpvm3Z+LmEEjr8AQhHLxGcwogYzUHv8+ld0i0DAdLJGNFnW8gWIs/wiOphwISQFg9Esjnut0o
 MD2HqLXDwJIgpQbMRSsMD6kmRnw7/VzvMuasKsf2Bjqr7tOeK7xz1O7ea+sWtisX2pqSTMCVc
 w9drpT4tyQvptdPfr6JA11LCR0SfaHLj2sJcT2ZbwCQ3cJTG3QzR1dz6a1KnKNV52KzDmCoLm
 4QbCtcERj64xP26qHf2cGC/EKXlTwmYxPX0Vb5yPvRJrehhlTj3SPUge7lX4ZhZomA45Q9Ep2
 YFCq7ljGEGcNwsskd+We/n/Ew==

Am 03.02.25 um 19:26 schrieb Kurt Borja:

> Hello!

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

>
> ---
> [02/14]
>    - Dropped device_add_groups from wmax_wmi_probe
>    - Added `interface == WMAX` condition to WMAX's groups visibility
>
> [10/14]
>    - Add prefix to WMAX groups variable names
>    - Exported WMAX groups as extern variables in header file
>    - Exported `interface` as `alienware_interface` in header file
>    - Added WMAX_DEV_GROUPS macro to add WMAX groups to the platform
>      driver .dev_groups
>
> [13/14]
>    - Define empty WMAX_DEV_GROUPS in case CONFIG_ALIENWARE_WMI_WMAX is
>      not enabled
>
> v7: https://lore.kernel.org/platform-driver-x86/20250203062055.2915-1-kuurtb@gmail.com/
>
> Kurt Borja (14):
>    platform/x86: alienware-wmi: Add a state container for LED control
>      feature
>    platform/x86: alienware-wmi: Add WMI Drivers
>    platform/x86: alienware-wmi: Add a state container for thermal control
>      methods
>    platform/x86: alienware-wmi: Refactor LED control methods
>    platform/x86: alienware-wmi: Refactor hdmi, amplifier, deepslp methods
>    platform/x86: alienware-wmi: Refactor thermal control methods
>    platform/x86: alienware-wmi: Split DMI table
>    MAINTAINERS: Update ALIENWARE WMI DRIVER entry
>    platform/x86: Rename alienware-wmi.c
>    platform/x86: Add alienware-wmi.h
>    platform/x86: Split the alienware-wmi driver
>    platform/x86: dell: Modify Makefile alignment
>    platform/x86: Update alienware-wmi config entries
>    platform/x86: alienware-wmi: Update header and module information
>
>   MAINTAINERS                                   |    4 +-
>   drivers/platform/x86/dell/Kconfig             |   30 +-
>   drivers/platform/x86/dell/Makefile            |   45 +-
>   .../platform/x86/dell/alienware-wmi-base.c    |  491 +++++++
>   .../platform/x86/dell/alienware-wmi-legacy.c  |   95 ++
>   .../platform/x86/dell/alienware-wmi-wmax.c    |  775 ++++++++++
>   drivers/platform/x86/dell/alienware-wmi.c     | 1249 -----------------
>   drivers/platform/x86/dell/alienware-wmi.h     |  117 ++
>   8 files changed, 1530 insertions(+), 1276 deletions(-)
>   create mode 100644 drivers/platform/x86/dell/alienware-wmi-base.c
>   create mode 100644 drivers/platform/x86/dell/alienware-wmi-legacy.c
>   create mode 100644 drivers/platform/x86/dell/alienware-wmi-wmax.c
>   delete mode 100644 drivers/platform/x86/dell/alienware-wmi.c
>   create mode 100644 drivers/platform/x86/dell/alienware-wmi.h
>
>
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
