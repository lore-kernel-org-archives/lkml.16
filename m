Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4DF2673AB
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 09:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744105992; cv=none; b=mTG1ShkN0+sK4xQm5UKd191DL84OKrPmi4jRf4Veln5VtpRWZmy6BKFDn1URa0KoHUxF1JMmbvYvzW1g8546moLaP4HzEq41sw9VfKBF/uLktew0MgjKJ1knu7+hflheUfkr1eGamkS2Ct5dy5zTGeBfxe3Gjeinx6G6apuYLbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744105992; c=relaxed/simple;
	bh=tl6hsjBQeQonMXTDnYhi6nODGliYWIBHUyjuBUfrnAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gc6+mbi/DUBtE9/NiPt/7+jDgNTajlBxh+mIWY5L8XJrBqbF2vYPfgGdOBF4bQna+tQBIBLSHJfpFe0/69ghg6TmYV6FgnrW6gPJwuiLupWn97NKSaGB1ywcbvYwuIgwtJFU/JKRd/XbAYTCkMeLudkCskszGFJHJQVEsrmsAVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RjYw56hX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RjYw56hX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744105989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K6IdQJKIex2zj6kh6YbEc4NA1VSydUJu++cpr9b6NXU=;
	b=RjYw56hXm8UlbtZrD8a9u0+I7ILT6f+qkmCdt4eehgg5lic8YgaVnqjrHZGcoYzBMY6Mc5
	fO4LdF+SpgepNiJKfnasElnKHD27qH1lFICC6VBYbdqBiOz7cF5khvuh/UejLwwc4tKdpI
	gbgvXyhYhj0vqy0hU2WQNAeSTIgpJ/w=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-207-eZmV7atjOKe5ch4lQaUlsA-1; Tue, 08 Apr 2025 05:53:08 -0400
X-MC-Unique: eZmV7atjOKe5ch4lQaUlsA-1
X-Mimecast-MFC-AGG-ID: eZmV7atjOKe5ch4lQaUlsA_1744105987
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43ea256f039so44921945e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 02:53:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744105987; x=1744710787;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K6IdQJKIex2zj6kh6YbEc4NA1VSydUJu++cpr9b6NXU=;
        b=XFoxjgBkib9LzOp6J74e3E2cr/dgDB0PCc25U+RTQc7pQ36w94XkzCcsDyaCEHscho
         lcJ2a26LNoxGV2DGAjoqLTdcDThc03WuwDkUcSfIF7H68LvqluP7pjeq8Cv4DnGOkqeU
         As1ybhk1HclX0M7DxuT5cdAV9aABKb+0LqG+BUHy9mXlqD++1afpxBPoEtl5WVkR+Awj
         jZi834rOHNOyJvffqCuJ2MQdI1P0g9SFANggN9qzauUu5x2s4j8xzZLH+JYx7dkFQCV4
         X9MUEq8uO3Hakyy0aaNU0LInrSjvH3NZP4gu3MUn7pfSAfdrwuY4mNGePYtvXR9Ve0JB
         xjww==
X-Forwarded-Encrypted: i=1; AJvYcCU82vMGqhmMYtaZERzrr4noa9sJCSI8+LFJmmI6kol/R+vEtwoC++spi7u3dDCB904iNSZrLSeS7FNG+W8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqjA/P86PIgteBBdiEtAf1KPQm75E29xpuf/xGeI9lKUNvaPrb
	pxAjnh7N+gJ98A9GZzXaSAs9uFwjLZm0OVO8EDSQNSYFEGfp8974K4n+NHHDRW6NT08uSCdKXUS
	xAu8j8vBLHeCIKsbckg71KhXyXA79Z8bT70lM8B8agYghkdvHK1kiPQxNtOtNYg==
X-Gm-Gg: ASbGnct6/j9i93MZls/fkl5V3EOwta3cKaPp/Van8F48fJAAE5wsFhWZ2rakeU7N+d8
	yIMWyUxdKBDVB5JcGFoLm/K5zHSaqV+mNhUcmSwK976C/0w42GmD+vCP5gLPj/75t3pjDiCjsu/
	5IuXTwLMZihZ/eGkObH4CAA8kLAnQuhO7DG8x0P4pBT+HLZ5b0x8hWm04gWuYVcCure7FWORmxp
	nekAYWNsv6nU6uETfl1oJ760ExjyetIP0TooEZt5lYCtLhONYGKiVbFYuzUH3vlRJ/+YLRlpOBx
	iNN2JgJcluwy1TfgIrSsl4WW8KVVsREH2xWQL/u+YBE=
X-Received: by 2002:a05:600c:b90:b0:43c:ee3f:2c3 with SMTP id 5b1f17b1804b1-43ed0b76672mr148729675e9.7.1744105987003;
        Tue, 08 Apr 2025 02:53:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFz3d6cwTBLogdZzM/3j+G1okZTutG7wol9mbiqFI4dzijKYne4pxJdmwBs1y1v8CdO4H7dcg==
X-Received: by 2002:a05:600c:b90:b0:43c:ee3f:2c3 with SMTP id 5b1f17b1804b1-43ed0b76672mr148729385e9.7.1744105986641;
        Tue, 08 Apr 2025 02:53:06 -0700 (PDT)
Received: from [192.168.88.253] (146-241-84-24.dyn.eolo.it. [146.241.84.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f0e5e8dfasm21476925e9.27.2025.04.08.02.53.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 02:53:06 -0700 (PDT)
Message-ID: <81d6c67d-4324-41ad-8d8d-dee239e1b24c@redhat.com>
Date: Tue, 8 Apr 2025 11:53:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] net/mlx5: Fix null-ptr-deref in
 mlx5_create_inner_ttc_table()
To: Henry Martin <bsdhenrymartin@gmail.com>, saeedm@nvidia.com,
 leon@kernel.org, tariqt@nvidia.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, amirtz@nvidia.com, ayal@nvidia.com, netdev@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250405100017.77498-1-bsdhenrymartin@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250405100017.77498-1-bsdhenrymartin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/5/25 12:00 PM, Henry Martin wrote:
> Add NULL check for mlx5_get_flow_namespace() returns in
> mlx5_create_inner_ttc_table() to prevent NULL pointer dereference.
> 
> Fixes: 137f3d50ad2a ("net/mlx5: Support matching on l4_type for ttc_table")
> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> ---
>  drivers/net/ethernet/mellanox/mlx5/core/lib/fs_ttc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/lib/fs_ttc.c b/drivers/net/ethernet/mellanox/mlx5/core/lib/fs_ttc.c
> index eb3bd9c7f66e..4e964ca5367e 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/core/lib/fs_ttc.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/lib/fs_ttc.c
> @@ -655,6 +655,8 @@ struct mlx5_ttc_table *mlx5_create_inner_ttc_table(struct mlx5_core_dev *dev,
>  	}
>  
>  	ns = mlx5_get_flow_namespace(dev, params->ns_type);
> +	if (!ns)
> +		return ERR_PTR(-EOPNOTSUPP);

I suspect the ns_type the caller always sets a valid 'ns_type', so the
NULL ptr is not really possible here.

At very least an empty line after the return statement will make the
code more readable and the commit message should be rewritten to better
describe the issue.

Similar considerations apply to the other mlx5 fixes.

Thanks,

Paolo

