Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A6C156228
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 21:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745617448; cv=none; b=GkDWCDI0s5QWinM/3utO3/k5tj1aPKwu6KEOePvZh3WFYP7f1qaYCWmNxFB6iU4kvxbsTLHaY8r4Peiu9c+v9oOMwz+6tbjb38w/fZikXLrRVC4GcPWmj04QWj86KLc9YvnGcYufwIy4ZhOYP/7qgJ71JfvyJCKzpUhob+nfWoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745617448; c=relaxed/simple;
	bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d3hRxn5mDs67xcdExA7QZQbX8xxnV0JAvGQdDUcrymCIFFzCDgNWu3QCUnlhpmeLwFvbZSZtz73JpMt8glrwBRHUcTfDXorRzsDArqA1iu5tlKmbm3exTzWDvYBhXPz0Kuv9y1gC9IANrhNg7asYAed1BjeR5HWp810A3anLpwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3914aba1ce4so2110956f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 14:44:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745617444; x=1746222244;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
        b=sFHWmuBVHkC0fGQ1lNaWOtt4XK9KBfNqNli7NrUYpliqsf/9q8iPFQMDKXjbQkfSkU
         2uHEdKgg+ipxU3G4pFtIS9qkAfccGC6iFlDDNbbXrvR8xjTPkW2ziyhQJdldXD2Mk4NT
         qt09GtR/7a2KeLZMME+DDfABAbid3VeKoZeFLrUmVBw/XQBnVkFnCrUp6XZT32eJubDX
         d1zl8HEKaT/I+wRaN0ZTjQ9AkziXx6XBunwoc+pLkkuG7i3tMxpJCJ2a8ea4RzVIx9Rt
         p60h+zaNWvS7g/8Bm2QziczXFDtbKl8LCO283yw60XCTgZA0XcB1Ts6KTIcC/3c6CCDW
         hC1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUtn3jegrT4LyIxH2XD5FPUG5CXVgqVe5pX2FOZJBu9nkBpMU4ZJeQyAnc/WVcPZEyAdwUl/sGb4h2JEtM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTLbK2Qea7MoR3oUwA+OxJ/DIpiTszGB5xmHakZa3OPRIG8ILJ
	jwnw5GucVWXOWFoZSthWHdWM7pCsz+Ge0oWJc0GTRj1tzMrU7OgG
X-Gm-Gg: ASbGncudbonWqQSSxHEw2/Jw2xAvxdq6OcELpTJjHNje5/96/d5Ncv3PTJMnavAdjRn
	5sirjDlg71lq7FbjJFOAvHGloI/VxmFgTpIVQbsc/ZinupOpSypAzKjU1mTHa1y76Iu26+4/nRO
	b8E4UpVULxj9FRLtJHycWf7XA68A6KiAh5CN/rMrzeUmq9uaZmljlXZwBaQdoaF3o6HdR89p8q1
	w/w+hsh9ihtehHOAjWAzyad1m72WScgbsJS/fVlAW/EGW/Tj+T/yS9ZnSyz46vmjScd785Z9raV
	WskQPA3Dei1nbKFaFXebLcajaAoDstqInMXPANjk
X-Google-Smtp-Source: AGHT+IHNkUTzqCyklk8CwfKfnU0VUbuqBmBVcnaK+gzvvYblitq/tJPzGKIQecXGKo4apnbeSc0a3w==
X-Received: by 2002:a5d:64ee:0:b0:398:fd9b:b935 with SMTP id ffacd0b85a97d-3a074f7ba84mr3132716f8f.53.1745617444011;
        Fri, 25 Apr 2025 14:44:04 -0700 (PDT)
Received: from [10.100.102.74] ([95.35.174.203])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46a49sm3448346f8f.61.2025.04.25.14.44.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 14:44:03 -0700 (PDT)
Message-ID: <7c5309ff-3a7a-464d-8088-a58da7b66a1b@grimberg.me>
Date: Sat, 26 Apr 2025 00:44:01 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] dmapool: add NUMA affinity support
To: Caleb Sander Mateos <csander@purestorage.com>,
 Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>
Cc: Kanchan Joshi <joshi.k@samsung.com>, linux-nvme@lists.infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250422220952.2111584-1-csander@purestorage.com>
 <20250422220952.2111584-2-csander@purestorage.com>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20250422220952.2111584-2-csander@purestorage.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
