Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4D920E002;
	Tue,  4 Feb 2025 13:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738676146; cv=none; b=FGRxDXQ0d4enmzEEFVOKvq3oiq8cpNf3Sad7VtVOfIDEuKJ/LagjkFLjOUC8gWKjhkII966VilWB7xSevV/EfaViE7kH0LIP1fZHTF7HhPEWzQD8lBqF/U1fb5Xk0HWdgo6u6W7kdouGgE1vbEEAd2b2kXFKq2lzsfW1s974hNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738676146; c=relaxed/simple;
	bh=BJpjppNG+zKL4oLwHasFmdAqFzT9WGyvFfz7lGv02TA=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=kH9CULXOkk/waKDZAn8mHbhpPir+ZkVLbRsE0xrwvplo6TN1F7UI1E1qaXj6GHxXQhz2NJhRL3CXTb/JsI4OE1gdb3cu2OK84bFDxggdaQh/1ERm49V0vOL0dVPb2f7hmLXi1tqNMFWql4mBrU74QEBZy6MtJGdM3n7pXX7YZYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=w/OCtv96; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="w/OCtv96"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1738676141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kvBsIYlSRDocRThQe1QajLzrfnVwDIRPt2pu5vzVeio=;
	b=w/OCtv96wqXzkV27OwKQajxsEG25scNCh4fWGsSiqz5jhj+QGewziS/h86EkJjztDYv4R2
	RfGhv+VKM4YPjARKu9HpgRIg3AgwHbcyvMCGPFkbAJRA22P0aIhuA6J3Tx0wRVfs9eJdMr
	BgSyTyZuas03ZEfKbtnwf2CSXjKz0OnkgRDk/zzadjNJDkGRkHbutPgQ+v8nvpil68ZrJK
	8wa3f/t3HnF89CJ/8zvAuagK6MEk7HX9bvnLwnhqpbGXDezQznEXDKYd1/TkUzIg35gLFE
	Eo63EE2hr1hIFOwy8PgeOEfGVVTgLSwbovyFajM9eSlK39WwAahWcaDtzjz7qQ==
Date: Tue, 04 Feb 2025 14:35:40 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Quentin Schulz <foss+kernel@0leil.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Jagan Teki
 <jagan@edgeble.ai>, Niklas Cassel <cassel@kernel.org>, Michael Riesch
 <michael.riesch@wolfvision.net>, Jonas Karlman <jonas@kwiboo.se>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 3/4] arm64: dts: rockchip: add overlay tests for Rock
 5B PCIe overlays
In-Reply-To: <3de1cc52-5579-41b1-a333-0c4e81f96fbd@cherry.de>
References: <20250131-pre-ict-jaguar-v4-0-c971e2852e8d@cherry.de>
 <20250131-pre-ict-jaguar-v4-3-c971e2852e8d@cherry.de>
 <77b5d0efa6e56bb391575aeeb4d1be80@manjaro.org>
 <3de1cc52-5579-41b1-a333-0c4e81f96fbd@cherry.de>
Message-ID: <cb8f370474df88d1194d9ee92d3ca4e0@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

Hello Quentin,

