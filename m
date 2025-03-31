Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299CE211299
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 13:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743426444; cv=none; b=hm+onsYjMTPEnqT11DwgSApdIXyUYNXOYRsB4k+BCRWzloYXjk3Rt48+3XsSt63pmWZN5IODefH0rsmwQfNeehH3mkeA2JmxJHCUk2sKoNAQHhaxA1H/XgTb8YeM/ih6FiE98jwTkTt8SuHB2ds6IdcWc8wcn4uGnaT1TEzUbYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743426444; c=relaxed/simple;
	bh=16YwZIoXgnM9i1KCudAoJ/d9NcgG2KIssSVas1YK37s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mWvVt5EDTfZmBI3zo5rnzFIsXtAIAxiUT5NX88aL+MolCIzX3aK+rnGkELeLZPpA6wTotTnt/B6LNcTFTGbacguyQNuGImMapK+q4Bq8Jq5PqELOFt/U/4DUFovLX9j9/htr3fVkxGCH9T9wIBLu4JNsVRiSOqgQNmDP4dRrg2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=gsl2Knsa; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="gsl2Knsa"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3d4496a34cdso17450975ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 06:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1743426441; x=1744031241; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3ed/Ddyzsa1QN6yzj0LbFuD8MNEjFi7fRrdU4dK99FE=;
        b=gsl2Knsa2Uwk0CxzHOT5kvv1hUlPdbHPCCTlxgJcfo9I/G0tEZbGwl+OHAtzuQtPWx
         RAGy0QFGFc1CGdEx+IcgaH0T2fMrGU/zZ3FucCgyOBEOfZHcIIcUlVVt84eC3Vw44juC
         1KwPZ6K1tTU0x5YigBSByp6IX5GEWvjGokDmzHKZ8nGZ977TksCtRlR/kPelF10N9bZr
         Ey2amgFvqIENnGA8UgbdhIlJetiJQ47XPShzmSBofkkTQLx6YmqrMxAZjP4mRRODK5zj
         yiyrzjpQ7zezTJNgyYPn+tyuJP5+jCk+6GF1gHVmlNPl46tGAkRS9nR2DNocmZJoQ9TS
         ZXHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743426441; x=1744031241;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3ed/Ddyzsa1QN6yzj0LbFuD8MNEjFi7fRrdU4dK99FE=;
        b=iURAvUybBph1pc4HcsCdzgP9Zeg2oeVh+Au2ajByIpJXU31mtyuIN927m9gmgRZ/RF
         Yjz99vQ7j3y31DcOK8aeYni7yY8RYRO3uO1ZZJiqPyI3QV43qLg9OjYj6SeCyeCEva+g
         lDFe5TiGZWb5mgGu9tptjeI9Wr+2AyptEPrq5n5Aez5hvnTdG+gabA4Y/KM4Ktlxsn2k
         EEG/BrWINa5hkbYeHKIBi999dOlfisP8ScjSYF1/F5g+3j0T8xN1rPJyV78bNWnvMeX4
         GveMUpw/H7fLBBIwsjrJaIMZk/KuJ2xzXAHrnEkedjWbRaLmOEhO04PPrHtMD3VIvdG1
         0oKQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+4MlWhmH9SlVfJBxnnZWWzUFRtQx8eD0nU12Z+7F7ULjJjH+Ognp1Pc5EilJrJMAICvk3aah4ZUwO47c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYwAvH2gtl9y2HrvkNYZ5qf2Mn1Mn+Qeys8+cB3deILJEiAjQX
	yG7f+kqV0izm3u9onlggQRAWilyCRsCXLA42GI7/ESNRZ2YqCuRergZ9xGRgVd8=
X-Gm-Gg: ASbGnctoUeh5MzaPPamMWg0WhNBFT4zmaMF6q4RYRdmyXLJiFMoHdVoGPR5Q8vihc5p
	2godpRJAnR5qDjmrj4tGPZVWZRB1socqgi5p0/oF9Y8Goik8wliKuL/DjlvIkOn21QEnDt3+8Ax
	p7taK/ADGYUhOLuTE2u2MPTVQafTXKahymbA2HI+Fn/FVaynQ664Mx4r6U4NNHpdl4TVZs1Aek5
	U16KrdtDfg9B43z/+AKlemfQRqp732a12hiF9W9nxUsnOd25MWEoKoAOI8M4vuuDU6XeoVaZINY
	cjjriSfWlz2laTS2pp4j1vjIXl++ggyXm6EtlMEsMg==
X-Google-Smtp-Source: AGHT+IG32Cg6zI9tmakUIJ1DbRmEZpmwRLQi8qjY4xoSKRbxylqUWbU9vadDFdtujdQ/ao3ofcsZDA==
X-Received: by 2002:a92:ca09:0:b0:3d3:f19c:77c7 with SMTP id e9e14a558f8ab-3d5e09c8d9fmr73771055ab.16.1743426441218;
        Mon, 31 Mar 2025 06:07:21 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f46471b40fsm1863674173.26.2025.03.31.06.07.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 06:07:20 -0700 (PDT)
Message-ID: <aa8b9ee9-1787-421c-9914-d3d7c77bd1a2@kernel.dk>
Date: Mon, 31 Mar 2025 07:07:19 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warning after merge of the block tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ming Lei <ming.lei@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250331163734.7dc27905@canb.auug.org.au>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20250331163734.7dc27905@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/30/25 11:37 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the block tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> Documentation/block/ublk.rst:353: WARNING: Footnote [#] is not referenced. [ref.footnote]
> 
> Introduced by commit
> 
>   17970209167d ("ublk: document zero copy feature")

Thanks, I killed the footnote.

-- 
Jens Axboe

