Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5C227817A
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 11:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745322311; cv=none; b=A4g1aSTITfGjxTM9/dYN2XR2zmEAgKK7iMTd+smvrsmEErOcPlpJJK7pNIxUVU+Xm03x7q+YwgNMg9pp9VXWQQoHNqvIn3ZPYj0jeV9jUcdoIMnlSu3w7QnMYsZMSlv1KO/8jAVSyvXhlELP/wN37hoOmpX2UqqTiC1navTP8rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745322311; c=relaxed/simple;
	bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MKkRrIVDly8TacIMvMKlCLAVLaZPfxHgi1oCNGf2JKIpevb42xOsjcsTOdlBoab9aT1Fbf1WKbItMFUnkU8ZuN9B//ihItwFdnzf+3M2KcVY+c2qo9akKM7Bleuoz793FKcJd8mVX/SrBDE2EGMugRbVJpd5iK4v3ulZ1jzpyuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43ede096d73so36860665e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 04:45:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745322308; x=1745927108;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
        b=om/2EBaBKXzncOkyfi+s7bieasPvV5NulhgAO8Uy5sWWWL94s9auJ9gxf+GtKeyTCv
         KSlFl2Cazl8+YiubNL58JOhk7irUNt3+gLAV16LLID6sasQ7dEQFzIs+RQ4Ppa/iM+6j
         PklwwHFJZdbsPRk0Ma1wF/yIwIjjMng8OjxM3WryMo7eVLy0pcxaQ9bNo/Yh2Tj0eTw8
         ZOvhaJnrNf9mBXVN7Bp+8VhS8zL0CJR2Ab19B+9bERDArSWsqlw1MeF/HXwV+z/oKi7K
         sHry6v9PCV9kUZ6Aph4OSfZ8xDiA9IF1XsfnELGvGF8U4UXu7iTaJb19NIJxt0ms/Sjh
         MVyA==
X-Forwarded-Encrypted: i=1; AJvYcCVCISGSH5hrLkhCypJwjG+bV+ZgtXJnH3+EUZhlQPdTu5NO4VZqBJCRZA/Zo1Xlic5tZ1J/5RlUq69Zovw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwNWtZHZP/pIveE5vdbjgOT7WSRgNtIxN/J/aJhkoutDJHjPLD
	CWx+O58eJOg5N1c7SeI/Tlg9/iOvhAeJBmehK8noJgkfGZLlpIeZ
X-Gm-Gg: ASbGnctBWCK/BDYUb6X89acLlumiquUssCb8jfLP+4Suq0omt2gY9L6whPuPzh62Z5s
	pxhGiBPWjHpCticZNG/wgE0LYjiAnbfRymeQHzejgBoIp2NKse2cdVJxsX4BcUvEYTjPSr9Bf5a
	kDffeJBBex3GpGQYwawU8FPju4f4x9DN6DfgqjIBuTL4NXXYgP8AvVsegXJphsJzZP1HbmlvaVS
	W5zOO0LXZNRpJetSKOgLEil3N38CZa50/wH4MOjaHP1PEhghwBRcJLm7K33zaH5x93/6kBgZ4r1
	pQnllzhQqy49CyQFYZY4uD0l+A0+XTAMdICVA3pVm1GxRVA1/56nvc618JZJDsRLEf2SoNr/BLi
	odReM7nFDWpJcE4wW
X-Google-Smtp-Source: AGHT+IGJklG+oYWUNhV6aCUmeX7ELGO7ly0rpUv7KbZChA9Y/w+LBLStuVC4QgbdfmLnoKp93pzDJA==
X-Received: by 2002:a5d:59a2:0:b0:397:8f09:600 with SMTP id ffacd0b85a97d-39efba3cc22mr12376813f8f.13.1745322307762;
        Tue, 22 Apr 2025 04:45:07 -0700 (PDT)
Received: from [10.50.5.11] (bzq-84-110-32-226.static-ip.bezeqint.net. [84.110.32.226])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4206ecsm15228837f8f.17.2025.04.22.04.45.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 04:45:07 -0700 (PDT)
Message-ID: <0c5aa410-f3a0-4834-b90a-702ba09379e5@grimberg.me>
Date: Tue, 22 Apr 2025 14:45:06 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] nvme/pci: factor out nvme_init_hctx() helper
To: Caleb Sander Mateos <csander@purestorage.com>,
 Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>
Cc: Kanchan Joshi <joshi.k@samsung.com>, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250421165525.1618434-1-csander@purestorage.com>
 <20250421165525.1618434-2-csander@purestorage.com>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20250421165525.1618434-2-csander@purestorage.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
