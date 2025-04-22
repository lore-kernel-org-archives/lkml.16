Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C171F1507
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 13:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745329832; cv=none; b=kt69vOX5Dl8HshKMscPAmB8q79cRy1MJ8m7Rv1EowjGjvHRwI6QkKbaCIWZoobCECM4Fuqt8mifsTaa5GVxFlK6xGjB1QXLICRTz20czbSAmBrpMAATPSlJbvN16z5zTVgK/uRw0gi7KuU0RMFsiQw+pOcPog0hov8u8grCv+Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745329832; c=relaxed/simple;
	bh=a9IfWynggkzTrMNSQ/TDwDmpBShlC99pCGuFHjJh4/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CVYQ0VAQOzzsoFywwDN4OlMTlfM7kSwBLxeHO28EBfArNAIFwdR8Egk7HFOufAoVJjkFS+SeLL2o+3IDAnnX6FxM4jvhlLYfIIPi51TTfIgQ4dZLPWNHKyPXCTYdasNb+myz3Gw93VP7Z4vHs6MwnNJcJDwLvze7QGwS3Goy5hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=UVeXUCEx; arc=none smtp.client-ip=115.124.30.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="UVeXUCEx"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1745329821; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=qhmm0QWcIXPBwHsw9YCmGO/a752w/KBDrSHiA+BX6mw=;
	b=UVeXUCExw+XBr+FUwI89+xG3/YpAOw9083+SG/BXuhW9gb3b3DjeHr9bwYhuVsgGxP7NbF4fwi55gGd4AZ5LYI9+fzVARq0AjBVwBCMRlwf8rS6uAq8wHtrIVjJu40rokOvC7s8ZnACePZ2Y6sizSC6IrtDgGdGdzXiftz5kD80=
Received: from 30.134.100.0(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0WXp3p7I_1745329820 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 22 Apr 2025 21:50:21 +0800
Message-ID: <2408568f-a9e6-4e32-83b2-e79aee83a55a@linux.alibaba.com>
Date: Tue, 22 Apr 2025 21:50:20 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/4] erofs-utils: Add --meta_fix and --meta_only
 format options
To: Hongbo Li <lihongbo22@huawei.com>, xiang@kernel.org, chao@kernel.org,
 huyue2@coolpad.com, jefflexu@linux.alibaba.com
Cc: linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20250422123612.261764-1-lihongbo22@huawei.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <20250422123612.261764-1-lihongbo22@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Hongbo,

On 2025/4/22 20:36, Hongbo Li wrote:
> In this patchset, we have added two formatting options --meta_fix and
> --meta_only to extend the ability of EROFS. In the case of using OBS,
> we can convert the directory tree structure from OBS into the erofs
> image and implement on-demand loading logic based on this. Since OBS
> objects are often large, we need to separate the metadata area from
> the data area, which is the reason we introduce the --meta_fix option.
> To accelerate the formatting process, we can skip the formatting of
> the raw data by adding --meta_only option.

Thanks for the patches!

I wonder if it's possible to reuse blobchunk.c codebase for
such usage in the short term.

Also I hope there could be some better option knobs for these
new features.

> 
> A simple usage example is as follows:
>    1. Build one xattr with OBS key in s3fs.
>    2. mkfs.erofs --meta_fix --meta_only data.img /mnt/s3fs to format
>    3. Implement the loading logic in kernel or userspace.
> 
> Based on the above logic, we can easily expose the directory tree
> from OBS to users in the form of the EROFS file system and implement
> on-demand data loading for large OBS objects.

BTW, It's possible to upstream OBS implementation to erofs-utils
if any chance?

Thanks,
Gao Xiang
