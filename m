Received: from sxb1plsmtpa01-14.prod.sxb1.secureserver.net (sxb1plsmtpa01-14.prod.sxb1.secureserver.net [92.204.81.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C191E1DB124
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 23:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.204.81.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747782326; cv=none; b=pSVQbyiKbaxT/vEYEIiATeG6iOhKVICnv9Ito2dB35gkcDQfGgIrR4kuKE05p18WyebS/cNtw6E13PfL7pQS6TkqY9ja0iP69pRBlq28cahsfkS5hfLr4BaPQRawCzRiCmwVwujjYsB0Q1gM565iDKjM411ZDVRXLCleTg+y5fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747782326; c=relaxed/simple;
	bh=BRuhdr5tVsHYPVxgsgfcnDBAArK6CdrX6ja85k5r5PE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VTxNsI5F2Kxa0pxNXjx+6FK/awg1RgF4tgWVwoeg/OIlhWMlFOMKCupaoIMZLwpHe4moFzDUxcC6vnQ+Ttzw2NSfzIShlA94gfMfTtCBfuWk0eZHaiWu2XW1eZE1aX+E32HlPzk13gut1/W+AZgLiKTY6YzmXJatVWNPZackb/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squashfs.org.uk; spf=pass smtp.mailfrom=squashfs.org.uk; arc=none smtp.client-ip=92.204.81.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Received: from [192.168.178.95] ([82.69.79.175])
	by :SMTPAUTH: with ESMTPSA
	id HVisu1fVOc0xeHViuumg1S; Tue, 20 May 2025 15:46:13 -0700
X-CMAE-Analysis: v=2.4 cv=EdjIQOmC c=1 sm=1 tr=0 ts=682d0636
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=IkcTkHD0fZMA:10 a=57SyGIRnAAAA:8 a=F8v1yU81VWNR6WkcbFIA:9 a=QEXdDO2ut3YA:10
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
Message-ID: <cc8a035e-f4ad-49ba-9d00-4635e319bc83@squashfs.org.uk>
Date: Tue, 20 May 2025 23:45:00 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] squashfs: Add optional full compressed block caching
To: Chanho Min <chanho.min@lge.com>
Cc: linux-kernel@vger.kernel.org, gunho.lee@lge.com
References: <20250502081947.44034-1-chanho.min@lge.com>
Content-Language: en-US
From: Phillip Lougher <phillip@squashfs.org.uk>
In-Reply-To: <20250502081947.44034-1-chanho.min@lge.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfDRQNSwqLeESSCq8nzo+Ev+TRVx9I2RtSxhbk+O9/bfbENW3azpBM/RRthT0W7vC0lQoUzVaz77FcWiF2DlyhOqTstFxz4OA9GE4r2/cUSxXLgM7exLb
 3vK0n+2FnAkYseAjcSjcGHhEsOFCgpLjQynCQh9eIBwC8gQ4agR8otJoSdmQupKQ4Y3E2RS3KWeHT9HqZ6tYzMC4F3vWQEZji+Nehm6gflkxoebOtze1X8Dw
 SsrCHnGh9ApD8ZnIr40ia6ffykYUPtT0VderiD8zcwc=

On 02/05/2025 09:19, Chanho Min wrote:
> The commit 93e72b3c612adcaca1("squashfs: migrate from ll_rw_block usage to BIO")
> removed caching of compressed blocks in SquashFS, causing fio performance
> regression in workloads with repeated file reads. Without caching, every read

Please run scripts/checkpatch.pl on your patch.  It complains that the above
line is over 75 characters in length.

It also complains of DOS line endings.

> triggers disk I/O, severely impacting performance in tools like fio.
> 
> This patch introduces a new CONFIG_SQUASHFS_COMP_CACHE_FULL Kconfig option to
> enable caching of all compressed blocks, restoring performance to pre-BIO
> migration levels. When enabled, all pages in a BIO are cached in the page
> cache, reducing disk I/O for repeated reads. The fio test results with this
> patch confirm the performance restoration:
> 
> For example, fio tests (iodepth=1, numjobs=1, 
> ioengine=psync) show a notable performance restoration:
> 
> Disable CONFIG_SQUASHFS_COMP_CACHE_FULL:
>    IOPS=815, BW=102MiB/s (107MB/s)(6113MiB/60001msec)
> Enable CONFIG_SQUASHFS_COMP_CACHE_FULL:
>    IOPS=2223, BW=278MiB/s (291MB/s)(16.3GiB/59999msec)
> 
> The trade-off is increased memory usage due to caching all compressed blocks.
> The CONFIG_SQUASHFS_COMP_CACHE_FULL option allows users to enable this feature
> selectively, balancing performance and memory usage for workloads with frequent
> repeated reads.
> 
> Signed-off-by: Chanho Min <chanho.min@lge.com>
> ---
>   fs/squashfs/Kconfig | 21 +++++++++++++++++++++
>   fs/squashfs/block.c | 28 ++++++++++++++++++++++++++++
>   2 files changed, 49 insertions(+)
> 
> diff --git a/fs/squashfs/Kconfig b/fs/squashfs/Kconfig
> index 60fc98bdf421..cc5e4be58afa 100644
> --- a/fs/squashfs/Kconfig
> +++ b/fs/squashfs/Kconfig
> @@ -149,6 +149,27 @@ config SQUASHFS_XATTR
>   
>   	  If unsure, say N.
>   
> +config SQUASHFS_COMP_CACHE_FULL
> +	bool "Enable full caching of compressed blocks"
> +	depends on SQUASHFS
> +	default n
> +	help
> +	  This option enables caching of all compressed blocks, Without caching,
> +	  repeated reads of the same files trigger excessive disk I/O, significantly
> +	  reducinng performance in workloads like fio-based benchmarks.
> +
> +	  For example, fio tests (iodepth=1, numjobs=1, ioengine=psync) show:
> +	   Without caching: IOPS=2223, BW=278MiB/s (291MB/s)
> +	   With caching:    IOPS=815, BW=102MiB/s (107MB/s)
> +

I think the figures for caching and without caching are transposed above.

Apart from that the patch looks good.

Please send a V2 fixing the above.

Thanks

Phillip

