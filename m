Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1481B652
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 06:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748326139; cv=none; b=EfPU02eznU9eFnW/b25CYF21rKz6348P86UbDziSzkmaw/qw/NZUMIwpxMIluZkLK0bfDvqHA0Ry1mVD0c0/WmJ/RYdPQajTQ06hxUFauW/11zDD/LDPoPM39wiiAYGJZo720bnVggTEM17QWIZf+L3r6u10pMY0R2bsZdmdTOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748326139; c=relaxed/simple;
	bh=61jbQ6fa6Y3o4tynXM0JiWhjtIWbokyFgJb882cjQfI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rf9tRkblBY1FhHacLHgNkuFjhS1YeSMsqzAdC6V/f88fKDi9JdITir2DLKAQbXJ2Is37NPHVZlGLpq2cAa4n5OFsBgzcltzvtNBeeYqMG3lgHSteXb3SOFF1wYO2ge2dXj7hPZLnV91asYqbjIjtDTtEluUpnTA3Y64/+tgbDWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ach95SFY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ach95SFY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748326136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yr/iHE42lciAZJuWsNNhCZ1eCfByYTSyjML/1uGKARw=;
	b=Ach95SFYnS3eIkGgZIbMS6atkt736gFRaCxPhMDka9hikYMCPg8pIc/FcY5Y/AWxlxAvAR
	MnCdcI9BZkT4MCjaicMk0L8eF4AUFbf5HllTl9oUzey5OAH1vXMpzbuI+TXoVaH5tjdSsc
	HAen6N+/nJngO50VeB2VDIA/a9hZq0Y=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-205-RahEunf4P-ibuQG0ekYrDQ-1; Tue, 27 May 2025 02:08:55 -0400
X-MC-Unique: RahEunf4P-ibuQG0ekYrDQ-1
X-Mimecast-MFC-AGG-ID: RahEunf4P-ibuQG0ekYrDQ_1748326134
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-44b1f5b91c1so22143535e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 23:08:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748326134; x=1748930934;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yr/iHE42lciAZJuWsNNhCZ1eCfByYTSyjML/1uGKARw=;
        b=EB74zD3WF181aEqnpC7kPTc33Fh2qxV099J+cGqlE2iZMYIeT51F0HYDr4X0cD40+C
         +Etc81PcE5fz7benwx1PNKPQdOYBZycihd0kWl2fMF1sh9H3Ng/7j6jo7zLUxza7tu7J
         dlb7JbHQsJ1U7G1jRVz2Z/d3+JoBoMl78b15pH8cZjt5YmmYgQicegMMJBx9RYfhzbJE
         5Hac2WeamHeDU+BHi97/ctvzjFofoB/2SqQZR5eMNx64haSSqsd/6b0HWLsKCLZ2Zn/G
         AtqP0wWD7O1Swti/uDaHBcFpmG/Ilz+bBCRXPhawE2WDBbsaK0NNvwvq/ASePPbx7zBi
         30mw==
X-Forwarded-Encrypted: i=1; AJvYcCUryyj6/6wowLRCOs5orJlwuNY2VS2CjvTf6aCiFKhBU+hGw7zbud2hteKAHXslEaxmKLunRU+PNMF77Hc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOppZmMbTDfhT1hB+rRE3ao1HhL11AZW30Y0S8PucTD5OtHNu3
	LopG8GvklQFSR7AVaQubJ44mAcF8xJtWXNUEhu2T1xlcUud4CZN2JDbmnKVbhguoG1rcfSnamd1
	ToZXOdNIrTKXvs/glZAAPL1/qvzmCrQuoDJuP09bMpNg89GVOqgqZ1V5UDpnUeGJLeA==
X-Gm-Gg: ASbGncukB7yQyILf2h7F0AwOXjWmPg2JjpLPdENQqXSoviWeZA0UyQne2bJCBsgJC4I
	boBJnfMbIIdhW4iCKvnzOri/dABGvL/x8yf0VMy+r9fsnwe7ufAxlXyumNSjA3pkTrikV9IG210
	7m/s5PtVvdpEpmHQRzNSajWvyQf7M/ubsvoJg6VaY02OJU2RgNCaoqhOOXcX0CqnuK21cv3T6/H
	DKARaafn1+UG77pQ437yzuRHcF2pDVaVsf8jb4CdfKW6ss63LZuFG+oSYivKaT6QRl7PqwZebPA
	kRtUrVyo/oHkkIdQWHhsf+O+f50Tty47K3grRvH2ThK9k9jdV1zBsKaTEQc=
X-Received: by 2002:a05:600c:8012:b0:43d:45a:8fbb with SMTP id 5b1f17b1804b1-44c92d3516cmr97440715e9.22.1748326133816;
        Mon, 26 May 2025 23:08:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtEENZYkJ7PmbK5PzUATkfuQAjGiCkwpYW0D71exXRVvHMfIITt9n4VT6TFIbYDLgAOtnPFg==
X-Received: by 2002:a05:600c:8012:b0:43d:45a:8fbb with SMTP id 5b1f17b1804b1-44c92d3516cmr97440385e9.22.1748326133458;
        Mon, 26 May 2025 23:08:53 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2728:e810:827d:a191:aa5f:ba2f? ([2a0d:3344:2728:e810:827d:a191:aa5f:ba2f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f6f062fcsm253027875e9.15.2025.05.26.23.08.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 23:08:52 -0700 (PDT)
Message-ID: <10a15ca4-ff93-4e62-9953-cbd3ba2c3f53@redhat.com>
Date: Tue, 27 May 2025 08:08:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2] net: sysfs: Implement is_visible for
 phys_(port_id, port_name, switch_id)
To: Yajun Deng <yajun.deng@linux.dev>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, horms@kernel.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250521140824.3523-1-yajun.deng@linux.dev>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250521140824.3523-1-yajun.deng@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/21/25 4:08 PM, Yajun Deng wrote:
> phys_port_id_show, phys_port_name_show and phys_switch_id_show would
> return -EOPNOTSUPP if the netdev didn't implement the corresponding
> method.
> 
> There is no point in creating these files if they are unsupported.
> 
> Put these attributes in netdev_phys_group and implement the is_visible
> method. make phys_(port_id, port_name, switch_id) invisible if the netdev
> dosen't implement the corresponding method.
> 
> Signed-off-by: Yajun Deng <yajun.deng@linux.dev>

I fear that some orchestration infra depends on the files existence -
i.e. scripts don't tolerate the files absence, deal only with I/O errors
after open.

It feel a bit too dangerous to merge a change that could break
user-space this late. Let's defer it to the beginning of the next cycle.

Paolo

