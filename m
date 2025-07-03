Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E445EEEB5;
	Thu,  3 Jul 2025 06:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751525720; cv=none; b=dElgVh1ecekc07TTl8kGHSizuMPxdX9JqPQJRjtKHLqtnBuzVOIQ4RY6uUnKKJWVMsPy63JOEQ3xSaUqOcCLh7xw4FfWN1H4pr/Mrn1iy6d+Ez3ePPVZkCKaa4F08ZCDLbRDI1S7eqtu3lh4OTT8v8v1ri7nY2/rLrnlhLqmNY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751525720; c=relaxed/simple;
	bh=jGSnu697d67IwA75m10Djga4YHQn4WzHVc6LeTYcKw4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FyyU5mN02pH9rIQxIqrD7Q9ezKlHI+HVjPVbi8l0kG/+2EfjjP4vwePh08IcslLLj3LWOe+KwIY961ZMsjCPUWf6oKto7YCMhAo1Z9SkmsgoEXqyUZOgitu38DRz7pAxqBwJBkUd0wt86mAB0nTDEslwSaRtcr1yUET3oA0XzXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=D4myG+of; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="D4myG+of"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+H5JCiq9PvPjjNp2yEBPc5VO5okqV6tmBxUK6V+hP3A=; b=D4myG+ofvN39dZPON1LQfonSnV
	zzgGQzT7r7CO1muAXzno4S9x4egIP8xkWEM77p4pVlEDClouFyV/yxdCycgwhkZOYmtdbCSiMt6ID
	oqTD5Ieb7eFZzgKpQo1h6bH/EVzEzEnJZyJOn7OJkkbISA/Hr16ugLDg1XIZWLhkSu5HHSCQ1ta02
	qmL1pmGMj/EXTGhjyVL2gwqlzrBmaKgLcRKsVD1ldaHFemCZ3O3666NMTQQqLBL3+rE4XOFP25yy+
	vvaQ/64qOZ4Tz10Mehnpw6kwKN3oca1ZdJQlZz8BNjX4M0I0Fv3ucDib7lwrUZZ0JVmKyUR47j6Tt
	cruPtLaA==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXDqh-00000007dMY-3XA5;
	Thu, 03 Jul 2025 06:55:12 +0000
Message-ID: <61294829-bb07-4587-a62b-5d56c651efcc@infradead.org>
Date: Wed, 2 Jul 2025 23:55:09 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: document linked lists
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: kernel@collabora.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250702-linked-list-docs-v2-1-e36532f4b638@collabora.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250702-linked-list-docs-v2-1-e36532f4b638@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Nicolas,


On 7/2/25 1:24 PM, Nicolas Frattaroli wrote:
Based against lwn/docs-next, but b4 should let you know already.
> ---
> Changes in v2:
> - drop unrelated sphinx theme patch.
> - replace graphviz diagrams with simpler ascii art in literal blocks,

The ASCII art looks good to me, although I agree with Bagas that the corners
could be made better.


> ---
>  Documentation/core-api/index.rst |   1 +
>  Documentation/core-api/list.rst  | 847 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 848 insertions(+)

I haven't had time yet to review the documentation, but I can at least say

Tested-by: Randy Dunlap <rdunlap@infradead.org>


Thanks.

-- 
~Randy
