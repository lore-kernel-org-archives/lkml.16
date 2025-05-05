Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5694E15574E;
	Mon,  5 May 2025 15:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746459345; cv=none; b=uYzxAnLrx23Yiq6LJDo7qmGEccd+/y407oDbBEGYKp00QQEAH3OSFd6BH/tYF+1uKVJgqyJ6zL8XoAhpD9SqkmcxjQtzC5RgSstJ1TlhxbC2e2J3WW3aZGhvUm+RXTPbZV1eH2HhAOL24ekIavJHR65/07mOBFHBFm44uJaPn8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746459345; c=relaxed/simple;
	bh=ewFVZFQZbDeeKnyWJtIq5KQNwlCmzVBjh47/PpeYkLs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SecHhYvem0zZJT1n3OGL7CsAAIT2bFnqMmIVeocl86/U75eADHo4JYaoh32fZ5/4jzoqGVOHsYriP7mgVC6bnv62btjjvWklxoAWNUgPceSYp+KZnpXDLDv/XXCF9zBLvGbykj87VH8A4emRhDGsb12srvfvdQkAh59F1045kjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=fwMHoFxk; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="fwMHoFxk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
	Content-Type; bh=xx7um2Wi1pWgoLAnG1wNQOMj93n7z+CICbU/G2C2QB8=;
	b=fwMHoFxk2qqKM0irqVgEpNUSu2SVAZC7Ai07L6z8QiaXuog0Ry08etpfMxx2O7
	O2t+gU9J+tZ2iF7E8Ccm6r7c9AXIk9emjApdtRuwZcF+q/M2X0PMn8/c/12P18ai
	jkWwDmZwxRd5w9g6onWXvXDeIOHIobr5HssFnsqsgm1sE=
Received: from [192.168.71.93] (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgCnDly32hhoxsOjBw--.14721S2;
	Mon, 05 May 2025 23:35:19 +0800 (CST)
Message-ID: <4cfa9138-43c7-4ca8-bb00-3bd15ab0dd98@163.com>
Date: Mon, 5 May 2025 23:35:20 +0800
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
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <2025050546-unlivable-monitor-ad66@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:QCgvCgCnDly32hhoxsOjBw--.14721S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCr15Kr4kCr4fKr1fJFykAFb_yoW5ArW5pF
	4avr9Ykr1xWry093Wqgw4ftr15Ka9rCay3u347u34YyrWjyFyxX3s3KF4vgFnrAr4F9F18
	CrWIqw1DWr15Xa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U21vfUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiWwtEo2gY0lG7GwAAsk



On 2025/5/5 13:00, Greg KH wrote:
> On Mon, May 05, 2025 at 12:04:15AM +0800, Hans Zhang wrote:
>> Fix kernel-doc warning by documenting the @desc parameter:
>>
>> drivers/usb/host/xhci.c:1369: warning: Function parameter or struct member
>> 'desc' not described in 'xhci_get_endpoint_index'
>>
>> Add detailed description of the @desc parameter and clarify the indexing
>> logic for control endpoints vs other types. This brings the documentation
>> in line with kernel-doc requirements while maintaining technical accuracy.
>>
>> Signed-off-by: Hans Zhang <18255117159@163.com>
> 
> What commit id does this fix?
> 

Hi Greg,

export ARCH=arm64
make defconfig
make Image W=1 -j16

./aarch64-none-linux-gnu-gcc -v
Using built-in specs.
COLLECT_GCC=./aarch64-none-linux-gnu-gcc
COLLECT_LTO_WRAPPER=/media/zhb/hans/code/cix_linux_gcc/arm-gnu-toolchain-12.3.rel1-x86_64-aarch64-none-linux-gnu/bin/../libexec/gcc/aarch64-none-linux-gnu/12.3.1/lto-wrapper
Target: aarch64-none-linux-gnu
Configured with: 
/data/jenkins/workspace/GNU-toolchain/arm-12/src/gcc/configure 
--target=aarch64-none-linux-gnu --prefix= 
--with-sysroot=/aarch64-none-linux-gnu/libc 
--with-build-sysroot=/data/jenkins/workspace/GNU-toolchain/arm-12/build-aarch64-none-linux-gnu/install//aarch64-none-linux-gnu/libc 
--with-bugurl=https://bugs.linaro.org/ --enable-gnu-indirect-function 
--enable-shared --disable-libssp --disable-libmudflap 
--enable-checking=release --enable-languages=c,c++,fortran 
--with-gmp=/data/jenkins/workspace/GNU-toolchain/arm-12/build-aarch64-none-linux-gnu/host-tools 
--with-mpfr=/data/jenkins/workspace/GNU-toolchain/arm-12/build-aarch64-none-linux-gnu/host-tools 
--with-mpc=/data/jenkins/workspace/GNU-toolchain/arm-12/build-aarch64-none-linux-gnu/host-tools 
--with-isl=/data/jenkins/workspace/GNU-toolchain/arm-12/build-aarch64-none-linux-gnu/host-tools 
--enable-fix-cortex-a53-843419 --with-pkgversion='Arm GNU Toolchain 
12.3.Rel1 (Build arm-12.35)'
Thread model: posix
Supported LTO compression algorithms: zlib
gcc version 12.3.1 20230626 (Arm GNU Toolchain 12.3.Rel1 (Build arm-12.35))


I'm debugging the problem of pci and modified the iinclude/linux/pci.h 
file. If the above compilation method is adopted, the following warnings 
will occur. Use my patch and the warning disappears.

Compilation warning:
drivers/usb/host/xhci.c:1370: warning: Function parameter or struct 
member 'desc' not described in 'xhci_get_endpoint_index'


The reproduction method can also be modified by modifying the 
drivers/usb/host/xhci.c file and then compiling, and the above warning 
will appear.

Please review whether this needs to be fixed. If not, please ignore this 
patch.


Best regards,
Hans

