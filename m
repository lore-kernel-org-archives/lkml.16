Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CFAD21CFFA;
	Fri,  9 May 2025 02:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746758566; cv=none; b=AjsojFFhmOYxJl+u5lkWl35j6/fa1zWE7Yr2i5V3uhlL7Tr2RPaIIn6JZkDgrqrEw/FRQEKCaEPAbj2m7C/uxW0J4ctYzrUR07eg2q6uZEAeAZNBtthpHYNSZd4nblmX+v+sfKG9mR6aoCYJ882k+ToA0D9p7SUlUjNyUVYLvqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746758566; c=relaxed/simple;
	bh=Mv1GQESWsvvxNW/Pj5hv1tq7U2AdP9+SctY77+FiEbM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ddx2HkaSKzXKFWVTWLWUjTpOC++mhIuh1jq7UiNxFetc12xcHgHLfmJS1HW3/efoGAPFAWRcotGKfeb18ZKRVFZHUMB8Q+grKWobJ+pPEpmsbz+WJuuByrF5/RE+vA0Fxts2ENr2k4lrEW0sBDt2xOwMDkLCKlXLQOvsJSmDW7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=G/5jHHYJ; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="G/5jHHYJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=gEI52y3dVNCkwTQfiMWGNC67/6f3hVlLllGEpTUyFT4=;
	b=G/5jHHYJzJLgVR/58tBVOx1A8kutMaWau6KRzO3vNv/Mg8JF/jYiF5FxQ7BJSe
	Hf0+7mqlK6lC30a7WjPnT7rwH3HzECtabWyozypQ6N9Rz6Sc7BtgXZvtKxRUILiP
	M+KYY+yXyDkIXOtYklgypOg5lYis5HoLd7Ab+nxXhdFAI=
Received: from [10.42.12.155] (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wCXxO1Hax1o6gpuAA--.1864S2;
	Fri, 09 May 2025 10:41:13 +0800 (CST)
Message-ID: <0ef733c0-a945-4eae-8af2-2fe7bb60ed92@163.com>
Date: Fri, 9 May 2025 10:41:11 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] driver core:add device's platform_data set for faux
 device
To: Greg KH <gregkh@linuxfoundation.org>
Cc: rafael@kernel.org, dakr@kernel.org, markgross@kernel.org, arnd@arndb.de,
 eric.piel@tremplin-utc.net, valentina.manea.m@gmail.com, shuah@kernel.org,
 i@zenithal.me, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Zongmin Zhou <zhouzongmin@kylinos.cn>
References: <cover.1746662386.git.zhouzongmin@kylinos.cn>
 <b03b374bc3adad275893e2ad60d4bf5a0ad358e3.1746662386.git.zhouzongmin@kylinos.cn>
 <2025050854-breeching-had-c9b3@gregkh>
Content-Language: en-US
From: Zongmin Zhou <min_halo@163.com>
In-Reply-To: <2025050854-breeching-had-c9b3@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_____wCXxO1Hax1o6gpuAA--.1864S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kr1xZry8WFy3Kryktw1kXwb_yoW8AFyrpa
	yIgFy2kr4DKay2gr17Xw48Zw1Svw4Sy3y5Arn8Jryjkw4fJrnavFy3t3yvyay5JrWFk3ZF
	qayDXFWkAFZ8A3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UeuWLUUUUU=
X-CM-SenderInfo: pplqsxxdorqiywtou0bp/1tbiUABIq2gdaHtftwAAs9


On 2025/5/8 17:45, Greg KH wrote:
> On Thu, May 08, 2025 at 05:11:47PM +0800, Zongmin Zhou wrote:
>> From: Zongmin Zhou <zhouzongmin@kylinos.cn>
>>
>> Most drivers based on platform bus may have specific data
>> for the device.And will get this specific data to use
>> after device added.
>> So keep the setting for device's platform_data is necessary
>> for converting platform device to faux device.
> I do not understand, why not just use the platform_data field directly
> in the faux device structure?  Why change all callers to now have to
> keep track of an additional pointer in these create functions?  That
> just adds complexity for everyone when almost no one will need it.
In fact, I have tried other approaches.
However, I found that it must be set after creating faux_dev and before 
calling the device_add() function.

Because the execution of the driver init and the device probe function 
is asynchronous,
and the actual test shows that the probe function is executed
before faux_device_create_with_groups () returns faux_device for the caller.
But the probe and related functions may need to get plat_data.If 
plat_data is set after
faux_device_create_with_groups() is completed and fdev is returned, the 
probe function will get NULL.

Take vhci-hcd as an example:
vhci_hcd_init() calls faux_device_create_with_groups(),
Once device_add() is called, vhci_hcd_probe() will be executed immediately.
Therefore, the probe function will attempt to obtain plat_data
before vhci_hcd_init() receives the return value of faux_device.
It's too late to set plat_data after get the return value of faux_device.

If there is anything not clearly or other good ways to handle this, 
please let me know.

Thanks very much.

>
> thanks,
>
> greg k-h

