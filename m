Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AB227466D
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748422644; cv=none; b=bOKCDLWEjjNSWHHc3GpGxab8FgtPcpYlFgK6ArelV9VPKOj4GevXyHzMOZMlLEpDqztORAc5KWJS+dt6Ng5zK225hzbKDMgOy5IuTXcKkS13deiLQUAXyxwwwQBMbk65cECCqdpYjwNM/arFfSFhoWO/6OdnVxozTFe3wiHpL6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748422644; c=relaxed/simple;
	bh=WqT5k29mabgxiTMmvCIyVa8aqzh5NKbZh6jGUFeRZhE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sSNJIpTIBVfDscj+bpPvfOU5HGAzK8osb8GxZnPTjkkGzEWlCsGbm9812Pe+YQFII0MT/s029i0OqB8v8BxwiS06fIyg0cEy472AQwNt8QAT9+xSwJdk9bUnSjG2YPBf3XW5JAaae57w492WdvRZ89S1ooFXv0XMTzBe4X5VUwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net; spf=pass smtp.mailfrom=w6rz.net; dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b=3IpnPYIH; arc=none smtp.client-ip=35.89.44.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=w6rz.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b="3IpnPYIH"
Received: from eig-obgw-6005a.ext.cloudfilter.net ([10.0.30.201])
	by cmsmtp with ESMTPS
	id KAEnuqfCNAfjwKCb5uhFew; Wed, 28 May 2025 08:57:15 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id KCb4u7FHzZ6h1KCb4uBVAj; Wed, 28 May 2025 08:57:14 +0000
X-Authority-Analysis: v=2.4 cv=ergUzZpX c=1 sm=1 tr=0 ts=6836cfea
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=7vwVE5O1G3EA:10 a=VwQbUJbxAAAA:8
 a=HaFmDPmJAAAA:8 a=5E2gbQE8QDOJjfjLMUMA:9 a=QEXdDO2ut3YA:10
 a=nmWuMzfKamIsx3l42hEX:22 a=Wh1V8bzkS9CpCxOpQUxp:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=83C9954UDhMJIVB4ENt/jwjCY1O8WR2AKglvGvJAkzc=; b=3IpnPYIH318Ajs1M+RLelFaDBZ
	lSXwYShPxZTOXXQb/ScfHQZQAVXbtPw2UdrlMyLIPEgQpEyWNqjgt0wzbEcl9vn9LBk5VFM0cmwTn
	fIn2tCDkdDfwPYZMBA4fijFoRtpTCJcxMeUE8MspWGs7O8e3oUNXS2h9sMDuV2GszOC766Qinb34w
	jlaZdI68gBINWVqVLQWf2rbbpFo5Em9TcNCF1uag5N1ugXCl09PiFTDwL68jxl1rTdljlAaez25ev
	hkS7OIm3KMpCNnpKpR+tHUqlEpm3poOdCQNLruarnlCJVTAfXNubM9dAjdl5bX/dU4oONePUQK/25
	qAS9YEXw==;
Received: from c-73-223-253-157.hsd1.ca.comcast.net ([73.223.253.157]:53932 helo=[10.0.1.116])
	by box5620.bluehost.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.1)
	(envelope-from <re@w6rz.net>)
	id 1uKCb2-00000000FOr-1eGv;
	Wed, 28 May 2025 02:57:12 -0600
Message-ID: <736e7623-d216-4d16-ae7f-afc55502be02@w6rz.net>
Date: Wed, 28 May 2025 01:57:08 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.14 000/783] 6.14.9-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org
References: <20250527162513.035720581@linuxfoundation.org>
Content-Language: en-US
From: Ron Economos <re@w6rz.net>
In-Reply-To: <20250527162513.035720581@linuxfoundation.org>
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
X-Exim-ID: 1uKCb2-00000000FOr-1eGv
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-223-253-157.hsd1.ca.comcast.net ([10.0.1.116]) [73.223.253.157]:53932
X-Source-Auth: re@w6rz.net
X-Email-Count: 16
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfMf8dZzE0OR7ANwJ8aW2h7ge1PksohK9uKfVGHkq0vM53CVf1X+kHv39yFGq5lq5XLPDmOEpYTIcxPI7gZGekmYZ18/LZF1gzfWU79VEVH2ca8vCKcJk
 xU/w3eohlXgtkt7twnrL179vz413bwr7q+yhOMyf5nExt3SenAhfYo1/SS7u5Vl1AyIFYKkb8Bt0n6JNur6FubJIb+yE5PXOkck=

On 5/27/25 09:16, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.14.9 release.
> There are 783 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Thu, 29 May 2025 16:22:51 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.14.9-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.14.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Built (with both gcc-14 and gcc-15) and booted successfully on RISC-V 
RV64 (HiFive Unmatched).

Tested-by: Ron Economos <re@w6rz.net>

