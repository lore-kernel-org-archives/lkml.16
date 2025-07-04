Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD97333E1
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 15:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751643418; cv=none; b=mxldj7wgGqPurRjHvkx8QXlCj64RaT/IcI2OyJuM706kP3UCrRv3ug8RjsqQYuRN2v8A0aO3WzEq6Wkf4T8TST81JU1/F5WT0DPUvtyWNj8UZT3NQFkhMMM7Wf5+jH4d+a6n+LFFEG/cywnGTPTx4M6LtXt6JaKtN0zmaN7t6VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751643418; c=relaxed/simple;
	bh=U/Yp+TyYZZC+qiDGtvdUeVc9CzQxG37JJLXswinMGpQ=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=qAmVUxchouM1Qgm5dGvA7zoQfST2Qm2i2s3PrTVJPl0D4X7FSV6EV4ZHS1P2NdSFGE49lhyqG7a/iFxI/7c2dvHEs8cV2DY11gdkV7dcoR4qidHGSQhmWw88jOsem7n58HEKB9CuWIow4stNA+RYo1ZeJz5UqnMOLNYqXs/QuMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=ltdOTQ8R; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="ltdOTQ8R"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2350b1b9129so7974225ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 08:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1751643416; x=1752248216; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n4GFGYyqb5HFW340cZNcmzYtFqa3NhBVCn+twgH6JKY=;
        b=ltdOTQ8R9cHgyoxjDzjkxtiaEgBH8NV2fun16GbdYBZGVKwuB9oiEEoVJfJa64r7ZO
         d1XlDF8isxwfhjB/FYggMjN7U5EKJzxttNFrE08fzcpQtePQAR2zOpoDJeMWMQ+IAZm6
         fyY3Vxu22bUdEKDDrpXD1/NTTMUyyGw1yENNNgHoF0Bi1J+v37WgUug5W8YGWfz2qrLz
         9cPL0U+RPfu8hXt1UIIfSV7RVAjrHfvVoGrSBykvjxXj/1ZmbbTxch1iDNIATaU0WTsj
         4SrRYKiUb3g8/dtmVzm4BtD3km+1tJUGNOcktWi8xhnwZyxqpMCruLsoF0ihJhMDZqUd
         OBFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751643416; x=1752248216;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n4GFGYyqb5HFW340cZNcmzYtFqa3NhBVCn+twgH6JKY=;
        b=MwnBSiH/TYi6UDp/azEfYAUS3T0ppbz9uJZC9py0AgYUhg0W2YmnU3cvFtbE4DRrs0
         yDRB6JW2xIZwjAvp+Q8a86UJhv+lTEWeKK3BwcembMtIR8AFLcs3zasmeLa8mLRcYbcu
         EGzate1I6eEHhOlUsm0FFTJt5j4vObcucrc/BIeD7pjey3a/Jo+oqL6GSZxkF/8Tt6rT
         tdqgXjb5MeBz545y4+t70r9lP+KK5OE4SZY04YMja4QGaNZBRNBY3oer3WSoZm5X0Nhd
         Nw7xcOIuBHqfP4/+5PzPutPe+cKQ6B3NVM4tAKhDzhPX6YQ5f0hfgIDmEwHYaTnZOqd2
         6EPQ==
X-Gm-Message-State: AOJu0YxTaEfOYtIRMIvqtbTSAYT0Lzd13H5Rn/V5kPms+npob3FaDYGA
	AaoU1qSItZARWG79aErvLYZ/ozsBzaRua2JwpF/WIjMrr8Dofo9QFz3rlfknMXoUd5w=
X-Gm-Gg: ASbGnctGT9TJ99QdmcI3SvZlANACwzy9DXZh5s/L7FxcRcmXgDxARASyveSPzE0aI1n
	bzIpEmXP5e34S5WDCsUGOWbZQCeg8ugz0O7qlZ1EeI0XrXBAW9ictmFl9INNdTj3CGnVnv8f0dK
	aeQl4j2i3PSsnwKt8fy90TmmSMDmYu4fR/bAPvSO0IaYl+KurTefM1wSVYZd3qpycXt3UWq5Yuh
	Sgu4ebs7H4LmcXk0pKsjK/vVeOwSOflOaMq+nOVKHKJoN/k8r4s8/JZ5BwU8upT6RK2cYlYmGj5
	IpbuYE7en3G2sN1nys6rty4A1LBHRklp2I0fYbe3g848E9qdOPP+izdPEUIDGDrISi7JZd+gGuQ
	OCLS3Tw==
