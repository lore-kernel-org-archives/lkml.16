Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47751FAC46
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 12:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745496257; cv=none; b=guEXlXR3W0v5Ksb422aqBSJrCxvfXdNNnn7IU43wSDM4kkdA078UaAelDEeTPgkiej6R1pbhry6l22l7WCQ9x/cdQZX8GZ+3c/VCLmgsfLU0habF4tzq//Q/HLb2lCgumPgEwh0ylzELFQGFe5bMMlFpbYMw1/bIPm+A+xS6baU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745496257; c=relaxed/simple;
	bh=U9tXpkXlvhzzOmQducjg/3aquEnpGt33HHWQ/gxaN9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NePSGKcI6gwudn5wFqHDcPQIA2ItCvifmApAOpc2nPgnRtjEUOB2kNARzKgOCV1cSd0PpZF6jaPqR+qEPNNozFjhdWL/pin7tNH3fTuRQMXXg+ktNo1WcQ5P/kPiyZCtTrLaFQMnIBra6gy34HHU/SEqK+jBWLnQ4u6aI7y9N8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hUWJkPQl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hUWJkPQl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745496254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bh3s53lxnJJO2dUSgO66le/Ri+7+LskKQ0VlwKBl9JU=;
	b=hUWJkPQlxl1a5FPHlLKfiI7BAdPB0vZi9x7rVztM90JiRyWgzEDgNXLVe9s/Xx1AtE4iJU
	by2u2gcDNvThVfnPpA09vRwg30q1hlzqyOX+qnzOAc0cBw8pIGjJdbVDvSkW5c3JTMOEeE
	8JLeA+VoGi3pwBhrPnnhl7de1DEoKAM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-529-NghAHYb1OJ6n8r1b_fn-Cg-1; Thu, 24 Apr 2025 08:04:13 -0400
X-MC-Unique: NghAHYb1OJ6n8r1b_fn-Cg-1
X-Mimecast-MFC-AGG-ID: NghAHYb1OJ6n8r1b_fn-Cg_1745496252
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3912a0439afso311939f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 05:04:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745496252; x=1746101052;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bh3s53lxnJJO2dUSgO66le/Ri+7+LskKQ0VlwKBl9JU=;
        b=HFKmqMJb0Oms3fREeX1pfh1CQy5L4JVnkTgi8WbIDLxsAxARr/JKoKp0cm5SFzYEq5
         9wpUzKFC9K5XgKr0QYWufyvhnmsyOVDjrwKsxbmWL5Y1eQzQu3FfeppBwdyc/RQ1j7vM
         xJf5pynlLGOL3gy3dhkpGlp5kijiy9FdpA+o2BngU+YU2VIkooQBo7LON/fyrEtbvk/f
         Pj/L1IOAKKBy1tMlK/1DsiSAKU8XwCTWOVMDIhurvRDrfd6Tv940AhPXbVCXxkGOE/u/
         4mJMxU8L6vEghqUYldalrTA5VOlozDoCjav2iR8dR3ogIIpVqoqhga4b8L47gt22pSPt
         Dl0g==
X-Forwarded-Encrypted: i=1; AJvYcCXE+SvVFB776cBRAPDke9dtAoiPuwwHNUA/Wds7eOrRzfGj3xU4SI4H74RRvqk3O07DrEWipHH3lOJk4hc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyM81yCtdR6XPrgCje7e48hiJ2//hOWaIiX6MuoThIoqSW5DgEC
	cr74f/ifW8VL1jHrR7t7K5K5vd2youtOoQh+Tfrp8DJdUr4zi5faV3/KK9KzjF4MqxmHsyj6K2a
	wwHnNBhu5suWSXvB96IgcFn6mjNVGmSGIUFqa0DkQ6K8wuqpe+djNpbd9cNZ8Dg==
X-Gm-Gg: ASbGncvc6Viw8G9miypYyKxOgC5EM5PX7aJGrgoSvo16KE/3xA+lt3Nl6pO+HMNzH6a
	3KEMr2/Ml9jpOErsqJT3icpH/0KuuiiBRxqPdIofgiNpckSxJvOjQ2nPrKpgHRg389TjyE+USdE
	+M+TK41k1RdDdtb6/bn1+QNNhPRhg8ELItBoHqKIpuy2YqA3VBikITG2g0xITSupWViKwEABb9q
	OiH01Mx3xFK86R+1gjUzCgvYQx9ilWJeQ6B4c6YTlgLkwIlkN282zHnECXJusswip6TbXQM0CfN
	Zfv/vVfF9fJFpe5BCFbj2zjfIBpuXUx8UhW723c=
