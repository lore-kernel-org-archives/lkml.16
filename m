Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3C935964
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 03:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738381468; cv=none; b=b8HYXkXip47bK2w2t2EUG3KwSUQUeaQVhows8r+gWZIYgZGWQ3rnLc4t+S+WyzqUK8hhx38ubnqBxJXX7ENk6xpitGlmfATdpLNBM6qyKsbHEluQKhlIMmpxuW3lBwVYxgxsn/W41vxDrcnQoWOqG+rxRBnCdSiHelHDUEsitks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738381468; c=relaxed/simple;
	bh=489EgtygphSK+5pAOF3TnGSqZPJRiSAWloWADIndL6A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qvCzYctLG9J/JfRhE7KqthRd4pb4Mg9T9g/ssjFaxErgepd1ydGB7S77bKnjaKCu0qwTWs4VDaqakBFVOhJ/evU5F+OHe9D3op3eQ8+i3f5RtsCr5dbYcehxG201RK7/+aPeq9B9eXEtgTM0wRxYk84uKdUoHCwXhg6V9RCE3XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=c7Q6CaRv; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="c7Q6CaRv"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2f13acbe29bso5874655a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 19:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1738381466; x=1738986266; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TL87tl9Ktq5iad9pHG8gRYfBIGpmORGkhCntfOlwcrQ=;
        b=c7Q6CaRvKKFOsxPE/ng6pZG9sGks7n9bWBcpBxTxbhKezSmMHJDUXwC9Jyi3nZ7Z5H
         QfFCGC2yezFkhhXlyjM81wz4vcuPXWGPeEUnOlcJK+8n7SrJ8M2LFwJjKLNSY3lg5qHQ
         vq5wzzHFcnEiqv/QHgOManqUBy9WN5Z6hZQkLIfkEoH/T3DNTcVb+djexJUrZ6naUvbb
         JjK0LjKXRJN3TfvCdp/k1Sx3tqzVpMPJRiumbJfrE6pjH7MZa2Cu2BDRfVjqyId4v17a
         vmGEVI9Wrngh4+KaTvagL+MJYTqNoe9XgWveoXmXOvKAo3+5M+sS+l6Mj5ZwrtOhJg4Y
         Cr9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738381466; x=1738986266;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TL87tl9Ktq5iad9pHG8gRYfBIGpmORGkhCntfOlwcrQ=;
        b=eHKr9QIogNsOISeS5VRSEiqo48JGfewXDO/hWlJjBo7b+P04v61EUV3/UYSEE+Uh79
         R+lAxigs3CpyesXPqBqFDTsiXRRyZTGBbPWeQaSLdo+5g1NvQ47X3GxHendeA0lrb4KT
         k4pXtRyracFCh7jUCds80RhWBxhwSEhUOLjCJBsjHkwzxGYjtsTLOoFY6Cwmbg+C3uB8
         v0R0PSMROMN1F2o4jbg6bLnLT3IkIso5taNajDs4/ag4sQnwO2sgU6DtftP5TwNRyW/B
         bief85U6vF4kmAggKAINc0Z00KVcxpweEZz2ZuKKEppcuHF6SgW0rjmVOl7B+e8HN5c1
         3R0w==
X-Forwarded-Encrypted: i=1; AJvYcCXIZexyzoF9qC9N+ipc3/LvTnSc+I/gLulc7JrUYItQrF/XExKEAGyy/Yaxt23Pcf/zxrqh0l4dc/3HFbU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKcqhdAwBm9HkrmGNa2F37CzcNLESIeyUHkG7JbzgUiTYyGZ6w
	JVKrA+a4KT9i8XduJ50XtF4Zrw6U+S+FIo/p2KZ5y9IOOYbAFAhz6M7MGjMYpQ0=
