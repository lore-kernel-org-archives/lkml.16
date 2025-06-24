Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6BD257AC6
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 08:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750753767; cv=none; b=oEpi4TTxt5zSTPt5Zz2/B+72Pa/fsnyHAP25Ie7aRpCjw5XkRAL6rwIQJToL3mF1VN2bV796lYX16dEDpshUrziLPRFDt4laIfTCHVtZcWvA/ysoErWNFdS9wWm1oBCVj3zPwJfhUzoYn5NZKqgOpQwuB7MpTsZYsW/LFW25UFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750753767; c=relaxed/simple;
	bh=QO0Mf2U6JVrx6SZU1oafEghV15ZUc9oWhEPBNQSJwNg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jtsD5Qb9zhND0YQcFfvox+4RKB8rd8N8/ol0IO5n+vB7AAB+k11gD9hV+9aRiIcXMbAHXcMwH9MaCzbkTAe9C2GuVO6g4Qpm28fk3HXdihvIk7rcX5HquphCZi78BOSCAzR2O1VegOfJ1sADExNCpNjolViM/8FyRNCPYKOSLYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net; spf=pass smtp.mailfrom=w6rz.net; dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b=dgIMN4Gh; arc=none smtp.client-ip=35.89.44.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=w6rz.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b="dgIMN4Gh"
Received: from eig-obgw-5001a.ext.cloudfilter.net ([10.0.29.139])
	by cmsmtp with ESMTPS
	id TwhPu246OWuHKTz1ruqZVo; Tue, 24 Jun 2025 08:29:19 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id Tz1ruo7me0xjjTz1ru4vvB; Tue, 24 Jun 2025 08:29:19 +0000
X-Authority-Analysis: v=2.4 cv=dPZtm/Zb c=1 sm=1 tr=0 ts=685a61df
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
	bh=s5aijZbevkh5I9aHuEFr2NCgAbJYae6Xa9A1uqToXKA=; b=dgIMN4GhQMw8kVT+V6ldYNFqXc
	flVjHLXXrdGL4R9JNJqD86keuZHfqVdIbRp/cHPSLwZGTywX7DT3mzO2H5+/CFbjn3VN9saYKAZSX
	wtX42MJVWiNV3OIxBzBV6JaSBEO4ahIgBpCHGc5NJezsTGm5zkveYG7B6oBB7uhE/H3ziOm0iZij1
	YttPyy2TcOXqi9goLfxEIIwQVKMgW0A1vl8RN9nW7RuUwMohk3ATvoww6tS6UqkUqW5CzDuMUDob+
	XmM15J3QtThw+2SAgig1DmRVsu1i/wGN3K0C4X3QuUHtz+L6WE2xsVYCylsUWWy/ofzh879J2uDtP
	zs90qVEQ==;
Received: from c-73-223-253-157.hsd1.ca.comcast.net ([73.223.253.157]:42752 helo=[10.0.1.116])
	by box5620.bluehost.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.1)
	(envelope-from <re@w6rz.net>)
	id 1uTz1o-00000002M7p-1iBZ;
	Tue, 24 Jun 2025 02:29:16 -0600
Message-ID: <ba750bc8-976f-47ac-8d62-b7577069fa62@w6rz.net>
Date: Tue, 24 Jun 2025 01:29:12 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.1 000/508] 6.1.142-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org
References: <20250623130645.255320792@linuxfoundation.org>
Content-Language: en-US
From: Ron Economos <re@w6rz.net>
In-Reply-To: <20250623130645.255320792@linuxfoundation.org>
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
X-Exim-ID: 1uTz1o-00000002M7p-1iBZ
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-223-253-157.hsd1.ca.comcast.net ([10.0.1.116]) [73.223.253.157]:42752
X-Source-Auth: re@w6rz.net
X-Email-Count: 73
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfMAbG2CCICGhHYXbuyPMrktnbFS1Oo3lAr+axob5OZ4i/IrECsGsjVcFUo+kIA886CE4zeBxU+8Hgnthed7FqH45XfVzbEgDOMO+rZR/mqemf9DwkYvd
 1fjeFyV1VBBn+6m4Bou2fTPOh1YQB9ctWG4V/NXxOsqwOWNSgu5fpBA7sGKOWVeG8DanjvIlVxyFyHZ8IrEHZP1HB8r5hzeEeTs=

On 6/23/25 06:00, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.1.142 release.
> There are 508 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Wed, 25 Jun 2025 13:05:52 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.1.142-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.1.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Built and booted successfully on RISC-V RV64 (HiFive Unmatched).

Tested-by: Ron Economos <re@w6rz.net>

