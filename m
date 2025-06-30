Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A3228B7E4
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751291748; cv=none; b=XOmcebYCVIoi5Ey7Uda9IDLEEoYhb3uAUzCmPx6nkIkdxn5yezVFs8BsHb1ESEag4d+ucHRooW3/u92EABD2PChT3Q8XCluxQ6MSSweqjFcpruFqPQKjGaE9UbjAYQO4UDJBPvdTPPhJcgXSIIJBLhF/kXQY2AQsl22Z84l8XbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751291748; c=relaxed/simple;
	bh=Gu9OKf8rQBmrExSPd1d0qTtLcNZrMzJ2i8I87FDAePU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o3XS8n/JG5g6der24AoNhI2a5ESNw4CeODmd/W5nJV1qK8k9OYKRkWDOZnoO/ip1IRnDF1q0VPCCq3qQLvLpA4aZYiVG3/SXDPLbBtCF1IsUx2+hf++1AW3rXbqgVcbf5AGvpp1yXsg1FqKU/oh1evLT85ItdeyyI7FSscPThJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DjcbxbCT; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DjcbxbCT"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a4ebbfb18fso145313f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 06:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751291744; x=1751896544; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fdj3pqe8ZDsSy0zFVlQn+uagXU2FmydKl9tMhyBgJnQ=;
        b=DjcbxbCT0jVEGrc1rcLsWP3SV/fH+z5k88/fQAMT8ToUHM4tg+hkp5q8DdmSBfRoL4
         6W6taOo3CFKa5S5GQxO16Vv77ewace2Ehb8o0xy6WXc8tGBzpKPuH+hT495C2f07xWNX
         z36l1WyPbBo/qUyg3BpDVFhQbfvVnp7zCC/KA+aEPakShd7Wq0q8Xh/rWoPfqGnK6CFH
         f93N/mAsk9DFGc2LYLDLx3Gq5naF93JJwezMQHJZ/lk/p1n+sKv9PliLaVNryEgqe2ov
         fkwgboTXwVvqak1ohuRICTkAlEiJv2nuBqrYniiOiomJxhYVVi1A6rGxLGJunFuF4Is8
         xQOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751291744; x=1751896544;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fdj3pqe8ZDsSy0zFVlQn+uagXU2FmydKl9tMhyBgJnQ=;
        b=jNgM/3xdn9DXs02n1rf5d10+PGHYpGMWod3AKyTvnFf6IDr/sRWs98jYzoxLM28c1h
         GrSKGGGLoe1mjxnpRLJVV2o+5EQusOJ7YMyky1ZpEIqR75av08+Pcd20XTUvHBJVTacr
         f2/6FRKMKpJLIEEFrKUeRmfr8v25ZRUs651Grw0d2z5h6Z3GFXiKaDw7Q3oc4HWbmH6u
         EMixF2xcf4H7SczqcrNP6J7PUnqTtbZ8PRCGrcJxzNxPVU5515NyI7mc4HqUkXQ+lWID
         6tif5IohXGWgZChJe21frWF8lGl6TcAMRfBNHMrbXyg/u4/yFN4ZmTOgvOXFHMQjYBGw
         mveQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmraFFq5F9M3UYpRSi9yDW0S6Vz4iBePX1wGy4jxtJuvPdXnuDqvNJjs1w+vTXtzD3YBvke4tpJbr2BvI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT/AEdWsXN+zqv1FodrI0xNu5tZUtzReoyADXaaIJqOJkani5F
	SJ8hY87LW5Ruro61bKVX5i6B32tCIEkYeS9n/LAtxpUN9Q10pTx+MpgA50J3Qh/D8mMPd7vIB0Q
	FqahG
