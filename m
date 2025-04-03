Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33563597B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 11:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743681041; cv=none; b=Yt1ghwXOKjmBKim1mhqiWYQjBgNfJs3uaFLw/LmHFKKeMxbzDmN7c1thQRcXTwcFLuWQ1kkhzF5I7EweOykkM2IpMbavgXu4iXeqGugx3VP7y2Hm89tL42z3xfojmvdXB+GCThRf3Qe+wyHiXLRVxi0ICoPUco5Kqb/fPVvk3Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743681041; c=relaxed/simple;
	bh=JNO28fWoaC+tM1jLqwaTtDbEJcdNZKd7TIPKVu78nOo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hW/QTHerGA2hfgUlzpqeW03XVJ6TTBvw0Vgx5Y9wIg7a2a9XBdlEspoD67Hlvl4k17iaqS+VYVSK/Kcqwvlr3OMA4Nw/in1nDSckFpjsoeaNJYyTfV31sJ1ndABiuQ+31aPDwwX+6Bw1l055Tvpo212YkF5NCVAZmmbK6wAnDnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Bo3ce4VE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Bo3ce4VE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743681038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7Zj6XuVGPfM2793V/JcD1kmv5tyZDJv7xCPhThA49yQ=;
	b=Bo3ce4VE57If01R0F6eImRYYH8NQzUAkCk75j6IYpFH4KQL+DDBkaIZ7efMpcS4KUj6N9+
	OE+gSsZoq6EhpxR88R5qAp7/ZUdcEGvHPiP8RV7r1LDT3CK23Y2lcj1QmpIm56wKqd0844
	QZV4M/zccx7I1abL9CxUZ+cKkyzypUY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-423-p7P899QUPeO7PnEard5NTA-1; Thu, 03 Apr 2025 07:50:36 -0400
X-MC-Unique: p7P899QUPeO7PnEard5NTA-1
X-Mimecast-MFC-AGG-ID: p7P899QUPeO7PnEard5NTA_1743681036
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43e9a3d2977so5419545e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 04:50:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743681035; x=1744285835;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Zj6XuVGPfM2793V/JcD1kmv5tyZDJv7xCPhThA49yQ=;
        b=N/d7pGWOdhqf6Xq+FoewAqcOTPJEoyGqUcyjwKyPYUiyeon1zWiRg9eirR9sxnqaz1
         fi1k5Eim8rSQOGs/1fHaayxLu6al0O2Z2KUNU/5tpJx5JP6JMDHY5KbeLz6qom+TA8gz
         l2bQOqVGwStUZk6ER1RO47VuRi0FPBLcZe6kr+3iE8ldDMtojKwQJcsGdXEmHHjTwq4a
         IjT5K4Zf9+YREKt/PGyA0I0lNUwFT19SO3rxSuvIGwjWodwsP/xc4DccMo80sYVlewdf
         uMpfefPj5AeD1yCoKOgB/j2eEIpqF4HOBMmjtnBezJHrMfhOXVfb6sVejlKgjhxEuaWI
         uPyg==
X-Forwarded-Encrypted: i=1; AJvYcCUEgw1D2ORoK8o3i8+DG7ecDMR6h9LIi0U8jCK5haSPvaSSb8RiTV7G8+sqgLTDlou/ZcuTolvMc+7Ehgo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNUZyd7Qz1dAalrAEUAa7s11065mnqGzuuvOtoXqY1exhnmtrw
	FnywKZcfFbxA/9ygjtID1tto5zeVMjAbPOMgWaRH2sYU1LL8YK95ucmn8b67/zV/zZHOawoiZO6
	vJJT4StS8xjhZj4PdGPpIzY/NC2gN5/xo2ketOB8euV9b9WfNreiAe/eS4dN5ig==
X-Gm-Gg: ASbGncvgXXEABLejf1E9mwEr72TLk8m0XKhc/lUm37eE004vr9frG/Rhuu1RKQI07vJ
	+Mw4UuhmQ1B3e54CtNh0ndcYTf7jzgnC3R9TFY9FLg1vucQ9c38PHCLJ1p6oBE560HcaOSphVKV
	3yvZqGAOxFFnI1DP8ukAWyrao8MsyUew/7mYwRwoy/yCLnP5HxK83CcCtbggheatw5E7lsSOA4l
	IXswIT0PyVAuvM90E+owcoSdpwd2v57igdC7SVeeVOs488Gam2D+HR4JZ+x6SWJk+hnarTdTH0K
	K3o6e0IGDMMkj1XYlYE+LfPpndqoT6HtseOGPnZ2SIes7A==
X-Received: by 2002:a05:600c:b9b:b0:43c:fcbc:9680 with SMTP id 5b1f17b1804b1-43db62bdfecmr172952585e9.25.1743681035517;
        Thu, 03 Apr 2025 04:50:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHojKG7yA9MWLduc/LIVM8C18XHcC83gwQjAA4NdlpUvz16wfBun2O1hXFQ+pazdcIgaa5zEQ==
X-Received: by 2002:a05:600c:b9b:b0:43c:fcbc:9680 with SMTP id 5b1f17b1804b1-43db62bdfecmr172952385e9.25.1743681035160;
        Thu, 03 Apr 2025 04:50:35 -0700 (PDT)
Received: from [192.168.88.253] (146-241-68-231.dyn.eolo.it. [146.241.68.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34bf193sm16244985e9.24.2025.04.03.04.50.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 04:50:34 -0700 (PDT)
Message-ID: <fe13ece8-67ea-48c0-a155-0cb6d2bcfc52@redhat.com>
Date: Thu, 3 Apr 2025 13:50:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3] ipv6: sit: fix skb_under_panic with overflowed
 needed_headroom
To: Wang Liang <wangliang74@huawei.com>, davem@davemloft.net,
 dsahern@kernel.org, edumazet@google.com, kuba@kernel.org, horms@kernel.org,
 kuniyu@amazon.com
Cc: yuehaibing@huawei.com, zhangchangzhong@huawei.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250401021617.1571464-1-wangliang74@huawei.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250401021617.1571464-1-wangliang74@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/1/25 4:16 AM, Wang Liang wrote:
> @@ -1452,7 +1457,9 @@ static int ipip6_tunnel_init(struct net_device *dev)
>  	tunnel->dev = dev;
>  	strcpy(tunnel->parms.name, dev->name);
>  
> -	ipip6_tunnel_bind_dev(dev);
> +	err = ipip6_tunnel_bind_dev(dev);
> +	if (err)
> +		return err;
>  
>  	err = dst_cache_init(&tunnel->dst_cache, GFP_KERNEL);
>  	if (err)

I think you additionally need to propagate the error in
ipip6_tunnel_update() and handle it in ipip6_changelink() and
ipip6_tunnel_change().

Side note: possibly other virtual devices are prone to similar issue. I
suspect vxlan and gre. Could you please have a look?

Thanks,

Paolo

