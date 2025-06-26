Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D451B85FD
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 09:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750928495; cv=none; b=YOBNIYlM/6rjDkSp9OLiPO+spkqBWj6Yg6hzLAJVIxIktp+BD5w/afhjQQ5ENiNDEDtNKNa27rSVq3DMVkoqDnLR4uN3P6oB1ArVpKJWrcsE0HefR1jQrg/aHXwbD4Yv+n/tsv2qbp0mt76nNdDh1bz+Ntjb1zxW+YuE5XZSW5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750928495; c=relaxed/simple;
	bh=V/+xd8na3ScrW6dHL2oOP22RCpzGwcknKLxV8kskNz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gsz2XgDqTQoL4/nYAPrNEhXYzDIwmSslvvcdHDTkngPpmMW6lQrJI3zXKDLWox2kvfBnRSJEyp2p6qDfkStd5Zrd+vkJRO1l30CeRlanyhweRZgSoXT/Q4ahHQTc+mTICNIfZTQ8e7WBBrWMg1xEa9kxYUypR5yunhHvYLy32X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ycbsa5/A; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ycbsa5/A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750928490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S7C/XYnvTlg+p4+wGljKwIY953bj6tkUufxSfXORvgI=;
	b=Ycbsa5/AKdgS1Dnck3q8AT81qFhyPzj8H63xGphVIcf2B5RKC16m/iboPWR3dCvUWGp42L
	RDzdp+j0G6Pmuhui8CsaCZAJ85q/GIWzzUx5vG0pbbDVp0rPPHXw/Iy8hsx7zOOlSswE50
	bC1fi0vnev+ndYQjCiHdatFMeEaGbHs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-146-hr0xdEYkPjyzhoyGGhGaWA-1; Thu, 26 Jun 2025 05:01:29 -0400
X-MC-Unique: hr0xdEYkPjyzhoyGGhGaWA-1
X-Mimecast-MFC-AGG-ID: hr0xdEYkPjyzhoyGGhGaWA_1750928488
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-451d7de4ae3so3727305e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 02:01:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750928488; x=1751533288;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S7C/XYnvTlg+p4+wGljKwIY953bj6tkUufxSfXORvgI=;
        b=wtqh9MldG0Z81EFSaF5l9JSEzvNWJgVvZswMo6yAPXWjj5lYN03QlVRp9DkGvqld6I
         S1RRtu01WcmA2u/grk+PTZBmYT6qQ10YJpgwHdW38ZjcxCKo9a43GmIdqBRr/FhS3ulj
         PVd5Q+nb8sRnLmAT2Be5mQlt+CGRuAgkmPzE23JBr3V5IcgKv2hNibkS2J3x/xdrTB/X
         QT2Tcyb4WWAa9+W0FwdOC37Dl6e8NRppSRoY2OHH+bFMa3xCZlGCNu4Oz9Ejj2w7FUvX
         dlSDNl1V3ofEi+KNirolrtxicP11oypfS7oybR/YsCGLCWMflnAKy++HFhq4L4HXmDF7
         5lhw==
X-Forwarded-Encrypted: i=1; AJvYcCVlft6zPYaeIkjAPH4E4lG8oqiNzWih+yCj7QDmWwfoOWqrNKP0qyMtUaLz7s0kscjZthUEFNVcRV6cvfQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkDQrNW0wMl+3mX6c3mndhYUb8i6yvzY53D+2cSPuk5fTaaRug
	QlSDhZbiqFOgQgtKeJLHzLTM2yNGMJdyjdgicbINMDZ3fiGLb/8WKKWNlBU5p/uu/85T5EY3/LB
	JlzIP9a5tNWnzHT0Q0Edlzcv7nPyqgt4NWY8qJaouDyFumodHjJK9ZtDmWzn7RatMKg==
X-Gm-Gg: ASbGncs6b3VZLhH2eddJrt7cVMFA0+K6IYQqF+d9AZdKlpeL4GEc9u2Wzlodo3EKl3k
	tOpQ2xd/vVV/Q9vamzQL92OYCs0V/v2DiMfYsKHdqdtATo9EQnk/KAlusjQgA0wC4KJIM03H4Os
	koBw2Dcu5Ux7rCX4nPGK2TyMRP0Okr71WWNXBTql42XSrHPBPU4QNOYi2D60BQUAvp1+W+NbAVZ
	XTuCDNCQWLVHzBrwMjkma1/DYMSoNOnruXdFQCcj4mQplg+CUDT5hoJ/Ir7Y0CR4sdho9olhMrl
	2CODfaiPdLAtHnbVYo48yqV/Y0zZouBL/r3y52f3nNhpaBKCZh6AjM26GjtvM+ILM1pJ7g==
X-Received: by 2002:a05:6000:1acd:b0:3a0:aed9:e34 with SMTP id ffacd0b85a97d-3a6ed66e377mr5900010f8f.48.1750928488043;
        Thu, 26 Jun 2025 02:01:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRnNgtEu/IRO6+46Z+WOGFPBJefKUBFyzqv8DKDS3z9R6AGvf9Dr0B1zMMndjl1+awYL8WVg==
X-Received: by 2002:a05:6000:1acd:b0:3a0:aed9:e34 with SMTP id ffacd0b85a97d-3a6ed66e377mr5899964f8f.48.1750928487558;
        Thu, 26 Jun 2025 02:01:27 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:244f:bd10:2bd0:124a:622c:badb? ([2a0d:3344:244f:bd10:2bd0:124a:622c:badb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e8117187sm6593325f8f.101.2025.06.26.02.01.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 02:01:26 -0700 (PDT)
Message-ID: <637bf12b-44e0-470f-b86c-43667fcb7e7f@redhat.com>
Date: Thu, 26 Jun 2025 11:01:25 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [net] net: thunderbolt: Fix the parameter passing of
 tb_xdomain_enable_paths()/tb_xdomain_disable_paths()
To: zhangjianrong <zhangjianrong5@huawei.com>, michael.jamet@intel.com,
 mika.westerberg@linux.intel.com, YehezkelShB@gmail.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: guhengsheng@hisilicon.com, caiyadong@huawei.com, xuetao09@huawei.com,
 lixinghang1@huawei.com
References: <20250625020448.1407142-1-zhangjianrong5@huawei.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250625020448.1407142-1-zhangjianrong5@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/25/25 4:04 AM, zhangjianrong wrote:
> According to the description of tb_xdomain_enable_paths(), the third
> parameter represents the transmit ring and the fifth parameter represents
> the receive ring. tb_xdomain_disable_paths() is the same case.
> 
> Signed-off-by: zhangjianrong <zhangjianrong5@huawei.com>

Please add a suitable fixes tag and repost. You can retain Mika's ack.

Thanks,

Paolo

