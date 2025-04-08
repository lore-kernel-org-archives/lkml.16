Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA301266B4E
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 10:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744106433; cv=none; b=c3I3XHpXShZ2kCpt/0WPy+5kkdjxNh013pfHm5mWcjrQCPyhwAvTIzo9dUqmGtCnfnutuL2jmpXM1GYCjc/1s780vP69h3gYpYrnqDmIyoSJlNi/okcHhhcbYGJPShY8bJ/3t57LPJhF5avxONKd6U+w5D+9rl3bzIujlfa3HkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744106433; c=relaxed/simple;
	bh=vLDcHvaErqh5L7N3a5T+OZALLcyWXJlONDu6WfYKuko=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Q/anoITkDXDl9eqZxQHGKWEz4shGGDrDgRktZK5bpoEmo24KopmMU5h6sBfjU3JZo30FxN9eUk9uV/sYPrMtr7p+v1jHKvULeQOdfGuYElpXzoO28I1lWqJ7RagttNSLOWH9iem9oM7sKTgnu/+GYEcs+FOfzNSFLym2JIfXpBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f9wLpJAN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f9wLpJAN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744106430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wGU6be8Iks6z0gUVjQ3GgVLTq8eDFjYIyM80DG5Gz4c=;
	b=f9wLpJANpxEd/3tFa8uaFF2o/XKUgAbRdsbP48tBnHKxSqa2rqTgUZWNk/hIFstj1jFq7l
	DP5CgbcI83hMtA2w1R/3Yt20kheMX/piF8TaVygRxl+QVdU1Ht0bgzte+Hl+vJDCshSLtW
	eZDwCFA+wqHqtvTtacDSJ5uj+JVLqVw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-403-XJxfDSzjNd2gOio9ERqYDw-1; Tue, 08 Apr 2025 06:00:29 -0400
X-MC-Unique: XJxfDSzjNd2gOio9ERqYDw-1
X-Mimecast-MFC-AGG-ID: XJxfDSzjNd2gOio9ERqYDw_1744106428
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39c2da64df9so3553518f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 03:00:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744106428; x=1744711228;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wGU6be8Iks6z0gUVjQ3GgVLTq8eDFjYIyM80DG5Gz4c=;
        b=RaPF2dgBRu+aP7DyPveLBBX0uJXS1iQK6k30WRcz3fuj2Z6IQHc543k+EC/vwvykx2
         0to6AYY3+dZPQqN5RqOWCSvOqsVty/CuWhCnKfFhenKsd5NDe8cRJwsE/eCtrpueCz+7
         RvDrPEdOhUSlojWyvsN0qV+GUpKKww/Zb+7HHPmAt4L0iANWWb8SAvtDm+IT8KBmgzAj
         wRc9KSyLx1x4HvtSDQ6xdvSFl2/c6XLvR/ZvJ+ikp+bCSzlkmYfUXFsplG+rbmfhZYr7
         JgSKBsxIPPprUgFIjWdisDRuXd1u+RMxUv4FzJLt4XGMI/i7kYQd84NN4gSbQwfuMyaY
         UVOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVx+L0Ze2WTcsWOw8kx1w2A2YNbn4TbmSE+/zq7Kzuq1yTHhaPxN3rYT6GeWPoH1yJpId335zHGejNNW68=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxN3WFf5pN3e0I4TOB81POw/CAkPuynin/xa6wu1OihRcc0kK9
	2y6qATzYfgso4YY4aqMNAcrDEcniU9MvOoX2BQumBhwVDAGnz3QHYBCPfH6EggmBnBiareeY49o
	UB9CCFFfaFOB+WJ1VWdKJGFHnc4bjqng8mHH17rmHdswT/MYb6aWu2ImaKKi6sA==
X-Gm-Gg: ASbGnct3EYCV3oeHAhzQNhpIXupIx8/0V9eEXRpAf5NL0cBgsb7W457B0za39laG3bO
	fDQvqYwfU6qrffFxvs1e/+7av6PIo1qaq+0ZhoHnXeMOFm1tMxhJ8Gzk2PySqFwSXE2XxjS8+nh
	p1DAZQZ3XQL1ZGZcuvoKWZrN9jxiXxqtWxMhZQd4Iqc/lJ7VfcKKdWJwivK6dqv6eDtzW6pXMRn
	StpKGswSYPAZpfasL6ColM5FpshWdRgbiBjNcDZXzLfQRL2sUa9bTe23a7XUCKAjeCIOdURkAKF
	oZ/rwi+Iu63gF5ZFtgRNQPb12c6reBBvkcYPSVELlf2CrZcL5k4BhS4DfwsonpH4cjt/fZ5o6Kb
	kZepEicCTjuYNe/OMWtGfjiZneqXVGSDlP37rTM9F