X-Gm-Gg: ASbGncvrBDhRxXzKVzUNXkqV2C5NYJHcnBvRTBHA0YM6DXN73J7ghikdfwrxC19vE9V
	ybFQ1ovybnkwLx6nCgKkRZc80fzJxFxqxSWUA3yAd1RYUkpmTCbkn5YmEU//0b2YjNwQsrwrj8D
	HIZWv8/Audpir/24b6MUrfToimeL7WU1OSGskoxkpLrwhHQf00rjtstqO6NbgUDYR5jgTxAj5D0
	932umQGY8OHtigCteCunjlstigQuX33BdcpM7WANM8ZG42l2VGeAqzjyNaVuClNCFHzWfoGFO11
	pXzxzsjNYLC7ZCZAlj+8+QHvsBnT/R8q4ImXiJBFiahJ
X-Google-Smtp-Source: AGHT+IHf7UlHIDhYDRQoWb0Te0O6ez5rs+fpgrZT5hkMFr641UgEYkvwEuyu68OTwt0SWQfe0y2ScA==
X-Received: by 2002:a05:6a00:628c:b0:72f:9f76:9018 with SMTP id d2e1a72fcca58-72ff2c61fbbmr8564045b3a.12.1738381465641;
        Fri, 31 Jan 2025 19:44:25 -0800 (PST)
Received: from [10.4.39.193] ([139.177.225.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69bba15sm4151090b3a.101.2025.01.31.19.44.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 19:44:25 -0800 (PST)
Message-ID: <cfe666d6-931e-4a73-b132-1b8e1ee96f1f@bytedance.com>
Date: Sat, 1 Feb 2025 11:44:14 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linus:master] [x86] 4817f70c25: stress-ng.mmapaddr.ops_per_sec
 63.0% regression
Content-Language: en-US
To: Rik van Riel <riel@surriel.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Peter Zijlstra <peterz@infradead.org>,
 David Hildenbrand <david@redhat.com>,
 kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
 lkp@intel.com, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 David Rientjes <rientjes@google.com>, Hugh Dickins <hughd@google.com>,
 Jann Horn <jannh@google.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Mel Gorman <mgorman@suse.de>, Muchun Song <muchun.song@linux.dev>,
 Peter Xu <peterx@redhat.com>, Will Deacon <will@kernel.org>,
 Zach O'Keefe <zokeefe@google.com>, Dan Carpenter <dan.carpenter@linaro.org>,
 Frederic Weisbecker <frederic@kernel.org>,
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>
References: <20250128113100.GB7145@noisy.programming.kicks-ass.net>
 <2c599f1f-f63b-4504-a026-46bf73954124@redhat.com>
 <20250128132847.GB505@noisy.programming.kicks-ass.net>
 <18172465-37e3-48a9-9d67-0d44fdcb93bd@redhat.com>
 <8b661116-0a85-4928-91ed-3c01ebbf8d39@bytedance.com>
 <2212111cad3180948cf388a7e5c8689df0fdda08.camel@surriel.com>
 <14159fb4-0c59-4653-9265-73f415e70063@bytedance.com>
 <20250129105920.7a4bffa1@fangorn> <Z5pTZ0XLFzfM5dic@casper.infradead.org>
 <488401565cac6b5f9e3232d0ca481055876c919b.camel@surriel.com>
 <05da0ae9-073e-4578-b65c-f837c28eead8@paulmck-laptop>
 <20250129115320.1334ad5f@fangorn>
 <96f55f36-5cb7-4226-a8ea-374a7891ecff@bytedance.com>
 <0feb6506a91ea47b306ad50143bde375f462af63.camel@surriel.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <0feb6506a91ea47b306ad50143bde375f462af63.camel@surriel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/2/1 05:11, Rik van Riel wrote:
> On Thu, 2025-01-30 at 01:33 +0800, Qi Zheng wrote:
>>
>> stress-ng: info:  [671] stressor       bogo ops real time  usr time
>> sys
>> time   bogo ops/s   bogo ops/s
>> stress-ng: info:  [671]                           (secs)    (secs)
>> (secs)   (real time) (usr+sys time)
>> stress-ng: info:  [671] mmapaddr       19803127     60.01    235.20
>> 1146.76    330007.29     14329.74
> 
> How stable are these numbers?
> 
> It looks like the bogo ops/s number without the local_bh_disable
> was 17233711, while the number is 19803127 after.
> 
> That looks like a 14% speedup.
> 
> This is not back to the 28440843 you had before
> MMU_GATHER_RCU_TABLE_FREE was enabled unconditionally,
> but it does reduce the size of the regression
> considerably, from 40% to 31%.

This difference should be caused by the jitter of the test, I just
retested it:

1) disable PT_RECLAIM

