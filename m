Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86611514CE
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 07:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738309079; cv=none; b=MWcRMaL2IDr0N8/t0I+FEVZ4nSa4i3Pxj+fUlI2tqOvcR21jZFPlSSGTrowE+Wc4k7pmfIoJjail27CR3nf2iGYB/O2xfshUd6jxrbhOJ6NH3FaKXA3QQCIONs6o497UpK4FgsEsXYMhuG5k+uLghMwmvct8SbYjZ8f8NqhS7Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738309079; c=relaxed/simple;
	bh=/MZJWtbCRnvd4SVu1PoVqiooH8kR+4jJrfANEvje6B0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PeSUq7P7MlOUGERaS7a9lLmM6fSBkq/OYaitzPzZo1sAekFH/kr26j4Cwayakp/mx+tFZsJtM9tIw8IZJKwhee7u7UZTHkeKCyG3f0QFV8mpI3NjRqUYpHD8WZ8HFTSGvBtq/rHupSp97wZ3rXsimxFzZ0grvvLNB2uWdA+QgZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fiaEiC98; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fiaEiC98"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738309076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RMgVsW+/QlemsW/uhwFT/jOfeJ04/HD2RbivobMxxLo=;
	b=fiaEiC98BbQ40hRgUPOfRTLC6uae+MEOi8i5o1FBLp0abBiUJxlf9DQ89aspwFe2Dt2DhC
	RvplHisgeUWiOmjl6KImdgoiJM74o3vvYzrq+AMsIDTVHcJUhTmP2nrFUD2G2maOH20p8S
	bbxsnbVjm+sj1n7lldLAEZTIWY5ZxAI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-18-D3kaTpeZMcCJwSUTbg72bw-1; Fri, 31 Jan 2025 02:37:54 -0500
X-MC-Unique: D3kaTpeZMcCJwSUTbg72bw-1
X-Mimecast-MFC-AGG-ID: D3kaTpeZMcCJwSUTbg72bw
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-436723bf7ffso13756895e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 23:37:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738309073; x=1738913873;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RMgVsW+/QlemsW/uhwFT/jOfeJ04/HD2RbivobMxxLo=;
        b=AdxD03atLJxGOghA8tRNt3HMowF/ciXJ6XbijV+90uYLzppOvJ4KYoqQ7z8UjhHvvy
         dgvnvhfvYWOpUSD4eWrNp70jPUZFYk41EYoOnMGtTx7xieThVRCkC5LXj604CK8k8EMX
         KrS7PBOcMcMinhEu19GpVAX3PZiCCgUPwZCUNtIPQgWZRKLJ5W0fsZhgEaH3/YLUyrCv
         LTv1mkA1bJ0j88d9btQRtbLDunOdFeGYj2RVE6udowHLh5Z0OZHESBWEH6HPnR6Q/6mv
         KqZXvbFAQni5uowZ8O5VHb06nJLl4Cjfli1UQo0EfuJ0KUodCxIbE0CxhkTT4OhmZLw4
         fMIw==
X-Gm-Message-State: AOJu0YwEheCJcc0LeHfu19AkXlLL4G/UTUVggsNAXura37gnIAWIuqNY
	hN6L2Xokzn5C8+LnJ4VjH6KwTYOc8tlj5qvPZdSvwStMVq7k7/+JGAVI/hI8tEKWGsz6z48u6Fv
	8i1bNXSR0arwXS5Ym2NqyzTYP2SZYrXLalou0N+3LbDHXOTaTHR19AvCJwIU6ttlZzY50hQ==
X-Gm-Gg: ASbGncuNNk930zoyM+HAnvDqVOYtvf/krkl1BLgiuQCWB8X38ocxhWR4+Ta0qfyxQDf
	Wd8zzLfzjMhtycmjkrqvLKLDQj0iumnZ3eCtJory+s92QV9u2VFMPsCVdnp50nchmOGBrK3bFdy
	c3NFLWf2OWEQIkwJqocCToyL6qcPpGa26BcvAL4ooqbRZTU4+zRsIqvQJl6mspVbJ29adKQxVk5
	WiMtS6QQiHT1d2dEXHPZqTjW7Y3FebJcWKTGnQ0GvwXoiR9YaTSNjktnNGvNsDiUT9MsgUJOobl
	+bkcIQJRxxVnO+V3tAVTtatubLf1FUm3qDU=
X-Received: by 2002:a5d:64ed:0:b0:385:f6f4:f8e with SMTP id ffacd0b85a97d-38c520a35d1mr10073225f8f.50.1738309072895;
        Thu, 30 Jan 2025 23:37:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHK2cuszovQGZ9RC6KZy1jrb8405UV8PkMW7ZStTaXydaZa8IIuT14GQux33jt09JDJA6SJXw==
X-Received: by 2002:a5d:64ed:0:b0:385:f6f4:f8e with SMTP id ffacd0b85a97d-38c520a35d1mr10073198f8f.50.1738309072527;
        Thu, 30 Jan 2025 23:37:52 -0800 (PST)
Received: from [192.168.88.253] (146-241-12-107.dyn.eolo.it. [146.241.12.107])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e23de772sm46266235e9.13.2025.01.30.23.37.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 23:37:52 -0800 (PST)
Message-ID: <ac8a097e-a110-433b-99ae-1419d6444261@redhat.com>
Date: Fri, 31 Jan 2025 08:37:50 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: duplicate patches in the bluetooth tree
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Networking <netdev@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Johan Hedberg <johan.hedberg@gmail.com>, David Miller <davem@davemloft.net>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Marcel Holtmann <marcel@holtmann.org>
References: <20250131131633.75083adc@canb.auug.org.au>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250131131633.75083adc@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/31/25 3:16 AM, Stephen Rothwell wrote:
> The following commits are also in the net tree as different commits
> (but the same patches):
> 
>   07b6216dfc34 ("Bluetooth: Add ABI doc for sysfs reset")
>   52f17be9931e ("Bluetooth: btnxpuart: Fix glitches seen in dual A2DP streaming")
>   56cec66d6163 ("Bluetooth: L2CAP: accept zero as a special value for MTU auto-selection")
>   9e2714de7384 ("Bluetooth: Fix possible infinite recursion of btusb_reset")
>   ec5570088c6a ("Bluetooth: btusb: mediatek: Add locks for usb_driver_claim_interface()")

I pulled from:

git://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git
tags/for-net-2025-01-29

AFAICS net hashes match the above tag. @Luiz: did you by chance rebased
your tree before tagging it and sending the PR? Just to understand the
root cause of the above difference.

Thanks,

Paolo





