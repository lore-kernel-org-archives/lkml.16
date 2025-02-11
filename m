Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1744C1F91F4
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 11:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739273468; cv=none; b=WlVQM2p3yL5n8K61QpV3VmgZgKHlLcjZEhn4KSBMflEpMGjp9mEr7TGbhnnUaCMgl/TQn4cP5ytlFZ4QrYf2wlsAwGQAnzyXIrLCOynytlEQPAhbcpR/sun+x39RzvlnE7C2bfIDPeNhJsJoWop+4jhceBdrVavrj52+n48EiiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739273468; c=relaxed/simple;
	bh=SxRO+2V18543uuVvqtYarJpvwbWlhVTPdjSnXR1nptc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PqNOG0VlPN5g6Q/5TWX/HZghlDgbETR8pDHxbHhNl7sUKitOEGr/MFRx6NxOrUNF+SdEJupnoeYOSvr98Un8/y7FuqI69uXfl7d0Q2YIziy48VWyIvIB5QrIBca2Afw7IjjlQ0y88inbpuJ/Uj+oBlAGnmwPHij2/k01V/xMA7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iRcdmmU9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iRcdmmU9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739273466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XkXaSMBOnMyZHKLeyMgqeVTTrgOxiy57mT/LG6mdTOI=;
	b=iRcdmmU9qqev8AtTQGqwZUv0F4lvJCCrGCbZMwiqng7VBiv/0u04xAEC6EXqPDUMeKh8/M
	zNXWxur0wnBMXvWb/OcBV+5yTb3rY8GqBpUuBBb+PUNbHwhN0lpm895AZvY/RYjVN6aI69
	VpTKCmsJGVo1AI0X81+GjgHFk+kmgfY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-552-AebRzFivMdGaW8Q6OpPUfQ-1; Tue, 11 Feb 2025 06:31:02 -0500
X-MC-Unique: AebRzFivMdGaW8Q6OpPUfQ-1
X-Mimecast-MFC-AGG-ID: AebRzFivMdGaW8Q6OpPUfQ
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-38dc88ed7e6so2886155f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 03:31:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739273462; x=1739878262;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XkXaSMBOnMyZHKLeyMgqeVTTrgOxiy57mT/LG6mdTOI=;
        b=JucQCUp+U1HBXg/esbPxyimKuCGdFbOBZO4G8XN32G3W8Mged88LzlGAZazy9C17Fd
         1it4zZlEgvU/Syndn0yw0i3fglpudMGxKjzZm/E+T9/UiiFBzn3RtCew/khoLJ1zpN1e
         GGbv89+8d+fome8B+uc8K8QBENMhBNMAmLtK7iZ4YaZqg+2SmjA1pVYZfletl5bYWtni
         O6fl7Vm+unh3qG4aTf+k5rE6mcQdSnitlRHJzKH931+znZXw8ih3NZRzEafwaNLVjud8
         CYTpmvIbL7LC7ocHYZw47UKpzjP2Ar+NPhT/MEANJBfY8BH+8vbgkjdBAS8Ch6Z0URQy
         +nEw==
X-Forwarded-Encrypted: i=1; AJvYcCVDklvo5yp1t+DQV5Iu78PPHXf39sHCqmfQhK1z1QSHW59rLMpCyqI6ceJs02uprlpDbVfLNyH8SKLy42s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNVu9OXdiBj171nRpfM7H5rmCE3KkLyCzkeBSEV3wbAWfh7o4H
	lMUMaM4DfXAG9dgH5PkQYQN+koE5R603aWy9ycR80jxxLxr5qTjLx/ogrAPgHeAqaQcV745V9M+
	b0G2fIjbBE6RED5KdGFH288yJlbLYpX25iKgXslhhfk0M8SEhRQGxyQNwtOH0xA==
X-Gm-Gg: ASbGncv2bgYreqS8X8o63kLR0D2NWzUyL9L3Kp3wQ20Gk0gWfqEBoApm/gGyveom3or
	00LHNJ9oz0EzZSf1kIAGLvE3ffMV0OPGCLIo2wZ+rOrF0j7P0JQq35a4zKwpgmCCdkXsOLVNhO7
	aRLzLHFaKBPPRjte9tmY4pwyRQv830FQCQkT8iyKZ6xphWb163eE/uDVHSlxV/z/IQ0b5wQ5m+m
	lIEsh2kW2iKVY4Zb6j2ujY224bziuMMRa9Fy5mUzVrrnK0QpNQqe2sA3xQYa7BQHBALi/IsRBD/
	65EJR3xtkJZiwtQxlxtVwESSIKRxSiTibzw=
X-Received: by 2002:a5d:5846:0:b0:38d:def8:8307 with SMTP id ffacd0b85a97d-38ddef88639mr6802184f8f.55.1739273461507;
        Tue, 11 Feb 2025 03:31:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHayBvfNx73SbQMhbxNkafqfD+FDlmMiZt8eb9H+FDR01lT95RUPwq8zXQKROFW+H5GCWVS0g==
X-Received: by 2002:a5d:5846:0:b0:38d:def8:8307 with SMTP id ffacd0b85a97d-38ddef88639mr6802140f8f.55.1739273461119;
        Tue, 11 Feb 2025 03:31:01 -0800 (PST)
Received: from [192.168.88.253] (146-241-31-160.dyn.eolo.it. [146.241.31.160])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43941ddc8e9sm68421845e9.26.2025.02.11.03.30.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 03:30:59 -0800 (PST)
Message-ID: <6abfb27a-8116-4b15-9485-39e5b1f98c2f@redhat.com>
Date: Tue, 11 Feb 2025 12:30:57 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: stmmac: refactor clock management in EQoS driver
To: Swathi K S <swathi.ks@samsung.com>, krzk@kernel.org, robh@kernel.org,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 conor+dt@kernel.org, richardcochran@gmail.com, treding@nvidia.com,
 Jisheng.Zhang@synaptics.com, ajayg@nvidia.com, Joao.Pinto@synopsys.com,
 mcoquelin.stm32@gmail.com, andrew@lunn.ch, linux-fsd@tesla.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 alexandre.torgue@foss.st.com, peppe.cavallaro@st.com, joabreu@synopsys.com,
 ssiddha@tesla.com, xiaolei.wang@windriver.co, si.yanteng@linux.dev,
 fancer.lancer@gmail.com, halaney@redhat.com, pankaj.dubey@samsung.com,
 ravi.patel@samsung.com, gost.dev@samsung.com
References: <CGME20250207122130epcas5p1857043fa03e7356dc8783f43a95716ef@epcas5p1.samsung.com>
 <20250207121849.55815-1-swathi.ks@samsung.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250207121849.55815-1-swathi.ks@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/7/25 1:18 PM, Swathi K S wrote:
> Refactor clock management in EQoS driver for code reuse and to avoid
> redundancy. This way, only minimal changes are required when a new platform
> is added.
> 
> Suggested-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Swathi K S <swathi.ks@samsung.com>

For unclear (to me) reasons, our CI failed to pick this patch. I guess
the too wide recipients list confused the CI, I suggest re-spinning
including only the ML reported by get_maintainers output and adding the
target tree ('net-next') in the subj prefix.

Thanks,

Paolo

