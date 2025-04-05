Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526388BE8
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 02:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743820019; cv=none; b=TeKt3G2G0hme9UNT+q+tlX/GrWwToKeXhhegRDE1bSsxkyhee0yww4pmn/1gre+D3iuH/VdVgxmcxU06inMrkiY2S3YJe6FUDeRdM4MyLj/C4w4UkRf0VQUENOxkwZuedZgv20CT54JeXWw4PicsmCi5Tzu8llqcB0EoLUIFZPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743820019; c=relaxed/simple;
	bh=WxH0jTt6iSqU3+h6wFGib2vUiMdKvXTc/JsHrMUbre8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OyrbRqj3MvlHRMWxHJ1SnBqMAvW9jHzpomQ9RMgSnP/pSbFjSlGddO0t2ln4KXTRznmDLdZc29F0YESHVrPqxOWT35WAJc1xzHdcuf/WW5F7aHDHhn9u8n1jTlYY6pczpIsaBRWrddFyU1DOcqlgGvAaa3QmL/ti7BMomwBNJ8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net; spf=pass smtp.mailfrom=w6rz.net; dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b=ygtPOiZy; arc=none smtp.client-ip=44.202.169.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=w6rz.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b="ygtPOiZy"
Received: from eig-obgw-5004a.ext.cloudfilter.net ([10.0.29.221])
	by cmsmtp with ESMTPS
	id 0nZ0uyFAgVkcR0tFIudLT5; Sat, 05 Apr 2025 02:26:56 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id 0tFHumNHkjrgq0tFIuOvcC; Sat, 05 Apr 2025 02:26:56 +0000
X-Authority-Analysis: v=2.4 cv=PK7E+uqC c=1 sm=1 tr=0 ts=67f094f0
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=7vwVE5O1G3EA:10 a=VwQbUJbxAAAA:8
 a=HaFmDPmJAAAA:8 a=CTIpb7JmY0c5bVNJeN8A:9 a=QEXdDO2ut3YA:10
 a=nmWuMzfKamIsx3l42hEX:22 a=hTR6fmoedSdf3N0JiVF8:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=fO12TMZjn73ITDDp+NrD9+Y8VZ+9xez+Umj23sxOTbU=; b=ygtPOiZyUh3I902u8YjZgBEfKH
	G/RifDwbLMxQG32Ebszi95/kYysFUcumUZF6bxd8L2lZK/7B6YMay5dLajIFP1Aw5nrj3IvpxpCoH
	cwrSQsdQh49C6PwFlB3KGKmoGK6taG992JKPrZ8XLXuk65zFqALmaFCLzgORDBfUSRLaTUKqNTEYu
	k2TX01BIcBVmX1Jb7dbmmyLkCvowYF4aMqjmKlCCnOYRdpPUn9flqYWjZhO36T5Z0Lisb4R0O8Gz8
	PSepdckeFCSkjp8cjqw7TtUJ9TbU6oVJMLphO2eGr7zeib0sTK4VVYoYW6sRSzlYtojtW6dHh9tE7
	puN49lDA==;
Received: from c-73-223-253-157.hsd1.ca.comcast.net ([73.223.253.157]:55270 helo=[10.0.1.116])
	by box5620.bluehost.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.1)
	(envelope-from <re@w6rz.net>)
	id 1u0tFF-00000001bb1-33Qt;
	Fri, 04 Apr 2025 20:26:53 -0600
Message-ID: <4d95e502-3dc1-40bc-b7e7-2aa8a26874e6@w6rz.net>
Date: Fri, 4 Apr 2025 19:26:50 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.6 00/26] 6.6.86-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org
References: <20250403151622.415201055@linuxfoundation.org>
Content-Language: en-US
From: Ron Economos <re@w6rz.net>
In-Reply-To: <20250403151622.415201055@linuxfoundation.org>
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
X-Exim-ID: 1u0tFF-00000001bb1-33Qt
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-223-253-157.hsd1.ca.comcast.net ([10.0.1.116]) [73.223.253.157]:55270
X-Source-Auth: re@w6rz.net
X-Email-Count: 73
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfOqeqwdtwMOoOyJRa2k2/VUPYL08mpfUUFKiCfIAHnHlSBufe3Zc8jGMEK9Helnh40kbUNX9zQr8YuCtsi0gPVa8jFesXhR0Ac6uSxx87buMGTM04JA+
 bhomYVvpi6+qNvrxOYa965gWAZHSU6w5FYtsdA/ZkOb4jwDyD3dSNbnGaUpm++oB7SjzPejxX2K9zwbz8as/+G6Gclko10ARzqY=

On 4/3/25 08:20, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.6.86 release.
> There are 26 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Sat, 05 Apr 2025 15:16:11 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.6.86-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.6.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Built and booted successfully on RISC-V RV64 (HiFive Unmatched).

Tested-by: Ron Economos <re@w6rz.net>