X-Received: by 2002:a05:6000:420a:b0:391:487f:27e7 with SMTP id ffacd0b85a97d-39cba98bb36mr12802650f8f.55.1744106427777;
        Tue, 08 Apr 2025 03:00:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMLyxSrpbvzEc6BfSO+YZMc/HKz7loupC7FOQVU7niLonQu4qcqbEjcVzu/K2oUBWR45IJuw==
X-Received: by 2002:a05:6000:420a:b0:391:487f:27e7 with SMTP id ffacd0b85a97d-39cba98bb36mr12802626f8f.55.1744106427450;
        Tue, 08 Apr 2025 03:00:27 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:4f00:a44a:5ad6:765a:635? (p200300cbc7074f00a44a5ad6765a0635.dip0.t-ipconnect.de. [2003:cb:c707:4f00:a44a:5ad6:765a:635])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a6ae5sm14620018f8f.32.2025.04.08.03.00.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 03:00:27 -0700 (PDT)
Message-ID: <a29827bd-39f6-4645-a5af-fed3c92f85d5@redhat.com>
Date: Tue, 8 Apr 2025 12:00:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] mm/gup: fix wrongly calculated returned value in
 fault_in_safe_writeable()
From: David Hildenbrand <david@redhat.com>
To: Baoquan He <bhe@redhat.com>, linux-mm@kvack.org
Cc: akpm@linux-foundation.org, osalvador@suse.de, mingo@kernel.org,
 yanjun.zhu@linux.dev, linux-kernel@vger.kernel.org
References: <20250407030306.411977-1-bhe@redhat.com>
 <20250407030306.411977-2-bhe@redhat.com>
 <c8bc199d-30e1-4f0c-868c-6cbab1fbc747@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <c8bc199d-30e1-4f0c-868c-6cbab1fbc747@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08.04.25 11:52, David Hildenbrand wrote:
> On 07.04.25 05:03, Baoquan He wrote:
>> Not like fault_in_readable() or fault_in_writeable(), in
>> fault_in_safe_writeable() local variable 'start' is increased page
>> by page to loop till the whole address range is handled. However,
>> it mistakenly calcalates the size of handled range with 'uaddr - start'.
>>
>> Here fix the code bug in fault_in_safe_writeable(), and also adjusting
>> the codes in fault_in_readable() and fault_in_writeable() to use local
>> variable 'start' to loop so that codes in these three functions are
>> consistent.
>>
> 
> I probably phrased it poorly in my other reply: the confusing part (to
> me) is adjusting "start". Maybe we should have unsigned long start,end,cur;
> 
> Maybe we should really split the "fix" from the cleanups, and tag the
> fix with a Fixes:.
> 
> I was wondering if these functions could be simplified a bit. But the
> overflow handling is a bit nasty.

FWIW, maybe the following could work and clarify things. Just a thought.


diff --git a/mm/gup.c b/mm/gup.c
index 92351e2fa876b..7a3f78a209f8b 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2223,30 +2223,23 @@ EXPORT_SYMBOL(fault_in_safe_writeable);
   */
  size_t fault_in_readable(const char __user *uaddr, size_t size)
  {
-       const char __user *start = uaddr, *end;
+       const unsigned long start = (unsigned long)uaddr;
+       const unsigned long end = start + size;
+       unsigned long cur;
         volatile char c;
  
         if (unlikely(size == 0))
                 return 0;
         if (!user_read_access_begin(uaddr, size))
                 return size;
-       if (!PAGE_ALIGNED(uaddr)) {
-               unsafe_get_user(c, uaddr, out);
-               uaddr = (const char __user *)PAGE_ALIGN((unsigned long)uaddr);
-       }
-       end = (const char __user *)PAGE_ALIGN((unsigned long)start + size);
-       if (unlikely(end < start))
-               end = NULL;
-       while (uaddr != end) {
-               unsafe_get_user(c, uaddr, out);
-               uaddr += PAGE_SIZE;
-       }
-
-out:
+       /* Stop once we overflow to 0. */
+       for (cur = start; cur && cur < end; cur = PAGE_ALIGN_DOWN(cur + PAGE_SIZE))
+               unsafe_get_user(c, (const char __user *)cur, out);
         user_read_access_end();
         (void)c;
-       if (size > uaddr - start)
-               return size - (uaddr - start);
+out:
+       if (size > cur - start)
+               return size - (cur - start);
         return 0;
  }
  EXPORT_SYMBOL(fault_in_readable);


-- 
Cheers,

David / dhildenb