On 2025-02-04 13:20, Quentin Schulz wrote:
> On 2/4/25 12:22 PM, Dragan Simic wrote:
>> > On 2025-01-31 11:40, Quentin Schulz wrote:
>>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>> 
>>> According to commit 40658534756f ("arm64: dts: rockchip: Add rock5b
>>> overlays for PCIe endpoint mode"), Rock 5B can operate in PCIe 
>>> endpoint
>>> mode. For that to work, the rk3588-rock-5b-pcie-ep.dtbo overlay needs 
>>> to
>>> be applied on Rock 5B base Device Tree. If that Rock 5B is connected 
>>> to
>>> another Rock 5B, the latter needs to apply the
>>> rk3588-rock-5b-pcie-srns.dtbo overlay.
>>> 
>>> In order to make sure the overlays are still valid in the future, 
>>> let's
>>> add a validation test by applying the overlays on top of the main 
>>> base
>>> at build time.
>>> 
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Reviewed-by: Niklas Cassel <cassel@kernel.org>
>>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>>> ---
>>>  arch/arm64/boot/dts/rockchip/Makefile | 10 ++++++++--
>>>  1 file changed, 8 insertions(+), 2 deletions(-)
>>> 
>>> diff --git a/arch/arm64/boot/dts/rockchip/Makefile
>>> b/arch/arm64/boot/dts/rockchip/Makefile
>>> index
>>> 267966ea69b194887d59e38a4220239a90a91306..ebcd16ce976ebe56a98d9685228980cd1f2f180a
>>> 100644
>>> --- a/arch/arm64/boot/dts/rockchip/Makefile
>>> +++ b/arch/arm64/boot/dts/rockchip/Makefile
>>> @@ -150,8 +150,6 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-orangepi-5- 
>>> plus.dtb
>>>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-quartzpro64.dtb
>>>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5-itx.dtb
>>>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b.dtb
>>> -dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-ep.dtbo
>>> -dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-srns.dtbo
>>>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-tiger-haikou.dtb
>>>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-toybrick-x0.dtb
>>>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-turing-rk1.dtb
>>> @@ -186,3 +184,11 @@ rk3568-wolfvision-pf5-vz-2-uhd-dtbs :=
>>> rk3568-wolfvision-pf5.dtb \
>>>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-wifi.dtb
>>>  rk3588-edgeble-neu6a-wifi-dtbs := rk3588-edgeble-neu6a-io.dtb \
>>>      rk3588-edgeble-neu6a-wifi.dtbo
>>> +
>>> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-ep.dtb
>>> +rk3588-rock-5b-pcie-ep-dtbs := rk3588-rock-5b.dtb \
>>> +    rk3588-rock-5b-pcie-ep.dtbo
>>> +
>>> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-srns.dtb
>>> +rk3588-rock-5b-pcie-srns-dtbs := rk3588-rock-5b.dtb \
>>> +    rk3588-rock-5b-pcie-srns.dtbo
>> 
>> After a quite lengthy excursion into the scripts/Makefile.dtbs and
>> scripts/Makefile.lib files, I'm afraid that the approach taken in
>> this patch isn't right.  Please allow me to explain.
>> 
>> Let's have a look at arch/arm64/boot/dts/ti/Makefile first, as an
>> example that provides already existing DT overlay checks.  Here's
>> an excerpt from that Makefile, which also provides an important cue
>> by mentioning CONFIG_OF_ALL_DTBS:
>> 
>>    12 dtb-$(CONFIG_ARCH_K3) += k3-am625-beagleplay.dtb
>>    13 dtb-$(CONFIG_ARCH_K3) += k3-am625-beagleplay-csi2-ov5640.dtbo
>>    14 dtb-$(CONFIG_ARCH_K3) += 
>> k3-am625-beagleplay-csi2-tevi-ov5640.dtbo
>> 
>>   135 # Build time test only, enabled by CONFIG_OF_ALL_DTBS
>>   136 k3-am625-beagleplay-csi2-ov5640-dtbs := k3-am625-beagleplay.dtb 
>> \
>>   137         k3-am625-beagleplay-csi2-ov5640.dtbo
>>   138 k3-am625-beagleplay-csi2-tevi-ov5640-dtbs := k3-am625- 
>> beagleplay.dtb \
>>   139         k3-am625-beagleplay-csi2-tevi-ov5640.dtbo
>> 
>>   213 dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
>>   214         k3-am625-beagleplay-csi2-tevi-ov5640.dtb \
>> 
>> As visible above, the DT overlays get added to dtb-$(CONFIG_ARCH_K3)
>> as .dtbo files (not as .dtb files), while the build-time DT overlay
>> tests specify the dependency chains for the overlays.
>> 
>> Even more importantly, the build-time overlay tests aren't supposed
>> to be executed until CONFIG_OF_ALL_DTBS is selected, which actually
>> gets handled at the very start of scripts/Makefile.dtbs:
>> 
>>     3 # If CONFIG_OF_ALL_DTBS is enabled, all DT blobs are built
>>     4 dtb-$(CONFIG_OF_ALL_DTBS) += $(dtb-)
> 
> Do you have something to back your argument that build time tests
> should only be done when CONFIG_OF_ALL_DTBS is enabled? For now this
> seems like it's your interpretation of the use for the symbol. Though
> I agree that if you had any test you absolutely didn't want to run in
> normal times, hiding them behind CONFIG_OF_ALL_DTBS would be the thing
> to do.

Well, it isn't my interpretation of CONFIG_OF_ALL_DTBS, it's actually
how arch/arm64/boot/dts/ti/Makefile uses it already for the DT overlay
tests, which I already explained above.

Also, I already wrote that I'm not very happy with the way the config
option CONFIG_OF_ALL_DTBS is tied to the DT overlay tests.  I'll get
back to that below.

>> The way this patch modifies arch/arm64/boot/dts/rockchip/Makefile
>> actually isn't correct, despite apparently producing the desired
>> outcome, because the way it adds rk3588-rock-5b-pcie-ep.dtb and
>> rk3588-rock-5b-pcie-srns.dtb (instead of adding proper .dtbo names)
>> to dtb-$(CONFIG_ARCH_ROCKCHIP) effectively creates some kind of
>> "phony targets" that indeed "get the job done", but unfortunately
>> in a wrong way.  The "phony targets" are handled by the following
>> "magic" in scripts/Makefile.dtbs:
>> 
>>     6 # Composite DTB (i.e. DTB constructed by overlay)
>>     7 multi-dtb-y := $(call multi-search, $(dtb-y), .dtb, -dtbs)
>>     8 # Primitive DTB compiled from *.dts
>>     9 real-dtb-y := $(call real-search, $(dtb-y), .dtb, -dtbs)
>>    10 # Base DTB that overlay is applied onto
>>    11 base-dtb-y := $(filter %.dtb, $(call real-search, $(multi-dtb- 
>> y), .dtb, -dtbs))
>> 
>>    18 targets         += $(real-dtb-y)
>> 
>> Let's have a look at the relevant part of the output produced when
>> "make dtbs" is executed with this patch applied:
>> 
>>    DTC     arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtbo
>>    OVL     arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb
>>    DTC     arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtbo
>>    OVL     arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb
>> 
>> Note the "OVL .*dtb" lines above, in which the ".*dtb" parts are
>> the above-mentioned "phony targets".  The above-quoted "magic" in
>> scripts/Makefile.dtbs is what "unfolds" those "phony targets" to make 
>> them apparently produce the desired outcome, by populating
>> the $(real-dtb-y) variable with "rk3588-rock-5b-pcie-ep.dtbo
>> rk3588-rock-5b.dtb rk3588-rock-5b-pcie-srns.dtbo", as the proper
>> .dtbo names that get passed to the dtc utility.
>> 
>> Even more "magic" in scripts/Makefile.dtbs "unfolds" the "phony
>> targets" to have the build-time DT overlay tests performed in the
>> apparently proper way, while they actually shouldn't be performed
>> unless CONFIG_OF_ALL_DTBS is also selected.
> 
> I understand the symbol CONFIG_OF_ALL_DTBS as "should build all DTBs
> for all architectures and do tests" and not "tests must only be run
> when CONFIG_OF_ALL_DTBS is selected". I find it so useful to test the
> application of overlays to the base DTB that I don't think it's
> necessarily a good idea to hide those behind CONFIG_OF_ALL_DTBS.

As I wrote above, I'm not very happy with it either.  I'll explain
that further below.

>> With all this is mind, this patch should be reworked to follow
>> the right approach for defining build-time DT overlay tests, which
>> is illustrated in arch/arm64/boot/dts/ti/Makefile.  In particular,
>> we should just add the following DT overlay test definitions to
>> arch/arm64/boot/dts/rockchip/Makefile:
>> 
>> 174 # Build-time tests only, enabled by CONFIG_OF_ALL_DTBS
>> 175 rk3588-rock-5b-pcie-ep-dtbs := rk3588-rock-5b.dtb \
>> 176         rk3588-rock-5b-pcie-ep.dtbo
>> 177 rk3588-rock-5b-pcie-srns-dtbs := rk3588-rock-5b.dtb \
>> 178         rk3588-rock-5b-pcie-srns.dtbo
>> 179 dtb- += rk3588-rock-5b-pcie-ep.dtb \
>> 180         rk3588-rock-5b-pcie-srns.dtb
>> 
>> You'll notice that the $(dtb-) variable pretty much again contains
>> the same "phony targets", but that's the way they should actually
>> be used.  I'm not very happy with the way they're specified, but
>> we should follow the approach from arch/arm64/boot/dts/ti/Makefile
>> anyway, and possibly improve the whole thing later.
> 
> What I don't like about this is that it allows to build the DTBO
> without providing a build time application test which means
> maintainer(s) and reviewer(s) need to pay even more attention to the
> patch than simply looking at it matching the patterns of how other
> DTBOs are built. Also, you now need to enable CONFIG_OF_ALL_DTBS to
> run the tests, which isn't enabled in the default defconfig for arm64.
> I would assume we have some bots building patches/master with those
> options enabled but it might be a bit too late already.

I already agreed above about CONFIG_OF_ALL_DTBS being suboptimal,
but I don't think that the need for making sure the tests are present
would be an issue.  Making sure that the tests are defined should be
simply part of the reviewing, and running those tests is actually
a good way to make revieving a bit easier.  Thus, reviewers should
actually be motivated to make sure the tests are present.

>> I'd actually prefer to just have these test definitions added to the
>> end of arch/arm64/boot/dts/ti/Makefile, without moving the .dtbo lines
>> around.  That would keep the tests separate, which should be more
>> readable when we get more of them defined.
> 
> And more likely to forget about adding either the tests or the DTBO
> explicit rule.

Well, if someone can't remember either of those, then I don't see how
they can remember many other rules required to write DT code. :)

