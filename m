Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAA91C3BF9
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 13:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738331882; cv=none; b=mkwNO6uhR5ZMmM2+zqGmxS1QJZ8R8zRiidVHSqFbVJsKzSyr7fCFXeOJroW2e461B8B5IHzxEmCux9vKCl4yceSvJuDeRBH+lAqNmzWEeeMNfFAWhfGLmTbqDr+PbbIs4mzyd0GqK4JUXZTfVrm4XQU3g5jLBZJJMrZjxxKbrSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738331882; c=relaxed/simple;
	bh=s+1qREqT4DAw6rTuocGPrmzUfhIfPLb0O7TbJKIqHz4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R9Q0Ww676P4NBDFCBdd4e8vBFDltW7FEoykM6zNkVlSb+j9D5de0byZpBYtTKG8y2myC7hblHmq5U1nhagrll8QeGZaRWxHHFbE/U+VQOU9i2ZkdmGEowg8Pe6zk2VplXjRako1SWtTq+2Bnc0t/rAwZlsyGotJYzCskAsoyizE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net; spf=pass smtp.mailfrom=w6rz.net; dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b=jH8wbtYD; arc=none smtp.client-ip=35.89.44.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=w6rz.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b="jH8wbtYD"
Received: from eig-obgw-6006a.ext.cloudfilter.net ([10.0.30.182])
	by cmsmtp with ESMTPS
	id do92tN3v4f1UXdrWrtBURg; Fri, 31 Jan 2025 13:57:53 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id drWqtstynCvIedrWrtk2c8; Fri, 31 Jan 2025 13:57:53 +0000
X-Authority-Analysis: v=2.4 cv=fK8/34ae c=1 sm=1 tr=0 ts=679cd6e1
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=IkcTkHD0fZMA:10 a=VdSt8ZQiCzkA:10 a=7vwVE5O1G3EA:10 a=VwQbUJbxAAAA:8
 a=HaFmDPmJAAAA:8 a=Zh1W6WffNNBMdkN8ln4A:9 a=QEXdDO2ut3YA:10
 a=nmWuMzfKamIsx3l42hEX:22 a=hTR6fmoedSdf3N0JiVF8:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3cO7Ym7PHF7fFZ72MQIZAMjfyWw9eZGwU+CWNQ7HhEQ=; b=jH8wbtYD4Dgr52w9bc4ObknDuY
	vT+txp4HQIzy2jRtLn+QebW3yD+4Zi3FhAZdc6nNQ2yOavEY02lHgz26C41Bhan6wP8au6QMYv7zf
	7aLGsbJTs7DW5gIlsPBgit+tXfV90d2Vm0Hjf6NfJYLbnwrC47GIzfTSPLYNz01jORa5DVNYZ00pB
	HYekrbyuWCZAVEWiNsPpAoDPitXAOgJW/W3ZhuldfIg/j9dZQGYyOGiz7bRCC3821xonoVmvfV9Ri
	wO5KYhVo1GgMo4CUrVbljAFZnbrRM5hBYlRKrO7g/8GiXRMWmIzhcWGj8oBDtfZkppVXXfEQHVr02
	1e5crfzw==;
Received: from c-73-223-253-157.hsd1.ca.comcast.net ([73.223.253.157]:32942 helo=[10.0.1.116])
	by box5620.bluehost.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <re@w6rz.net>)
	id 1tdrWp-0016Ny-2b;
	Fri, 31 Jan 2025 06:57:51 -0700
Message-ID: <a6f9d6c0-bef7-44d0-af31-2f873a76c9b7@w6rz.net>
Date: Fri, 31 Jan 2025 05:57:48 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.1 00/49] 6.1.128-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org
References: <20250130140133.825446496@linuxfoundation.org>
Content-Language: en-US
From: Ron Economos <re@w6rz.net>
In-Reply-To: <20250130140133.825446496@linuxfoundation.org>
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
X-Exim-ID: 1tdrWp-0016Ny-2b
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-223-253-157.hsd1.ca.comcast.net ([10.0.1.116]) [73.223.253.157]:32942
X-Source-Auth: re@w6rz.net
X-Email-Count: 73
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfL5C94md8MInaMX6NM7EsfgE9Pfi6q0e4wNkfzSmn1ayu9iM6ORa2m3xsWsn4GBgYW4NlnHY8lVO6R0zOy0M+nnO0ywU18po2nB4F3AHyprm4/ndVlCj
 /ZcJgpoQp7kBuJKDGqxBvxJng5yLhO/AKGcbAERVNMGV564O7Nc1pGsIdQ8KiFq3cWHWxGsA0zl6fP9OLfel52OdJbKm8bXW/W0=

On 1/30/25 06:01, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.1.128 release.
> There are 49 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Sat, 01 Feb 2025 14:01:16 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.1.128-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.1.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Built and booted successfully on RISC-V RV64 (HiFive Unmatched).

Tested-by: Ron Economos <re@w6rz.net>

