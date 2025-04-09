Received: from omta034.useast.a.cloudfilter.net (omta034.useast.a.cloudfilter.net [44.202.169.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8D4219A9E
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 07:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744182131; cv=none; b=GpJ67W0k2RyFIcejUJ13b79bfOicsbVhvmzcxjgIo1KF8t2YHRBEYHJDw31ulQZ4zMKxzoVXh4okivi/LMKMWOrvF/fD5faDcuJ/xHfor0xt9/Az1/DvTDgmFF6mVM/0tXiw61YfvgWe3dCwcamiTqjIhhCGakzMrar+UYFMctk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744182131; c=relaxed/simple;
	bh=LYOxysk7LpLeibzmXywLU0KOzfGt6ylPgoDtIPwcId8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kSQciipbbNtT08OPZs4BLpx25LkoBbitLv6OEIAZxFYAq1diKoJSkTyeR1rdMP1cgbKVLZIQKHFISpmTQ/y96zKsPRGOlCDD4Bg4tbPqkezGxFoqLB8CTLwXyj+yE/IVI4d1zM/kvwor9ZtQn+oBPYw7M5BmGGYsAGORKv0Days=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net; spf=pass smtp.mailfrom=w6rz.net; dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b=0rz7Pa/U; arc=none smtp.client-ip=44.202.169.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=w6rz.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b="0rz7Pa/U"
Received: from eig-obgw-6010a.ext.cloudfilter.net ([10.0.30.248])
	by cmsmtp with ESMTPS
	id 2ANqutS86Xshw2PRhuTlpv; Wed, 09 Apr 2025 07:02:02 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id 2PRhumOVUUuTA2PRhuvW7v; Wed, 09 Apr 2025 07:02:01 +0000
X-Authority-Analysis: v=2.4 cv=caLUrGDM c=1 sm=1 tr=0 ts=67f61b69
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=7vwVE5O1G3EA:10 a=VwQbUJbxAAAA:8
 a=HaFmDPmJAAAA:8 a=49j0FZ7RFL9ueZfULrUA:9 a=QEXdDO2ut3YA:10
 a=nmWuMzfKamIsx3l42hEX:22 a=hTR6fmoedSdf3N0JiVF8:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0W9ZJ4sf5g1JPoPztzuh32ONwPdai1ebV30SG+aO88Y=; b=0rz7Pa/UnlIhoS0XzrofJptErB
	nxeH/0C3UHg1Gn43uBbNOdJZ+2tfSQzxEm2M6BVQJ1gHAP6fACnJJ2Gmh8VHvwi3/F+kSO4nPM+ob
	71GdYx7HsKytQ0aAShILMCoHyIxlfmQczRoQDfz4NkeeLNGcGVloG2lgRxHKpbCCyr7Usafx8zsSN
	HBUfJhFH0ECna1rRUwcTroTNGpTNZmSnaErR1xkExoCECnGzx3bX7z+3QZkWfPGt/XYewHNlPLfQI
	EVDVx3dqAeiZyPpyib4MDnmvO8/FiW/NQFLzf8Y0QvPTJjSQYjBczk8zWzWrGBb0oe7roulj+G98z
	UG2fcOAQ==;
Received: from c-73-223-253-157.hsd1.ca.comcast.net ([73.223.253.157]:43768 helo=[10.0.1.116])
	by box5620.bluehost.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.1)
	(envelope-from <re@w6rz.net>)
	id 1u2PRf-00000000SbI-0uUY;
	Wed, 09 Apr 2025 01:01:59 -0600
Message-ID: <e4b882ee-996f-4da8-8ccb-ae9699b91110@w6rz.net>
Date: Wed, 9 Apr 2025 00:01:55 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5.15 000/279] 5.15.180-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org
References: <20250408104826.319283234@linuxfoundation.org>
Content-Language: en-US
From: Ron Economos <re@w6rz.net>
In-Reply-To: <20250408104826.319283234@linuxfoundation.org>
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
X-Exim-ID: 1u2PRf-00000000SbI-0uUY
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-223-253-157.hsd1.ca.comcast.net ([10.0.1.116]) [73.223.253.157]:43768
X-Source-Auth: re@w6rz.net
X-Email-Count: 16
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfAiwFwoNU60tOn7+Fe/obaAOSXUa6vNXJxfjyulGyKHxB1Jp/FMcFoecULcvAmdGrHkHhqRFdppZKH6co0FsFz2KAPmrutVDGtIxTHUZyPynq4WzoCZV
 pURy2Cp4SCtd98BKOjs8x+Zrl7Imo9qtVS8bRx3yLZp2jJfYTIuzrhBJN/FV13n/Bc4knMwRAzHXgrgiosP4SuHoChmdZGxhKP0=

On 4/8/25 03:46, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.15.180 release.
> There are 279 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Thu, 10 Apr 2025 10:47:53 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.15.180-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.15.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Built and booted successfully on RISC-V RV64 (HiFive Unmatched).

Tested-by: Ron Economos <re@w6rz.net>

