Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697C81714B7
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 09:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739005948; cv=none; b=PZ2GC4zzfhO4w2/YNZ1FzNGL6CEM5LXWfx5X7zLwVlSqVcobT9DWegxnrctucW/uv0dLBAU9C3979VQpavZbYxC6YaOCFQtQmvpKY4hcayeEKUXQ2JBO6oaCipWdCpo4DyRy2ZUkyIZPx719DMcVJ1/XGKXo3rPd22+XLClnMgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739005948; c=relaxed/simple;
	bh=Q+dmld6crZT4EOzhdG88wF1itU11Mjx842oY3hftyFI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=naIK28konxVJ2EHyIDaLDwuWI3KR6R1SJTLlDN4xO0Z3n32KFMZ1klAzBO9KhQ5Fim+1kENVc2VcR7f/kKcu6HkET816CBkPUnAsPiVT6iy85oa54y9MRor6CroWNK+2KgFBBgEKh852EVjooZ2qowEitiDXZydVrz55+5jigjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=hFIFvg3f; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="hFIFvg3f"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DjPHon4AL1YD7D9zhorib7R/ffnNYO9ciVr+kcP0nR4=; b=hFIFvg3fsTNfvUH9+hkK4+yS7I
	j3yluTRzD+gZQvzKkZegms74+qtSEWjWiZv1gertg6XHlP6PVWEJiugAtFznG9AcNX9v2psowqyvq
	UvT0npaicYiMzZ9Tsxt3V1LmuphtYSqM46g+6ZFEzcygXps3XkDicWjlW6mgyNOSPeCtO/H8hBZv7
	xBM5Bq3TQPI1Z/YvI6tQnY3RSM8ijNb4m2l3GiKJp698teWkhOX0jK2sDrE2FB+o0l2GfVasyp53G
	n+DN+jqKzRg06QEcJxxc6AW1B389sY3kmpQQeocyy/ZIodflKvqJukLlydBn7RkzJiM/mXZHfoOhF
	7xqafNNA==;
Received: from [58.29.143.236] (helo=[192.168.1.6])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1tggsn-006JcJ-7J; Sat, 08 Feb 2025 10:12:19 +0100
Message-ID: <15674557-6e8c-445c-9a4a-d5f59820a70c@igalia.com>
Date: Sat, 8 Feb 2025 18:12:13 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHSET sched_ext/for-6.15] sched_ext: Event counter updates
To: Tejun Heo <tj@kernel.org>
Cc: void@manifault.com, arighi@nvidia.com, linux-kernel@vger.kernel.org,
 sched-ext@meta.com
References: <20250208084229.1274399-1-tj@kernel.org>
From: Changwoo Min <changwoo@igalia.com>
Content-Language: en-US, ko-KR, en-US-large, ko
In-Reply-To: <20250208084229.1274399-1-tj@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,


On 25. 2. 8. 17:42, Tejun Heo wrote:
> Hello,
> 
> This patchset contains the following three event counter updates:
> 
>   0001-tool-sched_ext-Event-counter-dumping-updates.patch
>   0002-sched_ext-Count-SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE-in.patch
>   0003-sched_ext-Add-SCX_EV_ENQ_SKIP_MIGRATION_DISABLED.patch
> 
> This patchset depends on two pending migration disabled handling patches on
> top of sched_ext/for-614-fixes and the event counter addition in
> sched_ext/for-6.15 and thus is on top of:
> 
>   sched_ext/for-6.14-fixes
>   + Two migration disabled handling update patches
>     http://lkml.kernel.org/r/Z6Zz79AUub1YuHwD@slm.duckdns.org
>   + sched_ext/for-6.15
> 
> The following branch shows how these patches will be applied:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git scx-evs
> 
> diffstat follows. Thanks.
> 
>   kernel/sched/ext.c                |   25 +++++++++++++++++++------
>   tools/sched_ext/scx_central.bpf.c |   21 ---------------------
>   tools/sched_ext/scx_qmap.bpf.c    |   16 ++++++++--------
>   3 files changed, 27 insertions(+), 35 deletions(-)
> 
> --
> tejun

Looks good to me. Thanks!

Acked-by: Changwoo Min <changwoo@igalia.com>
