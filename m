Received: from sxb1plsmtpa01-02.prod.sxb1.secureserver.net (sxb1plsmtpa01-02.prod.sxb1.secureserver.net [188.121.53.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858901EB9E1
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 16:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.121.53.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747843796; cv=none; b=BB8oRhJirFtTOk0RCSr+24hI3ksLOYPCoBchB3efL4i7OQpsf0kz9rpFR/VVLuO/5Ss4K4nac5aNiIfB7tUe0BDuNsWlQxNbnbdY6n7RFX/MV0pgjVtxjhj+yfxpX8Ns9Hr6Yh/rLZSMZWfHk9dXeKJZgVSGcszcJ4pS4d/KrHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747843796; c=relaxed/simple;
	bh=67pFqOn0n4JWDPy3pKhcLEu/WYlSdJPjjueKZ/8Mihg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fSYVQJENJ+MjRXf018dai9ugAylUGFu/d02anBzXhHeVYyXAlyuAS1llP81OyxReUpy4czfUFKtJqSfbggLH8h32BXRcGZ648nVqSRilz3m8yyXu08hRtxaCLGljUUfpqUVe1bw8hLlEMHkkgHMFCG+31bKIwK2jYoCpUEkX6Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squashfs.org.uk; spf=pass smtp.mailfrom=squashfs.org.uk; arc=none smtp.client-ip=188.121.53.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Received: from [192.168.178.95] ([82.69.79.175])
	by :SMTPAUTH: with ESMTPSA
	id HliLuFR8dwQeMHliNu1Eob; Wed, 21 May 2025 08:50:44 -0700
X-CMAE-Analysis: v=2.4 cv=CdAI5Krl c=1 sm=1 tr=0 ts=682df655
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=IkcTkHD0fZMA:10 a=57SyGIRnAAAA:8 a=FXvPX3liAAAA:8 a=K-6_8eHT4SvIFsRQ-g0A:9
 a=QEXdDO2ut3YA:10 a=UObqyxdv-6Yh2QiB9mM_:22
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
Message-ID: <b6dfcc79-f542-474a-bcc6-4e24a1189a07@squashfs.org.uk>
Date: Wed, 21 May 2025 16:49:30 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] squashfs: Add optional full compressed block caching
To: Chanho Min <chanho.min@lge.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, gunho.lee@lge.com
References: <20250521072559.2389-1-chanho.min@lge.com>
Content-Language: en-US
From: Phillip Lougher <phillip@squashfs.org.uk>
In-Reply-To: <20250521072559.2389-1-chanho.min@lge.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfPaFX26XYVN4qUL6D0uwjZzwkZ3eixA4CIKPcc105JPuC2CmI5IrdUHS8Wmo+PHQON+9cbGm6tdd5hsla54tzWc/9mUWBnAyJuanbmoDD7g0ixhK35BH
 0SUwWtZENKVzfc81e80FHNKTs0pMzk9t109TcfYh8dfATF/GDPkz13HPyL03pd2z+F7x+kbvSqhTgYlR2kUhy1IZ8sF64iblI08OmLeVa/5bQdQTB0osd+5S
 QPVhcMYrhqvL1/hbD7R3Z88gHxAbw1o/EQYT7z57YXgpe4btHYm4IpXYNc5LMbpcrgVewvugfg++RZ8QA6BNCw==



On 21/05/2025 08:25, Chanho Min wrote:
> The commit 93e72b3c612adcaca1 ("squashfs: migrate from ll_rw_block usage to
> BIO") removed caching of compressed blocks in SquashFS, causing fio
> performance regression in workloads with repeated file reads. Without
> caching, every read triggers disk I/O, severely impacting performance in
> tools like fio.
> 
> This patch introduces a new CONFIG_SQUASHFS_COMP_CACHE_FULL Kconfig option
> to enable caching of all compressed blocks, restoring performance to
> pre-BIO migration levels. When enabled, all pages in a BIO are cached in
> the page cache, reducing disk I/O for repeated reads. The fio test results
> with this patch confirm the performance restoration:
> 
> For example, fio tests (iodepth=1, numjobs=1,
> ioengine=psync) show a notable performance restoration:
> 
> Disable CONFIG_SQUASHFS_COMP_CACHE_FULL:
>    IOPS=815, BW=102MiB/s (107MB/s)(6113MiB/60001msec)
> Enable CONFIG_SQUASHFS_COMP_CACHE_FULL:
>    IOPS=2223, BW=278MiB/s (291MB/s)(16.3GiB/59999msec)
> 
> The trade-off is increased memory usage due to caching all compressed
> blocks. The CONFIG_SQUASHFS_COMP_CACHE_FULL option allows users to enable
> this feature selectively, balancing performance and memory usage for
> workloads with frequent repeated reads.
> 
> Signed-off-by: Chanho Min <chanho.min@lge.com>

Patch looks good, and I like the fact it is optional.

Reviewed-by Phillip Lougher <phillip@squashfs.org.uk>

