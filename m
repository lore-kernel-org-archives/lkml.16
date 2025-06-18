Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADA72F5305
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 13:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750251956; cv=none; b=py6orQ3oU4910PqVD2F2OCtiJhGu8yumBTkXs6aCeFGXkNq7v096lxEY4norMqXYGkmthneept5YzzG/B+N7RYh/x0zFzJz+xLaiTN31JVY1ZXbHx5f2e7F5dFSNtAwzv2+VawHi1C3mpHBhJf5XN0WQuzMSpvUxo7r29sknbMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750251956; c=relaxed/simple;
	bh=F8ZxHJuXpP/ytiKVy+Xk8yLKNEHQXQPYLN7cb+OD2XM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pYlh688VR3VKBPDQ9aS2/He/qEQdux0Ce6XIWoatosSaGc18X614AMTLwtlsZJ2/UnW6KAvzY2gVWYJyI813rU5Z72a5RfgaDc0fue88w+WHnYr6DoYlwx80eS1skUy80TWjNbLtIkN69YhYJml0l0nHfGkIzLjPosN4s8MmuP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=U7QLjMw1; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="U7QLjMw1"
Message-ID: <ec77f310-6ded-4f7b-a15b-07855b0bbafb@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750251950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qjE/HZ9yBukz5rd7dZg8Lj4y2PBMtnPQc/ZMBh/aZeQ=;
	b=U7QLjMw16E3d4j/9tU2l8vV/TEBUrfppUtfnyQyFpODyD9X035A/i3DJZBjWsIXY0zEDHO
	rGP/4XI183zBgjabbIuo+GcQDyxzdLgy6m2mqPe5f7k61/SHp8QrTpkP1FRVjzl1InD1D7
	UgOsiA0hCzcMs/9FRvEHIKh6PUK37fI=
Date: Wed, 18 Jun 2025 21:05:42 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4] mm: use per_vma lock for MADV_DONTNEED
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Suren Baghdasaryan <surenb@google.com>, Lokesh Gidra
 <lokeshgidra@google.com>, Tangquan Zheng <zhengtangquan@oppo.com>,
 Qi Zheng <zhengqi.arch@bytedance.com>, Lance Yang <ioworker0@gmail.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Zi Li <zi.li@linux.dev>
References: <20250607220150.2980-1-21cnbao@gmail.com>
 <309d22ca-6cd9-4601-8402-d441a07d9443@lucifer.local>
 <f2a43ae1-6347-47e2-bcc4-845dc7e7ed87@linux.dev>
 <CAGsJ_4xVH6DT_8t=oDvHCJ-iDwrpms6FhMn9UdKWMwDRv+hunA@mail.gmail.com>
 <deb5ecd0-d57b-4a04-85b7-e6d11207aa8f@redhat.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <deb5ecd0-d57b-4a04-85b7-e6d11207aa8f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT



On 2025/6/18 18:18, David Hildenbrand wrote:
> On 18.06.25 11:52, Barry Song wrote:
>> On Wed, Jun 18, 2025 at 10:25 AM Lance Yang <lance.yang@linux.dev> wrote:
>>>
>>> Hi all,
>>>
>>> Crazy, the per-VMA lock for madvise is an absolute game-changer ;)
>>>
>>> On 2025/6/17 21:38, Lorenzo Stoakes wrote:
>>> [...]
>>>>
>>>> On Sun, Jun 08, 2025 at 10:01:50AM +1200, Barry Song wrote:
>>>>> From: Barry Song <v-songbaohua@oppo.com>
>>>>>
>>>>> Certain madvise operations, especially MADV_DONTNEED, occur far more
>>>>> frequently than other madvise options, particularly in native and Java
>>>>> heaps for dynamic memory management.
>>>>>
>>>>> Currently, the mmap_lock is always held during these operations, 
>>>>> even when
>>>>> unnecessary. This causes lock contention and can lead to severe 
>>>>> priority
>>>>> inversion, where low-priority threads—such as Android's 
>>>>> HeapTaskDaemon—
>>>>> hold the lock and block higher-priority threads.
>>>>>
>>>>> This patch enables the use of per-VMA locks when the advised range 
>>>>> lies
>>>>> entirely within a single VMA, avoiding the need for full VMA 
>>>>> traversal. In
>>>>> practice, userspace heaps rarely issue MADV_DONTNEED across 
>>>>> multiple VMAs.
>>>>>
>>>>> Tangquan’s testing shows that over 99.5% of memory reclaimed by 
>>>>> Android
>>>>> benefits from this per-VMA lock optimization. After extended runtime,
>>>>> 217,735 madvise calls from HeapTaskDaemon used the per-VMA path, while
>>>>> only 1,231 fell back to mmap_lock.
>>>>>
>>>>> To simplify handling, the implementation falls back to the standard
>>>>> mmap_lock if userfaultfd is enabled on the VMA, avoiding the 
>>>>> complexity of
>>>>> userfaultfd_remove().
>>>>>
>>>>> Many thanks to Lorenzo's work[1] on:
>>>>> "Refactor the madvise() code to retain state about the locking mode
>>>>> utilised for traversing VMAs.
>>>>>
>>>>> Then use this mechanism to permit VMA locking to be done later in the
>>>>> madvise() logic and also to allow altering of the locking mode to 
>>>>> permit
>>>>> falling back to an mmap read lock if required."
>>>>>
>>>>> One important point, as pointed out by Jann[2], is that
>>>>> untagged_addr_remote() requires holding mmap_lock. This is because
>>>>> address tagging on x86 and RISC-V is quite complex.
>>>>>
>>>>> Until untagged_addr_remote() becomes atomic—which seems unlikely in
>>>>> the near future—we cannot support per-VMA locks for remote processes.
>>>>> So for now, only local processes are supported.
>>>
>>> Just to put some numbers on it, I ran a micro-benchmark with 100
>>> parallel threads, where each thread calls madvise() on its own 1GiB

