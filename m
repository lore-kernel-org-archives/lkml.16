Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6764218732B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 07:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743663960; cv=none; b=MddkPgb8cN2vGuspfSKMCUNtZmKoybFpXpIGIGMo/0AlbmKW9isseicXGgNulM93tuzIxhuIG0DfOYE/YMJH4k/9QODOBaDbJzlNEKO4PcTvC5kZTZ6k1XIJlEoIQuhRY2W0UNOCuCuBUyCFkx03SovTIDJmrt4BSWNLVmq6Plc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743663960; c=relaxed/simple;
	bh=mHGwwiszjPz6p1aVgkTBS0vD6k297ari2KmfSue73EE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WmH4SwR1Cev3IlhXd2O7p1HEldl+m7JvinSJnbkv5dnKwQ+HvDT+pRcgrSa0ZFY9TskbzN0kcqBvbV32vUYJj4sPfdmKmyL7LZy35sn4++HXbxJAnnJ5fNo844Gp/qnFPlJ8yKtCuKH1iQJmZjY1EdV3ph/npvryAdqMVuQNiXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=GoTtDTcD; arc=none smtp.client-ip=162.62.57.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="GoTtDTcD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1743663940; bh=bhVWt//b5MQhMSww4VsQj4VZ/Hr+hhUj7oNoEyoZMhY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=GoTtDTcDAPDWHA7TbxhFgKccWxDHL5Gn3o4HV7+czHLkrsV60iMwnGdunFdoeuNqu
	 IltbHNQ6VJQHqIZaQDizp2VlwU5qQ9h1Q0sOvYY9ELkdsllQYTfd7lzYH28p7BpkQm
	 CdsQCf9wLhuy+7DZbOP7NKEAOWjut1fHJwv2qJH8=
Received: from [10.42.13.21] ([116.128.244.169])
	by newxmesmtplogicsvrsza36-0.qq.com (NewEsmtp) with SMTP
	id 165AE892; Thu, 03 Apr 2025 15:05:37 +0800
X-QQ-mid: xmsmtpt1743663937twb6ozg5x
Message-ID: <tencent_D00C9DD2BF00258063B042172328396DB608@qq.com>
X-QQ-XMAILINFO: NUxwpkvPscRuoSR7hR69LKTJvUlW2/y5zdcPjjkuv7QVQ7Vuq1eguOMx2ABbgS
	 vXfD71YDHvZiUoo8293e1EHrdHZyUCnxcXqSidujhpbY6ogYhEVn/Isd1cgXGzMdTDGKHNDk+7ZR
	 GckBEgb9OGo01AdNhuxcColPDTkxyA1/H9CDrTs/kCa8L3/tqig9xKh84YcBjDIkwqF7CPsGO3v6
	 fdpM5T1niv7p3UEPG/tenB7sHvkslgHLtaOGgrRk9oQjOZGHgrrziMYJDwS2nu52I1tCBoRcltJL
	 +2txeS0B18HuPpfDGB7moMSuYZGaKo3jzF34WTq0an87X+YRFwaOsg4eg1A8oEsAiFO4+lUPpYx4
	 48L+CFod+bkAGdDQd73VdwMoc5lsKOTpjUb/tu0ETERqiwwKng9D9F6qJcQTJMSC88G7o92tVZn1
	 KK6ulDoAq0PB8bRq5T6mtm8C7FFCBaSlBRYpYnfeC9XaHTiF2IotulGTqWcd49wAN66MUVeplzkI
	 AkWk4FM7y6ewmzavrL67Ex0C2eo6W4exniOM9oQa6ARb0EEIV5HC9Abwf1cqd6yqmm/hGJcDdiIa
	 yOwxrA4NNFG3fPGlYZxif2iURtYcPV0crr9NUnaTVH1rfIPr5T8Nn9VUNjwj5ChN3yP2dnqML8QJ
	 ud6VIIppS4TQN43XRg2dIGHGCFFzC466xWAOBAT+KbITU6BnF4zirOKmQSldRvAZD2bzRIvmETo9
	 1V0Fxr32aq1wHXLx7m+3qk8qHVs7upHtZ3jM80x9BoSa9NdL2niGqpubWG2oPw8DozJZXc6WqjMg
	 CQseCddLuks/pF2pZbig3bGVXSAx/TBBEkICrjNPlI5aAsYm1gjEZiTrF3wCjoWrjUNPHjUs3O3e
	 2wTHZHJEMrX+Uwt3ehCHk3uq1irq3s9PYmEWGzXgZRs+UVyQK2bDxHRylIgiZIgZ0e0C1oO4C9H+
	 eqCStb7pEYOn+7d66Z8w==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-OQ-MSGID: <2895d817-0316-4df3-9253-347e87bcb953@qq.com>
