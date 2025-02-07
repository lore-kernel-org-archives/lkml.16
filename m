Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B617923C8DE;
	Fri,  7 Feb 2025 16:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738946167; cv=none; b=eEdO+h3owkGPOO2fXACOXK06hcREqVrBFOSPpMYUrSfTK7nuwfbkLvsQhv1rResfuOR2C2gcT/UbQyLuOFfzPOm0Whoy5FIFxuwQzimN22tb8DX8IahvqoMT1AV3tJ2hWlm7YxzuDXY0MxDzXqYSLiZcbrM/ZHnAsc/sKf/DVm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738946167; c=relaxed/simple;
	bh=xsyUA2Qan0ANfv/i9DvHs2mxeJq+KyeixSzoPtL4hbE=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=iYupn7cIKzA8kugui5bCbGvk4dl9uT0Dx3fXQBBycC+n50tw9UbvebbD4+DLo7G0gdCKrwv/IEitypnrhAEqNKTh6OfEvjy4/ItGwumSzvD6cx6yMtOS26lhZ5zFkJBw/AOTt4nKNBE18bicdiO6263r1jZIHqou1IWaLvTs8aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=hDuRYc1T; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="hDuRYc1T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1738946152; x=1739550952; i=markus.elfring@web.de;
	bh=jL7iJ8uPcgTS3dFFh+s1ceSfKiJXV07ny4qcZNTr6L4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=hDuRYc1Tf8BBdIcmUUa8EkJoQRCi1G4McdH9zaYoo4X0ccFI26xVpxviWNZn6Y0v
	 FekabawLSgnLeedvUQQWIjjF6lYKKv6kO8DLLbv1sIdENgv14DXez16X1YhLctG9Z
	 rbwhTgZA86iiWACku2uKDp06h7b7sNYTk6zK4+N3RFHMkvRe2THBlD3L4NcnQnW9X
	 NHHJHJktH4i95K5vEynitw89H9UWvHT6/sKMReYJHfHa9pRtEzAoHSpWolA7KZ//q
	 mYw9RLLl4PLi2GRgi+mxcjHYUeQ2u2ekr0sTs+LrKjTS3k4ZOgpstCxNxwZDB7zbp
	 9qcZvpQPnm4Ak3h8Lg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.29]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mkmvj-1szNGq4BJ9-00ZHZX; Fri, 07
 Feb 2025 17:35:52 +0100
Message-ID: <8b96ad7e-5a47-458f-bb42-7b7c9efb82e1@web.de>
Date: Fri, 7 Feb 2025 17:35:49 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>, imx@lists.linux.dev,
 linux-sound@vger.kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Iuliana Prodan <iuliana.prodan@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20250207162246.3104-2-laurentiumihalcea111@gmail.com>
