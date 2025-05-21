Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB77264627
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 13:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747832775; cv=none; b=rD/Qgw70xUKK4lr777aN7kg6lfAlneMhknyCgZ6Dc6wzoRY4Etd6aWI3NYXatLJ2OtE8FaSD0l8LJSAlod/JpWD1/PZO1a+X0k/4dPdOZXl1qn8M0DwbC2aJSpYfWTtgQdqFgUaorTXnr3HcHQxwZixrgFiltC9RnK2bNIdXwPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747832775; c=relaxed/simple;
	bh=axrd+AVyI/Ou3edFk3GkCnO/jaVTSGc4ozeBwZYxRnU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=RzlknL+akSx2j8CAEPeSvtc9Clkx1uGlobuvggbOJw5Zcp9SFGC7/qiHR3kut6+wk6a/RNZ1oCSNl5X2ToZ7jWzCuqC9IYfzBC5XrgE5L9HCNtGR9viBxanlff62MdE51PRrC2G+mKDPIbrzN+k2KOBmAfDfKFx6is5Omus/4Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=esaczaRK; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="esaczaRK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1747832758; x=1748437558; i=wahrenst@gmx.net;
	bh=5NlX9R+204ssSrldNlLCK7Wn5ZS6iAmLVv1pxs02iZ8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=esaczaRKVVjzl7G8/vLuTeLjPNzxFocHuYJeoY9F+rbjzTLlrI2cVCF7LH4hevT5
	 8neFSW9isM/k0CRsDL7Qh5iNabeu5FICE0jzi+F7/hCPq9iSjTK8GMjsrLRzmgX1g
	 Dl1bm+4n37Lk+ZirT1Jpsxs2G5DAL85P2shR6q3YbimKSy65VjGsuylBwlJyw1LkT
	 CVZtpBzxyXZxE7Qy0nNhxCgPpMOLafET98HgyAHwoo+xhWIagOhf1COLgKTlZ1RlC
	 cqyUVJxhZj7fugy9eVYQRed7wcdo0cfeh311N/5XANifzEZ9G3uXWIW+QD8hvt0uz
	 Md+YP1NWLQsjGHx87A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([91.41.216.208]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MLzFr-1uYyud1v9t-00IYDi; Wed, 21
 May 2025 15:05:58 +0200
Message-ID: <f25571bf-eee1-43f1-ab54-87d860156b79@gmx.net>
Date: Wed, 21 May 2025 15:05:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] firmware/raspberrypi: raise timeout to 3s
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Etienne Buira <etienne.buira@free.fr>, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <e5659e34-511c-4137-9ffe-152bb0777146@gmx.net>
 <aC2lM6xXCVK_3oWI@Z926fQmE5jqhFMgp6>
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
In-Reply-To: <aC2lM6xXCVK_3oWI@Z926fQmE5jqhFMgp6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BERvu+VIWoDRGOdt61aRXtusPqlqgLJfPNbmKLSvTGK8LduqpgH
 rCyi1bhYc7YfQ5qgM/3t9VUMWcZDUXv+JTKT+WEuoXKbodcI8EZEENd879ieTsrqfuLrNy2
 4YcNf6DWGrv3n1Sx/6z0ECmZi+YOmfraiZ+doGbYAKQH+KKCB3dwTnbm52C/11D3JcIlGU4
 HRlI/+eRuhrKvAjtB9VQw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:d5Ey/vNkxYk=;/uQ3A9PqJkZTauPbMo6gNIxL5oM
 bncXWujH7b0bBJr9h/Z57wjbOhquVHQFwwpt0cVwyUig7szXc3huTQnhJp4fBo85WiVN+Ocp6
 OwGoVL/sCs4oFIgNNwr9PzbgnAXfhCBDXuOyyrCXYd3SCvMKQ+ypPmE3HgirUeD6tEw3lkVKF
 T9mSQ6BNKlgw4OQ3/cfkAV0ddcs+/1m2kJ7GhAzUClxbu6tZvMHKkwcNdtwdoXeRNGERMjbRr
 kGkDfesspC2FZwlrfk7T2nLTb0nu2OdsHXd55/KRalNPGKVtY5zJh9aRAQRzxRbu0HaTb9wd0
 cTFybImv59U4n/SKhMwW+db771ecgvgsQYt2AmjRW/fRU/L+D0zfzwg0s88U17ieizFPcWuFX
 xxdORLnXY7URQ1KH6+hcqH5P2XtTGHDtDrr8J6buZaPXH3uUtiwXCvGS+mEPs6KsbyPw0wfCN
 2QCsgOzDov2Px+bp2K4yq23S41m7tGQmRzcPqlhX27SxYcBqzR8KpuQpQmJ1ofVYVg2dAzezb
 sPKtlQao4k5zTP9yUuJoAuG6v4at40CaNH1JRyu+ai96ZgI9+CmPY7sHKDmN+zKWuJrR5IIiI
 bHYy4Epn51MnAg+Cx5+Vx5bw/V9GN/zllKGmN1fGRW2GyhOTixPF4yvT8bt1THsGccw1R7QGc
 IBep8cwUpXtk9uBV72uorGi2/5sGw4cJSgXuZ4/E1NpFsJEb0RUTcHOA88jFtJ+oYB3f8Bao2
 8JqyxJsHDYn5MElaYQOrTnTRhChrRX9OnYgNd3Ib5sgYPZhhT17lkbgwcSuN9OScY4MxUAo+E
 cN8F5nlzPI8zBsWr3dQDY5BgHf9jPuMwrk5v87tfi1gXVM4UHNE7wC52gUtuhQAZt2c3fYyGS
 o8Smt2UcRa6irXVdHaKMPC9TP2g0BsXEFuBghiq/BBPaAA2LtmCivus+eX2Oebh6QhTzl+rrK
 YvOJjyVZRFCUqtRnVyMEtA5eh4PjfYmqa7SVdHw2an4EXq3d+eoNp8aHaPU6xg7L3GPi0BHhY
 a2BuPPdbzd3yTOmdkhFQof2RTaWUBzUv7aApKxVWICcTBRTno036bRU+U+kJ8L64U95RN854g
 +5mEalAz9Sbkag6pjmpfITrx1ykJAfFXUYStze95j+yK3bbSWM/f7InFEoM53rde6baE3lcMi
 BQgfvV/3PCuuiR4QSID4wiyBbnsAQar4ALaxMszGnz9DFXwo3zDiJvowTXWsdCl1RisT0Xamc
 2JcnII8cHN2/8O/aDz3L6KIdhNUwZPjqrhhUW6vyJ5Ol5sjNf3HHmiOOPemZd/jK2dWF4wRPP
 Pbj6gS2YOpJNuSszPmMVxnphFKvKwmXl4h7tqmJkLjqEUCsnOqV8BcJVCzUyv7kGsf6x8i1F6
 Hmcn9GGgvSEcI7RYnPlj3sLii/cPuR5Jnn/Y0izw/3cEM0/Ne6yXwAdnKJkuGXKCy7aY1xeN2
 x9+KVTeH32oDwxctD7S3VMWqPe2XNKKA2LFhsK4gVoUvlS2puusZTcnHRVqnciWth+to4Bx2S
 ll7Nvgo3ACqvcsNkxdic1uYzetF6ySo0d69GetyfD/YaF9HUkHqFj4Yb8YaEL2/RTwWnu9gMx
 d57xmBB2PWIbBS9DFl06M6YGp0MUGueYx0LQDxxN7Hp4dwN8x+yesWc6Hz2JFgXxliYqrNeXy
 gM+UvhR0hCueY44Qhh1IhIroKh9wqNPg8y6nontm9VaN79623uULUpJU4+znYv+gBRhP7+JUe
 iU87BNQ+0TWXRK1Xd8pprYo78Lj5DhmdvlcRyULeKVg5/hLHg+47P9tIVKy84+C2VADFEHlPi
 bnQRY/6r80ra+SOeCEa8c0T4vDc7wUIbhegj58p2rXF+8Sddrf6Eb5Y63S9GZRnme4PRgqjD4
 qjnxD4hpDuMdZeu+SEtL321wR/lgkxCoXyCh63JM8RR1Dwq6OmxKrlS20Cat3qozxuzDj+OkX
 j0/Rh8OlRcqCjjvsay8P4N2Rb6kNwxtx1W1X2RJyic6jqrielKATRlLoL4F4Vg9hxG/eQVKiD
 oID0OotQxt4NqzNc6JKAoAzdHxGJ/ODGd3PcpA4Yddl1TCAmKuQzj4uBSgWUc8+1Z6HDtD5MB
 01NQ3OMSnPA21mZdukkQRVpZ1ve2DhgUbjrjX55nFw5idx93GllYjYcxehKpvY8PrGz0Ildut
 NUEJi7aHYSYCdjd4YFhoFHwTyd1TXbvc9eMBfukp0q8FzzooJQmbUmAiSqJw8j0BlBCf+NxtU
 QZRXGmXjGxaL3nOEr3EcOjZHsoL68sa2FmMWzGNVDE8lle7651dC2XOfbvNS/8fB3UhwNcnS5
 bTPDZWbR5TmfJWmhWb8ApVCWZmcrPd8gZceaaBJg93pX0pyPo0d/LW3eQNJ+vDab2rSYAi67y
 1EReFiWQ/FOPV1vprseXwXCaeZd+ogDGpp8IvWTS6W5Ys2WSYUmWTECE6uTI03joAGOix81WA
 ZQO7lbnfyDaZfBM1x6s+1csctJvH1PGfqB3FT+3DKoRXGwjccqrz+Xf8eoRuM0TjmCPnrVOiZ
 PIAXOQFsfZLOxba4obXnTgcPzvUJclKclEtrjEhPfwBdiwIfRo9z3Lf+7xz2ohqW4Vir2aydK
 Iw8jeteFBDYNQO9n+jcN4XzTAFtfo930UnFMRBUdaHurHJ/fR2xeT0nbam5ijgdO9o1ZlF9NY
 xhqoJrQMzZVlDlXXHDYArI3El1eg8JE+8FmCRajOTteN/nbstL9wHhxHUj362ARdHeTddNdWq
 dyt++E8A5aJZ1PaXGnJigqbhmUr9vhoMPn2dZPPydaNvKryHkxaJKSHIs6sfvQm+uDPfgK1gw
 J+xdgvsy0oL6tGF/+p4FNeauL9OfuAW2TVkTUGYjAQ1G4K8/bQo/qpN287q9ikM4puchvRjGJ
 FyCW5o+tw5vNT42EnM5oO6j1rnwnirwSoMwqbrEM4fGG1L0K/al6fYlpdX/43yKB9xitLNoWG
 4WgDjV9pRhSmn0vvGxWEOV1YVLWtvfP2GizZcXWPWfARE6I9F7tYgxfmmuUu3PY6gVrz2LAI1
 PGZrYYdCEqJ0Bg/3FKgnqm+AgH0TfaJyNXUt9MwP6jQdz6rqUDIOd9fKE9iYFS6rMtcJOv/ql
 ZlC/vXmoCdVhD0L43VjDMKMiULkYZj/Y/asdK1RRYVEmn7kTp+PLDd7qY0HdURfeA7ZH39wm7
 TS9o=

