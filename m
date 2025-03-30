Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1D03C3C
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 19:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743364089; cv=none; b=ENs+ZMD9wNmS4XI2MExvoXc2+bnsIJTKOh2d9w7svsIwYqadHt/f0tPehs0BIpn8BZKA1k8J6v5jf6exIxFh42XQ1lW79LSZfJpLIbgK4PiyjFgu0HZEcCqGslZVbOIuH7AwcHc3U+ibCcnz8OAE4ZPqiV2BX4gptZ2UBYBsS7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743364089; c=relaxed/simple;
	bh=nrSbxI48IAclbtJFnjg8dhUE12hsmgBGZU//qhJI7+U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y2Bc6PF4D01nZzYcpp2peaBHjR8VGpQqufPz2ypv7ntf5y1dsZVIvgrXC9e+PfOR+KkuBHl/7GcfOkGgGu6tQHWTp/AIvOs9AEgCIMuxaLi55ojv8Hh29CVJ/TaUsppv2X3LnWbclvGbBolpA5S86Kku/8NqjXTWyCqCHvOm0uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=XuYXYLLT; arc=none smtp.client-ip=115.124.30.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="XuYXYLLT"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1743364076; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=hDzgxzm6+nnwBoWRdISKTCyqXH05hjRnwQePjY0a93Y=;
	b=XuYXYLLT/9PxbVh0GbmYPNqL3y0ZQ5DPhJvFPlqPEKn09sibpmlVr+i56AmmETgx98MspBYXvEzLZVYKFAWVBrEXcJlm4Y+UAcAQsemtX2I+vW9GXMh7EYoHldDOYgTwK7a6ssp4dJm5kvdRC53H2/OlDB32+ar9JDjcAPypm8Y=
Received: from 30.58.211.89(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WTNbr6D_1743364070 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 31 Mar 2025 03:47:55 +0800
Message-ID: <b5dd6494-b636-4742-8d96-d8b888d6b9c8@linux.alibaba.com>
Date: Sun, 30 Mar 2025 20:47:48 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] selftests: mincore: fix tmpfs mincore test failure
To: Zi Yan <ziy@nvidia.com>
Cc: akpm@linux-foundation.org, hughd@google.com, willy@infradead.org,
 david@redhat.com, 21cnbao@gmail.com, ryan.roberts@arm.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <cover.1742960003.git.baolin.wang@linux.alibaba.com>
 <99a3e190d38b08a2b96ede952a29893bffdb3432.1742960003.git.baolin.wang@linux.alibaba.com>
 <992DD536-7047-4C2C-97EB-7F23100143E3@nvidia.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <992DD536-7047-4C2C-97EB-7F23100143E3@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/3/27 22:36, Zi Yan wrote:
> On 25 Mar 2025, at 23:38, Baolin Wang wrote:
> 
>> When running mincore test cases, I encountered the following failures:
>>
>> "
>> mincore_selftest.c:359:check_tmpfs_mmap:Expected ra_pages (511) == 0 (0)
>> mincore_selftest.c:360:check_tmpfs_mmap:Read-ahead pages found in memory
>> check_tmpfs_mmap: Test terminated by assertion
>>            FAIL  global.check_tmpfs_mmap
>> not ok 5 global.check_tmpfs_mmap
>> FAILED: 4 / 5 tests passed
>> "
>>
>> The reason for the test case failure is that my system automatically enabled
>> tmpfs large folio allocation by adding the 'transparent_hugepage_tmpfs=always'
>> cmdline. However, the test case still expects the tmpfs mounted on /dev/shm to
>> allocate small folios, which leads to assertion failures when verifying readahead
>> pages.
>>
>> To fix this issue, remount tmpfs to a new test directory and set the 'huge=never'
>> parameter to avoid allocating large folios, which can pass the test.
>>
>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>> ---
>>   .../selftests/mincore/mincore_selftest.c      | 25 +++++++++++++++++--
>>   1 file changed, 23 insertions(+), 2 deletions(-)
>>
> 
> <snip>
> 
>>
>>   	errno = 0;
>> -	fd = open("/dev/shm", O_TMPFILE | O_RDWR, 0600);
>> +	/* Do not use large folios for tmpfs mincore testing */
>> +	retval = mount("tmpfs", tmpfs_loc, "tmpfs", 0, "huge=never,size=4M");
>> +	ASSERT_EQ(0, retval) {
>> +		TH_LOG("Unable to mount tmpfs for testing\n");
>> +	}
>> +
>> +	retval = snprintf(testfile, INPUT_MAX, "%s/test_file", tmpfs_loc);
>> +	ASSERT_GE(INPUT_MAX, retval) {
>> +		TH_LOG("Unable to create a tmpfs for testing\n");
>> +	}
>> +
>> +	fd = open(testfile, O_CREAT|O_RDWR, 0664);
> 
> The fd permission is changed from 0600 to 0664, but it probably does not
> matter.

It is just a temp file, so it doesn't matter.

> 
>>   	ASSERT_NE(-1, fd) {
>>   		TH_LOG("Can't create temporary file: %s",
>>   			strerror(errno));
>> @@ -363,6 +382,8 @@ TEST(check_tmpfs_mmap)
>>   	munmap(addr, FILE_SIZE);
>>   	close(fd);
>>   	free(vec);
>> +	umount(tmpfs_loc);
>> +	rmdir(tmpfs_loc);
>>   }
>>
>>   TEST_HARNESS_MAIN
>> -- 
>> 2.43.5
> 
> Otherwise, LGTM. Reviewed-by: Zi Yan <ziy@nvidia.com>

Thanks for reviewing.
