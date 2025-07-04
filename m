Received: from seahorse.cherry.relay.mailchannels.net (seahorse.cherry.relay.mailchannels.net [23.83.223.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86A62E36F3
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 20:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.223.161
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751661121; cv=pass; b=XZt+UFV5kzV02ZYqWf8gEzwJAvCln5bO3wkXVJ7tAZnV1LtAscFXGGUvMC5oVkIkL85BUeLi/zaI009nwM+ERLFVemjM/fOR6OcVGVxL+MTKU+LPTpZNt991p4Hpv8RgYFwX3VwipPL8cmVyNsDf8LOQ7bg3XXN13jxA1xbbdkg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751661121; c=relaxed/simple;
	bh=6RzD1FiAIOC3CMmTvRYiJ8fUBmWK/sq7a9475l3CxJ8=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=mep/WBMk+w2xFz2yUPwT7TGt3JkUS7IPe1WpBOko+5JCA/BFKqti1lzbUG9cUfvqB+6+44mGpT68YEDsSA7pARaA6AyZadrs11c5yYlTVhK0mEG2orRH7TwNHZ73xCUm+hbSuR4BrkKLcouGzT74VzmCugXilOFGJ/sWDwV3JFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net; spf=pass smtp.mailfrom=landley.net; dkim=pass (2048-bit key) header.d=landley.net header.i=@landley.net header.b=PJ50S/gu; arc=pass smtp.client-ip=23.83.223.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=landley.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=landley.net header.i=@landley.net header.b="PJ50S/gu"
X-Sender-Id: dreamhost|x-authsender|rob@landley.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id EBA7483F5A;
	Fri,  4 Jul 2025 19:15:22 +0000 (UTC)
Received: from pdx1-sub0-mail-a231.dreamhost.com (100-100-194-155.trex-nlb.outbound.svc.cluster.local [100.100.194.155])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 3F1A884140;
	Fri,  4 Jul 2025 19:15:22 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1751656522; a=rsa-sha256;
	cv=none;
	b=KnHJJ84yLqgetcQfPwv+FhqinaEWlc0eVoMBLU8S5OVqrv7NkoovEH7fc41w/p55ELuHjt
	ZNAfE/KsYJ3r2jQU05lqF0KtzaQmPsZYwxYtqlomncT30RxeG7CyhHD3WYdHP68NFR/7XF
	+kuZhvenVDTA2kbcaILCWaFtuJgQqStvuP9btpJYivcGDuwt1/3pGgQI3wOfqiBK94dBGB
	v+HLnRTctTRVM8FLFJFDQ7KyEnChifME20zlSUAH8Xdhz2Y9B7pbgq3o3aMusKM5DXMLzK
	LL1PUkoSL8JrcsNVISOKJMv1dXOjNUP1cyg/1vePF18o8UlgfpQg0i44kU9ZnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1751656522;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=K1S7O6Q+hK/KLc+MMaX+bsI+sSQr4XpWGL8q5qWEfkc=;
	b=uhzHk7Zi9NiZQ/iIekA5JuPbPCjEqAuj7OD2bbUSsFFJJ9AvdLSDaJct9y7VnD4jJpaItX
	BvzB9XE+AejG1ASqMkrVmIXTeLqM5E6HYVKnN1cHN8XnP4E6T8iuFSCGmVfQSgGEscCURY
	YwBpcqpQeO9cd3ONmZITgeIilkomPjSViW8Mft261cTcRqSjmodIDhOKjPnvEV3bvWk2n6
	htL/AFEwhNz+8PkJ9nkssn7p8f0sZBroWUCkfKd33pL3yLONwm4qoK3RmUW3M2STRr1xL4
	i0o3FZ1I36IdwoQmafe3IEZH7zxoxGVcw9t+2mLdKMmQV5sT0+wBsm/Ti9S2mg==
ARC-Authentication-Results: i=1;
	rspamd-5c976dc8b-5nv4l;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=rob@landley.net
X-Sender-Id: dreamhost|x-authsender|rob@landley.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|rob@landley.net
X-MailChannels-Auth-Id: dreamhost
X-Bubble-Shelf: 1441bd5862adab6f_1751656522745_2012738391
X-MC-Loop-Signature: 1751656522745:1991500625
X-MC-Ingress-Time: 1751656522745
Received: from pdx1-sub0-mail-a231.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.100.194.155 (trex/7.1.3);
	Fri, 04 Jul 2025 19:15:22 +0000
Received: from [192.168.43.71] (M111108020212.v4.enabler.ne.jp [111.108.20.212])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: rob@landley.net)
	by pdx1-sub0-mail-a231.dreamhost.com (Postfix) with ESMTPSA id 4bYjyJ5FXhzL8;
	Fri,  4 Jul 2025 12:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=landley.net;
	s=dreamhost; t=1751656522;
	bh=K1S7O6Q+hK/KLc+MMaX+bsI+sSQr4XpWGL8q5qWEfkc=;
	h=Content-Type:Date:Subject:To:Cc:From;
	b=PJ50S/gupIPg/kaCgXRW7z5najkFuktlmYR+rPbo7HcymapdaWKz1w6DHDgI4B51t
	 AP4KRXiqgPK2LOA8s4iMhkpmfhU02+QYlyIaK4ODb3mDKvgWAlNyUSFYP2skjeOMjf
	 Othojd2b1BQB7pFDfaH2oakIJXn7jsTUKfB1lF9izweUasRNqyzQLrKKBGnjw1gBDl
	 sD3Nb+WKHayb8WupD7ojyFka0KkGEtPK6R7NzWslaY8FL4ttiq8uSAd1uYIMwIVu4e
	 zw9wZAegx+4n0ZkhoIHlAQ7e0cd+zu71kogECLSvvDhoqkTDSsQvHx4Qh3RaXFCDcp
	 0ut+SaTtxNqTg==
Content-Type: multipart/mixed; boundary="------------cJQB9O29EFyv1KNpzTAkfSu1"
Message-ID: <6739da7d-e555-407a-b5cb-e5681da71056@landley.net>
Date: Fri, 4 Jul 2025 14:15:18 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ARM: Require linker to support KEEP within OVERLAY
 for DCE
To: Linus Walleij <linus.walleij@linaro.org>,
 Nathan Chancellor <nathan@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Christian Eggers <ceggers@arri.de>,
 Arnd Bergmann <arnd@arndb.de>, Yuntao Liu <liuyuntao12@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rich Felker <dalias@libc.org>
References: <20250311-arm-fix-vectors-with-linker-dce-v1-0-ec4c382e3bfd@kernel.org>
 <20250311-arm-fix-vectors-with-linker-dce-v1-1-ec4c382e3bfd@kernel.org>
 <CACRpkdY-yxaiG89Co+C2=vyd0i6sh9pP0UGWZh1yUg4jd9jmuQ@mail.gmail.com>
Content-Language: en-US
From: Rob Landley <rob@landley.net>
In-Reply-To: <CACRpkdY-yxaiG89Co+C2=vyd0i6sh9pP0UGWZh1yUg4jd9jmuQ@mail.gmail.com>

This is a multi-part message in MIME format.
--------------cJQB9O29EFyv1KNpzTAkfSu1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/13/25 03:48, Linus Walleij wrote:
> On Tue, Mar 11, 2025 at 8:43 PM Nathan Chancellor <nathan@kernel.org> wrote:
> 
>> ld.lld prior to 21.0.0 does not support using the KEEP keyword within an
>> overlay description, which may be needed to avoid discarding necessary
>> sections within an overlay with '--gc-sections', which can be enabled
>> for the kernel via CONFIG_LD_DEAD_CODE_DATA_ELIMINATION.
>>
>> Disallow CONFIG_LD_DEAD_CODE_DATA_ELIMINATION without support for KEEP
>> within OVERLAY and introduce a macro, OVERLAY_KEEP, that can be used to
>> conditionally add KEEP when it is properly supported to avoid breaking
>> old versions of ld.lld.

I bisected the 6.15 armv7l build break my mkroot project hit to this 
commit (e7607f7d6d81):

   LD      .tmp_vmlinux1
Segmentation fault
make[2]: *** [scripts/Makefile.vmlinux:77: vmlinux] Error 139
make[1]: *** 
[/home/landley/toybox/clean/root/build/armv7l-tmp/linux/Makefile:1226: 
vmlinux] Error 2
make: *** [Makefile:251: __sub-make] Error 2

The toolchain in question was built from gcc 11.4.0 and binutils 2.33.1 
which were the newest versions supported by 
https://github.com/richfelker/musl-cross-make when the still-current 
musl release (1.2.5) came out.

You can grab a binary toolchain to smoketest with from 
https://landley.net/bin/toolchains/latest/armv7l-linux-musleabihf-cross.tar.xz 
and build using the attached miniconfig ala:

for i in distclean allnoconfig ""
do
   CROSS_COMPILE=armv7l-linux-musleabihf- make ARCH=arm \
     KCONFIG_ALLCONFIG=linux-miniconfig -j4 $i
done

This _just_ seems to affect armv7l: armv5l and aarch64 still build fine.

Rob

P.S.  Rich has since added newer gcc version support to MCM, but:

A) the binutils in MCM is still stuck at the old version and if you 
upgrade the gcc without the binutils it hits 
https://lkml.org/lkml/2023/8/9/890

