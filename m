Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1B04C74
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 08:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743840589; cv=none; b=iQDWMmJS8+fPhCSp4EaSJTpAKHQA7L9V1KusdF53yYvAIJFnMQQLMhRTj3wvJ3qnoHfIdrnnuqRCkztHPQTOP7KAwf7nHE6BVnUz/Ao2k2cvQrMDoRg+XwBpcIkMbhNDyjstoM4HiY5FnQ8IcYh3nIRS6mdv7m/GFKYpL+/QuyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743840589; c=relaxed/simple;
	bh=xpYMAwtnNfE9chsuIaMja5VW7WUGODl8F8mPADK0ESA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DDFsBCsq3/UcWJbLBnBAjq7ghLE7+AhNR8SAfDCYMrOKIEHbG7AJEpoSagxF5hAIgdbr1tGGR0vdhkwhn92vtkLQcn1Q5wD/1CvE+2Fer+X0NVbPBRBAJuVsQ31cLsFP9kYpEaQaP3znAe1NtCNsKT+x0hTn5QaXXok1QC+pOt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b=QhnZebYv; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b="QhnZebYv"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38f2f391864so1536373f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 01:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1743840586; x=1744445386; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/QZsIuICHFoqyu64ZjWWku6z9fVSAzGTu2pQOtSacSA=;
        b=QhnZebYvfDeV2b4ILAagTGkiuWwI9ZG7Db8hbnxraAfcAvKzaD1OlbWoJvZKERDPT9
         8jLML4/gNTNhpLgNV7c3OxT2iQlnqjFG1YrW6mEDVQ7vWLovVNUx3OkfiB3JGSQJ95nw
         zCPC/z+Pc4USt0QFsfrEUoLniNsBnji9ThFK7/i2vJvGlAi3muoNl+JUo53KnzWc7iD7
         xsiOMXztdiSRZwXpdogNOdmWjsqHepBNcvms5Wvxv7IL6LKlzys8IQYgmCfugBYvHOX0
         WLif55iHi2NByiuLuzdJE/PCchCiwU7QhssetVKdk5bD6G2YssGqRSYjCtQd+8bTXaz/
         BK8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743840586; x=1744445386;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/QZsIuICHFoqyu64ZjWWku6z9fVSAzGTu2pQOtSacSA=;
        b=o6tbCaLaTY3HwIZTgYafCMwMdJiDmkhYW6IYVRAiXZ7/thcMK3ci84kca0YdYZrBfj
         MjOoyroc6QN/m02d3MQ4YWscKmDZd207ZBwGQt0YkenR31bsAXM8crZtg1obmrRP6kVN
         2nSSbqnESSuLpCPELWFuJEUJfSeTgp+XijHx43lpfYY85UBUhXhOCz8zN+gFmMiqN40g
         Fq2viBgD4U85PkIbvOkDb7r6mLoag4MsSGk19SS3SX9LCCteXhK1dMflpO1aVNWKcQzr
         fxPHswO003De4HXIcHk7K0FTL8kr4LV8mo9d5MiqvpHX6KdQD3CLmmi+WHY7TkRnGZbm
         s3/g==
X-Forwarded-Encrypted: i=1; AJvYcCWK5R4sBxKap4QqHEUBT5ZqffcP9Zk7A/nVcNbwPJCE5rH+PZbBv1rC/CLXgehL1w78BNS4XavF1UtHTc0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBBqPxe8cAMPzDoiLZbhX9JF8yURmgaEszSEUsoyqUTVKTuRka
	DVz4A+y2mg9KucbzFiTjgKi4LqeNytQFYaDcqwXCpftgS9wpdzrckxfpcS46jrM=
X-Gm-Gg: ASbGncsGgsP50lhyKyXPh58CE/QCaSfIkd6cqyCBcs+jMcM1Ysnj3/W/6rM9NZesM+4
	pROZzq9/DAsBQHrJaGj4hj7N2sTCfAY7OTqGWBAzigiHgUz3p9yiIlrOzjQJg1y/p6Uh8lHLwaJ
	3cUklxONwl4PkkDDtHMYSZj5iJRjQXWKbf43ORbrJ3i3Lt7JCi4bMeM6/0juthkouShJonlhAXO
	us6cWOnkwuvnppK++kharhrxhg9H9nMFhscN131kZxOIAP0fQ3lFdTfUv6P+MCionqGx5pL8WHP
	RqrECl88QQULaYfvK/mCS8CiML6T+H25hbPb6m2FwrYfGtmhWXfvhyC3DZutSnxBlJmRVxyywa+
	H
X-Google-Smtp-Source: AGHT+IFHXyrO4duwB/8ct3hbp2ZVFrHLWPnHZ+LzJPJBWsvwvWdFic7KtYfCRYh4AG6VhKDgfHE1gw==
X-Received: by 2002:a05:6000:270d:b0:39c:1257:dba9 with SMTP id ffacd0b85a97d-39d14762337mr3053384f8f.57.1743840585714;
        Sat, 05 Apr 2025 01:09:45 -0700 (PDT)
Received: from [192.168.0.205] (78-154-15-142.ip.btc-net.bg. [78.154.15.142])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a7045sm6325826f8f.39.2025.04.05.01.09.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Apr 2025 01:09:45 -0700 (PDT)
Message-ID: <0c42671d-31cf-401d-8c40-be43b9c83ab3@blackwall.org>
Date: Sat, 5 Apr 2025 11:09:43 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v3 net-next 1/3] net: bridge: mcast: Add offload failed
 mdb flag
To: Joseph Huang <Joseph.Huang@garmin.com>, netdev@vger.kernel.org
Cc: Joseph Huang <joseph.huang.2024@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Roopa Prabhu <roopa@nvidia.com>, Simon Horman <horms@kernel.org>,
 linux-kernel@vger.kernel.org, bridge@lists.linux.dev
References: <20250404212940.1837879-1-Joseph.Huang@garmin.com>
 <20250404212940.1837879-2-Joseph.Huang@garmin.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20250404212940.1837879-2-Joseph.Huang@garmin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/5/25 00:29, Joseph Huang wrote:
> Add MDB_FLAGS_OFFLOAD_FAILED and MDB_PG_FLAGS_OFFLOAD_FAILED to indicate
> that an attempt to offload the MDB entry to switchdev has failed.
> 
> Signed-off-by: Joseph Huang <Joseph.Huang@garmin.com>
> ---
>  include/uapi/linux/if_bridge.h |  9 +++++----
>  net/bridge/br_mdb.c            |  2 ++
>  net/bridge/br_private.h        | 20 +++++++++++++++-----
>  net/bridge/br_switchdev.c      |  9 +++++----
>  4 files changed, 27 insertions(+), 13 deletions(-)
> 

Acked-by: Nikolay Aleksandrov <razor@blackwall.org>