X-Gm-Gg: ASbGncuGr1jNxKrGOf7s8OUfZUF09PU7fNNN1kqIXgZi7X3+kLVFN3zHSLjikACcjxa
	ifpTgnpvVrAUqGkgrBG3g5UOd7hnSim8JOjRZn0hv78jGTWZZZvqjF69WtJcUpokDzO2z7g2kF1
	PzBwI93IHVlotM/hEJC6uzb0iKQ7LS8x9NkCndWZHTeHeIA5mArwtuHJEfdB8Np+Mt/wlj6qSLV
	vooBI2xBz+Pj8uzvBGJglKPHZKL91nYSqzGvsgLkhlNiKS89Fy+c3EMDxWC0t/9yWR72jANvG+T
	u4WihpvWw9MIsPVma2snXFiSAs11D7GwtO0CP5wXfI+c7h3pBCbYyuFQtx7VUsTIUwai
X-Google-Smtp-Source: AGHT+IH1bo27fCLOgntXw5DxakwPIbKEfqHW5HovLZYLeRzABQNkd8wTWMAMfFy+4a0iMGjJkkJEJw==
X-Received: by 2002:a05:6000:2f85:b0:3a5:3399:51b1 with SMTP id ffacd0b85a97d-3aaf36423ffmr2915205f8f.6.1751291744314;
        Mon, 30 Jun 2025 06:55:44 -0700 (PDT)
Received: from [10.202.112.30] ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af557445csm9747580b3a.91.2025.06.30.06.55.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:55:43 -0700 (PDT)
Message-ID: <6ef3bcf7-4c49-47b4-a750-4e1a3a15bb52@suse.com>
Date: Mon, 30 Jun 2025 21:55:39 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ocfs2: embed actual values into ocfs2_sysfile_lock_key
 names
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc: Joseph Qi <joseph.qi@linux.alibaba.com>, Mark Fasheh <mark@fasheh.com>,
 Joel Becker <jlbec@evilplan.org>, ocfs2-devel@lists.linux.dev,
 LKML <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
References: <29348724-639c-443d-bbce-65c3a0a13a38@I-love.SAKURA.ne.jp>
 <d490a3ad-6309-42f3-9774-91871fbf7330@linux.alibaba.com>
 <d76672e5-0d69-42b1-a9d3-b70439c194b5@suse.com>
 <d54a0eb8-5899-4ea7-bc86-7a0d56c190d2@I-love.SAKURA.ne.jp>
From: Heming Zhao <heming.zhao@suse.com>
Content-Language: en-US
In-Reply-To: <d54a0eb8-5899-4ea7-bc86-7a0d56c190d2@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/30/25 18:39, Tetsuo Handa wrote:
> On 2025/06/30 11:42, Heming Zhao wrote:
>> I am not familiar with lockdep, and just have two questions regarding
>> the lockdep in ocfs2.
>>
>> 1>
>> there are three global "static struct lock_class_key" definitions:
>> - fs/ocfs2/inode.c  : ocfs2_sysfile_lock_key[NUM_SYSTEM_INODES]
>> - fs/ocfs2/dlmglue.c: lockdep_keys[OCFS2_NUM_LOCK_TYPES]
>> - fs/ocfs2/sysfile.c: ocfs2_sysfile_cluster_lock_key[NUM_SYSTEM_INODES]
>>
>> why did you env only trigger the ocfs2_sysfile_lock_key[] warning?
> 
> Because syzbot is reporting lockdep warning on ocfs2_sysfile_lock_key
> at https://syzkaller.appspot.com/bug?extid=68c788938ba0326046a9 and
> I couldn't find which lock_class_key syzbot is reporting.
> 
> Unless you want me to update all keys within this patch, you can submit
> similar changes on lockdep_keys and ocfs2_sysfile_cluster_lock_key as
> separate patches.
> 
>>
>> 2>
>> It seems the existing CONFIG_DEBUG_LOCK_ALLOC is incorrect, it should be
>> replaced with CONFIG_LOCKDEP.
> 
> I couldn't catch what you mean. There are many modules which declare
> "struct lock_class_key" under CONFIG_DEBUG_LOCK_ALLOC=y.
> 

I mean OCFS2 should use unified kernel configuration option.

- Heming