X-Received: by 2002:a05:6000:178d:b0:39c:266c:423 with SMTP id ffacd0b85a97d-3a06cecb362mr1842812f8f.0.1745496251992;
        Thu, 24 Apr 2025 05:04:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRZkkYGPeYcct/UGZCOBgEUQnsD5s94C5Hyp3c2PijFG72me2Lm433rHFIjvW+57vf1ZeXEA==
X-Received: by 2002:a05:6000:178d:b0:39c:266c:423 with SMTP id ffacd0b85a97d-3a06cecb362mr1842753f8f.0.1745496251410;
        Thu, 24 Apr 2025 05:04:11 -0700 (PDT)
Received: from [192.168.88.253] (146-241-7-183.dyn.eolo.it. [146.241.7.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8150sm1852436f8f.7.2025.04.24.05.04.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 05:04:10 -0700 (PDT)
Message-ID: <43ef6713-9ae1-468c-bc43-2c7e463e04f4@redhat.com>
Date: Thu, 24 Apr 2025 14:04:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 1/2] net: stmmac: Refactor VLAN implementation
To: Boon Khai Ng <boon.khai.ng@altera.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Russell King <linux@armlinux.org.uk>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Furong Xu <0x1207@gmail.com>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 Tien Sung Ang <tien.sung.ang@altera.com>,
 Mun Yew Tham <mun.yew.tham@altera.com>,
 G Thomas Rohan <rohan.g.thomas@altera.com>
References: <20250421162930.10237-1-boon.khai.ng@altera.com>
 <20250421162930.10237-2-boon.khai.ng@altera.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250421162930.10237-2-boon.khai.ng@altera.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/21/25 6:29 PM, Boon Khai Ng wrote:
> Refactor VLAN implementation by moving common code for DWMAC4 and
> DWXGMAC IPs into a separate VLAN module. VLAN implementation for
> DWMAC4 and DWXGMAC differs only for CSR base address, the descriptor
> for the VLAN ID and VLAN VALID bit field.
> 
> The descriptor format for VLAN is not moved to the common code due
> to hardware-specific differences between DWMAC4 and DWXGMAC.
> 
> For the DWMAC4 IP, the Receive Normal Descriptor 0 (RDES0) is
> formatted as follows:
>     31                                                0
>       ------------------------ -----------------------
> RDES0| Inner VLAN TAG [31:16] | Outer VLAN TAG [15:0] |
>       ------------------------ -----------------------
> 
> For the DWXGMAC IP, the RDES0 format varies based on the
> Tunneled Frame bit (TNP):
> 
> a) For Non-Tunneled Frame (TNP=0)
> 
>     31                                                0
>       ------------------------ -----------------------
> RDES0| Inner VLAN TAG [31:16] | Outer VLAN TAG [15:0] |
>       ------------------------ -----------------------
> 
> b) For Tunneled Frame (TNP=1)
> 
>      31                   8 7                3 2      0
>       --------------------- ------------------ -------
> RDES0| VNID/VSID           | Reserved         | OL2L3 |
>       --------------------- ------------------ ------
> 
> The logic for handling tunneled frames is not yet implemented
> in the dwxgmac2_wrback_get_rx_vlan_tci() function. Therefore,
> it is prudent to maintain separate functions within their
> respective descriptor driver files
> (dwxgmac2_descs.c and dwmac4_descs.c).
> 
> Signed-off-by: Boon Khai Ng <boon.khai.ng@altera.com>
> Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>

This patch does IMHO too many things together, and should be split in
several ones, i.e.:
- just moving the code in a separate file
- rename functions and simbols.
- other random changes...

> -	ret = readl_poll_timeout(ioaddr + GMAC_VLAN_TAG, val,
> -				 !(val & GMAC_VLAN_TAG_CTRL_OB),
> -				 1000, 500000);
> -	if (ret) {
> -		netdev_err(dev, "Timeout accessing MAC_VLAN_Tag_Filter\n");
> -		return -EBUSY;
> -	}

> +	for (i = 0; i < timeout; i++) {
> +		val = readl(ioaddr + VLAN_TAG);
> +		if (!(val & VLAN_TAG_CTRL_OB))
> +			return 0;
> +		udelay(1);
> +	}
> +
> +	netdev_err(dev, "Timeout accessing MAC_VLAN_Tag_Filter\n");
> +
> +	return -EBUSY;

... like the above on (which looks unnecessary?!?)

/P

