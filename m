Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B451DB92A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 12:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743512095; cv=none; b=clAs+buJ1Q9/G80rc30Ex1xTiediMegWP9uJD7RrA90CpNY/v7DJGkGP4+7vF52H79/O7ZIHnANFQvMhndNNWeFF4JmK1FwT2jKcaq/xZZN/TqDiGgFqV/BwbY/35jHxLz2IH7e7SMYJyjMU3r/q1AalDDRbrTMhus2z/HpObsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743512095; c=relaxed/simple;
	bh=+y60uR+/R4/3Te/hglq4N1Os5mmj7tJJsJcIUWPtVrk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q05l74yozNAjB4ykpV/QTfft6fwArMkM9y17s8yp0S72F0pNJauaW+rllwHxWcJ/sONBewLrohTa/58pZFjUTQ3cXcznEetYd6pzj+YH4f8IIb1DsXbfTTfCtbKchCduAKD2jItyVADHZepXs849/qWKQLsb/0PVRhLHKv2Toik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i6kFSByN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i6kFSByN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743512092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ZCezogCNrMmwMPx9aa1kcQuDJTY1ROtbKk6kHVdtn8s=;
	b=i6kFSByN5ddz+ZzBya1SabcPK1uDVB/XPWT1tVinW+H1Bj4EKX8/rdwrgyUqKaaAQ4up+k
	qZ/6IJfY/Rnx+H6Hp6jrv5C2ViR9Rbn30DdQiAlkTbotmsaPro+6rKaa0xYuhGuw8R2gEt
	iOV+Jx5G9sQd0k0ofPow430mtkxUfYQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-468-DpPP_r9CMIOak-8_AQk4Tg-1; Tue, 01 Apr 2025 08:54:50 -0400
X-MC-Unique: DpPP_r9CMIOak-8_AQk4Tg-1
X-Mimecast-MFC-AGG-ID: DpPP_r9CMIOak-8_AQk4Tg_1743512090
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3914608e90eso3902909f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 05:54:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743512089; x=1744116889;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZCezogCNrMmwMPx9aa1kcQuDJTY1ROtbKk6kHVdtn8s=;
        b=Cb4oV26xnvqDZUxvasH7K8AnYfWOUvUCGXtCfFiewWp5bhnW8BMzjInVXHY26Qkoqf
         yQvagw8Az64WkvUQKrhL0keN/XynXI+8HJo63CX3GBiuK1eNK+FluDZa1/mED3JiBBWU
         R6HPL/cufFVLrpYsHQidx2QjzyXVrr6sHPLWJ0qdFVT94/s/deowaTYvwfgN6pT9LkNt
         ie20qEJd5Dc1qWuK7kAhkKjfUyGvZjWhtADINlY6xs+n5k59Sm+VdueLN0xjtfMTUAjp
         ii815mO/DCjjBuv+ezFVc70HI+9Tupt1/QTjPm6Zc3DMxydRZnCQOpXWuFOBhaofSoGE
         N+lw==
X-Forwarded-Encrypted: i=1; AJvYcCWB1LKbhIQxHUha5ZTtlYpaTPwxsln52FH9NuQxn7xQedka4QNVye/D7z75IF5uEmRsSuqssW4b607hQmo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjNbSXon/lBldljgdSyclljx30I99s4Bv2TZIjnak2QxWd/svS
	bWlVHrMYpfoEDntvaj/3W4KqXkpzvqorJ1OkGX6C+mUmtsn+XT9cqaGs4XuDg5TW+ZWv5Q9YUFT
	Rw9QFeHJpQ7jfazBLVKxCiuf18+AQEGHT9Um0WLL5pDgj3NmVgDQr2CeECb9j1A==
X-Gm-Gg: ASbGncsZHCVledZRuhYHqcsn4nEwJjvJzrIxJxdzkN2EsAFsfBbEhh7fGngXx4UYWZJ
	2sSjHc22jVwFSelzscYoer4AA/YyHkFDfPdq81bS5hMy0OQ3eQ2wwIVBsz0HSKCG3ecuZFJSp/3
	nHlZHyvTeERtQ7NkH2uqKn5Jc93c3QqdMqpffqAfhJWf79rAXC++124alT5MMk8XpvKDfg3I8qw
	PAJ5+9cH5kyyZS5e/nT3cvFTUeMeO04QMD1e64pYrEz7QJl2d5K63v3dn2OjJRnOazvSkeUjrmL
	LRgXGIqOZxKv32JWh4fUM8+ZBn41Pyzp4bzrZ1ocV/zpOiGUwhPW5XoQKM2Cxg/xM80ena2ZYoz
	qHItXc/CJdE40j4sh1Ep06+jmAzKRAEXQ4GD3amPb
X-Received: by 2002:a05:6000:43ca:b0:391:3915:cffb with SMTP id ffacd0b85a97d-39c12118faamr7549122f8f.43.1743512089537;
        Tue, 01 Apr 2025 05:54:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFssbG/vj8WQ5NMkHhiKZnB1/Lz8eS1rw4uNfk4+oMXgQXxMwvkbHI6ny0XVKwQj9Hb7NwcFQ==
