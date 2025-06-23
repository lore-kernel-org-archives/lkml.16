Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC701F582A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 21:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750712889; cv=none; b=a23F9Fp9adV/dhcxAbRrVyIgZpXTGeGUX/Ji/fnZYYa2Yw8f3+jvu0asqlgnTTWUI2EeMMt9Oh17zHW3rKhYeVF4mgD/xEBbdLiA/ZO/L9S4cdmm7ZvQhuITT+zKzfUBn2AdwZ0ll83UjkWoc7MVJxLbAZsnTI14HdTA2/DryL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750712889; c=relaxed/simple;
	bh=vdy5e14izDTeYU29Gvoio4S0TZa4cGG2J1dxKrlP4MY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=YLh/CUfkeMDbQy/Hx+MyPOnK162I2V5q+RFghRsg+KTmju+YUfA1Rbb5J39xyJGxl4NSysYT4B4UaOcJU/iYbOyIXHTy/hKpCr4dxzS0DuNyMb0c+SQt+UdtKDn2NpJ13cS14VWENjAUPKvLOsEzVv/tXzB5hR91ur5Tqyzeh+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=jl6h7Ky8; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="jl6h7Ky8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: References: Cc:
 To: From: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1750712886;
 bh=gEB9Uu/BrBrdgfsB6ag5zH9CJIrem98ugMHj5C+RaBk=;
 b=jl6h7Ky8H9onZFvdgS+VceSwaLsmF18yJkgcUZquc0ussuo4yyNi6+p6NB90vHir5yevLDWFD
 jCmKlIfF/GcL5tbmCbMt9FEtxHhHDFrGOkvBCDglH78mNQHxTiac1j/HfJpUNIkoY6MFUEQOg9z
 BGsiOnlmX77xiGsk8IIiZLpFakNMY2/MOB+hGfY6Gllo9fZ7JUIoNGDF0a95nwcWFEUJvQkrP4U
 PfDLb/tip2y+ArN1HzjGUruo6u4o/lv2A2s+S3vWzP+bTw/D//L9bNNcbVo5YYwDPtpU9QETsGc
 8RcvAQupyKSL8Uu086SH546jr8vf09s2BePY/yxh9eHA==
X-Forward-Email-ID: 6859c22e294ea86d0db707c3
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.0.3
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <90b7a1b6-bc49-414d-9cde-e6fad46d2650@kwiboo.se>
Date: Mon, 23 Jun 2025 23:07:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: rockchip: list all CPU supplies on ArmSoM
 Sige5
From: Jonas Karlman <jonas@kwiboo.se>
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>,
 Alexey Charkov <alchark@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 XiaoDong Huang <derrick.huang@rock-chips.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
 <3286000.Y6S9NjorxK@phil>
 <CABjd4YyaNF1zosFFi6hEsZanPDxoaa1h4Dpd6uTPRwA3BZn0=w@mail.gmail.com>
 <5897576.DvuYhMxLoT@phil>
 <CABjd4Yy8WeXKmmxh2-TjjF5-ABy-NzzJsWpt1KvSjJqTHh0Xwg@mail.gmail.com>
 <CABjd4Yz4NbqzZH4Qsed3ias56gcga9K6CmYA+BLDBxtbG915Ag@mail.gmail.com>
 <36711B65-DD45-4539-BD9C-0382936FD0A3@gmail.com>
 <dd1d0676-4eaa-4df7-b557-676b3de9a52e@kwiboo.se>
Content-Language: en-US
In-Reply-To: <dd1d0676-4eaa-4df7-b557-676b3de9a52e@kwiboo.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2025-06-23 19:40, Jonas Karlman wrote:
> On 2025-06-23 17:02, Piotr Oniszczuk wrote:
>>
>>
>>> Wiadomość napisana przez Alexey Charkov <alchark@gmail.com> w dniu 23 cze 2025, o godz. 15:58:
>>>
>>> On Mon, Jun 23, 2025 at 1:19 PM Alexey Charkov <alchark@gmail.com> wrote:
>>>>
>>>>
>>>
>>> Okay, I've bisected this.
>>>
>>> TLDR: Linux and u-boot seem to have nothing to do with it, opensource
>>> TF-A doesn't work, binary BL31 starting with v1.09 do not work. BL31
>>> v1.08 and earlier work fine.
> 
> v1.09 added support for 1 GHz hrtimer in addition to the normal 24 MHz
> rate. Mainline U-Boot may only support use of 24 MHz hrtimer, unsure
> what impact the hrtimer rate has. Mixing blobs with/without 1 GHz
> support is known to cause issues. At one point the latest rkbin tree may
> have contained incompatible rk3576 blobs (mixed 1 ghz vs 24 mhz rate).

Clarification:
Following boot1 parameter activates use of 1 GHz hrtimer, see [3].

This parameter was added to rkbin repo before all blobs was updated to
fully support use of the 1 ghz mode, and is the source for incompatible
blobs I referenced above.

  [BOOT1_PARAM]
  WORD_2=0x100

[3] https://github.com/rockchip-linux/rkbin/commit/cbbc6868221fb416d4f0d86a10e493dbbbc1f117

Regards,
Jonas

> 
> Did you try with newer blobs, i.e. ddr init v1.09, bl31 v1.19 blobs [1]
> and mainline U-Boot [2] ?
> 
> [1] https://github.com/radxa/rkbin/commits/develop-v2025.04/
> [2] https://source.denx.de/u-boot/contributors/kwiboo/u-boot/-/commits/rk3576
> 
> Regards,
> Jonas
> 
>>
>>
>> just fyi: 
>> to confirm: replacing only bl31 to 1.08 makes all good
>> with perf gov. clocks staying on 2200/2300
>> clock estimations are predictable, constant and estimating constantly 2400
>> ux is „like” on 3588
>>
>> Alexey: many thx for finding root cause component!
>>   
>>    
> 

