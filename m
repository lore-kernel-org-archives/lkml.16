Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBF1617B4EC;
	Mon,  5 May 2025 16:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746462663; cv=none; b=Okh0cOF9O/FG38+l48XXFfh8KKR36bQI5GPN51qi3Ps5IrEA0Spk0DeP9zaZeTeYAkASlXShWc1G0e0hyzJoujaFHwkkj01tbS9rTMaKboPEL8aeCEMnkueWO1JhaaNIocSdXDyzVQjs1X9+Bez2m4aGOu+71a8Fq+rIVnyQgxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746462663; c=relaxed/simple;
	bh=REzvuUwtmUFOAo5hVg7I8vWb9o46O0LmGL7TOaYwix4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hnVsFbAGDGio6ChHxz0Wtk6wWvs57XCvr7KYPnaw46+ed/b5Hzo7iOIyJ0ZvUgkl6rKpzn2644qLs01V5wTAG068QrrAjUUD7/qGTJRAVowm86mDJODs1uAKNV98SoDBYW5x46+oO4qpckxHFhs29ZsTN0+5Zp35gM8Ddx3Y5SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=gMoabXhF; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="gMoabXhF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
	Content-Type; bh=n4X6MBESsGxzF5cGOAROegCEOry1mSiZUFSWDthw/3s=;
	b=gMoabXhFzmq2/rA9brBr23GELaQiE/P+dW6x4Wb1F/QxZpVqc4tRGw1ElVeK3s
	bE4Ta7qH6iQlACfKgLjLmDSVE4T7mKfzVdXojZ/Skq+F+KtkgiepRuHGL/haly0M
	a+meaP8nDlG8AXa8uYhkGE4XFHDw21Ab1tCapLsE3fiv4=