FWIW, both TI and Qualcomm place the test definitions separately from
the additions to dtb-$(CONFIG_ARCH_XYZ).

>> With the above-proposed changes in place, and with CONFIG_OF_ALL_DTBS
>> selected, the relevant part of the "make dtbs" output looks like this:
>> 
>>    DTC     arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb
>>    DTC     arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtbo
>>    DTC     arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtbo
>>    OVL     arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb
>>    OVL     arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb
>> 
>> No more "phony targets" in the produced output. :)
> 
> Funnily enough, I would prefer to see OVL for overlays rather than
> DTC, but I guess it's just one more occurrence of developers
> disagreeing on how to name things :)

I actually agree with that, just like I prefer to see .dtbo files
as additions to dtb-$(CONFIG_ARCH_XYZ).  It's all about the overlays,
so they should be both specified and echoed back.

Moreover, we currently also have additional .dtb files with applied
overlays left after the build and installed afterwards, which doesn't
make much sense to me.  To me, those additional .dtb files should be
deleted as build artefacts and not installed.

> I kind of disagree with the feedback here as this only takes
> ti/Makefile as example while **all** other aarch64 Makefile have
> different logic, the one I'm using here for amlogic (meson), NXP
> (freescale), qcom (Qualcomm), Renesas, Xilinx and even Aarch32 NXP,
> and the one we currently use (no build tests) for Mediatek.

