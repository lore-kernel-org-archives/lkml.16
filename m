Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EFE2222C0
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 21:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750280666; cv=none; b=kZq5IbfZ0ecPQFn/pzCnxxvkAMKwyrzNIkfskAc4LBkFKswVzi/XE2Lh/LvcZbadZuWE5iojkCvTfSHivT+ew9Aqlf8SVFZYij7XRzvyVGgBZb/rQ3yHESxPbgqPD0Wp9wyGRvCbXFuYamoMDF8qBq5fF431XM0jjTc9LJDgnHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750280666; c=relaxed/simple;
	bh=eAveYdp+CJSbttksgnLzBcG/CL/sLj/02iudO8gRfds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c+Fpxgv5Qgw1HTYyvfIwAnPYrtzKSnSMiUMOtByDD8gMvOqdG+6F8BDiM+PX0Kn+QlsgZGQ5Pf692rQtTtlTXS4g6+cnFPuWab+8u/js8PI0UuccubiT+MDM8bcGqGywqj4akkhpz8csbVCV4E37d9bT66Fj2Wcd0cOUZdLm1tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Xy3wAJsP; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Xy3wAJsP"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3ddda0a8ba2so1290195ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 14:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750280664; x=1750885464; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0fHWE80S/oA8e+zf9vFMy+doBrDeO1v+Go45/dwU7Dk=;
        b=Xy3wAJsP4soi8r6S3/pqUFbnpFnUgiY8ydVqM5iSi3hjPoN3/x9v1/Ohu1FJ3yf5Rt
         5qwCTQySUTHjmEIa3Hn1eVj4qxA0BXEYrk3EE/TpXH725bHuvwB+7y1qQHkmBTFKvc8p
         v0bhvouTppaAMgEe53UfecpjRgfVW8g3H/PDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750280664; x=1750885464;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0fHWE80S/oA8e+zf9vFMy+doBrDeO1v+Go45/dwU7Dk=;
        b=bpx7ac7+Bxqlp53pyGJAtHtxFUlr3VeVOA7HfN00K77W5YkizhyVSYWLvVFTOIPLVY
         G7+CqiAwVepw7YrCu3E/XP96j/xWw4Mm6TqreDXVTsIwXHGOSdbbb3SQy/Iza+/zmQar
         T2w2ahW0yTcgTpiQcfplUVzK9EBfhPqR5n7/xnlLQSFeo3dzemzdoM7gezveYlS0cR0F
         mXjkV67EfdOZgse9tIdzzva7cG3dY+BfzOqUVBgJcbNyWjbQOae/IHTnk6E8pIreQK2X
         WO9CZcFJ2gVNFHDIYqr4vGGN1aFvCvP2TQK28XqGV4T0ykfSpUQ7Ak5UIkzCRBuctbFo
         Sxyg==
X-Forwarded-Encrypted: i=1; AJvYcCW53Mv6zgzw63Q7hkcEXg5r8ZCWf5ltigGv5vZLZYqcy11wrfjdaj51rZhGLYtRdz5dDnTYZntCZdsO84g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3vwS5CqGrf5z7KAX/AieVqomjlwUmvnl+eMC65LXn01TId9Zw
	2qDE07TjW5xSNkHY05hGng8Te3WQvBwENJXdy9HD9MC35QpIn6Tl72AxbiIi5IbXnu4=
X-Gm-Gg: ASbGncuRY42iBf08KrttASVDoG3/6vrztKOmkjS8n5eSDuXgM0nkt7YuG+kX8IASkmB
	Fw1/nCApAyb4dTZzkC3PMwU821Ln2RbSRB+xsJZcI2fQzqq2RU/N1/5UsUHxQR4heVS2sCF9vxq
	szCZkLJr4ESAH6xeu7wI/cxV2sAVnSoNHnUMNxX0nz9GrpD/qUl/uLkEJ/6VbRopTzywhcA/rnx
	Yj4dz6irY2RydAWl8u4OCjeAncGhRgGVS/6pmNORbGWX+JCIcUjgeaJRHMB2RTT12stskgP4smv
	EyhQKlARkN1mAIQi+Oxxj4gm+RFUj8E/M9d6dIlt8Zbw7lIua1a43k0Ivj/sjMecUC4QvrvyNg=
	=
X-Google-Smtp-Source: AGHT+IHbdu1P2zp30ZzI8fTvGWQbg/H+WwVpblhCbHcKPoROPCuCUpcjOU9o7/bfiqBZJuL/oPTtaQ==
X-Received: by 2002:a05:6e02:2482:b0:3dc:79e5:e6a8 with SMTP id e9e14a558f8ab-3de07ccd64amr249549455ab.15.1750280663962;
        Wed, 18 Jun 2025 14:04:23 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50149b7accbsm2973662173.17.2025.06.18.14.04.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 14:04:23 -0700 (PDT)
Message-ID: <2606da6a-3a13-4db6-855e-8dcc61c45b45@linuxfoundation.org>
Date: Wed, 18 Jun 2025 15:04:22 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v13 3/3] selftests/rseq: Add test for mm_cid
 compaction
To: Gabriele Monaco <gmonaco@redhat.com>, linux-kernel@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Peter Zijlstra <peterz@infradead.org>, "Paul E. McKenney"
 <paulmck@kernel.org>, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org
Cc: Ingo Molnar <mingo@redhat.org>, Shuah Khan <skhan@linuxfoundation.org>
References: <20250613091229.21500-1-gmonaco@redhat.com>
 <20250613091229.21500-4-gmonaco@redhat.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250613091229.21500-4-gmonaco@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/13/25 03:12, Gabriele Monaco wrote:
> A task in the kernel (task_mm_cid_work) runs somewhat periodically to
> compact the mm_cid for each process. Add a test to validate that it runs
> correctly and timely.
> 
> The test spawns 1 thread pinned to each CPU, then each thread, including
> the main one, runs in short bursts for some time. During this period, the
> mm_cids should be spanning all numbers between 0 and nproc.
> 
> At the end of this phase, a thread with high enough mm_cid (>= nproc/2)
> is selected to be the new leader, all other threads terminate.
> 
> After some time, the only running thread should see 0 as mm_cid, if that
> doesn't happen, the compaction mechanism didn't work and the test fails.
> 
> The test never fails if only 1 core is available, in which case, we
> cannot test anything as the only available mm_cid is 0.
> 
> Reviewed-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>

Mathieu,

Let me know if you would like me to take this through my tree.

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah

