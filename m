Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687211B6D11;
	Tue, 15 Apr 2025 13:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744725439; cv=none; b=KEqyoA/4pUAgMTtUC1NQYLh2kVBamMlgFfkDbKKAcBYiYYxCmboJhtJy4WTIpFa1d2KcV9r34ajaRROLHXHe5PmcTUxo9wzRabs+JC/zv3DMwtfv75Cv2PyMhWkhMPoTvoiCwtAlz2N6d20wGoF0NxzWJNmD8DM+hJqpKlul6DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744725439; c=relaxed/simple;
	bh=jA34SFoEW+uxho+56Zd6kJfzpz7HWULQY+Aq6jEiNU4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CGJj/vVPtAlxdqp5HGEvypJp9x1AJ7z32Vnji0ZKlku1rD1eirrjY3bNfo/tgvo3X+Bj1x+ivD6+BsFxjdVydpPyJT/d65u7cf4Fv+VcCIBGIKYoFzILatAaZeixHxs+DZo5RZRRnRGj1YBWAnIUKjBap50f05UHOLQaQsfw//k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=Nm69fBJJ; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="Nm69fBJJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1744725424; x=1745330224; i=markus.elfring@web.de;
	bh=jA34SFoEW+uxho+56Zd6kJfzpz7HWULQY+Aq6jEiNU4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Nm69fBJJ4AthgYbYaM3Kz6aKIsujOnAucZlg7uu5qjgRx1Lw6mNqXrvGwst5+8hJ
	 WR+Fh2cGHdKDiR6QSGD81DiG8SwVCIToyL9Orkev30AeLgxBskcGRXLquacnrAwaS
	 8+E99UER1Fq+IbstPYDhK9jpOD4XIbLSorB+QUCj4w8Qm1UNCQXi3Ki5neX0VX4fm
	 Gf+SZCeM6AM8FLTcJIgKmmxzyMWUuMHzftDdqaxVHbF202XjXHyshUzPPCLP0AqwT
	 QoDVYkVtB99mxrpWn4BkXBjSzakTosIRKikkMOJcbvO3irO5ZIsn0krWiVP4nvQrN
	 tk7u7YQIknYyqlQSEg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.24]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MpCmZ-1tEqI30kT1-00gQLF; Tue, 15
 Apr 2025 15:57:04 +0200
