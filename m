Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79171F4FA;
	Sun, 22 Jun 2025 11:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750592408; cv=none; b=bzlCpypggUwEzEV57QJf9gpU/n6q4mFzT8ym58gibcSBO9cqimDYTTwgpcBGDUvQTb31exD1FrrwcDHVG/IeT7lSfB1hCq/mHdeZJE3KaAS0kO5m9pQjU3PhFAMUa+SIdj8yO1+InP/H14sSd7i7+lnHp1Xwn4FobomwJ51W5YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750592408; c=relaxed/simple;
	bh=tdoC1JLIUwIo42zhc+cp0MsuWB0ORmxE9SG56u2Sxoo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oSV1y6GAbpmJ4wo275vG75iiQMhcxpXrUi3YrNsd68hpzeahtURazzwz8Pzxn/ImIhWXgs9r4ArkuA1br1/nO2VaMVVlrSdM9eVirAmJsjQXtbULD1rL63yKH1wcNVo3fpUWhzJmjrppPh5t5rTQ0Iw+3UjHPwBOkCPqE2JBkik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dyfSDaKV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dyfSDaKV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 224D4C4CEE3;
	Sun, 22 Jun 2025 11:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750592408;
	bh=tdoC1JLIUwIo42zhc+cp0MsuWB0ORmxE9SG56u2Sxoo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dyfSDaKViVK9HTS4B7v9jt3gXSYO0A7lR4D3icSoT8Q2PyFaay1dr5c/wFQxXzN19
	 GkRq8ypjuGi1u9XNWaXSiXEXNItMN6mJ2BTXbg5EUMvnL2wziaHb6y+Dood4q9QiNO
	 SQLlKCQ58/ULnG3cy8qV+K9N3x2PJD3JACfNIHzVbRbD5tmQ0/G/2KylF4klESBdxW
	 ixhfGue5+V3MiQerlG9kX5drHGoWhXgi4QFa3OkRaFinRbtYXnEdaKNZD/Yxg6rkTD
	 RS3xmsHWcP2s7q7zVV7Qxrmzpwb5A0p2lgIWRJOQQKEHFrAc6CygGkFRHAptxA0oIt
	 eXyT7O/0WlyBw==
Message-ID: <36eed23a-351d-4d20-8e7b-8d85cd5505dd@kernel.org>
Date: Sun, 22 Jun 2025 13:40:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: dell-lis3lv02d: Add Latitude 5500
To: Paul Menzel <pmenzel@molgen.mpg.de>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250622080721.4661-1-pmenzel@molgen.mpg.de>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250622080721.4661-1-pmenzel@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Paul,

On 22-Jun-25 10:07 AM, Paul Menzel wrote:
> Add 0x29 as the accelerometer address for the Dell Latitude 5500 to
> lis3lv02d_devices[].
> 
> The address was verified as below:
> 
>     $ cd /sys/bus/pci/drivers/i801_smbus/0000:00:1f.4
>     $ ls -d i2c-?
>     i2c-2
>     $ sudo modprobe i2c-dev
>     $ sudo i2cdetect 2
>     WARNING! This program can confuse your I2C bus, cause data loss and worse!
>     I will probe file /dev/i2c-2.
>     I will probe address range 0x08-0x77.
>     Continue? [Y/n] Y
>          0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
>     00:                         08 -- -- -- -- -- -- --
>     10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>     20: -- -- -- -- -- -- -- -- -- 29 -- -- -- -- -- --
>     30: 30 -- -- -- -- 35 UU UU -- -- -- -- -- -- -- --
>     40: -- -- -- -- 44 -- -- -- -- -- -- -- -- -- -- --
>     50: UU -- 52 -- -- -- -- -- -- -- -- -- -- -- -- --
>     60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>     70: -- -- -- -- -- -- -- --
>     $ echo lis3lv02d 0x29 | sudo tee /sys/bus/i2c/devices/i2c-2/new_device
>     lis3lv02d 0x29
>     $ sudo dmesg
>     [    0.000000] Linux version 6.12.32-amd64 (debian-kernel@lists.debian.org) (x86_64-linux-gnu-gcc-14 (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44) #1 SMP PREEMPT_DYNAMIC Debian 6.12.32-1 (2025-06-07)
>     […]
>     [    0.000000] DMI: Dell Inc. Latitude 5500/0M14W7, BIOS 1.38.0 03/06/2025
>     […]
>     [  609.063488] i2c_dev: i2c /dev entries driver
>     [  639.135020] i2c i2c-2: new_device: Instantiated device lis3lv02d at 0x29
> 
> Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

Note with kernels >= 6.14 you could have also used the new
probe_i2c_addr module option for the dell-lis3lv02d module.

Regards,

Hans



> ---
>  drivers/platform/x86/dell/dell-lis3lv02d.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/dell/dell-lis3lv02d.c b/drivers/platform/x86/dell/dell-lis3lv02d.c
> index efe26d667973..0791118dd6b7 100644
> --- a/drivers/platform/x86/dell/dell-lis3lv02d.c
> +++ b/drivers/platform/x86/dell/dell-lis3lv02d.c
> @@ -45,6 +45,7 @@ static const struct dmi_system_id lis3lv02d_devices[] __initconst = {
>  	 * Additional individual entries were added after verification.
>  	 */
>  	DELL_LIS3LV02D_DMI_ENTRY("Latitude 5480",      0x29),
> +	DELL_LIS3LV02D_DMI_ENTRY("Latitude 5500",      0x29),
>  	DELL_LIS3LV02D_DMI_ENTRY("Latitude E6330",     0x29),
>  	DELL_LIS3LV02D_DMI_ENTRY("Latitude E6430",     0x29),
>  	DELL_LIS3LV02D_DMI_ENTRY("Precision 3540",     0x29),

