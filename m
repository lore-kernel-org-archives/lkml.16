Received: from omta034.useast.a.cloudfilter.net (omta034.useast.a.cloudfilter.net [44.202.169.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7451C20F063
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 06:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751609075; cv=none; b=I3IsRePHCkTL82SFPJs0rM4iVerZP1PipxSSl3j+G2oAwY2oELwRXganoWwKQb3R3S6/Kn7WGxuFoUyTk68c8SL6vxrnfuaKevPsVrRKRL2nb1t/Wq0Uhu0ogezcUY6zK7qB+1wFY9OvJQf07wiwE7XQrkkVMJImwCztAbTNGDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751609075; c=relaxed/simple;
	bh=3OCzd5BTGn/s4JT1674h6fkTKDdG/cjR5zkZ2g3ccBE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Op0gPTGQO5frZPzODVgkKrmJMekT8cJ0CnO4olG25TxObeM7LEeBVegTWnYs46ON5MvDAu64Xeups4n64+78dgB9yznBddCrLHNxCXyZQO16nSw4vStgtlyttBbUTD3ndGYMvu47OiVYUxfs0dXE4+fVLk6Juj/ibM7VBPx0kJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net; spf=pass smtp.mailfrom=w6rz.net; dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b=LstC8Jdi; arc=none smtp.client-ip=44.202.169.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=w6rz.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b="LstC8Jdi"
Received: from eig-obgw-5005a.ext.cloudfilter.net ([10.0.29.234])
	by cmsmtp with ESMTPS
	id XTlvuiTVlXshwXZXDurlx5; Fri, 04 Jul 2025 06:04:31 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id XZXCu74axTd1CXZXDuxTEF; Fri, 04 Jul 2025 06:04:31 +0000
X-Authority-Analysis: v=2.4 cv=B/Jy0/tM c=1 sm=1 tr=0 ts=68676eef
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=7vwVE5O1G3EA:10 a=VwQbUJbxAAAA:8
 a=HaFmDPmJAAAA:8 a=ZJCAKeS_rTr8ZDEThcMA:9 a=QEXdDO2ut3YA:10
 a=nmWuMzfKamIsx3l42hEX:22 a=Wh1V8bzkS9CpCxOpQUxp:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TlZBlsExbtZHpp9JpBdKHNq+76CAEy3oCuHbciuofzQ=; b=LstC8JdismZmfKNgt/A8MPlYqZ
	iXbu3GxaivOw7ZurjMvvTpgNUcIdyV7wKegzrEw5RUbbdJihIa+V2EKIxHmiZnwoHst5YDeb9MYNJ
	f+EhTrsPWzh1uOBbKwZngUkKHVUuheZyZvheCWgCM2krc/EDZqbQjFbaq3R8CkKNQR9SnZnecJrVq
	tfH8gBabS5F+2xzj7y30yVMtCGtQveKwjpnjpBiLA2FUAyeWSzROuqQqPhx08Mh2APrCRFqfDdnRq
	2SFpjRdm9UWh+u6QGWi/80KsCLd6WYv+MKUVJ18n5IpArl5D3IaqF4g88UVCRdGjpjHhaZVzcXpyY
	ZYoxuRzQ==;
Received: from c-73-223-253-157.hsd1.ca.comcast.net ([73.223.253.157]:50322 helo=[10.0.1.116])
	by box5620.bluehost.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.1)
	(envelope-from <re@w6rz.net>)
	id 1uXZXA-00000000sfL-1Jzn;
	Fri, 04 Jul 2025 00:04:28 -0600
Message-ID: <c64dfabd-cfc5-47f3-aed8-7f9e6fa9bc7a@w6rz.net>
Date: Thu, 3 Jul 2025 23:04:20 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.6 000/139] 6.6.96-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org
References: <20250703143941.182414597@linuxfoundation.org>
Content-Language: en-US
From: Ron Economos <re@w6rz.net>
In-Reply-To: <20250703143941.182414597@linuxfoundation.org>
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
X-Exim-ID: 1uXZXA-00000000sfL-1Jzn
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-223-253-157.hsd1.ca.comcast.net ([10.0.1.116]) [73.223.253.157]:50322
X-Source-Auth: re@w6rz.net
X-Email-Count: 16
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfGz+5BRbBnjwScy1s6aJHp/D0m20NSwd4q47H+vKqfzAhaZA4qxiqDFcqOXvzfy267wUt1ZYNhWqcjTTH+G3A/sSV9T7cVn/SuCocOsYWkZgnUD0zrJm
 uj+LyIQO66v/y/+fNrWZbu4UnoNRnH6hIji5+iAIH+0p0RxvmEYtkWx29PIOsGbiuYtFTnLOlRfbwsAfzTGGEsHSa42UovO97BY=

On 7/3/25 07:41, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.6.96 release.
> There are 139 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Sat, 05 Jul 2025 14:39:10 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.6.96-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.6.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Built and booted successfully on RISC-V RV64 (HiFive Unmatched).

Tested-by: Ron Economos <re@w6rz.net>

