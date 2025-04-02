Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB88C20C480;
	Wed,  2 Apr 2025 07:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743580135; cv=none; b=S7kOZF30fud6D1t2rgs36HNMs1LuE0qIwJojIrizlh6/j1FugUobcOBa7i9WluNm+ivf8pEVVCOTrlmINyK33WN/n5ekeP+UQJsY+PFFO+Se5VVsBG57xI20PHOJhXR0DTEWvYCwkMiI5Bh3YHn9ndblgvNogKhhwVAOqWRE3fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743580135; c=relaxed/simple;
	bh=4WTIRlwCWsI0q1FjTp7usiPAc+abf6eIAyGe9gA4cic=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=clLLphXxCzRl0E3EpxQjF/7Ux7VSTxphlQByQ+p6YXL9FTuyRGL5jgFvbHt6YBBDHtaHLvLe13B9tlNUmC0sub94xRVD0gEUrOPIc3cGLZ+PHkOWXKog0JjKwdBJqQZb5UVvc6EF4fK8K5Bbm2rQZFIQXLYSI2wK0MeqzFXGy3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=SGjf/B0T; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="SGjf/B0T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1743580125; x=1744184925; i=markus.elfring@web.de;
	bh=G6uXjpK98eneJW1jPrWJnVLfAn5UT7/UubVpY9YbBjM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:From:Subject:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=SGjf/B0TkS7BKh/yZhUNptMdmQYrums+U/YEjLHE4upjYQlFSgVuOQC+kdTFKEra
	 Qk/0q3NgxiJazFqIvzhYrEU+wiJHBCQEn9NKM99KjUjrif554dVltdsnc+9zCAH+u
	 ZsQ1po9QiP/IfWeheIzACDV722sq9LBPkktCypDxEWYQ1DmDkL6FjGp2vak6n1afz
	 UlY2XhmtzYROc76wbJIlXcZfBWpZjT0CehQRNYWoDWLFtBVXkAKHFrwPcpAR89zye
	 DpWiSl2mTPHEyMtNBa2gYsegF0X8W1khEvsmgNklIT8tAUltl72SQ4YNPNv9+1vL4
	 Q5T5hjYkTIUgbD1aow==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.83]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M6YN9-1u2Mjs0t0z-001Tyt; Wed, 02
 Apr 2025 09:48:45 +0200
Message-ID: <bb7f73c9-c004-4d2f-a54e-285d4753c583@web.de>
Date: Wed, 2 Apr 2025 09:48:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: clk: davinci: Add NULL check in davinci_lpsc_clk_register()
To: David Lechner <david@lechnology.com>,
 Henry Martin <bsdhenrymartin@gmail.com>, linux-clk@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
References: <20250401131341.26800-1-bsdhenrymartin@gmail.com>
 <57fac291-6d7b-40e8-a4bf-8b8704662b9f@web.de>
 <7513fb2c-3abe-4c29-aa94-42f0efe93396@lechnology.com>
