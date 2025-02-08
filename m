Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF81155A52
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 09:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739005477; cv=none; b=PGtKTiAMX10d4REt+7cAGEphwgT6YR7P3GoESdbmA/rb4ynKw+GgYsjbA7+GJkA93QTKF83+jqyt9qa06QGT8lPGwzGFwHZQu87bbPTceRvN1UuAu32ZG6YkwyAERpfJfR7AO81YbaZtOi3g5Njn4c1U3JbesrR12CPS/PLJ/5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739005477; c=relaxed/simple;
	bh=6cHza1+KP/WQRdD4SobKG47PVD45zM+1T59RS0W3keQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t49fq70boF7a6UyA47KT6iJihYa3ExxtIpcrsxoqE3WKA1QS3ZjvdytOZPZt/6Sup4GRN18Klmajes7FKwVSeg7LDs0haNRU2uy1Ai2By87DRZlNiI0z5/tn34Afw9GX8MWBoT1VZwygpwjuMS/zeuS0OcvxzlmgFLK8ewZv45M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=UPJ7BBVx; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="UPJ7BBVx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pjjP5j5Suc6ABRXPr5URnj4NBIeHpRfOa9qkh1gpvOw=; b=UPJ7BBVxL1K+qNyK7tISq4gjGx
	m0lcFlq2WaMqyDGlyeTTF6VxU52f8PaC4sefpivM0OJI///Y8tFUWey3cAuhLRsSLaog/bOLVphw7
	EODlVzefbprjNzVi5fLvmiRY00EE60x4XL7Pq+arMDmW0YERX5p1jWJSP97vJYoaFyqGvoJPmrMHy
	UTXAwJyLrBq1jHl8T0uGiwCXuaPX5mUetqQu+/ExZABGRmfnqkWLVeQaqPZZ+gRbC5RIURd9DK0JM
	XQ1BGPBHLTPguoIix27dQoALDvlLOzQGA1anOyhlOtR+NO6hast6xQo8KbcnimABf9P1U495Hh4Fj
	guN3gipg==;
Received: from [58.29.143.236] (helo=[192.168.1.6])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1tggl7-006JVt-1o; Sat, 08 Feb 2025 10:04:23 +0100
Message-ID: <e67b4285-519f-4f4f-92e4-f8d4a6186414@igalia.com>
Date: Sat, 8 Feb 2025 18:04:17 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] sched_ext: Compatible testing of SCX_ENQ_CPU_SELECTED
To: Tejun Heo <tj@kernel.org>
Cc: void@manifault.com, arighi@nvidia.com, kernel-dev@igalia.com,
 linux-kernel@vger.kernel.org
References: <20250208044332.492494-1-changwoo@igalia.com>
 <Z6cSFmXvNkmI0qKv@slm.duckdns.org>
From: Changwoo Min <changwoo@igalia.com>
Content-Language: en-US, ko-KR, en-US-large, ko
In-Reply-To: <Z6cSFmXvNkmI0qKv@slm.duckdns.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

Thanks for the quick review!

On 25. 2. 8. 17:13, Tejun Heo wrote:
> On Sat, Feb 08, 2025 at 01:43:28PM +0900, Changwoo Min wrote:
>> Changwoo Min (4):
>>    sched_ext: Add enum_defs.autogen.h
>>    sched_ext: Include enum_defs.autogen.h from common/common.bpf.h
>>    sched_ext: Add __COMPAT_is_enq_cpu_selected() for BPF compatability
>>    sched_ext: Use __COMPAT_is_enq_cpu_selected() in scx_qmap
> 
> Can you collapse the four patches into a single patch? I don't think this
> needs to be split this granularly.

Sure, I will send out a collapsed version.

Regards,
Changwoo Min
