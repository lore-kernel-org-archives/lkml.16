Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500C714AA9
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 03:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743997759; cv=none; b=bDPPHzzNG62zgH0THm0s8QHKZ6PHt/zxrbVP4zCV4xSbDWWY3hS3UXIrRfl1xb9Aj+SSI5WyWdz66/O+q+bbGxOrDLVo1GlRhU9Xoe/LB3n7ZbiPs3L32DQZTHG2sVsLp4IGTKn+ICWgMkV1DM63nbmxuVc6goAGthV3vmNXXes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743997759; c=relaxed/simple;
	bh=1bXBhSH9BUhDdKVMGuk3PsIYQ/P7X9XUjHRuV12EZ04=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NwXC3PBp0FjQgkgKOfVvBho/Aq7HloXJWXROFEeg151YChV+Mbe1Fwpe2DuqCEzjO3AVo6ZVD21AB+SNW6uAI+XeTplnxXE+Y5vJS5+eluP2IkpEWLdYRY+hoyDS6X5tWh0TKz12YZ70Z4VOweT01AuEtVir1Zhp8tYbmx3eTeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=SkqmdfcF; arc=none smtp.client-ip=115.124.30.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="SkqmdfcF"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1743997746; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=DEDu5rdn8ShbXDZZa2qYlfq0mSmMd2y6q6eMReHRAKg=;
	b=SkqmdfcF0m5jGyvirxsRgk+8QYrpnG7TGKFPy0j8eiX/ss3M8lVHUxkC0x3JUd756IBYtLgxb6uKvNz5x2Vr716O5PIXXwCZYx5wJ0WCVhsarV15Rxgt5mdb5ZNgkp/gHioT1tdt6+e5eO2PgEceVSMlm/yohePmbPEcWsFn/q8=
Received: from 30.74.144.125(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WVlqZzc_1743997745 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 07 Apr 2025 11:49:06 +0800
Message-ID: <cefb4920-36ad-404f-b058-f50eea52c418@linux.alibaba.com>
Date: Mon, 7 Apr 2025 11:49:05 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] selftests: mincore: fix tmpfs mincore test failure
To: David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org,
 hughd@google.com
Cc: willy@infradead.org, 21cnbao@gmail.com, ryan.roberts@arm.com,
 ziy@nvidia.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <cover.1742960003.git.baolin.wang@linux.alibaba.com>
 <99a3e190d38b08a2b96ede952a29893bffdb3432.1742960003.git.baolin.wang@linux.alibaba.com>
 <9000c5c1-34be-4bc9-b1c0-11548264eaa6@redhat.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <9000c5c1-34be-4bc9-b1c0-11548264eaa6@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/4/1 20:54, David Hildenbrand wrote:
> On 26.03.25 04:38, Baolin Wang wrote:
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
>> To fix this issue, remount tmpfs to a new test directory and set the 
>> 'huge=never'
>> parameter to avoid allocating large folios, which can pass the test.
>>
>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>> ---
>>   .../selftests/mincore/mincore_selftest.c      | 25 +++++++++++++++++--
>>   1 file changed, 23 insertions(+), 2 deletions(-)
>>
>> diff --git a/tools/testing/selftests/mincore/mincore_selftest.c 
>> b/tools/testing/selftests/mincore/mincore_selftest.c
>> index e949a43a6145..e8d7a3a4739f 100644
>> --- a/tools/testing/selftests/mincore/mincore_selftest.c
>> +++ b/tools/testing/selftests/mincore/mincore_selftest.c
>> @@ -12,6 +12,7 @@
>>   #include <unistd.h>
>>   #include <stdlib.h>
>>   #include <sys/mman.h>
>> +#include <sys/mount.h>
>>   #include <string.h>
>>   #include <fcntl.h>
>> @@ -283,7 +284,7 @@ TEST(check_file_mmap)
>>       free(vec);
>>   }
>> -
>> +#define INPUT_MAX 80
>>   /*
>>    * Test mincore() behavior on a page backed by a tmpfs file.  This test
>>    * performs the same steps as the previous one. However, we don't 
>> expect
>> @@ -291,6 +292,9 @@ TEST(check_file_mmap)
>>    */
>>   TEST(check_tmpfs_mmap)
>>   {
>> +    char tmpfs_template[] = "/tmp/check_tmpfs_XXXXXX";
>> +    const char *tmpfs_loc = mkdtemp(tmpfs_template);
>> +    char testfile[INPUT_MAX];
>>       unsigned char *vec;
>>       int vec_size;
>>       char *addr;
>> @@ -300,6 +304,10 @@ TEST(check_tmpfs_mmap)
>>       int i;
>>       int ra_pages = 0;
>> +    ASSERT_NE(NULL, tmpfs_loc) {
>> +        TH_LOG("Can't mkdir tmpfs dentry\n");
>> +    }
>> +
>>       page_size = sysconf(_SC_PAGESIZE);
>>       vec_size = FILE_SIZE / page_size;
>>       if (FILE_SIZE % page_size)
>> @@ -311,7 +319,18 @@ TEST(check_tmpfs_mmap)
>>       }
>>       errno = 0;
>> -    fd = open("/dev/shm", O_TMPFILE | O_RDWR, 0600);
>> +    /* Do not use large folios for tmpfs mincore testing */
>> +    retval = mount("tmpfs", tmpfs_loc, "tmpfs", 0, 
>> "huge=never,size=4M");
>> +    ASSERT_EQ(0, retval) {
>> +        TH_LOG("Unable to mount tmpfs for testing\n");
>> +    }
>> +
>> +    retval = snprintf(testfile, INPUT_MAX, "%s/test_file", tmpfs_loc);
>> +    ASSERT_GE(INPUT_MAX, retval) {
>> +        TH_LOG("Unable to create a tmpfs for testing\n");
>> +    }
>> +
>> +    fd = open(testfile, O_CREAT|O_RDWR, 0664);
>>       ASSERT_NE(-1, fd) {
>>           TH_LOG("Can't create temporary file: %s",
>>               strerror(errno));
>> @@ -363,6 +382,8 @@ TEST(check_tmpfs_mmap)
>>       munmap(addr, FILE_SIZE);
>>       close(fd);
>>       free(vec);
>> +    umount(tmpfs_loc);
>> +    rmdir(tmpfs_loc);
>>   }
>>   TEST_HARNESS_MAIN
> 
> Is there anything that cleans up the mount in case something goes wrong 
> (we run into an assertion), or will the directory+mount stick around 
> forever?

Good point, will cleanup the mount in the next version.

> 
> But I also wonder whether check_tmpfs_mmap() should be changed to live 
> with the fact that readahead ("faultaround") could now happen. What's 
> the reason for not doing that?

 From this test case's description, it doesn't expect any readahead.
"
/*
  * Test mincore() behavior on a page backed by a tmpfs file.  This test
  * performs the same steps as the previous one. However, we don't expect
  * any readahead in this case.
  */
"

Maybe adding a new test case to expect the readahead for tmpfs file.
