Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB59267B10
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 07:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748936197; cv=none; b=KC3w7eJBANRZqOVeHs3YeFpyN7SoQbeLw+pBgoS+HNSez3mnChNbBfMfxV3g7/q79GULNK8IOt77KmGz/tkJvXqubIxGARRfoDuHLKrD4/u9NmWGHgHSywdKWQcMdcPFtvEjTaMgV4a9ygxwFWwPg7FIVryfS3Vr89Z+DojSmeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748936197; c=relaxed/simple;
	bh=7nVt3w4p1o3mjt7x8RufK+aUTjrN+RF9zLJ5jUQ6y2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VrvH5GCPmeeAFY0g8VCUA4GFqu6LXiYRDijdlVxLo8ESndJv4iiXOY1NJSw/8PnTLNyjYbTjvJGl66ZIY4TxQgk5LsdgX4EtL+oh5pWx47dUIdLdWxdo8X1lgM42adJmKxRQ8MA/o4vJQB9GAepSWHwR4+a+gZosdj14/nkgMMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net; spf=pass smtp.mailfrom=w6rz.net; dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b=3Oq7utmA; arc=none smtp.client-ip=35.89.44.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=w6rz.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b="3Oq7utmA"
Received: from eig-obgw-5002a.ext.cloudfilter.net ([10.0.29.215])
	by cmsmtp with ESMTPS
	id MLcyuRwNaWuHKMMCIu6HXY; Tue, 03 Jun 2025 07:36:34 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id MMCHu3AJ6J4PgMMCHuHsAI; Tue, 03 Jun 2025 07:36:33 +0000
X-Authority-Analysis: v=2.4 cv=ZaLWNdVA c=1 sm=1 tr=0 ts=683ea602
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
	bh=g83IcY5HwzeWhU3vm9ECHkO0qi3uL+hiwq6xDG14FJQ=; b=3Oq7utmAJMokZq9OKm1xegSOhK
	pulAVIFneSZ2kc9EE8mD9IN5DVaQWIKXOH7ffXUCbGlx8evqiWlyMIQaHEjVlW79+IqUJSx7vcYV6
	prRJwYMihMAX23WQdLRT+iehmOyGKEEUVIzu8zL1ZTHu8G7APSwdl+X27n1JRqNu3x7aykXpxNbAt
	bIZENq3tccs7JzuJXce1M047n0ts+rSsstTcodsm6Dhe72YTqlAFlmkDNhmTCZLEmfJekjGLDCrPo
	P+n2T3SBAgcC2s3sMQD4gwYy1bdJdpN1msIOyWIyS17qRjs69ydR8qMxiqilsiqdxppWApR1zkIqg
	rLXJFzPQ==;
Received: from c-73-223-253-157.hsd1.ca.comcast.net ([73.223.253.157]:48122 helo=[10.0.1.116])
	by box5620.bluehost.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.1)
	(envelope-from <re@w6rz.net>)
	id 1uMMCF-00000002Urs-1zGk;
	Tue, 03 Jun 2025 01:36:31 -0600
Message-ID: <5979fd97-361e-41d6-80e5-f793a481b6c7@w6rz.net>
Date: Tue, 3 Jun 2025 00:36:28 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.12 00/55] 6.12.32-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org
References: <20250602134238.271281478@linuxfoundation.org>
Content-Language: en-US
From: Ron Economos <re@w6rz.net>
In-Reply-To: <20250602134238.271281478@linuxfoundation.org>
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
X-Exim-ID: 1uMMCF-00000002Urs-1zGk
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-223-253-157.hsd1.ca.comcast.net ([10.0.1.116]) [73.223.253.157]:48122
X-Source-Auth: re@w6rz.net
X-Email-Count: 73
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfE+BWp29ZidiD8sqxlMoSJmmzJZuG9wEPSs+B50yWGYADJGvKDmZnKUq7IfSWkVt2ajE/LrGYgokULEgDV//1zAE2cUZhY++uTEWMZZ51xbdOKHngcfh
 566oAQVSdC7Nq1fttEPVJOx0NzuQCBYRFFoHgpNw1c94pbihoNuKur318BNxBjojJQS7+GkxWwXfK13VTmllqcbb3xzsVSS9Oxo=

On 6/2/25 06:47, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.12.32 release.
> There are 55 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Wed, 04 Jun 2025 13:42:20 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.12.32-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.12.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Built and booted successfully on RISC-V RV64 (HiFive Unmatched).

Tested-by: Ron Economos <re@w6rz.net>

