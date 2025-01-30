Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B0033987
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 06:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738218389; cv=none; b=PamQuNLP6s5TVfdb8jScp32jk+xHobDrmbzBnHxPXNo7Ldig4HweFehBWQmrqiiJj5n1n9Hw8qzBD6+ry/3jF5Hk3jcSAkMjKe83FVq0Knum7u4Pto5FGHwe3dOfrDWISKogZjEOx1+8nKzsvJRRyVU2xsU2/HGW3GMtFMccJnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738218389; c=relaxed/simple;
	bh=O6QoPeZF968bcm+6FGyvChjNAy7bUXhb7Z37jHdvEc0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=op1RDvbQg+4l2m5//+Y4XyRT3u1CG6G9cW6F5Rkhq9qtHRGwNbrqUbV6+UFctZWdQXWlRThymSd0rFvV7UjtxoaVEJz8HwM7pvh3A//pHtto4MNiTPkNQQdHu9s+Nbs6gd3UKqvj21kqit2Yv4HWFSnvtU321WT01hnMz0wD9jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=NBkR9O3Y; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="NBkR9O3Y"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xqRPg5sLGJgTsBeUgTi2AvB1YerWuvcW/OVJ1fCPuOU=; b=NBkR9O3Y3X6y2ffSDPlCpNXil9
	VG8ii+c0/BMp3zfjh9bA7suLD+ma7NyAU0qkxbo0RFzs7rBnNMWufAMOT1ip+V0MdnRnybDqSyPBf
	lzyRFxO8VzSHsDttJd9ps38ZiA/Ev3OSZfRMsGj/OVUPxYmo/M+RuY5ci59AND9wB946rBgJHhxq7
	m4EE7C2y+Llw0bxMUWSwAX33yyBKDWxwGrfsCzZKMsIoflEHxxa1H/BSiwzSaAqrvXy5p2bTvaeOb
	0sENU33MHbbHLbcWdJzpGZdGmtfu3+JZOEchN8+MpGSR9lJbL6eXLEBubgHWohSjMGx8nx3DNJVIz
	rSGgsvxQ==;
Received: from [58.29.143.236] (helo=[192.168.1.6])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1tdO0G-000uwt-0b; Thu, 30 Jan 2025 07:26:22 +0100
Message-ID: <1b3cd342-ddcb-4d53-a0bc-07e4ecc2973b@igalia.com>
Date: Thu, 30 Jan 2025 15:26:16 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/11] sched_ext: Add an event, BYPASS_DISPATCH
To: Tejun Heo <tj@kernel.org>
Cc: void@manifault.com, arighi@nvidia.com, kernel-dev@igalia.com,
 linux-kernel@vger.kernel.org
References: <20250126101614.232388-1-changwoo@igalia.com>
 <20250126101614.232388-9-changwoo@igalia.com>
 <Z5fm-ylLemMG-YiQ@slm.duckdns.org>
From: Changwoo Min <changwoo@igalia.com>
Content-Language: en-US, ko-KR, en-US-large, ko
In-Reply-To: <Z5fm-ylLemMG-YiQ@slm.duckdns.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

On 25. 1. 28. 05:05, Tejun Heo wrote:
> On Sun, Jan 26, 2025 at 07:16:11PM +0900, Changwoo Min wrote:
> ...
>>   has_tasks:
>> +	if (scx_rq_bypassing(rq))
>> +		__scx_add_event(BYPASS_DISPATCH, 1);
> 
> Can we do this at the sources even if that's a bit more code?

Sure. I will remove scx_add_event() and __scx_add_event() and will use 
this_cpu_add() and __this_cpu_add() directly.

Regards,
Changwoo Min
