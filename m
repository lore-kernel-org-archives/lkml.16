Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72001A83F7
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 01:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747791607; cv=none; b=JTwwQSmm0TGmKNr6oiVacDtATzs6mbXAjr7HCQTbQd1sjKwwYBL7YeY2umeUvlCDs4L1cZiHCMRL1FgbWxPGQQo/yvF5bh/xXrO8+D/3FXnit8BkCBtFl8w5mZb7eYLojhRGkC2anytX1q9Hi9RD0VRdZoiqk6eq+wSUOUPq0oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747791607; c=relaxed/simple;
	bh=OL2Z6Hz1CaJCq+80RIMOXQY9FCZAkCk4tlIi7wMg0Fg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ows8/+WwzU8IkHyykNCZ7o0BqSdafEd0cj9TaRZpj0u9iF0j8J5CJ3GxCZX3XyXiMarmTYj3IHL17MPzfFO/yETI7pyOqZ+rF932DHFpy47VS+aDBH7acuZTvt4w77cVV1oF2dTRPgPflBwsk82dP0oCnKuL+V1cLu8f5xAY25E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net; spf=pass smtp.mailfrom=w6rz.net; dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b=WtUbrjtJ; arc=none smtp.client-ip=44.202.169.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=w6rz.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b="WtUbrjtJ"
Received: from eig-obgw-5005a.ext.cloudfilter.net ([10.0.29.234])
	by cmsmtp with ESMTPS
	id HY21um6uDzZPaHYR9uWiTI; Wed, 21 May 2025 01:40:03 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id HYR9uzmqxq3CNHYR9uaOhA; Wed, 21 May 2025 01:40:03 +0000
X-Authority-Analysis: v=2.4 cv=VpfoAP2n c=1 sm=1 tr=0 ts=682d2ef3
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=7vwVE5O1G3EA:10 a=VwQbUJbxAAAA:8
 a=HaFmDPmJAAAA:8 a=qfBMeBQ8Qh9mIwLNFBIA:9 a=QEXdDO2ut3YA:10
 a=nmWuMzfKamIsx3l42hEX:22 a=Wh1V8bzkS9CpCxOpQUxp:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pNkE+xLmOJ+8pVqastSQn4XE5Z1C7CvzZsWtgCcDmOE=; b=WtUbrjtJTeuIdKJ6V3xpSB/dcw
	ZvWQVLORqSTGU2YjNi7XYgiwDvNkxmuIe59L4kvZKsvVTKPR5zvkmSUNpxv1opOfzyq6gqnrJ3PWn
	pCdO8rDH0mYyW1sB/VQFF+taamBVZD0VqqQYrAuqxda/LkoUGm6kTzo/+JlYlEIWOTjjbsxRkR362
	V4lEq/oP24PpelpLPMV6EHASsrSTN2LKb1lfI9EzctLjlZhNRbZ4nNzCsJN4i0FyXgZDuGT4Pgrnk
	dbISo27dPx0JPz6jJpl/vSSTurapj/97BfneSsxgePZvpiXW83xGAX24n3RqOAIs+RD7fJbV5MaYK
	gBafoqaA==;
Received: from c-73-223-253-157.hsd1.ca.comcast.net ([73.223.253.157]:36408 helo=[10.0.1.116])
	by box5620.bluehost.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.1)
	(envelope-from <re@w6rz.net>)
	id 1uHYR6-00000000vSH-3vHD;
	Tue, 20 May 2025 19:40:00 -0600
Message-ID: <ed0fbc2b-8383-482e-a4cb-69f2a4356576@w6rz.net>
Date: Tue, 20 May 2025 18:39:57 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.6 000/117] 6.6.92-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org
References: <20250520125803.981048184@linuxfoundation.org>
Content-Language: en-US
From: Ron Economos <re@w6rz.net>
In-Reply-To: <20250520125803.981048184@linuxfoundation.org>
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
X-Exim-ID: 1uHYR6-00000000vSH-3vHD
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-223-253-157.hsd1.ca.comcast.net ([10.0.1.116]) [73.223.253.157]:36408
X-Source-Auth: re@w6rz.net
X-Email-Count: 54
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfEueohzS+VR+2u2a/Ahx2p8sZTusYRr+R6gYyBmaBYoGSBH2kHEy7EDV3keCuBRsb0MipP466vemf+ndfVEM+6erxZlkU5mWCIDRpr4XvhQAhQA/t7xR
 PmoddBIqwjvORUEwgtkYldlEDucuIoKDx85BshXVmLOayF+ruViN6VKP4bZ050AcDdB8YuLWHdnlAuEUbOnGMB4HcNEptc9iK5E=

On 5/20/25 06:49, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.6.92 release.
> There are 117 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Thu, 22 May 2025 12:57:37 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.6.92-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.6.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Built and booted successfully on RISC-V RV64 (HiFive Unmatched).

Tested-by: Ron Economos <re@w6rz.net>