root@debian:~# stress-ng --timeout 60 --times --verify --metrics 
--no-rand-seed --mmapaddr 64
stress-ng: info:  [1141] dispatching hogs: 64 mmapaddr
stress-ng: info:  [1141] successful run completed in 60.09s (1 min, 0.09 
secs)
stress-ng: info:  [1141] stressor       bogo ops real time  usr time 
sys time   bogo ops/s   bogo ops/s
stress-ng: info:  [1141]                           (secs)    (secs) 
(secs)   (real time) (usr+sys time)
stress-ng: info:  [1141] mmapaddr       32932197     60.01    349.92 
1086.26    548798.08     22930.41
stress-ng: info:  [1141] for a 60.09s run time:
stress-ng: info:  [1141]    1442.14s available CPU time
stress-ng: info:  [1141]     350.29s user time   ( 24.29%)
stress-ng: info:  [1141]    1086.67s system time ( 75.35%)
stress-ng: info:  [1141]    1436.96s total time  ( 99.64%)
stress-ng: info:  [1141] load average: 41.06 11.81 4.06
root@debian:~# stress-ng --timeout 60 --times --verify --metrics 
--no-rand-seed --mmapaddr 64
stress-ng: info:  [1270] dispatching hogs: 64 mmapaddr
stress-ng: info:  [1270] successful run completed in 60.04s (1 min, 0.04 
secs)
stress-ng: info:  [1270] stressor       bogo ops real time  usr time 
sys time   bogo ops/s   bogo ops/s
stress-ng: info:  [1270]                           (secs)    (secs) 
(secs)   (real time) (usr+sys time)
stress-ng: info:  [1270] mmapaddr       32998610     60.01    346.09 
1089.75    549908.86     22982.09
stress-ng: info:  [1270] for a 60.04s run time:
stress-ng: info:  [1270]    1441.08s available CPU time
stress-ng: info:  [1270]     346.45s user time   ( 24.04%)
stress-ng: info:  [1270]    1090.16s system time ( 75.65%)
stress-ng: info:  [1270]    1436.61s total time  ( 99.69%)
stress-ng: info:  [1270] load average: 53.09 20.95 7.76
root@debian:~# stress-ng --timeout 60 --times --verify --metrics 
--no-rand-seed --mmapaddr 64
stress-ng: info:  [1400] dispatching hogs: 64 mmapaddr
stress-ng: info:  [1400] successful run completed in 60.06s (1 min, 0.06 
secs)
stress-ng: info:  [1400] stressor       bogo ops real time  usr time 
sys time   bogo ops/s   bogo ops/s
stress-ng: info:  [1400]                           (secs)    (secs) 
(secs)   (real time) (usr+sys time)
stress-ng: info:  [1400] mmapaddr       32880743     60.01    350.36 
1084.90    547920.96     22909.26
stress-ng: info:  [1400] for a 60.06s run time:
stress-ng: info:  [1400]    1441.52s available CPU time
stress-ng: info:  [1400]     350.75s user time   ( 24.33%)
stress-ng: info:  [1400]    1085.29s system time ( 75.29%)
stress-ng: info:  [1400]    1436.04s total time  ( 99.62%)
stress-ng: info:  [1400] load average: 56.85 28.12 11.16

2) disable PT_RECLAIM + unconditionally enable MMU_GATHER_RCU_TABLE_FREE

