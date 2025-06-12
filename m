Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C4F170A26
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 20:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749760899; cv=none; b=EV69pWeFbLflKT6QNCdnHwBhRlqk1N8nMgzuVckBwnLP0eoFLHbHXxCX74Kgr+eLOQ9W+IKroYc4ShSJJaKhbpVRoqYYDEzThnPue3aCrSsixnhWiGWTvoMKdtLqZvMW6ES8SjqexADTLuK0pvG64fds81vT216Kb3ZzfWjUqlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749760899; c=relaxed/simple;
	bh=9wd2xz3vDh/SbwbuD6C2aLJ/5ayOopTtg9nK8hrtGTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oq/P4oY8o1MHNaJWd5b/quxOStiZssVgEnsJk9h9TyczDtENnnyt7WLEmvOjEjg87xwQiIY0ISRBv9bTa6Z/D8s1hov6GH/HoGfgBlpuCEc7tzRMvVBRIqtUpNE9V7RyENH28a948X/KcuaqtaGRei69ALHMxndvS34mq1rexPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kzalloc.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kzalloc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-313336f8438so266420a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 13:41:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749760897; x=1750365697;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yQbp60ATx7JziJiw8GuEnu8Ha7njwB8B9c7L6mBDOF8=;
        b=e0HthNov3Hu6na2criVAbHDzdUroqUpCEFJQjO0cVwyo/xNqf4dKZX+hBow+Q5emuO
         Nx2ICDOO3joi7wbwpm+YhJ3BL77v7noPwpY7JvML5r6+VASuswFI7c3UB+1mS6EaWoqB
         qwa5yj5n41KTex8W0BnIK4SFEmH/RAczLvU1Rieq7PpiX1HE/B3nDz1xDi3dvZiTZzcs
         DCgMNec8O2kJ2m13T6gNwg+zPn09n8hNbccG7I3W482hsW6gm8Wep6HfB+mB1dmrqCu0
         L+Whpywp0jMqgQ9FkdgtXEKTNtHfgurO621Y3U1oiN9I7BBgiho+RtfLth63VyzQxkUe
         KYPQ==
X-Gm-Message-State: AOJu0YxmCav2968ePSHVyVuhXa96Zvwqqa/MBDA+0kZR+ya9kG0SuKwo
	t6/1lTOD0frxoVCRg3Zn2UXJYBPnNtc9EKg6Jv239MIAYFx4zBiBm4aw
X-Gm-Gg: ASbGncv2rjdNdzsuFl3x4JpqSBvQhnKa/Q0flTyW/kEi6tXkVOF3cXf4b1zjg4mIhk2
	8hRHsHWTbFcueKOejhvZQmYWPyjnvBilBj9RRyg1CUusI96hlH9HiZOFDru6M1LBzp3wzDu4YH6
	mI5wqvxQbglsurZJoFrWWCXkj8+N16cKgVBZTNSITZL8x/Sxa/kYS5le5LRjElk6jnmCFsXWVbt
	wNErczl8K46LaMe4kyOvVBhzP26kaZgDGFSxHIU8Gr52Tmybij4jod/jDyVtYQLPZS9eX7axrRg
	MviZ8Cs9gQyPBTZU1nUmkbWPvBxwrUgiquZ1uEBzUnI6//xtsoVRfQIag3bU23BQaus0egXbDw=
	=
X-Google-Smtp-Source: AGHT+IGaOnIw0uiHP7fASZ0mW6N9GMHWfCfj+WXbjN1fXL186iizSu6YP96D3RlGgK4PotkxuJPyjw==
X-Received: by 2002:a17:90b:38c7:b0:313:2f9a:13c0 with SMTP id 98e67ed59e1d1-313d9c1dd1bmr297290a91.1.1749760896738;
        Thu, 12 Jun 2025 13:41:36 -0700 (PDT)
Received: from [192.168.50.136] ([118.32.98.101])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1bcbc41sm1976096a91.10.2025.06.12.13.41.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 13:41:36 -0700 (PDT)
Message-ID: <328cf8da-991d-4e55-b89f-1ff0a0b3254f@kzalloc.com>
Date: Fri, 13 Jun 2025 05:41:32 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 00/42] DEPT(DEPendency Tracker)
To: Byungchul Park <byungchul@sk.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "kernel_team@skhynix.com" <kernel_team@skhynix.com>,
 "kernel-team@lge.com" <kernel-team@lge.com>,
 "harry.yoo@oracle.com" <harry.yoo@oracle.com>,
 Yeo Reum Yun <YeoReum.Yun@arm.com>, Yunseong Kim
 <yunseong.kim@ericsson.com>,
 "max.byungchul.park@gmail.com" <max.byungchul.park@gmail.com>
References: <20250519091826.19752-1-byungchul@sk.com>
Content-Language: en-US
From: Yunseong Kim <ysk@kzalloc.com>
Organization: kzalloc
In-Reply-To: <20250519091826.19752-1-byungchul@sk.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Byungchul,

On 5/19/25 6:17 오후, Byungchul Park wrote:
> 	5. Fix Kconfig dependency bug (feedbacked by kernel test rebot).

This is minor comments, kernel test robot not rebot you know.

Thank you!
Yunseong Kim