Hmm, I see.  To me, the approach taken by TI is more clear, simply
because having .dtb filenames, instead of .dtbo filenames, as part of
dtb-$(CONFIG_ARCH_XYZ) is much less readable.  When you see a .dtbo
there, it's clear that it's an overlay, and as I wrote above, it's
all about the overlays, so they should be both specified in Makefiles
and echoed back by the build system.

> If we agree to what you suggest here we cancel the side-effect of
> having the symbols in the base DTB that this patch series introduces.
> This can go both ways, either good (DT symbols in = nothing to do for
> the user, get the base DTB and your DTBO, put in /boot and tada) or
> bad (DT symbols in = big size increase for base DTB). Moreover,
> enabling CONFIG_OF_ALL_DTBS would now generate a different DTB than
> when it's not (keeping the symbols in). If we wanted to keep the
> symbols in, we would need to modify DTC_FLAGS as well.
> This could help make the decision(s) as well.
> 
> So I would say without much more context on the actual expected use
> for CONFIG_OF_ALL_DTBS that it's up to one's taste, and considering
> the precedent here, likely up to each architecture maintainers' taste.

Good point.  This just shows how suboptimal is tying CONFIG_OF_ALL_DTBS
with the DT overlay tests.  Perhaps it would be best to remove that
association, while keeping the ability to specify .dtbo filenames in
dtb-$(CONFIG_ARCH_XYZ).  Specifying .dtb files there simply looks wrong
to me, as I already explained above.

> I won't be too difficult to convince here, just want some "authority"
> or a piece of history about CONFIG_OF_ALL_DTBS that would go your
> direction, before doing the change. I believe automated build tests
> without needing to enable a symbol, and that taking DTB and DTBO from
> the build output and apply DTBO on top of DTB works without having to
> go through some length to get the symbols, are good reasons to keep it
> the way it is in this patch series.

I'd like the most to perform the above-proposed "divorcing" of the DT
overlay tests from CONFIG_OF_ALL_DTBS, so we don't have to enable any
additional options to have the overlay tests run automatically, but
to keep .dtbo filenames in dtb-$(CONFIG_ARCH_XYZ).  I think that would
bring the best of both worlds, so to speak.

> Additionally, depending on the feedback, I assume we want to migrate
> all current architectures building DTBO to be consistent and use the
> same logic (perhaps not for Mediatek because doing so would keep the
> DT symbols in the DTB, which drastically increases the size of the
> DT).
> 
> Does anyone from DT maintainership have feedback to provide on what is
> expected here generally wrt building and testing DTBOs?
> 
> Does Heiko have an opinion on what he would prefer to see happening
> for Rockchip?