root@debian:~# stress-ng --timeout 60 --times --verify --metrics 
--no-rand-seed --mmapaddr 64
stress-ng: info:  [676] dispatching hogs: 64 mmapaddr
stress-ng: info:  [676] successful run completed in 60.03s (1 min, 0.03 
secs)
stress-ng: info:  [676] stressor       bogo ops real time  usr time  sys 
time   bogo ops/s   bogo ops/s
stress-ng: info:  [676]                           (secs)    (secs) 
(secs)   (real time) (usr+sys time)
stress-ng: info:  [676] mmapaddr       19600836     60.01    206.77 
987.29    326626.71     16415.29
stress-ng: info:  [676] for a 60.03s run time:
stress-ng: info:  [676]    1440.76s available CPU time
stress-ng: info:  [676]     207.08s user time   ( 14.37%)
stress-ng: info:  [676]     987.63s system time ( 68.55%)
stress-ng: info:  [676]    1194.71s total time  ( 82.92%)
stress-ng: info:  [676] load average: 40.91 11.72 4.03
root@debian:~# stress-ng --timeout 60 --times --verify --metrics 
--no-rand-seed --mmapaddr 64
stress-ng: info:  [809] dispatching hogs: 64 mmapaddr
stress-ng: info:  [809] successful run completed in 60.07s (1 min, 0.07 
secs)
stress-ng: info:  [809] stressor       bogo ops real time  usr time  sys 
time   bogo ops/s   bogo ops/s
stress-ng: info:  [809]                           (secs)    (secs) 
(secs)   (real time) (usr+sys time)
stress-ng: info:  [809] mmapaddr       19724158     60.02    233.64 
1135.94    328625.29     14401.61
stress-ng: info:  [809] for a 60.07s run time:
stress-ng: info:  [809]    1441.78s available CPU time
stress-ng: info:  [809]     234.00s user time   ( 16.23%)
stress-ng: info:  [809]    1136.38s system time ( 78.82%)
stress-ng: info:  [809]    1370.38s total time  ( 95.05%)
stress-ng: info:  [809] load average: 55.16 21.29 7.83
root@debian:~# stress-ng --timeout 60 --times --verify --metrics 
--no-rand-seed --mmapaddr 64
stress-ng: info:  [939] dispatching hogs: 64 mmapaddr
stress-ng: info:  [939] successful run completed in 60.09s (1 min, 0.09 
secs)
stress-ng: info:  [939] stressor       bogo ops real time  usr time  sys 
time   bogo ops/s   bogo ops/s
stress-ng: info:  [939]                           (secs)    (secs) 
(secs)   (real time) (usr+sys time)
stress-ng: info:  [939] mmapaddr       19791766     60.01    238.14 
1132.85    329798.06     14436.11
stress-ng: info:  [939] for a 60.09s run time:
stress-ng: info:  [939]    1442.04s available CPU time
stress-ng: info:  [939]     238.48s user time   ( 16.54%)
stress-ng: info:  [939]    1133.25s system time ( 78.59%)
stress-ng: info:  [939]    1371.73s total time  ( 95.12%)
stress-ng: info:  [939] load average: 58.39 28.66 11.33

3) disable PT_RECLAIM + unconditionally enable MMU_GATHER_RCU_TABLE_FREE 
+ local_bh_disable

