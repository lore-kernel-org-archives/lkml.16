Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA09F201004;
	Mon,  5 May 2025 15:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746459843; cv=none; b=SFfmVOFt+Gd9RUNAndY1170QrQsuUKrY7nvTEzZnz2zHqAyNeLm0Q4PGP5K1H73r7Piy2YCeblw7SOzr4p/znUAifl1+/K+KGYr5xEaEsbGiZRq4U+pO/+Ixvl0B+/ZJsYu4iVYjEz3d/X67F5FwAhcjEbjnurDu3MRvknrnmRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746459843; c=relaxed/simple;
	bh=MJdxEDXCMWdlWjqibmBE+goyhURgYiH9zXguufWTppk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=XL9XcFMn+lqPLZt7UrEv3iMRjsw685GjLYQOb10e+2ulLOuK00sjuOjzcRD6ZQZ+EbkazXknLje2EUSQ9Zor5mRvoLxPgBwYxgix/Fwz04Jn411gDdbdbFFRixrUwhRv8JMtsKUcVjqNNQLzRJ5np+cVZsTqnMDD3SItjHxNLk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=BqRncqxE; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="BqRncqxE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
	Content-Type; bh=qfovzFaLa2GoD/0nOLZK1UZHHm0v78eVP37p2oBonBM=;
	b=BqRncqxEVFp89mDdGHmZPTqvpo0qk7YZ1Nm6239x+UA4qoAdz42hZ/9NObFTbz
	/lH7ZUp0IRGsicVKcVk82a5zzjH3p9pMWznWr+ujUt1EoqaR5YSq8FUeWWrLUAKp
	sCr9uTEwUqi3quEC6Ox+8oS7QIaafsjrlHJ4ucfEmvqdw=
Received: from [192.168.71.93] (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgCXCiaI3BhoBlukBw--.13972S2;
	Mon, 05 May 2025 23:43:05 +0800 (CST)
Message-ID: <dc6ae086-c4dd-466e-ab7d-ba590877c825@163.com>
Date: Mon, 5 May 2025 23:43:05 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xhci: Add missing parameter description to
 xhci_get_endpoint_index()
From: Hans Zhang <18255117159@163.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: mathias.nyman@intel.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250504160415.183331-1-18255117159@163.com>
 <2025050546-unlivable-monitor-ad66@gregkh>
 <4cfa9138-43c7-4ca8-bb00-3bd15ab0dd98@163.com>
Content-Language: en-US
In-Reply-To: <4cfa9138-43c7-4ca8-bb00-3bd15ab0dd98@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:QCgvCgCXCiaI3BhoBlukBw--.13972S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZrW7Gr4rXF47ZF48Aw13urg_yoW5tr17pF
	yavF9YkF1xJryF9F90gw4ftw15Ka9rCa43W347u345Ar4jyF1xJ3s3KFsYgFnrArsY9F18
	AFWIgw17Wr1UXa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UzCJQUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbBDwdEo2gY1mpazAABs0



On 2025/5/5 23:35, Hans Zhang wrote:
> 
> 
> On 2025/5/5 13:00, Greg KH wrote:
>> On Mon, May 05, 2025 at 12:04:15AM +0800, Hans Zhang wrote:
>>> Fix kernel-doc warning by documenting the @desc parameter:
>>>
>>> drivers/usb/host/xhci.c:1369: warning: Function parameter or struct 
>>> member
>>> 'desc' not described in 'xhci_get_endpoint_index'
>>>
>>> Add detailed description of the @desc parameter and clarify the indexing
>>> logic for control endpoints vs other types. This brings the 
>>> documentation
>>> in line with kernel-doc requirements while maintaining technical 
>>> accuracy.
>>>
>>> Signed-off-by: Hans Zhang <18255117159@163.com>
>>
>> What commit id does this fix?
>>
> 
> Hi Greg,
> 
> export ARCH=arm64
> make defconfig
> make Image W=1 -j16
> 
> ./aarch64-none-linux-gnu-gcc -v
> Using built-in specs.
> COLLECT_GCC=./aarch64-none-linux-gnu-gcc
> COLLECT_LTO_WRAPPER=/media/zhb/hans/code/cix_linux_gcc/arm-gnu-toolchain-12.3.rel1-x86_64-aarch64-none-linux-gnu/bin/../libexec/gcc/aarch64-none-linux-gnu/12.3.1/lto-wrapper
> Target: aarch64-none-linux-gnu
> Configured with: 
> /data/jenkins/workspace/GNU-toolchain/arm-12/src/gcc/configure 
> --target=aarch64-none-linux-gnu --prefix= 
> --with-sysroot=/aarch64-none-linux-gnu/libc 
> --with-build-sysroot=/data/jenkins/workspace/GNU-toolchain/arm-12/build-aarch64-none-linux-gnu/install//aarch64-none-linux-gnu/libc --with-bugurl=https://bugs.linaro.org/ --enable-gnu-indirect-function --enable-shared --disable-libssp --disable-libmudflap --enable-checking=release --enable-languages=c,c++,fortran --with-gmp=/data/jenkins/workspace/GNU-toolchain/arm-12/build-aarch64-none-linux-gnu/host-tools --with-mpfr=/data/jenkins/workspace/GNU-toolchain/arm-12/build-aarch64-none-linux-gnu/host-tools --with-mpc=/data/jenkins/workspace/GNU-toolchain/arm-12/build-aarch64-none-linux-gnu/host-tools --with-isl=/data/jenkins/workspace/GNU-toolchain/arm-12/build-aarch64-none-linux-gnu/host-tools --enable-fix-cortex-a53-843419 --with-pkgversion='Arm GNU Toolchain 12.3.Rel1 (Build arm-12.35)'
> Thread model: posix
> Supported LTO compression algorithms: zlib
> gcc version 12.3.1 20230626 (Arm GNU Toolchain 12.3.Rel1 (Build arm-12.35))
> 
> 
> I'm debugging the problem of pci and modified the iinclude/linux/pci.h 
> file. If the above compilation method is adopted, the following warnings 
> will occur. Use my patch and the warning disappears.
> 
> Compilation warning:
> drivers/usb/host/xhci.c:1370: warning: Function parameter or struct 
> member 'desc' not described in 'xhci_get_endpoint_index'
> 
> 
> The reproduction method can also be modified by modifying the 
> drivers/usb/host/xhci.c file and then compiling, and the above warning 
> will appear.
> 
> Please review whether this needs to be fixed. If not, please ignore this 
> patch.
> 
> 

Hi Greg,

This patch does not fix specific code errors. Instead, it improves the 
parameter documentation of the xhci_get_endpoint_index function (adding 
a description for @desc) to enhance code readability. Therefore, it does 
not fix any issues with historical submissions and is an independent 
document improvement patch.

Best regards,
Hans

