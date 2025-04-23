Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com [162.62.58.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BBE27FD7A;
	Wed, 23 Apr 2025 15:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745420543; cv=none; b=ODYcvuVFhKPlE+Vb2LM3comtb0ESabcGDjigGxBd4Y8WhLaO9xsyAgfgNElAGFQ9mlQ0sSqAfEmgboN/7fx4JsCG5NgxaS4RvEoxo3J/3ZFqpsLvdThv4ksjJg+U3IdKgMe1kPPjJa67fdhHJ/sBk74Nejq0D7VP2qVP8UqraOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745420543; c=relaxed/simple;
	bh=m4X9pNOHsc7T2z08TBIhPjyUadOODJKOYSxeSZHs7GU=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=SAruNrseevVl/1z37JI5q7e8qAzMfheHGzqnzSMgg/OC0/mUyW7o7dqTA93Pm234gRS6e2sh5zjaa9EMWa+xXFhN3ssluTO3km0fJjQy3PE88th44HmddiaA5/ydxbTo5D2TUEbiqhPRtcwuFmiHFv7rjP0Enefk5dEpGJwjGRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=H4zmsSu8; arc=none smtp.client-ip=162.62.58.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="H4zmsSu8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1745420534; bh=PbsmIm23XBEYvGxVRz/EvPQr2pSsFB6HCJforH58gAw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=H4zmsSu8vZzAFTSVrLn1g1+joIxYviFibcOtXNWAVEqXyrkKOeRh1HfRWeO5rcp8L
	 KkVKPgbklpSgfJdlen/IkOrQq3ow1orTh/22/tsb066YgTcLY0kvP27q5vXFxM02VO
	 J0O31r4GyBFEbaUZqov3tLR8EmckqiDbroHK4qXs=
Received: from ubuntu.localdomain ([112.5.207.89])
	by newxmesmtplogicsvrszb16-1.qq.com (NewEsmtp) with SMTP
	id C24B3211; Wed, 23 Apr 2025 22:48:36 +0800
X-QQ-mid: xmsmtpt1745419716twgvx82xi
Message-ID: <tencent_B16F0FDE60249B5B302F900AE6EEE48C4F06@qq.com>
X-QQ-XMAILINFO: Ma5fc9cIcIhRIAXKF1anoehPcR6M+5t9py8p47x5lifCL4G5e1wu91/Xab6FIc
	 sFSNWmid3jkFuNli+8plOx6noPps7t4no02oKwow2I8IshYI0cJv28xw/YyGkxSq31ZT2o+ErlUW
	 F2nm1WpxsacAJQbtmJBrs26ieZlpZ+vI8iSgMlBA1AcardkmJld/FoBtjDjPmeqtrPeEmyMyPyZP
	 rldnv1yU/cmOsHPP/m2CszLllXcGI+4fjc8sO1bCFx+ilyWuKbWIuhBEDNz2IZh34ITTiey5rD/g
	 fib9WoZc0f6pfEuxXLTrqkp8wW/Xy8d5AmHNbOZSRpp+R9ZKoJRrA6fY6FpzX0/iPwu0V7suPd1a
	 7ytKvPuVc/KaN0iILg8NFXYcaapHKcj28xKW+bj30DJfatpyEuOfmpcyLNOwdGsnO/sCHBePAGkr
	 9MZOjuCLqTze8KeN2BEMMqPP0Pfhbci4Qy1BC8DuZVLDJUageWNp6QaHdVbD5mxXiHrTs8Zpx/q6
	 c0XRI0pf4AeLZY7UFao+uD7NDZFE9ReZ+m9ePTL7FU0zaYAH2pErRZptappHtdXBRZqzagC5REnT
	 upS8iXfb0gygVVvFOb+GJ0QIaqMAmPfwqUGSAubhgDgwjwM0Gn9nSB5sEinip54IYTgo7l0ky5Hx
	 i0B7RUW85VjZIcNss5PrLH04CXLRKQexE4xHaxRxQ7XSuN3WY/RwfB5EWdifWqVEaFRHOldXY2OE
	 p9GjQNXnVXMx9U9psllK5xrZxbn1SUDVWhT1KvQ5Z0PcNbI2dP5rnixnnvk6V12+Mu3vcs4ccdI6
	 hJ7LEzYzzPIhKGjecbdObruc9vq+jAH5PBy4HFy5C5dDhENgFF2mMZ0prK6QIirII5Q/ak423ePA
	 dsd7NqwGbF++94OpfdTog7V8c6L7Vz7NcoAtguqs9Cau2TwnCovDn0jvQfuXPmInhn3mOG8bRXy8
	 u+P+tu4kIhTUQACfcnD9mwyzdM27mGVTjwIF72ZmsfVb47XsvHvcJl+n3GbEF/
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
From: 1425075683@qq.com
To: robin.murphy@arm.com
Cc: 1425075683@qq.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	saravanak@google.com
Subject: Re: [PATCH] of: Build warn for missing fn() in _OF_DECLARE
Date: Wed, 23 Apr 2025 22:48:35 +0800
X-OQ-MSGID: <20250423144835.294788-1-1425075683@qq.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <a4277fb4-c982-43c7-9f02-e0050eff417a@arm.com>
References: <a4277fb4-c982-43c7-9f02-e0050eff417a@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

>On 2025-04-17 2:23 pm, Liya Huang wrote:
>> The function pointer fn() in _OF_DECLARE macro might be NULL. For example,
>> in __reserved_mem_init_node(), only non-NULL cases are handled, and NULL
>> function pointers are ignored.
>> 
>> This patch introduces a check to handle cases where fn() is NULL. If fn()
>> is found to be NULL, a warning is issued during compilation to notify
>> developers about the missing function pointer.
>> 
>> ---
>> The function pointer fn() in _OF_DECLARE macro might be NULL. For example,
>> in __reserved_mem_init_node(), only non-NULL cases are handled, and NULL
>> function pointers are ignored.
>> 
>> This patch introduces a check to handle cases where fn() is NULL. If fn()
>> is found to be NULL, a warning is issued during compilation to notify
>> developers about the missing function pointer.
>
>This patch in -next appears to be responsible for syzbot complaining 
>about build errors for some configs:
>
>"
>kernel/dma/coherent.c:410:1: error: static assertion expression is not 
>an integral constant expression
>kernel/dma/contiguous.c:497:1: error: static assertion expression is not 
>an integral constant expression
>"
>
>https://lore.kernel.org/linux-iommu/6808d00a.050a0220.7184a.0010.GAE@google.com/
>
>Also on closer inspection, just outside the diff context we still seem 
>to be explicitly anticipating fn being NULL with:
>
>	.data = (fn == (fn_type)NULL) ? fn : fn
>
>so something doesn't seem quite right...
>
>Thanks,
>Robin.

I tested this patch, and it compiled successfully with GCC but failed with
Clang.I couldn't find a better way to consistently check for null function
pointers during compilation across these two compilers.
I even tried using the method of preventing negative array indexing, but 
it failed to compile with GCC instead.
Perhaps it would be better to abandon this patch. :(

--
Thanks, 
Liya Huang <1425075683@qq.com>

