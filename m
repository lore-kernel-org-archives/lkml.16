Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F67208997
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 21:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745618016; cv=none; b=HW7OXVNOPDJJSqgVlOJPIJ1j1XS5jDhFAFWwzFAZpkQ+nGY2keXl3j5lvZbT2lH31jVx2cfjC30c++7HPY9kOK/bx+GI9S6SzcSyYYxx1Vie79QgTm2g+W+JNSnjwLFSikEJOeL/Zu98elyr88ic9KWZGCt6gepS8d4/LN7G7CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745618016; c=relaxed/simple;
	bh=C6aXmLydQyAM+rD4/MTvQ7pXQmlAMgEPsvg7ad7XjpI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gn06DBh6sz8e1BGO0Nh5shq48orZzQtaz0H57zKL66xbWyVzEl8hxcIcu8OtFTlTe4Rvw6d169SfcSTPzvGmd037BUVEfUEjPTAPrtbRJfJjGGqVCZs4EyO1xtRA3EaZh6lX/MlTnnr7Tm+MPjXq9GvGW/SCK9acceT7c4iLo3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso31374765e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 14:53:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745618012; x=1746222812;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MVVbo4ROS446ViNmU/AD2hQGyqQ0dbBdWmkbwu91I+0=;
        b=rvicNE2KXXPkOHWtZQrUzHTGrn8MTpmBY6bxLJ/sbJ5gKKKG0smCJ3iUaL8B61EdPc
         srlol2bMymE80gVnxpD4Jr/bGLWPrs+7CuWxn06ltdCF1XgO0wDyT+DkumPFCt9JBvmv
         h8U0lXZvfl1anEMP4nnEcShU/k+8IfYb2bEZEAXOCgObFkiLZodQ7gA0hWXdQAw4mU9L
         AlO64RAMqw9AiT+dgDqmooyd/9Od/wkZBtAQQwhIkZOSIqauOErMqdN98yFUNGvAv5uE
         ehH6G5Gx+Ej/nQGJwPZIkaQP6dqTbzwDW2uCs0yYQHK0MmqmDZiMt/AtIpHFu2nHEum6
         PCBw==
X-Forwarded-Encrypted: i=1; AJvYcCXphMPd6L9WD75nxm9SS45UulYDxRPfPgpPee6W/5cnAu0CEeTBsXICzWq1y5PBLh1EU9m3/77Z7e44SKY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxnhSVAK+IQ9+c5IkZyN53qAourEs5TEG4Z4JijPLR8H/9MQsC
	R9evTIrNJpeCWhbDt63jOdHh5ZL28tHlmQI9Ecx2stVKRjeydjdd
X-Gm-Gg: ASbGncuPKXqO+DhCFHyHaFeb2WXrf1+J/rTCJQkBFG+B395mfLksd8HmJ22wXxh82BX
	efOIMdgQHUrzhDwFSDWsgtJn7WjGLtwXen5UnGTbag+rTrbhYjbO5V2iTQM2wus0myOquBEK9Ix
	43qkuE27enXbBvNIOcgNc2v/Qn+BjSqHT4aiEYiECkkmKT8VCPJ3IQ9CvFEfEhdVk4WvzX7ekro
	tjdjuxvEhZjYNI08rtkxcXf/Fh6ZkVQYdIYbCbKIxGG/xYS1jAkScKasUlBFUR7TLAJxQsHP9cm
	PStzwogsmQIGawCFztIrcxCzIq9rr/B5hwjGYfwU
X-Google-Smtp-Source: AGHT+IGSD+ivcGxPzjE4UnDxqHkDSfK+l5KI6zUPiQ4sOkdq5u51vTEljeieRQYpKNmD6n+VeRTiMQ==
X-Received: by 2002:a05:600c:1e1c:b0:440:6a1a:d89f with SMTP id 5b1f17b1804b1-440a64c14bdmr35479365e9.4.1745618012216;
        Fri, 25 Apr 2025 14:53:32 -0700 (PDT)
Received: from [10.100.102.74] ([95.35.174.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2ad112sm69015145e9.24.2025.04.25.14.53.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 14:53:31 -0700 (PDT)
Message-ID: <a306a2b0-bd7c-4376-8c26-738b5c7c9807@grimberg.me>
Date: Sat, 26 Apr 2025 00:53:30 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] nvme-tcp: wait socket wmem to drain in queue stop
To: Michael Liang <mliang@purestorage.com>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>
Cc: Mohamed Khalfella <mkhalfella@purestorage.com>,
 Randy Jennings <randyj@purestorage.com>, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250424161750.jwbdohybrqftuioe@purestorage.com>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20250424161750.jwbdohybrqftuioe@purestorage.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Given that this is a fix - lets rename the patch title to say that.

nvme-tcp: fix possible data corruption caused by premature queue removal 
and I/O failover


On 24/04/2025 19:17, Michael Liang wrote:
> This patch addresses a data corruption issue observed in nvme-tcp during
> testing.
>
> Issue description:
> In an NVMe native multipath setup, when an I/O timeout occurs, all inflight
> I/Os are canceled almost immediately after the kernel socket is shut down.
> These canceled I/Os are reported as host path errors, triggering a failover
> that succeeds on a different path.
>
> However, at this point, the original I/O may still be outstanding in the
> host's network transmission path (e.g., the NIC’s TX queue). From the
> user-space app's perspective, the buffer associated with the I/O is considered
> completed since they're acked on the different path and may be reused for new
> I/O requests.
>
> Because nvme-tcp enables zero-copy by default in the transmission path,
> this can lead to corrupted data being sent to the original target, ultimately
> causing data corruption.
>
> We can reproduce this data corruption by injecting delay on one path and
> triggering i/o timeout.
>
> To prevent this issue, this change ensures that all inflight transmissions are
> fully completed from host's perspective before returning from queue
> stop. To handle concurrent I/O timeout from multiple namespaces under
> the same controller, always wait in queue stop regardless of queue's state.
>
> This aligns with the behavior of queue stopping in other NVMe fabric transports.

We need a "Fixes: " tag, even if it goes all the way to day-0...

>
> Reviewed-by: Mohamed Khalfella <mkhalfella@purestorage.com>
> Reviewed-by: Randy Jennings <randyj@purestorage.com>
> Signed-off-by: Michael Liang <mliang@purestorage.com>

Please resend, but you can add to your v4
Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
