Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC821F0E4E
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 07:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745479879; cv=none; b=umJc085IiI/EgbAlJUyXdT7n6ORvZVTmw0zMQ7gssqiMY+CxrEj0GMRy9VruG0Sabij19y+DA5VOHSu7mZTiPYOCkZ/W0dEdg8oOGDDvZaJgRnRa4WtkfrJgw+JL/8WiqtH7CyVVCp4Pn4Yp1Jp2T2Ij5AEeshBb83FTmXGIxdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745479879; c=relaxed/simple;
	bh=XnrOeLi0juWbuzMD2I8eNSqXfBFQtfX5UKT9+UZO6JE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wujv+2GBl3BU1CeBtLYrmp/9K4ytGkLtW/eb5hbjV5b7apujj67k/yVjEkJNHbWAlGdYYS3EmdAIY/sragKV8D36o8uOJa8J4Nz22J9RsMFgA79YkuCtWVvmQ6NkYfByXuKe/hs3uI+QSL0gaC7wB4KOEXaDBWFWXrkuVIXDGAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net; spf=pass smtp.mailfrom=w6rz.net; dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b=V9txiFPY; arc=none smtp.client-ip=35.89.44.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=w6rz.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b="V9txiFPY"
Received: from eig-obgw-5007a.ext.cloudfilter.net ([10.0.29.141])
	by cmsmtp with ESMTPS
	id 7SVyu9ImZWuHK7r3DuiOh1; Thu, 24 Apr 2025 07:31:15 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id 7r3CuFXUY79Ii7r3DuMkDN; Thu, 24 Apr 2025 07:31:15 +0000
X-Authority-Analysis: v=2.4 cv=FY0xxo+6 c=1 sm=1 tr=0 ts=6809e8c3
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
	bh=gyi3qp3roF0Qo0rUgEApqGKtlUxPjYPjMfuPs5Bg3lY=; b=V9txiFPY54qv1/7PaunIBoQEoa
	RdILJP2I8U9vR8YL1CUedbsDJaUgP2k1EWnpBcNVakKbBtoKXeoK9EEMI7KELA2NFj9Tg8R1FZ48R
	CJCG79liGEzxD23LdkN/+OUHy6Wb9ocbH3fCPEcXkJsK60H4v1hVddd1qKLT29FRxe6ds7de4zw+D
	xljcNIEH0mOeg7Ml8cbCIcNgCqsOOzaGy/YyIJloNjqD0yNA93LTUwGhlVHDJMFQ3rqdRaWqOse6a
	t6oeMVC3xIrtibAqmfkgOEs+rUTtR4dSq+YtidIOdsfvajVrMThdCimM//+baGhEK5gfxRX7a6P9F
	71cwvaMA==;
Received: from c-73-223-253-157.hsd1.ca.comcast.net ([73.223.253.157]:35260 helo=[10.0.1.116])
	by box5620.bluehost.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.1)
	(envelope-from <re@w6rz.net>)
	id 1u7r3A-00000002y37-2afq;
	Thu, 24 Apr 2025 01:31:12 -0600
Message-ID: <78c78c28-c851-4f24-b684-c7f900b4071c@w6rz.net>
Date: Thu, 24 Apr 2025 00:31:08 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.1 000/291] 6.1.135-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org
References: <20250423142624.409452181@linuxfoundation.org>
Content-Language: en-US
From: Ron Economos <re@w6rz.net>
In-Reply-To: <20250423142624.409452181@linuxfoundation.org>
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
X-Exim-ID: 1u7r3A-00000002y37-2afq
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-223-253-157.hsd1.ca.comcast.net ([10.0.1.116]) [73.223.253.157]:35260
X-Source-Auth: re@w6rz.net
X-Email-Count: 73
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfHJikxIncha8SjTzp0CysKyS+dYz196EC4tA/Znyhw73Rn8S1GyDG/iVtbTmY7e6GpELyL5T21B0twC34LD5t3bB4P3wCpPrikEj82t0oc5lC09pe+yh
 4apAl3qYz7gJf7EDepN1jYClhzQCPTzhKy4kJhKmTATOueqoyiK+6x/WbzmakXhMgPBcx6vIV0pBxbViFAGeDmrhAwJtlZO3flQ=

On 4/23/25 07:39, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.1.135 release.
> There are 291 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Fri, 25 Apr 2025 14:25:27 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.1.135-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.1.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Built and booted successfully on RISC-V RV64 (HiFive Unmatched).

Tested-by: Ron Economos <re@w6rz.net>

