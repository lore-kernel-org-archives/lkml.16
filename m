Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22562770B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 02:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751422780; cv=none; b=cFuUxuoSPxB037GWmTcjgqP4AB5bAVKDK3Cu99X47tbESJzSLzPhCUPkfujW/AF5mlw3X77Zq8P8gEuZMjrunqpoDFnvaKBjaHA2MYr9FWfcwpqjO5HZ3aL85Tn5r+D9+/3tBEHnWvZIzRatqHmo8/l5nyuGwyQKKchX7jFd2IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751422780; c=relaxed/simple;
	bh=kzOdQP2YKU1I7E8omPn76zdMhCOX87rR7bLP/1203mQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TRo2Cx39nK44foijcyjrTkgpeH93Kj53xdyfGXsD1YVPb5Ma3lr265CZEr7MxMG3D1Zs+gPNTJo01e0S+XLcXpJpkOfYc7QOBTZdZ9QFMDaQlUpEOrS19q3DLdFjXIRILwy3MhlH6wRUeZHJuE04331+DJqzAtX+K792Gwnk0Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iQCm+19E; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iQCm+19E"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-23508d30142so48402065ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 19:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751422778; x=1752027578; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pUDwcQQaJ+Nt3QTglNYXtKd690XxoTBtPIqXRJoWd+4=;
        b=iQCm+19EV8w/CUmIs0S3/lW7bsHXroOoaaFYU7Q8L0DaIDQpUuUp/Xfqec9VBlTimh
         EheOu33+fNloHrJQUOMUqOV5oW9mflJ4nlzFsWZ8NQyjTSfUVw7dCWPrS1wVWjxB2KO2
         lTPSssJLN5dMxFuwzvIPe63Jo5AibnKRA+yshtLobushVmV7gcLJMV6FqDjVpN+yFDzF
         uKW/u8F5/Vtjjo9RYyLygsFKJOSTochD8ptiwpMBRii50TIXgFYAT5Sxcs1ub3Wbu8zk
         SurOiGVLKRvWWYT7FPpBLexXAe3EvPfHEUPNrrbC/AwHpv+UbahOlVnzBxg9pd8lLAfQ
         breQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751422778; x=1752027578;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pUDwcQQaJ+Nt3QTglNYXtKd690XxoTBtPIqXRJoWd+4=;
        b=u6MvTgOME8/N6dXyLjoAXDgFC/eu+g6p5TTj9o4bbWg6kG8C210ZN9rpCOeghGlc/G
         x+bD4WPx/Sev3okTIP+SnvIizutgPnItVYy+wUmVWEcE7kmz5l5LYNH/fQ0EOya3YVpr
         fWGN9Yr2vvuhnxsASYpJbOQk24pyXBBE+0fVbSCCSrpc0Tjy2YOEtJoGqetmj1JkeL7z
         MM86C6H1nm/nm5+PmfDMa+7ViAgbQ3CAhoECX9iWv6frKMd4ZDTQYOjoQy61oYj+sIkp
         jJ618UHuk2kktWAXBT66aVy/f361w1zXcTYF3DHR7g4XcqKjEFH3SO+EH8IBpexzJK07
         B24w==
X-Forwarded-Encrypted: i=1; AJvYcCXMlLZYJ9SWiwq/r2pPXaV8HhwmYq6zV0jt3bWbB8I+TxoRCoV5h72XhvgGE/UJ+BKl4b/piddgfOIDte8=@vger.kernel.org
X-Gm-Message-State: AOJu0YygNQXVRp6zarVUE9d573WP+fIJqYkRmMrDOgev2qJLxUuy6Ulw
	KEpOqu6ntLSFFuZZZGXBTACy9JwAO+1d6r/CBPZQUQTdvaBn4nMeFqHw
X-Gm-Gg: ASbGncvGBiWLQ4BzEy0b+vCzLqelsyB8GCzZjm1lqPBh1YcULm+6QH9dy3exhqRwSlx
	N4ctisWRl2Ykeg2KKOiPVATDCd4cKggxBATnEOEY7Z7HN1ZzrPX0+0VR9cXP/8/GvEw8O5VXgtF
	mX2NvQEdMBwv02CsmOyHEwWtJOQkfP/6I9+jQQtmWSBtLnLJfG3x2nvyaUp8NdchPR0fUv8ZlTa
	sSCc6QbLZ62xb5Pm1mWFFNHASoQvhi8+EEz3uCvXYpOmMrE5k7o+ObsVADAyWD86ZBmOCAUGLZH
	+pYi7ve2ngehWsrF6ElKQqZD4BBrEOOsa9wqY2jntCIN6D5+OPthZ1nVGEPYrR3zGpt/2oQcdoP
	dH2TkAgn/aZ7YDPlfIA==
