Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165191FCF7C;
	Tue, 11 Feb 2025 12:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739276700; cv=none; b=NY8LQhbGLdBTsw+T5yjDPNumNaETZOfnI6ilY7JQv4mjUDkq0bb1BR1D1mo3JS6ObHD2UFX8tOkhp3eOB33lVa/jokkboT7pqBTdjVwbvnI0JlAyVFc63aKJIVlgkGQz9hD4p2RzMg80KvOD67cmSyPDL/t/2/E4yYzp9a9XeS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739276700; c=relaxed/simple;
	bh=3QR4BHlPHaetqkXvGDWTreEklyFOnk3sGNJtGnElgyg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ehP4kkLOgcN7aQjsvczet4h/aImJ+l4hHoT5Aazq4SceQliMfLfg87hXjozDS8R6nfj7yqNrfuvJ00irFZn2bmfaWLU/qY0MhRKViThtk9h8tlcwmkyHwOcFDDnC9dwXXBEG40wz/K/+lofedV0Lj/JPn0OtCMm8aU/B5eFsk+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XRFaSJN/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XRFaSJN/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00EF0C4CEDD;
	Tue, 11 Feb 2025 12:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739276699;
	bh=3QR4BHlPHaetqkXvGDWTreEklyFOnk3sGNJtGnElgyg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XRFaSJN/IbDsJBezDJTK4hVy9EHyVyCGrOB1idguDXA/z1GTGQcB+LXOAm3WbgBs9
	 exkqeos9Fw/NHYp1VT1jWOrJsSmxZ1tI7y59IORFZLs2CpYEfZ/t7OpRGKHtOSOpXY
	 YXA/FRKCYfhLL9fHG2UU75UEZQDD/VMVhjC5ROfD1hzzZyt9jWtRYDpGHVwuYaS2d3
	 1RljvBufHLVYt4beSf9TtJ7dSYJxMvNGnVQV0Yj9tYAWneQbyYJ5mWbU30lH9+NajU
	 OaedfX5eXubyGjOzHCsRnkC/VBv/gyk09rxqZ71L9de3XpOmMvp/yvp/NBUqz7764s
	 UPfOd3BKXY05g==
Message-ID: <9b4e50cd-abab-4f3c-8450-d721bac5db17@kernel.org>
Date: Tue, 11 Feb 2025 06:24:57 -0600
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
 <32563a12-eba0-44b4-ad53-e69c6a4962cb@kernel.org>
 <BL3PR11MB6532F03C63BABEC1DCE50964A2FD2@BL3PR11MB6532.namprd11.prod.outlook.com>
