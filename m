Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1563813790B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 01:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749520344; cv=none; b=sbGidcnuYSyCOrK/71NwZT9Zq71hnut7zAue5i6fIo1+xwIMVOxed7ET7gtvSWfZZ4EpO3Av4Ikjdpz6dTCcwKCNQtWZ6PoO+gsi/oVN7eeltZUMdorJJFqeVBKkcbFsihJAadZRNJHSR+fEtrDeZ+1FNxeCPwAr0ZldhMfs/3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749520344; c=relaxed/simple;
	bh=Tz6FQ4zC04lAPPNDfI2jkH1EmEdxhsyCW4P06YkJSX8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fMYJcSAkQI5I+nNixoOJf+/jnG7ljpL8AV0zvtnKNspxZrzNXIioOWJfXp27pvEbItZqItvngem8rnkuSI/z/355KVFHLgC7B53XkzFGA49OEtmvjTKH1Jl6JnfVUOWqe3Cy7uPnvMupRYU3hwKwnErqg6MtCu2HZpRtfmJX9iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jQ6bWXKr; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jQ6bWXKr"
Message-ID: <f8dc510a-1525-45f0-bfc3-8afe26ef20fe@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749520339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=txTKTVbjb1Tcro1zaVUKXsDZFFkm5+kxAZnE4eguYL4=;
	b=jQ6bWXKrvpYQX6ruyOxhS3SgK3yIHWX6uZtvI6yIkZqIXHA8pADCGoyIK+CIEGhgpSuBNe
	HKVOAiqkMnsTzsuIT/ZACfjrbHSyysCLEsqKY8TCnQ3vPd3wGTFDumZBdz4SiWpm4PguQf
	7K9+z0riZBcZsmjh9ymkZvqNMxPBrKw=
Date: Tue, 10 Jun 2025 09:51:30 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] mm/memfd: Rename error labels for clarity
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Ye Liu <liuye@kylinos.cn>
References: <20250609031858.73415-1-ye.liu@linux.dev>
 <20250609172654.a99c06d8ad90a6a994545e5f@linux-foundation.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ye Liu <ye.liu@linux.dev>
In-Reply-To: <20250609172654.a99c06d8ad90a6a994545e5f@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT



On 2025/6/10 08:26, Andrew Morton wrote:
> On Mon,  9 Jun 2025 11:18:58 +0800 Ye Liu <ye.liu@linux.dev> wrote:
> 
>> From: Ye Liu <liuye@kylinos.cn>
>>
>> err_name --> err_fd (fd failure case)
>> err_fd --> err_file (file failure case)
>>
>> ...
>>
>> --- a/mm/memfd.c
>> +++ b/mm/memfd.c
>> @@ -475,22 +475,22 @@ SYSCALL_DEFINE2(memfd_create,
>>  	fd = get_unused_fd_flags((flags & MFD_CLOEXEC) ? O_CLOEXEC : 0);
>>  	if (fd < 0) {
>>  		error = fd;
>> -		goto err_name;
>> +		goto err_fd;
>>  	}
>>  
>>  	file = alloc_file(name, flags);
>>  	if (IS_ERR(file)) {
>>  		error = PTR_ERR(file);
>> -		goto err_fd;
>> +		goto err_file;
>>  	}
>>  
>>  	fd_install(fd, file);
>>  	kfree(name);
>>  	return fd;
>>  
>> -err_fd:
>> +err_file:
>>  	put_unused_fd(fd);
>> -err_name:
>> +err_fd:
>>  	kfree(name);
>>  	return error;
>>  }
> 
> Not really, but I see what you mean.
> 
> "err_name" means "there was an error, so free the name". 
> 
> "err_fd" means "there was a problem with the fd".
> 
> 
> We tend to use the former convention.  See
> 
> 	grep err_free mm/*.c
> 
> The memfd_create() code would be better if it used "err_free_name" and
> "err_free_fd" to remove this ambiguity.
> 
> Someone who was feeling bored could go through
> 
> 	grep "goto err_" mm/*.c
> 
> and check that we use this convention uniformly ;)
> 
As suggested, I've reviewed error handling labels in mm/*.c.
"err_free_name" and "err_free_fd" would be better.
I will send patch v2 later using Subject: [PATCH v2] mm/memfd:
Clarify error handling labels in memfd_create ()    

Thanks，
Ye

          
