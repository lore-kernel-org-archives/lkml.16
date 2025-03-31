Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4953234
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 14:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743431346; cv=none; b=PxB1s9FCTAJ9mfABQ65Ql3gFFB7KjSXV2LL+vOE24ZOdyRaJM3CTnslbvqJjqmMp5g0z+fLwNPBhxaKTF7VjxewbctA4OC0fdg9rySsQLXq7F1sPXyJrDlJjFnYyyLph7PtruxgTVBrcyksHV8dmnjaKTNB+aiOTMIrcXbflYZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743431346; c=relaxed/simple;
	bh=lF6m40/JA6dazoqy3tT6BZIBqo3KiJhlx4ITotwOjG0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kRpvs1zzVhVfsoPF3M41M/pDmWEXLPIzv3b5MJYFWeu9yfCVCN/KnFAJvluFfWJWt5olpPu3Wk3eTTUEFovxiVi0MYyR9pZwy7QWDc9goBT5LiXMG27kuqvhcV6VCz0W9zo7F0dj04j1nOl9/2pLaY2ZRu5kul1/7pMj4bzL9Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aKXClEYy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aKXClEYy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743431344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pj2oe1FgGNek+6/QTB0TcxOqnXlPNsvqklQM0pgvpcU=;
	b=aKXClEYyOGgdMWmIsDFVI+9U/jW0fJypH9Eyq0NCKgmkr2365HyprJrZp3BS0kZ2jzfgUO
	PkkQEQ5Kao0fuUkr5KPXrNwkgoBywjtC3uZUFvx7GexQ/WVeaeyYHz6QjcLlKwcqeYsvsz
	YE175We4SQ2SRzeWe32yVtD1IjeUVVY=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-652-V0bvGhDbNkO7J3i8GpMjLw-1; Mon,
 31 Mar 2025 10:29:01 -0400
X-MC-Unique: V0bvGhDbNkO7J3i8GpMjLw-1
X-Mimecast-MFC-AGG-ID: V0bvGhDbNkO7J3i8GpMjLw_1743431339
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5D4FE1955DC5;
	Mon, 31 Mar 2025 14:28:59 +0000 (UTC)
Received: from [10.22.89.56] (unknown [10.22.89.56])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 886EF180094A;
	Mon, 31 Mar 2025 14:28:56 +0000 (UTC)
Message-ID: <e22e3cd8-f792-4f20-9624-76e973cf4940@redhat.com>
Date: Mon, 31 Mar 2025 10:28:55 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] nvme: add the NVME_ENABLE_MULTIPATH_PARAM config
 option
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: kbusch@kernel.org, hch@lst.de, sagi@grimberg.me, loberman@redhat.com,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 emilne@redhat.com, bgurney@redhat.com
References: <20250328193826.356257-1-jmeneghi@redhat.com>
 <20250328193826.356257-4-jmeneghi@redhat.com>
 <CADUfDZoXg39h-5gi+aVj2u1H6HC4Beyp2XPTrjJ_PMDPf11dQg@mail.gmail.com>
Content-Language: en-US
From: John Meneghini <jmeneghi@redhat.com>
Organization: RHEL Core Storge Team
In-Reply-To: <CADUfDZoXg39h-5gi+aVj2u1H6HC4Beyp2XPTrjJ_PMDPf11dQg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 3/28/25 3:49 PM, Caleb Sander Mateos wrote:
>>   bool multipath = true;
>> +#ifdef CONFIG_NVME_ENABLE_MULTIPATH_PARAM
>>   module_param(multipath, bool, 0444);
>>   MODULE_PARM_DESC(multipath,
>>          "turn on native support for multiple controllers per subsystem");
>> +#endif
> If CONFIG_NVME_ENABLE_MULTIPATH_PARAM is disabled, could you #define
> multipath false in place of the global variable? That would allow the
> compiler to optimize out the multipath checks and the resulting dead
> code.

If we #define multipath to be false that would permanently disable the multipath code
when CONFIG_NVME_ENABLE_MULTIPATH_PARAM=n, and this is not what we want. The purpose
of CONFIG_NVME_ENABLE_MULTIPATH_PARAM=n is to simply remove the core_nvme.multipath
parameter from the kernel so the user no longer has the ability to change
the bool multipath variable.  We want multipath to be true.

There should be no change in the multipathing policy or code by
enabling or disabling CONFIG_NVME_ENABLE_MULTIPATH_PARAM.

If you want to compile out the mulipath code you should set CONFIG_NVME_ENABLE_MULTIPATH=n.

/John

