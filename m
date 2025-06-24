Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24241C84CF
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 08:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750752886; cv=none; b=oJo2QjbO9WU9l2VfIcUtc/xLjJz0W3M72LoSdEKZEEHhf1/526B+rQpJooKCYFVCpsXMS0O8mq/ENgQSm9o6xDROf5/r8jskPdYHm2FC+qWoTWw5H7RH8W814DfqQ54xGSd4DJnpCrqzfVC3RX8Z54G1i2zmlhcFz3M6awSrqCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750752886; c=relaxed/simple;
	bh=RkBf4nk4I8KtM3ZkoAWYf2hke9fkRxO44SbopsToU6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lcs4KxLPAj5n6/kZU42CJoH6c7WxWmzEUkwJ7+mqEzRWdYlJPpGPjAFiN+n4ZXWow30zB20gFuRmxxCpT5eq8n5rH1l+FQapA0utMMgb7TUlhRKRnMplPFiaQbf6ojxqgoI28Jdaxa6rbzWyeV5QE560b1S4iu4aou1fgNr24qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net; spf=pass smtp.mailfrom=w6rz.net; dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b=o2YHCizk; arc=none smtp.client-ip=44.202.169.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=w6rz.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b="o2YHCizk"
Received: from eig-obgw-5009a.ext.cloudfilter.net ([10.0.29.176])
	by cmsmtp with ESMTPS
	id Ts17uOomwVkcRTynjuAxpO; Tue, 24 Jun 2025 08:14:43 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id Tyniuhbgf5IQGTynjuASwD; Tue, 24 Jun 2025 08:14:43 +0000
X-Authority-Analysis: v=2.4 cv=Y+7+sAeN c=1 sm=1 tr=0 ts=685a5e73
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=7vwVE5O1G3EA:10 a=VwQbUJbxAAAA:8
 a=HaFmDPmJAAAA:8 a=49j0FZ7RFL9ueZfULrUA:9 a=QEXdDO2ut3YA:10
 a=nmWuMzfKamIsx3l42hEX:22 a=Wh1V8bzkS9CpCxOpQUxp:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ggxXCZzoyZzpBF6JAq1N0F4D1piByx1D18khDkcCG2g=; b=o2YHCizkW1Anl8FTlVJE+ldGkt
	INBjDEFp9gDkn6MKBnQX7uH2GdeXw8VaCtpDRFASPm/GCqYDC8kPyIeN2pi5YZG9hJycHziGXV1VI
	suAiIpLyIjtM8f5Sx5KmEKSGZ75Qw/ZfsAJliD+80keYYM5ibIINjMDPaoi5QKnwKUZgH/LqzwJbr
	efT4gKq5EB45atkhdQN1vVG51tPkL9eJXbHHxikjuvJHvuzsA4A931Bhh3XcA/xH4QLEUnylLo/+d
	JPzNVBICyTmxbj/aJbgg7LLI79++yUocjwkGwsEZE1OddfFCcDT77frb9iP2PNhjPhUzgZ1LN+wBC
	s4ldrxrg==;
Received: from c-73-223-253-157.hsd1.ca.comcast.net ([73.223.253.157]:50842 helo=[10.0.1.116])
	by box5620.bluehost.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.1)
	(envelope-from <re@w6rz.net>)
	id 1uTyng-00000002Fxl-1IcI;
	Tue, 24 Jun 2025 02:14:40 -0600
Message-ID: <c8508b09-97e6-4cda-92d9-e11f27d7d73b@w6rz.net>
Date: Tue, 24 Jun 2025 01:14:35 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.12 000/414] 6.12.35-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org
References: <20250623130642.015559452@linuxfoundation.org>
Content-Language: en-US
From: Ron Economos <re@w6rz.net>
In-Reply-To: <20250623130642.015559452@linuxfoundation.org>
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
X-Exim-ID: 1uTyng-00000002Fxl-1IcI
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-223-253-157.hsd1.ca.comcast.net ([10.0.1.116]) [73.223.253.157]:50842
X-Source-Auth: re@w6rz.net
X-Email-Count: 35
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfN8DxGh3bvBwH9Wh8w5pskAHAs1y6d1Ei4VXoAdzRpc22T8wfBaBXsTs8htAu3zAuQuJOrUfb9PnlhnRaFXc25o7W1o65y778zXMsfhCtdPSgnRXbqI8
 771//4bZN7OvCY9PNsqv5cFPfowT9MntVjXVM+pHadA1Umotjpc8Lq0g7mDJqs9QNx6RzXUejlQP3iHd5CIggbvNouZ1D/Xyg2g=

On 6/23/25 06:02, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.12.35 release.
> There are 414 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Wed, 25 Jun 2025 13:05:53 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.12.35-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.12.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Built and booted successfully on RISC-V RV64 (HiFive Unmatched).

Tested-by: Ron Economos <re@w6rz.net>

