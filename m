Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00831FF601
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 14:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746628239; cv=none; b=QApldRsK3BnLPCkfKUY1BPHWayG+mfNltI3fo0MXnv5BzKrQA8P3XNIkMRFZNsmG8+Gwv/6fdActDUoJp+W7p9tDMMmo16Oa/IEfdzQiQayKSbfdspHqp00/ZpAOqaMMHJimKutiFIsRMWJlFaOaiBrXSZsEzazRV1kpM5gnano=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746628239; c=relaxed/simple;
	bh=F0CgzqUc6igTVGBWz0EqUYaNdoVzlGKOFb7PW2yP6AA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LX4WTIdyUmMcQhUEzGLsl4UITvxm7FDiHSv2dB6SoOKVvZiob7R+xrYz03J4tHek2JmhZ5dSgQfpvU7x8K6WlaiqY0vG6U3c2giOQl4xMfTt9r+Y4cSIP8b25T12Yh76v6A94W2R06AfRuVuv2AQTIZgLjXINaS8sABfZCJZcr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=eCFvJiIi; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="eCFvJiIi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1746628235; x=1747233035; i=wahrenst@gmx.net;
	bh=cXBXr7HAAM2n21I5G3W+chWG8j9Aoay7msQJhmoWDxw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=eCFvJiIiFUr2JPINzeCrPhQkZEY5oMAwrsgQXHK3jXUa6xA0nuWAggM6jAEbJE5i
	 ez0J4xBUiFZ5e0h9PRJqcSwdvGWx1viDfiyTVXTrNf1bjUMMDpid/RxthyVRMbVJ2
	 vu7hmZkhDdy/Ov/gYd1elzyyE4vwjJjUDGCa/1XZXRIIw0wWUPjljzzjtQmZQYby9
	 +y9LhivfHTe/FE8JqJHD7mV0+Ay6XtbMlOXwNdgNLQIx2xJhW5T11lsfBHMnUzDvo
	 Y9hXU5cIUGjAPniSjyDX5VcugnhGZwSjdFedzADLwuz7ErfuOAvVKYwX5jQGVirk0
	 Ty/hrFIBZKp22pUMpg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.101] ([91.41.216.208]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N9Mta-1v915S2sHE-018F21; Wed, 07
 May 2025 16:30:34 +0200
Message-ID: <5af33290-e7d8-437c-a22f-5b873596d67a@gmx.net>
Date: Wed, 7 May 2025 16:30:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] arm64: Kconfig: Enable PINCTRL on i.MX platforms
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, Esben Haabendal <esben@geanix.com>
References: <20250507124414.3088510-1-alexander.stein@ew.tq-group.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <20250507124414.3088510-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:p8ozuEYKi6JP70lSdReQnsNsafgHjlqiDV7fWrKXvLtpZfrB/x4
 4X/YJiIKJtcFdT57bFjYyQczuqJxP6mlIWAfcckq1NFQDXuuut7C9S3xWB7nukVMivY6AD5
 Q4T+W8gwnmWLprK+FvdshrAcsk/bFFR4VbkDvirjdF+1z3yoFxtFX/3Pp+SENW3vSxRPtZh
 sMHDB/Y2KeotUvV2nt5AQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:v5qhwKMHOQs=;/l7y2rjUb7Ycedl+XIqMcJ2FCS4
 ta3LheqkZZMKQt7YoB3Eyx867kL1h/0euWI2CevC+/qTdoFOY8gS50kAcHteNKudWU+uSrz5J
 GRf/Cmoh3djo4XeNJUz2k6F4CBrX4r3RajmiCXWT2iwVK+9NkAJLC+XsCCMmOVDhGAn+oLInD
 DDM3mUMzSMi5cwZm9IvVTtok6MOLl3F+BQlI2pd9l11018pohYbbyIFz+AGNB3AdAsYYKjfYp
 f174NjWRD4Sobc0osTUYJz3NZcy2bB34l1t4MSfc2PCJH2BkMYD7Krd6VFHiiEC1XLXPLiyZn
 3i9BdORpZSX4LH7pea89TS8DvKW0wVrEKYkkQQEGNXSlJFS5WGf/6Tk1TOwhFHTmDFXcat8DN
 HTOISf/HyCurpNmRzuQvuwF6pkmQbRcIBt6SwhvzoJ7uFImO1q+4wzkxDk31PJHtZ6UV9Xbz+
 hMYDG2t3vUmz13o4IDKjkjQEVrnmFLbv789emH1Aem5IJC34UHllpnGuzT0vcwUxZVUsgZb1K
 pUJpiwsDkWXrhVOEy8mnxmhT062HxFv3/+qOPi7us+LEPPhkFfx+6iCUCuCMOLyMJkzzOt1CJ
 AVZMmmlp9M7+5VA05+lUyft5zI7xMnG/DElTXlHg5C3QlL5OC/Tj738j/oHIcn4fRL7odHGeT
 /UEG8Dvw4vYA20tzpMWeliWKGOqpdDrjQpsFwr/dhUsv4HEfUoj2vIO9aeX9wUPod8dztsayF
 MnsFP036hEBVXeVyvfy7oDTewMEeNoBxsEU9go4+AJjxSQCc4cPY39hDIPMg4YK4DkYxyDJxj
 ZlG6eGZ+XbuEgZmTQEoVa5XJ5cbd018mvLVkW9fAAgt7jW6zR3E+BVLEL5NwMYk6Z1NYoYEbw
 bD7Dxsf/TgphedOxG8p3I4lUurPUWBZGWnQO0X05o1IgM+b+wozHa+xX9CtT3v3SjOburuAK1
 puCdLvWrGcyPKk6DJWT2zxjXJqE5Wl8MekS8NIrho3WpfoPogPzpSjWuExPJmxstYLQ/oDNZ7
 R0LMQiC0I19HVJU+Mwo3SCGjluiLE3u6tTVZ0XzARZ9Ii79V32IHbx3NWkm4ZoyrrJ55+g3lY
 5ophqNdCSyD5YJ8T5CNiYRiq7EUyYlpTZ4REp1gc5IQpp9+yBLBtnloB35QeUq5lcmVu0FbSj
 dB0PQfQe5TowhjFA0Kt2yC3Hl1Z0mNfuGrvFUe/psabXnycFpCk9mJNnfNepDYmztlTG1p7QZ
 /C3RtdrcYYfdTHm0jowWlqbNkJ/+pg9u9jgxWnS0YD4f1BQnE6TxW7AjQhOchYw5aJq+oY2jf
 r9hRfA/OKI79QhzpRXf9RUFJvvDkKDnuergxlXHUM3NB9/hj/nMO2dbR0HF7gOffGc84lF83x
 Jdzw7odWfAkn79vHiCkmaUCUhs2BN+aW0G2GxTcA5QppcuHjKSv1Du5hUHtwqwtzGjCITBhnH
 IsfSu5Sw+q418fei3DYYBnRZMKPMXXc1JFB/apWG9Tde2vGsKbn5jnlqHtMQbmpydqaGdjNjC
 sSavo8sxDauS4q5q9Xo+J9saoxQGSO+cXgCy5CxqlpGR+lD/SpP2LsNjqur12sfrd8Pbvl+8b
 Tj56K3DwAEiN1tpXtjZlGbj9X6AjtqilMNr+D7SBKWgSSHvgulyDgI8zHlr5m0Bwk6J87gKYa
 BtU3qEKAOt6DsgAL7lqYZVBjYHm9xP/J28ewuEy66GQj8ye7d2g6bbN1kdoYAmfpzhhCA6mvc
 NblL90yFU5c0MaEHdPZlVU5R3VceavIh3+04/hvZcTeIVHZZ0OWCmQwxHzN4glUJqB7C4NkPg
 aqcB/RgVYnjBs1lPN4uLaZ580zGNwTxw0b/jY1sJtIUreRcsIL3dohKgys+PXgwUNFt6s2G+k
 cl4SvOWhHErQB4ez7Y9VFBJlN2g2iSOHI9W2ZXJnzx9nlosEKQwk+ALJkCwOiomW0MapDYdkY
 XGbSXBMNh1Sytmd9dAT7PpGxagDkCuoXYXRQ7wa1EJ9Dqw5XNoIuiGT1ic7aW8mTW/TdWwa2q
 K8+t8HWGYM9NikwFagbjttDNt1vs/ykwYUhMUvKKiuvYyNun4Y6G3F6L/FZ5mEnB1AjFgdr0l
 O1Evh4+Tr5W0IVf/IHobi3nklVlVuX3FYi78F1iigSSIj1PIaQRh19tOWKMhF1HxpgooqR97N
 9IBwdzDTtGUAMUmSWx/Z+5QIKA98m5s9VqN7qP8qwM+eDL4l2+Dn3PiATIGIIsn1ng5Bgemlt
 2E+OgF1vhPtJyh3e4JxxS7AKQqwxaWuZnR1M+XNmgOF1+mcX7KjUIJEcuZgk7/RHq8mWHUHmn
 +PS161+dNa37yjJ5k7GbCPtin5i2baibiHsjYNyVIWIydrAh7dNR3ZtbabPNefNC3dcAyrdbU
 UiqYsH8giqkvgqVZgpU3VrlFbKzhCR8HIjTv9IaJ40cg952Xb8boQLFqO4dZenV3SXcVXV3qz
 +6Wcuup5LrvZ4yu3Bc7J5Ewwsmoar0DkbAnJIL+uYFQqtGCzMGdrqoIGLdlf+B1roXyWzZwrZ
 RgnMw8rGRzxwSrO88kBVRKBW/3+7qfiEFT9L+bZi4RhyMArtk7/fBfoUjyuI7TtuG9WpbH65Q
 zzj9XY5l1VRURGQLjedagwg5vQ9J5bzdY03qHyIXERnzFkOacmmfEoXWq3qeV14+qF67idSFJ
 0CHR34g7KPPi/zZpQyIXvhAP+JO1A8OWiYP6a8Aqa1lhIHqPgKoV3/cVXktC1wi5OaTrKz/D3
 dxnIfG+uusluPhNbypN4HSDVeLTpC+CrFC/Bzk8fgi0sJuQ57TsgOhkSGcpYH3D6waiEo8lHE
 O7V+JmDYEsOOp+T59nukURBwfpmbhmF0Unoymmjic+5tWI3FLzjk/0F6tnh3fPpNm77XPSKtI
 QLyhmbB1eVMfTv7kI2Nc1+dfWkp726NhknptW3rL4/S0M6fJOT7uEpK6lQ1/lS19XzSV64/te
 miuQi5/CRwyT3BxE57fIgu2NFhG/FJQkfj53YeO1O853ZPzjoKP0GOyoTU9kXzlz55aSBf782
 fpU2C2BwTmkeGpvkfmC7I8THB70WUn/zRMw/yGQom8Gs2THj7bmeB7ER6ltwMqCtRypiDlaZf
 mitoqknmz27hE=

Hi Alexander,

[add Shawn and Esben]

Am 07.05.25 um 14:44 schrieb Alexander Stein:
> Select PINCTRL for NXP i.MX SoCs.
could you please explain the motivation behind your change?

Is it related to this commit 17d21001891402 ("ARM: imx: Allow user to=20
disable pinctrl")?

Best regards
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>   arch/arm64/Kconfig.platforms | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index a541bb029aa4e..49c3bc25e5f68 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -219,6 +219,7 @@ config ARCH_MXC
>   	select ARM64_ERRATUM_845719 if COMPAT
>   	select IMX_GPCV2
>   	select IMX_GPCV2_PM_DOMAINS
> +	select PINCTRL
>   	select PM
>   	select PM_GENERIC_DOMAINS
>   	select SOC_BUS

