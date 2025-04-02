Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80BFE19F40F;
	Wed,  2 Apr 2025 08:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743582870; cv=none; b=XSXp3u4ZMA7I89r+1u0qFfgfvGYAkKnogzt8RFTQQsbaCSQ4USEoIRI07BbNC35HmatlOOCP8lsQPeJTfRWS/2UgeZzeI2ld9fwC1ydUjOniqMlSq+w++VTFWRIBhp/EFZei7ppcB5JMFA1D3JXDn/yRz5yd4Xve+7HM14xGKW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743582870; c=relaxed/simple;
	bh=lKeikN9azWuW6BHlS4lrSyXtbeUm9u4e3+OgYNrqA3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qhDlgxrBjIyuypSkpvBh0CJwCP3xlvVOVXW1QBCKKPSf8VsdjtEZNgbrwWNDQqJOktG+0DGX+hvTG2XuKalFxREDQ/Gnl2DSW6t9fycxQiXNd1qsNBwAIpGX0FvtSa023Wk1gb8LgC1ZQeEpdC2Or7QV3HfMRIp1M83frOQNeAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=phb0QmiN; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="phb0QmiN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
	Content-Type; bh=Nt14CP8peI1k8Bn46zWTZfy+pg1IfssuPQ6bs44nZUo=;
	b=phb0QmiNgfmacNPJCpBeGVIicfftkf8UODQOiTGBRpCbg4mbIppRNKazpCp6Yv
	igB8icMwbOpdOUXL+nGfJDIbcsB4Y16O9T24EGVz1vcvgKgB8gg6HUKhosqssh6x
	RkiH0FQfuL6ZUpKDV6aIXUdvrBUu4yBguXdnvwSrxY6+I=
Received: from [10.42.12.155] (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3p8yA9uxn5WmkDg--.33608S2;
	Wed, 02 Apr 2025 16:34:10 +0800 (CST)
Message-ID: <6b970291-c9f7-4a5f-9b82-210a3c4d2739@163.com>
Date: Wed, 2 Apr 2025 16:34:08 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usbip: Fix the error limitation on max_hw_sectors for
 usbip device
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: valentina.manea.m@gmail.com, shuah@kernel.org, i@zenithal.me,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Zongmin Zhou <zhouzongmin@kylinos.cn>
References: <20250219092555.112631-1-min_halo@163.com>
 <88b2fb4b-96a4-4d29-bf92-4064d3572fa4@linuxfoundation.org>
 <5a41d6c3.8c78.195371996e0.Coremail.min_halo@163.com>
 <247c7e15-bbff-427f-8315-ca463f8b933b@linuxfoundation.org>
 <4d4035bf.26b9.19556dcc23d.Coremail.min_halo@163.com>
 <c49917d2-5157-4878-9866-be6053b5124d@linuxfoundation.org>
 <6d47fef6.9eef.19565c308e5.Coremail.min_halo@163.com>
 <803b43c6-9aab-4380-9753-fd2efa8061fa@linuxfoundation.org>
 <7e9db4d9-0a22-44b4-a981-0de25d6a2aa4@163.com>
 <99a8b726-726a-4e26-bafc-9ff2b1e4d7be@linuxfoundation.org>
Content-Language: en-US
From: Zongmin Zhou <min_halo@163.com>
In-Reply-To: <99a8b726-726a-4e26-bafc-9ff2b1e4d7be@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3p8yA9uxn5WmkDg--.33608S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWF4UWF1DJF4xJr17Ww45KFg_yoW5Ww47pF
	W8XFy7KFZrta10yFnFyw1rX3WFya1xKry3Wr9xGw1UX390vF13WF4ktFWruay3WFnxu3W2
	yr4DZa43WrnIyaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UseOXUUUUU=
X-CM-SenderInfo: pplqsxxdorqiywtou0bp/1tbixxwjq2fs8Iy2EgAAsA


On 2025/3/29 05:14, Shuah Khan wrote:
> On 3/13/25 04:02, Zongmin Zhou wrote:
>>
>> On 2025/3/11 00:49, Shuah Khan wrote:
>>> On 3/5/25 03:03, Zongmin Zhou wrote:
>>>> At 2025-03-05 03:45:28, "Shuah Khan" <skhan@linuxfoundation.org> 
>>>> wrote:
>>>>
>>>>> On 3/2/25 05:37, Zongmin Zhou wrote:
>>>>>> Dear shuah,
>>>>>>
>>>>>>
>>>>>> Yes, I agree with you.It would be better if there have a more 
>>>>>> simpler fixes than This patch.
>>>>>>
>>>>>> I can just think of the two possible solutions that mentioned 
>>>>>> before.
>>>>>
>>>>  >What are the two possible solutions?
>>>> 1. The patch we are discussing now,have to change the API between 
>>>> the kernel and user-space.
>>>
>>> 2. Simply set vhci-hcd dma mask to 64 by default,just modify the 
>>> vhci-hcd driver. Then dma_max_mapping_size() will always return 
>>> SIZE_MAX.
>>>
>>> I prefer option #2 - What are the downsides if any with this option?
>>>
>> If set vhci-hcd dma mask to 64 by default,I can't predict what will 
>> happen when the real USB controller support less than 64bit?
>>
>> After all, the data flows from vhci-hcd to usbip-host and finally to 
>> the USB controller to which the device is actually connected.
>>
>> the data is ultimately processed through the real USB controller?
>
> Sorry for the delay.
>
> That is the case. I have to check the code to see what the host
> would do if it receives larger buffers from the client (vhci)
>>
>> However, the default setting to 64-bit is equivalent to eliminating 
>> the impact of
>>
>> the patch(commit d74ffae8b8dd) on usbip protocol devices, sounds 
>> feasible?
>>
>> I am not very professional in this field, waiting for your evaluation.
>
> We can give this a try. Send me the patch with default testing the
> following cases:
>
> Host - swiotlb enabled and disabled in your environment to see what
> happens when there is a mismatch swiotlb enabled case and client
> side doesn't limit the size.

If you want to test swiotlb disabled mode, you can modify the kernel cmd 
to force disable swiotlb:

modify the grub.cfg, add the swiotlb=noforce parameter to kernel command 
line,and reboot.

cat /proc/cmdline to check whether modified successfully.


The patch set vhci-hcd dma mask to 64 by default like below:

---
  drivers/usb/usbip/vhci_hcd.c | 3 +++
  1 file changed, 3 insertions(+)

diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
index e70fba9f55d6..fca3a4a6e94d 100644
--- a/drivers/usb/usbip/vhci_hcd.c
+++ b/drivers/usb/usbip/vhci_hcd.c
@@ -1345,6 +1345,9 @@ static int vhci_hcd_probe(struct platform_device 
*pdev)

      usbip_dbg_vhci_hc("name %s id %d\n", pdev->name, pdev->id);

+    /* Set the dma mask to support 64bit for vhci-hcd driver. */
+    dma_set_mask(&pdev->dev, DMA_BIT_MASK(64));
+
      /*
       * Allocate and initialize hcd.
       * Our private data is also allocated automatically.
-- 
2.34.1

>
> thanks,
> -- Shuah

