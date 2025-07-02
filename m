Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D791DACB1
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 14:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751467449; cv=none; b=N9SPJxMmEJwl+ZBf7qMkmED1qvVmm4BEfFL0/EDA7KgnT0Y2TJBQTnlte5xFZF8kB+YTC0N+IVBmFYt7nQrRdwHstT0/OWweCczu8eJItW+HagtcFPbFKSM34qCAfPdhjIgM+GI59hQwPPHH89f7zhN7gsH2Uppfb/wMs05E+bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751467449; c=relaxed/simple;
	bh=6Wb49X0BJHbqwWrkROi+YR+7r3jK71+OW26GsASEmwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lldzv2l57FN4BQpp4PnBv+AH0WSg613VACzZwBMgBToC73hB8Usezo+bIfXXHdPcdzYn/k1W8d2xh43DQZxmXjSkyJ02zgphDEdb0nzUOutV0q9hFhK7t1XHtuRQ/KLtvsEmTmrhNQPyGpix/T47HMSMToM2MCOljQeZA0BI8JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=glBzfBPj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="glBzfBPj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751467446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=v5kZ8LByR5tDk+2RARWaEVx7RJMhvOELDCL82WVT4Mo=;
	b=glBzfBPjwTJoMLLS8WuByre84o4A3yZ6yRbphgVibZhvMhwDRHGKlrjQd0qzruaG9GIg+B
	EdOkidyAhRdeO2KrgcTQF5eSML+DzJ1dQ7ITMumVPlB8x0ad/FXENU2r/hrDYrvb4yVgwI
	8MUCvZEKvkYevcW4F8wdmdTW4jNS+tw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-mZHA4WJ-O2WYc1xxDP2HMg-1; Wed, 02 Jul 2025 10:44:05 -0400
X-MC-Unique: mZHA4WJ-O2WYc1xxDP2HMg-1
X-Mimecast-MFC-AGG-ID: mZHA4WJ-O2WYc1xxDP2HMg_1751467444
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3af3c860ed7so1149413f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 07:44:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751467444; x=1752072244;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=v5kZ8LByR5tDk+2RARWaEVx7RJMhvOELDCL82WVT4Mo=;
        b=VY/qSeK7tkxKb03vb/GC1DJOFVwvKkV2nc7XH7m8reFOJh78QPR4KZjQId3FF9Ce58
         jn6VfVXYWxxiV1ubwJRDnPa/EM5z8FaQJPXS+ojQcgXkHq3SsgiBTwaHL1yy75yUIY+S
         4m1JHWGq6mI/EO8iC+JAFgte9pJujTPBnpFULNwDFp5B8V+aLIDipL/6CN8ZdboGqV1A
         lzLSSNmCwuVLlsV5LBOYAyCkoIYwpnG09U2B22n3XtEZEznNn7yj3JuTJjA7bMsotw66
         /jfBnVelYIln6XmMST+oQfk4GRKEnQ1CaJKnxvnNjPiT4AtqBPrw8kulLmgE92yy/j49
         xvwg==
X-Forwarded-Encrypted: i=1; AJvYcCWU6BAv0M38/1p5VEOXm7Vb2D8mbC8B2Wm4zkDWjWz/IXX4ef0jXd5wrmAf8mVIvu3aJqDaezZCm6yqRoM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYNnDXrxeAcKxpzTvQhx27MBIp5ciWZ4ZbGOKAjEdAqhPef9QE
	Tn8cKW1vQv9MG0YLZ0oFYPuy3282Ve8Z1B7EJt/3GXM33pYzoBfUdV9acTo6yHnBLKRESCFPLsb
	5Mb3sIptZ+bdBAyW62qgJgkXdi4ry8cm/JlHffG96yPc438rAf9S+uKNOMPg4DwYjlA==
X-Gm-Gg: ASbGncuRMcB0fFZD1sv/4lVgmsu8H1hmc2UVtaefBcz1bkngy+dx/r6/vG7rPMBdQNs
	HdGCuDanjvM/JOYYbes9/EkyZF7Y9IRAzAq1e2wt7a5Dm6EJl1pIkJeZCLJ7aZXaknC1dQHhile
	HnNTv4lMW13ad0OyaZNBGLVljr86DqiH8J755msEZTaazKnWRVca+lXYHWLXcsaIOZ2yHtIQVvN
	8SQf4a9jhH1j2+C3x9jggwimz5Rni1bmx4Wu4lH61KOo8kIp04cKyHPOESo5OBrD5GhU212OgR9
	eEPoUhM7gXZn8aC8/JgYBBqOkMrG0mChOQxtT42IK/uB9vVJklYbiFg=
X-Received: by 2002:adf:9b84:0:b0:3a4:f744:e00c with SMTP id ffacd0b85a97d-3b20095ce61mr1968565f8f.29.1751467443770;
        Wed, 02 Jul 2025 07:44:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFp7NbPcO7rJZWXvSnrni21vm6TsH+e1Wf8nuopye15pGumcNSxUt3JtyGqe+Gm1zDhsN9hOA==
X-Received: by 2002:adf:9b84:0:b0:3a4:f744:e00c with SMTP id ffacd0b85a97d-3b20095ce61mr1968544f8f.29.1751467443279;
        Wed, 02 Jul 2025 07:44:03 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52a26sm16417581f8f.51.2025.07.02.07.44.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 07:44:02 -0700 (PDT)
Message-ID: <693725d9-a293-414f-a706-f77446e335b1@redhat.com>
Date: Wed, 2 Jul 2025 16:44:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] mm/maps: move kmalloc() call location in
 do_procmap_query() out of RCU critical section
To: Jeongjun Park <aha310510@gmail.com>, akpm@linux-foundation.org
Cc: andrii@kernel.org, osalvador@suse.de, Liam.Howlett@Oracle.com,
 surenb@google.com, christophe.leroy@csgroup.eu,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 syzbot+6246a83e7bd9f8a3e239@syzkaller.appspotmail.com
References: <20250702135332.291866-1-aha310510@gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250702135332.291866-1-aha310510@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02.07.25 15:53, Jeongjun Park wrote:
> In do_procmap_query(), we are allocating name_buf as much as name_buf_sz
> with kmalloc().
> 
> However, due to the previous commit eff061546ca5
> ("mm/maps: execute PROCMAP_QUERY ioctl under per-vma locks"),
> the location of kmalloc() is located inside the RCU critical section.
> 
> This causes might_sleep_if() to be called inside the RCU critical section,
> so we need to move the call location of kmalloc() outside the RCU critical
> section to prevent this.
> 
> Reported-by: syzbot+6246a83e7bd9f8a3e239@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=6246a83e7bd9f8a3e239
> Fixes: eff061546ca5 ("mm/maps: execute PROCMAP_QUERY ioctl under per-vma locks")

That commit is not upstream yet (and the commit id is not stable), so it 
should be squashed into the problematic commit.

As a side note: the patch subject of this and the original patch should 
start with "fs/proc/task_mmu", not "mm/maps".

-- 
Cheers,

David / dhildenb

