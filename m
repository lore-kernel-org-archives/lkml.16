Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93862BA4A;
	Wed,  2 Apr 2025 14:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743604945; cv=none; b=qIrejo5Uoy2zPvtSq218/17CJ3VOIGgw4dhG5Cv40vHdfPOCHkBATt4OTVEYm/mmv6sgH2ZMoif4GRtXVK4aGdiLhKaro+lZ1EXxaN3SuPEVIkkpyhWe7GlF69l8kzMiOxNdFe5fl4vB5MpAJgU2nYNZTZUWJODuzMC2FFzSrmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743604945; c=relaxed/simple;
	bh=jZThDM38BtY6ZZe/5fmNpka/pWa/QktiealOXJ+M6s0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Al9g5h7Hl5bgpLyhTOR1intEe4JnMULSOBo/OBy9mRhzHEcuw07EXIJkbr0GjM2TF/0+UmN326afKnViP5O9ZhXzBJmD09k8hMvhY16h1kSMpynbQL/dPxbsZzFE20A7PQLLXglvrk+gEPd2rAHH5izSaXynj/dvTyEAKQpRdj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=ogWQ6Gs+; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="ogWQ6Gs+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1743604934; x=1744209734; i=markus.elfring@web.de;
	bh=jZThDM38BtY6ZZe/5fmNpka/pWa/QktiealOXJ+M6s0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ogWQ6Gs+5aGwf4Xn2TAIcvxcJTBCZv1DcHV9JmKp9oVVq/8fbVSVuEqylEuczlEc
	 Vgx1F86Zxm01FHR+aL0GIUxs6B683UkEod6eiGso8qEQQT9GFFVKbBNo6iMs6xzWo
	 J0DD1J8FgNqUPr8pixKGbf1cP949mc8yHoieUiUDcOn4X9/FgiJCQYa5D1R6e8AmV
	 +HTrI+J7BakwJ3OJ7g2CT7HcPlN5p5N17rDPL0/LsTrj72Me7c5MMWqTcb+0V9yMZ
	 TNcHi40IL0WR6WHx0+cuTuWL8L/bCXr+3gMTJhH0ZddyJzYQCC6QTFnNGZYJ6M6s2
	 0qqK3HySIV5hbq9Rtg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.83]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MoecF-1tK62x2zij-00jZt6; Wed, 02
 Apr 2025 16:42:14 +0200
Message-ID: <7415fe60-0e50-4854-8c6a-86a69c405e46@web.de>
Date: Wed, 2 Apr 2025 16:42:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ASoC: Intel: avs: Add NULL check in avs_component_probe()
To: Ethan Carter Edwards <ethan@ethancedwards.com>,
 Henry Martin <bsdhenrymartin@gmail.com>, linux-sound@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, Jaroslav Kysela
 <perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>,
 Julia Lawall <julia.lawall@inria.fr>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>
