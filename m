Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29291448D5
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 08:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744014920; cv=none; b=ETHSkzihTSZPAjmFJW7+rcMKGDiUlWUUqXTxojAtwavUCuaWYQ/8b5G5pF8WXBNK4HIZP/GwJI3b5CyLJxNDNFAf+IxW2l+MzNCN7gEI04s3gi/S4zok24eTEgHcY5VVGWVUyno9TNgpV7BEjs+/mKfu4cU+gmEUehe5hFv74sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744014920; c=relaxed/simple;
	bh=VGnJbls21FxlehnH3heGoHh8JevfhhSo2Ba/4QGlDUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aFns9goFXRNIxsfHyE7psoBKFIlmA7CbcZMyiXLR93KSaSMj8hxh7LpckUNB4QJ2d29u5SSLKoUIVPTzzZ/zJy/GwdZJsPU3tStIcBNUMyPoZQyPebmPJgrFi2G/Pn9KlDl0zoLseUMjNbmnVIcSUgnp2hmnoqEzxVkiEuih6aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=WdB7BFhi; arc=none smtp.client-ip=115.124.30.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="WdB7BFhi"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1744014914; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=Udd0Kb0rIbcEFFzCXIlMyfGS8vlMEao8bdeGZFHIkGA=;
	b=WdB7BFhim82djbLH7L42EVOK/gxo2QeZRAKpCDEJ5tH1TUBAUHWLgO6UjgjPGIC+RiLOQxDEaQFvqkMOJ9N6rsHK6NfS9Np9tIiVrweBsiewJf+Z5MDFijWVnyaNQxw+n/iTtIIfFPe4asL5fJc3KNj6rS7OiJfvtieLMkPq8cA=
