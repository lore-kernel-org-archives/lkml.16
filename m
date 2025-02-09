Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EF61EE7D2;
	Sun,  9 Feb 2025 23:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.128.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739144044; cv=none; b=kKSsUIzJbjpb969wfTIt5SDmw3tcZV2mRQREqnGzIrG328nk44g1WGirMxdrfpajX3L6Snmkwc8ADRp1kKtMr7DHI/zSYNUR9nvNPuxiUNwvoTA6sb5o3oxuXS3oVqFFTq1qm/ESpe/kBFF/roEIk+C/43BGPR7InyUxUvBHeRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739144044; c=relaxed/simple;
	bh=+piqG18DawjLNIakce6Qj6c5L7teq/4f6yLP4+/quUs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ihBs/3ITW5LzUlV2JGcmW2+MeNpPJFXgqLLm/usBSDERJz7zPnssQVF/6rhPg9e5uUxVKblHIvgLAmfMuJo1n9RJgzXTJS8EuZNKzcX68ameSSTuXu+dTbetDhQxuueIGn9E9nV/1UON5jV35EmWp8sGtqjAs358qlCTMIvrweM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freeshell.de; spf=pass smtp.mailfrom=freeshell.de; arc=none smtp.client-ip=116.202.128.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Received: from [192.168.2.35] (unknown [98.97.27.21])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 13AD3B4C054A;
	Mon, 10 Feb 2025 00:33:48 +0100 (CET)
Message-ID: <b2d579e8-3535-4d7b-b0c1-8fab5fbd937f@freeshell.de>
Date: Sun, 9 Feb 2025 15:33:47 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] riscv: dts: starfive: jh7110-common: replace
 syscrg clock assignments
To: Hal Feng <hal.feng@linux.starfivetech.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Conor Dooley <conor@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, Hal Feng <hal.feng@starfivetech.com>
References: <20250203013730.269558-1-e@freeshell.de>
 <20250203013730.269558-2-e@freeshell.de>
 <CAJM55Z-M9MsJAtPi-t=_tNV3oG_kdDiS6H=H3koJwTEwB8GJ-Q@mail.gmail.com>
 <981a3f30-c646-423a-a2dd-e19fef5c69e5@freeshell.de>
 <05B9953079BA21AF+fffef577-a880-4ed6-a71b-14ec82aeea97@linux.starfivetech.com>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <05B9953079BA21AF+fffef577-a880-4ed6-a71b-14ec82aeea97@linux.starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/7/25 00:31, Hal Feng wrote:
