Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A811FAA
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 03:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747626874; cv=none; b=K3AcWFrEgIr3i/eXJb//iOPKKeKNUArgOO93VyP6sj9wBEcph9QLMbHo8mjTELEnyC+coLnYW+9iL26SxgDvBd+STUY7TcmI6ImNkxuXEEFV7VK7clV4voN10CnRSYt4CKZPjXDQyiQ9+S6gx/hdN2mqLq8mZvYCndE8ZfaOLLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747626874; c=relaxed/simple;
	bh=bwGkZr4Chd/Kt6Yei9NegjbH4WXfuh+5CMBT2YhepHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GvoLzKl+UJL/qNn3eJbdATF21LqPWJTLf0D5kVU7VKIIeewz4G5f+i29ozSKVdEV1OuZdaIZZ6Fxx7LVlIaHSwCeSWsw/i4xQWYKO86Jcxewupig3vh8K8B/krj7ASnD5T+LdboS5azyTcl5puBRz+FKsjdbegtsPFjp1DkF9c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UlVJ2Ndr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UlVJ2Ndr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8560C4CEE4;
	Mon, 19 May 2025 03:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747626873;
	bh=bwGkZr4Chd/Kt6Yei9NegjbH4WXfuh+5CMBT2YhepHw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UlVJ2NdrdPCWf+GkB/5Oa1wjn4J5ewiH6Z5LkgQ6UAb4+wEyIG1hZZDot2MhzdpAE
	 QblrLQr719nk/YWf8DjoF8j8TI+d7pzkCZcRDNByBrpWYDP4crSibeYesr5r/l48R0
	 6k4RUiLcpWAPe1aawpJm8q021EU9GsaJJ6I9UayKZQLyCvunbIb5nZynXnrCLr+3bK
	 QAM487GOhoY6S+3o05IWbwS5RUdvbLmv9nbB8dnF1KLch5goI1gGDnwYO8Ln7XC7N7
	 45Vprvp2YPGqjK29x7dhyS4VuUmH/I9ytty+FWTs1QmGkydmNP3t+xjBI9T0dO+/Sc
	 ApvpYMxPF1ypQ==
Date: Mon, 19 May 2025 11:54:25 +0800
From: Gao Xiang <xiang@kernel.org>
To: Sheng Yong <shengyong2021@gmail.com>
Cc: hsiangkao@linux.alibaba.com, chao@kernel.org, zbestahu@gmail.com,
	jefflexu@linux.alibaba.com, dhavale@google.com,
	lihongbo22@huawei.com, linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, Sheng Yong <shengyong1@xiaomi.com>,
	Wang Shuai <wangshuai12@xiaomi.com>
Subject: Re: [PATCH v7] erofs: add 'fsoffset' mount option to specify
 filesystem offset
Message-ID: <aCqrceu67F3rh3JM@debian>
Mail-Followup-To: Sheng Yong <shengyong2021@gmail.com>,
	hsiangkao@linux.alibaba.com, chao@kernel.org, zbestahu@gmail.com,
	jefflexu@linux.alibaba.com, dhavale@google.com,
	lihongbo22@huawei.com, linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, Sheng Yong <shengyong1@xiaomi.com>,
	Wang Shuai <wangshuai12@xiaomi.com>
References: <20250517090544.2687651-1-shengyong1@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250517090544.2687651-1-shengyong1@xiaomi.com>

Hi Yong,

On Sat, May 17, 2025 at 05:05:43PM +0800, Sheng Yong wrote:
> From: Sheng Yong <shengyong1@xiaomi.com>
> 
> When attempting to use an archive file, such as APEX on android,
> as a file-backed mount source, it fails because EROFS image within
> the archive file does not start at offset 0. As a result, a loop
> or a dm device is still needed to attach the image file at an
> appropriate offset first. Similarly, if an EROFS image within a
> block device does not start at offset 0, it cannot be mounted
> directly either.
> 
> To address this issue, this patch adds a new mount option `fsoffset=x'
> to accept a start offset for the primary device. The offset should be
> aligned to the block size. EROFS will add this offset before performing
> read requests.
> 
> Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
> Signed-off-by: Wang Shuai <wangshuai12@xiaomi.com>

I applied the following diff to fulfill the Hongbo's previous suggestion
and refine an error message:

diff --git a/Documentation/filesystems/erofs.rst b/Documentation/filesystems/erofs.rst
index 11b0f8635f04..d93b30287110 100644
--- a/Documentation/filesystems/erofs.rst
+++ b/Documentation/filesystems/erofs.rst
@@ -128,7 +128,7 @@ device=%s              Specify a path to an extra device to be used together.
 fsid=%s                Specify a filesystem image ID for Fscache back-end.
 domain_id=%s           Specify a domain ID in fscache mode so that different images
                        with the same blobs under a given domain ID can share storage.
-fsoffset=%lu           Specify image offset for the primary device.
+fsoffset=%lu           Specify block-aligned filesystem offset for the primary device.
 ===================    =========================================================
 
 Sysfs Entries
diff --git a/fs/erofs/super.c b/fs/erofs/super.c
index 3185bb90f549..e1e9f06e8342 100644
--- a/fs/erofs/super.c
+++ b/fs/erofs/super.c
@@ -654,9 +654,9 @@ static int erofs_fc_fill_super(struct super_block *sb, struct fs_context *fc)
 	}
 
 	if (sbi->dif0.fsoff) {
-		if (sbi->dif0.fsoff & ((1 << sbi->blkszbits) - 1))
-			return invalfc(fc, "fsoffset %llu not aligned to block size",
-				       sbi->dif0.fsoff);
+		if (sbi->dif0.fsoff & (sb->s_blocksize - 1))
+			return invalfc(fc, "fsoffset %llu is not aligned to block size %lu",
+				       sbi->dif0.fsoff, sb->s_blocksize);
 		if (erofs_is_fscache_mode(sb))
 			return invalfc(fc, "cannot use fsoffset in fscache mode");
 	}
