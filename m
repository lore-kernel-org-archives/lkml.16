Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C9020C000
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 21:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745617192; cv=none; b=X/kq61/HmsPU5qlwwdEtT7fOe2E/rwgIC3Hqp0efC+yOgidvyM+TtuFXoQbEOoA3P7t1McDosnGCK2w5tZJ328Yl/l5UR4pQA2Tf46wVVa7FB9fdNmKacBIy75skG5xUzx2KyVPFoykAzOp1yDVfptGNSIWCGfxGu4xDG6Xf4cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745617192; c=relaxed/simple;
	bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dxx9eNp2h3P131cEUL2efiL/j1/Q4PPq00WBBee2IUoNqSBtB46rbAmlvJUAXBwK5sgKPxV6/YleG8LFri/2tgI/UtMpcLbpHPN1yiNWVcfoBWRscIqvHfTBMgePxunZYx3+E+/jnb+ugWlwRuwUedN0B+7PsYxaXQ1nCtKh6iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7082b3d2960so26829437b3.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 14:39:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745617189; x=1746221989;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
        b=r3Jbu/gbswyzBSozoqk/R3ttG6uYJf6pdpxtZrsnirG3IckXE/ws2aj+0DPc3/EKEY
         nAXaHo1g988+pIfIfbSzvDmdr9/laTvnKfSQDmTntFWM2VKHZ5oEgi67xWTMPsbhSzCv
         ZBr7ggupsFMna2M82aRcv492YFCY8mjY8kDc3tgkiPstf5ROAg5epL+icSVL3+iQak//
         0fgRCqeIRgwugGZzRKpNvFnJRco0zeA/y161yiDdhOW3Hmw/dPd81Enwu3JdcHJ6XC/f
         1G7FlK4Iohk2R9SOl451DDJdsXZDqGeiURH4f4hUyYcuAn2fwRmq8YsgWrM8xbF3aQua
         +Arg==
X-Forwarded-Encrypted: i=1; AJvYcCUg+cVJc9kdcsmegRLD7kI9rGVfCDH2vINQijkBREHxf+gbmy6AncS8HsvwWSmVwV3jLecNVj9j8CTb3Bw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1v86NDQ4iN0Puk2pbFKYwon+MlvgaqbyN0Vrbmk/e9PVLnOz2
	euWSqaZSglITtLwciz1dEFRUTK/IPMqqcRKgfMT+RPrmwMyJm9Kf
X-Gm-Gg: ASbGncuUb37WIslLuH0TVD0WU6EobXoK/lRULXqjKnYzx1FIfGCrBu/rr/s5OazRkPV
	A/ZQot+ubWHE/E5DmOXjUd/pmjKcQboulnAhYnUtzH2lDR4oaKeTsmB58BE20BBWVQaKajn0OE9
	MrwsyI+AaYJgGk0jdGWQ61+9La6ffNWNDqltyiXAFs1AOOD+EyJ7T4vs4CVPy84HxXiB3i+E4t/
	M7SDu2o0KmY3o5Q1vebxsakv1Ty+y7fKbkD6xJaS4Xe1c/TiXyFj1BolrWSR9osJJeeUckGi2yt
	Q4Eb3+2KRceIF4pgmeXmgmwSIaXQKkcCxL+bhlQf
X-Google-Smtp-Source: AGHT+IF4TrG0C0V3jSMel0JYpJKmjFKhrjvmL9BV0Vusr56pRZq+FiTE/fyScARGvN79oRmTL5lDMw==
X-Received: by 2002:a05:690c:25c4:b0:6ef:77e3:efe6 with SMTP id 00721157ae682-708540eef1dmr56306747b3.13.1745617189476;
        Fri, 25 Apr 2025 14:39:49 -0700 (PDT)
Received: from [10.100.102.74] ([95.35.174.203])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7084b9cbf7bsm8429567b3.110.2025.04.25.14.39.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 14:39:48 -0700 (PDT)
Message-ID: <bd155996-10f4-45ca-b4a0-dc54e497e3a6@grimberg.me>
Date: Sat, 26 Apr 2025 00:39:45 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers/nvme: Add quirks for device 126f:1001
To: WangYuli <wangyuli@uniontech.com>, kbusch@kernel.org, axboe@kernel.dk,
 hch@lst.de
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 zhanjun@uniontech.com, niecheng1@uniontech.com, guanwentao@uniontech.com
References: <5AE9DE3EEA7F8772+20250422121725.162229-1-wangyuli@uniontech.com>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <5AE9DE3EEA7F8772+20250422121725.162229-1-wangyuli@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