X-Google-Smtp-Source: AGHT+IEZ/UhovT4QDpnoTFw5/an2zyQLPRdHxdVepISIlWWFTzDsZdPY/0xdPIFbvzkIA5Sj2ryb9w==
X-Received: by 2002:a17:903:1b2d:b0:234:f200:51a1 with SMTP id d9443c01a7336-23c6e48ce1emr17076415ad.9.1751422778072;
        Tue, 01 Jul 2025 19:19:38 -0700 (PDT)
Received: from [10.125.192.71] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39bac3sm114889435ad.133.2025.07.01.19.19.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 19:19:37 -0700 (PDT)
Message-ID: <0b316beb-0c49-444f-983c-e8a8a3e76dfc@gmail.com>
Date: Wed, 2 Jul 2025 10:19:30 +0800
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

Sorry, I got my email wrong. I'll reply again to make sure the kernel 
mail lists can receive it.

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

Hi, Yuanchu

Sorry for the confusion.

I am assuming that if the oldest generation LRU lists (anonymous and
file) are not empty, in other words, *min_seq[type]* has not increased.

The above part has been executed, and it is known that min_seq[type] has
not increased（that is, min_seq[type]=lrugen->min_seq[type] at this
time）, so the rest of the reasoning.

Maybe you mean that under the above premise min_seq[type] is impossible
to be greater than seq (seq is lrugen->max_seq - MIN_NR_GENS)?
If so, case2 does not need to be discussed and reasoned.

In either case, my patch will work well.

Thanks,
Hao

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

Yes, if min_seq[LRU_GEN_ANON] is not assigned seq, then the situation is
the same as case 1. min_seq[LRU_GEN_ANON] is equal to
lrugen->min_seq[LRU_GEN_ANON].
in the following judgment:
min_seq[LRU_GEN_ANON] <= lrugen->min_seq[LRU_GEN_ANON] is always true.


Case 2 wants to discuss another situation, that is, when
min_seq[LRU_GEN_ANON] is assigned to seq. The following judgment is
whether min_seq[LRU_GEN_ANON] <= lrugen->min_seq[LRU_GEN_ANON] is always
true.


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
>>
>> Signed-off-by: Hao Jia <jiahao1@lixiang.com>
>> ---
>>   mm/vmscan.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/mm/vmscan.c b/mm/vmscan.c
>> index f8dfd2864bbf..3ba63d87563f 100644
>> --- a/mm/vmscan.c
>> +++ b/mm/vmscan.c
>> @@ -3928,6 +3928,7 @@ static bool try_to_inc_min_seq(struct lruvec *lruvec, int swappiness)
>>          int gen, type, zone;
>>          bool success = false;
>>          struct lru_gen_folio *lrugen = &lruvec->lrugen;
>> +       int seq_inc_flags[ANON_AND_FILE] = {0};
>>          DEFINE_MIN_SEQ(lruvec);
>>
>>          VM_WARN_ON_ONCE(!seq_is_valid(lruvec));
>> @@ -3943,11 +3944,20 @@ static bool try_to_inc_min_seq(struct lruvec *lruvec, int swappiness)
>>                          }
>>
>>                          min_seq[type]++;
>> +                       seq_inc_flags[type] = 1;
>>                  }
>>   next:
>>                  ;
>>          }
>>
>> +       /*
>> +        * If the oldest generation of LRU lists (anonymous and file)
>> +        * are not empty, we can directly return false to avoid unnecessary
>> +        * checking overhead later.
>> +        */
>> +       if (!seq_inc_flags[LRU_GEN_ANON] && !seq_inc_flags[LRU_GEN_FILE])
>> +               return success;
>> +
>>          /* see the comment on lru_gen_folio */
>>          if (swappiness && swappiness <= MAX_SWAPPINESS) {
>>                  unsigned long seq = lrugen->max_seq - MIN_NR_GENS;
>> --
>> 2.34.1
>>
>>
> I don't understand what problem this patch tries to solve.
> 
> Yuanchu

My pathch is that if we already know that min_seq[type] (including
anonymous and file) has not increased, we can directly let
try_to_inc_min_seq() return failure to reduce unnecessary checking
overhead later. After my above reasoning, this does not change the
original behavior of try_to_inc_min_seq().

I added some code to count the number of try_to_inc_min_seq() calls and
the number of times the situation mentioned in my patch is hit.

Run the test in tools/testing/selftests/cgroup/test_memcontrol on my
machine.

hit_cnt: 1215 total_cnt: 1702
The hit rate is about 71%

Thanks,
Hao

