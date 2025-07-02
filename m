Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060E91F4C92
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 05:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751435104; cv=none; b=ZiZBurWmR0NITz3C1BQGIbVCFcwohCU38Sd34zfjyz3H7S2xy67BGJnvtWmf66uWJybqWM19XwGu8MiQOVJ6FeJ4SCTEBa44PXf8kBglgxmhlJ8qLLWgJe+alRcTfEtVE0Wtp07oLPjq0Y1wONHfHryW4gQBnZ0POUUq7cfLSOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751435104; c=relaxed/simple;
	bh=t63fAI1/81DIybN7e6TTOznmOPIfaDNfjmwp4FSi+ok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TC6ggZYGhR+eeEG7zAB9IP/lM+ZmazZUQm31MIO6kPqtlh2WCbvug2Mpi3jGjmwzuKhTDqisvZ2hazgQbuCivof/2EiAwS3YT+ivEoruLEE6Oeg4SirpaTBRQYBaPS6DwpMUJKR+ZL/kWJHjzaHdMsd4LTFMQ5oONheAsaIOOjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=En92f/hQ; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="En92f/hQ"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-23694cec0feso63919645ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 22:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751435102; x=1752039902; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PRMbU9uRH/MlRGEh01copkBiW5W/F/fCF6AC2yx8CfY=;
        b=En92f/hQfbLTm/+KAxJdzSc9hoMSRXaob/oQuTMvogRAAw/X/AgR0etkfSrcut2PDa
         z2vU7NgFEfxsAQDUXrXQBn+QL2NAH6GikRcnrpRkmgHrAX2JxGsSIvm+ZICTpnDIU0rT
         PK3JABpfPidj0R/jVuHawswNYPHR5VLf/oghpqnvPxOgphqH2UEMlLFyhwVc5Te86ZYj
         XVJdDaczOmGf0yhNO+MzExnIUPVPfHoSlgMOHCvS+KMJNClq8C6ab7wufduRN8pkTmmW
         amhy4Z41NCY+9/6z6QraLk7/1Hp75QOKZzVtExvRzaCPpHblEJcOa5XahYQ60vY4MEi/
         rwow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751435102; x=1752039902;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PRMbU9uRH/MlRGEh01copkBiW5W/F/fCF6AC2yx8CfY=;
        b=k6gGoDOBVt6JSzkcnDD4Ae6uYzZr2SDq9iZGMeUk6iCYspcOVzHKumhPelQghhZz6Y
         ixMW70KZ9vILxLsNv0VznMMhVcu6wsMlVIoy9QGHWg2MJNW2akrZkZY9yKMM4eh/IbKL
         Wqj3vgrvLl9hx8I//Tp+cf8k4ZifWT23yMyVsEYgF9ushn/17rwerpRHHrsM91mWLj27
         aFTpj71DO+JuZCS7e8k0KozB3F4RkDFBJArxwVfD3C2JW114QMYiBCib31EzMRwM7jfc
         611ssYK21oVziNVLb6siUJcXCLcDyTRO05L/SLHmoFsooH2P/dGXhF9XOzoxsLNbUPzt
         d/AA==
X-Forwarded-Encrypted: i=1; AJvYcCV7bb/PxhWecAr/WOtBE70THs8aciFzaPvkSZp8dUWN/vM2gDR2Ur5Vb+xo1ZwapVWD6AvUFYRoj44SryY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yww0BY4NmlBkjPEY55HZgC1ZWsdyWFHkGZIqUA58xIvb1UxDN5o
	IxJPxqHq4Uj3UG2VdFIzfPrWjrC2lHcLdos48opktvoB7Fl9sShNkLOa
X-Gm-Gg: ASbGnct/HQLhhDonaygEWOFGId43+mmvXicl2RFT6W+HlC3CEjq5Gm8xlTDKY9vgJwt
	N/X6HTQz2iQoHZmxuVrgqMK+ESCO1Lm4RW4udjbA9u+grAmstHNt/P6muO9BfVKtTXqGBRrph3B
	8NeCOWqLoIv/D2gGZsipX9wzWBL7YrQI9HerR1gqz+45CIN+XK+PwkElH8Z8kUT3M7vUYWgYoVp
	GEtrOVlFt1ZvZwlAXIg3lV2nbCvc8ka5QlQL7HFyIBJqWOFv2qQDoGK00I0yUbBuEPMLQdWEVso
	6bvGdJE0EOMrpjM/mR1kjlijqv2HuoS5FxEImh8NX3j1OdP0/W+CbWXre6B5gvtg/czA8KlQmMF
	/HeRw0p0=
X-Google-Smtp-Source: AGHT+IFZbI96xEmH/fJb+myVStTu0IbvTbuOCU5QFx6uBVkcjhdA9TM195ZXmmt0s4evkP6zg7cSvg==
X-Received: by 2002:a17:903:244f:b0:235:2e0:ab8 with SMTP id d9443c01a7336-23c6e4d681amr23335905ad.6.1751435102130;
        Tue, 01 Jul 2025 22:45:02 -0700 (PDT)
Received: from [10.125.192.71] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39f4c0sm119063595ad.103.2025.07.01.22.44.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 22:45:01 -0700 (PDT)
Message-ID: <f50f8ddd-2ce8-47dc-657e-7b0edf80a508@gmail.com>
Date: Wed, 2 Jul 2025 13:44:54 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH] mm/mglru: Stop try_to_inc_min_seq() if the oldest
 generation LRU lists are not empty
