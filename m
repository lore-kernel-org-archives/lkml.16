Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D27257455
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 08:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750752462; cv=none; b=LxvPzc4GI+ywolfHtgXBaMFL0uG200+1xdCJdZyFE08hJS/Nbt7ku1LA80StwbGttuTtVvo0IzAR8JPw1bWKiP4ZviWNyOOy4A9Yv5LdQPqz6OfGRVVo79bMGnnHKCVTM1bZX/Zrz484H5JzoFlKb9Al4N9k0BRaWcZ1lPazrXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750752462; c=relaxed/simple;
	bh=bcr7ZsoDIxCVOP86HeZSlurtef12X/747KFw9IGHX20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mgibz7ItIyUU06G5dhj73Qmegad86jLWCFulTmM+UirTFgeMDJgDHQ1g9SODvCkDLJRZ+m3+BSxnYwcWNk4gA0ScR1WOEGOqcoxMv7gYgY8VtAEZU9LZqpkErQmWHz27nYpjzYjxXkAZLKnRGgBQto9J9ZpIYkXs09SklTI2tZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net; spf=pass smtp.mailfrom=w6rz.net; dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b=Fao41GU0; arc=none smtp.client-ip=44.202.169.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=w6rz.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b="Fao41GU0"
Received: from eig-obgw-6003a.ext.cloudfilter.net ([10.0.30.151])
	by cmsmtp with ESMTPS
	id TieTuMQRSVkcRTygmuAvM5; Tue, 24 Jun 2025 08:07:33 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id TygluAHA1h9ZxTygluyiHl; Tue, 24 Jun 2025 08:07:31 +0000
X-Authority-Analysis: v=2.4 cv=GODDEfNK c=1 sm=1 tr=0 ts=685a5cc4
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
	bh=xFO6NK3ONdTJZbcH9gQ3lLvShx7ldiwcq/fdKK4epLE=; b=Fao41GU0zgS/RAeXpf/hDrCEgw
	D3aFqiPqy7avOdaCzGQynxn0XaCohepOU2VLvWAbgA76NLv72RuKCRv+Rdj8unqQ3Zwj17aQiEuuE
	CLOkLDgZW7L4hfzYY+6exAwNBxD0TM2f+s1kMGA59VRYqikzfcx2+gpSFA3auAZkIjoh8frdljpgO
	Sk4LsUkSX0jyvEAFnT6hn/dgoBUtR4awqHN9m/KchvKSDMoUy1CNR56X0Lh4Pda0lgdCPz+YGZT5+
	C7oovy8V8yW/0P5AVM3Onq1kAxYT5Osh2EY+7jmQIeoLnkKkps8CMNlQSVx2UK+7RIZiaYsw7isZX
	x/vZBMTQ==;
Received: from c-73-223-253-157.hsd1.ca.comcast.net ([73.223.253.157]:47784 helo=[10.0.1.116])
	by box5620.bluehost.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.1)
	(envelope-from <re@w6rz.net>)
	id 1uTygi-00000002D2m-2Sr4;
	Tue, 24 Jun 2025 02:07:28 -0600
Message-ID: <e14cda6a-d50b-4b7a-81c0-4c2e5fb8b447@w6rz.net>
Date: Tue, 24 Jun 2025 01:07:24 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.15 000/592] 6.15.4-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org
References: <20250623130700.210182694@linuxfoundation.org>
Content-Language: en-US
From: Ron Economos <re@w6rz.net>
In-Reply-To: <20250623130700.210182694@linuxfoundation.org>
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
X-Exim-ID: 1uTygi-00000002D2m-2Sr4
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-223-253-157.hsd1.ca.comcast.net ([10.0.1.116]) [73.223.253.157]:47784
X-Source-Auth: re@w6rz.net
X-Email-Count: 16
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfPyvrPoi1+iFhvi6bixntYvzoG4rjKJkYCO+QBm21aJ7hYyQSEZyVNv3w/Fvvye4DmeRCLh36wJL7jtNHwZRp+TkukGBuLy8ai3zCc9g78Odi9A3GvgD
 zwLa/B1HFAqv4JXpuTN1N/58HBLk2wwqtTP1vSfjlfecZxPzfHo6MWl2cAtjl18Sk5OS1re6FcfEDP5VhvITVadZU8eMcxtBAj4=

On 6/23/25 05:59, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.15.4 release.
> There are 592 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Wed, 25 Jun 2025 13:05:55 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.15.4-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.15.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Built and booted successfully on RISC-V RV64 (HiFive Unmatched).

Tested-by: Ron Economos <re@w6rz.net>

