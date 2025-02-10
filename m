Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F7012CD8B;
	Mon, 10 Feb 2025 08:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739175474; cv=none; b=a1lmprtnyXmGVXJ33EipE0/xjaMQyX7L+EZWo60zu/0LBhS4Wera6CLSxhI7b/myzcKtPIpA2BHNcHTOUB+NuyTBTFbtafqpTPJ2rfs6MufxXzCIJPVyn8YXFgvQBujkeVBZHvLaqB578p2C/5gLQC43YaOeZS7TuUkKq+OexK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739175474; c=relaxed/simple;
	bh=uqEuTJZmjX0Ja98hOQj/42kl8sGSMErfMulPFhSUoTk=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=aeQtstVMRrBPYj+EnP2GMdprfW233n5o2UPHh/zIaA1g6aSI33pWvRo0EZwdUDYeI5kVVjYJTCiyq8gWX1DYDxfdD3aiCABJAREnc6bpf0b40KsdA3weyfjJ0kJb/4Eoh6QQU/Grcffb40N4PeY0YiBFNQyuhojw8N4FUjFpvUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=ZfEhN2IR; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="ZfEhN2IR"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1739175469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xfCRHzFveZzAGV8Z+uWeA7HD1dufJpo8G/47iGVAsSU=;
	b=ZfEhN2IR8SlgFMvj5IFyT3DSmRK5f1l+1Sj2KDuvqxkjLmRBRILn5pvnC58aUw83sk5hn4
	3+5xQVFhqt59IE8hfV/sGmxsJU8v3iWWNUtUB3QsorNKEHu7wnvavVbAD1R5/w15VAneTZ
	kogexvBfzqe1PfQwRIeR7mdD84Z+KSLVlNfpDUR2wNB3dOpM6o2QrIUM96+Uo5EZj0jMA5
	AVS2xm9KJOUB8o6AHFOLFwgEZQm7p+W+rdYaTWxr4LorSm7tDHAtmHDvILLaL6qJp1EMYd
	rNWZeIGsp0gq3TCmxSqUW3lGZJA119Ko2bpO3o2di17WOxaFryayR4iLi9krFA==
Date: Mon, 10 Feb 2025 09:17:48 +0100
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
In-Reply-To: <110a35c5-9450-47fb-9d5f-0ba73e290bf5@cherry.de>
References: <20250131-pre-ict-jaguar-v4-0-c971e2852e8d@cherry.de>
 <20250131-pre-ict-jaguar-v4-3-c971e2852e8d@cherry.de>
 <77b5d0efa6e56bb391575aeeb4d1be80@manjaro.org>
 <3de1cc52-5579-41b1-a333-0c4e81f96fbd@cherry.de>
 <cb8f370474df88d1194d9ee92d3ca4e0@manjaro.org>
 <110a35c5-9450-47fb-9d5f-0ba73e290bf5@cherry.de>
Message-ID: <a3b98e3d3a2571ee75e59418bb3b6960@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

Hello Quentin,

On 2025-02-06 12:07, Quentin Schulz wrote:
> On 2/4/25 2:35 PM, Dragan Simic wrote:
>> On 2025-02-04 13:20, Quentin Schulz wrote:
>>> On 2/4/25 12:22 PM, Dragan Simic wrote:
>>>> > On 2025-01-31 11:40, Quentin Schulz wrote:
> 
> Not discussing CONFIG_OF_ALL_DTBS relevancy wrt hiding overlay tests
> behind, unrelated to this series I believe :)
> 
> [...]

Oh, indeed.  I'll get back to it below.

