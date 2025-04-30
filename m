Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3E631D61AA;
	Wed, 30 Apr 2025 05:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745990700; cv=none; b=Afd0UfN+RNtK55okg8UjgVbb3wvk0ASdnslD8ZaVTQ5uUBBJxDn7Cy3un5PxNBoMcgVrVY2o3A50ilOEb46kewvB8gpsy672UF5E/66RVtPOca4SrTkFxJOcbtnXLsMPMXuIQ55XFkjyFUenb01B+q2qyeMEJPEYxiPyezoC3Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745990700; c=relaxed/simple;
	bh=oPN9HNb7W+WnV8QqZ69WdQtfENQ8uSEUYUOwpqen8z8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rpogZkvZJRXIrieTIW/rPzzsR/0P/Bc12IMYrwM0OkjZYtRw6bFraBkfSwVPUiEaBtvd9twF/YziHPjbv6QSYMx1fu4L4HpAD6wtQeRqUVkYn+Kbv/urukJ8cLMOr+KWrFbzqfLfymcPj3qQFLYL3ALXmK03/WcRs+Fq4VUm0Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=mgl7xiw3; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="mgl7xiw3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
	Content-Type; bh=MVWXoYGa4OsAsg4nc8D9qzEcLgq9gyKCVEtwnH3camo=;
	b=mgl7xiw3BD4JQ+t5cQFS6f2PNQRy4ucAaDsBHK3E4WqYg+aCGvrH1FyyU0IZ5m
	ycRbfdoxYzSV1T3uxotcecTXeWDIE1Mil5vKaYkD6730CrV0pAgtK6d9OesylZ+c
	zT4AkoXyN2c1Cm/ZWotOCtOhBjARuckAfBRRXPrX5b0Uo=
Received: from [10.42.12.155] (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDX01EPtBFodsoXDg--.22173S2;
	Wed, 30 Apr 2025 13:24:33 +0800 (CST)
Message-ID: <b8bc6ce7-55eb-4270-b4dc-d6c853fa65ac@163.com>
Date: Wed, 30 Apr 2025 13:24:31 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usbip: set the dma mask to 64bit default for vhci-driver
To: Shuah Khan <skhan@linuxfoundation.org>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: Christoph Hellwig <hch@infradead.org>, i@zenithal.me,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, shuah@kernel.org,
 valentina.manea.m@gmail.com, Zongmin Zhou <zhouzongmin@kylinos.cn>
References: <3e1f8fab-0155-4ff9-800d-5fa9df88c48c@linuxfoundation.org>
 <20250422063409.607859-1-min_halo@163.com> <aAdEM0crDfSP9JYf@infradead.org>
 <4c6660a6-29ce-4b97-b092-8fc15585e52a@163.com>
 <2025042512-corsage-handpick-bf2a@gregkh>
 <575ce02c-9128-4098-a852-d9e14f14010e@163.com>
 <2025042812-sinister-shaping-bded@gregkh>
 <097ad0fd-db38-4174-8e34-4ceb485e7e23@linuxfoundation.org>
Content-Language: en-US
From: Zongmin Zhou <min_halo@163.com>
In-Reply-To: <097ad0fd-db38-4174-8e34-4ceb485e7e23@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDX01EPtBFodsoXDg--.22173S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJFWxXry5uw4xJw4kGw45Wrg_yoW5Gw1fpF
	W3Jay2krs8Kwn2qrnav3W0vF1FyrZ5t34rWrn8Jw18C390qFyavrWDt398CF9Fvr1xK3W2
	vrWjgFyakFn8uFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UeKZAUUUUU=
X-CM-SenderInfo: pplqsxxdorqiywtou0bp/1tbi7gM-q2gRqVj1hwAAsD


On 2025/4/29 07:07, Shuah Khan wrote:
> On 4/28/25 04:04, Greg KH wrote:
>> A: http://en.wikipedia.org/wiki/Top_post
>> Q: Were do I find info about this thing called top-posting?
>> A: Because it messes up the order in which people normally read text.
>> Q: Why is top-posting such a bad thing?
>> A: Top-posting.
>> Q: What is the most annoying thing in e-mail?
>>
>> A: No.
>> Q: Should I include quotations after my reply?
>>
>> http://daringfireball.net/2007/07/on_top
>>
Sorry for that,and thank you for the comment!I've learned it.
>> On Mon, Apr 28, 2025 at 05:51:08PM +0800, Zongmin Zhou wrote:
>>> Dear Greg and Shuah,
>>>
>>> I found out that the vhci-hcd driver added this virtual device
>>> as a platform device from the very beginning since 2014.
>>
>> Ah, I should have caught it back then, but at the time there really
>> wasn't another option.
>>
>
>>> I'm just getting in touch with this module and
>>> don't have a deep understanding of it，shuah should be clearer.
>
> faux_device should work fine for this. We do have to test of course.
>
> There are several examples of converting  platform device to faux device.
>
> 72239a78f9f5b9f05ea4bb7a15b92807906dab71
> dcd2a9a5550ef556c8fc11601a0f729fb71ead5d
>
Ok,I will learn to do it.
Thank you for your guidance.
>>
>> See the recent patches I did converting drivers to use the faux bus
>> code, it should be pretty simple to do.
>>
>>> I don't know if using the faux bus to replace the platform bus can 
>>> solve the
>>> problem that the error limitation on max_hw_sectors for usbip device
>>> since commit d74ffae8b8dd applied.
>>
>> That is for the storage driver, not usbip.  As the faux bus does not
>> have any real dma operations, this should cause it to work properly
>> given the default values involed, but that's up to you to test to verify
>> it does just that.  Try it and see!
>>
>>> But this change will request user to update kernel version to 
>>> support faux
>>> bus.
>>
>> That's just a normal kernel update to a newer version, what is wrong
>> with that?
>
> With one difference that the fix depends on faux_device feature - hence
> we can't apply it to stables. I do think it is the right direction to
> go to faux_device.
>
I just encountered similar users who were using a lower version of the 
kernel and were unwilling to upgrade.
But if reach a consensus to  go to faux_device,
I will try to make the change(converting platform device to faux device 
for vhci-hcd).
>>
>>> This will also be an expensive change to fix the problem?
>>
>> Fixing things properly is the correct thing to do in all cases.
>>
>
> Zongmin, do let me know if you are unable to make the change.
>
> thanks,
> -- Shuah

