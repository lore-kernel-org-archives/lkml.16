Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3D91FF7DD
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 15:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744039850; cv=none; b=e/7Gd1o8/tsmZ3MhyR1oo3Y9Zyh3BXXrdotFdWp979UJYij1Vq7eLwhI8+ySmoxADioajheWVjbO1o8kB+yqeInEFS06zJfLzo/Y2LBGGKTzeyIZrupji1VmIsHbWULBQMlxvQuArjJwVaKxS+nKB8WIH43YDs+nYk2mAKJ+RyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744039850; c=relaxed/simple;
	bh=4qwt4UnyYEcdud+aG9toCSELqhKlikWfnC4osanP6ig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=S8NcZ/4swHy8Hdw+YrXQheGwQukuifQyGrzAycuf6iKHDxLlgE1RPFfwFmgm0D27TshKN8Fiix8P0mmGKiev3pvV26NdKU5Io+hG6tUpby96mxaOGNI1K8gETTHrVSdCuDI07b8ZJDc8zRvAW7GsDrPZ5JzGWPMpUUlh09eGKk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=oxR1oq0J; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="oxR1oq0J"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250407153045euoutp023826bb46a982f3893067776838afb517~0Ev-JSZM51493814938euoutp025
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 15:30:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250407153045euoutp023826bb46a982f3893067776838afb517~0Ev-JSZM51493814938euoutp025
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1744039845;
	bh=9BJwn0vOy9yNn3qw/uCGoiDM3pU2h+s/V7Z34pEXRKg=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=oxR1oq0J6B9cuI62mqsNxNAhoctPfuf1Ejxo77Cpwv9b7v9eumbp2qMIJrwvnqHiU
	 GLxhjx3Yao98fp9hQxWsvKUQm7zxcJ5g8xTgZIHet0Exsfp+fsozqqBb7XPOsZPHMA
	 hZZaEZ7LPa2dkTgU64rivvpKJyol6fDpAxlGr9JU=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20250407153045eucas1p13848b86d799dfe9a1dc8b46f6a994482~0Ev_rcnSk0589105891eucas1p1f;
	Mon,  7 Apr 2025 15:30:45 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges1new.samsung.com (EUCPMTA) with SMTP id 6E.E4.20821.4AFE3F76; Mon,  7
	Apr 2025 16:30:44 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250407153044eucas1p18bba34f155a00e71f0206dd1d5fe2a7a~0Ev_L3n_H0589505895eucas1p1o;
	Mon,  7 Apr 2025 15:30:44 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250407153044eusmtrp237527516d1ec56985d56984a6f1070d3~0Ev_K1g1C2636926369eusmtrp2X;
	Mon,  7 Apr 2025 15:30:44 +0000 (GMT)
X-AuditID: cbfec7f2-b09c370000005155-9b-67f3efa4e2d0
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id C5.52.19654.4AFE3F76; Mon,  7
	Apr 2025 16:30:44 +0100 (BST)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250407153043eusmtip164cc046b905ec84519a877f1240e86c0~0Ev9SdbDZ1954519545eusmtip1g;
	Mon,  7 Apr 2025 15:30:43 +0000 (GMT)
Message-ID: <17d69810-9d1c-4dd9-bf8a-408196668d7b@samsung.com>
Date: Mon, 7 Apr 2025 17:30:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/3] riscv: dts: thead: Add device tree VO clock
 controller