References: <20250401143222.30344-1-bsdhenrymartin@gmail.com>
 <ed1be43c-99e0-4afb-8f98-9c7f39611610@web.de>
 <deahfhubcdeq3hw3qqu7waqdgcet6n5lpkfrao7u66dmroujzk@35gsdx7hb3rv>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <deahfhubcdeq3hw3qqu7waqdgcet6n5lpkfrao7u66dmroujzk@35gsdx7hb3rv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:tu0u/Exckx7C0xqBQC766MjfvkkGsQMCk6PtRCskz6tAn1/iHL7
 CTJyMBAGdOMAtVH1e3K+ghc7SL+7mpcVbiXd/plPzbW50+ESLk8r1pLaLXnqM3tUuiU9z3m
 7yPxwy8S+Cha/JRX2FIN9cKERds9PO+fAfFdl76cYi0V6uM++RrQAxB+G6uWv4QGGfLkFPL
 g2323YNc7qo0zzP8gbZow==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:TAzvUgxwjNw=;b/ITWy6O7gHddJhFac3EZ6pBYPL
 Ma+LGP+2GgypQytAhVyV5Tsmil17B5t2Vq9PthafLG9vgJn2tjET/OJBis42lNK1l8PqwbUyA
 DJhc7sVG1UUGYi6pP+RJCqaFKEB8d42RrK63pEm+8djtAB1EE0tpvFAJlG09p3+xIBtRGfU41
 tBNK4b+jiLVMwspoXyZ+L8SLEgAy68J3rsP1RFlvKfqBy3puBzLpBzhdJsOmUfQCJXJT5BV4f
 rL5Qz41fUX0+x98ZSJYRjlurRT5+CIFbMdn8zYA347LMIms0dXf6J0rMg8bXwG3PlvcTTtcVx
 soFDwmUv/7uqLWekD+gr914xd6AJYPC6Z8j00u04SaTYlTScu+6MuXwkIb2CKbBfjoLyGwxIe
 F7BlQMZ74cYha8591AOEq2mzKnELSF1YgLOQlfFBa/mCwPquMep8lnJAqn2qpE0ga5MlgPXGX
 BlNE2Z3yx8M8CpeHKipgTXmrbRWZ4bgtrCUwzkBwc9x15hL5Btp1pY2Tx8PIDpoqAmkRe64QL
 F0D48vqW200tcmm+jgaWt6dOHmnq09xwhB1bhBOYwmK9mBTiy3OVPUBqw8E/k29YvXq1jH/G/
 KlCIm8tRsTtc26hE7WX2t0p6DaKebMgMHvhc6xo+SdItgTz0OKSudmJ/AiKugwP4+sNYdu6yK
 6Bg4QKUN2KryrHIT2z39Tvxa+NYoKHe08QUj7SDmISPZEIaYCLwuETQn1EtbY/5bJp46fA0fD
 5tlWybxN3HGTNP45mSMRWx4thetZx9SS3c0Hq2fR3A/SAt0GIdy6qpuaY7wiDoGIbQG5JbzBB
 W+CASn5NK1ZikhZjk3moMr+3cyjlyba6V29LLXEs5BlIkh1RFdp7KCoIMYIrUSNsqra9z5/+q
 9v5qns97l7Q+NZAeJ+nyK7JlZsXh7M/4Ip23fu84TRXDBCJAGlTl14++xmVuFzt0nr1mCfieT
 Paur0mynePSVVaBIvEFl5HBVn0zZaa4LZhv0CvI9AhkZ0yN4g55p+xxpS+1np+fzTgdX3HBQa
 ueHl+wnhQh9BBeEOBSXccqUQ5VUJhg72apJi6I7ZdtjHrYwB8/WcwdCVBWicXm36ww6GU2M46
 0NbMPI1tyZ9x9jRkSO4dB8XeJd989ZoJoi3tJ/AafZzFM5G5UXMnJX5kLYs4xfxlAiYEiAWgU
 B4brDouNWk1ECl+b2oY9JJI2CrgPC3Gc6/iZqkbTXI5N6bGme4hCxMU0GLUMcCAbtm37f8nY9
 7OfI9C9kBq+aqa5mbUoi9wHrUegi4PTGKWaEZmbcIJAUGQT36Jv5luwFBwz00z+4KdQHJBCkG
 ZTzyQKv3nk+thDw7bntp5jxBfKAqeEHShTc6SRVvZCoziHWo2jjPmsV+D3+yPiXdMT1LTTJba
 6afbkByPep0PqdUTBLk0SuglTlrAkXjqoYDf/DaNyw3VM0CGYQ02hNdNl/wvfpGnYHJylWcA3
 aYK+iN1+LacHG04UolBr1GgoB/R6cBuqOYXbWRIB24I2E5e0BBKSnZU6Qxm/pKt0dPvwj/A==

> Please feel free to ignore Markus. He has a tendency to provide unclear
> and nonsense feedback. He has done this several times with my patch
> sets. I almost wonder if he is an internet troll.
Can any of the published contributions change your mind?

Regards,
Markus
