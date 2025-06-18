Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2953F1891AB
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 06:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750228508; cv=none; b=WMXlm8iQD8u0dHgAXAH3n1jc7cRwPihUeUU5LfxvGwniGMKVRFVZNAh/9ImX2Pxir8Do++41y9s3MVegjoKTw+70tkYcw1oK11xN0T2JrWEkLZCc7TBC/jRZbOJdU6r1jONAAE2oXyWQOwoJfzS7wc7kYzXfnQSVvd1CBW/P9LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750228508; c=relaxed/simple;
	bh=ByH+GehF+7AQqxVrVYR9J0AR97qRkoBK7j98J7tqV3A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uw9qT/9rnJAW0iP0TDa7l1LJZBwpdZ/moji9N4/xYhuqdXDZCqlKJBvekXC/HldTaSIKkbvvuBYkx8M6WjSqr5nefMZTzmLANKUWXcJhfPsRATlJwQhMR9Evc1N6v4Lk7EoeRToRiaEuiHZVLszMVVENtZGtK0qeL0dmLJx7jag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net; spf=pass smtp.mailfrom=w6rz.net; dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b=g51kPjpm; arc=none smtp.client-ip=35.89.44.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=w6rz.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=w6rz.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=w6rz.net header.i=@w6rz.net header.b="g51kPjpm"
Received: from eig-obgw-6009a.ext.cloudfilter.net ([10.0.30.184])
	by cmsmtp with ESMTPS
	id RkuuuUDzGAfjwRmO1uZBZR; Wed, 18 Jun 2025 06:35:05 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id RmO0uYMHYSPIxRmO1uHjMg; Wed, 18 Jun 2025 06:35:05 +0000
X-Authority-Analysis: v=2.4 cv=MdZquY/f c=1 sm=1 tr=0 ts=68525e19
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=7vwVE5O1G3EA:10 a=VwQbUJbxAAAA:8
 a=HaFmDPmJAAAA:8 a=8e0ScQSuYsqgW4bfh7MA:9 a=QEXdDO2ut3YA:10
 a=nmWuMzfKamIsx3l42hEX:22 a=Wh1V8bzkS9CpCxOpQUxp:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/3XgzfU9xPdnPwA+n0vnE0mDOoy0irOqWJ5i/GyRTVA=; b=g51kPjpmVkPSqNjEJy8nj5m2LP
	8R7NR4CHsC5MHBgOmuzDYChxOyOLlnhR7Z2yTDUN44mw5KZaGgKFAYP+ZefkafI4+XYOTGqvdNRq+
	lOh8kebr6mUNmbKFpRa7wXUvsasBPx2KFjjRtiUNLo6M7NkpFGFPlTdc9VUqwjhUonuIkKhhPPNm5
	CPbI/zzlXeCoxf2x6O/vPtOlAQitY9sJagk9q8DrlhDh25720HhECcsMzs2E+yNOQ/HVDjW09qV7Y
	tXHMqfTTNMkM6dwjJnI8RZdB/1grvNKVg10u4V+4+/XbSQpABbYb/bcN/EHaTI7kyfbKTpjmmrBct
	Sks5Rnjw==;
Received: from c-73-223-253-157.hsd1.ca.comcast.net ([73.223.253.157]:35296 helo=[10.0.1.116])
	by box5620.bluehost.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.1)
	(envelope-from <re@w6rz.net>)
	id 1uRmNy-00000002wxV-1zLj;
	Wed, 18 Jun 2025 00:35:02 -0600
Message-ID: <9d27d032-d050-4ee6-beaa-6523cb4ce3e2@w6rz.net>
Date: Tue, 17 Jun 2025 23:34:58 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.6 000/356] 6.6.94-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org
References: <20250617152338.212798615@linuxfoundation.org>
Content-Language: en-US
From: Ron Economos <re@w6rz.net>
In-Reply-To: <20250617152338.212798615@linuxfoundation.org>
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
X-Exim-ID: 1uRmNy-00000002wxV-1zLj
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-223-253-157.hsd1.ca.comcast.net ([10.0.1.116]) [73.223.253.157]:35296
X-Source-Auth: re@w6rz.net
X-Email-Count: 54
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfG+M0txGEN2gBL1wRz2LccCsjEC918OjSaxgbYv0CjVYJcpGq3gvpaI7LOFm5eZ5cC05XePhxXMuweTE7thUSHNQg2EQXv45GoO4Sau8gsI0AvbDDYaM
 VzfHJ93a3tzmis4kzEfer+Qhow1qCUPg+5OJfOa+dSsrMkWZPAtBei9A33ZV1qpyLd+Wzeqx7ircWQM/mCm297N2HE63NGne4vE=

On 6/17/25 08:21, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.6.94 release.
> There are 356 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Thu, 19 Jun 2025 15:22:33 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.6.94-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.6.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Built and booted successfully on RISC-V RV64 (HiFive Unmatched).

Tested-by: Ron Economos <re@w6rz.net>

