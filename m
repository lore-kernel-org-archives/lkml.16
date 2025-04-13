Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E401487E1
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 22:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744582033; cv=none; b=puFcOPx2zmqDPrQYxRBpGKarIqyJRwkN/S3TE7JKrck6S9JJwGPUvnRn68uEKYtymGvaBpL0JpUVrHvHdwPHZubwAwBJAgY0ychAqzV/qKw0yDwAQU+CtXcUJlxWVPMlipleSbH6+6a0HriTRNSWxAKuS/3ZhmYhoZk+wjF4Aag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744582033; c=relaxed/simple;
	bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pp29ZoiEb/pHk5qdTlIg8YqfCKks48G0Bu0+wpff7gbfQGqPxyJdUVh0zMySgbyCBjGVaixdkrWdXf53uZiWWcSlv80F0gQUyq7BPqGbdcOrtZbWxkR4ndR+ocMC5498GrEV57gWwbVLw5MxPUGuz5q3CDeTP0XZ1JOm5jr/p1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5e61da95244so6189737a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 15:07:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744582030; x=1745186830;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
        b=FZO4G0BDWV2q/8LCvzBNXnLdyJXXOcxCzEHhGQsWkRv1/7Gp9jo/cQvWyGCVerrW5r
         nQCYzH08WUrsrC6bEbxm1dGWtTnzQH2mCEISjoZjkfr26HY0RHhVW8YlU5WmU5VwqBDL
         FzRKs1mwbvdavCoACJI4WxYUKo4KpCfyfN/Eo6Vh0UGBxYQOhhlEdgtdAdmWEUd+H/Vc
         sK0PNvvuOGnVPwwAvYeOALsgVsH8RSHUvPmVf4s7PMJWXcAFyRdXD5YqFW1CCXBcIl2y
         9ae1K0RvPkEfaDejAZDw9DQd9GCxQzYycFRZP2Fk/jkRlOpRoVtrXVGwE4swLwZZuuL2
         WFmg==
X-Forwarded-Encrypted: i=1; AJvYcCV8a4YpJt+19iU/Eg1/Ke/KZnGpLCPdgzZNM3YO6FVJQXGes1AZohnzwNvDRXr35FpZQACfRyhaBJkm1fI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHdSdVVETrtm+37mFA4KB1JByfoJ1lAwMRCv+yZ35/it54UCJJ
	2W7e+jS9saZJv4ZqAQVmi5iQUaWPEDJJS3oJq4Y6bzPdgYC++Xcj
X-Gm-Gg: ASbGncv4Os35VGTPvmBBqyCu8NUaKGQN1suRWwDBd7PjaGZ8/wPGrX3xTnc9NLJtm5+
	Q3Kh+cPpw3JVX3lgZctD5GbPP9RFXhNnVSMLVWzgI/MEIVs1oG41NL7g03xxaRfsI3hnp2wwAtS
	M4ic8oVmM6XIWTQGOUSKkJKdZkphRU8SL+xnoQj9B6J7Ip99heBDR7Ob4fk5FH2SKEHMhJVNCNX
	k22moowrFfSOO4f/hOhd5IXIy7ySyPcMAQST1SRVEy6kUI2D6qjUEbpntR9v6m/spqjCml79Qo5
	mUO/o4NPrOzAAc/smzXEf0GRogW2R2lY6vlkSixRe40TsstdF0gWFOk/D8Ufa6fJUAFHcrFWeih
	HXynjVWE=
X-Google-Smtp-Source: AGHT+IHUhYQyA3eVl2YK7PCt91HdPxkOAQ+yTbQpNEEyGPo2xAyyY0VpWowdFgvSMk3AV5WLvhfndg==
X-Received: by 2002:a05:6402:27c6:b0:5de:4b81:d3fd with SMTP id 4fb4d7f45d1cf-5f36f64b2ebmr8685518a12.13.1744582030122;
        Sun, 13 Apr 2025 15:07:10 -0700 (PDT)
Received: from [10.10.9.121] (u-1j-178-175-199.4bone.mynet.it. [178.175.199.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36f528bcesm4041484a12.72.2025.04.13.15.07.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Apr 2025 15:07:09 -0700 (PDT)
Message-ID: <a1bb956d-7f5a-48f8-9ba0-9db161ed4c2c@grimberg.me>
Date: Mon, 14 Apr 2025 01:07:08 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvme-tcp: Fix use-after-free of netns by kernel TCP
 socket.
To: Kuniyuki Iwashima <kuniyu@amazon.com>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>
Cc: Peijie Shao <shaopeijie@cestc.cn>, Kuniyuki Iwashima
 <kuni1840@gmail.com>, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250408224105.2344-1-kuniyu@amazon.com>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20250408224105.2344-1-kuniyu@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
