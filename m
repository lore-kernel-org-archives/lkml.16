Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66B28C07;
	Tue, 11 Feb 2025 00:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739232408; cv=none; b=PRGuaAAbYI07IzqMxX9L7eoOXdcDRUsKcN+nZqm6A5HGRMTqkk4a8831MLSR7vCI8bspErLjHxsYRpXrLMszuWEVdUkjTDxbe0BroDzflkJKmH3cCZcxdH8s/Sn6iAR9X/EEmQprK5oy5f7PAmAq0R0M4zk0jYzN0YUTxxKn1Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739232408; c=relaxed/simple;
	bh=i9FyaKCyK1Y6L4jpWSozg/Okkt5fet0MuhxuuYXFpVQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=kDZYsTWnbf+2iuFPMne5lyKSjuKcVZZnJ1fFaBjjn3Ai+ws1jwtMSo1EeNP/26Q8gKDC2xNFBEyEtp2TURtH6hITeuMTACaGgsW6kdTJGy70/h/a/KFMpifX0ySE0/UPawoxUPZetHzsT3+f6N6nEyCMuToHITcdRPoBo7IhSMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HLW3Rxup; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HLW3Rxup"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C125EC4CED1;
	Tue, 11 Feb 2025 00:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739232408;
	bh=i9FyaKCyK1Y6L4jpWSozg/Okkt5fet0MuhxuuYXFpVQ=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=HLW3Rxupqma0kVS7XBKx6k2sJz64Fe6Ei56GrsiBzBT+Kuk3giKRZr09y0wGb1NEF
	 98f76ZncefOH9wjTSjD3Ad9pwshlwJoLFfuCnl1NgsDYSabkPjMtp3I0sRA5KLZFlr
	 f8PJuFnTc6A+bd14pIo/rLt65vytmZrQZNN+5uvcmyk2P6ly2e5CA1wsOaLu7aIgjM
	 txuFl1c+fbxJb8dOQERnJ+m7eiv5zJE+KJcHut8fkDt0yIsFNWuooNZjHj9CU/Oh+h
	 icOQbQqv9B6Mz8AlKf4wS3/YP+Ac0dIb0/mBX8orFzog9l+ar6jJAm52IUZ8Jdej3r
	 EnVjRFay+KSAA==
Message-ID: <d78ae428-6139-426b-bde9-e3ce5a4008ac@kernel.org>
Date: Mon, 10 Feb 2025 18:06:46 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: socfpga: remove syscon compatible string for
 sysmgr node
From: Dinh Nguyen <dinguyen@kernel.org>
To: niravkumar.l.rabara@intel.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>
References: <20250117154244.4079614-1-niravkumar.l.rabara@intel.com>
 <45276881-11de-47c9-aa9c-488df537a596@kernel.org>
Content-Language: en-US
In-Reply-To: <45276881-11de-47c9-aa9c-488df537a596@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/10/25 16:29, Dinh Nguyen wrote:
> On 1/17/25 09:42, niravkumar.l.rabara@intel.com wrote:
>> From: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
>>
>> The SoCFPGA System Manager(sysmgr) dt bindings do not use the syscon
>> compitible, nor does the Linux system manager driver rely on it.
>> Remove "syscon" for Arria5, Arria10 and Cyclon5 sysmgr node and fixed
>> dtbs_check warnings like:
>>
>> socfpga_arria5_socdk.dtb: sysmgr@ffd08000: compatible: 'oneOf' 
>> conditional failed, one must be fixed:
>>     ['altr,sys-mgr', 'syscon'] is too long
>>     'altr,sys-mgr-s10' was expected
>>     'altr,sys-mgr' was expected
>>     from schema $id: 
>> http://devicetree.org/schemas/soc/altera/altr,sys-mgr.yaml#
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: 
>> https://lore.kernel.org/oe-kbuild-all/202501102323.Xnte2yhi-lkp@intel.com/
>> Signed-off-by: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
>> ---
>>   arch/arm/boot/dts/intel/socfpga/socfpga.dtsi         | 2 +-
>>   arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga.dtsi 
>> b/arch/arm/boot/dts/intel/socfpga/socfpga.dtsi
>> index 35be14150f41..f124fb72e260 100644
>> --- a/arch/arm/boot/dts/intel/socfpga/socfpga.dtsi
>> +++ b/arch/arm/boot/dts/intel/socfpga/socfpga.dtsi
>> @@ -853,7 +853,7 @@ spi1: spi@fff01000 {
>>           };
>>           sysmgr: sysmgr@ffd08000 {
>> -            compatible = "altr,sys-mgr", "syscon";
>> +            compatible = "altr,sys-mgr";
>>               reg = <0xffd08000 0x4000>;
>>           };
>> diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi 
>> b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
>> index 6b6e77596ffa..015120fb4b02 100644
>> --- a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
>> +++ b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
>> @@ -792,7 +792,7 @@ scu: snoop-control-unit@ffffc000 {
>>           };
>>           sysmgr: sysmgr@ffd06000 {
>> -            compatible = "altr,sys-mgr", "syscon";
>> +            compatible = "altr,sys-mgr";
>>               reg = <0xffd06000 0x300>;
>>               cpu1-start-addr = <0xffd06230>;
>>           };
> 
> Did you test this patch on actual hardware? Unless something has changed 
> in the system manager driver, this will probably cause the system hang.
>

Actually, it will not fail to boot, but you will see SD/MMC fail if the 
bootloader did not set the clk-phase correctly, or you booted from 
another source not SD/MMC. The SD/MMC driver uses syscon to get access 
to the system manager to set it's clk-phase.

Dinh

Dinh

