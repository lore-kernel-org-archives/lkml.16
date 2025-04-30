Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C5420E718
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 21:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746047525; cv=none; b=O8J+rbcwz8CZufY8qaxD1HKgLYdVDWj5zpA7A21by8PfCrJowY5o2Dqe0Ni0YIZ0pjz5+6ei0pskk54E4f1KL4moyEU5cL4ZLj2Ga6qkfglx6T4FAjRlTT+d9BOG33I597XDU7s6G+GeGH1UoxTX/dEIPFXoqJkbl+bSMZ+c8rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746047525; c=relaxed/simple;
	bh=GkOhbOV/RyI9gL/+Or0DCnSmH3Zw+Nf4w3vNSwQTUsc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bBQCSvrFjDOLQbYptBrGUtdSPnMqy0xGIbnaxVAgepdo/e84Q0er3aExWGKFXUJMrc4ijF+XLmeUotAuvvNEWrJZFSfZTsAIcLqcFL0of4yUmQMnaZOuLhDLzbXPO/4doNvrSc7mq3gJxnEABQVKY2ybma6iMyhhnHSEUxbY2ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net; spf=pass smtp.mailfrom=w6rz.net; dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b=Hr0aVMcD; arc=none smtp.client-ip=35.89.44.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=w6rz.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b="Hr0aVMcD"
Received: from eig-obgw-5008a.ext.cloudfilter.net ([10.0.29.246])
	by cmsmtp with ESMTPS
	id A3qmuKhl6METlAEiouRzlc; Wed, 30 Apr 2025 21:12:02 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id AEinuF2FvSYnJAEioudwef; Wed, 30 Apr 2025 21:12:02 +0000
X-Authority-Analysis: v=2.4 cv=FIkdxfos c=1 sm=1 tr=0 ts=68129222
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=7vwVE5O1G3EA:10 a=VwQbUJbxAAAA:8
 a=HaFmDPmJAAAA:8 a=X_drXzbwcQU-ujxrCA4A:9 a=QEXdDO2ut3YA:10
 a=nmWuMzfKamIsx3l42hEX:22 a=hTR6fmoedSdf3N0JiVF8:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LSGPeOSJBuiCDhhHIp+GJs/hJyO6g2wPqXqmpaVdDbA=; b=Hr0aVMcDxRLc2LZRxYNCuN3Dgu
	4IAus0o/PoNumoAZSNwayy99OcbFZGmd9N/3KjW8RrIQbivKSSfLINqOTEQbwIYYLYT4iGmV7FP+P
	ZWiyh59qNifs++OIBAsmTFHLju8scfmSXH1mMGC+1YYc3TqPa974eFqCxANRUGW9eRrHEEW/RJyqo
	H8nETTHI3PXmhrqL3OM1JKvP+muxwem0f3nnXE01DgCWW9Ai94bDJYCP4mg3oTeBkI3ufEz0kHIOt
	XGZxvJ2gIN4imA+LiJFA8qGmxBuaA1RobzHGP8OuNOuB8Stb5TV+TrAk+J6JqFD/w+r+G7/dXm/ay
	cD9tqVYQ==;
Received: from c-73-223-253-157.hsd1.ca.comcast.net ([73.223.253.157]:33340 helo=[10.0.1.116])
	by box5620.bluehost.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.1)
	(envelope-from <re@w6rz.net>)
	id 1uAEil-00000000UUc-1upO;
	Wed, 30 Apr 2025 15:11:59 -0600
Message-ID: <ca20aa8c-9828-4838-bcb3-28ad0a1b1d2b@w6rz.net>
Date: Wed, 30 Apr 2025 14:11:56 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.12 000/280] 6.12.26-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org
References: <20250429161115.008747050@linuxfoundation.org>
Content-Language: en-US
From: Ron Economos <re@w6rz.net>
In-Reply-To: <20250429161115.008747050@linuxfoundation.org>
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
X-Exim-ID: 1uAEil-00000000UUc-1upO
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-223-253-157.hsd1.ca.comcast.net ([10.0.1.116]) [73.223.253.157]:33340
X-Source-Auth: re@w6rz.net
X-Email-Count: 35
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfNadfdbZCdjpOa6+RajJd/omnJx+QqaAUqsdBasg0gjmUTHiZpFJf3a+uRYXfqKLSA0I5poa+4HGbdrKdD5+I868Mg2kro2HIuYNuV9dv7XdUUCxF3vY
 KYzG3wwc/7N6HrLDrNSxpfuN3A1IJyPk010VsTi7ys9AFaZI2sQT530e/EmMvSHcGyRY0dFQ4UNkoMgia/GwgTof9AdjdhSuqx0=

On 4/29/25 09:39, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.12.26 release.
> There are 280 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Thu, 01 May 2025 16:10:15 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.12.26-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.12.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Built and booted successfully on RISC-V RV64 (HiFive Unmatched).

Tested-by: Ron Economos <re@w6rz.net>