X-Google-Smtp-Source: AGHT+IGBomp/50CVjJ5uEmTYDEuEtShI2y3y2JfRYQpjFgCI/VVRtDdarTzp64O5UeiykuBCVN3qHQ==
X-Received: by 2002:a17:902:f78a:b0:234:bfcb:5bfa with SMTP id d9443c01a7336-23c85de488emr44279565ad.15.1751643415971;
        Fri, 04 Jul 2025 08:36:55 -0700 (PDT)
Received: from [10.4.60.76] ([139.177.225.255])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c845894a3sm22296495ad.187.2025.07.04.08.36.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 08:36:55 -0700 (PDT)
From: Liangyan <liangyan.peng@bytedance.com>
X-Google-Original-From: Liangyan <liangyan.peng@google.com>
Message-ID: <3f9f2114-531f-4fd9-92a7-24c2a311938e@google.com>
Date: Fri, 4 Jul 2025 23:36:50 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [External] Re: [RFC] genirq: Fix lockup in handle_edge_irq
To: Thomas Gleixner <tglx@linutronix.de>,
 Liangyan <liangyan.peng@bytedance.com>
Cc: linux-kernel@vger.kernel.org, Yicong Shen
 <shenyicong.1023@bytedance.com>, ziqianlu@bytedance.com,
 songmuchun@bytedance.com, yuanzhu@bytedance.com
References: <20250701163558.2588435-1-liangyan.peng@bytedance.com>
 <87a55mlok9.ffs@tglx> <f3608ef2-1d9f-406c-92f3-fa69486e1644@google.com>
 <87o6u0rpaa.ffs@tglx>
Content-Language: en-US
In-Reply-To: <87o6u0rpaa.ffs@tglx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 2025/7/4 22:42, Thomas Gleixner wrote:
> Liangyan!
> 
> Please don't top post and trim your reply. See:
> 
>   https://people.kernel.org/tglx/notes-about-netiquette
Got it， thanks for the guidance, Thomas!

> 
> for further explanation.
> 
> On Thu, Jul 03 2025 at 23:31, Liangyan wrote:
>> We have this softlockup issue in guest vm, so the related IRQ is from 
>> virtio-net tx queue, the interrupt controller is virt pci msix 
>> controller, related components have pci_msi_controller, virtio_pci, 
>> virtio_net and qemu.
> 
> That's a random list of pieces, which are not necessarily related to the
> interrupt control flow. You have to look at the actual interrupt domain
> hierarchy of the interrupt in question. /sys/kernel/debug/irq/irqs/$N.
> 
>> And according to qemu msix.c source code, when irq is unmasked, it will 
>> fire new one if the msix pending bit is set.
>> Seems that for msi-x controller, it will not lose interrupt during 
>> unmask period.
> 
> That's correct and behaving according to specification. Though
> unfortunately not all PCI-MSI-X implementations are specification
> compliant, so we can't do that unconditionally. There is also no way to
> detect whether there is a sane implementation in the hardware
> [emulation] or not.
> 
> So playing games with the unmask is not really feasible. But let's take
> a step back and look at the actual problem.
> 
> It only happens when the interrupt affinity is moved or the interrupt
> has multiple target CPUs enabled in the effective affinity mask. x86 and
> arm64 enforce the effective affinity to be a single CPU, so on those
> architectures the problem only arises when the interrupt affinity
> changes.
> 
> Now we can use that fact and check whether the CPU, which observes
> INPROGRESS, is the target CPU in the effective affinity mask. If so,
> then the obvious cure is to busy poll the INPROGRESS flag instead of
> doing the mask()/PENDING/unmask() dance.
> 
> Something like the uncompiled and therefore untested patch below should
> do the trick. If you find bugs in it, you can keep and fix them :)

Great， thanks for the patch,  I will test it and feedback later.

Regards,
Liangyan

