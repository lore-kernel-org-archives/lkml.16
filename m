Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBA72566D7
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744152485; cv=none; b=aDVTl9KdPFSyvkjJ/fVa7YqS4koyVdDXRixmdoc6j9rTTlVoftFuUnccpmuP2p4zsLMEez9KjursETwMYGc70qezTczytK3Uvn3uZTzPUbB5/GdS/w3jaQI6bL/bWLBB8rGiu3yrn+M+fh0+VLB/pKGX99ZZVe440WsEi3ZnHfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744152485; c=relaxed/simple;
	bh=y8+CvYLiEM3KjA1U3H6Z9Auf+nQ0YwmBzELzoP/gG1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GhQjtNJyKUoBXJuRZ4owyokz/RMvJBez8YiVtPgCxnEPMXfztWedQtedrClVUIPE5EvHK7v0/bMWQuCOzP8CFirJ8TuE+wf757ehg4z18UoJ/Y7xvO8Ph++9+4yp07Y9XAAeyEkHGQkm1B0NKlTGDTaDoboOg26cnNlDe8ywAQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TM51klGh; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TM51klGh"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3d5bb2ae4d3so20786895ab.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744152482; x=1744757282; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qApWvkE8mya8gnajvL4RevZsfcaInJhP7Ceavgsce2A=;
        b=TM51klGhQWpo2u+3VIwGR325eG15VRbHE1vdcQJslVVHhA18+VY3cFatnOhI8fPeih
         XfkMhlFN6oqM1py1CjZiqdxTFTybXd3yW+eomzMvF8R2aJVEBfG3gAt/4QXuduuA+A2b
         pYivClFpTc5kyrp1W3wfHI1kzc2auNAw7ZDgc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744152482; x=1744757282;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qApWvkE8mya8gnajvL4RevZsfcaInJhP7Ceavgsce2A=;
        b=diQcjVN0JiE4G4F6kRiTp0E8J2JObTAtaNGjvVHNUpwwHT9s+jdHbkHPiVKXSNyH1T
         eAHaaPIiRvGjRRvU2/Nzew7EALNSlgd103FP86szeoYy2hJjAm+pzRxe7G4IaaYSPkex
         /W88fudEL9MIvhBJY8NVo/aUP6eII1C/793cPJC1C9Ab4ImhiZ83qHmjACpYuqg4dziT
         bokHfJ3u3eZrEMPJ7VdzFlpToIq/UsoP8xHUOmwf4t6FuJilIvaVYG3ZvXZyuTM39Z4b
         v7XPPPybcGCJOnFaAA+Z9Opunr3dltOOcAjS2qdBBQKSIIfIMCMXvc0ixNe4excNFSZk
         St2w==
X-Gm-Message-State: AOJu0YzozXq1DnRqyIxEbz15iatfPGOV+CM0jNbONbnROC4MkIaNg6Sg
	pF721/WukH5d79LYT9DNSIDQv7q7yWgvzusYsGUTIc23xiZIzyA7BR1D1TGKsrg=
X-Gm-Gg: ASbGnct9HpWR/K5tRBpeOlNdST2KTmbEMdqvT4vsE5dNXWYRbq/zpWEbSvaMRbSMICF
	+VA0L4UcHvVdg/n7URV3gtWwA38di4OspGWYHHNnvHu4tqSqqkhJM9YWkPrrEqlQWaBpBo0YKc0
	4JzXRu4tj2GeGM3qBER22oTwqFNceYOmnKV3u64hYMKkD5yAtbjthChYAvBtOcY81wJk9gxl8Qr
	bRE5DjCFK3vf27+D3dex+hz4CpE3pbZhzgGWublokffYLxR+fFkuy2hwyeeVHLx9ySCbzt+JVlv
	Nysknf4uqH9zFqHfswK21niSnI8NhKJc3ZDJ8XiNdT++RDktVe9h75I=
X-Google-Smtp-Source: AGHT+IG23EEm2QBJqLMY7MUecoZNLZpu2SPnxQB0VkemmEKLyn83DujZHxWYhEbMsa3U0tEJsaD81Q==
X-Received: by 2002:a05:6e02:250d:b0:3d6:cbed:3302 with SMTP id e9e14a558f8ab-3d7b45fd041mr3850745ab.2.1744152482461;
        Tue, 08 Apr 2025 15:48:02 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f4f43d31cbsm719034173.36.2025.04.08.15.48.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 15:48:02 -0700 (PDT)
Message-ID: <803bf3ec-08ff-49c5-8bf1-1fa27f2477e7@linuxfoundation.org>
Date: Tue, 8 Apr 2025 16:48:01 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/pid_namespace: Add missing sys/mount.h
To: "T.J. Mercier" <tjmercier@google.com>,
 Christian Brauner <brauner@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Alexander Mikhalitsyn <alexander@mihalicyn.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250407225953.1540476-1-tjmercier@google.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250407225953.1540476-1-tjmercier@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/7/25 16:59, T.J. Mercier wrote:
> pid_max.c: In function ‘pid_max_cb’:
> pid_max.c:42:15: error: implicit declaration of function ‘mount’
>                                         [-Wimplicit-function-declaration]
>     42 |         ret = mount("", "/", NULL, MS_PRIVATE | MS_REC, 0);
>        |               ^~~~~
> pid_max.c:42:36: error: ‘MS_PRIVATE’ undeclared (first use in this
>                                    function); did you mean ‘MAP_PRIVATE’?
>     42 |         ret = mount("", "/", NULL, MS_PRIVATE | MS_REC, 0);
>        |                                    ^~~~~~~~~~
>        |                                    MAP_PRIVATE
> pid_max.c:42:49: error: ‘MS_REC’ undeclared (first use in this function)
>     42 |         ret = mount("", "/", NULL, MS_PRIVATE | MS_REC, 0);
>        |                                                 ^~~~~~
> pid_max.c:48:9: error: implicit declaration of function ‘umount2’; did
>                 you mean ‘SYS_umount2’? [-Wimplicit-function-declaration]
>     48 |         umount2("/proc", MNT_DETACH);
>        |         ^~~~~~~
>        |         SYS_umount2
> pid_max.c:48:26: error: ‘MNT_DETACH’ undeclared (first use in this
>                                                                 function)
>     48 |         umount2("/proc", MNT_DETACH);
> 
> Fixes: 615ab43b838b ("tests/pid_namespace: add pid_max tests")
> Signed-off-by: T.J. Mercier <tjmercier@google.com>

Change the short log to include the subsystem. Send v2 with this
change.

selftests: pid_namespace: Add missing sys/mount.h

thanks,
-- Shuah
