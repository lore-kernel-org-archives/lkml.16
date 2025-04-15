Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDBD13AA53
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 13:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744724752; cv=none; b=gugXlkSyFl0uXzuDnBsQah4LngGkUdvmh28lWRVr7fgIX9VQ6h/9vt9doqYs5q5spmphzPsr25BRJIySDfVOybZoWbFq4TAz2faF7PvoRGVQxxI4hOP9N2cSS3vbt6G2vBKITdd+2nYC+AD5qO3SmeGEb6qjLpgaQSYLM1pNAnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744724752; c=relaxed/simple;
	bh=rXE3l2GglU3RtRieBCcheDgm2LsmMmtqbd8KZqVCbX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fgTeYORFkUEea5zCSWEBydrIZGKImxJ9u2USedoXjQoN/yaKRo+4vlnQnXnyw7pABTimmtaLy61CPaAiIaBRlDJsbx6aYbFGFlGbERMo60fl7oZxF/2KnOantraN4dzCxJ9h+ytAKUkf3sqobyxOu0+spUzdubjBtSByocMzAQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=R5jA14LR; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="R5jA14LR"
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-86135d11760so433192139f.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 06:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1744724750; x=1745329550; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bNcrlM6tp+4sHuUS/CHQYi9bS1Y2/hmV8UYdxrvm+Uo=;
        b=R5jA14LRvvDRElrErQNpLNSpIdpYDnF+StMTkxWpN6Aj6eb283ja7QiIwR+Gr27Ibj
         KrxCUkYDiO9DjcSSnWJ7xvf2F6qNAVdV1Ynscbs4tV378dLD16T0GVQwib+5l4zZVPIY
         ELbafpd+gw+dA1E4sJlVI9F0SayHNu5VfcDH1H2ojwGcf4D/nPpPRWvOFrTEho7oIbjl
         RRcmAPMJrRNb7Zre4CIKN5Q1qNpD1p/1F0f3IbjT/tEFKVQmS9ABsGiqy0PcCF4hrFsU
         YNPK5kH+ThCK0FY3FcCmb5KNONq/wDUGS4XJuNOxq/E644Ri58n09i7q1KjC++ausicw
         iFSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744724750; x=1745329550;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bNcrlM6tp+4sHuUS/CHQYi9bS1Y2/hmV8UYdxrvm+Uo=;
        b=AgjEiBJ8/7Pv6cVVE9cBrG55nuQJopGnKbi6skYC52FeorDMlm2QIRa6gx9b5XpBu1
         JvkoEMF0HBsOakCnbQ3vzZ+uvEww1pUpqGALCdPYstlkmT/+vN9V+NLdZ6PEF1WrrGek
         9qegmdEcGNHwLox53rqtCzIz6jLgWMQ/VwJ9GekoXFgeTN0Dka3eBS5cPlFF7SaBdFKs
         xPKBV657CnAM/6ZdZVRe+j55D9PcYW1JCIkXY7CwC+TjPSYZrZCICmdmZ9UEG5Y5U4w3
         LKOPatb/SI/S6WfeCpvNzxDk1PFPdYD10SH9f515SJzTcyjWBwZBAngz6ve8kDpUR4K+
         LtJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCnvLi31/2T7/jp+8X/N60hxpZBYuLH1rGJC2yQFRE/gHgODxhE88dFn4HnR2Vo3W0vNwyxlcAfD0NWRs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwbgxTftwtZHbXQGNxpp2pufGfckAQGDN/xP3E+XBUneO9o/iq
	FCE1ePpway65rbkY8EqnftJR19YchmXQFU/7IdSLHV3cYRAlJ/3g31aj+6Gh1vQ=
X-Gm-Gg: ASbGncuFsa5bh8Z3qjpOXgSfPVhVGoow3oVsqRMNwthaWv9GEMJJErsjP6wMyj5k5nQ
	GXddYJENetngXZUKfV2JYWlrA8ikbY9yreycKi7srXQw3lwXJQEzz0m3b0tx+BjNWeGshcfnzYY
	TmEd476A38k1zrJU1giTtYp0tnrRcOxpC9l13F40glzt4qQ1CY0vwWOyBxgOWotCBw2XfIMm3jZ
	AtQ7kCq2sQevdinN8vD209fWoJGazfylJohmUnAjqgeHK7xaxKLO1nrwWVd4iqDWfceOie6teR2
	246L1gP6S0/mY/1hSebEXvSKV68GHjY1wdnYvYKDhHu1gE7r
X-Google-Smtp-Source: AGHT+IFejHFZGBiwz6/ELO3VmsNzwjNRkabhmkTyqTHC03DzXJjb1lXdKDU9lwgHCuSFdXY4BrKjXA==
X-Received: by 2002:a05:6e02:1c04:b0:3d3:f040:5878 with SMTP id e9e14a558f8ab-3d7ec27bdf2mr198797645ab.21.1744724750136;
        Tue, 15 Apr 2025 06:45:50 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505e2f621sm3102983173.113.2025.04.15.06.45.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 06:45:49 -0700 (PDT)
Message-ID: <9db33edf-8cdf-42e1-bf82-da9362100d83@kernel.dk>
Date: Tue, 15 Apr 2025 07:45:48 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3] loop: aio inherit the ioprio of original request
To: yunlong xing <yunlongxing23@gmail.com>,
 Yunlong Xing <yunlong.xing@unisoc.com>
Cc: linux-block@vger.kernel.org, bvanassche@acm.org, hch@lst.de,
 niuzhiguo84@gmail.com, linux-kernel@vger.kernel.org, hao_hao.wang@unisoc.com
References: <20250415054436.512823-1-yunlong.xing@unisoc.com>
 <CA+3AYtRRgL2-vPNm=1XBKd_PFuRcB5fZh96VGsfTO2VaAvqv9w@mail.gmail.com>
From: Jens Axboe <axboe@kernel.dk>
Content-Language: en-US
In-Reply-To: <CA+3AYtRRgL2-vPNm=1XBKd_PFuRcB5fZh96VGsfTO2VaAvqv9w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/14/25 11:56 PM, yunlong xing wrote:
> There is a mistake of Signed-off-by in commit message on previous
> version. I noticed that you had commited it in block-6.15. Could you
> please help fix it.

I fixed it up.

-- 
Jens Axboe
