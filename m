Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652AB38B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 12:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748953121; cv=none; b=rYFESlU/xdZbiBj5KMp21B7ia62lQ9MPz4duNEzk2indhArfsltPANKAIFCsjW6xmZrSjvv1B6ITYRYIjmqntOlGw8D0PU3wr01yKtYHFzOPILU+eGehWqYVzqMdemGpxoaYWGLPTWSxw+rXvgV5+X/3WR5icpHDcBHYZLXA6+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748953121; c=relaxed/simple;
	bh=qqelr6WefH4ksn4hmxQIH+uD8LjnzY/T2HQdhdN1d9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tfvnfDDl27hE82LvM9OnLGBo4IIv+RMUDar7u/lN2ulwW5lCp5hyMb1o0/nfBKf+d5Rb6caJDwFh9PcBKytKnm9AJ4Cju0ZL3T9+AD8gEYWKh9vhMz0iSjL991KwNb3TDATDhViqOhIPWrr9VnUWohZdlkV4qf/EThZULseFjjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SGbf4Fie; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SGbf4Fie"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748953118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=rGnUEgcN+7RA/ytGOeobTKPAhnPkELxdJYjsHxSNJHc=;
	b=SGbf4Fieq0mMg+5lypyz3A+jWWhbTyEYHCB5rd0dwSeNd/iCS+FfaC0QtiHyzXXwqNHL1k
	tRSYDUa2p793iIelNDa8MfHYxmBlALTejNrXAK+kITcJZu3cUv1B3Ia4Br22NBHtSkQeTW
	9lDPd/AH+W45cb9zSc3XsSu5CvMA6Io=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-142-tnwDMuTbNi-fOZfg9ebWvw-1; Tue, 03 Jun 2025 08:18:37 -0400
X-MC-Unique: tnwDMuTbNi-fOZfg9ebWvw-1
X-Mimecast-MFC-AGG-ID: tnwDMuTbNi-fOZfg9ebWvw_1748953116
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-450cb8f8b1bso13964435e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 05:18:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748953116; x=1749557916;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rGnUEgcN+7RA/ytGOeobTKPAhnPkELxdJYjsHxSNJHc=;
        b=sQygcHxbQWXr4cwhCb7ISWPTTcmvSgSE5H3zdWBSA5cDBQYdgpGF5+r5xbImILvYvB
         60nvrdaO94pHC/9S8TvoYjVYZGqXJXaNFHqgv5bTe9h3lJoBtEnkY/lsXh8SBdp/MiPr
         WCl7C3UgGhauLtDSZZp/GHtIumVEf6L+qzl4QCcc/ErHwjmmWz2F9G7syNHe6IaMUPHD
         2R4vFZ6Str0JoilZ4bIUSP2nRKVFbbjia+eGxN+oRBUffb4qFzyeyy8S1qGyNjuBy3wC
         Pt0G7L0EYyAGmolyBbdPOIrHto473Snu/S9mSgyv9dFwYaB/Rf7KnfaqXk4U34z8iXT5
         qSIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjQfPoTv8CtKUuhL0f4x/XP8/56pB36BTtC4Pk/P17lgkpHePQUJVEC1whWhImLklSc3HhY7VBT+OMUHc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJzmZzwF2oCLlY0SWH5AA4g7ZTsMJHZa41+7WttuT59E/pDy0i
	LSC8bq59E/cFJMyJzMexxrCPWBPbw18CmUQwUS0jBwJvFMYVYZsoAyVtDrXHBujb/9f1GhaqWrV
	wh1RD+5vzGq1U4GZBJzzeTvncWaBl9VOQDlImK8IbwcbWVzYh5S1P25OYVzx8BtCzfA==
