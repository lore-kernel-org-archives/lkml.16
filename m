Received: from slateblue.cherry.relay.mailchannels.net (slateblue.cherry.relay.mailchannels.net [23.83.223.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E442AC17
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 22:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=23.83.223.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751753819; cv=fail; b=OyuFA3tTDBxJCZl6DWW4mM9P/mfNegEHqWsb8pjJB/u0kEFucvoux8odZueRbpYvugtYng9K+phI5CJyy8bgIGTqZnqBLPZKdby6jOx+d8wZUrwz7BkxTVNnrNWQS/EzASLGo5IoPcv4hIO4TJE9cGWTuInPCG5ZZLuHvTmOKi0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751753819; c=relaxed/simple;
	bh=GhbRJTDflLbaHWYeBbdmiUECshbP6TgMkim0K51k4IE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=omLVSEwXvn13z0kBF2CFkiE/LtHg6K8Cf3fYzCgAGIFCyr1V+Ywrmoh9hA5fV91e0jI/kcVcgCDy0gofnorptq6FyVBOSTKj17KvWP5fA5bL3HErUr9lM5KU0yloyAUl/j0D8sv4qtwjVintZP+E+nvj0iiATcITw3CdcCjww4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net; spf=pass smtp.mailfrom=landley.net; dkim=pass (2048-bit key) header.d=landley.net header.i=@landley.net header.b=fW7jINTJ; arc=fail smtp.client-ip=23.83.223.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=landley.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=landley.net header.i=@landley.net header.b="fW7jINTJ"
X-Sender-Id: dreamhost|x-authsender|rob@landley.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 39ABE2C38A0;
	Sat,  5 Jul 2025 19:53:47 +0000 (UTC)
Received: from pdx1-sub0-mail-a224.dreamhost.com (100-105-113-44.trex-nlb.outbound.svc.cluster.local [100.105.113.44])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 8FC322C3ACC;
	Sat,  5 Jul 2025 19:53:46 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1751745226; a=rsa-sha256;
	cv=none;
	b=CUrVssEbvGxQTw01XaRawegwJZAVYmFA/E6Ykq9GEMbbHIcjdn1w+2UiZEzjuOqybv07pf
	ULg8BlX+eDS+IpGUegDKMQ6Z+zLL2TKQozpSMMvhmKnfpGJOiEHbHN44RQr1XZSkDcC0JC
	cst1HLQD36S63slVwrU2BZZx27LhugmIX/KCcBevbTvApc+wemqadn4KcPwQqKk1FfavJ6
	5cfNdJT5IRaOqZrtM6bO4jeLq1aX81R/y4/k2HT+izRHmHOKXdu8ywbjXd3hGuUPzOEwo7
	VeDmaIH48ldvtjUkTgJrBIB04cTU0Rw1pfMBJ+Gd/soPtagrKm5KqYNs8oJXMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1751745226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=d9pzm0+gedOKbLSiTGmDk35IBF6AfAzRAWtaiIn6jrQ=;
	b=a5HU1Etka1Te2YIbqZY0ZHhzCGZgsyI5ZvZFv7dD/ZS5q7exisNi53jGGGjCE0n6Sa76VP
	1OHjSrZfpAHgNzBlQKqBm6a97QTmfehjW97S7uToPf+FLg4dCuTUU++vpRwkvS5RsXqwD+
	azs5ndSdszGPReTLCsWeL/GB+yfg33VODKNJTm07E+h8hj83Pz3hzIFLEBa5x18CGD//0+
	wyGXkH6ZgfZhvR/tYu1yXceaXe4PqY54XdsFb7UmheyYAV/uwkpfR50h3a5Ylo7XTZME1G
	Yc6ePYd0eHzZBXIxcUVJws5ynOmzIc/FyzXEq+4YEXrTYJXDa/fHLsqFbfkWAw==
ARC-Authentication-Results: i=1;
	rspamd-5c976dc8b-gbfx2;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=rob@landley.net
X-Sender-Id: dreamhost|x-authsender|rob@landley.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|rob@landley.net
X-MailChannels-Auth-Id: dreamhost
X-Trail-Fumbling: 0edc048661153d11_1751745227089_152603409
X-MC-Loop-Signature: 1751745227089:1320448536
X-MC-Ingress-Time: 1751745227089
Received: from pdx1-sub0-mail-a224.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.105.113.44 (trex/7.1.3);
	Sat, 05 Jul 2025 19:53:47 +0000
Received: from [192.168.43.71] (M111108020212.v4.enabler.ne.jp [111.108.20.212])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: rob@landley.net)
	by pdx1-sub0-mail-a224.dreamhost.com (Postfix) with ESMTPSA id 4bZLm91M7LzB0;
	Sat,  5 Jul 2025 12:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=landley.net;
	s=dreamhost; t=1751745226;
	bh=oMtAvX6qZfeuJIf0ta5kkKNYBlAGah2HCzc1WvVT/Fw=;
	h=Date:Subject:To:Cc:From:Content-Type:Content-Transfer-Encoding;
	b=fW7jINTJHi5oRDv1NNGtkUycVaclQhMYZPb8AG7b5YNiCYOoWC++dYAhFJ0eY0KaV
	 tPIKTgvos7rmWrqtDC3ENcguoWWMM64g0YXcvv166i4F9X9TrEnb3WSBp6KF2zmoqU
	 jYraDxiBayw1c+uKWl3U10raWwjkq7zL5aUV6//gyqYSTqIH+Bnxy7m/lFV0C0Tdef
	 YjrxLbsPr+cHJV2oI6w+d+Imv4FluzVi9VBI8gTNWZqS/k73KFWQQnYdBdtLPFw31Q
	 Q6kcVp+9pvM/pCyqVMU+DFbk3oaUvglmsyetKasCYgz2vdrjNPO/cOtKlYfg5nsjy6
	 YWF/+IM5V/enA==
Message-ID: <c662505b-9c19-49f7-9823-80ccde72009f@landley.net>
Date: Sat, 5 Jul 2025 14:53:43 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ARM: Require linker to support KEEP within OVERLAY
 for DCE
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Russell King <linux@armlinux.org.uk>, Christian Eggers <ceggers@arri.de>,
 Arnd Bergmann <arnd@arndb.de>, Yuntao Liu <liuyuntao12@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rich Felker <dalias@libc.org>
References: <20250311-arm-fix-vectors-with-linker-dce-v1-0-ec4c382e3bfd@kernel.org>
 <20250311-arm-fix-vectors-with-linker-dce-v1-1-ec4c382e3bfd@kernel.org>
 <CACRpkdY-yxaiG89Co+C2=vyd0i6sh9pP0UGWZh1yUg4jd9jmuQ@mail.gmail.com>
 <6739da7d-e555-407a-b5cb-e5681da71056@landley.net>
 <20250705002402.GA1968690@ax162>
Content-Language: en-US
From: Rob Landley <rob@landley.net>
In-Reply-To: <20250705002402.GA1968690@ax162>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/4/25 19:24, Nathan Chancellor wrote:
> Hmm, I do see a bug in that change, as it allows DCE to be turned on
> with binutils older than 2.36, which should be avoided with something
> like
> 
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 3072731fe09c..962451e54fdd 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -121,7 +121,7 @@ config ARM
>   	select HAVE_KERNEL_XZ
>   	select HAVE_KPROBES if !XIP_KERNEL && !CPU_ENDIAN_BE32 && !CPU_V7M
>   	select HAVE_KRETPROBES if HAVE_KPROBES
> -	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION if (LD_VERSION >= 23600 || LD_CAN_USE_KEEP_IN_OVERLAY)
> +	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION if (LD_VERSION >= 23600 || LD_IS_LLD) && LD_CAN_USE_KEEP_IN_OVERLAY
>   	select HAVE_MOD_ARCH_SPECIFIC
>   	select HAVE_NMI
>   	select HAVE_OPTPROBES if !THUMB2_KERNEL
> 
> but it does not seem like your test configuration enables
> CONFIG_LD_DEAD_CODE_DATA_ELIMINATION so I would expect this change to be
> a no-op in that case? Does the above change work for you? I won't be
> free to validate this until after the weekend.

That fixed it, thanks.

   AS      arch/arm/boot/compressed/piggy.o
   LD      arch/arm/boot/compressed/vmlinux
   OBJCOPY arch/arm/boot/zImage
   Kernel: arch/arm/boot/zImage is ready
$ qemu-system-arm -M virt -nographic -no-reboot -kernel $(find . -name 
zImage) -append console=ttyAMA0
Booting Linux on physical CPU 0x0
Linux version 6.15.0-dirty (landley@driftwood) 
(armv7l-linux-musleabihf-gcc (GCC) 11.4.0, GNU ld (GNU Binutils) 2.33.1) 
#1 Sat Jul  5 14:40:16 CDT 2025
CPU: ARMv7 Processor [414fc0f0] revision 0 (ARMv7), cr=30c53c7d
CPU: PIPT / VIPT nonaliasing data cache, PIPT instruction cache
OF: fdt: Machine model: linux,dummy-virt
...

I note it was a host tool segfaulting. It seems unlikely the host was 
running an arm binary, maybe something went off into la-la land trying 
to parse unexpected ELF tables?

Appropriately-tagged-by: Rob Landley <rob@landley.net>

> Cheers,
> Nathan

Thanks,

Rob
