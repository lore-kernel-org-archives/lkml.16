Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E311411CA9
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 02:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751510664; cv=none; b=Y4Qo6SKylsrWYfKKvcu4cfiS/RzHP4q3zc8uxkiMfXN2uZWvOF2cj6jgJ6HlsV1N/DSkujRFSHZmXGxgvhVzCaYHNZpYgufjrkucZ/g1dOGumSFnm/qjoie6uwpcqtJVjMM8SDZzWN18WfMCdVpbu+O0EYTxmSBmff9ZxQ0xUa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751510664; c=relaxed/simple;
	bh=H/SNnKM3e+12bkhHgrmgliRIJAPxdl46tPDAG++ymKQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZR9fhYnazdvOuW0lv9gPOSq8G9nkZ/y9ZiyAa7FN01u5bEt0oPIJkXDjDi6/gp+FPhCJcOBhc9zUFian6MvYb1JAbPkGCgbUiCkTC2I+bTUtB+SPphNJqTWbDWKQlhzzx/on/8JQw6Pqj6hfRonMSOA+khYm2Agos7x/ECLtpXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mvSVBkGy; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mvSVBkGy"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7490702fc7cso5328691b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 19:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751510662; x=1752115462; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MvJyRoQEN6Ftk0YCKQRhf1ab+R7+Q09BKNu92aBVMR8=;
        b=mvSVBkGyB00rIXQQvsh72ulvTKc3LObWZMF+VdGd7orT5X1ocpW2VLDQ1cOMPS8bJX
         zSlQdngdqjZ1B/wQ/sWjPzQFKuqWRM+D0kbpY4ZI3ZCks1eLOhdRu0miZ3wZh5HNzdK1
         88SeL1CjpyiqYjOt+4rW8ipqIiyU8JbNjC4cAcTHgZB4zb1TiXHFHmHC40pBVkWYUciH
         ffqOE6xMVqV8mB+BWjV3DAHZu6bkRxkve0UXu9QHJuKraCqwuf2ohZuiTQAyXUx6+/fK
         1r6AoOg23Xp4Wu1Fs6HmHEx0XBKNQbvYnHuMNcPgn5RofPk5GrIyarnUefJxvXqaCGs2
         R8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751510662; x=1752115462;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MvJyRoQEN6Ftk0YCKQRhf1ab+R7+Q09BKNu92aBVMR8=;
        b=nPeWCRJDDuFp3162k0KqvU1fgecYMKNkAxZoXYN1ydp5DmaULJN93PIzd7bB9c9M02
         vcUJa54KzRam/0ZpJfhgSMTJrsa3ALFpsReX/ttU1EkWTVFMfdpmCNplu+cBgOArl07Q
         4EL6NjufKNsibYtON9DIU3tiATau9Uu90vYWZr+Y35Da/A+shMAiPYRnjjpfGbg24S/t
         EVu6X71kcpRfR+qCMTkuktWqDgRbfRi1skMDOpvecolPz7N+hZmoRuBfyDuR+2J03ZDE
         jlCpoW9Icd2UjwM1hi2nV3x1mACZPNMsGdhTLDqPeC5vmLnpo/bgcV1//4eFmZ14cfjT
         Crog==
X-Forwarded-Encrypted: i=1; AJvYcCWD7b9VqIAxKZqSDFWoJpbrzWp0+JuT+tW1Gs3OtcFrcuSh4CuAHJOlvT8tBxw659Ihf7d74ipO/2SRDD8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFvMJtWuUs5a59xxm4Px+87iMeV5EA1Gkm3kArNGjgHvidWeYv
	7aRg8jE/yqIB0szj0HrEFRoY+7vaM9zWKpBvDgSRh0p3RB0KR5M+Ga7O
X-Gm-Gg: ASbGncsG8xwAxEGFpjxC0bsaJZwaHYoKWzNCvuqoHuQ1Uxi4XJIppPLnxEkpMMfM7m+
	IHLqTFnrYgEvDFrIgZ/3cSyrxtknqEx/KxHoZpN9x89o/J73vbWO7dyGe1iY4jyKsnLu7FwmrBV
	IikOhvSvsnJ3ubtvPjc90mao9CK1tEt3fSCUmDtrLabbBXjBlbcNJs/9uO9tDr3HjQzWOTW1kYk
	bu76+/CxLYEifdQExP9z2ndLCOS4wMW/2u9wzgiHJJkPZuJ5ct2Z6dVfr5rGTk0NA7w1VRNgivh
	C0w/zR0R+61/DWnE31S6so7+YlSWL/Du/vmr9tdtMyJoxHr7LyqEzD6W2NoYHu+LnuVPhsTIBeb
	RSLacXuU=
X-Google-Smtp-Source: AGHT+IFAcHjCAzuSHfjfMenx11NpIMUngIbtzf7Gscr7OriDsIk8QJUe1x5yNHBF++2MKAybKM5K9Q==
X-Received: by 2002:a05:6a21:490:b0:215:de5f:febc with SMTP id adf61e73a8af0-2243e5b2ef2mr1862892637.27.1751510662077;
        Wed, 02 Jul 2025 19:44:22 -0700 (PDT)
Received: from [10.125.192.71] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af56cd84csm16154263b3a.132.2025.07.02.19.44.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 19:44:21 -0700 (PDT)
Message-ID: <7f747869-dc37-64f3-127a-0b61a9d069dc@gmail.com>
Date: Thu, 3 Jul 2025 10:44:13 +0800
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
 <f50f8ddd-2ce8-47dc-657e-7b0edf80a508@gmail.com>
 <CAJj2-QGgHSdzq5DqSi5M+XGeKWRD8aeH_C-OptyCDeV9CEHkBA@mail.gmail.com>
From: Hao Jia <jiahao.kernel@gmail.com>
In-Reply-To: <CAJj2-QGgHSdzq5DqSi5M+XGeKWRD8aeH_C-OptyCDeV9CEHkBA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/7/3 03:22, Yuanchu Xie wrote:
> On Tue, Jul 1, 2025 at 10:45 PM Hao Jia <jiahao.kernel@gmail.com> wrote:
>>
>> Perhaps another way to explain it is clearer.
>>
>> It is known that min_seq[type] has not increased, that is, min_seq[type]
>> is equal to lrugen->min_seq[type], then the following:
>>
>> case 1: min_seq[type] has not been reassigned and changed before
>> judgment min_seq[type] <= lrugen->min_seq[type].
>>
>> Then the subsequent min_seq[type] <= lrugen->min_seq[type] judgment will
>> always be true.
>>
>>
>> case 2: min_seq[type] is reassigned to seq, before judgment
>> min_seq[type] <= lrugen->min_seq[type].
>>
>> Then at least the condition of min_seq[type] > seq must be met before
>> min_seq[type] will be reassigned to seq.
>> That is to say, before the reassignment, lrugen->min_seq[type] > seq is
>> met, and then min_seq[type] = seq.
>>
>> Then the following min_seq[type]（seq） <= lrugen->min_seq[type] judgment
>> is always true.
> 
> This sounds good to me. Can you change the code to use one bool to
> detect any increments in `min_seq[type]`? You don't need `int
> seq_inc_flags[ANON_AND_FILE] = {0};`
> 
> Also update the commit message with what you have here. IMO much more clear.
> 

Thanks for your review, I have done it in patch v2.

Link to v2:
https://lore.kernel.org/all/20250703023946.65315-1-jiahao.kernel@gmail.com/

Thanks,
Hao
