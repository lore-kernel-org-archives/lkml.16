Received: from mail.nfschina.com (unknown [42.101.60.213])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 5D8582222C0;
	Fri, 30 May 2025 10:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748600976; cv=none; b=U3YlOLK5Lw/qtNJd/Mz+60VQtGrvffPXFbMO+W6GDjkAI4R//vBp2/h2FEzX9uLjlz8QqpHo0qPqfzBV7q6D5Pw/41iBGXUZVyoMoQcP6SCBRlOQzF0gjCmqJxY1ezyIEfzrrzoA+jBse87dpMDGyIrKH9PRKktQy3KQGxQlRhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748600976; c=relaxed/simple;
	bh=DB3MFKB2EWYDWs8y86REFzNC3zVqE1NTe3DLImhWNc4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type; b=l/uOqGExU5UhnC58YgRM6dv925fqntM9aLkaj6YmJ6NYvjhwbxiM44Cd5pml7gtUkb0OyH393b8/7O6Io2t3GOQW+7NJc4eCuqk2CjSsqkGKvxZnSEwl9Ox0bqsMnwfP+IyHq6PVrbjWNZpbsUl232vYtc8I9tUb2NKAfPG6xiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from [192.168.43.55] (unknown [122.96.47.185])
	by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id 4D5D06024EF3F;
	Fri, 30 May 2025 18:29:28 +0800 (CST)
Message-ID: <1f027931-8781-4c6c-86c8-2d680b86974f@nfschina.com>
Date: Fri, 30 May 2025 18:29:27 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] afs: Replace simple_strtoul with kstrtoul in
 afs_parse_address
To: Jeffrey E Altman <jaltman@auristor.com>, dhowells@redhat.com,
 marc.dionne@auristor.com
Cc: linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Content-Language: en-US
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 122.96.47.185
From: Su Hui <suhui@nfschina.com>
In-Reply-To: <ea42a3fd-7ce8-43e0-a2d5-c5353070bfe2@auristor.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/30/25 7:35 AM, Jeffrey E Altman wrote:
> On 5/27/2025 4:49 AM, Su Hui wrote:
>> kstrtoul() is better because simple_strtoul() ignores overflow which
>> may lead to unexpected results.
>>
>> Signed-off-by: Su Hui<suhui@nfschina.com>
>> ---
>>
> Su Hui,
>
> Thank you for the contribution but I do not believe this patch is 
> correct.
>
Oh, really sorry for my stupid mistake. Thanks for your review too :) .
> The second block is required even if the simple_stroul() is replaced 
> by kstrtoul() as it protects against an input string which does not 
> contain the optional subnet mask but has some other characters after 
> the address.
>
> afs_parse_address() already has its own overflow checks following the 
> simple_strtoul() call which is specific to the interpretation of the 
> allowed subnet mask values.
Agreed, it's my fault that I only see the pattern about 
'simple_strtoxx(....)' and 'if (*p)'.....
>
> Do you see an overflow condition which would not be caught by those 
> checks which would be caught by use of kstrtoul()?
Actually, no example in reality.
If p can equal to '0xffffffffffffffff0000000000000001', simple_strtoul() 
and kstroul() all transform 'p' to unsigned long value '0x1'.
But kstrtoul() return an error and we can know overflow happens.  If 'p' 
can be a very long string, kstroul() make sense.

Su Hui