To: Drew Fustini <drew@pdp7.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, guoren@kernel.org, wefu@redhat.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, jszhang@kernel.org, p.zabel@pengutronix.de,
	m.szyprowski@samsung.com, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <Z/BoQIXKEhL3/q50@x1>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrGKsWRmVeSWpSXmKPExsWy7djPc7pL3n9ON7h+08zi2Z2vrBZbf89i
	t1iz9xyTxfwj51gt7l3awmTxYm8ji0XzsfVsFi9n3WOz+Nhzj9Xi8q45bBbbPrewWaw9cpfd
	4uIpV4u7906wWLy83MNs0TaL3+L/nh3sFv+ubWSxaNk/hcVB2OP9jVZ2jzcvX7J4HO74wu5x
	78Q0Vo9NqzrZPDYvqfdoWXuMyaP/r4HH+31X2Tz6tqxi9LjUfJ3d4/MmuQCeKC6blNSczLLU
	In27BK6M47dECuYLVsw8e5qtgfEPbxcjJ4eEgInEgtvvWboYuTiEBFYwSqxYvY4ZwvnCKNE8
	u5UdpEpI4DOjxJ2VyTAdLYuXMEEULWeUaF20CqrjLaPE3YmngGZxcPAK2Ek8nCsL0sAioCKx
	YO8zJhCbV0BQ4uTMJywgtqiAvMT9WzPAFggLhEhsONPGDGKLCChInFtxCWwBs8ByZomFezaA
	FTELiEvcejIfbBCbgJHEg+XzWUFsTgEliYX/WpggauQlmrfOBjtIQuAVp0TnyyusEGe7SNzd
	2AllC0u8Or6FHcKWkfi/E2KohEC+xIOtn5gh7BqJnT3HoWxriTvnfrGBPMYsoCmxfpc+RNhR
	YtLvTWBhCQE+iRtvBSFO4JOYtG06M0SYV6KjTQiiWk1iak8v3NJzK7YxTWBUmoUUKrOQPDkL
	yTOzEPYuYGRZxSieWlqcm55abJiXWq5XnJhbXJqXrpecn7uJEZg0T/87/mkH49xXH/UOMTJx
	MB5ilOBgVhLhtTz1KV2INyWxsiq1KD++qDQntfgQozQHi5I476L9relCAumJJanZqakFqUUw
	WSYOTqkGJrme3bFHNrz0W55vFm0wq3rB9GNvPLbPc3m8ZdG6mldzfy79O9Vj5s//rTENSYdX
	X55YpNnxSifPdJf2ty2Keu+ufVcu2Mga2fX878K2hXKtOa8eHOU3vsjCGL5j19yr2y04lm7y
	eDJnl7mGwXaRi1atqslR59K4/dfeusZq+USm8eahnZ/CTXQKeVcZbd814eb26wyPJy03Y9xR
	Zc0SsPyApvl/9divu6LELF8w5T8K96jxqNVZLbfLhjPnY5h3goyx9VuxQ9nXs8+u7rNV2HJ0
	ivL7A+8kc8xOc/2Wb4/evejiVN4ZJZcD94q+7J81Tcz/pMjM38kWrvt5C7ZO/x3w8b3B+wzW
	7D2S4Z81r+UqsRRnJBpqMRcVJwIAox2IGAkEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgleLIzCtJLcpLzFFi42I5/e/4Xd0l7z+nG7QcE7N4ducrq8XW37PY
	LdbsPcdkMf/IOVaLe5e2MFm82NvIYtF8bD2bxctZ99gsPvbcY7W4vGsOm8W2zy1sFmuP3GW3
	uHjK1eLuvRMsFi8v9zBbtM3it/i/Zwe7xb9rG1ksWvZPYXEQ9nh/o5Xd483Llywehzu+sHvc
	OzGN1WPTqk42j81L6j1a1h5j8uj/a+Dxft9VNo++LasYPS41X2f3+LxJLoAnSs+mKL+0JFUh
	I7+4xFYp2tDCSM/Q0kLPyMRSz9DYPNbKyFRJ384mJTUnsyy1SN8uQS/j+C2RgvmCFTPPnmZr
	YPzD28XIySEhYCLRsngJUxcjF4eQwFJGiZV7b7FCJGQkrnW/ZIGwhSX+XOtigyh6zSix7+46
	oCIODl4BO4mHc2VBalgEVCQW7H3GBGLzCghKnJz5BKxXVEBe4v6tGewgtrBAiMSGM23MILaI
	gILEuRWXwBYzCyxnlnjw6itYQkjgLqPE4+teIDazgLjErSfzwYayCRhJPFg+H+w4TgEliYX/
	WphAbmAWUJdYP08IolxeonnrbOYJjEKzkJwxC8mkWQgds5B0LGBkWcUoklpanJueW2ykV5yY
	W1yal66XnJ+7iRGYJLYd+7llB+PKVx/1DjEycTAeYpTgYFYS4bU89SldiDclsbIqtSg/vqg0
	J7X4EKMpMCgmMkuJJucD01ReSbyhmYGpoYmZpYGppZmxkjgv25XzaUIC6YklqdmpqQWpRTB9
	TBycUg1M2ffOfgtd1jv3iEFK70rmW9n5Zw3n2e2q+TkpVdPj3p/M7xnvT06eKm+tqGkjFm+z
	+aHQNcbMplOdl2QUWf/se3pKYeecDaapupGiCUJVSm0eiQ9dbnoe8325wudWfuqcqvBbhu/E
	evyq//2O+LnRq1tcuanYOSzn4u3Ntn4/V+VGbzttu1DOYGImxyIT+wnbVJbyz5G/UB74LNGh
	/wFvsTojk2pRmvuRi66uT5iuHTXNTu8o6GP+sMo9edvvPFe/Ld8F9Td9+bAyJTtwU+/HFPk9
	/w7JNbi2fbMvYIo21LwZEnb5ioSr6Z+81Mv9yQc7rnumC01VONSwl9PfcFKXScrvlgveBn4H
	ZzAfMlJiKc5INNRiLipOBADznayFmwMAAA==
