Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 388D825F994;
	Mon, 28 Apr 2025 09:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745833946; cv=none; b=FS1CeRUV2gWgxZ3ImOW3gkMIuvu7r72FS6x2wNqoxmoTaWbBVGbX8zKRsvcfLFvmgO0E416DBriPU6zdBo4t7aob4T7GF+96l1FapRKHH20gwgbKZhnHEPEJhr8IdI3dh0XpDPMpLJh93Bsjtq0PfjO+hT+YCOBEe+Wz89OGvhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745833946; c=relaxed/simple;
	bh=1x8sp4jumFzb6yWzuwhlCiCa+03Bi2NQt2ISCvoMH0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sxYDN34ex5IsPK8qenFv5T0ohLXZ0AZ7tdAu7BzoGpCiK5O4LYAKsRZ/adauRrHKtlDarrtpYy5bFl1kJhL0EDJARDNpJDVRKSwA4mudECtVYq/Unqel1fS8ZGY4jQKAnxu5043zQpmSv0gwbl7EV+UYWYFjwLmJJy3Auv+yktc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=O4/B1puB; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="O4/B1puB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
	Content-Type; bh=fZ1KTKeeZQIrOF8B6kO1Vb75Qk2vIgjMHppVXpEZZMA=;
	b=O4/B1puB6Tj52ocS1Uq3UMlVUbuBwXkUxkoottG2J6ecxU0/WK6vxZEjLjiomI
	zsQ+b9TnRjLhmoGLcxCDn+Jf5n5RJfLOQkWPSV5IJjTEnpWK2V6tWsjMR4QELaOV
	HKqKlM8zmSC4ZMbCbJyIT1MZm37D7Iimc3zDeGmi67r6g=
Received: from [10.42.12.155] (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wBXNGeMTw9oeVYADQ--.39766S2;
	Mon, 28 Apr 2025 17:51:10 +0800 (CST)
Message-ID: <575ce02c-9128-4098-a852-d9e14f14010e@163.com>
Date: Mon, 28 Apr 2025 17:51:08 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usbip: set the dma mask to 64bit default for vhci-driver
To: Greg KH <gregkh@linuxfoundation.org>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Christoph Hellwig <hch@infradead.org>, i@zenithal.me,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, shuah@kernel.org,
 valentina.manea.m@gmail.com, Zongmin Zhou <zhouzongmin@kylinos.cn>
References: <3e1f8fab-0155-4ff9-800d-5fa9df88c48c@linuxfoundation.org>
 <20250422063409.607859-1-min_halo@163.com> <aAdEM0crDfSP9JYf@infradead.org>
 <4c6660a6-29ce-4b97-b092-8fc15585e52a@163.com>
 <2025042512-corsage-handpick-bf2a@gregkh>
Content-Language: en-US
From: Zongmin Zhou <min_halo@163.com>
In-Reply-To: <2025042512-corsage-handpick-bf2a@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBXNGeMTw9oeVYADQ--.39766S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZFy5try3tFWUKw17XF4rAFb_yoW8WF13pF
	Z3uaySyrs8KF1Iqws5uw15Za4IyrsIvF9Ygr1DXr1UC3y5uFnFkFWIgr45uasrJr93C3Wr
	ArZ7Was0yFWq9aDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UeKZAUUUUU=
X-CM-SenderInfo: pplqsxxdorqiywtou0bp/1tbiUA49q2gPTZI1sAAAs1

Dear Greg and Shuah,

I found out that the vhci-hcd driver added this virtual device
as a platform device from the very beginning since 2014.
I'm just getting in touch with this module and
don't have a deep understanding of it，shuah should be clearer.

I don't know if using the faux bus to replace the platform bus can solve 
the problem
that the error limitation on max_hw_sectors for usbip device since 
commit d74ffae8b8dd applied.
But this change will request user to update kernel version to support 
faux bus.
This will also be an expensive change to fix the problem?

I have been discussing with shuah for a long time.
Is there any simpler way to fix this problem?

On 2025/4/25 16:28, Greg KH wrote:
> On Fri, Apr 25, 2025 at 04:08:47PM +0800, Zongmin Zhou wrote:
>> Dear Greg and Christoph:
>>
>> This patch is the simple solution for the issue described in below link:
>> https://lore.kernel.org/all/20250219092555.112631-1-min_halo@163.com/
>>
>> This issue has been discussed at length with Shuah.
>>
>> As Christoph said,vhci-hcd is a virtual hci,
>> but it serves as a bridge to connect virtual USB devices to the real USB
>> controller.
>> Since the commit d74ffae8b8dd is applied on kernel v5.3,
>> the virtual USB devices's max_sectors size is limited since v5.3.
>>
>> Just because on vhci-hcd, the dma mask setting follows the platform device
>> default setting(32-bit).
> Wait, why is vhci-hcd a platform device at all?  It shouldn't be doing
> that, try removing that to start with, which will remove that "default"
> setting.  I recommend using the faux bus as a potential replacement.
>
> thanks,
>
> greg k-h

