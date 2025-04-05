Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA6B2E62BD
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 02:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743818608; cv=none; b=Y+AnV61Ywg01HdB1o2zyUMoDENYV2YNZUTDCplcxdoOT3EpM8gokunvyw2gYZ3PIbJaJrORruIEdyjV3lROdJB7W+ijDczcEFCdMG7C3qpWscwQZDxF9HxRrJZTWpY31ZsWLktW/0KO4E8Dm3uCQ04q7ezoflfD5YdFZhXCJEls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743818608; c=relaxed/simple;
	bh=fuQhpdRVbRiGalBCawn6B9is5VlOAPgqH5fCPw9Qs4w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MH72MjwMfu60PPvdvMFdJ5/VemudFOlS4uKmcJleW8tTtxenags27w1dCe+ap5DUxw+++8LR0MPZ8uNag1JMxpTKY0jtaFc18aj0gcbSJoF5Yne1M0wxQSbdHtvBoTe7Fz1UjsOWF9OyiZjT8r2KEQ7GmRk/R/XyQVdSSXeA11c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net; spf=pass smtp.mailfrom=w6rz.net; dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b=3myCfCWP; arc=none smtp.client-ip=44.202.169.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=w6rz.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b="3myCfCWP"
Received: from eig-obgw-6002a.ext.cloudfilter.net ([10.0.30.222])
	by cmsmtp with ESMTPS
	id 0i3Xuw39SzZPa0ssQuczGz; Sat, 05 Apr 2025 02:03:18 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id 0ssPurDeG1vNy0ssPukzBr; Sat, 05 Apr 2025 02:03:18 +0000
X-Authority-Analysis: v=2.4 cv=VMQWnMPX c=1 sm=1 tr=0 ts=67f08f66
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=7vwVE5O1G3EA:10 a=VwQbUJbxAAAA:8
 a=HaFmDPmJAAAA:8 a=CTIpb7JmY0c5bVNJeN8A:9 a=QEXdDO2ut3YA:10
 a=nmWuMzfKamIsx3l42hEX:22 a=hTR6fmoedSdf3N0JiVF8:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=AJC+nePnc1vsop4r0gMH0MPyBkTzpRtJTmZjmkecJC8=; b=3myCfCWP2PBQx1IG2QDeZBzIUY
	HjAoiGUrsfIYr+DUsEDzT4ItWyKopJ+FWAG0TV2a/V2GJ4aVImR20y8zTFS+vVZLBRniy7xwZCtOB
	6JWxLAFpTHTTMMlIf0NmNYjGwnPNfkQ7ze5ZEDd8KssFE7kvrukeEZ3Y4VQzYz8Rm+s59Y6+ETcNn
	++haajsM6IN8H9B1JEs4dO5wKIWzybr6Q64vI/Pf7+Cj4EGge5lrW1y2eA4Yul4xlgHv+KIyQg7KD
	Aifr6ARRqy36DnCxOktOsFiZFu4f2h49d6hp/FWMkPRO8OM5LpRtQFpDMi2HmIQ8Vu2ywODEW1Vqv
	D2HTxJUw==;
Received: from c-73-223-253-157.hsd1.ca.comcast.net ([73.223.253.157]:33232 helo=[10.0.1.116])
	by box5620.bluehost.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.1)
	(envelope-from <re@w6rz.net>)
	id 1u0ssN-00000001Q7A-3COW;
	Fri, 04 Apr 2025 20:03:15 -0600
Message-ID: <9f287720-8bc6-410a-9b2f-0fc15cee6c6b@w6rz.net>
Date: Fri, 4 Apr 2025 19:03:11 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.14 00/21] 6.14.1-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org
References: <20250403151621.130541515@linuxfoundation.org>
Content-Language: en-US
From: Ron Economos <re@w6rz.net>
In-Reply-To: <20250403151621.130541515@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - box5620.bluehost.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - w6rz.net
X-BWhitelist: no
X-Source-IP: 73.223.253.157
X-Source-L: No
X-Exim-ID: 1u0ssN-00000001Q7A-3COW
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-223-253-157.hsd1.ca.comcast.net ([10.0.1.116]) [73.223.253.157]:33232
X-Source-Auth: re@w6rz.net
X-Email-Count: 16
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfOWg2vdtUaAvkv1kYlj77ZWNRfpUJXk1btGU1u/yuj1g+6t45YpbQH0tqV8c75C3zuoHenvTfMPJKANPxeyvdqZWf3W7wDkI/mJhSGZAjIfuttpr4wAd
 MGf+0V/drLhM6rGD2emQfw+416d9SASQp6eCRA31WcYzDD/V8wZ7mcHi1umtgUqOfHGMOtQN+H7qgI5cxeAHxTlqJybsqKmzxts=

On 4/3/25 08:20, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.14.1 release.
> There are 21 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Sat, 05 Apr 2025 15:16:11 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.14.1-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.14.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Built and booted successfully on RISC-V RV64 (HiFive Unmatched).

Tested-by: Ron Economos <re@w6rz.net>

