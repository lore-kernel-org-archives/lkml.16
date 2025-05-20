Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DFA24888A
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747750429; cv=none; b=lx6ba9QFbAWWwYBCoL1uEH2BpeVEJ3TYWd6cmAf8bqUT1nHsnbLNCkbOIDMuEGoIcJlVxi6cUY7y+Vkzjz55ghmXZqEhXmOsPgodX/wWBXbzXYOFtfTUGAFrPs0cXZAx5Pea2oJ3iG1rB4sJpP/hephma6QDH5Lo9Bh55+spqLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747750429; c=relaxed/simple;
	bh=TT1AZtF5kSPxLUk21mj1E/C02OvllmFAok+1+iXiZBE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Rux85tZNTqw5LjMjDHY/k6jClkjiP0GluI54mu3Wuknz3pZHgXD6kpq9rGD6gFk/F+JlgLOyUTUJiDm6s9NlhnCrZvIMuKI6pmZfYyAM5Jb8FIAWgF/RvgwkJ1wa8oHfT1nTkEaoxOYHGtVMsGQlc8p40B7grpk+4QiQ1rcjKOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MSusD0MR; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MSusD0MR"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-601ed5e97e9so3741827a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 07:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747750426; x=1748355226; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TZkuLyD3cthsyejZXEn0qQoJmcAife/IsxAkyqDDAmY=;
        b=MSusD0MRdq3r6WLDp4omVP3KcDyGhrlH/mWW8X1SkpR9B7Yv12SavmQKl7jsHF+wxN
         mKWMUh0CUi+ul5z6ttfNw7SG7Qv0r5Ozv0PwnUG6948g1Y1Eo/lw6H8MLO2OaCp8ETIk
         /b6tjbwjqY0B+rrpbLh6ieEEBSzUo9pvYVVCf6vShFDWBiwW/VBZlGAmnoMEQskZcC+1
         6mJWEucUyhP6P5abC4NcQcHjsBSza113uRK05JxSGibIjjr38pNHpBqSPjGwDaXc4FxB
         rKX+2HZA+gnQ27s3fa1KHZdFUwBEMG+u2FtWPQU/XscZXYLPo5GU+JFiUm78EA5dc98s
         JueQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747750426; x=1748355226;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TZkuLyD3cthsyejZXEn0qQoJmcAife/IsxAkyqDDAmY=;
        b=h/IaR+vQTgrXNP+4jJ/fCfUhvbWisuOgtsPIMj/m3ekVlu8nYWv/EQ8DZXFXK6WGPY
         xlvWcedGnpf+QoJm9hIOqlYysQCushIP1M38YO8bZnP+4cbMVIX2PBbZNadGqMFvFZNo
         xPinC/Am1YBQCIPmUFqPGkPHoT1D1FlSBiRiWwIO/9xYcP4KGFuKn9n+ta5EkqAP6BIt
         t4L1o9r5eWnOXubRVCc1eYilBfHqKFgTmEchQEodWtRePrym4XVFOaQ0FPInEzbwB7Gg
         bOz32f/N/4zu+9VxY6vf4LvTnX1LREzHjSluz39fi6g7lnms6dJx+jTe89NkZEkJthEf
         I7Aw==
X-Forwarded-Encrypted: i=1; AJvYcCXmNlSUjIt1hf5XvObv54cXYDO2G90XkZti5ChPBwKROEt91g3xxsxTE/9FeDAwQOn2bdC/4A+BEP832/o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLwBUUJ1m8U74SK6GmX7U38WL/MALqCWavq2ymngQsCEawcU25
	6/UJ6TJNdImr115Xq0/1Im905LuUZdY1RPAdDRiar4rfyubh0w8cs863
