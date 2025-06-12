Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35580205AA3
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 11:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749727747; cv=none; b=ULUzVY6GgY0oHFH7qWpHLEOWghBYyKQLm10enUWm0lTgX9JGgm2urr+5VCwl/PYor0DdPbzo7pkucqn06WCo8P0pWYkVwLOj7+lXnSo5X8jzYK0flMG3LCJUjtzC2BaIc3sCnrVNZZXvVpld5anJSCWHReNENq5zOEAZ1UDobm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749727747; c=relaxed/simple;
	bh=uKPslGrci0vE5lXwoPLvp6SxCBcMoufNEDxrBQdJ3/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jHkv56kuGeSS3GDvM8Ax3qWArNaFQq4aqC2yqv5emHsKEbtOEvUaPj4fEoBTKArYL23zhngGf+/f8rjhMB0llF2KKbIBSHS9MiSk1giTj8mvg6BrkUV5bgGYbLYtON5OS+j3DrAlrvmzIapL5c4bA3h+YUlIFK2s2764i8MZGjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=wFAeYZWH; arc=none smtp.client-ip=115.124.30.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="wFAeYZWH"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1749727736; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=fu0ZkPc/YdFxpsnb8F1tiP97BdbT2kHIv/FW3kqjBc0=;
	b=wFAeYZWHVStoUDMzoFTpChd6lI/zwQ93InI/48fBUMzJpL00UhUogqIE96vQVCn5jaapIbmMP+mj8cOyOS2qPfbGqfejiSxCfDrJOu7xToX9QcERJQDo77dJm/lhCTvi6dFcKuMBLnPWS76EQgU5K79fOahyjYSFzdmmYDoMgCo=
Received: from 30.170.233.0(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0Wdgqc61_1749727735 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 12 Jun 2025 19:28:55 +0800
Message-ID: <5d85b054-0e84-45ec-a1b3-c6281243c306@linux.alibaba.com>
Date: Thu, 12 Jun 2025 19:28:54 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] erofs: impersonate the opener's credentials when
 accessing backing file
To: Tatsuyuki Ishi <ishitatsuyuki@google.com>, Gao Xiang <xiang@kernel.org>,
 Chao Yu <chao@kernel.org>, Yue Hu <zbestahu@gmail.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, Sandeep Dhavale
 <dhavale@google.com>, Hongbo Li <lihongbo22@huawei.com>
Cc: linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 shengyong1@xiaomi.com, wangshuai12@xiaomi.com
References: <20250612-b4-erofs-impersonate-v1-1-8ea7d6f65171@google.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <20250612-b4-erofs-impersonate-v1-1-8ea7d6f65171@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Tatsuyuki,

On 2025/6/12 18:18, Tatsuyuki Ishi wrote:
> Previously, file operations on a file-backed mount used the current
> process' credentials to access the backing FD. Attempting to do so on
> Android lead to SELinux denials, as ACL rules on the backing file (e.g.
> /system/apex/foo.apex) is restricted to a small set of process.
> Arguably, this error is redundant and leaking implementation details, as
> access to files on a mount is already ACL'ed by path.
> 
> Instead, override to use the opener's cred when accessing the backing
> file. This makes the behavior similar to a loop-backed mount, which
> uses kworker cred when accessing the backing file and does not cause
> SELinux denials.
> 
> Signed-off-by: Tatsuyuki Ishi <ishitatsuyuki@google.com>

Thanks for the patch.  I think overlayfs uses the similar policy
(mounter's cred), which is the same as the opener's cred here
(because it opens backing file in the mount context), so:

Reviewed-by: Gao Xiang <hsiangkao@linux.alibaba.com>

Thanks,
Gao Xiang
