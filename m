Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3461B2EACE5
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 16:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751558638; cv=none; b=AgCIFkF6zythHXOZVzx+qLTzUMbeKwsZN45qv11pTqeEjW4mxf36tdOxEqW0uiGlIFhV4CTFB+GzqYFLUAIh6YFnu2JSnr09aRHT2KYGYcTT+dNtZszf4dnAnru4UgcqjLuRxpg4R5fHooJ6zguo4nsZbzW1iAvZ8w1ABWlfMBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751558638; c=relaxed/simple;
	bh=45no1ZSRP9ZgISPSug/hQGZSvkJCKpkWro/E23xCXnE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qWppRA9lblbMMhfiGsV1Me5HK+ha3UobudB/muW+J0WhxqB03pebPd2y+b8jh4vHqJ9hdBux7PovhKXZW63a6fMVtRLCJOt5PL4NaA68bgMPUorUMfL+gs0pbr45QnbulbcZFvKXdeQTfuOc564M+gTcz/roBVgmJPG1KcBORyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=iUwkEbhj; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="iUwkEbhj"
Message-ID: <9447cc50-03be-4eba-809d-f9e3381654fa@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751558624;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tcnfgrgLziJsJtGNHM11WwOgZeqfNsbwcjttOSUdxs8=;
	b=iUwkEbhjj7s7uRc1RrA/nf302Yc52VWq8yVDQ7fVYOj7dkpR3K/iX5y2IelMvzQ6qgPOhR
	zD5BRsL2JmZKNiTUV+xmfN5iu+r8rS/HnhcQOdDMvnrpCSvEmjqzVO+VQlW32BpX6lb5zv
	AycfcLxmEmwqcO8FFj7cQJlkQnZoheY=
Date: Fri, 4 Jul 2025 00:03:33 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next] bpf: Clean code with bpf_copy_to_user
To: Yonghong Song <yonghong.song@linux.dev>, ast@kernel.org,
 daniel@iogearbox.net, john.fastabend@gmail.com, andrii@kernel.org,
 martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
 kpsingh@kernel.org, sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250703124336.672416-1-chen.dylane@linux.dev>
 <b4925bd4-8169-47c2-9cff-5a4023f07a32@linux.dev>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Tao Chen <chen.dylane@linux.dev>
In-Reply-To: <b4925bd4-8169-47c2-9cff-5a4023f07a32@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

在 2025/7/3 23:35, Yonghong Song 写道:
> 
> 
> On 7/3/25 5:43 AM, Tao Chen wrote:
>> No logic change, just use bpf_copy_to_user to clean code.
>>
>> Signed-off-by: Tao Chen <chen.dylane@linux.dev>
>> ---
>>   kernel/bpf/syscall.c | 17 +++--------------
>>   1 file changed, 3 insertions(+), 14 deletions(-)
>>
>> diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
>> index e6eea594f1c..ca152d36312 100644
>> --- a/kernel/bpf/syscall.c
>> +++ b/kernel/bpf/syscall.c
>> @@ -5208,21 +5208,10 @@ static int bpf_task_fd_query_copy(const union 
>> bpf_attr *attr,
>>               if (put_user(zero, ubuf))
>>                   return -EFAULT;
>> -        } else if (input_len >= len + 1) {
>> -            /* ubuf can hold the string with NULL terminator */
>> -            if (copy_to_user(ubuf, buf, len + 1))
>> -                return -EFAULT;
>>           } else {
>> -            /* ubuf cannot hold the string with NULL terminator,
>> -             * do a partial copy with NULL terminator.
>> -             */
>> -            char zero = '\0';
>> -
>> -            err = -ENOSPC;
>> -            if (copy_to_user(ubuf, buf, input_len - 1))
>> -                return -EFAULT;
>> -            if (put_user(zero, ubuf + input_len - 1))
>> -                return -EFAULT;
>> +            err = bpf_copy_to_user(ubuf, buf, input_len, len);
>> +            if (err)
>> +                return err;
>>           }
>>       }
> 
> Actually, there is a return value change with this patch.
> bpf_copy_to_user() return returns -ENOSPC while the original
> implementation may return -EFAULT due to following code.
> 
>          if (put_user(prog_id, &uattr->task_fd_query.prog_id) ||
>              put_user(fd_type, &uattr->task_fd_query.fd_type) ||
>              put_user(probe_offset, &uattr->task_fd_query.probe_offset) ||
>              put_user(probe_addr, &uattr->task_fd_query.probe_addr))
>                  return -EFAULT;
> 
>          return err;
> 

You are right, maybe we can just use:
	err = bpf_copy_to_user(ubuf, buf, input_len, len);
and no return check
or move these put_user code to the front.

-- 
Best Regards
Tao Chen
