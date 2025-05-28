Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 232AF27603D;
	Wed, 28 May 2025 09:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748424136; cv=none; b=N685tu2ZWvTMQXv7y2VxRy5xJI3clczJ1VW+LKRBk//WGPdgn/CVO0L0YWWlxghBPaALJK+6NHud/HqHnvuozyfgVz7exeFHnA8XkptbCj5b7cjhbra4N7DmUunGQpzmsw890oPB6i/SFLoz5ZydD9m3WaJncmSSPIfA2m87skU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748424136; c=relaxed/simple;
	bh=ux5z/bwI4YZWWsbINLJ1ROHKtgYZ4+IDPSRy5k50n4U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rLjOGseHyC1M1bz2D+2V3Hr+HanYTooJ9SnR4WUXPimWo2MykYl7AvQBExpSK97dEtXYIprkn9QpAZEBOhA6GgowCFHVL1oYPo3jj2V8Ht4KbqQYicPTQ+HxHn10mqqE2S3cwRl9D+hhaXPtUyGSjY3robMMD1C1Hv2sbOL4ok0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=h9unDjaG; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="h9unDjaG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=q7O5zjtGMuNTZ2eB8CHCX4rdma8dMuUmcapZAjPpK/s=;
	b=h9unDjaGRRCRLZCw25/Akg+VhyEf7XB9AaR15IXqqsAyYfjjkFD9/hAyE5mjUo
	Ux+AqsJ5NYQ0F5OzzlsgqLxShVCGRR63zl7WI7UjhtNFHvSBrX793DCQVrLmmHlu
	SNUG0qy3c+JISjRIJjYcfkWzjUOMZZLVTIjNBeoj7kmYc=
Received: from [172.21.12.155] (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgAnO5yY1TZodryFCA--.55361S2;
	Wed, 28 May 2025 17:21:30 +0800 (CST)
Message-ID: <98542eca-d5ba-470e-b6af-990dda167cec@163.com>
Date: Wed, 28 May 2025 17:21:23 +0800
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
 <0ef733c0-a945-4eae-8af2-2fe7bb60ed92@163.com>
 <2025052139-credibly-dealt-c8aa@gregkh>
Content-Language: en-US
From: Zongmin Zhou <min_halo@163.com>
In-Reply-To: <2025052139-credibly-dealt-c8aa@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:PCgvCgAnO5yY1TZodryFCA--.55361S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kr13Jr1fKw1rtFWrJw1DJrb_yoW5JF18pa
	yIgFyayr4qgay2krnFvw4rZw1ftr4ft3y5trn8Jryjk34SkrnavFy7Kr4vyayDGFWFk3W2
	q3yDX34kAFZ8A3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UeuWLUUUUU=
X-CM-SenderInfo: pplqsxxdorqiywtou0bp/1tbiUAVaq2g1KS6GHgACsk


On 2025/5/21 18:51, Greg KH wrote:
> On Fri, May 09, 2025 at 10:41:11AM +0800, Zongmin Zhou wrote:
>> On 2025/5/8 17:45, Greg KH wrote:
>>> On Thu, May 08, 2025 at 05:11:47PM +0800, Zongmin Zhou wrote:
>>>> From: Zongmin Zhou <zhouzongmin@kylinos.cn>
>>>>
>>>> Most drivers based on platform bus may have specific data
>>>> for the device.And will get this specific data to use
>>>> after device added.
>>>> So keep the setting for device's platform_data is necessary
>>>> for converting platform device to faux device.
>>> I do not understand, why not just use the platform_data field directly
>>> in the faux device structure?  Why change all callers to now have to
>>> keep track of an additional pointer in these create functions?  That
>>> just adds complexity for everyone when almost no one will need it.
>> In fact, I have tried other approaches.
>> However, I found that it must be set after creating faux_dev and before
>> calling the device_add() function.
>>
>> Because the execution of the driver init and the device probe function is
>> asynchronous,
>> and the actual test shows that the probe function is executed
>> before faux_device_create_with_groups () returns faux_device for the caller.
>> But the probe and related functions may need to get plat_data.If plat_data
>> is set after
>> faux_device_create_with_groups() is completed and fdev is returned, the
>> probe function will get NULL.
>>
>> Take vhci-hcd as an example:
>> vhci_hcd_init() calls faux_device_create_with_groups(),
>> Once device_add() is called, vhci_hcd_probe() will be executed immediately.
>> Therefore, the probe function will attempt to obtain plat_data
>> before vhci_hcd_init() receives the return value of faux_device.
>> It's too late to set plat_data after get the return value of faux_device.
>>
>> If there is anything not clearly or other good ways to handle this, please
>> let me know.
> I think you need to unwind the "probe" logic here as it's not needed at
> all.  After you create the faux device, then continue on with the logic
> that is currently in the probe callback.  No need to split this out at
> all, it's the same device being used/handled here, just unwind the logic
> a bit and you should be ok.
I'm very sorry for the late reply.

Yes,actually vhci_hcd_init() can call probe directly without
by the faux_probe call it automatically.
I can make this change for vhci-hcd driver.

Thanks for your suggestion.
>
> hope this helps,
>
> greg k-h

