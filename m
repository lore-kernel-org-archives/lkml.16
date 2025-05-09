Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69705272E45
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 07:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746776990; cv=none; b=H2sC/NEPzil7eE3cKuZoUXKfoLv5q9m697LhWbNkngAlnGs7OUvBEirQBY7eP+lHqIzQC5p8GA6kAOyCtPRvDJr6osUkyMnSX5jU4o28K8OVOrujGWh0X3N9WH00jRjxmGtuzYRnSV9SdwM+M1iaciAdCFZF+ENqZLHsWFQduC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746776990; c=relaxed/simple;
	bh=8DBiVFxTixrtiQG+3fkA6cwV+Bl/+i4GlK04eWSXcTg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QewvjEV8/LFIypP0tKO9adqWzlidK9aKhLbxvuVFVCb363sE+hf/6YBrkeOq87OJd0+jXAMpzKiw2B5LsoACoFNXfgzeSa9thwryZpP7durlxxVSVXUyZhb119aVB/qiDHYkyAiNMyAB1libIoExLaYh5fS8FrkcL6zqGE8e3Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net; spf=pass smtp.mailfrom=w6rz.net; dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b=1sWWA01l; arc=none smtp.client-ip=35.89.44.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=w6rz.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b="1sWWA01l"
Received: from eig-obgw-6008a.ext.cloudfilter.net ([10.0.30.227])
	by cmsmtp with ESMTPS
	id DCw4utQemf1UXDISquxMEp; Fri, 09 May 2025 07:48:12 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id DISpuKvtTyiSgDISqukyBo; Fri, 09 May 2025 07:48:12 +0000
X-Authority-Analysis: v=2.4 cv=RI61HZi+ c=1 sm=1 tr=0 ts=681db33c
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=7vwVE5O1G3EA:10 a=VwQbUJbxAAAA:8
 a=HaFmDPmJAAAA:8 a=49j0FZ7RFL9ueZfULrUA:9 a=QEXdDO2ut3YA:10
 a=nmWuMzfKamIsx3l42hEX:22 a=hTR6fmoedSdf3N0JiVF8:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9i7u4wcDJ1b1hBDRDc+vpY5kyCY22Gzjhf2xPNXzx1I=; b=1sWWA01l87ArC8td5xeXU+FwnH
	1+B/bdng9stw/3vQ6xTNOsknXOo1DGPM7z3A8qFxhk9hEF1QkaBx2EdPQXRYZn4begewrgQ9nvJ0I
	CDbUS16aUvaNrIxwY2ZqNeMBBpdKiK41xLDvP85+xppqysocm9W87hNfF05yH1SDTdN7LaH7ZGx0X
	pG6ifOvMYqlmTjMHo9p25fjmk1uMFDixDNjF7bPC3sYD+nHTvBc1WBZXvT5uhGzWyE66oP6WHR+a3
	9uOE+cRxDDwt3b1MVYTe/gqcpX9T4aCAHkBLN0yaFiHZhIquNpoREdqHlq3sQZmb6Ru8aKFwLZ/ku
	YMOZRsRA==;
Received: from c-73-223-253-157.hsd1.ca.comcast.net ([73.223.253.157]:36240 helo=[10.0.1.116])
	by box5620.bluehost.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.1)
	(envelope-from <re@w6rz.net>)
	id 1uDISo-00000002cBN-2i9C;
	Fri, 09 May 2025 01:48:10 -0600
Message-ID: <c83c891b-b7bc-49b8-811e-1fa9a2453f65@w6rz.net>
Date: Fri, 9 May 2025 00:48:08 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.14 000/183] 6.14.6-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org
References: <20250507183824.682671926@linuxfoundation.org>
Content-Language: en-US
From: Ron Economos <re@w6rz.net>
In-Reply-To: <20250507183824.682671926@linuxfoundation.org>
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
X-Exim-ID: 1uDISo-00000002cBN-2i9C
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-223-253-157.hsd1.ca.comcast.net ([10.0.1.116]) [73.223.253.157]:36240
X-Source-Auth: re@w6rz.net
X-Email-Count: 16
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfHOdZg/uJL0LhbaWsRnOukwz3Xmx8BOOSmm6hKW4156ATeWnOe1CMngI6hVKTnmp7Ah5Cx+/2xJ4j2zpXMu93mg69pdJnv26Uel9If3U2P6IAs3dQYRY
 G7Q2ympaWys4QeN2PPXJiuT5IJlu7UOw4clQ/ka4R8Nc/795nh0Jq3nZ8vyO6HcR5uM++fGZaW7/naJI8MyucCuNqtevXR+XWx4=

On 5/7/25 11:37, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.14.6 release.
> There are 183 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Fri, 09 May 2025 18:37:41 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.14.6-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.14.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Built and booted successfully on RISC-V RV64 (HiFive Unmatched).

Tested-by: Ron Economos <re@w6rz.net>