X-CMS-MailID: 20250407153044eucas1p18bba34f155a00e71f0206dd1d5fe2a7a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250403094433eucas1p2da03e00ef674c1f5aa8d41f2a7371319
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250403094433eucas1p2da03e00ef674c1f5aa8d41f2a7371319
References: <20250403094425.876981-1-m.wilczynski@samsung.com>
	<CGME20250403094433eucas1p2da03e00ef674c1f5aa8d41f2a7371319@eucas1p2.samsung.com>
	<20250403094425.876981-4-m.wilczynski@samsung.com> <Z/BoQIXKEhL3/q50@x1>



On 4/5/25 01:16, Drew Fustini wrote:
> On Thu, Apr 03, 2025 at 11:44:25AM +0200, Michal Wilczynski wrote:
>> VO clocks reside in a different address space from the AP clocks on the
>> T-HEAD SoC. Add the device tree node of a clock-controller to handle
>> VO address space as well.
>>
>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>> ---
>>  arch/riscv/boot/dts/thead/th1520.dtsi | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
>> index 527336417765..d4cba0713cab 100644
>> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
>> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
>> @@ -489,6 +489,13 @@ clk: clock-controller@ffef010000 {
>>  			#clock-cells = <1>;
>>  		};
>>  
>> +		clk_vo: clock-controller@ffef528050 {
>> +			compatible = "thead,th1520-clk-vo";
>> +			reg = <0xff 0xef528050 0x0 0xfb0>;
> 
> Thanks for your patch. It is great to have more of the clocks supported
> upstream.
> 
> The TH1520 System User Manual shows 0xFF_EF52_8000 for VO_SUBSYS on page
> 205. Is there a reason you decided to use 0xFF_EF52_8050 as the base?
> 
> I see on page 213 that the first register for VO_SUBSYS starts with
> VOSYS_CLK_GATE at offset 0x50. I figure you did this to have the
> CCU_GATE macros use offset of 0x0 instead 0x50.
> 
> I kind of think the reg property using the actual base address
> (0xFF_EF52_8000) makes more sense as that's a closer match to the tables
> in the manual. But I don't have a strong preference if you think think
> using 0xef528050 makes the CCU_GATE macros easier to read.

Thank you for your comment.

This was discussed some time ago. The main issue was that the address
space was fragmented between clocks and resets. Initially, I proposed
using syscon as a way to abstract this, but the idea wasn't particularly
well received.

So at the start of the 0xFF_EF52_8000 there is a reset register GPU_RST_CFG
I need for resetting the GPU.

For reference, here's the earlier discussion: [1]

[1] - https://lore.kernel.org/all/1b05b11b2a8287c0ff4b6bdd079988c7.sboyd@kernel.org/

Regards,
Michał

> 
> -Drew
> 