X-Gm-Gg: ASbGncuhw23D63HUcXNy7o3M7Ddicsu/MwM6cXiuCc7S+r8T6oDs6j6SuorSda6Fpww
	xZmDjkg2ZqYEtOlUjUReICX+zjH6WHP/QgCeRt2tXxN3PC72u5aVa5HL3FhG8AZTlqsEHotntgc
	LRzU15ZZKQAPt01MI5xOucOs/Q9L6pnEvtSV4oST88QLhEsQ7UtTtH+oZ/a5XSeAKRf1sLxZYo2
	83khLpoT6748BLSJqOOZeyPVJYcvHjVyZEfqFd/iNo+oJMUxsYfRPhxr/jzYe03j9kFa+64wVpc
	kwwpAIZhh3Ygpib7iv2y8Hv4BCXYo8sjktZrxz7P7DLIvP5lAZUcIH7HiExr1eO+Pbp9YGiFVpj
	ieqC6BtBj3K8GE8w/tv8Mj9WYivLoBYu5fW5AMGI=
X-Received: by 2002:a05:6000:40e1:b0:3a4:ec02:739f with SMTP id ffacd0b85a97d-3a4fe3a7fd4mr10355204f8f.53.1748953115775;
        Tue, 03 Jun 2025 05:18:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNvHT62UHgjopRVOc72VPbTa45IgYePiLCTNYPu63GrRHjm/n/UNxhItLC6lUI5d5CVUBvnA==
X-Received: by 2002:a05:6000:40e1:b0:3a4:ec02:739f with SMTP id ffacd0b85a97d-3a4fe3a7fd4mr10355180f8f.53.1748953115388;
        Tue, 03 Jun 2025 05:18:35 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f0d:f000:eec9:2b8d:4913:f32a? (p200300d82f0df000eec92b8d4913f32a.dip0.t-ipconnect.de. [2003:d8:2f0d:f000:eec9:2b8d:4913:f32a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7fb8751sm157456315e9.29.2025.06.03.05.18.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 05:18:34 -0700 (PDT)
Message-ID: <76768319-5c74-4d14-9515-3679e00f2efc@redhat.com>
Date: Tue, 3 Jun 2025 14:18:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] MAINTAINERS: add mm swap section
To: Hugh Dickins <hughd@google.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Kemeng Shi <shikemeng@huaweicloud.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Yu Zhao <yuzhao@google.com>,
 Kairui Song <kasong@tencent.com>, Nhat Pham <nphamcs@gmail.com>,
 Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>,
 Chris Li <chrisl@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250602152015.54366-1-lorenzo.stoakes@oracle.com>
 <0599e483-fe41-f8b4-ace4-d570ba10c9d5@huaweicloud.com>
 <20250602185706.fc305626e7885f6b63f3955c@linux-foundation.org>
 <4ac34306-b674-5862-969a-0ac089a86f3e@google.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <4ac34306-b674-5862-969a-0ac089a86f3e@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03.06.25 09:20, Hugh Dickins wrote:
> On Mon, 2 Jun 2025, Andrew Morton wrote:
>> On Tue, 3 Jun 2025 09:17:50 +0800 Kemeng Shi <shikemeng@huaweicloud.com> wrote:
>>
>>>> +MEMORY MANAGEMENT - SWAP
>>>> +M:	Andrew Morton <akpm@linux-foundation.org>
>>>> +R:	Yu Zhao <yuzhao@google.com>
>>>> +R:	Kemeng Shi <shikemeng@huaweicloud.com>
>>>> +R:	Kairui Song <kasong@tencent.com>
>>>> +R:	Nhat Pham <nphamcs@gmail.com>
>>>> +R:	Baoquan He <bhe@redhat.com>
>>>> +R:	Barry Song <baohua@kernel.org>
>>>> +R:	Chris Li <chrisl@kernel.org>
>>
>> Whoa.  Hugh doesn't escape that easily.
> 
> Sorry, no, please leave me out. I don't need to be in any of these
> lists to comment when and if I can, and Reviewer I'm certainly not.
> 
> (And Lorenzo and David already know I've opted out of these,
> there was no disrespect in omitting me.)

I'm glad we still have you as M for TMPFS :)

-- 
Cheers,

David / dhildenb