Subject: Re: [PATCH v3 1/7] ASoC: SOF: imx: introduce more common structures
 and functions
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250207162246.3104-2-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Pc5O0Xl52kPNkTwaOGQwjb94NaD4v7MoUwKVirSLN/rAEXijVrh
 cJQqpOakUzJsG60gPj1A+7aywQ3cMVMFaPDitt/nfVLYeRdDIqu06gB30YD9rRTeq9EVJCs
 IVJ+uHy5jqggGOhJpDoVAc2wSzXYrEc1woNz4yYYHaxkch1VU0GMocTChPpodtS/tgOofgm
 vhDA1XJSCjQYa0w7JWB1g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:RgQ1Ql5ggb4=;sCjLbkEs7cShRsezOhsV4DufP5P
 O8Af7VJtkDrZ4gJEdvFC6ttcbFC96fMkAsM3EIqiMajTGQCTP1rwos+yswh/EV+h/dvFaNT0f
 Y4FmGLc9V3uMiPBfiR+xcS70N7XZC1RBjNFp5wyHe8wxZrbj2cRPQ9LYK0saaWlY5nu89xVd+
 oraUMvGSK/tHrgbFuM+f1IDcwD65dVHDs5x30IRxMRktebjH2WgFWLdgg343ULHwPGTt0OhUw
 9VAT2qwKIDxTdwTtqfQquz4GsMKDcV1E4p5ZQgTnUpI3uZl5kaplKRLPtzgpnF9AvuZOBqZTA
 Lg34c25VeSI8bY9d4pY6Uh6YGmJ8Mkq8dvou75xqJ38kq9MTnLAxVJhq93gLFIK7SA5Egdtx3
 6yHVgSaMM634X0imyqUg8y5yfeeDk38CjY6gmyt7Yim6QWc5cl8h6187Ywdh4dY5zab+7v4qV
 /418B+2VQYDXjitHDkP6/IbVVXvJZwbXXdU13I1dSr5mQTJ9bZrBI5kNSA1E60m5mTM1dH8ju
 brwS+SI4eWykBLLn0PtVMCNDELk2wjkH/BeeTjh8GNaoIAnPSSUxdco5sv+VyfZF3YMt39OtY
 3ZtTFmnGqcvK3+CAH8tDj2m6F7TLnNxxJ2lMb2HCYl21bF1UiXKuQrFfsK4EEmPeF5XggeCkm
 4/aGojlLoWOZvIzwAGFTMDH3pHCwt7l2lFHFpHrbvPrBUNtA4g0Ju6W4MHbnaCTPMgjgnT8EM
 FFKhcmcVUTMFvFtfO+wmiPyQGuBrdd4KHqKowU1Wfm7AFJWLok2ct3CyJ490o9IeyLS+pJcMP
 9+crdWUaTMR3KQGhT0NAPKlugyiIa3psMiaphuwhoQYgK2Z3C7lH4jCqTJ1eLl6d0d8Yl32je
 fE42YtxnLlNi/t2LICIzxeJ5JfAkkyt8bg3sFEk3rL8w9vTzIh5bTy6iahzujYHD0aSQLHjwB
 /DNk6WVMsxoCNiYkshqXvWvvkUrDBGrFRDyBj8rt7+XroX4Yzk9mu5gQ6ljXV2zwmCPyznCW8
 Wv1rzS0uQ97TD6S828NDxL6BCdXDrdTb2L5n895V+3BdROAndNY6qB5lCYKcSPm9VJ5mElD4C
 nDKLkTzOrLeValMRdvf/sIrdWPdxCRNXSfwhZ/NcY+4pdUSNHyjMuPof2KVNrGNGEVPvIJDa6
 HaQj4+H3D7kKiMtEzNThy3kTvpMg6bnE+74mZOaSVPlcQFDTUfx2w5dIQoG/SPqUrCaG9qYms
 Smgpdoq+9n0dmnwoRMR6sU4mDJppwwcfYl9rCdtAD3LBJtHK5GYx8JctOOdDmPN5haKc4YNab
 f22dYXuprxonQGjXHfDp95+UGd4snx73MTn7UFWpuKEVIR5OyVJ0D1PE0Uc5jrAiXTlzTrEmu
 1ZEDX3hbf+n5w1HwLWqqM55NO8MO/1YomxAx04WLAoTkSmPq0t3ort4oeObrQgLvuH3RlX7YH
 FFf4E2g==

=E2=80=A6
> +++ b/sound/soc/sof/imx/imx-common.c
> @@ -1,11 +1,16 @@
=E2=80=A6
> +static void imx_handle_reply(struct imx_dsp_ipc *ipc)
> +{
=E2=80=A6
> +	spin_lock_irqsave(&sdev->ipc_lock, flags);
> +	snd_sof_ipc_process_reply(sdev, 0);
> +	spin_unlock_irqrestore(&sdev->ipc_lock, flags);
> +}
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(spinlock_irqsave)(&sdev->ipc_lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.13.1/source/include/linux/spinlock.h#L=
572

Regards,
Markus