Am 21.05.25 um 12:04 schrieb Etienne Buira:
> Raspberry firmware driver expected said firmware to answer by 1 second.
> However, some firmware versions are buggy and can take longer with
> RPI_FIRMWARE_NOTIFY_DISPLAY_DONE.
> [    2.861407] ------------[ cut here ]------------
> [    2.865512] Firmware transaction 0x00030066 timeout
>
> Raising the timeout to 3 seconds (ought to be enough=C2=AE) doesn't trig=
ger
> timeouts anymore for me and proceeds to the next failure.
>
> Some details about firmware debugging are available here:
> Link: https://github.com/raspberrypi/firmware/issues/1970
>
> Signed-off-by: Etienne Buira <etienne.buira@free.fr>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>

Thanks
>
> ---
> v2: coding style
> v3: commit message
>
> Stefan, feel free to edit to your liking if needed, or even take
> ownership of such one-liner, that would not be stealing.
>
>   drivers/firmware/raspberrypi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberry=
pi.c
> index 7ecde6921a0a..8c45a152e3ba 100644
> --- a/drivers/firmware/raspberrypi.c
> +++ b/drivers/firmware/raspberrypi.c
> @@ -58,7 +58,7 @@ rpi_firmware_transaction(struct rpi_firmware *fw, u32 =
chan, u32 data)
>   	reinit_completion(&fw->c);
>   	ret =3D mbox_send_message(fw->chan, &message);
>   	if (ret >=3D 0) {
> -		if (wait_for_completion_timeout(&fw->c, HZ)) {
> +		if (wait_for_completion_timeout(&fw->c, 3 * HZ)) {
>   			ret =3D 0;
>   		} else {
>   			ret =3D -ETIMEDOUT;

