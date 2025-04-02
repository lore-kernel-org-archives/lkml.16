Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6984233727;
	Wed,  2 Apr 2025 08:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743583519; cv=none; b=S1MFhEHb85RYddHisc1LUhmPW+W5q9WdyLATxYGJKHCjSGb1REevRSYKD0xoAzU2MnFbP2P0sC2P9f2Ig8XLePJExg2laFaEv6xDzoHVWynmASgNwT2vKc6VKIevR7WD0SnoB8a5iuLQTKygQwhDhYJys27KsuiEZ3uhhpOkf44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743583519; c=relaxed/simple;
	bh=W1SiKtPVp8xrFYw4pATHh1Zdo/MG/rAURuLF/VmYRC0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Amf/hZYKsNkPEHQlb4KQMm5mIb4TdIuRSUuxzaY0qGAkFtXYwyS3YVaeHWdVd7EVkr7vFYxn2BlBJ2uyO31fUoMXPuevwrBOOsl4tQkh3duJfWD3WZ7e0JzaRBn+t1T5I2LFykSumiuPrB3jnSBLiWLyCyyHukPDVY+zM5dbeRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ki9/m1OU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ki9/m1OU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ECDAC4CEDD;
	Wed,  2 Apr 2025 08:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743583516;
	bh=W1SiKtPVp8xrFYw4pATHh1Zdo/MG/rAURuLF/VmYRC0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ki9/m1OUpBNXZt2lOL2R1ddzvKZulxTMyO8XoBNsUC6Dl0Hn8RvRUWO3hzM9RvYg6
	 O2YddD2vYBX+2xM3Or5lvM9191ij2YSKIFPu3NseI3bpju2jOZ5zqnYYi2xQr2O+Ku
	 mMNfhRSeTaTvoc5xRhUXx7gWjXMhhbxxbJu69dx6CzywT9eX/vKISqBnADfahmIykE
	 3gKakt2kB9+nsFwZdsezckhzC4s52LE1xTFczJwGMJ76t7teBZ2Bb7BDox/vaBvUuU
	 H5pkrqKN2VGs6PPdaL/8877dKB+myaHghVj7Tvh5uK795i4XsiOlYv3MMX4aeLYy2j
	 Qq2/d80YAZSIg==
Message-ID: <71c301ea-0be7-4349-92d6-93b3ffc9c593@kernel.org>
Date: Wed, 2 Apr 2025 10:45:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/7] dt-bindings: memory-controllers: Add STM32 Octo
 Memory Manager controller
To: Rob Herring <robh@kernel.org>,
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 christophe.kerello@foss.st.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20250401-upstream_ospi_v6-v7-0-0ef28513ed81@foss.st.com>
 <20250401-upstream_ospi_v6-v7-2-0ef28513ed81@foss.st.com>
 <20250401222015.GA4071342-robh@kernel.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250401222015.GA4071342-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/04/2025 00:20, Rob Herring wrote:
>> +      clocks = <&rcc CK_BUS_OSPIIOM>,
>> +               <&scmi_clk CK_SCMI_OSPI1>,
>> +               <&scmi_clk CK_SCMI_OSPI2>;
>> +      clock-names = "omm", "ospi1", "ospi2";
>> +      resets = <&rcc OSPIIOM_R>,
>> +               <&scmi_reset RST_SCMI_OSPI1>,
>> +               <&scmi_reset RST_SCMI_OSPI2>;
>> +      reset-names = "omm", "ospi1", "ospi2";
>> +      access-controllers = <&rifsc 111>;
>> +      power-domains = <&CLUSTER_PD>;
>> +      #address-cells = <2>;
>> +      #size-cells = <1>;
>> +      st,syscfg-amcr = <&syscfg 0x2c00 0x7>;
>> +      st,omm-req2ack-ns = <0>;
>> +      st,omm-mux = <0>;
>> +      st,omm-cssel-ovr = <0>;
>> +
>> +      spi@0 {
>> +        compatible = "st,stm32mp25-ospi";
>> +        reg = <0 0 0x400>;
>> +        memory-region = <&mm_ospi1>;
>> +        interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
>> +        dmas = <&hpdma 2 0x62 0x00003121 0x0>,
>> +               <&hpdma 2 0x42 0x00003112 0x0>;
>> +        dma-names = "tx", "rx";
>> +        clocks = <&scmi_clk CK_SCMI_OSPI1>;
>> +        resets = <&scmi_reset RST_SCMI_OSPI1>, <&scmi_reset RST_SCMI_OSPI1DLL>;
> 
> Looks like you are duplicating properties in the parent and child nodes. 
> Maybe that accurately models the h/w, but if it is just so the drivers 
> can get the resources from "the driver's node", you can always just look 
> in the child nodes for the resources (as probably you want to drop the 
> per instance resources from the parent).


The current solution was actually my suggestion because if a parent
device has to toggle child's reset, it means it actually is the consumer
of that reset one way or another. IOW, it is one of its resources.

This also might matter for some of the implementations because we might
need to setup device links or do some probe-ordering (in the future)
between parent and the reset provider.

Without reset resource in the parent, I could imagine probe order:
1. parent (pokes into the child for reset)
2. reset and clock providers
3. child
which would defer between 1 and 2.

With parent having the resource it would be re-ordered into:
1. reset and clock providers
2. parent
3. child


Best regards,
Krzysztof