X-Gm-Gg: ASbGnctyPHHuBZudqTHg1LPOW8CqI0LQ4KmF+k8FVRyJ6nHwgluODctPfHV6e8SltBd
	lSMNzQv6EjOeVHWMP/4lk29Dd68zZc1k+UNTm10kYHsgLgsUCtwSIEnHyAzXL4WYl9uoA4Kh5kj
	gtgOzQdjZBQuO47goVREL3GtZd9YZae7IIxs8ZwR54SGFvSyH8//3EJAyGB4Uh/idyq+4IxeMzz
	9Y0bNAczpEi3iZBt03EQ2Un5ieK/m9I2Xy7BXJGtks08TIE0PwxSxFDnUx4L0ibOErhXNS56MgN
	25GHPGyu0mNYxswAJyjZGr2lvaWw/6B48ZIU1OiQzjASB6apYr22I9byUNOnpIAWTpreOFt53DZ
	mMga13vRK7X+NWfMlf7W9vFFItDxy5ccuk1k=
X-Google-Smtp-Source: AGHT+IHnYXbJigGThFNW+kd13vuitlBYOQxamY32LLJCB1Iqm/r92Npp9UtzN988M6n2wn+dBtBQIA==
X-Received: by 2002:a05:6402:13d6:b0:601:f3f1:f10e with SMTP id 4fb4d7f45d1cf-601f3f1f375mr6038258a12.5.1747750425955;
        Tue, 20 May 2025 07:13:45 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1126:4:1c0a:f3ac:4087:51c8? ([2620:10d:c092:500::7:66a9])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6004d4f5fe5sm7232206a12.7.2025.05.20.07.13.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 07:13:45 -0700 (PDT)
Message-ID: <b696e3c2-3d96-4729-9e07-87bb644f145b@gmail.com>
Date: Tue, 20 May 2025 15:13:44 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mm: slub: allocate slab object extensions
 non-contiguously
From: Usama Arif <usamaarif642@gmail.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, surenb@google.com,
 hannes@cmpxchg.org, shakeel.butt@linux.dev, vlad.wing@gmail.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <20250520122547.1317050-1-usamaarif642@gmail.com>
 <3divtzm4iapcxwbzxlmfmg3gus75n3rqh43vkjnog456jm2k34@f3rpzvcfk3p6>
 <6d015d91-e74c-48b3-8bc3-480980a74f9b@gmail.com>
Content-Language: en-US
In-Reply-To: <6d015d91-e74c-48b3-8bc3-480980a74f9b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 20/05/2025 14:46, Usama Arif wrote:
> 
> 
> On 20/05/2025 14:44, Kent Overstreet wrote:
>> On Tue, May 20, 2025 at 01:25:46PM +0100, Usama Arif wrote:
>>> When memory allocation profiling is running on memory bound services,
>>> allocations greater than order 0 for slab object extensions can fail,
>>> for e.g. zs_handle zswap slab which will be 512 objsperslab x 16 bytes
>>> per slabobj_ext (order 1 allocation). Use kvcalloc to improve chances
>>> of the allocation being successful.
>>>
>>> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
>>> Reported-by: Vlad Poenaru <vlad.wing@gmail.com>
>>> Closes: https://lore.kernel.org/all/17fab2d6-5a74-4573-bcc3-b75951508f0a@gmail.com/
>>> ---
>>>  mm/slub.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/mm/slub.c b/mm/slub.c
>>> index dc9e729e1d26..bf43c403ead2 100644
>>> --- a/mm/slub.c
>>> +++ b/mm/slub.c
>>> @@ -1989,7 +1989,7 @@ int alloc_slab_obj_exts(struct slab *slab, struct kmem_cache *s,
>>>  	gfp &= ~OBJCGS_CLEAR_MASK;
>>>  	/* Prevent recursive extension vector allocation */
>>>  	gfp |= __GFP_NO_OBJ_EXT;
>>> -	vec = kcalloc_node(objects, sizeof(struct slabobj_ext), gfp,
>>> +	vec = kvcalloc_node(objects, sizeof(struct slabobj_ext), gfp,
>>>  			   slab_nid(slab));
>>
>> And what's the latency going to be on a vmalloc() allocation when we're
>> low on memory?
> 
> Would it not be better to get the allocation slighly slower than to not get
> it at all?

Also a majority of them are less than 1 page. kvmalloc of less than 1 page
falls back to kmalloc. So vmalloc will only be on those greater than 1 page
size, which are in the minority (for e.g. zs_handle, request_sock_subflow_v6,
request_sock_subflow_v4...).