X-Received: by 2002:a05:6000:43ca:b0:391:3915:cffb with SMTP id ffacd0b85a97d-39c12118faamr7549105f8f.43.1743512089125;
        Tue, 01 Apr 2025 05:54:49 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:4d00:6ac5:30d:1611:918f? (p200300cbc7074d006ac5030d1611918f.dip0.t-ipconnect.de. [2003:cb:c707:4d00:6ac5:30d:1611:918f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b79e393sm14261851f8f.72.2025.04.01.05.54.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 05:54:48 -0700 (PDT)
Message-ID: <9000c5c1-34be-4bc9-b1c0-11548264eaa6@redhat.com>
Date: Tue, 1 Apr 2025 14:54:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] selftests: mincore: fix tmpfs mincore test failure
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 hughd@google.com
Cc: willy@infradead.org, 21cnbao@gmail.com, ryan.roberts@arm.com,
 ziy@nvidia.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <cover.1742960003.git.baolin.wang@linux.alibaba.com>
 <99a3e190d38b08a2b96ede952a29893bffdb3432.1742960003.git.baolin.wang@linux.alibaba.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <99a3e190d38b08a2b96ede952a29893bffdb3432.1742960003.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26.03.25 04:38, Baolin Wang wrote:
> When running mincore test cases, I encountered the following failures:
> 
> "
> mincore_selftest.c:359:check_tmpfs_mmap:Expected ra_pages (511) == 0 (0)
> mincore_selftest.c:360:check_tmpfs_mmap:Read-ahead pages found in memory
> check_tmpfs_mmap: Test terminated by assertion
>            FAIL  global.check_tmpfs_mmap
> not ok 5 global.check_tmpfs_mmap
> FAILED: 4 / 5 tests passed
> "
> 
> The reason for the test case failure is that my system automatically enabled
> tmpfs large folio allocation by adding the 'transparent_hugepage_tmpfs=always'
> cmdline. However, the test case still expects the tmpfs mounted on /dev/shm to
> allocate small folios, which leads to assertion failures when verifying readahead
> pages.
> 
> To fix this issue, remount tmpfs to a new test directory and set the 'huge=never'
> parameter to avoid allocating large folios, which can pass the test.
> 
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>   .../selftests/mincore/mincore_selftest.c      | 25 +++++++++++++++++--
>   1 file changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/mincore/mincore_selftest.c b/tools/testing/selftests/mincore/mincore_selftest.c
> index e949a43a6145..e8d7a3a4739f 100644
> --- a/tools/testing/selftests/mincore/mincore_selftest.c
> +++ b/tools/testing/selftests/mincore/mincore_selftest.c
> @@ -12,6 +12,7 @@
>   #include <unistd.h>
>   #include <stdlib.h>
>   #include <sys/mman.h>
> +#include <sys/mount.h>
>   #include <string.h>
>   #include <fcntl.h>
>   
> @@ -283,7 +284,7 @@ TEST(check_file_mmap)
>   	free(vec);
>   }
>   
> -
> +#define INPUT_MAX 80
>   /*
>    * Test mincore() behavior on a page backed by a tmpfs file.  This test
>    * performs the same steps as the previous one. However, we don't expect
> @@ -291,6 +292,9 @@ TEST(check_file_mmap)
>    */
>   TEST(check_tmpfs_mmap)
>   {
> +	char tmpfs_template[] = "/tmp/check_tmpfs_XXXXXX";
> +	const char *tmpfs_loc = mkdtemp(tmpfs_template);
> +	char testfile[INPUT_MAX];
>   	unsigned char *vec;
>   	int vec_size;
>   	char *addr;
> @@ -300,6 +304,10 @@ TEST(check_tmpfs_mmap)
>   	int i;
>   	int ra_pages = 0;
>   
> +	ASSERT_NE(NULL, tmpfs_loc) {
> +		TH_LOG("Can't mkdir tmpfs dentry\n");
> +	}
> +
>   	page_size = sysconf(_SC_PAGESIZE);
>   	vec_size = FILE_SIZE / page_size;
>   	if (FILE_SIZE % page_size)
> @@ -311,7 +319,18 @@ TEST(check_tmpfs_mmap)
>   	}
>   
>   	errno = 0;
> -	fd = open("/dev/shm", O_TMPFILE | O_RDWR, 0600);
> +	/* Do not use large folios for tmpfs mincore testing */
> +	retval = mount("tmpfs", tmpfs_loc, "tmpfs", 0, "huge=never,size=4M");
> +	ASSERT_EQ(0, retval) {
> +		TH_LOG("Unable to mount tmpfs for testing\n");
> +	}
> +
> +	retval = snprintf(testfile, INPUT_MAX, "%s/test_file", tmpfs_loc);
> +	ASSERT_GE(INPUT_MAX, retval) {
> +		TH_LOG("Unable to create a tmpfs for testing\n");
> +	}
> +
> +	fd = open(testfile, O_CREAT|O_RDWR, 0664);
>   	ASSERT_NE(-1, fd) {
>   		TH_LOG("Can't create temporary file: %s",
>   			strerror(errno));
> @@ -363,6 +382,8 @@ TEST(check_tmpfs_mmap)
>   	munmap(addr, FILE_SIZE);
>   	close(fd);
>   	free(vec);
> +	umount(tmpfs_loc);
> +	rmdir(tmpfs_loc);
>   }
>   
>   TEST_HARNESS_MAIN

Is there anything that cleans up the mount in case something goes wrong 
(we run into an assertion), or will the directory+mount stick around 
forever?

But I also wonder whether check_tmpfs_mmap() should be changed to live 
with the fact that readahead ("faultaround") could now happen. What's 
the reason for not doing that?

-- 
Cheers,

David / dhildenb

