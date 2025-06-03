Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC21A1F4CA4
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 07:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748934032; cv=none; b=KLTxva1UgJpBjSa1wCx6bJHWX9z/G/VfSrgPkRYIkincaBQJzhXSyGyZr6zQM4CueBCcTJWOvWj2iUH5S24j/qDH5TeH3QWZPLhG8f2j06HdwXTKY2WaenlXlxtx3rDs7a+eW/gsHMmvbEFdopli6y0RDYXxtAWsXv4qAEDAqxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748934032; c=relaxed/simple;
	bh=neMNioGQcMY/ThDZFH+CvN16qQngobk9skAxVe3CuBE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uda2oTakg1am+wWmNM8ySBUB7clIREPi3YQS4opeVBz1Zy2322ZxnE+KwMdipMqMlCz4sOdlSm9X4mw5k17A6m8tDx6qADorDGeHr0ou/axlMXn9jp1k7quZf3FvxgPGKCmJdAvhgDpnYNMRJqUyP/5BEHLnWncz6iXK0eVABQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net; spf=pass smtp.mailfrom=w6rz.net; dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b=jf110Vpq; arc=none smtp.client-ip=44.202.169.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=w6rz.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b="jf110Vpq"
Received: from eig-obgw-6003a.ext.cloudfilter.net ([10.0.30.151])
	by cmsmtp with ESMTPS
	id M9k1uuAi1iuzSMLdHutYk3; Tue, 03 Jun 2025 07:00:23 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id MLdFuGKjSh9ZxMLdGud2vC; Tue, 03 Jun 2025 07:00:22 +0000
X-Authority-Analysis: v=2.4 cv=GODDEfNK c=1 sm=1 tr=0 ts=683e9d86
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=7vwVE5O1G3EA:10 a=VwQbUJbxAAAA:8
 a=-Qcm0AZxhyoZnww38z8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Wh1V8bzkS9CpCxOpQUxp:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=VGk5+FWq4dsiLV3+8wImbmAjQ0FM6wtq95qD7L+zx7k=; b=jf110Vpqxs5Xhxhf5+BFdSrtnl
	8ZFwQIJDpULaVGziH7UdSpfVh+L2jhH3kWM6dzSLO4UwDuZcO8eHOyBTrWyxaDtjO84+jJihS7Cq6
	VanT9fdEULfrndl2fGOEe5JweLVu/mP/lQRtj5XclmYj8uDnNgk8HkVBhacXutvWJSl1gpfQ6naNt
	NKpcEXqaPNlXQWaGYyGqir/ZtyWEKYKfxiyJD4zA112Dkh1YcQlDSM9Ex8pxG1+SnFXlTg5/R8H7H
	Qnh/wbZEBad6iDrMypxMEWfqfmLTjTViTMWCy4bt+I3nVSaORq5WTAMB2l1ONMhE9hGy/qRS5mb9T
	peMeZmbg==;
Received: from c-73-223-253-157.hsd1.ca.comcast.net ([73.223.253.157]:34732 helo=[10.0.1.116])
	by box5620.bluehost.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.1)
	(envelope-from <re@w6rz.net>)
	id 1uMLdD-00000001pAm-3aWd;
	Tue, 03 Jun 2025 01:00:19 -0600
Message-ID: <e3201002-8157-4fe4-9b21-39f3e5e5054a@w6rz.net>
Date: Tue, 3 Jun 2025 00:00:16 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5.15 000/207] 5.15.185-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org
References: <20250602134258.769974467@linuxfoundation.org>
Content-Language: en-US
From: Ron Economos <re@w6rz.net>
In-Reply-To: <20250602134258.769974467@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - box5620.bluehost.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - w6rz.net
X-BWhitelist: no
X-Source-IP: 73.223.253.157
X-Source-L: No
X-Exim-ID: 1uMLdD-00000001pAm-3aWd
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-223-253-157.hsd1.ca.comcast.net ([10.0.1.116]) [73.223.253.157]:34732
X-Source-Auth: re@w6rz.net
X-Email-Count: 16
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfBRxTtNxiHWK6tfGGR1AUf4Oo5uATkZDt/jy52PdBvHhQHKnbSAfpcYDNacIr83uZLDW77bOFV6m+vztUwighCTwqMxpwR7CdRcDruYz5nrngV6figU6
 Hn+ubWJp4D3ly83cJHjiujo+KtosL/i7on36C4oLb3o0KItcbf38r4d/AoaWT82lH+UryiktTtoR7zA8Eon/finiCYzTWxvCqgw=

On 6/2/25 06:46, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.15.185 release.
> There are 207 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Wed, 04 Jun 2025 13:42:20 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.15.185-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.15.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Build failure on RISC-V.

drivers/clocksource/timer-riscv.c: In function 'riscv_timer_dying_cpu':
drivers/clocksource/timer-riscv.c:82:9: error: implicit declaration of 
function 'riscv_clock_event_stop' [-Werror=implicit-function-declaration]
    82 |         riscv_clock_event_stop();
       |         ^~~~~~~~~~~~~~~~~~~~~~

Caused by the patch "clocksource/drivers/timer-riscv: Stop stimecmp when 
cpu hotplug" commit 60a72ebfdd28510eee8f53a7aadecca1349d4603

The function riscv_clock_event_stop() wasn't added until v6.7-rc1, so 
this patch should be dropped.

