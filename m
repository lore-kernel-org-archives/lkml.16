Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D84691AC44D
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 10:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745835820; cv=none; b=JwrBHQhhXxy/QXYzHat564O9F3NRDPgodncKaeKMwwG2dfOJ1itROOYAkudAboIwgItZv/DDP77y3JDRbtmcwem6nSbBHbM2mVgRcbtxC45mpOUXc6CFneUfNp970qsi+dvfpaK/YX9beSVp3WVo/J8UNHOkcniY+YVA1pniowo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745835820; c=relaxed/simple;
	bh=VvqfnSYSI+u9mgJBtP5Bos4sR0waRhV6DE0yqdFGNVQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EkSGLzvKyrW99/l0BLVHLnzdyhcJNqppnX/dZUny3RdqR3FsmoZsYo8bVUVKL3hEpkgsV/+QAOSI2VLOYORBMbP9HnSyCy1dcvU5unLMhlHHBRzQWRqeSqKm0HIjQN2hcpPlA4e01xKSVKu5WM869grAzH7I/JouWuv79tQaRtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D1991515;
	Mon, 28 Apr 2025 03:23:31 -0700 (PDT)
Received: from [10.57.90.155] (unknown [10.57.90.155])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C9873F66E;
	Mon, 28 Apr 2025 03:23:36 -0700 (PDT)
Message-ID: <9f1cd31f-8e85-4ae6-9fa5-85db7a96d2fe@arm.com>
Date: Mon, 28 Apr 2025 11:23:35 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/testing/selftests: fix guard region test tmpfs
 assumption
Content-Language: en-GB
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250425162436.564002-1-lorenzo.stoakes@oracle.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250425162436.564002-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/04/2025 17:24, Lorenzo Stoakes wrote:
> The current implementation of the guard region tests assume that /tmp is
> mounted as tmpfs, that is shmem.
> 
> This isn't always the case, and at least one instance of a spurious test
> failure has been reported as a result.
> 
> This assumption is unsafe, rushed and silly - and easily remedied by simply
> using memfd, so do so.
> 
> We also have to fixup the readonly_file test to explicitly only be
> applicable to file-backed cases.
> 
> Reported-by: Ryan Roberts <ryan.roberts@arm.com>
> Closes: https://lore.kernel.org/linux-mm/a2d2766b-0ab4-437b-951a-8595a7506fe9@arm.com/
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

> ---
>  tools/testing/selftests/mm/guard-regions.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/guard-regions.c b/tools/testing/selftests/mm/guard-regions.c
> index c39dd26c47a3..0cd9d236649d 100644
> --- a/tools/testing/selftests/mm/guard-regions.c
> +++ b/tools/testing/selftests/mm/guard-regions.c
> @@ -272,12 +272,16 @@ FIXTURE_SETUP(guard_regions)
>  	self->page_size = (unsigned long)sysconf(_SC_PAGESIZE);
>  	setup_sighandler();
>  
> -	if (variant->backing == ANON_BACKED)
> +	switch (variant->backing) {
> +	case ANON_BACKED:
>  		return;
> -
> -	self->fd = open_file(
> -		variant->backing == SHMEM_BACKED ? "/tmp/" : "",
> -		self->path);
> +	case LOCAL_FILE_BACKED:
> +		self->fd = open_file("", self->path);
> +		break;
> +	case SHMEM_BACKED:
> +		self->fd = memfd_create(self->path, 0);
> +		break;
> +	}
>  
>  	/* We truncate file to at least 100 pages, tests can modify as needed. */
>  	ASSERT_EQ(ftruncate(self->fd, 100 * self->page_size), 0);
> @@ -1697,7 +1701,7 @@ TEST_F(guard_regions, readonly_file)
>  	char *ptr;
>  	int i;
>  
> -	if (variant->backing == ANON_BACKED)
> +	if (variant->backing != LOCAL_FILE_BACKED)
>  		SKIP(return, "Read-only test specific to file-backed");
>  
>  	/* Map shared so we can populate with pattern, populate it, unmap. */