Received: from [192.168.71.93] (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDnY+O05xhoIBFZEg--.58622S2;
	Tue, 06 May 2025 00:30:45 +0800 (CST)
Message-ID: <126ed213-1836-46e0-895c-6106f885a949@163.com>
Date: Tue, 6 May 2025 00:30:44 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xhci: Add missing parameter description to
 xhci_get_endpoint_index()
To: Greg KH <gregkh@linuxfoundation.org>
Cc: mathias.nyman@intel.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250504160415.183331-1-18255117159@163.com>
 <2025050546-unlivable-monitor-ad66@gregkh>
 <4cfa9138-43c7-4ca8-bb00-3bd15ab0dd98@163.com>
 <dc6ae086-c4dd-466e-ab7d-ba590877c825@163.com>
 <2025050549-unmasking-financial-4094@gregkh>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <2025050549-unmasking-financial-4094@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_____wDnY+O05xhoIBFZEg--.58622S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZr4DCF4rAFy8tFW8ArW3trb_yoWrCrW3pa
	42yF9YkF4fJryFkF1v9w4rtr1UK3y7C343W347W345Ar4qyF1xJas7KF4FgFnrAr4ruF18
	AFWxWwnrWr1UAa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UzMKtUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbBDwdEo2gY4bmFNwAAs1



On 2025/5/6 00:17, Greg KH wrote:
> On Mon, May 05, 2025 at 11:43:05PM +0800, Hans Zhang wrote:
>>
>>
>> On 2025/5/5 23:35, Hans Zhang wrote:
>>>
>>>
>>> On 2025/5/5 13:00, Greg KH wrote:
>>>> On Mon, May 05, 2025 at 12:04:15AM +0800, Hans Zhang wrote:
>>>>> Fix kernel-doc warning by documenting the @desc parameter:
>>>>>
>>>>> drivers/usb/host/xhci.c:1369: warning: Function parameter or
>>>>> struct member
>>>>> 'desc' not described in 'xhci_get_endpoint_index'
>>>>>
>>>>> Add detailed description of the @desc parameter and clarify the indexing
>>>>> logic for control endpoints vs other types. This brings the
>>>>> documentation
>>>>> in line with kernel-doc requirements while maintaining technical
>>>>> accuracy.
>>>>>
>>>>> Signed-off-by: Hans Zhang <18255117159@163.com>
>>>>
>>>> What commit id does this fix?
>>>>
>>>
>>> Hi Greg,
>>>
>>> export ARCH=arm64
>>> make defconfig
>>> make Image W=1 -j16
>>>
>>> ./aarch64-none-linux-gnu-gcc -v
>>> Using built-in specs.
>>> COLLECT_GCC=./aarch64-none-linux-gnu-gcc
>>> COLLECT_LTO_WRAPPER=/media/zhb/hans/code/cix_linux_gcc/arm-gnu-toolchain-12.3.rel1-x86_64-aarch64-none-linux-gnu/bin/../libexec/gcc/aarch64-none-linux-gnu/12.3.1/lto-wrapper
>>> Target: aarch64-none-linux-gnu
>>> Configured with:
>>> /data/jenkins/workspace/GNU-toolchain/arm-12/src/gcc/configure
>>> --target=aarch64-none-linux-gnu --prefix=
>>> --with-sysroot=/aarch64-none-linux-gnu/libc --with-build-sysroot=/data/jenkins/workspace/GNU-toolchain/arm-12/build-aarch64-none-linux-gnu/install//aarch64-none-linux-gnu/libc
>>> --with-bugurl=https://bugs.linaro.org/ --enable-gnu-indirect-function
>>> --enable-shared --disable-libssp --disable-libmudflap
>>> --enable-checking=release --enable-languages=c,c++,fortran --with-gmp=/data/jenkins/workspace/GNU-toolchain/arm-12/build-aarch64-none-linux-gnu/host-tools --with-mpfr=/data/jenkins/workspace/GNU-toolchain/arm-12/build-aarch64-none-linux-gnu/host-tools --with-mpc=/data/jenkins/workspace/GNU-toolchain/arm-12/build-aarch64-none-linux-gnu/host-tools --with-isl=/data/jenkins/workspace/GNU-toolchain/arm-12/build-aarch64-none-linux-gnu/host-tools
>>> --enable-fix-cortex-a53-843419 --with-pkgversion='Arm GNU Toolchain
>>> 12.3.Rel1 (Build arm-12.35)'
>>> Thread model: posix
>>> Supported LTO compression algorithms: zlib
>>> gcc version 12.3.1 20230626 (Arm GNU Toolchain 12.3.Rel1 (Build arm-12.35))
>>>
>>>
>>> I'm debugging the problem of pci and modified the iinclude/linux/pci.h
>>> file. If the above compilation method is adopted, the following warnings
>>> will occur. Use my patch and the warning disappears.
>>>
>>> Compilation warning:
>>> drivers/usb/host/xhci.c:1370: warning: Function parameter or struct
>>> member 'desc' not described in 'xhci_get_endpoint_index'
>>>
>>>
>>> The reproduction method can also be modified by modifying the
>>> drivers/usb/host/xhci.c file and then compiling, and the above warning
>>> will appear.
>>>
>>> Please review whether this needs to be fixed. If not, please ignore this
>>> patch.
>>>
>>>
>>
>> Hi Greg,
>>
>> This patch does not fix specific code errors. Instead, it improves the
>> parameter documentation of the xhci_get_endpoint_index function (adding a
>> description for @desc) to enhance code readability. Therefore, it does not
>> fix any issues with historical submissions and is an independent document
>> improvement patch.
> 
> It fixes when that parameter was added to that function, OR it fixes
> when the comment block was added to document that function, right?  So
> either way, it does "Fix" something...
> 

Hi Greg,

Thank you for the feedback. This patch adds the missing documentation 
for the `@desc` parameter in the `xhci_get_endpoint_index` function, 
which was introduced in commit <d0e96f5a71a0> ("usb: xhci: Control 
transfer support.") but lacked proper parameter description.

In the next version, I will add:
Fixes: d0e96f5a71a0 ("USB: xhci: Control transfer support.")


Is that so? If not, please correct me.


Best regards,
Hans


