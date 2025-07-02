Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BEC246335
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 23:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751499753; cv=none; b=d1mKDF5kVPFdtR/Bts1bV2/MOp9sa1P0MST5XOibLL0gIGffktQ7k1k3MmPwMBjzUE5VcTwKfPzQsCDJIXeL9P1lQVs/io38Qrl1pJTL4XY1dJyJdDzS81QpzZXrabr5wVdRrRinIxOXPnmeDnhxzGWiaWC7/WKRp7F/Eb0wLuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751499753; c=relaxed/simple;
	bh=jmzUUBjsU5AyPvp94lR4mNCcHNkoZYmCp2eYxl1XYZ0=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=jwZC7glbivdBK6Hzp3gCGsKYRk7HvYgwzmhrYqb0WqI5NjObkSxKiDeH7kXGDhJ0EB8QGoHUD1zATnOtj1m3H4i7wa0gkDhMQ8KYmJNduPEEStVl0kTYeuURzhTjaZ3Rt2pKHnW5BAQG0j24B6vJsiz590+8q6FH9HPJ1iKNvXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=cloud.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=bfA/fko+; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="bfA/fko+"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4537edf2c3cso73485825e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 16:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1751499750; x=1752104550; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jmzUUBjsU5AyPvp94lR4mNCcHNkoZYmCp2eYxl1XYZ0=;
        b=bfA/fko+VFAMwPzzQl34AiZR/905KKKuXeEcZqjuynx9SQV3gCPBokVmvybWAPrIa3
         ZFreT4sIw4xbwrMVgwM4qq2StiixPTmqQSruN1quhlepax0l9asodW2nJg2DFfRr020h
         G2HZFDT0Br53opYPAtqNByDenpdJi8yi67Kpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751499750; x=1752104550;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jmzUUBjsU5AyPvp94lR4mNCcHNkoZYmCp2eYxl1XYZ0=;
        b=cbBdR3ICbUfaCXA8PUqxD5H7ZjWOp6joGfMKQ+/krf+mtl3SxQIhIiMurIYadMHluU
         xWk8UhgBSrGckFNK9rXv3KbDayGoNLBgKeLlRvMMp8x2PzjSfbtu2v8xm7kZSZ6aJpfu
         xGuTMCEsH7sVr3uqP0+i03NzQ0eDhx6d2MAUnmWzzWtF/y+C1pPVscGewi5EvJdOMajl
         upvD064bK8sC7VRFmtFOiB7zZEpc9v45Z6SHzIOD5M8VJeGYg8kmgRg/SZB0UfTZFYCm
         OhtXkkQ3W9TPXX4qzlNYB7qAiJrfSGDz97k8wDBmaFLf3k4jU2JXD17w27jlsWoScUj1
         zxrw==
X-Forwarded-Encrypted: i=1; AJvYcCWZkLs3hJ+69d+/GUegH6PMqf6VDWFe8tH3kpE0HYvCXzgdLrEAZrSQAc513JVVdI+bH4jUtHFk0a22oq0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4+T9FMH1Udiy7JrKXuRgsFDJjdiSD8baX3bOyNDKOqULdTx/+
	T4j2NcYSBN7Nh8xLecsNEYE4yoaurA2xfDZn9iNhH3LNlk5SMbO04B4hf8ZGqZJlxS0=
X-Gm-Gg: ASbGncuRtcgcUxk32JrdqbfP7se0bc0LgIGHjvRtbi8Ks0iqiSvaWLIFESOjwbxvfkt
	VTs+EP+A33yM/J48Pdgsc93XGT20M/QzhV9LBYQkB+vWgDSyM3gV57tdvjBHliqWJrBro/N8kPi
	8Kk1kNvlwyMn3UWQoqVZDs5XvLvywUpFJw4+UQrCdoCHLXMhW6W3uO0fnO67UPMz0co6KF79ZNG
	PnrlGkf+fFjb9Qw4HH8MKsvDbTvqWBGS5j/5itDYzp7ZmmGuATo5zxwNLrmt6twwyc+EPph9e/t
	5NmNzXX1LsmAUQjBLP3y2fV4dyGEMs0GfQQwjb5kcJ8N2tH6KqNzEN6kgnLyARCoo4DETKd7zWT
	o6xHVwXome+MuQfe2Zl/8T4iH3aE=
X-Google-Smtp-Source: AGHT+IGeCkAGfhe6E529Edv+z8LxXw+ebOxsR4mZdYkZXix8QuKi+zHwvXZzZmFAB06yOq69Z9iXtA==
X-Received: by 2002:a05:600c:3ba6:b0:442:f98e:f37 with SMTP id 5b1f17b1804b1-454a4e75639mr37321335e9.21.1751499749858;
        Wed, 02 Jul 2025 16:42:29 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a999d399sm10529085e9.25.2025.07.02.16.42.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 16:42:29 -0700 (PDT)
Message-ID: <4dcd23cb-eb55-42e7-aa76-dbaf2e2a7e07@citrix.com>
Date: Thu, 3 Jul 2025 00:42:27 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: hpa@zytor.com
Cc: acme@redhat.com, aik@amd.com, akpm@linux-foundation.org,
 alexander.shishkin@linux.intel.com, ardb@kernel.org, ast@kernel.org,
 bp@alien8.de, brijesh.singh@amd.com, changbin.du@huawei.com,
 christophe.leroy@csgroup.eu, corbet@lwn.net, daniel.sneddon@linux.intel.com,
 dave.hansen@linux.intel.com, ebiggers@google.com, geert+renesas@glider.be,
 houtao1@huawei.com, jgg@ziepe.ca, jgross@suse.com, jpoimboe@kernel.org,
 kai.huang@intel.com, kees@kernel.org, kirill.shutemov@linux.intel.com,
 leitao@debian.org, linux-doc@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux@rasmusvillemoes.dk,
 luto@kernel.org, mcgrof@kernel.org, mhiramat@kernel.org,
 michael.roth@amd.com, mingo@kernel.org, mingo@redhat.com,
 namhyung@kernel.org, paulmck@kernel.org, pawan.kumar.gupta@linux.intel.com,
 peterz@infradead.org, rick.p.edgecombe@intel.com, rppt@kernel.org,
 sandipan.das@amd.com, shijie@os.amperecomputing.com, sohil.mehta@intel.com,
 tglx@linutronix.de, tj@kernel.org, tony.luck@intel.com,
 vegard.nossum@oracle.com, x86@kernel.org, xin3.li@intel.com,
 xiongwei.song@windriver.com, ytcoode@gmail.com
References: <4DE45AFD-C1E0-4FB8-BE01-44A72C5C6E1E@zytor.com>
Subject: Re: [PATCHv8 14/17] x86/traps: Handle LASS thrown #SS
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <4DE45AFD-C1E0-4FB8-BE01-44A72C5C6E1E@zytor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> Note: for a FRED system, ERETU can generate #SS for a non-canonical user space RSP

How?  Or to phrase it differently, I hope not.

%rsp is a 64bit value and does not have canonical restrictions elsewhere
in the architecture, so far as I'm aware.  IRET really can restore a
non-canonical %rsp, and userspace can run for an indeterminate period of
time with a non-canonical %rsp as long as there are no stack accesses.

Accesses relative to the the stack using a non-canonical pointer will
suffer #SS, but ERETU doesn't modify the userspace stack AFAICT.  I
can't see anything in the ERETU pseudocode in the FRED spec that
mentions a canonical check or memory access using %rsp.

~Andrew