root@debian:~# stress-ng --timeout 60 --times --verify --metrics 
--no-rand-seed --mmapaddr 64
stress-ng: info:  [702] dispatching hogs: 64 mmapaddr
stress-ng: info:  [702] successful run completed in 60.05s (1 min, 0.05 
secs)
stress-ng: info:  [702] stressor       bogo ops real time  usr time  sys 
time   bogo ops/s   bogo ops/s
stress-ng: info:  [702]                           (secs)    (secs) 
(secs)   (real time) (usr+sys time)
stress-ng: info:  [702] mmapaddr       19838750     60.01    213.89 
1038.45    330573.57     15841.35
stress-ng: info:  [702] for a 60.05s run time:
stress-ng: info:  [702]    1441.13s available CPU time
stress-ng: info:  [702]     214.20s user time   ( 14.86%)
stress-ng: info:  [702]    1038.80s system time ( 72.08%)
stress-ng: info:  [702]    1253.00s total time  ( 86.95%)
stress-ng: info:  [702] load average: 43.03 12.29 4.22
root@debian:~# stress-ng --timeout 60 --times --verify --metrics 
--no-rand-seed --mmapaddr 64
stress-ng: info:  [837] dispatching hogs: 64 mmapaddr
stress-ng: info:  [837] successful run completed in 60.05s (1 min, 0.05 
secs)
stress-ng: info:  [837] stressor       bogo ops real time  usr time  sys 
time   bogo ops/s   bogo ops/s
stress-ng: info:  [837]                           (secs)    (secs) 
(secs)   (real time) (usr+sys time)
stress-ng: info:  [837] mmapaddr       19859240     60.01    237.16 
1137.80    330931.82     14443.50
stress-ng: info:  [837] for a 60.05s run time:
stress-ng: info:  [837]    1441.15s available CPU time
stress-ng: info:  [837]     237.54s user time   ( 16.48%)
stress-ng: info:  [837]    1138.20s system time ( 78.98%)
stress-ng: info:  [837]    1375.74s total time  ( 95.46%)
stress-ng: info:  [837] load average: 44.59 19.18 7.65
root@debian:~# stress-ng --timeout 60 --times --verify --metrics 
--no-rand-seed --mmapaddr 64
stress-ng: info:  [974] dispatching hogs: 64 mmapaddr
stress-ng: info:  [974] successful run completed in 60.07s (1 min, 0.07 
secs)
stress-ng: info:  [974] stressor       bogo ops real time  usr time  sys 
time   bogo ops/s   bogo ops/s
stress-ng: info:  [974]                           (secs)    (secs) 
(secs)   (real time) (usr+sys time)
stress-ng: info:  [974] mmapaddr       19769594     60.01    240.35 
1141.47    329421.87     14306.92
stress-ng: info:  [974] for a 60.07s run time:
stress-ng: info:  [974]    1441.78s available CPU time
stress-ng: info:  [974]     240.73s user time   ( 16.70%)
stress-ng: info:  [974]    1141.84s system time ( 79.20%)
stress-ng: info:  [974]    1382.57s total time  ( 95.89%)
stress-ng: info:  [974] load average: 43.68 22.85 10.43

And I went to look at the source code of stress-ng. For the --mmapaddr
option, the prot parameter passed to mmap() is indeed PROT_READ.
Therefore, this test will only cause the allocation and freeing of page 
table pages.

For the --mmap option, the prot parameter is PROT_READ | PROT_WRITE,
this will also cause the allocation and freeing of normal pages, so I
just did the following test:

1) disable PT_RECLAIM

