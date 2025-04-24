Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EF21F1936
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 07:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745479471; cv=none; b=Tb7xG4YhchdmQ891Ufjb5r8QV4Es+nrejJgpqA7wnlgTCvY7kBH87I43DkJoH8yxb+nelOFNY/DrAcDMSYpqyCQsiod/8Xt48ypyzaFQiVgkUK4qIL0H0KypaTW6HvH8ivVjFK1FvN6fnuQuNJTZwGCl8JxkbripSMNW9JUhYdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745479471; c=relaxed/simple;
	bh=SUiXSBVTodsrxvc8tpfjLeU3KmNzaV31IvgnMHDrvC0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M4HWGqCcYeMoOV33ACAgp7aU+3FsUpjViJ4OpCjpHQLx0EhOgGdoqKz4V4dRlBVyrG/+jGwj/uRnRDL9Tjs/ukz2QqG8f4hLZYKLy24ruiLgnvpy27daqSluV3X/0iIi6Y0ADCe0fWKRCvn658V4kcmh0sXNEqBwsXbA7LSkCWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net; spf=pass smtp.mailfrom=w6rz.net; dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b=JEertdZn; arc=none smtp.client-ip=35.89.44.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=w6rz.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b="JEertdZn"
Received: from eig-obgw-6004a.ext.cloudfilter.net ([10.0.30.197])
	by cmsmtp with ESMTPS
	id 7qHZu50i4Afjw7qweuCncp; Thu, 24 Apr 2025 07:24:28 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id 7qweuvDBRRlrs7qweuvcDV; Thu, 24 Apr 2025 07:24:28 +0000
X-Authority-Analysis: v=2.4 cv=Qamtvdbv c=1 sm=1 tr=0 ts=6809e72c
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
	bh=X0g7uYtjAU900BSEm/gH4H5kkUda235ZpSk8sDLp9FU=; b=JEertdZn1xU8EIvEHfORzbQfYl
	Ssz0j4gC+phdcnVPUbgBp+Wjcq/e0o4nTzpqJzHmbt3VI+WCTNrIYrAOYdiUHhyjNw9Uxa/k7ilLH
	ucxTvAsA9gG8E6pNoeCgPYGx9TTn+LNYHssLvaetB8bzGOr88sKGeq7JD5d/kPZR2TMcY41s8XJIa
	7gLouEGTxOvNUcnEK+zdLXCAohAfoihSoXtBwSF9qWea7eyCOgPg6mwASy6Xn5zRKRyrRaIBBzhz0
	Yx9d2VjcETuRPmVH5zefh754mZgJb4fr5nHVEN0Y359fnxZMIK16KhPr93wq9L8IyRfvgt3VyNj22
	WMW0csXw==;
Received: from c-73-223-253-157.hsd1.ca.comcast.net ([73.223.253.157]:41186 helo=[10.0.1.116])
	by box5620.bluehost.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.1)
	(envelope-from <re@w6rz.net>)
	id 1u7qwc-00000002ukl-0vxZ;
	Thu, 24 Apr 2025 01:24:26 -0600
Message-ID: <dbf52b63-df88-40a7-9a7d-2cde88d62ba9@w6rz.net>
Date: Thu, 24 Apr 2025 00:24:22 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.6 000/393] 6.6.88-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org
References: <20250423142643.246005366@linuxfoundation.org>
Content-Language: en-US
From: Ron Economos <re@w6rz.net>
In-Reply-To: <20250423142643.246005366@linuxfoundation.org>
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
X-Exim-ID: 1u7qwc-00000002ukl-0vxZ
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-223-253-157.hsd1.ca.comcast.net ([10.0.1.116]) [73.223.253.157]:41186
X-Source-Auth: re@w6rz.net
X-Email-Count: 54
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfFbKZaeGDBbHWRNmTdWUbUjO8MqLD55oHcdXlHxTRj2s2Yn6xkQIxTTJl6KRUVJvZYe6iTK9+47DXviqgcbDNwyluOLyatUlnb/UYdtCs7m4dNR4wsU0
 BfpKGGFPqVGY3hRlUgkIb3L3bcdacc/aBzVhqh3Pa5IzrSw8SOqf/dmkACfZ4Qeqx+p+9h6UP5BDZFWtMIfHv129Sy8oXjVHq00=

On 4/23/25 07:38, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.6.88 release.
> There are 393 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Fri, 25 Apr 2025 14:25:27 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.6.88-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.6.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Built and booted successfully on RISC-V RV64 (HiFive Unmatched).

Tested-by: Ron Economos <re@w6rz.net>