Correction: it uses 256MiB chunks per thread, not 1GiB ...

>>> chunk of 64KiB mTHP-backed memory. The performance gain is huge:
>>>
>>> 1) MADV_DONTNEED saw its average time drop from 0.0508s to 0.0270s (~47%
>>> faster)
>>> 2) MADV_FREE     saw its average time drop from 0.3078s to 0.1095s (~64%
>>> faster)
>>
>> Thanks for the report, Lance. I assume your micro-benchmark includes some
>> explicit or implicit operations that may require mmap_write_lock().
>> As  mmap_read_lock() only waits for writers and does not block other
>> mmap_read_lock() calls.
> 
> The number rather indicate that one test was run with (m)THPs enabled 
> and the other not? Just a thought. The locking overhead from my 
> experience is not that significant.
> 

Both tests were run with 64KiB mTHP enabled on an Intel(R) Xeon(R)
Silver 4314 CPU. The micro-benchmark code is following:

```
#define _GNU_SOURCE
#include <pthread.h>
#include <sys/mman.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <unistd.h>

#define NUM_THREADS 100
#define MMAP_SIZE (512L * 1024 * 1024)
#define WRITE_START (128L * 1024 * 1024)
#define WRITE_SIZE (256L * 1024 * 1024)
#define MADV_HUGEPAGE 14
#define MADV_DONTNEED 4
#define MADV_FREE 8

typedef struct {
     int id;
     int madvise_option;
} thread_data_t;

void *thread_function(void *arg) {
     thread_data_t *data = (thread_data_t *)arg;

     uint8_t *mmap_area = mmap(NULL, MMAP_SIZE, PROT_NONE, MAP_PRIVATE | 
MAP_ANONYMOUS, -1, 0);
     if (mmap_area == MAP_FAILED) {
         perror("mmap");
         return NULL;
     }

     if (mprotect(mmap_area + WRITE_START, WRITE_SIZE, PROT_READ | 
PROT_WRITE) != 0) {
         perror("mprotect");
         munmap(mmap_area, MMAP_SIZE);
         return NULL;
     }

     if (madvise(mmap_area + WRITE_START, WRITE_SIZE, MADV_HUGEPAGE) != 0) {
         perror("madvise hugepage");
         munmap(mmap_area, MMAP_SIZE);
         return NULL;
     }

     for (size_t i = 0; i < WRITE_SIZE; i++) {
         mmap_area[WRITE_START + i] = 255;
     }

     struct timespec start_time, end_time;
     clock_gettime(CLOCK_MONOTONIC, &start_time);

     if (madvise(mmap_area + WRITE_START, WRITE_SIZE, 
data->madvise_option) != 0) {
         perror("madvise");
     }

     clock_gettime(CLOCK_MONOTONIC, &end_time);
     double elapsed_time = (end_time.tv_sec - start_time.tv_sec) +
                           (end_time.tv_nsec - start_time.tv_nsec) / 1e9;
     printf("Thread %d elapsed time: %.6f seconds\n", data->id, 
elapsed_time);

     munmap(mmap_area, MMAP_SIZE);
     return NULL;
}

int main(int argc, char *argv[]) {
     if (argc != 2) {
         fprintf(stderr, "Usage: %s <madvise_option>\n", argv[0]);
         fprintf(stderr, "  1: MADV_DONTNEED\n");
         fprintf(stderr, "  2: MADV_FREE\n");
         return EXIT_FAILURE;
     }

     int madvise_option;
     if (atoi(argv[1]) == 1) {
         madvise_option = MADV_DONTNEED;
     } else if (atoi(argv[1]) == 2) {
         madvise_option = MADV_FREE;
     } else {
         fprintf(stderr, "Invalid madvise_option. Use 1 for 
MADV_DONTNEED or 2 for MADV_FREE.\n");
         return EXIT_FAILURE;
     }

     pthread_t threads[NUM_THREADS];
     thread_data_t thread_data[NUM_THREADS];
     int i;

     for (i = 0; i < NUM_THREADS; i++) {
         thread_data[i].id = i;
         thread_data[i].madvise_option = madvise_option;
         pthread_create(&threads[i], NULL, thread_function, 
&thread_data[i]);
     }
     for (i = 0; i < NUM_THREADS; i++) {
         pthread_join(threads[i], NULL);
     }

     sleep(10);
     return 0;
}
```

Thanks,
Lance