root@debian:~# stress-ng --timeout 60 --times --verify --metrics 
--no-rand-seed --mmap 64
stress-ng: info:  [668] dispatching hogs: 64 mmap
stress-ng: info:  [668] successful run completed in 60.07s (1 min, 0.07 
secs)
stress-ng: info:  [668] stressor       bogo ops real time  usr time  sys 
time   bogo ops/s   bogo ops/s
stress-ng: info:  [668]                           (secs)    (secs) 
(secs)   (real time) (usr+sys time)
stress-ng: info:  [668] mmap              17568     60.02    434.94 
668.32       292.68        15.92
stress-ng: info:  [668] for a 60.07s run time:
stress-ng: info:  [668]    1441.58s available CPU time
stress-ng: info:  [668]     435.25s user time   ( 30.19%)
stress-ng: info:  [668]     668.77s system time ( 46.39%)
stress-ng: info:  [668]    1104.02s total time  ( 76.58%)
stress-ng: info:  [668] load average: 40.91 11.74 4.04
root@debian:~# stress-ng --timeout 60 --times --verify --metrics 
--no-rand-seed --mmap 64
stress-ng: info:  [839] dispatching hogs: 64 mmap
stress-ng: info:  [839] successful run completed in 60.07s (1 min, 0.07 
secs)
stress-ng: info:  [839] stressor       bogo ops real time  usr time  sys 
time   bogo ops/s   bogo ops/s
stress-ng: info:  [839]                           (secs)    (secs) 
(secs)   (real time) (usr+sys time)
stress-ng: info:  [839] mmap              17919     60.01    555.27 
853.19       298.60        12.72
stress-ng: info:  [839] for a 60.07s run time:
stress-ng: info:  [839]    1441.66s available CPU time
stress-ng: info:  [839]     555.63s user time   ( 38.54%)
stress-ng: info:  [839]     853.58s system time ( 59.21%)
stress-ng: info:  [839]    1409.21s total time  ( 97.75%)
stress-ng: info:  [839] load average: 53.60 21.01 7.77
root@debian:~# stress-ng --timeout 60 --times --verify --metrics 
--no-rand-seed --mmap 64
stress-ng: info:  [968] dispatching hogs: 64 mmap
stress-ng: info:  [968] successful run completed in 60.04s (1 min, 0.04 
secs)
stress-ng: info:  [968] stressor       bogo ops real time  usr time  sys 
time   bogo ops/s   bogo ops/s
stress-ng: info:  [968]                           (secs)    (secs) 
(secs)   (real time) (usr+sys time)
stress-ng: info:  [968] mmap              17834     60.01    552.80 
864.17       297.17        12.59
stress-ng: info:  [968] for a 60.04s run time:
stress-ng: info:  [968]    1440.99s available CPU time
stress-ng: info:  [968]     553.14s user time   ( 38.39%)
stress-ng: info:  [968]     864.58s system time ( 60.00%)
stress-ng: info:  [968]    1417.72s total time  ( 98.39%)
stress-ng: info:  [968] load average: 56.07 28.05 11.20

2) disable PT_RECLAIM + unconditionally enable MMU_GATHER_RCU_TABLE_FREE

root@debian:~# stress-ng --timeout 60 --times --verify --metrics 
--no-rand-seed --mmap 64
stress-ng: info:  [704] dispatching hogs: 64 mmap
stress-ng: info:  [704] successful run completed in 60.06s (1 min, 0.06 
secs)
stress-ng: info:  [704] stressor       bogo ops real time  usr time  sys 
time   bogo ops/s   bogo ops/s
stress-ng: info:  [704]                           (secs)    (secs) 
(secs)   (real time) (usr+sys time)
stress-ng: info:  [704] mmap              17400     60.01    497.26 
764.25       289.94        13.79
stress-ng: info:  [704] for a 60.06s run time:
stress-ng: info:  [704]    1441.34s available CPU time
stress-ng: info:  [704]     497.57s user time   ( 34.52%)
stress-ng: info:  [704]     764.66s system time ( 53.05%)
stress-ng: info:  [704]    1262.23s total time  ( 87.57%)
stress-ng: info:  [704] load average: 40.69 11.70 4.02
root@debian:~# stress-ng --timeout 60 --times --verify --metrics 
--no-rand-seed --mmap 64
stress-ng: info:  [875] dispatching hogs: 64 mmap
stress-ng: info:  [875] successful run completed in 60.05s (1 min, 0.05 
secs)
stress-ng: info:  [875] stressor       bogo ops real time  usr time  sys 
time   bogo ops/s   bogo ops/s
stress-ng: info:  [875]                           (secs)    (secs) 
(secs)   (real time) (usr+sys time)
stress-ng: info:  [875] mmap              17874     60.03    562.42 
842.09       297.75        12.73
stress-ng: info:  [875] for a 60.05s run time:
stress-ng: info:  [875]    1441.31s available CPU time
stress-ng: info:  [875]     562.78s user time   ( 39.05%)
stress-ng: info:  [875]     842.50s system time ( 58.45%)
stress-ng: info:  [875]    1405.28s total time  ( 97.50%)
stress-ng: info:  [875] load average: 51.59 20.56 7.65
root@debian:~# stress-ng --timeout 60 --times --verify --metrics 
--no-rand-seed --mmap 64
stress-ng: info:  [1004] dispatching hogs: 64 mmap
stress-ng: info:  [1004] successful run completed in 60.14s (1 min, 0.14 
secs)
stress-ng: info:  [1004] stressor       bogo ops real time  usr time 
sys time   bogo ops/s   bogo ops/s
stress-ng: info:  [1004]                           (secs)    (secs) 
(secs)   (real time) (usr+sys time)
stress-ng: info:  [1004] mmap              17969     60.01    554.19 
849.38       299.42        12.80
stress-ng: info:  [1004] for a 60.14s run time:
stress-ng: info:  [1004]    1443.32s available CPU time
stress-ng: info:  [1004]     554.59s user time   ( 38.42%)
stress-ng: info:  [1004]     849.81s system time ( 58.88%)
stress-ng: info:  [1004]    1404.40s total time  ( 97.30%)
stress-ng: info:  [1004] load average: 58.84 28.43 11.22

