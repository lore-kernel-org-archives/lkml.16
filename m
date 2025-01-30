Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F7FB660
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 06:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738218548; cv=none; b=fWkl433sgGYQxIf/Py0tj9XzuAmXIT0ulFFM0DVglg8btXUfmOtab6PSWrVYnpAgi69Yn50ZrL4NxvfN3dfl3bTTzARYIZ/dvEktFPqE6scQpUnBkHqpCTa5JBtDWp7KLOB8V6rzLHpnKImfXD3Auy2TbnnVfPK8g2cWGO0BDRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738218548; c=relaxed/simple;
	bh=/DbgeWISVhmCpRpIIuVZAM/1R1rHVI08nJWSCQC68LU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tBcWzc3HMb2tISRf77koW7B5F9WfTALnyjCTW90t5SJeaJUaOrQmE0g5vIR0xPLXQuY5+XoOiEFf31CvCRGhr/w8ZMLseI1tuTRy0erMi24J45BAQqjtBeGGmwCtlz7Q6hMIROdJfUJndfNgbj7axeGeaUOO56TY4Q9x05u4zAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=PeyomC5w; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="PeyomC5w"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DOfyxhskjsYIKZsjol1+lv/UJpOhs5joGJ/xvA7v8mI=; b=PeyomC5wPe1w+mhNlHeFCu+RjU
	RPsYbzwCFpVsR+fgYVqjuP8jmdjIYtX+6bTEFqh1Y4G0bF6Pect2miZqgHU3plPNY8xLRNEpZez3i
	AAVLy8CNydOQ6fArY+Nvw1rY2doodbjOrhXPO2udhfQDHgdtS7cj8zV122ng016YnJ/Ke1H+x8U9F
	FQWcVhGz2TyjCzjpNpTbIt/9gTAyYw/1RVNI4QZEPbgTUsXGA7X8HLkHi14xKqxS+VKB8yzTw7yae
	ju/2cjF7LCozlKDXKd6ECHmmjSTg/YtVL244mZhNvF1SbWPu6fRbC/8i4o3LZ35HtlpLOWacJfFc4
	Gjlu1Q/A==;
Received: from [58.29.143.236] (helo=[192.168.1.6])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1tdO2o-000uzE-4W; Thu, 30 Jan 2025 07:29:00 +0100
Message-ID: <6bf8fd97-5113-4944-902c-250fca9d9b5c@igalia.com>
Date: Thu, 30 Jan 2025 15:28:56 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/11] sched_ext: Implement core event counters
To: Tejun Heo <tj@kernel.org>
Cc: void@manifault.com, arighi@nvidia.com, kernel-dev@igalia.com,
 linux-kernel@vger.kernel.org
References: <20250126101614.232388-1-changwoo@igalia.com>
 <Z5foIViipcxdjzQ1@slm.duckdns.org>
From: Changwoo Min <changwoo@igalia.com>
Content-Language: en-US, ko-KR, en-US-large, ko
In-Reply-To: <Z5foIViipcxdjzQ1@slm.duckdns.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

On 25. 1. 28. 05:10, Tejun Heo wrote:
> On Sun, Jan 26, 2025 at 07:16:03PM +0900, Changwoo Min wrote:
>> The sched_ext core often has to override the BPF scheduler decisions,
>> and some events could be interesting but not easily visible.
> 
> Generally looks good to me. Left several comments which should be
> straightforward to address.

Thank you for the review! I will cook another version in a day or two.

Regards,
Changwoo Min