> On 2/5/2025 8:52 PM, E Shattow wrote:
>>
>>
>> On 2/5/25 02:16, Emil Renner Berthing wrote:
>>> E Shattow wrote:
>>>> Replace syscrg assignments of clocks, clock parents, and rates with
>>>> default settings for compatibility with downstream boot loader SPL
>>>> secondary program loader.
>>>>
>>>> Signed-off-by: E Shattow <e@freeshell.de>
>>>> ---
>>>>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 11 ++++++++---
>>>>  1 file changed, 8 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>>>> index 48fb5091b817..a5661b677687 100644
>>>> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>>>> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>>>> @@ -359,9 +359,14 @@ spi_dev0: spi@0 {
>>>>  };
>>>>
>>>>  &syscrg {
>>>> -	assigned-clocks = <&syscrg JH7110_SYSCLK_CPU_CORE>,
>>>> -			  <&pllclk JH7110_PLLCLK_PLL0_OUT>;
>>>> -	assigned-clock-rates = <500000000>, <1500000000>;
>>>> +	assigned-clocks = <&syscrg JH7110_SYSCLK_CPU_ROOT>,
>>>> +			  <&syscrg JH7110_SYSCLK_BUS_ROOT>,
>>>> +			  <&syscrg JH7110_SYSCLK_PERH_ROOT>,
>>>> +			  <&syscrg JH7110_SYSCLK_QSPI_REF>;
>>>> +	assigned-clock-parents = <&pllclk JH7110_PLLCLK_PLL0_OUT>,
>>>> +				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
>>>> +				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
>>>> +				 <&syscrg JH7110_SYSCLK_QSPI_REF_SRC>;
>>>
>>> I think Conor asked about this too, but you still don't write why it's ok to
>>> drop the 500MHz and 1,5GHz assignments to the cpu-core and pll0 clocks
>>> respectively. You should add this to the commit message itself.
>>>
>>> /Emil
>>
>> Is this a remedy for a bug in the JH7110 CPU? I'm not clear why tweaking
>> the frequencies and increasing core voltage was ever needed.
>>
>> This goes back to series "clk: starfive: jh7110-sys: Fix lower rate of
>> CPUfreq by setting PLL0 rate to 1.5GHz" [1].
>>
>> Since [1] I have had problems with several passively cooled Milk-V Mars
>> CM Lite systems powering off due to thermal limits. My experience then
>> is that the specialized 1.5GHz operation is not appropriate for all
>> JH7110 CPU board layouts and applications.
>>
>> Hal says I failed to get these assignments in Linux to work in U-Boot
>> because U-Boot doesn't have driver support to increase CPU voltage, and
>> Hal offering to add this to a driver in U-Boot... but that's the wrong
>> way around in my opinion, unless there's some defect in the JH7110 CPU
>> that it won't run reliably with hardware defaults.
>>
>> 1:
>> https://lore.kernel.org/all/20240603020607.25122-1-xingyu.wu@starfivetech.com/
>>
>> What is the correct thing to do here?
>>
>> -E
>>
>> From mboxrd@z Thu Jan  1 00:00:00 1970
>> Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
>> X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
>> 	aws-us-west-2-korg-lkml-1.web.codeaurora.org
>> Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
>> 	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
>> 	(No client certificate requested)
>> 	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A24C02192
>> 	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 13:10:59 +0000 (UTC)
>> DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
>> 	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
>> 	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
>> 	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
>> 	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
>> 	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
>> 	List-Owner; bh=GY86gaXkDRjEBAUNvogHkHuyO230wjLSabDM8v7zKQQ=; b=Un7uhhDTAT8/9N
>> 	FxyCZTIeuEf9Tz2EWguoSASPTIRzVsA8OD+zansoq7n0Em+ejnESLoVicWRdNflaSCojelA6mxlZr
>> 	79fy10oRgiIKMOAb1fwJcsq+rGF8jSdXwi0a2zKjGYb4u4ZNy/uLBiIynsSH/VCYysTKQK6p7wAiC
>> 	7RYsK3WfvbZKMTBmH2vKxA7ERtfZGfNAJqRjHzBM06+ZfEDf9V2UQ3pGUdGPoTZYkQoS8smFEx47Z
>> 	U3KclAiQD6NRzOmPD/VXwUGXQEpLonSaLk7kbAdo3cWww6Wyou3w4XqxHQpym6FyLsKAWWSk7d4vx
>> 	ZbYQckPNKc65NmLst1TA==;
>> Received: from localhost ([::1] helo=bombadil.infradead.org)
>> 	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
>> 	id 1tffB9-00000003Lk1-2ly8;
>> 	Wed, 05 Feb 2025 13:10:55 +0000
>> Received: from freeshell.de ([2a01:4f8:231:482b::2])
>> 	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
>> 	id 1tfetw-00000003I2R-42Et
>> 	for linux-riscv@lists.infradead.org;
>> 	Wed, 05 Feb 2025 12:53:10 +0000
>> Received: from [192.168.2.35] (unknown [98.97.25.24])
>> 	(Authenticated sender: e)
>> 	by freeshell.de (Postfix) with ESMTPSA id 7ADA8B4C01E1;
>> 	Wed,  5 Feb 2025 13:53:01 +0100 (CET)
>> Message-ID: <981a3f30-c646-423a-a2dd-e19fef5c69e5@freeshell.de>
>> Date: Wed, 5 Feb 2025 04:52:59 -0800
>> MIME-Version: 1.0
>> User-Agent: Mozilla Thunderbird
>> Subject: Re: [PATCH v2 1/5] riscv: dts: starfive: jh7110-common: replace
>>  syscrg clock assignments
>> To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
>>  Conor Dooley <conor@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
>>  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
>>  Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
>>  <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
>> Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
>>  linux-riscv@lists.infradead.org
>> References: <20250203013730.269558-1-e@freeshell.de>
>>  <20250203013730.269558-2-e@freeshell.de>
>>  <CAJM55Z-M9MsJAtPi-t=_tNV3oG_kdDiS6H=H3koJwTEwB8GJ-Q@mail.gmail.com>
>> Content-Language: en-US
>> From: E Shattow <e@freeshell.de>
>> In-Reply-To: <CAJM55Z-M9MsJAtPi-t=_tNV3oG_kdDiS6H=H3koJwTEwB8GJ-Q@mail.gmail.com>
>> X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
>> X-CRM114-CacheID: sfid-20250205_045309_156119_468548BF 
>> X-CRM114-Status: GOOD (  16.14  )
>> X-BeenThere: linux-riscv@lists.infradead.org
>> X-Mailman-Version: 2.1.34
>> Precedence: list
>> List-Id: <linux-riscv.lists.infradead.org>
>> List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
>>  <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
>> List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
>> List-Post: <mailto:linux-riscv@lists.infradead.org>
>> List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
>> List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
>>  <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
>> Content-Type: text/plain; charset="us-ascii"
>> Content-Transfer-Encoding: 7bit
>> Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
>> Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
>>
>>
>>
>> On 2/5/25 02:16, Emil Renner Berthing wrote:
>>> E Shattow wrote:
>>>> Replace syscrg assignments of clocks, clock parents, and rates with
>>>> default settings for compatibility with downstream boot loader SPL
>>>> secondary program loader.
>>>>
>>>> Signed-off-by: E Shattow <e@freeshell.de>
>>>> ---
>>>>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 11 ++++++++---
>>>>  1 file changed, 8 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>>>> index 48fb5091b817..a5661b677687 100644
>>>> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>>>> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>>>> @@ -359,9 +359,14 @@ spi_dev0: spi@0 {
>>>>  };
>>>>
>>>>  &syscrg {
>>>> -	assigned-clocks = <&syscrg JH7110_SYSCLK_CPU_CORE>,
>>>> -			  <&pllclk JH7110_PLLCLK_PLL0_OUT>;
>>>> -	assigned-clock-rates = <500000000>, <1500000000>;
>>>> +	assigned-clocks = <&syscrg JH7110_SYSCLK_CPU_ROOT>,
>>>> +			  <&syscrg JH7110_SYSCLK_BUS_ROOT>,
>>>> +			  <&syscrg JH7110_SYSCLK_PERH_ROOT>,
>>>> +			  <&syscrg JH7110_SYSCLK_QSPI_REF>;
>>>> +	assigned-clock-parents = <&pllclk JH7110_PLLCLK_PLL0_OUT>,
>>>> +				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
>>>> +				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
>>>> +				 <&syscrg JH7110_SYSCLK_QSPI_REF_SRC>;
>>>
>>> I think Conor asked about this too, but you still don't write why it's ok to
>>> drop the 500MHz and 1,5GHz assignments to the cpu-core and pll0 clocks
>>> respectively. You should add this to the commit message itself.
>>>
>>> /Emil
>>
>> Is this a remedy for a bug in the JH7110 CPU? I'm not clear why tweaking
>> the frequencies and increasing core voltage was ever needed.
>>
>> This goes back to series "clk: starfive: jh7110-sys: Fix lower rate of
>> CPUfreq by setting PLL0 rate to 1.5GHz" [1].
>>
>> Since [1] I have had problems with several passively cooled Milk-V Mars
>> CM Lite systems powering off due to thermal limits. My experience then
>> is that the specialized 1.5GHz operation is not appropriate for all
>> JH7110 CPU board layouts and applications.
>>
>> Hal says I failed to get these assignments in Linux to work in U-Boot
>> because U-Boot doesn't have driver support to increase CPU voltage, and
>> Hal offering to add this to a driver in U-Boot... but that's the wrong
>> way around in my opinion, unless there's some defect in the JH7110 CPU
>> that it won't run reliably with hardware defaults.
>>
>> 1:
>> https://lore.kernel.org/all/20240603020607.25122-1-xingyu.wu@starfivetech.com/
>>
>> What is the correct thing to do here?
> 
> Please see my reply in
> https://lore.kernel.org/all/ZQ2PR01MB130736F5C893337606FD6937E6F1A@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn/
> 
> Thanks.
> 
> Best regards,
> Hal
> 

What is the explanation to remove the (hardware default) CPU power
supply 0.9V operation, and remove hardware default CPU speed?

I would think you will want jh7110.dtsi similar as follows:

        cpu_opp: opp-table-0 {
                        compatible = "operating-points-v2";
                        opp-shared;
                        opp-250000000 {
                                        opp-hz = /bits/ 64 <250000000>;
                                        opp-microvolt = <800000>;
                        };
                        opp-333000000 {
                                        opp-hz = /bits/ 64 <333000000>;
                                        opp-microvolt = <800000>;
                        };
                        opp-375000000 {
                                        opp-hz = /bits/ 64 <375000000>;
                                        opp-microvolt = <800000>;
                        };
                        opp-500000000 {
                                        opp-hz = /bits/ 64 <500000000>;
                                        opp-microvolt = <800000>;
                        };
                        opp-750000000 {
                                        opp-hz = /bits/ 64 <750000000>;
                                        opp-microvolt = <800000>;
                        };
                        opp-1000000000 {
                                        opp-hz = /bits/ 64 <1000000000>;
                                        opp-microvolt = <900000>;
                        };
                        opp-1500000000 {
                                        opp-hz = /bits/ 64 <1500000000>;
                                        opp-microvolt = <1040000>;
                        };
        };

I guess at the voltages here, you will have to provide a correction
about what is realistic.

Board makers are designing their board layout with opp-1000000000
default voltage with default clock frequency and not opp-1500000000 on
an increased voltage and maximum clock speed yes?

We should not exceed the hardware default CPU voltage (and clock
frequency) for all boards without some very good reason, and I do not
accept "because more voltage and higher frequency is faster" to be a
reason to do this.

Hal, you have not explained why it is *necessary* to have this
non-default voltage and clock frequency table for all boards. I know
that using a JH7110 board that allows 1.5GHz operation results in
thermal over-temperature and shutdown, where it then does no work at all
and is not useful to me. I do accept that you want 1.5GHz operation, for
a specific board that is no problem with me because I do not have that
board to test if it is any problem; I have to trust that you have done
this testing, then.

Summary of my thoughts are:

1. Yes to support for lower and higher core voltage and clock frequency

2. No to imposing non-default hardware profiles on all boards, unless
there is some actual reason why it is strictly necessary (thermal
performance testing, operational stability, power savings, ...)

Question follow-up:

1. Can we restore 1GHz operation ?  I ask if there is a property or
strategy here to force 1GHz maximum operation unless the user decides
for exceeding the hardware default 0.9V ?

-E
