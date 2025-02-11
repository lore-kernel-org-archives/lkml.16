Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473A1130E58;
	Tue, 11 Feb 2025 04:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739247289; cv=none; b=NqyeAOWoPEC3mdPx30jpWumkeI8A0qQwBNI+K3VuHOZcAprEgAdI5fDsqFhkSQ4TXiquF8fjcEFrCJzuItshfxNOxjSWiuFbgxI9IhtDNfDFuSlos+bis/R8MbdTaSjz/9BzSv48vjsr+t/ywoVf3pTtpYSHNd7ZigwxdiBsW9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739247289; c=relaxed/simple;
	bh=NtDUaUsfl54+dbDGWlga94lii7paIJ7KzGnRR+Yq4AA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lp0IZoPCbkFag30grq3d2GBW27T1Vv6TNfYruAO5b/5zNOGpXwYfMVs1viesyIJ2x6j/Z7JKv5ig9WqCMbHon/3vn8BnAoMjwXlR4KZrV1GUnUFjoiDtcAX/+fNaqnSMbmBod5spBALiOHyih+DCowXk2bq6SJo+ZuNxkKZeaDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rrUYz0bm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rrUYz0bm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D310AC4CEDD;
	Tue, 11 Feb 2025 04:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739247288;
	bh=NtDUaUsfl54+dbDGWlga94lii7paIJ7KzGnRR+Yq4AA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rrUYz0bm4N71XREia3KCnsrLVcd/RLld6I+QTWb8jnaaySC4yumwWh7ik2RDOkTSa
	 SI2a2Hh+syp1YuhwRT1hP36vej7w7YetvKiEfsGZ/AYow5SDDvvcTSq9iZveDXs0Ke
	 dJ/T0DQP0YQ0AMv8DF15NnzYzG473XE8RzM6GkqWskJYbPG+eCY2QtKnvzxMUFruUp
	 21ZuBQwSLvWwBZo6T3CKdRZTtpI9ecsuA3Uwf/L3lWhMc3j7HGPMQtNGmT4JRBKOXP
	 x1I9WiN026qSbjTaAjoLj1TWU7iNU3h/pR5TwGgt1MoRXEjKcWWQSxg9DdDisBlomB
	 /33AqwMbTGMww==
Message-ID: <32563a12-eba0-44b4-ad53-e69c6a4962cb@kernel.org>
Date: Mon, 10 Feb 2025 22:14:44 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: socfpga: remove syscon compatible string for
 sysmgr node
To: "Rabara, Niravkumar L" <niravkumar.l.rabara@intel.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: lkp <lkp@intel.com>
References: <20250117154244.4079614-1-niravkumar.l.rabara@intel.com>
 <45276881-11de-47c9-aa9c-488df537a596@kernel.org>
 <d78ae428-6139-426b-bde9-e3ce5a4008ac@kernel.org>
 <BL3PR11MB65325F279FEA579D19EFCF7AA2FD2@BL3PR11MB6532.namprd11.prod.outlook.com>