To: Yuanchu Xie <yuanchu@google.com>
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, yuzhao@google.com,
 kinseyho@google.com, david@redhat.com, mhocko@kernel.org,
 zhengqi.arch@bytedance.com, shakeel.butt@linux.dev,
 lorenzo.stoakes@oracle.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>
References: <20250630080603.36171-1-jiahao.kernel@gmail.com>
 <CAJj2-QGHLRqY4mPyAPg2eT+y+4yNfNb__nON5ndkY8WG0UmKVQ@mail.gmail.com>
From: Hao Jia <jiahao.kernel@gmail.com>
In-Reply-To: <CAJj2-QGHLRqY4mPyAPg2eT+y+4yNfNb__nON5ndkY8WG0UmKVQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/7/2 08:31, Yuanchu Xie wrote:
> On Mon, Jun 30, 2025 at 1:06 AM Hao Jia <jiahao.kernel@gmail.com> wrote:
>>
>> From: Hao Jia <jiahao1@lixiang.com>
>>
>> In try_to_inc_min_seq(), if the oldest generation of LRU lists
>> (anonymous and file) are not empty. Then we should return directly
>> to avoid unnecessary subsequent overhead.
>>
>> Corollary: If the lrugen->folios[gen][type][zone] lists of both
>> anonymous and file are not empty, try_to_inc_min_seq() will fail.
>>
>> Proof: Taking LRU_GEN_ANON as an example, consider the following two cases:
>>
>> Case 1: min_seq[LRU_GEN_ANON] <= seq (seq is lrugen->max_seq - MIN_NR_GENS)
>>
>> Since min_seq[LRU_GEN_ANON] has not increased,
>> so min_seq[LRU_GEN_ANON] is still equal to lrugen->min_seq[LRU_GEN_ANON].
>> Therefore, in the following judgment:
>> min_seq[LRU_GEN_ANON] <= lrugen->min_seq[LRU_GEN_ANON] is always true.
>> So, we will not increase the seq of the oldest generation of anonymous,
>> and try_to_inc_min_seq() will return false.
>>
>> case 2: min_seq[LRU_GEN_ANON] > seq (seq is lrugen->max_seq - MIN_NR_GENS)
>>
>> If min_seq[LRU_GEN_ANON] > seq, that is, lrugen->min_seq[LRU_GEN_ANON] > seq
> This part doesn't make sense to me.
> The code is as follows:
> 
>      /* find the oldest populated generation */
>      for_each_evictable_type(type, swappiness) {
>          while (min_seq[type] + MIN_NR_GENS <= lrugen->max_seq) {
>              gen = lru_gen_from_seq(min_seq[type]);
> 
>              for (zone = 0; zone < MAX_NR_ZONES; zone++) {
>                  if (!list_empty(&lrugen->folios[gen][type][zone]))
>                      goto next;
>              }
> 
>              min_seq[type]++;
>          }
> 
> Here, it could be that , min_seq[type] > lrugen->max_seq - MIN_NR_GENS
> (what you refer to as seq)
> However, this is a result of incrementing a copy of
> lrugen->min_seq[type] as this piece of code finds the oldest populated
> generation.
> 
> next:
>          ;
>      }
> 
>> Then min_seq[LRU_GEN_ANON] is assigned seq.
> This is not necessarily true, because swappiness can be 0, and the
> assignments happen to prevent one LRU type from going more than 1 gen
> past the other.
> so if `min_seq[LRU_GEN_ANON] > seq && min_seq[LRU_GEN_FILE] == seq` is
> true, then min_seq[LRU_GEN_ANON] is not assigned seq.
> 
> 
>> Therefore, in the following judgment:
>> min_seq[LRU_GEN_ANON] (seq) <= lrugen->min_seq[LRU_GEN_ANON] is always true.
>> So, we will not update the oldest generation seq of anonymous,
>> and try_to_inc_min_seq() will return false.
>>
>> It is similar for LRU_GEN_FILE. Therefore, in try_to_inc_min_seq(),
>> if the oldest generation LRU lists (anonymous and file) are not empty,
>> in other words, min_seq[type] has not increased.
>> we can directly return false to avoid unnecessary checking overhead later.
> Yeah I don't think this proof holds. If you think it does please
> elaborate more and make your assumptions more clear.
> 

Perhaps another way to explain it is clearer.

It is known that min_seq[type] has not increased, that is, min_seq[type] 
is equal to lrugen->min_seq[type], then the following:

case 1: min_seq[type] has not been reassigned and changed before 
judgment min_seq[type] <= lrugen->min_seq[type].

Then the subsequent min_seq[type] <= lrugen->min_seq[type] judgment will 
always be true.


case 2: min_seq[type] is reassigned to seq, before judgment 
min_seq[type] <= lrugen->min_seq[type].

Then at least the condition of min_seq[type] > seq must be met before 
min_seq[type] will be reassigned to seq.
That is to say, before the reassignment, lrugen->min_seq[type] > seq is 
met, and then min_seq[type] = seq.

Then the following min_seq[type]（seq） <= lrugen->min_seq[type] judgment 
is always true.


Thanks,
Hao
