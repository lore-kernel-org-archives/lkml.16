Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B726C28F5
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 11:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745322786; cv=none; b=GMr8tLf2zSv085ZpNZFSCt4664cjKcb9xjBAKcb+lovSoC7Fp0jijo9cqGlNjhtlyzEaYU8eoXqfea9jEKG/ol8X1kWw2Jl6yxN65Diw01bHHDFyk/wuHdUnNAT2D8c5J/XgLa0HSigTVwl9iH7lPT4JPYGmzNpSsy57a0ZcfX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745322786; c=relaxed/simple;
	bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MAe8E2Gc3ppIKM/Yunk/Zpamg0jeZB2r+qKjEfxPwqATgNCEUdDYBunBShXsA7AADf32nHnD8tqFYLpu4rq5LjdiRmDVWgwhnpPpyG7jtaHswVL6Wt4cCfQi7y0LWeUmZd2pJQ3QykxV9LPR4o4w1O0m5WsrtY/mcFdWEY7Cevc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39ee623fe64so4392227f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 04:53:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745322783; x=1745927583;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
        b=vFo2OtUYyF9t2r46HQwwj2Kg9BSbgeeETSpCc2cV1/KLJVLG4Waw/guBvtMAJ8jhms
         UIok5IN4vWSAjSLahV/gjkSJD/lh1kVR+JuyUviMxqz+KkR52MZIlIBxnL3BeW6TbAfW
         LWyJMSwZ8t6YmUQHkIYaViqP9DJReU+ChPZ3VSfTl5OBrqTBh60w9F46LEiI9e4tQ2f5
         0aFnP09DnM7DB0rLXQYzz0Sg8GpoXr2Tn0qqpWh6+4rWsTeQKCYNqqSgl4yMm1viu3sy
         55HBSvNIWJgHcelFlUMrNIBnDUL0/s5vPd8I3xTWxTb0f22J+jFe3r1Kc+MoiEA2LehZ
         g0RQ==
X-Gm-Message-State: AOJu0YwqJ0HvUMr9Tc2elzhXXPNV6GWswOl7r3MTvL2m5xr++pK+53Uk
	vOB3iFXAnSeVfPsFOOwHeVfgXNFFdKNj9HAY2jN1u7Pw06pkK77s
X-Gm-Gg: ASbGncuKrbYJTGyROqtGlGzA+udSx8XYLJSksCbd6xTA7j47eONM22FKEHuenCqrhys
	83yrpwcy2cxgFJmuDThaXb6NUqw3iiLBU1g6h1fnHNWGLVoY9WSkIkkuQjE7Cs54HDxZgVXgeDB
	lFJa4IzmvGBLAd2ANy7MIq7azylKOWdW8i55vI1e1votOg2E33xMg4wpT47LnpVertXZiQi1Vzl
	KgCWPQNrdU7Wa+7yAHFiuwGw3SF8pQPcKp16B2+Ap3U/zHR15D6uj8mKySaofs8SNLRAXUoUyEJ
	9ibCZCJyPR2W1BoCbgcHIbwfoWm3Zjzyx9jqDTd/aeSeo9sLt8ldB+csA6QsQIhkQDmrGbN1TpK
	K0e+E1vxQeIdFA6e9
X-Google-Smtp-Source: AGHT+IFrtJnjZDJ7isBhkp9DcoyBgsJIXmFMhtpUF+YYRWB4IDpWHsvwXVXP2FGKmyJ5lfjPFMu9XA==
X-Received: by 2002:a05:6000:2405:b0:38f:4d20:4a17 with SMTP id ffacd0b85a97d-39efba3c738mr12196054f8f.13.1745322782779;
        Tue, 22 Apr 2025 04:53:02 -0700 (PDT)
Received: from [10.50.5.11] (bzq-84-110-32-226.static-ip.bezeqint.net. [84.110.32.226])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4206fasm14773220f8f.2.2025.04.22.04.53.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 04:53:02 -0700 (PDT)
Message-ID: <89e5451b-ed06-498c-a93d-c4e946451a81@grimberg.me>
Date: Tue, 22 Apr 2025 14:53:01 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] configfs: Add CONFIGFS_ATTR_PERM helper
To: Richard Weinberger <richard@nod.at>, linux-nvme@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, a.hindborg@kernel.org, leitao@debian.org,
 kch@nvidia.com, hch@lst.de, upstream+nvme@sigma-star.at
References: <20250420104726.2963750-1-richard@nod.at>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20250420104726.2963750-1-richard@nod.at>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