Content-Language: en-GB
In-Reply-To: <7513fb2c-3abe-4c29-aa94-42f0efe93396@lechnology.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RpyT7LSuRiAlxcJbC03hqkrxsNE8RNBKTPmlUHQhbkiGqbXZNbU
 EI1tWB/+geIdoG/UyA6PcGDWhvGuCF/JaKjqLH5IdgQAn+VQJbelzHciQBuktQq2DnqjUZx
 XkgWLufu1gEMc7fusfPFlxXw9T+/Z7Sr9tEWFGBm8hGoVm+kuLkx/KQoJ5mtlTOYBJUfY5w
 W08hA4FZL6ElWo+Me67sg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wmGQIAupSIk=;Ala3QACgXccykv3XerA9Yz6u7+j
 xqDstcBCV030gbKw/85Z8tj37uCPB67QQ1wmulfiPvXnqoA8w75ZPCCnyqzxx5IuwVHAHZnFJ
 UGqAdYYkVToAaRhzpgSxSBBV2VbKViFXREzSL29uxJtTZX31dtCJWZq9NHbJuZaAUIqIergIJ
 qgStGaTLFPHXcHiXJ0iG7qVIwXv3m/3/cpiiogs9CpoB0jZ5JveEIubQ4YShhX/Fd6bmZ11gW
 fAREpONE7CtJwATqdqz6k+trAp2raff1w5pLrIHw6/c+muSyZUVDNWzyuc0pcyVIbUo/aULk5
 vCfkVSMIIQNUSl7cvwzsyM/EJt3ULB/+Eb/H6aw2q5FxE8+p2Myt5jPbLJdkPIp2AW1+mFCfb
 o2LBV7zArY3aje5hDpm3ypJe4bCjgLwgbAUy9qW+zGTkwyD+lR2TwJUP7HwuOfSBiLkhpbgHW
 bSruY2F0NpBjjvJpiNmeoCIhO9Fen7oW3DgeBzaUAzxK/Mizg8EX0k2vF7MZTaWmxRkes/eFy
 VpTYZmfXwpBuX8th2qaNbEKxIIQOporfDvRe4bUJC0ihCpPBiQuR+1gzHQMAl8EOEIJjaNuUs
 D6WStDjnQZIhojh572SVXup4az0mLvUUsKVw/miRfa/0c7yiVTd5hVdaLE4xBxinrJNXel/TW
 OHao9chHJMjZWfCuk5DfM9X6noM/0MohVBeTHGp/JyAbojYrwveylPlmDxFd54gisA9e8hMDy
 ox3+E/OwnD2zM5TClDkIRwY2HhSrcD6yrkoXoHRU1EX95gA0HTYlfC9CUihXSGOLiOn6dwUmf
 ki+GjE5PJM1dG1c1rs/2rwz4t9OoDXBNamM5uxP23pNVZfzHyHEMe1wj+I6b68j97HPeTl3Jq
 Q9HizE0hQsVPvoQ/f2yUdiDMX/ro/FuFaMiPGmOXFZEsANDNmPK6Z4yeqB67et1XpQ7+lAv39
 a7lmeaZv7jJHQ20Y+KrfjHMuwlr4Y4F7SWaK1FZ19tr0o3MCIpIttl95pm5CNvmCOeCF+4svj
 KrPxtgHkel/JeG5/USHYJmrXzhXdGUVRNVYwARQsnb5qOvrYO0bOO9EoujcKIqOXg1sVJR8sE
 BLCj05iOpkWN+eQJb5LIOZFdLC3HRUXIF8EmgPjioR+cOVZQBJ/Z4wdLLFWf54B6W6W4uhsuy
 RPE0GN/ZbaqxBXUTzDp739xgSMPr46BQuvgz9BsDkJF9hi+kxlJr7coxFlUCYNXWILNeziSjc
 k62EuC+1GLMsqK44tMXPtOh+zWFeZ4zSKuoqvNIT6Hd9EXeE87UR/uxquAEKSD/Xm8ve8iWK9
 btZ6pxVum1E9/mEVWDL6Ao5HIF07aOqJeCgGu5UqDPVEpkLSYAPXBAd82xm5yDBOvo4xT01fd
 lSDPMK0Ub6VOvzlprSPbn6dJuLY4HNviPB7fLdYpIx5M2QbaVUqPUYRK8nhvE5ET3DkbjeB/H
 AONzfqBy0FQOB7FEX5N/gJOxb6HvwlcEGK6oJot7tVLg0ze+2L8brEcjI4c0+cDGW3LbQfQ==

>> I propose to avoid duplicate source code also for the completion of
>> the corresponding exception handling.
>>
>> * You may avoid repeated function calls by using another label instead.
>>   https://wiki.sei.cmu.edu/confluence/display/c/MEM12-C.+Consider+using=
+a+goto+chain+when+leaving+a+function+on+error+when+using+and+releasing+re=
sources#MEM12C.Considerusingagotochainwhenleavingafunctiononerrorwhenusing=
andreleasingresources-CompliantSolution(copy_process()fromLinuxkernel)
>
> That would be OK too.

Thanks for another bit of positive feedback.


>                       I didn't worry about it in this case though
> since we are only duplicating 1 very short line of code. And the
> smaller diff has a better chance of successfully backporting to older
> stable kernels that will also pick up this patch.

Such development concerns can be clarified further.


>> * How do you think about to benefit any more from the application of th=
e attribute =E2=80=9C__free=E2=80=9D?
>>   https://elixir.bootlin.com/linux/v6.14-rc6/source/include/linux/slab.=
h#L472
>
> Not a good fit for this specific use case.

The acceptance might be growing for such a software design option.


Would you like to clarify any more why the function =E2=80=9Ckzalloc=E2=80=
=9D is still called here
(instead of the variant =E2=80=9Cdevm_kzalloc=E2=80=9D)?
https://elixir.bootlin.com/linux/v6.14-rc6/source/drivers/clk/davinci/psc.=
c#L242

Regards,
Markus
