Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CD62D97B5
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 19:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751053716; cv=none; b=PuiX4eRA02kzDglnEtm7YtBxA4WxkAocpxW18KukvuP2XTlKacKfZ3O/OBHW3uvrvYbVY0w9GNfloG2IIoTvq98CTdQt7aCt4wTb6A5c9IwXBQBWv2JAMWO5156EYIFYaTKEE38WjKpFm5mW32YfSi2EjVP7mTAJ0y1ZkBn4iEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751053716; c=relaxed/simple;
	bh=nMS5gvRnB8iFHWWe9Z/+BocySw+E+oISgb0lIZGQ4mw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NhHsG5vtnFuxOHw9EPKEI2cN+jsUabw1v7XrVOlznEOOdxTbwknHL0DBPH9AVuO0MQzIUULK365lwbNmD8awrCmXMXrPLVVQyQPyS3Bo+YaxRwYjTXcb7Lwn0W0Skm+C+pt2eAr25l3sRL2+cn4XnltaoyamgHmKzUlqayrgXc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=px0IywtZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="px0IywtZ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RBmJLq027894
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 19:48:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XqEtBo1jQOvR+LgMxe85gP0xuHDuAtLZcp3UvPcyCQk=; b=px0IywtZ4oeH8MNf
	ThWflDYhnKTfOmG6IzSeR8j8AqOlMWePoFuUjqy7XCL7/XKSUFWKwTtcuwTK0CHU
	dlibwy+nOB7AehHlqAagsLI1gjfyjrucKPAy2ND6EwD3wPPGaZDNiYBAUzBI5fMH
	4RsjI/s0VUzBAETRT0duV/ImNEhbi0/lgV4rpNrSPdiuZmQSgbKWJVd8Y0y/nGI6
	4oS3DixOjtwIfCuetrIWLvX38uSCS9yT1fgiAbpw9R1LFUwoQdoRdiiIE7QITgsq
	6CTYN+XRaWJJqCFNnlZQ4EMV5y5m2ffa4/uxFrsl5CMrxcQmpBN4ri0/ybr0J3Tv
	3z+dAw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec26j9r5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 19:48:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d09a3b806aso45902985a.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 12:48:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751053712; x=1751658512;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XqEtBo1jQOvR+LgMxe85gP0xuHDuAtLZcp3UvPcyCQk=;
        b=uCKjfxwybkCBIIGf313c5olpJ/aAmTZFwKIndT0f3nm6LIpDoklHy54AH1uKWDl5Jk
         glvCiCQwzP2lXouC0kv9jnyk/hLtQLNkKHQENW4wf8ThAe7O+IdfFtcgCmCgkIeN5Bl2
         yBDv/WyQ2rVmMNFoFaThh5PZhVkU3doy/BxTFQ4oCEo/Ec5OhbXF9gA2Cp0HKJ8vKfX5
         S3Ds3J/kSbZbHcx5xAph0a8JwvH2kkheZ+lk0sC38O2EaJhb3bMleoc+Ad/Nu5GijU40
         1U/WfbeAkWqc0q/7nwiK1Pl+a0TKxMMeSpNG35jKgdse/b2jo3tqslb0xsSWgGH6STWy
         E/VA==
X-Forwarded-Encrypted: i=1; AJvYcCXuBwpNaOoy8jERqnEZytzL39X9b2gHM/XASc3GS5o/cmEWi7+IX8bQx3zhKdlIEK2T6u6tcSXqIHZ0NjU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzyvzanclj+5td+eC9oYaxFwlRgGH3+Hz6m3+BwtuGlzYh1CKQN
	Kp8H6WXEQfwew6P2tVvlalthcoHa0t0oQ1t9zXQ3mlauFs+FkPSDcTMW+ws+JN5x98niS5vDKGS
	LQkC91hyDyj1h7JVatxmWa9i1HAxLmkvQld3nmQE3tdxWofPlrL6wB8nKzV5o5t1GKG4=