B) I'm waiting for musl-1.2.6 before updating the toolchain.
--------------cJQB9O29EFyv1KNpzTAkfSu1
Content-Type: text/plain; charset=UTF-8; name="linux-miniconfig"
Content-Disposition: attachment; filename="linux-miniconfig"
Content-Transfer-Encoding: base64

IyBtYWtlIEFSQ0g9YXJtIGFsbG5vY29uZmlnIEtDT05GSUdfQUxMQ09ORklHPWxpbnV4LW1p
bmljb25maWcKIyBtYWtlIEFSQ0g9YXJtIC1qICQobnByb2MpCiMgYm9vdCB6SW1hZ2UgY29u
c29sZT10dHlBTUEwCgojIGFyY2hpdGVjdHVyZSBpbmRlcGVuZGVudApDT05GSUdfUEFOSUNf
VElNRU9VVD0xCkNPTkZJR19OT19IWl9JRExFPXkKQ09ORklHX0hJR0hfUkVTX1RJTUVSUz15
CkNPTkZJR19SRF9HWklQPXkKQ09ORklHX0JJTkZNVF9FTEY9eQpDT05GSUdfQklORk1UX1ND
UklQVD15CkNPTkZJR19CTEtfREVWPXkKQ09ORklHX0JMS19ERVZfSU5JVFJEPXkKQ09ORklH
X0JMS19ERVZfTE9PUD15CkNPTkZJR19FWFQ0X0ZTPXkKQ09ORklHX0VYVDRfVVNFX0ZPUl9F
WFQyPXkKQ09ORklHX1ZGQVRfRlM9eQpDT05GSUdfRkFUX0RFRkFVTFRfVVRGOD15CkNPTkZJ
R19NSVNDX0ZJTEVTWVNURU1TPXkKQ09ORklHX05MU19DT0RFUEFHRV80Mzc9eQpDT05GSUdf
TkxTX0lTTzg4NTlfMT15CkNPTkZJR19TUVVBU0hGUz15CkNPTkZJR19TUVVBU0hGU19YQVRU
Uj15CkNPTkZJR19TUVVBU0hGU19aTElCPXkKQ09ORklHX1RNUEZTPXkKQ09ORklHX1RNUEZT
X1BPU0lYX0FDTD15CkNPTkZJR19ERVZUTVBGUz15CkNPTkZJR19ERVZUTVBGU19NT1VOVD15
CkNPTkZJR19ORVQ9eQpDT05GSUdfTkVUREVWSUNFUz15CkNPTkZJR19ORVRfQ09SRT15CkNP
TkZJR19ORVRDT05TT0xFPXkKQ09ORklHX1BBQ0tFVD15CkNPTkZJR19VTklYPXkKQ09ORklH
X0lORVQ9eQpDT05GSUdfSVBWNj15CkNPTkZJR19FVEhFUk5FVD15CkNPTkZJR19DT01QQVRf
MzJCSVRfVElNRT15CkNPTkZJR19FQVJMWV9QUklOVEs9eQpDT05GSUdfSUtDT05GSUc9eQpD
T05GSUdfSUtDT05GSUdfUFJPQz15CgojIGFyY2hpdGVjdHVyZSBzcGVjaWZpYwpDT05GSUdf
TU1VPXkKQ09ORklHX1NPQ19EUkE3WFg9eQpDT05GSUdfVkRTTz15CkNPTkZJR19DUFVfSURM
RT15CkNPTkZJR19LRVJORUxfTU9ERV9ORU9OPXkKQ09ORklHX0FSQ0hfTVVMVElfVjc9eQpD
T05GSUdfQVJDSF9WSVJUPXkKQ09ORklHX0FSQ0hfT01BUDJQTFVTX1RZUElDQUw9eQpDT05G
SUdfQVJDSF9BTFBJTkU9eQpDT05GSUdfQVJNX1RIVU1CPXkKQ09ORklHX0FSTV9DUFVJRExF
PXkKQ09ORklHX0FSTV9MUEFFPXkKQ09ORklHX0FUQT15CkNPTkZJR19BVEFfU0ZGPXkKQ09O
RklHX0FUQV9CTURNQT15CkNPTkZJR19BVEFfUElJWD15CkNPTkZJR19BVEFfR0VORVJJQz15
CkNPTkZJR19WSVJUSU9fTUVOVT15CkNPTkZJR19WSVJUSU9fTkVUPXkKQ09ORklHX1ZJUlRJ
T19CTEs9eQpDT05GSUdfVklSVElPX1BDST15CkNPTkZJR19WSVJUSU9fTU1JTz15CkNPTkZJ
R19TRVJJQUxfQU1CQV9QTDAxMT15CkNPTkZJR19TRVJJQUxfQU1CQV9QTDAxMV9DT05TT0xF
PXkKQ09ORklHX1JUQ19DTEFTUz15CkNPTkZJR19SVENfSENUT1NZUz15CkNPTkZJR19SVENf
RFJWX1BMMDMxPXkKQ09ORklHX1BBVEFfUExBVEZPUk09eQpDT05GSUdfUEFUQV9PRl9QTEFU
Rk9STT15CkNPTkZJR19QQ0k9eQpDT05GSUdfUENJX0hPU1RfR0VORVJJQz15CgojIGFyY2hp
dGVjdHVyZSBleHRyYQo=

--------------cJQB9O29EFyv1KNpzTAkfSu1--