Content-Language: en-US
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <BL3PR11MB6532F03C63BABEC1DCE50964A2FD2@BL3PR11MB6532.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/11/25 06:18, Rabara, Niravkumar L wrote:
> Hi Dinh,
> 
>> -----Original Message-----
>> From: Dinh Nguyen <dinguyen@kernel.org>
>> Sent: Tuesday, 11 February, 2025 12:15 PM
>> To: Rabara, Niravkumar L <niravkumar.l.rabara@intel.com>; Rob Herring
>> <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
>> <conor+dt@kernel.org>; devicetree@vger.kernel.org; linux-
>> kernel@vger.kernel.org
>> Cc: lkp <lkp@intel.com>
>> Subject: Re: [PATCH] ARM: dts: socfpga: remove syscon compatible string for
>> sysmgr node
>>
>>> Yes, I have tested this using NFS boot, however I didn't observe any
>>> issue with SD/MMC driver.
>>>
>>> => fdt print /soc/mmc@ff808000
>>> mmc@ff808000 {
>>> 	#address-cells = <0x00000001>;
>>> 	#size-cells = <0x00000000>;
>>> 	compatible = "altr,socfpga-dw-mshc";
>>> 	reg = <0xff808000 0x00001000>;
>>> 	interrupts = <0x00000000 0x00000062 0x00000004>;
>>> 	fifo-depth = <0x00000400>;
>>> 	clocks = <0x0000001a 0x00000024>;
>>> 	clock-names = "biu", "ciu";
>>> 	resets = <0x00000006 0x00000027>;
>>> 	altr,sysmgr-syscon = <0x0000001c 0x00000028 0x00000004>;
>>> 	status = "okay";
>>> 	cap-sd-highspeed;
>>> 	cap-mmc-highspeed;
>>> 	broken-cd;
>>> 	bus-width = <0x00000004>;
>>> 	clk-phase-sd-hs = <0x00000000 0x00000087>;
>>> 	phandle = <0x00000029>;
>>> };
>>> => fdt print /soc/sysmgr@ffd06000
>>> sysmgr@ffd06000 {
>>> 	compatible = "altr,sys-mgr";
>>> 	reg = <0xffd06000 0x00000300>;
>>> 	cpu1-start-addr = <0xffd06230>;
>>> 	phandle = <0x0000001c>;
>>> };
>>>
>>> [    1.095784] mmc_host mmc0: Bus speed (slot 0) = 50000000Hz (slot req
>> 50000000Hz, actual 50000000HZ div = 0)
>>> [    1.105692] mmc0: new high speed SDHC card at address 0001
>>> [    1.108238] at24 0-0051: supply vcc not found, using dummy regulator
>>> [    1.111817] mmcblk0: mmc0:0001 SD32G 29.1 GiB
>>> [    1.118872] at24 0-0051: 4096 byte 24c32 EEPROM, writable, 32
>> bytes/write
>>> [    1.129186]  mmcblk0: p1 p2 p3
>>>
>>> .
>>>
>>> root@arria10:~# ls /dev/mmcblk0*
>>> /dev/mmcblk0    /dev/mmcblk0p1  /dev/mmcblk0p2  /dev/mmcblk0p3
>>> root@arria10:~# mount /dev/mmcblk0p1 /tmp/ root@arria10:~# ls /tmp/
>>> extlinux                         socfpga_arria10_socdk_sdmmc.dtb  zImage
>>> fit_spl_fpga.itb                 u-boot.img
>>>
>>>
>>
>> You didn't really test anything. There's a register in the System Manager that has
>> set the SD/MMC clk-phase in U-Boot. So you won't see the failure unless you
>> explicitly change the value in that register and then boot Linux, then you will see
>> the failure. If you look at drivers/mmc/host/dw_mmc-pltfm.c and look at the
>> function dw_mci_socfpga_priv_init(), you can see that work in action. If you
>> remove the syscon property, then that portion of the driver will fail.
>> Also the ethernet driver is using the system manager's to set the correct PHY
>> mode through syscon. I think you need to test this patch more thoroughly.
>>
>> DInh
> 
> Altera System Manager driver (drivers/mfd/altera-sysmgr.c) is enabled
> in "socfpga_defconfig" - i.e. CONFIG_MFD_ALTERA_SYSMGR=y
> 
> So, SoCFPGA always using drivers/mfd/altera-sysmgr.c for System Manager
> register access, not the generic "syscon" drivers/mfd/syscon.c.
> That's why we do not need "syscon" compatible for fall back mechanism.
> 
> 	sysmgr: sysmgr@ffd08000 {
> -		compatible = "altr,sys-mgr", "syscon";
> +		compatible = "altr,sys-mgr";
>   		reg = <0xffd08000 0x4000>;
>   	};
> 	mmc: mmc@ff808000 {
> 		…
> 		altr,sysmgr-syscon = <&sysmgr 0x28 4>;
> 		clk-phase-sd-hs = <0>, <135>;
> 		…
> 	};
> 	gmac0: ethernet@ff800000 {
> 		…
> 		altr,sysmgr-syscon = <&sysmgr 0x44 0>;
> 		…
> 	};
> 
> 
> Even the sdmmc driver you mentioned is using "drivers/mfd/altera-sysmgr.c"
> not the generic "syscon" drivers/mfd/syscon.c. Same thing for ethernet driver
> as well.
> 
> dw_mci_socfpga_priv_init()  {
> 	...
> 	rc = of_property_read_variable_u32_array(np, "clk-phase-sd-hs", &clk_phase[0], 2, 0);
> 	if (rc < 0)
> 		return 0;
> 
> 	sys_mgr_base_addr = altr_sysmgr_regmap_lookup_by_phandle(np, "altr,sysmgr-syscon");
> 	if (IS_ERR(sys_mgr_base_addr)) {
> 		dev_warn(host->dev, "clk-phase-sd-hs was specified, but failed to find altr,sys-mgr regmap!\n");
> 		return 0;
> 	}
> 
> 	of_property_read_u32_index(np, "altr,sysmgr-syscon", 1, &reg_offset);
> 	of_property_read_u32_index(np, "altr,sysmgr-syscon", 2, &reg_shift);
> 	...
> }
> 
> Please let me know if my understanding is incorrect.
> 

But the altera-sysmgr driver is using syscon as the interface:

config MFD_ALTERA_SYSMGR
         bool "Altera SOCFPGA System Manager"
         depends on ARCH_INTEL_SOCFPGA && OF
         select MFD_SYSCON

Can you look at your bootlog and see if you see this message 
""clk-phase-sd-hs was specified, but failed to find altr,sys-mgr regmap!"?

Dinh

