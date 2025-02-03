Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE082AF1B
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 15:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738597733; cv=none; b=pt/Y9GES/qyzBarSsTr1QJdep1WGsHcSz7N5ORIAgWsVbRtVOXzlRM/2s6xxl4vXYNhOA0rPyq7cxnJJIY8YQzAsXTWQcFChLciDY8yB1w0RFHXRxOB5EU/dsoPMmSdIF7kAvkg+8gMkt2Jyh3jRrfnIrslllnbVpPTwYH5aEQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738597733; c=relaxed/simple;
	bh=Ey6LtAnUnFOkT66bl/ckxWnp2hP/kQtqfsUc/rV7ZN8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IfwabHJIJQmUbc8Tmki0SqKTbRnDZrUBsZqghzOgPDAo8Euv5B0dUFYd08AofCulbhx4IP18Hg6Mxgpj49zEpwZ0foLvOJp+c2bHYOjfQeQjohptbhWmpN6lW4BjIiGQo70wRXmoVkDvami8vlNTqKVIVKwu70imQHKU+JOQbPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=bJWKXrJg; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="bJWKXrJg"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Q/sQaHjTwTU985s76XIbjZqvGq5WRDYJ+ivXd+Czv8I=; b=bJWKXrJgGwLT3ziuDBQuLxSaOG
	oeCZVW/X4PDaCN/eLIcDJloNVvkmdKA/urQ3A+mKaL8k+6wM9gwy4YdgT2pM35V/vS2vRSCaFpwBH
	VTRVSo93/7bCRuEzI7eqQah04ouVfqA66YbsUINq0Yp0TJQ9lpcpNhs18Pf+zTX0JKuO15C/zYiOv
	x0Y+jsfIwmnTqXJlQE3ovmt6RBTmZiIfZha5FWW9MKLZ/HQrlMed/guk7rrp/Oz5rSBgEveYF9BJK
	p3zecxqdRZYuH8hYxlMnqzszVB8Yh1d34UVgc15537vPcT5KS+dIYUWEvpECDxHxjrIhBslFNcpb+
	OLm5ruAg==;
Received: from [58.29.143.236] (helo=[192.168.1.6])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1teygh-0036CY-4H; Mon, 03 Feb 2025 16:48:45 +0100
Message-ID: <64869952-0bd4-4ae6-b103-3f97830d2e4a@igalia.com>
Date: Tue, 4 Feb 2025 00:48:40 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/11] sched_ext: Add an event, SCX_EV_BYPASS_DURATION
To: Tejun Heo <tj@kernel.org>
Cc: void@manifault.com, arighi@nvidia.com, kernel-dev@igalia.com,
 linux-kernel@vger.kernel.org
References: <20250131070938.95551-1-changwoo@igalia.com>
 <20250131070938.95551-9-changwoo@igalia.com>
 <Z5-s8EdYd9Ad70EN@slm.duckdns.org>
From: Changwoo Min <changwoo@igalia.com>
Content-Language: en-US, ko-KR, en-US-large, ko
In-Reply-To: <Z5-s8EdYd9Ad70EN@slm.duckdns.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

On 25. 2. 3. 02:35, Tejun Heo wrote:
> On Fri, Jan 31, 2025 at 04:09:35PM +0900, Changwoo Min wrote:
>> +/*
>> + * The last time the bypass mode started.
>> + * This is used to measure SCX_EV_BYPASS_DURATION.
>> + */
>> +static unsigned long scx_bypass_timestamp;
> 
> Move it inside the function?

That will look cleaner. I will move it inside scx_ops_bypass().

Regards,
Changwoo Min
