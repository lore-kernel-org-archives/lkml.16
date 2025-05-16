Received: from smtp.smtpout.orange.fr (smtp-20.smtpout.orange.fr [80.12.242.20])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867C642AA3;
	Fri, 16 May 2025 15:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747409035; cv=none; b=kYg96YdhJxbLjrI6r2c6plGyBEQh/4mA4KblXlNF89IerD9Y0WJuFB53LS7jZxNfiU4XgK9/8i+IiPBHU20J6vzFxTLEC1Aod23+H6tE0c1DLRBxZuccAse7O3heDOvvmvYBfGxq2MQ/vNaQL6cHe7qg4zj21QaIccUr7EMRiIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747409035; c=relaxed/simple;
	bh=fAdRp3Ukf76/cLJ5MH/J9Tw01MY99ook45ajAUe4i78=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mZoIgCweq5GWttj7qrp6XC2FKNAGf6ozNAh+bG7tJdKcwtjxWd19F3mjWudHLL5ngKqGkDL9o1n3XVqZK4Z/0ArLEeSK951yDZBLZhD69mzuVUN8jvq+5HyW07L9EUCHE+ZtM0OqGdJaknzfjyjRmOHQW8Z6MQ/6MovUDfNc9qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=GS289XTQ; arc=none smtp.client-ip=80.12.242.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="GS289XTQ"
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id FwuQuoFNbNavUFwuQugVNx; Fri, 16 May 2025 17:23:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1747409022;
	bh=YGN7z0e21T7dSbGplde5/HIUtjEEzTbReDm6+Lon+l8=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=GS289XTQHk3VLsLFpa5c/UYf4u4rEi+q4hXRXshv4vC+CJ9brrfk93Lotykr58NMQ
	 jGXUAgQbbN+gjZ9Z6LiZ0GOd236njwoO2GqxrsUIQYXYoM1QqDAJHibIBVdHh7LI6e
	 IZggX6xUeG4DUNGmjVt5lXFyT1O2NK08Rro/qv3nfVtDbDlvRKZ8DSHd+UBEXHWlAy
	 IUpsW9XBwhYgSfEPxTWPESR3vbmtQg8GJ7Xq5u1Xm7kAFzh/3jiqgIDraK26Efjcad
	 lMVnpMuPCOH/B3csNVHhzdGR0K6Pkhduem3L14lm7rEp2jgjkLajkru6YFV9S+XVAX
	 QxNKLpSDRsjAg==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Fri, 16 May 2025 17:23:42 +0200
X-ME-IP: 90.11.132.44
Message-ID: <18ff08db-9d0a-40bb-b84d-785d25e2b8fc@wanadoo.fr>
Date: Fri, 16 May 2025 17:23:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: arm_scmi: Use dev_err_probe() simplify the code
To: Cristian Marussi <cristian.marussi@arm.com>, long.yunjian@zte.com.cn
Cc: sudeep.holla@arm.com, peng.fan@nxp.com, justin.chen@broadcom.com,
 florian.fainelli@broadcom.com, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 fang.yumeng@zte.com.cn, mou.yi@zte.com.cn, ouyang.maochun@zte.com.cn,
 xu.lifeng1@zte.com.cn
References: <20250515203855146Sn9x-Uw9Teur35mOjn41C@zte.com.cn>
 <aCXzPGvPayVyiMHG@pluto>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <aCXzPGvPayVyiMHG@pluto>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 15/05/2025 à 15:59, Cristian Marussi a écrit :
> On Thu, May 15, 2025 at 08:38:55PM +0800, long.yunjian@zte.com.cn wrote:
>> From: Yumeng Fang <fang.yumeng@zte.com.cn>
>>
> 
> Hi,
> 
>> In the probe path, dev_err() can be replaced with dev_err_probe()
>> which will check if error code is -EPROBE_DEFER and prints the
>> error name. It also sets the defer probe reason which can be
>> checked later through debugfs.
> 
> All true...but...if you look at the main scmi_probe() function all of these
> failures are trapped at that level currently on the return path...
> 
> see the call chain from
> 
> scmi_probe()
> 	....
> 	ret = scmi_channels_setup(info);
> 	...
> 
> ...so your probe errors will be overridden there with a more generic message
> left in debugfs at the top level.

This is only true only when -EPROBE_DEFER is returned.

In other cases, I think that we would get 2 messages. The specific one 
from scmi_channels_setup() and a generic one from scmi_probe().

in such a case, the one in scmi_channels_setup() will be better, because 
it will log the error code in a human readable format, which is not the 
case now.

So, I think that the patch:
   - simplify the code
   - improve the error messages in some cases

If -EPROBE_DEFER is returned, I think that the additional call would 
just but a harmless no-op.

CJ

> 
> Thanks,
> Cristian
> 
> 

