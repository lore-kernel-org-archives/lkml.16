Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D637B218599
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 18:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747333050; cv=none; b=OBwf1IOF/XGWUIXxsmw43zWLiG0k5YTjA//Dqd37hRGgrKqxstPOWPTh0b7jhQnoGQRsTM3zzPzJ6NfT0zghtG1Gxuntj5rqu/PcNaG0CjmEg5NrC4pVdvOqQv1Lyh3/b3KjuRV/vpBiDnPqk/v8s2RNGDvOuKJ9ItZAJ+zUu2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747333050; c=relaxed/simple;
	bh=s/QjyZzY/EnfUUvNKb7Q7l8bqIG7rG8gTYAL2oTY5W4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dqZw28XGVy0DVM4pCwGTl+Z8o7u4dXd4mlQURkmEhfHHabBR4tCLgwGyrMhtGlNY/TieupMKFE2/qSYaKenBgLVMH4tGJceDkAXvrgp58tEMVGZgstli9zF0+C/cdtPxcMTSl/rZyFqmoSIb4vvCiHDXJD+wHPOyyYGPyYmbE4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=Aj6gsl2a; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="Aj6gsl2a"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3da8e1259dfso8045995ab.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 11:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1747333047; x=1747937847; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=96xY6/n/0fhqAkgNUIqk6HeWQCuRjQ3BV7nB9J6drQA=;
        b=Aj6gsl2aoiPVZ3ukygcyl5oN1kPU/CgVxCQo9MsXm46SK4pgfrHpRchelmqUUJS2Zz
         kSzZGDZq8jQBJ5Cx10wUWKqLU7LxxnR+pntOCs+gBNxKxgY19gRD66XpLG0BKKelZ2sN
         E4iuKrtB1YvtRYD2AoOPHoqEOq1ck0i0Zp9Tm6Lzszmd5NvuB5uERxcRxQ98+sxeGl+G
         byKH4QUUihJ6eDeuTpM38fFd/Kv+ti0IAGotbsMbRei0vk2N+TOPnzfPkjbX/nZd+2mK
         KjqCQRoVp5y6aLTDdUMkMP45ETiznVBNcgjRZrx488gfTKpP6GimDhEp0mzVqnCdbu5V
         NPpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747333047; x=1747937847;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=96xY6/n/0fhqAkgNUIqk6HeWQCuRjQ3BV7nB9J6drQA=;
        b=JxU9Ww/JLsajZGrhqFwqNdihLhs08II3Szo6Ct6oCxLeK7c/muIziYU2S7pLPhyUzb
         K0jLUQemQDP69RtxZVAWBliRByVw0AlUWZSZbhJMIIAEHathB24VZtTFtcCpRsCCFToQ
         gxznVsmt93+XkOu1Kmejm9BP5N+Utr+W7UN5+WZL+NqHuoXxORzCkQvrlFW6jAMaJJBs
         Vl5nzrpSy82CLn1QUr395b5gn37XUMBUNa06KFAaj+HPc2dtZh4ymKS8DxlHWqug55Vh
         6y1CwNtgXvy/z5uHWRYYf3V8/Q02L3MjhnR4hUCYQsAjDCXAz+hGmgpUdz9beUx7s52r
         DWSw==
X-Gm-Message-State: AOJu0YyGRvZiH76B2K8kD0DWmmcosXmUXD87REgdw51B6/ZwX7nSWJQE
	PU3g0FGftGEEaE9+jKAb07Z8xn7b/8wMAZRugt0FpRFY/gXJPdpW2PhMd6QJVHg9O0U=
X-Gm-Gg: ASbGncsbc+zDZ6JZ3LoQife0vj5prDEGW7BJGlpn1OqClML+Xe4mmQp3MzwTjkcU5nT
	yljbvEVdjlYnqDg+3TVXTme/oREjHAZ54EqwLbZa8km5mvAsdPFPDcIJK2Z9xSdrgvlo28i2pS6
	42co6fPT52EyWZh46poMML2ZUp00MvTzhZyq7QMDR1FI7txS7ckXlW4NwONWeNWli1j53i11+yt
	jE4tJXWHgH75ngZ3n+m40s+njvA0buxqbZiqus3px9KMhis4wQ4upZHCVQHr/7AKQOlwh77LQiU
	Pu3UoWigWrmv4koQQBHMWi6DorlLtp62LFWrFMBQgEsLjBI=
X-Google-Smtp-Source: AGHT+IE/ytiwQTQqDjKBKn/luh+g5/cfEL1pQKdZeeJtRvFqy5JaffvCEnw/tVJaBrXBsyOabJJlEQ==
X-Received: by 2002:a05:6e02:17cc:b0:3d8:1f87:9431 with SMTP id e9e14a558f8ab-3db842e3820mr11103815ab.12.1747333046867;
        Thu, 15 May 2025 11:17:26 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3db843cfa4asm722965ab.8.2025.05.15.11.17.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 11:17:25 -0700 (PDT)
Message-ID: <d5372cf5-ed0b-4db2-8b31-5fd4c7967377@kernel.dk>
Date: Thu, 15 May 2025 12:17:24 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] relayfs: support a counter tracking if per-cpu
 buffers is full
To: Jason Xing <kerneljasonxing@gmail.com>, rostedt@goodmis.org,
 mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Jason Xing <kernelxing@tencent.com>,
 Yushan Zhou <katrinzhou@tencent.com>
References: <20250515061643.31472-1-kerneljasonxing@gmail.com>
 <20250515061643.31472-2-kerneljasonxing@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20250515061643.31472-2-kerneljasonxing@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Looks fine:

Reviewed-by: Jens Axboe <axboe@kernel.dk>

-- 
Jens Axboe