Received: from 30.74.144.125(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WVrTlum_1744014912 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 07 Apr 2025 16:35:13 +0800
Message-ID: <635fb13b-0e22-4e3d-a9ab-971f301a7d99@linux.alibaba.com>
Date: Mon, 7 Apr 2025 16:35:12 +0800
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
 <cefb4920-36ad-404f-b058-f50eea52c418@linux.alibaba.com>
 <662ad650-8c68-40ef-a109-2e489658880d@redhat.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <662ad650-8c68-40ef-a109-2e489658880d@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/4/7 15:49, David Hildenbrand wrote:
> On 07.04.25 05:49, Baolin Wang wrote:
>>
>>
>> On 2025/4/1 20:54, David Hildenbrand wrote:
>>> On 26.03.25 04:38, Baolin Wang wrote:
>>>> When running mincore test cases, I encountered the following failures:
>>>>
>>>> "
>>>> mincore_selftest.c:359:check_tmpfs_mmap:Expected ra_pages (511) == 0 
>>>> (0)
>>>> mincore_selftest.c:360:check_tmpfs_mmap:Read-ahead pages found in 
>>>> memory
>>>> check_tmpfs_mmap: Test terminated by assertion
>>>>             FAIL  global.check_tmpfs_mmap
>>>> not ok 5 global.check_tmpfs_mmap
>>>> FAILED: 4 / 5 tests passed
>>>> "
>>>>
>>>> The reason for the test case failure is that my system automatically
>>>> enabled
>>>> tmpfs large folio allocation by adding the
>>>> 'transparent_hugepage_tmpfs=always'
>>>> cmdline. However, the test case still expects the tmpfs mounted on
>>>> /dev/shm to
>>>> allocate small folios, which leads to assertion failures when
>>>> verifying readahead
>>>> pages.
>>>>
>>>> To fix this issue, remount tmpfs to a new test directory and set the
>>>> 'huge=never'
>>>> parameter to avoid allocating large folios, which can pass the test.
>>>>
>>>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>>>> ---
>>>>    .../selftests/mincore/mincore_selftest.c      | 25 
>>>> +++++++++++++++++--
>>>>    1 file changed, 23 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/tools/testing/selftests/mincore/mincore_selftest.c
>>>> b/tools/testing/selftests/mincore/mincore_selftest.c
>>>> index e949a43a6145..e8d7a3a4739f 100644
>>>> --- a/tools/testing/selftests/mincore/mincore_selftest.c
>>>> +++ b/tools/testing/selftests/mincore/mincore_selftest.c
>>>> @@ -12,6 +12,7 @@
>>>>    #include <unistd.h>
>>>>    #include <stdlib.h>
>>>>    #include <sys/mman.h>
>>>> +#include <sys/mount.h>
>>>>    #include <string.h>
>>>>    #include <fcntl.h>
>>>> @@ -283,7 +284,7 @@ TEST(check_file_mmap)
>>>>        free(vec);
>>>>    }
>>>> -
>>>> +#define INPUT_MAX 80
>>>>    /*
>>>>     * Test mincore() behavior on a page backed by a tmpfs file.  
>>>> This test
>>>>     * performs the same steps as the previous one. However, we don't
>>>> expect
>>>> @@ -291,6 +292,9 @@ TEST(check_file_mmap)
>>>>     */
>>>>    TEST(check_tmpfs_mmap)
>>>>    {
>>>> +    char tmpfs_template[] = "/tmp/check_tmpfs_XXXXXX";
>>>> +    const char *tmpfs_loc = mkdtemp(tmpfs_template);
>>>> +    char testfile[INPUT_MAX];
>>>>        unsigned char *vec;
>>>>        int vec_size;
>>>>        char *addr;
>>>> @@ -300,6 +304,10 @@ TEST(check_tmpfs_mmap)
>>>>        int i;
>>>>        int ra_pages = 0;
>>>> +    ASSERT_NE(NULL, tmpfs_loc) {
>>>> +        TH_LOG("Can't mkdir tmpfs dentry\n");
>>>> +    }
>>>> +
>>>>        page_size = sysconf(_SC_PAGESIZE);
>>>>        vec_size = FILE_SIZE / page_size;
>>>>        if (FILE_SIZE % page_size)
>>>> @@ -311,7 +319,18 @@ TEST(check_tmpfs_mmap)
>>>>        }
>>>>        errno = 0;
>>>> -    fd = open("/dev/shm", O_TMPFILE | O_RDWR, 0600);
>>>> +    /* Do not use large folios for tmpfs mincore testing */
>>>> +    retval = mount("tmpfs", tmpfs_loc, "tmpfs", 0,
>>>> "huge=never,size=4M");
>>>> +    ASSERT_EQ(0, retval) {
>>>> +        TH_LOG("Unable to mount tmpfs for testing\n");
>>>> +    }
>>>> +
>>>> +    retval = snprintf(testfile, INPUT_MAX, "%s/test_file", tmpfs_loc);
>>>> +    ASSERT_GE(INPUT_MAX, retval) {
>>>> +        TH_LOG("Unable to create a tmpfs for testing\n");
>>>> +    }
>>>> +
>>>> +    fd = open(testfile, O_CREAT|O_RDWR, 0664);
>>>>        ASSERT_NE(-1, fd) {
>>>>            TH_LOG("Can't create temporary file: %s",
>>>>                strerror(errno));
>>>> @@ -363,6 +382,8 @@ TEST(check_tmpfs_mmap)
>>>>        munmap(addr, FILE_SIZE);
>>>>        close(fd);
>>>>        free(vec);
>>>> +    umount(tmpfs_loc);
>>>> +    rmdir(tmpfs_loc);
>>>>    }
>>>>    TEST_HARNESS_MAIN
>>>
>>> Is there anything that cleans up the mount in case something goes wrong
>>> (we run into an assertion), or will the directory+mount stick around
>>> forever?
>>
>> Good point, will cleanup the mount in the next version.
>>
>>>
>>> But I also wonder whether check_tmpfs_mmap() should be changed to live
>>> with the fact that readahead ("faultaround") could now happen. What's
>>> the reason for not doing that?
>>
>>   From this test case's description, it doesn't expect any readahead.
> 
> Yes, but why are we testing for that *at all*? We don't make such 
> assumptions/tests for anon memmory ("no faultaround happened").
> 
> Why not simply remove the "We expect only that page to be fetched into 
> memory." documentation + checking?

OK. I'm fine with dropping the readahead check. Thanks.