Content-Language: en-US
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <BL3PR11MB65325F279FEA579D19EFCF7AA2FD2@BL3PR11MB6532.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/10/25 21:18, Rabara, Niravkumar L wrote:
> Hi Dinh
> 
>> -----Original Message-----
>> From: Dinh Nguyen <dinguyen@kernel.org>
>> Sent: Tuesday, 11 February, 2025 8:07 AM
>> To: Rabara, Niravkumar L <niravkumar.l.rabara@intel.com>; Rob Herring
>> <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
>> <conor+dt@kernel.org>; devicetree@vger.kernel.org; linux-
>> kernel@vger.kernel.org
>> Cc: lkp <lkp@intel.com>
>> Subject: Re: [PATCH] ARM: dts: socfpga: remove syscon compatible string for
>> sysmgr node
>>
>> On 2/10/25 16:29, Dinh Nguyen wrote:
>>> On 1/17/25 09:42, niravkumar.l.rabara@intel.com wrote:
>>>> From: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
>>>>
>>>> The SoCFPGA System Manager(sysmgr) dt bindings do not use the syscon
>>>> compitible, nor does the Linux system manager driver rely on it.
>>>> Remove "syscon" for Arria5, Arria10 and Cyclon5 sysmgr node and fixed
>>>> dtbs_check warnings like:
>>>>
>>>> socfpga_arria5_socdk.dtb: sysmgr@ffd08000: compatible: 'oneOf'
>>>> conditional failed, one must be fixed:
>>>>      ['altr,sys-mgr', 'syscon'] is too long
>>>>      'altr,sys-mgr-s10' was expected
>>>>      'altr,sys-mgr' was expected
>>>>      from schema $id:
>>>> http://devicetree.org/schemas/soc/altera/altr,sys-mgr.yaml#
>>>>
>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>> Closes:
>>>> https://lore.kernel.org/oe-kbuild-all/202501102323.Xnte2yhi-lkp@intel
>>>> .com/
>>>> Signed-off-by: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
>>>> ---
>>>>    arch/arm/boot/dts/intel/socfpga/socfpga.dtsi         | 2 +-
>>>>    arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi | 2 +-
>>>>    2 files changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga.dtsi
>>>> b/arch/arm/boot/dts/intel/socfpga/socfpga.dtsi
>>>> index 35be14150f41..f124fb72e260 100644
>>>> --- a/arch/arm/boot/dts/intel/socfpga/socfpga.dtsi
>>>> +++ b/arch/arm/boot/dts/intel/socfpga/socfpga.dtsi
>>>> @@ -853,7 +853,7 @@ spi1: spi@fff01000 {
>>>>            };
>>>>            sysmgr: sysmgr@ffd08000 {
>>>> -            compatible = "altr,sys-mgr", "syscon";
>>>> +            compatible = "altr,sys-mgr";
>>>>                reg = <0xffd08000 0x4000>;
>>>>            };
>>>> diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
>>>> b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
>>>> index 6b6e77596ffa..015120fb4b02 100644
>>>> --- a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
>>>> +++ b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
>>>> @@ -792,7 +792,7 @@ scu: snoop-control-unit@ffffc000 {
>>>>            };
>>>>            sysmgr: sysmgr@ffd06000 {
>>>> -            compatible = "altr,sys-mgr", "syscon";
>>>> +            compatible = "altr,sys-mgr";
>>>>                reg = <0xffd06000 0x300>;
>>>>                cpu1-start-addr = <0xffd06230>;
>>>>            };
>>>
>>> Did you test this patch on actual hardware? Unless something has
>>> changed in the system manager driver, this will probably cause the system
>> hang.
>>>
>>
>> Actually, it will not fail to boot, but you will see SD/MMC fail if the bootloader did
>> not set the clk-phase correctly, or you booted from another source not SD/MMC.
>> The SD/MMC driver uses syscon to get access to the system manager to set it's
>> clk-phase.
>>
> 
> Yes, I have tested this using NFS boot, however I didn't observe any issue with SD/MMC
> driver.
> 
> => fdt print /soc/mmc@ff808000
> mmc@ff808000 {
> 	#address-cells = <0x00000001>;
> 	#size-cells = <0x00000000>;
> 	compatible = "altr,socfpga-dw-mshc";
> 	reg = <0xff808000 0x00001000>;
> 	interrupts = <0x00000000 0x00000062 0x00000004>;
> 	fifo-depth = <0x00000400>;
> 	clocks = <0x0000001a 0x00000024>;
> 	clock-names = "biu", "ciu";
> 	resets = <0x00000006 0x00000027>;
> 	altr,sysmgr-syscon = <0x0000001c 0x00000028 0x00000004>;
> 	status = "okay";
> 	cap-sd-highspeed;
> 	cap-mmc-highspeed;
> 	broken-cd;
> 	bus-width = <0x00000004>;
> 	clk-phase-sd-hs = <0x00000000 0x00000087>;
> 	phandle = <0x00000029>;
> };
> => fdt print /soc/sysmgr@ffd06000
> sysmgr@ffd06000 {
> 	compatible = "altr,sys-mgr";
> 	reg = <0xffd06000 0x00000300>;
> 	cpu1-start-addr = <0xffd06230>;
> 	phandle = <0x0000001c>;
> };
> 
> .
> 
> [    1.095784] mmc_host mmc0: Bus speed (slot 0) = 50000000Hz (slot req 50000000Hz, actual 50000000HZ div = 0)
> [    1.105692] mmc0: new high speed SDHC card at address 0001
> [    1.108238] at24 0-0051: supply vcc not found, using dummy regulator
> [    1.111817] mmcblk0: mmc0:0001 SD32G 29.1 GiB
> [    1.118872] at24 0-0051: 4096 byte 24c32 EEPROM, writable, 32 bytes/write
> [    1.129186]  mmcblk0: p1 p2 p3
> 
> .
> 
> root@arria10:~# ls /dev/mmcblk0*
> /dev/mmcblk0    /dev/mmcblk0p1  /dev/mmcblk0p2  /dev/mmcblk0p3
> root@arria10:~# mount /dev/mmcblk0p1 /tmp/
> root@arria10:~# ls /tmp/
> extlinux                         socfpga_arria10_socdk_sdmmc.dtb  zImage
> fit_spl_fpga.itb                 u-boot.img
> 
> 

You didn't really test anything. There's a register in the System 
Manager that has set the SD/MMC clk-phase in U-Boot. So you won't see 
the failure unless you explicitly change the value in that register and 
then boot Linux, then you will see the failure. If you look at 
drivers/mmc/host/dw_mmc-pltfm.c and look at the function 
dw_mci_socfpga_priv_init(), you can see that work in action. If you 
remove the syscon property, then that portion of the driver will fail. 
Also the ethernet driver is using the system manager's to set the 
correct PHY mode through syscon. I think you need to test this patch 
more thoroughly.

DInh