X-Gm-Gg: ASbGncuccfVhOSKCA9KGbUk8JMJV3R8tIdoIAUeYbTvbChayZZXWTTZsyWtULWODD17
	ldTWk6Uy+J/PnDAmW99qk0b0727jusJYPWDMw8mqLv4/HqKbWgiNLWsMl4x0Y1Asb/xMPAAtNeM
	hwJuVSJKchESdSd/F9ARkucLC/P9E+/U56TFsWwkqnPnZxHFrH8CSW7unF7HxYYjpyj+Ccd6I4z
	iXVfF/VUEipJo2VfwG2sR7DCVbx7mE9lTb19ZsuVmsycWGuoaUTdd40egyWxYyssCT9yt21ZVZ/
	kMMAbQrWAePw9zm6EYbCK0itzsXPLG25VASusV4kx06fCgiD9wWUjDsFW4043cLx7vZbIMKROOq
	jO3c=
X-Received: by 2002:a05:620a:2911:b0:7c7:a574:c6d2 with SMTP id af79cd13be357-7d44c26c479mr24140485a.9.1751053711898;
        Fri, 27 Jun 2025 12:48:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuo69OZ1gPlnL8mmmPx8kVRl+wj2GVKlqnxh/y2aknDxvte0VDP27AkH9DGLYNw2bZWacjuA==
X-Received: by 2002:a05:620a:2911:b0:7c7:a574:c6d2 with SMTP id af79cd13be357-7d44c26c479mr24137985a.9.1751053711386;
        Fri, 27 Jun 2025 12:48:31 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c6bb6dsm180072466b.120.2025.06.27.12.48.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 12:48:30 -0700 (PDT)
Message-ID: <de111b27-9126-4c03-a7bb-8cce9ea2780e@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 21:48:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sc8280xp: Add initial support for
 Ntmer TW220
To: Pengyu Luo <mitltlatltl@gmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Eric Biggers <ebiggers@google.com>,
        Len Brown <len.brown@intel.com>, Benno Lossin <lossin@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Ingo Molnar <mingo@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
        Joel Granados <joel.granados@kernel.org>,
        Al Viro <viro@zeniv.linux.org.uk>, Alice Ryhl <aliceryhl@google.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hong Zhu <vanyang@smail.nju.edu.cn>
References: <20250617092929.1492750-1-mitltlatltl@gmail.com>
 <20250617092929.1492750-4-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250617092929.1492750-4-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDE2MCBTYWx0ZWRfXwrz/U1FnSRZv
 gtzuTZHY6nYs0helRhcM6RR+sEZGbkml6pS1GwO/tyadzgzVi1BLtU7bjUV5cV+mBNQ932hkQpb
 rtHB+5u1bwR9OHPfUWMMbsTKKDccedOh039EJ2RwxoAb+kwXEjSHj/qKED/AiIsmhDpujeFat7W
 6UEuF8yYfLf/+OzDf08tYdA+zSVZE8cPDIdqqemJEBcl9VOeeb0s+5q7q80kKMO4BIO6umtUDm6
 nuuSzeij5q6kytC/Voq4FL2cLC4jpWZsV1l1iVpQadcJGAebquekB/TJtQH+2S4zYWKDaOl7VER
 x8+1pmQGOCEwKoYT8w0c/KJoOgY7tN3JoRxZsu6daYt2gMJQlD/EiowNX+SgUA7j1TPt30U6A7I
 RABSWx4EoyILlLEAQKMwTxxGIfYNTP34e2z7xhAc96STvSuhzX/Z4PA0UMTIxvTLqI44J+j2
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685ef591 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=MkzzvC3VeMUM0ldRBtYA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: -SMqmI_0us9f-hfLSwmWvM2HofGExViD
X-Proofpoint-ORIG-GUID: -SMqmI_0us9f-hfLSwmWvM2HofGExViD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270160

