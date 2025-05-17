Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F1A8248C;
	Sat, 17 May 2025 16:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747498638; cv=none; b=rfrQEVzvW7yCr+EJ/PBiZJqGp88xxvCiAcF5M2SaHk+RFA9FMmWDCCv9HZSzobmq7g2qspK0SXzuuz5L305co26nAPwVB8UCv3TdiT9y+izwyrmOsctBr5sWiPIUSJchwcdEbtZgD9XBwKwAOtGVT7TeJS1KhMY6WbqXURvUMKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747498638; c=relaxed/simple;
	bh=jqC0oNsvaMfQBpuzLLjNALuC7em7l6f7WRTKE/2ZKMk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bjo7hJc5la+Eh+5C8wHqL8t6J2BgS2Pvgzas7qJNrM9bCoH5YkhBaJyzBduosofiiu3isCwy48yXHQFbUo9DpStfyIRd6ghaZZDKdjWJPs0FAy8SIp+2TtKCEtNVMjHuQ/lsJc5YwtO3ScZwB8sn2yJAwoOgz8QC0xv33Vl6Bnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=FnJblw4l; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="FnJblw4l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1747498623; x=1748103423; i=w_armin@gmx.de;
	bh=7eMgYhWoMENx/gHrNpuojOvrrjgIHdixsXjVMlaf7CQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=FnJblw4lsIwSDJ9FaaUS3TFnzZ77lievGVPkHLQsk8Mw3y5tadEGcMjRekp+g7RQ
	 XiWVUSMUd3amKytJWBRff4mp3bOjg8MVTdSBgwret15vaYZde/KuJFofM3TUXqhew
	 mVh0veQIcjN5dM+0IAhUb5v3hLSLc9/DNLJhnJcwf79oeH1HQiYs453IvaCNrMICZ
	 xpfjCTNDhAiPcVW6B4CkQJG8QHLnsjevHTmkO4HGJS41KMnjRRl6O9/z8FheO7pOB
	 PocZjgTUFGQIk0Gs/hTU8WZDvjVTFux1NynTcGPmeIMFrnX9Lz583prAfN5UN4aYO
	 f+bVkvNmI1RpzxiEwg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N5G9t-1uzahf3uCr-00uOZA; Sat, 17
 May 2025 18:17:03 +0200
Message-ID: <637c0f0e-3858-43bd-b122-ff52a5580077@gmx.de>
Date: Sat, 17 May 2025 18:16:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/6] platform/x86: Add Lenovo WMI Gaming Series
 Drivers
To: "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Mario Limonciello <superm1@kernel.org>,
 Luke Jones <luke@ljones.dev>, Xino Ni <nijs1@lenovo.com>,
 Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 "Cody T . -H . Chiu" <codyit@gmail.com>, John Martens <johnfanv2@gmail.com>,
 Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250515182224.8277-1-derekjohn.clark@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250515182224.8277-1-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:CoWOPoTcK/MQENKk6TrKTjAJVAccIyWOWn+DcvPzBV7hqXrGnKf
 GNcnUpryF8/QaUBve6K9vBjATVYKJ7/m2msz+dOjR2NAUX0gpucSwAGdHbeAH2uTASqEc9Z
 sjr6kpB74KjTWwTiB4eoIQJf54Dd99gZUrSnqUJVExcNz3pfTfbWV8nsgYhEtwxGuJk3R7+
 KyaKyrCwWo05o4r1HSe1w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0://xcj8/Zq/c=;5y4sra9Hf3OEg7GxZkrdJR+511C
 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

Am 15.05.25 um 20:22 schrieb Derek J. Clark:

> Adds support for the Lenovo "Gaming Series" of laptop hardware that use
> WMI interfaces that control various power settings. There are multiple WMI
> interfaces that work in concert to provide getting and setting values as
> well as validation of input. Currently only the "Gamezone", "Other
> Mode", and "LENOVO_CAPABILITY_DATA_01" interfaces are implemented, but
> I attempted to structure the driver so that adding the "Custom Mode",
> "Lighting", and other data block interfaces would be trivial in later
> patches.
>
> This driver attempts to standardize the exposed sysfs by mirroring the
> asus-armoury driver currently under review. As such, a lot of
> inspiration has been drawn from that driver.
> https://lore.kernel.org/platform-driver-x86/20250319065827.53478-1-luke@ljones.dev/#t
>
> The drivers have been tested by me on the Lenovo Legion Go and Legion Go
> S.

