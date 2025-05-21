Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5E117BB6
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 01:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747791988; cv=none; b=GLjs4mwlaN7AUVuuO4sAS42EmG9GeVvHrBCyBo+cIXZrbdKysAx5/gtbAhEvylXcUygNX5dkbWurCkoU+IoTkI2TiMYxO2eN7HjuBaaDXPgclawxshhA/RcX+m0ta1qWD0zx3VVHECbooNvTX/ifUad/05ERcY7R74CZeMlNkqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747791988; c=relaxed/simple;
	bh=jAaJokIa13x3LtNmWW6+l9S8jnI3Nb2Pj+J5Zlm1ZZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C9khvTJEQoUTcdeFeEGPZmo+6K4wF+vhLo1UGzoL+vgWovf6EzRVmGvjhN1zRDIWIEzaJIB+ZJoQCqWsquETlUOnKEPqj7csKOOFyGEfJXWhfbNm+Z0IDBG5PMJEvalYmDOwi9AswBTSFG/+bB6iwU0mv7pDTD+lCSfPD6HrIMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net; spf=pass smtp.mailfrom=w6rz.net; dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b=qsxXpTcV; arc=none smtp.client-ip=35.89.44.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=w6rz.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b="qsxXpTcV"
Received: from eig-obgw-6010a.ext.cloudfilter.net ([10.0.30.248])
	by cmsmtp with ESMTPS
	id HTAHuFc7uAfjwHYXKuh5e1; Wed, 21 May 2025 01:46:26 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id HYXJuaAj70jHiHYXJu5bjh; Wed, 21 May 2025 01:46:26 +0000
X-Authority-Analysis: v=2.4 cv=Jsn3rt4C c=1 sm=1 tr=0 ts=682d3072
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
	bh=yeJFc+6PtYF3NLLGJK8JkKqj2yUg2IAE5AzfEkYncNw=; b=qsxXpTcVvn2yjIO85KlczVA+ky
	8PxptAbS14KBsVcjI3MdIooxhMX8oQzKOqZlXIH3I+jUx7BRu9ugTirV8gdq+p5bT1aEi4grux4Ot
	G8tzavxVSXCLsQkTMqWTtTjus/7+MhApWTvo/Zvi8LF1rK0lUyIj3tJN0SrEC80U4RWSNsXip3mgq
	dZhpUKOnzQ4riApsnPVkRuIQQpNAGqYMBbSGLyb9v3rfuci3R38rFIFIVoeOXV8cOGxnwipUEbB4v
	8YwUAYKgk9gTawHo3MXMxbQmzttvRSuqkP0jfdgkVhCaj26dnmOIXCY9WLFHGptzsJf/MEzNJqRP9
	OsdavB+w==;
Received: from c-73-223-253-157.hsd1.ca.comcast.net ([73.223.253.157]:60844 helo=[10.0.1.116])
	by box5620.bluehost.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.1)
	(envelope-from <re@w6rz.net>)
	id 1uHYXH-00000000yOS-2SGv;
	Tue, 20 May 2025 19:46:23 -0600
Message-ID: <12c3adac-412b-48b7-8a8d-4fc195f16a34@w6rz.net>
Date: Tue, 20 May 2025 18:46:20 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.1 00/97] 6.1.140-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org
References: <20250520125800.653047540@linuxfoundation.org>
Content-Language: en-US
From: Ron Economos <re@w6rz.net>
In-Reply-To: <20250520125800.653047540@linuxfoundation.org>
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
X-Exim-ID: 1uHYXH-00000000yOS-2SGv
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-223-253-157.hsd1.ca.comcast.net ([10.0.1.116]) [73.223.253.157]:60844
X-Source-Auth: re@w6rz.net
X-Email-Count: 73
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfGKsA+AfGrfNcYAAPDgAbnEzpOpjBwJBF4x4vEFMONXarXlDEOVMlyeuN8YRvwnf5s6xc/jvp9y6y20wOYVCu3NcEtwihkP929Pb7o2t2Y1a4WCYd5cW
 wu0sMOo653fdBdm9dmjPpjN8OQYiXAByl/ZqMDOJh5R/+Jrpn1iv67A9tC3W3sPzvSn4uCEooFWF6nrYVygxIA+rZRoO6t0AvRk=

On 5/20/25 06:49, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.1.140 release.
> There are 97 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Thu, 22 May 2025 12:57:37 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.1.140-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.1.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Built and booted successfully on RISC-V RV64 (HiFive Unmatched).

Tested-by: Ron Economos <re@w6rz.net>