Message-ID: <5af56acb-7758-4641-8acc-b81e7c8de709@web.de>
Date: Tue, 15 Apr 2025 15:57:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [1/2] ASoC: codecs: wcd938x: fix mux error handling
To: Johan Hovold <johan@kernel.org>, linux-sound@vger.kernel.org
Cc: Johan Hovold <johan+linaro@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Peter Rosin <peda@axentia.se>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Takashi Iwai <tiwai@suse.com>
References: <20250415074145.7202-2-johan+linaro@kernel.org>
 <18278ed3-fef0-400d-8cba-72f4c573d7ee@web.de>
 <Z_5i6YUSGivzaOCb@hovoldconsulting.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <Z_5i6YUSGivzaOCb@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6Dl7wloY9i+9oKBZqeYjNRY8LjOR2Ttzlb8LrqTq8N21DRlK3mC
 ayUBoB75f+F4zcB2C5doY1WunsIrKrtO2yshFhCjfNjX3kSCDENJwYcYp/CTkDRn7yAHfsD
 NH9jwkoD5fx8XTsvqX/UNtlqE7eiXgBCiBwlClecXjCoOsxyLPgCMGOcO8SRB7iFDrN3V0a
 mKDjFkIji1MQZAuBGa4dQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:sbG/KegFbB0=;rp/3TEgUpSXp+MryT/Y41oQD3sB
 rnQk7FJpADUMkiP5JunX8x+pnVdrKw2Q6zRfm9UkxcPAkCUn7CJjCbjQT1WaGPfzmmG9CmE5v
 eG6Ozo3EunHftHgRDWRDHYJgUZRQnNO2C4cXXIH1H9mc/DcUUT+zAXcMvHw047VSloPsf+og+
 rChKwMGu61SSCQdgVqlyI0WRSuFK40Rl7iHVNUmsauH1oNEu0TCeRuoWSiu1t5+S9fsUMcLma
 UtURYV53CbyS0b3+7NCXylpGa5LQz9xS8cZvpnRCAZyqC6J39+xVXzc4Kvn2HTfkyWc9MGpTh
 jahZRNg942pm/XQHodJWAlbrHSVGaUnWbzQHpb23aReDBD+7dZRkAdAY+JRV0slDsLjoVrV0t
 4Srfl7qV7XeTtZ7lNRqLUL3qdmw8RDNxpPfSPd15aggG6Y6T58qn1iAM2Vzoq7MNu9laPHGL/
 4cnjXM8iSzym2o/wLzjWyOdzrkiK9sctBb+byv3BFr84b6J2GfCKgL+ia9ReF8Aj/Orv80n2S
 VKpzfBeOpU+LvRs9LHyak6EhAn41bnnkW2behCftfsRutyieWTZd+XDjBPsJEmSLZcdQJQlHN
 ctBpRJ7D63vrNorOON0bhdtI389juZMk41eLX40gQguMuRhp+o83KY7nu6IabPOCd7Fc2Ed13
 8BWOJA1RnVC771H2N3CD0aBOZV1g8vXU8NLsq6YuI2v1pqoZU6RYLKPFz3TzJvXOa+Yz7dlT3
 hR5t0L3x8zBuqtBXifLnpR4PQh8kS68d2kERJGRQAzvxAUBHKBRLz8f1VjTkplDJaG2yTAdNj
 9yXl/P+Suq9P2g0iSxAK6zwTrkTu3xQtqvyf/6YBruAHHp/xhJ/gvoETP6ok5M0qnpNomTPf/
 ilb8Ye668Sy/RT0AuQMn17kmi8hkbKK6E/LJ4EdyGjvFhBhWwc8uZ0y45I6n4NTLXo/WZuZSL
 Ru/cOeuVzR23Irj4rd0v/ilpcDkH9azo5cHWjdMOXg6Dj5/pGpwQGzqNeRj+DpDuXPbviO/LW
 iE2uNcbIA14xJbgBd/eSS5GxsuYpR2oG49OwN/vcNuMQGEDhpecxk/R9fH5+2K3RLx+WqDKOm
 gyr1QjPAGhOigNLWa4eymbs2a1VRq3gUMT00az2akkh4wjhWuDnHOgjYc9xlbDAST/n6NAlur
 l/bgEPVrFtI56+44YEcWfuxL4E0H17710jI2kfN1oICFph2qMOgzPhZqQUIDkNE2MEw5viLDl
 1WFXfuAprPVbccpHp80I99iLSVdytHY04QNIT+TCZaIp1tDGsb2eFUa7FO3teciNMkwIqrAYt
 yI/k20uJtudqC04GFSTjwwJJ2EUbhtz7Or0GkmkUtLQ+JXPsYx+eVmwkIQFwfLLP3WqWvahK8
 ijdNlCADtb2EINhmMVg/HmIhQSIcW7+yfHbISFvt3CGkJqt/nrY9UKUHipnMWaeUDRu9jCXVM
 SeHqabFA/2UGwPT6jWwl2Q6It6WZzgDRLRcJ6PxQjD6/mMfTljk+E6O9yP1tjpj5xQqlIqHSM
 HnKZf3UDadGmU6bigPtSA6ZyaGt/4exBTOSgMQKceyWvonQl5QfkrLNfWzGNl0QudJXQ2O5a2
 MgY6YqchAJ2sOpaB0s8DTXgZDrcLohTI6vh+linybLOwt2lG+EmxEv2Ys1KebeT6FyUZ/mGwc
 sq0fpzijmNEH1Ag4a/4hj79Xz+4tvoSkMjiQkJv5cmco2zp6Ti9asQnUrxuq1G+zNavli/EOj
 PcrAWNsffAwJfD7z+yzcYblPI2jdruhvRPFoV8WonaRXjPxescX7wu8nzBVJLzaUL5Ol0uQ31
 X2a/jCBfS3AIcUr5bsrU2w032VTRNwLTB0AazJiswSCSIjpyDS0l7Kvtu1nD9E/Vdqy8g5cxh
 tx8zca72baypnMLwh1V9qEv2lQ25Z9uiUpkJSGz+ZFV27xsYZMh4uAh2YQZ3oLxV6J1X20vGk
 5am9x/8zXZ0vIg/T+YTbAT8nMfRqMAMihBb0azR5MrQia8M3mm/GGacLszJE2BP09yGcmM2ew
 V7G4/AtolYGmWXmkQdE88AtOwsfxalufPbve08RCeRzLFGtZB02YuGOu7tX8PpRrRaqyqpNkg
 fX/6VLMRgS6muUOigT3rIrJXvKc8bCnQ5rADxuhCwV9HZMf8Iwk/lAXpi0e+rRzE6S+Xgw0bz
 b3MOSnMw7wkv7hnxHDakumObdH2aNlo5uc22ZM4u0LmK8QCdaolO2rdhQEC95MNB4D4OFyJhr
 iFwiHEWM1xWb8SttK0AO9sNIfrvJ5QzWV2Q2vPcE0iW65tIY2tvOo8EvR3lagJ3OxQiPeHP6Q
 7eSrlaQ1jvsEaQUuQoO12QsbzEKQBYEu0jhusVjmoJcuDcL3WpQltPdXUZLRPsessWrGlzqaV
 YHbBIJk5DTMlhMiCP0c7/xCHtbUkVU349lAq56El1cWnlVDpoptHGwvK0/71KGTIcjU0tF+b6
 ZU7zMEH01ZIFqdGdPK/qfWQgw0zY/EbDVtSCqtjT7AS7l3Qk4a4l3UCS4YbrmEHlMXQP2hBGC
 +cp7G7T5Iy4kQlJQxsHOLpuVAs0/gVmMZ2p3y4ERBFqFXuz/I9ME4HOJ0bTjG106Oh4JAFX/M
 Yj3H7PM8EdYZuG1MdNRxFZ30KvpiCbfT8AhVK71sLjzU1sN7+/yrOUL+gLDqnn97ysgoqr3z/
 5zqGIFbUY3bOJedmkkiAmxlzirGDEghmVpQxKDW568175Z1efsTUmGpkh7AxIFMDFFuR7m+Zw
 oXJeVj3e7P6bbQ7eGgB+zgCMA+/C2zCN2Fqh8P4oiuHERw0OkFPa7/t0mblqAnUFxoh4e+rpT
 ixxEQjbXjH5nlJNfa2HpledJmB7J/O86XeBfIDMP5jA23bxm150HTe+trHVeJtjzlyPTxXl0D
 yVUFUYAY7MnCcO5e9BvUigDy+yB5KIr8fuMolKkroyeTDmGf+foVH0sC/Rvf7uUaD1h6PyFpA
 VopQ6LrTg+fgU7CWOyO2r5R0zayg/6cR4aZJi8yl9hHjRb36MvUVyQt/Fh4jz9zXkNgovv6FV
 g==

>> May the error code assignment statement be omitted here together with e=
xtra curly brackets
>> (as such a case is demonstrated in a subsequent if branch)?
>=20
> I considered that, but I prefer using a temporary variable as it is more=
 readable.
Would your coding style preferences be inconsistent here?

Regards,
Markus