Date: Thu, 3 Apr 2025 15:05:37 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] nvme: Add sysfs interface for APST configuration
 management
To: Christoph Hellwig <hch@lst.de>
Cc: kbusch@kernel.org, axboe@kernel.dk, sagi@grimberg.me,
 chaitanyak@nvidia.com, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org, Yaxiong Tian <tianyaxiong@kylinos.cn>,
 alexey.bogoslavsky@wdc.com
References: <tencent_4612952C8C5109058CD8E688D81276A2FD0A@qq.com>
 <20250403042504.GB22360@lst.de>
Content-Language: en-US
From: Yaxiong Tian <iambestgod@qq.com>
In-Reply-To: <20250403042504.GB22360@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2025/4/3 12:25, Christoph Hellwig 写道:
> On Tue, Apr 01, 2025 at 05:22:06PM +0800, Yaxiong Tian wrote:
>> From: Yaxiong Tian <tianyaxiong@kylinos.cn>
>>
>> This series enhances NVMe APST (Autonomous Power State Transition) support by:
>> 1. Adding warnings for PST table allocation failures
> 
> That looks fine.
> 
>> 2. Exposing APST tables via sysfs for runtime inspection
>> 3. Providing per-controller sysfs interface for APST configuration
> 
> Who is going to use this and how?  We'll need proper tools for that,
> and in general I'd prefer to have a common set of policies for APST
> configurations and not random people coming up with lots of random
> policies.

These two patches don't fundamentally change the APST configuration 
policy, but rather enable users to configure various APST parameters in 
real-time across different devices. As mentioned in commit 
<ebd8a93aa4f5> ("nvme: extend and modify the APST configuration algorithm"):

1）This patch only introduces partial functionality from the Windows 
driver - it doesn't enable dynamic regeneration of the APST table when 
switching between AC power and battery power.

2) Additionally, using default configurations on certain brand SSDs has 
been observed to increase power consumption.

Therefore, when a system contains multiple drives and users require 
different configurations for AC vs battery power scenarios, real-time 
APST configuration updates across different devices become necessary.It 
must be said that configuring these parameters is difficult for average 
users, but they can still use the original default settings. However, 
for advanced users looking to optimize their devices, this provides them 
with the necessary interface.

As for providing suitable tools for users, I suppose every advanced user 
has their own preferences and approaches. For example, one could trace 
device idle time statistics through trace events (e.g., nvme_complete_rq 
→ nvme_setup_cmd) and use that data as a reference to configure 
apst_primary_timeout_ms.

For example，The device idle time distribution under specific operating
conditions is shown below (unit: nanoseconds):
We can set apst_primary_timeout_ms to 32ms, which ensures that over 99% 
of NVMe commands remain unaffected by APST.

@intervals:
[512, 1K)            749 |@@@@@@@@ 
    |
[1K, 2K)            4856 
|@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|
[2K, 4K)            1002 |@@@@@@@@@@ 
      |
[4K, 8K)             756 |@@@@@@@@ 
      |
[8K, 16K)            413 |@@@@ 
      |
[16K, 32K)            36 | 
      |
[32K, 64K)            14 | 
      |
[64K, 128K)            9 | 
      |
[128K, 256K)          13 | 
      |
[256K, 512K)           8 | 
      |
[512K, 1M)             4 | 
      |
[1M, 2M)               4 | 
      |
[2M, 4M)               3 | 
      |
[4M, 8M)               4 | 
      |
[8M, 16M)              3 | 
      |
[16M, 32M)             0 | 
      |
[32M, 64M)             6 | 
      |
[64M, 128M)            5 | 
      |
[128M, 256M)           5 | 
      |
[256M, 512M)          15 | 
      |
[512M, 1G)             7 | 
      |