3) disable PT_RECLAIM + unconditionally enable MMU_GATHER_RCU_TABLE_FREE 
+ local_bh_disable

root@debian:~# stress-ng --timeout 60 --times --verify --metrics 
--no-rand-seed --mmap 64
stress-ng: info:  [684] dispatching hogs: 64 mmap
stress-ng: info:  [684] successful run completed in 60.05s (1 min, 0.05 
secs)
stress-ng: info:  [684] stressor       bogo ops real time  usr time  sys 
time   bogo ops/s   bogo ops/s
stress-ng: info:  [684]                           (secs)    (secs) 
(secs)   (real time) (usr+sys time)
stress-ng: info:  [684] mmap              17817     60.01    555.70 
847.53       296.88        12.70
stress-ng: info:  [684] for a 60.05s run time:
stress-ng: info:  [684]    1441.12s available CPU time
stress-ng: info:  [684]     556.10s user time   ( 38.59%)
stress-ng: info:  [684]     847.94s system time ( 58.84%)
stress-ng: info:  [684]    1404.04s total time  ( 97.43%)
stress-ng: info:  [684] load average: 41.27 11.82 4.06
root@debian:~# stress-ng --timeout 60 --times --verify --metrics 
--no-rand-seed --mmap 64
stress-ng: info:  [815] dispatching hogs: 64 mmap
stress-ng: info:  [815] successful run completed in 60.06s (1 min, 0.06 
secs)
stress-ng: info:  [815] stressor       bogo ops real time  usr time  sys 
time   bogo ops/s   bogo ops/s
stress-ng: info:  [815]                           (secs)    (secs) 
(secs)   (real time) (usr+sys time)
stress-ng: info:  [815] mmap              17860     60.01    553.77 
856.56       297.60        12.66
stress-ng: info:  [815] for a 60.06s run time:
stress-ng: info:  [815]    1441.44s available CPU time
stress-ng: info:  [815]     554.13s user time   ( 38.44%)
stress-ng: info:  [815]     856.94s system time ( 59.45%)
stress-ng: info:  [815]    1411.07s total time  ( 97.89%)
stress-ng: info:  [815] load average: 49.71 20.32 7.66
root@debian:~# stress-ng --timeout 60 --times --verify --metrics 
--no-rand-seed --mmap 64
stress-ng: info:  [944] dispatching hogs: 64 mmap
stress-ng: info:  [944] successful run completed in 60.08s (1 min, 0.08 
secs)
stress-ng: info:  [944] stressor       bogo ops real time  usr time  sys 
time   bogo ops/s   bogo ops/s
stress-ng: info:  [944]                           (secs)    (secs) 
(secs)   (real time) (usr+sys time)
stress-ng: info:  [944] mmap              17932     60.01    556.23 
857.77       298.82        12.68
stress-ng: info:  [944] for a 60.08s run time:
stress-ng: info:  [944]    1442.01s available CPU time
stress-ng: info:  [944]     556.63s user time   ( 38.60%)
stress-ng: info:  [944]     858.16s system time ( 59.51%)
stress-ng: info:  [944]    1414.79s total time  ( 98.11%)
stress-ng: info:  [944] load average: 56.02 27.74 11.12

It looks like there is basically no difference in bogo ops/s.

Thanks!

> 