On 6/17/25 11:29 AM, Pengyu Luo wrote:
> The Ntmer TW220 is a WOS tablet based on the Qualcomm SC8280XP platform,
> also known as the Robo&Kala 2-in-1 Laptop. Thanks to Hong for providing
> the unlocked device and early development work. This patch adds an
> initial device tree to enable basic functionality.
> 
> Currently supported components include:
> - Bluetooth & Wi-Fi (board file regeneration required)
> - Battery charging (up to 15V/3A fixed PDO) and reporting via pmic-glink
> - Flash LEDs (front and rear)
> - Hall sensor (lid detection)
> - Keyboard (via Bluetooth or USB)
> - NVMe SSD
> - Power and volume keys
> - Simple-framebuffer
> - Sound (playback and capture; top-left DMIC only, top-right works only
>   on Windows)
> - Touchscreen and stylus (requires GPI DMA support [1] and stylus support [2])
> - USB Type-C ports
> 
> The following components are currently non-functional:
> - Cameras (GalaxyCore GC5035; only sensor ID is detectable, no frames in libcamera;
>   partial driver can be found on LKML archives)
> - DSI display (blank screen with `dsi_err_worker: status=4`; primary DSI register
>   dump included below)
> - Stylus wireless charger (CPS4035)
> - UCSI over GLINK
> 
> [1]: https://lore.kernel.org/linux-arm-msm/20250617090032.1487382-3-mitltlatltl@gmail.com
> [2]: https://lore.kernel.org/linux-input/20250605054855.403487-2-mitltlatltl@gmail.com
> 
> Note: This series does **not** include any confidential material. Those
> who wish to run Linux on this device should contact Ntmer, as the
> bootloader is locked via secure boot.
> 
> Co-developed-by: Hong Zhu <vanyang@smail.nju.edu.cn>
> Signed-off-by: Hong Zhu <vanyang@smail.nju.edu.cn>
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> 
> dsi_ctrl, reg = <0 0x0ae94000 0 0x400>;
> 0xae94000 20050001 000001f3 0000000b dddd1011

This is not something we want in the commit log

[...]

> +	gpio-leds {
> +		compatible = "gpio-leds";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&camf_indicator_en>, <&camr_indicator_en>;

property-n
property-names

in that order, across the file, please

[...]

> +		wsa-dai-link {
> +			link-name = "WSA Playback";
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
> +			};
> +
> +			codec {

'co'dec < 'cp'u

[...]

> +/*
> + * cci0_i2c1
> + * sda: gpio115, scl: gpio116
> + *
> + * CAMI ov9234 @36 @48
> + *
> + * power on sequence
> + * gpio7 out low
> + * l3q 1p8
> + * l6q 2p8
> + * l2q 1p2
> + * gpio7 out high
> + * msleep 5
> + * cam_cc_mclk4_clk 2.4MHz (gpio6)
> + */

It would be useful to enable these buses and set up what we can,
otherwise this is quite a lot of text for comments..

[...]

> +&spi22 {
> +	status = "okay";
> +	pinctrl-0 = <&spi22_default>;
> +	pinctrl-names = "default";

status should be the last property (before subnodes), preferably
with a newline before it, so:

pinctrl-0 = <&spi22_default>;
pinctrl-names = "default";

status = "okay";


> +
> +	touchscreen@0 {
> +		/*
> +		 * The ACPI device ID is GXTS7986, its exact suffix is unknown.
> +		 * The Windows driver suggests it is a GTBerlinB variant and
> +		 * communicates via HID over SPI, which aligns with the Linux
> +		 * driver `drivers/hid/hid-goodix-spi.c`.
> +		 *
> +		 * However, the HID descriptor read from the device appears
> +		 * garbled, preventing proper probe with the HID driver. In
> +		 * contrast, the driver at
> +		 * `drivers/input/touchscreen/goodix_berlin_spi.c` shares many
> +		 * similarities and functions correctly with this hardware.
> +		 *
> +		 * Therefore, we choose to use the goodix_berlin_spi driver
> +		 * instead.

Is this something you could work out with the aforementioned drivers'
maintainers?

[...]

> +&pcie4_port0 {
> +	wifi@0 {
> +		compatible = "pci17cb,1103";
> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
> +
> +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn_0p8>;
> +		vddaon-supply = <&vreg_pmu_aon_0p8>;
> +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> +		vddwlmx-supply = <&vreg_pmu_wlmx_0p8>;
> +		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
> +		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
> +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> +		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
> +
> +		/*
> +		 * bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,
> +		 * subsystem-device=0108,qmi-chip-id=18,qmi-board-id=255
> +		 *
> +		 * Regenerate board file, x13s one works well

Please post on the ath11k mailing list and propose and ask for
that variant to be included

Konrad
