Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9632C17AE
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 14:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745936297; cv=none; b=GnGMmmCFqboNnhA02cp7G4+eL7+J1T8kmVr/ooF0jp8qeid6ttXYpcLMA7TtRdhNtOt3i/8+bC3E2CPHmKS7vovgNbUL3kCbaCRswglmFYuJiJkFYpFHPdTmWRMRMLUiiJioNCge6NdTTlLO19DQN7iiFbOH4GPpLBadDNH7qzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745936297; c=relaxed/simple;
	bh=fDu54h/lDQ0Tg99b7KWm8d3fQP+RGGRs3nqXUElJXcY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sJMh+J/EeuvknaSyVIGGHBH0lzixZ4iNEH3L+U9hUXjhmgdLR7TfB0hJ4OFxdrbwwgCzRgJTjzwI+6BmgZqP5hPYTY+7gJXpSwWVAPrPYgElDp/eL4PWTTMwiM7I85EXKSwQDymrqbDysUB77u6ZvPaZF9xcGFoP6QoQJeM1tHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=YqhKSXn5; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="YqhKSXn5"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3d93f4fe5baso14230285ab.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 07:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1745936294; x=1746541094; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ct21xWdxCB9HRUiwxLc9z7fHQwq6ssXoKt/SvcdUbtQ=;
        b=YqhKSXn5A/ahOAqrklrSiLVWGvUZZ1ri07Uys4WmHS1mgKJ8yOjEEsn9v4oEVN0Cgd
         FiYLCHXCMAv1+n+8cLXaoUDzSVqo40L5xUe2DAfxQsUnIlEoZ0F4qx5O+7JbgiF4QqiN
         dHjRfeUDH0eoSPaCokS8+vtownzpWQoTlEGseO0fMu0wgE31biGQIANHt06bZgacFD/5
         JKguY04/+dVW1IVi/1qxKocJuqvhU1VrRuQ+RxEd1FUb4+s5PQhTcnAiXeJCQQ3be9oS
         xqL8CiULQvTq5wtb+GRP1yWrJE9aElUs8T1hJy1jOkwyEwfQEVdtgeiJuJ4+YTIOSB8W
         gsJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745936294; x=1746541094;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ct21xWdxCB9HRUiwxLc9z7fHQwq6ssXoKt/SvcdUbtQ=;
        b=hNZvfJEJDEUGHIx2V1290Mw6fuHEdc3+CRWsEkAoCJHsXH7bG4/ahM0q5v3JBVDwZL
         kj5w3rM7NzzfsFhuju7Rz1Y6T5zkVQoLn/XowrQRDLXYSYz2PJluTV7FUCuPb+CUsjxv
         QWMR/LYwbTzM6LRhmeBm6Z5ulWfHZnDCP4r90XBXHkTfXf61xFYiUkpW8VuFdfqYJJ+a
         m2acFO4o9BteSGRJvQnmARPyrl9+DM+hMCgAmbLQiN5aWvUJUS++sf/GQnBbfqU5HQWt
         hrU3e2kSQjdsnL6ESo2pxWb21GiQ5AJCaU8t46pB6EWWz3tp0eMnU94bKeyPnneqn8Kx
         Q2sQ==
X-Gm-Message-State: AOJu0Yz9g9lTIvOjvGkx53RmZg6E6iePyhgGFK5soVYBBroLQae3foEM
	3w9wqiwmpNdSjGwr8D6gr+qjtr1JJF7zIAyDrTb99xMuJj3fIANUEsjKM3qltsU=
X-Gm-Gg: ASbGncu55QODaesEVUYxxChCfHVkhyokXsqXGpxXRS5quQgZVHydBIQ33PCqCs1H+cV
	yXYCtVSY3/t4nzLTcLTGem1AiqUWjnJSMQky+P/y7iASSz3WEDKLAasI39SqOQ9/n855HR4JeYi
	Bc8icq7FtcGcKGhiDSM729LigsR9XCSJHWBcVw+7q/eUD5TtwF/TwO9Mm7aeX+dLAOPk9dcIgTl
	bD+I0XRoemDPEbYV294o/2mhx+rOW/jyKuTSEyxqPCzU7UU9/2j+c6AmsLeRYICFis2cYqlrj9b
	ilAkn32jIiJmxQnvOoK3SeAaInjEF0jNo7odzA==
X-Google-Smtp-Source: AGHT+IHuiCJGsqae9ZdX+4qg1+WYrhBCWzNGXs395/7RKh0IZae2mEXWpmr4vKGMEWDLTxiPRMPSxQ==
X-Received: by 2002:a05:6e02:1a0b:b0:3d8:2197:1aa0 with SMTP id e9e14a558f8ab-3d95d274128mr35517885ab.11.1745936293716;
        Tue, 29 Apr 2025 07:18:13 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d95f2b4d6asm3520465ab.24.2025.04.29.07.18.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 07:18:13 -0700 (PDT)
Message-ID: <061eef36-4a3c-42e8-95c7-1b45d00844c7@kernel.dk>
Date: Tue, 29 Apr 2025 08:18:12 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvme-tcp: select tls config when tcp tls is enabled
To: Hannes Reinecke <hare@suse.de>, Alistair Francis <alistair23@gmail.com>,
 hch@lst.de, sagi@grimberg.me, kch@nvidia.com, linux-nvme@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Alistair Francis <alistair.francis@wdc.com>
References: <20250424101333.2908504-1-alistair.francis@wdc.com>
 <a2aa71cc-b30f-4d48-aa1d-9058fcdbb6d0@suse.de>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <a2aa71cc-b30f-4d48-aa1d-9058fcdbb6d0@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/29/25 7:17 AM, Hannes Reinecke wrote:
> On 4/24/25 12:13, Alistair Francis wrote:
>> Ensure that TLS support is enabled in the kernel when
>> NVME_TARGET_TCP_TLS is enabled. This allows TLS secure channels to be
>> used out of the box.
>>
>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Fixes tag, please...

-- 
Jens Axboe

