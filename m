Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D837262F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 17:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750700430; cv=none; b=V5B5dD8DKe38hoYacg907UAx5gYiBUvq22YS9QRGP3OdnjNyZFXMIaFDQQ8hbeh5D1KCWdiK4D3kIFV4pOpPdvjXiWX4kKq8+GkdH8iZ/kSdeTlenMeoFmVuAGCSwx37alfgT2wxcpLMfBUfqk/lsNXyGpSqbJCaiYZ6P6KYtQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750700430; c=relaxed/simple;
	bh=IsUNm5zN3nf3/mIsm1o8QkuSZRhfwKwP6g4hYu1alZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FIdmkZLCf92GYRzeF6vzgxjXp0c6bBODd3oVT9VbQ81WiwdpVDQzlfCUqgdWbiyTMzrea8TmXArscxz0gJHbcgFqJbvW030kEkicoStHG4WLCHU/9rYGgyDaLAPXrWKetjbP3EVqqGlzUSZSs+hGtiPoxHoeR86raWb6B2rvIV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=zE9YvuVQ; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="zE9YvuVQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1750700422;
 bh=vlOL8X69KAf43rpa448wfskj/jjDGmOWw431Aoz2DQk=;
 b=zE9YvuVQMYfUB8/mMU1ftphfVL7PQ4O23Kzl4X/4byayXY+3ADO/XnYQYyGSu+inNEEWAXSQh
 R6Opmt4DLXu9ur+B02FqmrqEqqQCYEymNTwPwGCw5w1PKqeRqoNLgbvEgChlljS5p+ADz2Qyjvw
 PGAkTpLYw43PExVBic+Yg5AHoSDnY+hQbgN04bFWhWnrmk80CxHRpgbfbclQU6WUNMMUqLoU0IJ
 EYNIOWQO1Iu9TdxIgi8wYLJa4L9d/Tf8tpQO2po/LqKGwTZSYWTFvib4TC91wOhXEog/9Rd7duM
 XIno9JzUkW5zPGLWSBWCfo+URprblqnS2QFzD1+BeACQ==
X-Forward-Email-ID: 6859917f54073d00e4b5a183
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.0.3
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <dd1d0676-4eaa-4df7-b557-676b3de9a52e@kwiboo.se>
Date: Mon, 23 Jun 2025 19:40:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: rockchip: list all CPU supplies on ArmSoM
 Sige5
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
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <36711B65-DD45-4539-BD9C-0382936FD0A3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2025-06-23 17:02, Piotr Oniszczuk wrote:
> 
> 
>> Wiadomość napisana przez Alexey Charkov <alchark@gmail.com> w dniu 23 cze 2025, o godz. 15:58:
>>
>> On Mon, Jun 23, 2025 at 1:19 PM Alexey Charkov <alchark@gmail.com> wrote:
>>>
>>>
>>
>> Okay, I've bisected this.
>>
>> TLDR: Linux and u-boot seem to have nothing to do with it, opensource
>> TF-A doesn't work, binary BL31 starting with v1.09 do not work. BL31
>> v1.08 and earlier work fine.

v1.09 added support for 1 GHz hrtimer in addition to the normal 24 MHz
rate. Mainline U-Boot may only support use of 24 MHz hrtimer, unsure
what impact the hrtimer rate has. Mixing blobs with/without 1 GHz
support is known to cause issues. At one point the latest rkbin tree may
have contained incompatible rk3576 blobs (mixed 1 ghz vs 24 mhz rate).

Did you try with newer blobs, i.e. ddr init v1.09, bl31 v1.19 blobs [1]
and mainline U-Boot [2] ?

[1] https://github.com/radxa/rkbin/commits/develop-v2025.04/
[2] https://source.denx.de/u-boot/contributors/kwiboo/u-boot/-/commits/rk3576

Regards,
Jonas

> 
> 
> just fyi: 
> to confirm: replacing only bl31 to 1.08 makes all good
> with perf gov. clocks staying on 2200/2300
> clock estimations are predictable, constant and estimating constantly 2400
> ux is „like” on 3588
> 
> Alexey: many thx for finding root cause component!
>   
>    

