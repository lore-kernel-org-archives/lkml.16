Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A718110E0;
	Tue, 27 May 2025 18:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748371333; cv=none; b=pKIms999KHykmN7o06RKNum7fM4WJ+K81u2c0tHm8KAF3UL+yvdubhfPAmREUDNS5v/A4oDbZklPJ7DfCvDoujGbMAXcdLo5BKxAnxmxRqogGLH7eOOW+qlKiNVlgHtrd44+s6LpZSj+hLifx9pMOYbVMzG/IZGbjsVmh4KUnjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748371333; c=relaxed/simple;
	bh=J2F2a7oDIb8i++RtPJjzNyagYxJNmyPAATFCaksPPZo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P1lMYacjWTosri2nPqMgKTDjkWNqTsBbfW4/mkfqXPlnbDoJGCen/AJFStbkNfWXHfqouD6hI3TXT6isk1KmphGdkmJllOXDR2TjLiLP+Ocmlgmf7pyEt6aNt/F2hcp8z3fGPignGoXZ5h2qGj2Ahia4HVIrhFfg9ig72vE6KfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RUGZU5xH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RUGZU5xH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB86EC4CEE9;
	Tue, 27 May 2025 18:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748371333;
	bh=J2F2a7oDIb8i++RtPJjzNyagYxJNmyPAATFCaksPPZo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RUGZU5xHrhJpqzE0iB2oP+pG2PNC63M8DcwQ+tIk06JhDsJVyqXK3giOBStyCDZ2A
	 Qn9Zb2AzT41bqJLLlL/zCptYYpKlVRPDIopZi5rHgboUc5Aqg53ZeOFCpz6aI6lELS
	 9WDmut8gFVqPc7PmjPDOPJjuAEtp4SpS43rjKWgIsQIMF0xSoa6emb/8y/D7usGCEL
	 cZzo3+J46+/1mE4LXAkm5mB98ZsRPIclQWmrlrh05/D4qqEvAkibXNP7tjKQ/xuuMp
	 /aW+51YpZKRHFR4udkQBJ3G6l6NmAZw1ewlbzcb3aFF0NFOcIS9kFUtGSmWG9BUaw6
	 nHxCO7YA/YTxQ==
Message-ID: <b2ed96a4-a236-4ea2-9e02-6896ff03caaa@kernel.org>
Date: Tue, 27 May 2025 20:42:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v12 00/19] Support spread spectrum clocking for
 i.MX8M PLLs
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Abel Vesa <abel.vesa@linaro.org>
Cc: linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 linux-amarula@amarulasolutions.com, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
 <174643143452.2950397.16722215892279685541.b4-ty@linaro.org>
 <CABGWkvq=pXhrzyCV2ABvQ3uwx4qKYL_G9280p5ECb8nsJ859yw@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CABGWkvq=pXhrzyCV2ABvQ3uwx4qKYL_G9280p5ECb8nsJ859yw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/05/2025 17:19, Dario Binacchi wrote:
> Hello Abel,
> 
> On Mon, May 5, 2025 at 9:52 AM Abel Vesa <abel.vesa@linaro.org> wrote:
>>
>>
>> On Thu, 24 Apr 2025 08:21:30 +0200, Dario Binacchi wrote:
>>> This version keeps the version v9 patches that can be merged and
>>> removes the patches that will need to be modified in case Peng's
>>> PR https://github.com/devicetree-org/dt-schema/pull/154 is accepted.
>>> The idea is to speed up the merging of the patches in the series
>>> that have already been reviewed and are not dependent on the
>>> introduction of the assigned-clocks-sscs property, and postpone
>>> the patches for spread spectrum to a future series once it becomes
>>> clear what needs to be done.
>>>
>>> [...]
>>
>> Applied, thanks!
> 
> I was surprised to see that the series has been removed from linux-next.

Did you miss entire email thread explaining why? I think you never
answered to several emails in this thread... and we - including myself -
sent them a lot.

> 
> It’s been 8 months since the first version dated September 28, 2024.
> The most critical phase was version 3 -
> https://lore.kernel.org/all/20241106090549.3684963-1-dario.binacchi@amarulasolutions.com/
> -
> where two key issues emerged:
> 
>  1 The CCM design is flawed because "in the current design, CCM is
>    taken as the producer of CLK_IMX8M_VIDEO_PLL, not the consumer."
> 
>  2 A driver for anatop needs to be implemented because "using clocks
>    to replace fsl,ssc-clocks is possible under CCM mode, but you need
>    to develop the fsl,imx8mm-anatop clock driver."
> 
> These development guidelines, agreed upon with Krzysztof and Peng,
> enabled a coherent implementation of both the DT bindings and the
> code. The following versions, from v4 to v8, were necessary to
> review and refine those implementations, bringing us to January 2025.
> 
> At that point, Peng opened a separate pull request -
> https://github.com/devicetree-org/dt-schema/pull/154 -
> for the definition of general-purpose DT bindings for spread spectrum
> handling, which ended up invalidating mine.
> 
> While waiting for his pull request to be accepted, I submitted version 9,
> trying to at least get the patches for the anatop driver merged,
> eventually reaching version 12.
> 
> This final version was merged, but then a few days ago it was dropped.

And explained why. There were bug reports which you completely ignored.

> 
> As it stands now:
> 
> - We still don’t have proper spread spectrum handling
> - Peng’s pull request has been stalled since February 20
> - We don’t have a driver for anatop
> - The CCM design remains flawed
> - Not even the first 4 patches of the series were merged — these were
>   simply a replication for i.MX8MM and i.MX8MP of patch
>   bedcf9d1dcf88 ("clk: imx: rename video\_pll1 to video\_pll"), which
>   was already merged some time ago.
> 
> Could you please let me know if you're still interested in this series?
> If so, could you suggest how to resolve the issues that led you to drop it?


You got several replies what is wrong. Can you respond to these instead
of coming now surprised?

Best regards,
Krzysztof
