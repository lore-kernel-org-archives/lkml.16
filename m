Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA362153CE
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 08:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750927533; cv=none; b=jouqIxNj2HlYFYtbwMueSGtX90S7IC7hM4U22U8BpQQsWdUL66rqbe2mJtrXA3tbgbB3/XI6S7wutoOs3hx7IqWR/yc2VqbYZZrR+wWQMh0eO86Q6DKu1El3czWkoD062MQr7QWepZUHycWNfa9h/X6AfA937IcVSUma/slOCws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750927533; c=relaxed/simple;
	bh=TtBYmGz09D1CMPRG3OSGWyOHLjbRQBekiXRFdglC5Rg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CCYNJXWiXKG5n/37nT7L0T/72+hsDC5YB/1JU4UKkhEp35Q5JZuvjzL0jucIQKSawZc1532+X4ZutBJMCDTXjXuaq07+Tu2xOvOn28gJNb55lk2GEICtRohO3lH2Kopa+3xlFOW3BNf724aBeUoq1q+KYH/OnK5LC/kLGQNSfgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hXUJPd3n; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hXUJPd3n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750927531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4cWzGMtcq1CX7XXiip+KlPwG5ITrP6Qiqqd5StDP8cc=;
	b=hXUJPd3nAQAGNON6NuEn9J4rG4aSDRlbu6gPRL4HspGs5ITZCe6XjxMeEPf9f49LX72hoO
	OCCYVk8AO23DSC5VptuzbDrS6AUye9iKxVT/WYn/IovWUJxy4LfVfGf8/xtLlSZFDYrvIe
	t7Odn5rFGy7TRDFEjWyr9dJUX2fH8EI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-ImR3CxPzMUSYkjaImqO6hA-1; Thu, 26 Jun 2025 04:45:29 -0400
X-MC-Unique: ImR3CxPzMUSYkjaImqO6hA-1
X-Mimecast-MFC-AGG-ID: ImR3CxPzMUSYkjaImqO6hA_1750927528
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a579058758so277136f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 01:45:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750927528; x=1751532328;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4cWzGMtcq1CX7XXiip+KlPwG5ITrP6Qiqqd5StDP8cc=;
        b=UJ3KB1asLm4zYOD0gFQFCg02qzfB/1wGNd/7X7+be6IWcJ8JD6mmh8yWC+EXZhcve2
         u/+SN7OqlT8IVIh22gU/xMk39/vw/2Rsu9xbI9MYEYldGotsvTN01xaDF/I5pGPk+tup
         nd6Irw40ffwFPcMf94bT9A3rOwFYeiXGf7nj+my4gD4IRnqaow4mq1o1HCl5ozMB2BBg
         PSeWZ5KU3mHkGd5jzEFdyaqNON/C1qWrzA+FOLd7KDiKUdJL+bq1IzZ+s3nm9g5WmWEJ
         ZrRJ/Jpi+CJqqcC3KWaCWNDRqpgfi50qpWy7SG4jiNw2OiawQqGAZ3ZX9B2klnixbXSM
         sb+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWnw9/0VtZ2DXEwu5PIgmhG7+BcBSDfdKBb7cKRuyHVO4szSFzBNK1f/wEUMfEPSq/WhdIKZUFrE9TokWI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxetCoUz5N0D73zIe3hPLOU7JwQCPffEjMZry9/ShgaVQe8W6a5
	nhTa+/wcMcUDj03ZqWHq3Nww3wHTB3w5UUMfJCx1t6OFS1NK2LwENfrR8uuCRlpMai8rjtLhLwp
	8Y0XG4y/ejYlkWHbomK8ygdC/GE1o2SGF083UZgv5vrtqVmtK5f1NLLhDSIo5S+KjRQ==
X-Gm-Gg: ASbGnctEdPNWSbZPjzLUKuuNDu4Aytsbm4Xps3/NtpWgNBiI/Krehu3QxGPf4FqP2qN
	oCpBHXBIMlJIvRgDQWAEQ1xTuWbzayyh0N2wypKSf4jF8xqVFw3mor6/ZJuuZJpHPP3W+psjvMW
	1IzsM2qOmaDq/45GKfkl1qDYSDrbK6MDXmcPeeF6xGCrCGYv/yV3w6g3ig9Ar/+RPZi+uK5My7b
	x1HX+Ly1BfTESzo7LrPzsMs+c0LnWwGdZ8NcAHyznVzzqxtlTWkXdSHet2g9bKLAI+8YjxjXguH
	4xeGdnktl6Yuc8o6oMp61lb4uS5XNLIODqtUHTVcvdimb4sHKiCEl9abtvIpMqrhl4uxjA==
X-Received: by 2002:a05:6000:178f:b0:3a6:d93e:5282 with SMTP id ffacd0b85a97d-3a6ed6690e4mr5277896f8f.59.1750927528353;
        Thu, 26 Jun 2025 01:45:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfVGIXnx8DHzz8BcUPW88UwI44879NNMEZ1ofZ9l4yo10/vH91SYC8imFRfdyLgvvW1VRVWA==
X-Received: by 2002:a05:6000:178f:b0:3a6:d93e:5282 with SMTP id ffacd0b85a97d-3a6ed6690e4mr5277871f8f.59.1750927527937;
        Thu, 26 Jun 2025 01:45:27 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:244f:bd10:2bd0:124a:622c:badb? ([2a0d:3344:244f:bd10:2bd0:124a:622c:badb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c1easm42572895e9.3.2025.06.26.01.45.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 01:45:27 -0700 (PDT)
Message-ID: <182b7c26-2573-40df-9bfc-663dd53a394d@redhat.com>
Date: Thu, 26 Jun 2025 10:45:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4.1] rds: Expose feature parameters via sysfs
 (and ELF)
To: Jakub Kicinski <kuba@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: allison.henderson@oracle.com, netdev@vger.kernel.org,
 linux-rdma@vger.kernel.org, rds-devel@oss.oracle.com, tj@kernel.org,
 andrew@lunn.ch, hannes@cmpxchg.org, mkoutny@suse.com,
 cgroups@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250623155305.3075686-1-konrad.wilk@oracle.com>
 <20250623155305.3075686-2-konrad.wilk@oracle.com>
 <20250625163009.7b3a9ae1@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250625163009.7b3a9ae1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/26/25 1:30 AM, Jakub Kicinski wrote:
> IOW applying this patch is a bit of a leap of faith that RDS
> upstreaming will restart. I don't have anything against the patch
> per se, but neither do I have much faith in this. So if v5 is taking 
> a long time to get applied it will be because its waiting for DaveM or
> Paolo to take it.

I agree with the above. I think that to accept this patch we need it to
be part of a series actually introducing new features and/or deprecating
existing one. And likely deprecating new features without introducing
new ones will make little sense.

Thanks,

Paolo

