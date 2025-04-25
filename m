Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B670217648;
	Fri, 25 Apr 2025 08:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745568560; cv=none; b=Qn8yBpc5C87J/1hs9gpigIITa4a07qvVH6LtpVG2zpm6s/W5YnS2t+5rxfYUt3+xxBZwENQNMiVa7bIMvDXGYIy9js0E6nCOFDh4ilOnUQLnVKp2uLPKcBY86cqQY0cmTyY3o7tkp4kM7RcJP79ehCyvv/3elWRKtt/Fc2iG8S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745568560; c=relaxed/simple;
	bh=XQJpp88XMokP9lPGQCSmNoNIHO8Ct09S5ZSjkAs2rzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KPwPURByeHpyDbJuGHDJEfUaqEtGJdny4b8cHl8F/BCSm38dGtZc18hyfuoqgc8tng92yL5D1NFPnnUzbZWZJgQRC+9ESmu4wVlBxg6uMUnEWBylfUGoGnT5Vr17pQzE/PrWsDIgmjegqjXDgAXDey9DRNxqB+INSxmphYKoCrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=o3pmN4tg; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="o3pmN4tg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
	Content-Type; bh=nDI+AaMDaS6xtTgWIOFXkykW7E6eXoW4o1/iyaJzSOU=;
	b=o3pmN4tgS+IGXULrPBUM4uSPYaPijHid28z3EzR82jSGJwzAmIz5tCcoo6LWL6
	aR7EgbWYdKwNsFwXDj1PT2Od1uUPTjVab/3azwtmUBqAKPbekl5khAkzLWMAN39t
	hk3SjbZbhRDavkJAfjzSdBmn5lNq4F3bnSbA7YcAJCg48=
Received: from [10.42.12.155] (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3f1sPQwto2_WmCQ--.1960S2;
	Fri, 25 Apr 2025 16:08:49 +0800 (CST)
Message-ID: <4c6660a6-29ce-4b97-b092-8fc15585e52a@163.com>
Date: Fri, 25 Apr 2025 16:08:47 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usbip: set the dma mask to 64bit default for vhci-driver
To: Christoph Hellwig <hch@infradead.org>, gregkh@linuxfoundation.org,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: i@zenithal.me, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 shuah@kernel.org, valentina.manea.m@gmail.com,
 Zongmin Zhou <zhouzongmin@kylinos.cn>
References: <3e1f8fab-0155-4ff9-800d-5fa9df88c48c@linuxfoundation.org>
 <20250422063409.607859-1-min_halo@163.com> <aAdEM0crDfSP9JYf@infradead.org>
Content-Language: en-US
From: Zongmin Zhou <min_halo@163.com>
In-Reply-To: <aAdEM0crDfSP9JYf@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3f1sPQwto2_WmCQ--.1960S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKr4rZF47tFWkKr1UCFyfJFb_yoWkCwc_uF
	y2qFZrJ34DArWDtayxtF93tryqvas8Wr95J3W5Kws7KasYqFyfuFn7JrWava4DXw1Syr43
	Ga1Svr9Ivw1IgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUU6BT7UUUUU==
X-CM-SenderInfo: pplqsxxdorqiywtou0bp/1tbixxg5q2gKX-B-dAABsK

Dear Greg and Christoph:

This patch is the simple solution for the issue described in below link:
https://lore.kernel.org/all/20250219092555.112631-1-min_halo@163.com/

This issue has been discussed at length with Shuah.

As Christoph said,vhci-hcd is a virtual hci,
but it serves as a bridge to connect virtual USB devices to the real USB 
controller.
Since the commit d74ffae8b8dd is applied on kernel v5.3,
the virtual USB devices's max_sectors size is limited since v5.3.

Just because on vhci-hcd, the dma mask setting follows the platform 
device default setting(32-bit).

So I want to get the real USB controller dma mask to set on vhci-hcd 
driver，
or set to 64 by default,to fix the max_sectors limited issue
on virtual USB device since the commit d74ffae8b8dd applied.

Thanks.


On 2025/4/22 15:24, Christoph Hellwig wrote:
> On Tue, Apr 22, 2025 at 02:34:09PM +0800, Zongmin Zhou wrote:
>> From: Zongmin Zhou <zhouzongmin@kylinos.cn>
>>
>> fix usb device limited  max_sectors when use usbip protocol
> As far as I can tell this is a virtual HCI and can't perform DMA.
> Thus nothing should use DMA API calls on it and the mask is irrelevant.