Nice work, i think the whole series is now ready for the mainline kernel.

Thanks,
Armin Wolf

> Suggested-by: Mario Limonciello <superm1@kernel.org>
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
> v10:
>    - Fix build error.
> v9:
> https://lore.kernel.org/platform-driver-x86/20250508235217.12256-1-derekjohn.clark@gmail.com/
> v8:
> https://lore.kernel.org/platform-driver-x86/20250505010659.1450984-1-derekjohn.clark@gmail.com/
> v7:
> https://lore.kernel.org/platform-driver-x86/20250503000142.1190354-1-derekjohn.clark@gmail.com/
> v6:
> https://lore.kernel.org/platform-driver-x86/20250428012029.970017-1-derekjohn.clark@gmail.com/
> v5:
> https://lore.kernel.org/platform-driver-x86/20250408012815.1032357-1-derekjohn.clark@gmail.com/
> v4:
> https://lore.kernel.org/platform-driver-x86/20250317144326.5850-1-derekjohn.clark@gmail.com/
> v3:
> https://lore.kernel.org/platform-driver-x86/20250225220037.16073-1-derekjohn.clark@gmail.com/
> v2:
> https://lore.kernel.org/platform-driver-x86/20250102004854.14874-1-derekjohn.clark@gmail.com/
> v1:
> https://lore.kernel.org/platform-driver-x86/20241217230645.15027-1-derekjohn.clark@gmail.com/
>
> Derek J. Clark (6):
>    platform/x86: Add lenovo-wmi-* driver Documentation
>    platform/x86: Add lenovo-wmi-helpers
>    platform/x86: Add Lenovo WMI Events Driver
>    platform/x86: Add Lenovo Capability Data 01 WMI Driver
>    platform/x86: Add Lenovo Gamezone WMI Driver
>    platform/x86: Add Lenovo Other Mode WMI Driver
>
>   .../wmi/devices/lenovo-wmi-gamezone.rst       | 203 ++++++
>   .../wmi/devices/lenovo-wmi-other.rst          | 108 +++
>   MAINTAINERS                                   |  12 +
>   drivers/platform/x86/Kconfig                  |  41 ++
>   drivers/platform/x86/Makefile                 |   5 +
>   drivers/platform/x86/lenovo-wmi-capdata01.c   | 303 ++++++++
>   drivers/platform/x86/lenovo-wmi-capdata01.h   |  25 +
>   drivers/platform/x86/lenovo-wmi-events.c      | 196 +++++
>   drivers/platform/x86/lenovo-wmi-events.h      |  20 +
>   drivers/platform/x86/lenovo-wmi-gamezone.c    | 408 +++++++++++
>   drivers/platform/x86/lenovo-wmi-gamezone.h    |  20 +
>   drivers/platform/x86/lenovo-wmi-helpers.c     |  75 ++
>   drivers/platform/x86/lenovo-wmi-helpers.h     |  20 +
>   drivers/platform/x86/lenovo-wmi-other.c       | 667 ++++++++++++++++++
>   drivers/platform/x86/lenovo-wmi-other.h       |  16 +
>   15 files changed, 2119 insertions(+)
>   create mode 100644 Documentation/wmi/devices/lenovo-wmi-gamezone.rst
>   create mode 100644 Documentation/wmi/devices/lenovo-wmi-other.rst
>   create mode 100644 drivers/platform/x86/lenovo-wmi-capdata01.c
>   create mode 100644 drivers/platform/x86/lenovo-wmi-capdata01.h
>   create mode 100644 drivers/platform/x86/lenovo-wmi-events.c
>   create mode 100644 drivers/platform/x86/lenovo-wmi-events.h
>   create mode 100644 drivers/platform/x86/lenovo-wmi-gamezone.c
>   create mode 100644 drivers/platform/x86/lenovo-wmi-gamezone.h
>   create mode 100644 drivers/platform/x86/lenovo-wmi-helpers.c
>   create mode 100644 drivers/platform/x86/lenovo-wmi-helpers.h
>   create mode 100644 drivers/platform/x86/lenovo-wmi-other.c
>   create mode 100644 drivers/platform/x86/lenovo-wmi-other.h
>