>>>> With the above-proposed changes in place, and with 
>>>> CONFIG_OF_ALL_DTBS
>>>> selected, the relevant part of the "make dtbs" output looks like 
>>>> this:
>>>> 
>>>>    DTC     arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb
>>>>    DTC     arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtbo
>>>>    DTC     
>>>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtbo
>>>>    OVL     arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb
>>>>    OVL     arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb
>>>> 
>>>> No more "phony targets" in the produced output. :)
>>> 
>>> Funnily enough, I would prefer to see OVL for overlays rather than
>>> DTC, but I guess it's just one more occurrence of developers
>>> disagreeing on how to name things :)
>> 
>> I actually agree with that, just like I prefer to see .dtbo files
>> as additions to dtb-$(CONFIG_ARCH_XYZ).  It's all about the overlays,
>> so they should be both specified and echoed back.
>> 
>> Moreover, we currently also have additional .dtb files with applied
>> overlays left after the build and installed afterwards, which doesn't
>> make much sense to me.  To me, those additional .dtb files should be
>> deleted as build artefacts and not installed.
> 
> I **think** it could be useful for systems without overlay support.
> Then you have a dtb which is the result of an overlay applied on top
> of the base dtb and you can replace your previous dtb with that one,
> and voilà.
> 
> What I don't like is that it's difficult to differentiate them from
> the "normal" base DTB or even from the DTBO (simple base DTB + overlay
> test is usually named after the overlay, and in the case of the Rock
> 5B test: rk3588-rock-5b-pcie-srns.dtbo and
> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb), easy to
> pick the wrong one. Though that is on **me** as I could pick another
> name for the overlay test and e.g. prepend "test-ovl_" to the filename
> for example.

On second thought, I'd agree that having the additional "extended"
.dtb files, i.e. the versions with the DT overlays already applied,
could be quite useful.  It's just that having them built and installed
as well possibly makes everything a bit more convoluted, maybe even
a bit confusing, but that's pretty much inevitable.  However, the
benefits should outweigh those slight downsides.

Regarding the naming, I don't think that prepending a self-descriptive
prefix would actually work as expected, because of the way "magic"
in scripts/Makefile.dtbs works.  Actually, I just tested that, and
it didn't seem to work as expected.

> [...]
> 
>>> I won't be too difficult to convince here, just want some "authority"
>>> or a piece of history about CONFIG_OF_ALL_DTBS that would go your
>>> direction, before doing the change. I believe automated build tests
>>> without needing to enable a symbol, and that taking DTB and DTBO from
>>> the build output and apply DTBO on top of DTB works without having to
>>> go through some length to get the symbols, are good reasons to keep 
>>> it
>>> the way it is in this patch series.
>> 
>> I'd like the most to perform the above-proposed "divorcing" of the DT
>> overlay tests from CONFIG_OF_ALL_DTBS, so we don't have to enable any
>> additional options to have the overlay tests run automatically, but
>> to keep .dtbo filenames in dtb-$(CONFIG_ARCH_XYZ).  I think that would
>> bring the best of both worlds, so to speak.
> 
> So, just to recap:
> 
> dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5.dtb
> dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-display-vz.dtbo
> dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-io-expander.dtbo
> 
> stays and I add:
> 
> dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-vz-2-uhd.dtb
> rk3568-wolfvision-pf5-vz-2-uhd-dtbs := rk3568-wolfvision-pf5.dtb \
> 	rk3568-wolfvision-pf5-display-vz.dtbo \
> 	rk3568-wolfvision-pf5-io-expander.dtbo
> 
> at the bottom of the Makefile. I specifically do NOT want to make this
> depend on CONFIG_OF_ALL_DTBS (by using dtb- like in ti/), so that the
> base DTB will always have the symbols in, regardless of
> CONFIG_OF_ALL_DTBS.
> 
> I think the redundancy is unnecessary but I guess it's worth getting
> away from implicit rules.

I fully agree with getting away from the tests depending on the
CONFIG_OF_ALL_DTBS configuration option, which I wasn't happy with
from the very beginning of this discussion.  It just felt and still
feels wrong, especially because CONFIG_OF_ALL_DTBS depends on other
configuration option(s) that pretty much don't go together with a
non-development kernel build.

The above-provided example is perfectly fine with me, and it follows
the way "magic" in scripts/Makefile.dtbs works.  I just tested it,
to make sure it works as expected, which it does.  As a note, I like
that the already present .dtbo lines remain unmoved, because that
keeps the DT overlay tests separate from the "meat" of the Makefile,
which should make it more readable and less error-prone.
