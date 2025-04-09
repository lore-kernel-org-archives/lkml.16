Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF573250EC
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 01:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744162643; cv=none; b=n5l5LgfzcFplsfQCkX6dGL9T9/6RstseZb5htcjV5MwvgrRoYvN2G+0dFixGZ47LRCgEt8uB4Evm/omCteEeU8OK6u6mJ8FJbkOz50qPCjpznE4dYO3VOWKnk6wEVSidYP3rpx7azl1hxNYQrS/Z8GJwDb/4RfwRjoPeSM/Z4fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744162643; c=relaxed/simple;
	bh=3XIP/pef7D1FT7Zu2FtKEoaBa9I2gehVksiNBjxm+Ws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OCCpOQX/fmToQkLxhSzvHphsR5UlULZsps9xO306TIO7o6ff11e5/eVPlWKy/KeVEybbs2qKpECnKR7knSApCZ52CG9gjip2wzb6GQL0STAMlKbzfoy3ljrLvSfYwbtCABFvCpOWdXMd1vprSNogm3FPhG6zeWLBQbpK2rf3Q3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sx8Bkbs5; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sx8Bkbs5"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-227a8cdd241so72423925ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 18:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744162640; x=1744767440; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9jg7a01cS3PWALct/tvK5cNQVh50VGd9fF1vFgvvu2I=;
        b=Sx8Bkbs5/vmcY/Y1Btaussl/c9cfUeiggp14jN/c+OzJ7d4KwKdm0kyPGMii2jOuzF
         NTAHNAi/glm7hoJrOZm1BCZmUeEC071XfdFES9Siu0yGYJ7mzC08uQmTiu8rk6epXWQL
         TNy9r14iaYusKw87aTzd1A7DTy06UFtXRXkTURNUaCn5r0lqz2VWGyXZZdbm8WMswWNC
         cPl82zzkYwa9+0ZyBDf90NfoqqMB122mutn46BUIrdIUvvJwuK0E9YJD7ZNVKHrkgzsI
         VGEGe2k3uiY1ouFiFA/RX+4DXtaFJNm7z3Bt2ll+jPNMKf39wH5rrrokFt+HlM4zLttk
         ykIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744162640; x=1744767440;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9jg7a01cS3PWALct/tvK5cNQVh50VGd9fF1vFgvvu2I=;
        b=OcR+PMaH40gB8AACS0a0ps6jGIFvmAqPXLFENy5q4zk4mDBMxtCgsFHk0qd5kb+Rp2
         dAvlKeago7/J8gRgl8MimiXJmrWhxJ6xumrqVKDYR7e54tKyOhR+eyiVCFHfnzHksvok
         HD6CbAQ57TR8ScyUvQxot5YLpFI88399fbttGiQ5gjdrvjXe6cQtdJL8c7fkZHNHC4v3
         xTpUl8EFZm3Jy8nriPhSugfQoEEVR8aBGmO9P6j8ztnSxyJgLinFE2J8cr76xe87Vcjb
         zajo+/b5ntRbBXDvV9Ux7GGBzepyOF7R+slVZ+Q/KqSPjwL7vnLRy/6baJKbVBanzNsO
         LgVQ==
X-Gm-Message-State: AOJu0Yz350D0C49Zzij3TwisommaMmDIo6Ax4IUOZKwtbjE6XZIjH2Zi
	OvUe8H1qRnhwndoawlOLlC9XcpKoBuUXAbbiOqDoLquEzO//LvppC6wODTLJ
X-Gm-Gg: ASbGncsucZ922joKi0FUfDhfZnDiK7XV0aXGa9WbPhCmio7FkjuONnW7bRLsNZs+ZAH
	QkECW50/oEYu4c+Ryx4DbFU/63EgmiXiLu7C21r00gKfxbco/fZPbp4D4wqlP+3HjnDRLdA66yi
	QQCI4BEDra3rDwwHDf7d39iJ16rkSsviXPxhBpYF0D5XaZAz2cBpPTdJfhaeNn1yKULQyZtC80R
	QtjSOwY2SgzRaw3usSe82VeIkqPrtX/QeBNjTIMP0ivhHPeQaMGLMK3TsSjjYxlJ0wj/rc4O71D
	2Hf/jv6b3BdiZ5Zi9CWbcj71sxcSGRCwr/W04ATA0bTuJQ==
X-Google-Smtp-Source: AGHT+IE8VrQjUwkOTMGD8k0oVoZ+EWxPk10Kn65W7/MZJDIBYD34SspBN6FTCdGOV4Q539L6Bx1MQw==
X-Received: by 2002:a17:902:ccce:b0:216:644f:bc0e with SMTP id d9443c01a7336-22ac29bc06dmr21229025ad.24.1744162639905;
        Tue, 08 Apr 2025 18:37:19 -0700 (PDT)
Received: from [192.168.1.6] ([58.29.143.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cb5304sm9775ad.189.2025.04.08.18.37.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 18:37:19 -0700 (PDT)
Message-ID: <a536eeca-8e35-4986-9071-789260d0db49@gmail.com>
Date: Wed, 9 Apr 2025 10:37:15 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHSET sched_ext/for-6.16] sched_ext: Reduce usage of
 static_keys
To: Tejun Heo <tj@kernel.org>, void@manifault.com, arighi@nvidia.com,
 Changwoo Min <changwoo@igalia.com>
Cc: linux-kernel@vger.kernel.org, sched-ext@meta.com
References: <20250408230616.2369765-1-tj@kernel.org>
From: Changwoo Min <multics69@gmail.com>
Content-Language: en-US, ko-KR, en-US-large, ko
In-Reply-To: <20250408230616.2369765-1-tj@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Tejun,

Thank you for the cleanup. Looks good to me.

Acked-by: Changwoo Min <changwoo@igalia.com>

Regards,
Changwoo Min

On 4/9/25 08:06, Tejun Heo wrote:
> sched_ext uses static_keys to optimize branches on ops flags and which ops
> are implemented. Some of those branches aren't that hot and while others are
> hotter, they are unlikely to cause meaningful overhead difference given
> everything else that's going on. static_keys were used more because there
> was no reason not to use static_keys. However, the planned multiple
> hierarchical scheduler support won't work with global static_keys as these
> branches would have to be based on the specific ops instance.
> 
> This patchset replaces static_key usages with tests on ops.flags and a
> bitmap tracking which operation is implemented. I couldn't see performance
> difference in numerous hackbench runs on a Ryzen 3990x machine before and
> after the patchset.
> 
> This patchset contains the following five patches:
> 
>   0001-sched_ext-Indentation-updates.patch
>   0002-sched_ext-Remove-scx_ops_enq_-static_keys.patch
>   0003-sched_ext-Remove-scx_ops_cpu_preempt-static_key.patch
>   0004-sched_ext-Remove-scx_ops_allow_queued_wakeup-static_.patch
>   0005-sched_ext-Make-scx_has_op-a-bitmap.patch
> 
> and is also available in the following git branch:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git scx-remove-static_keys
> 
> diffstat follows. Thanks.
> 
>   kernel/sched/ext.c |   91 +++++++++++++++++++++++------------------------------
>   kernel/sched/ext.h |    8 ----
>   2 files changed, 42 insertions(+), 57 deletions(-)
> 
> --
> tejun
> 

