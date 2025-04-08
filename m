Received: from out30-97.freemail.mail.aliyun.com (out30-97.freemail.mail.aliyun.com [115.124.30.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A48E263F44
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 08:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744099906; cv=none; b=qSU1DJ3Onz96E13kJW3hqMO6okCkxtgOpn4AKq0PwW1/T871I2OSijSOGqrF+no7yTXXU2mk9Ed8M0ywtQozbcMtpEibFlsDsqwIOEXedyFUGqpGKqRGjEHJv6CdPzh4aQE16wsLOrDDZ/5zc3cZYrZ1zE8Si9HyCbZ6vzePhg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744099906; c=relaxed/simple;
	bh=uT8ybYJ8z2pWmCOonpXiutxvXE0bYgJTMrPDrLyaYJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NarFYTkUxJ1GtICCKfa2OCAhnYNtKB1I9z/zg/gArcp1dA+6ZRekmqrzC3pJaad3a179yWksdFVhRMrXVphGBxjazcUjcHO9UucAn7mQMwE6ScbFZbLFGWNuEW4toaI+r8mVJlEPVF4oPKXwD4ZF7rJaPPY6YcOw5RjgXe+iPJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=l5HaVzu3; arc=none smtp.client-ip=115.124.30.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="l5HaVzu3"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1744099894; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=9h2K4oXsYeaw5f4qdfa43kBcn/+mZo5xYqKfvGWE2pU=;
	b=l5HaVzu31dnLGPMSR2DITktYPExJyA/guoigtHnnw92hQN754yEzujVqeLhOsP01MpZrvpIQH2JVOoPxcGLno+0dYDpbNsKOl9KnjVzWGN1cRUeDG7dlOJHFngUBO5mqcTBdfK/29gqH8URyggJNTdgwJ8bbkPhsxCBEPWP/fH0=
Received: from 30.74.144.107(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WWEMSww_1744099893 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 08 Apr 2025 16:11:34 +0800
Message-ID: <f0026429-de3e-4e20-8603-39683180a643@linux.alibaba.com>
Date: Tue, 8 Apr 2025 16:11:33 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] selftests: mincore: fix tmpfs mincore test failure
To: David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org,
 hughd@google.com
Cc: willy@infradead.org, 21cnbao@gmail.com, ryan.roberts@arm.com,
 ziy@nvidia.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <9a00856cc6a8b4e46f4ab8b1af11ce5fc1a31851.1744025467.git.baolin.wang@linux.alibaba.com>
 <61e36a73-2c8c-4897-9ba5-3b2d59f57b5d@redhat.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <61e36a73-2c8c-4897-9ba5-3b2d59f57b5d@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/4/7 23:04, David Hildenbrand wrote:
> On 07.04.25 13:31, Baolin Wang wrote:
>> When running mincore test cases, I encountered the following failures:
>>
>> "
>> mincore_selftest.c:359:check_tmpfs_mmap:Expected ra_pages (511) == 0 (0)
>> mincore_selftest.c:360:check_tmpfs_mmap:Read-ahead pages found in memory
>> check_tmpfs_mmap: Test terminated by assertion
>>            FAIL  global.check_tmpfs_mmap
>> not ok 5 global.check_tmpfs_mmap
>> FAILED: 4 / 5 tests passed
>> "
>>
>> The reason for the test case failure is that my system automatically 
>> enabled
>> tmpfs large folio allocation by adding the 
>> 'transparent_hugepage_tmpfs=always'
>> cmdline. However, the test case still expects the tmpfs mounted on 
>> /dev/shm to
>> allocate small folios, which leads to assertion failures when 
>> verifying readahead
>> pages.
>>
>> As discussed with David, there's no reason to continue checking the 
>> readahead
>> logic for tmpfs. Drop it to fix this issue.
>>
> 
> BTW, should we add a Fixes: ? Could only be tmpfs support that changed 
> the behavior but didn't fixup the test case.

I was hesitant about whether a Fixes tag is needed, because this issue 
can be traced back to the earliest patch set that added THP support to 
tmpfs. However, the test issue wasn't exposed because the 'huge=' 
parameter wasn't included when mounting /dev/shm.

After the cmdline 'transparent_hugepage_tmpfs' was added for tmpfs, the 
issue is exposed easily. So I am inclined to add a Fixes tag for the 
patch added the 'transparent_hugepage_tmpfs' cmdline.

Fixes: d635ccdb435c ("mm: shmem: add a kernel command line to change the 
default huge policy for tmpfs")

>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>> ---
>> Changes from v1:
>>   - Drop the readahead logic check, per David.
>> ---
>>   .../testing/selftests/mincore/mincore_selftest.c | 16 ++--------------
>>   1 file changed, 2 insertions(+), 14 deletions(-)
>>
>> diff --git a/tools/testing/selftests/mincore/mincore_selftest.c 
>> b/tools/testing/selftests/mincore/mincore_selftest.c
>> index e949a43a6145..0fd4b00bd345 100644
>> --- a/tools/testing/selftests/mincore/mincore_selftest.c
>> +++ b/tools/testing/selftests/mincore/mincore_selftest.c
>> @@ -286,8 +286,7 @@ TEST(check_file_mmap)
>>   /*
>>    * Test mincore() behavior on a page backed by a tmpfs file.  This test
>> - * performs the same steps as the previous one. However, we don't expect
>> - * any readahead in this case.
>> + * performs the same steps as the previous one.
>>    */
>>   TEST(check_tmpfs_mmap)
>>   {
>> @@ -298,7 +297,6 @@ TEST(check_tmpfs_mmap)
>>       int page_size;
>>       int fd;
>>       int i;
>> -    int ra_pages = 0;
>>       page_size = sysconf(_SC_PAGESIZE);
>>       vec_size = FILE_SIZE / page_size;
>> @@ -341,8 +339,7 @@ TEST(check_tmpfs_mmap)
>>       }
>>       /*
>> -     * Touch a page in the middle of the mapping. We expect only
>> -     * that page to be fetched into memory.
>> +     * Touch a page in the middle of the mapping.
>>        */
>>       addr[FILE_SIZE / 2] = 1;
>>       retval = mincore(addr, FILE_SIZE, vec);
>> @@ -351,15 +348,6 @@ TEST(check_tmpfs_mmap)
>>           TH_LOG("Page not found in memory after use");
>>       }
>> -    i = FILE_SIZE / 2 / page_size + 1;
>> -    while (i < vec_size && vec[i]) {
>> -        ra_pages++;
>> -        i++;
>> -    }
>> -    ASSERT_EQ(ra_pages, 0) {
>> -        TH_LOG("Read-ahead pages found in memory");
>> -    }
>> -
>>       munmap(addr, FILE_SIZE);
>>       close(fd);
>>       free(vec);
> 
> Acked-by: David Hildenbrand <david@redhat.com>

Thanks.
