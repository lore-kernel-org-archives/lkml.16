Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58E1280A58;
	Tue,  6 May 2025 13:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746539533; cv=none; b=jBaJMdPmk21IEVwYCDrF8IuRQhuiqiyHB7165bRIaYbWun/CmbVkBndXpLzRAX15B0XLtrRDIRNA4gTZjtuNyC6NOSmyKfuSAnTjUXO5Dv5LJ/HGy4CjkS+S5xzyXqqimk/MOso6Osd1Vyo06PGeRgKOTCiz0enVGbOguVG8PbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746539533; c=relaxed/simple;
	bh=1VOwQsJ3k5PogOdf1PKk0ppF8swsX//rwEr+ZjgTbKw=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mvtwVupqJuUmeAemriQKOOJ0YtK/7BXmbN0n4y88Z7ZzGiyXI5Dn50eiJ6IKXmXY33G7Z8FYjYOfNPpIYSvWQXnjDfrB8cZJIYcbVPE0HRD+S64vC20+nzP8TtR9aq2nY9sv75EHBL3RojKknqDHF86/pX/+KyiU6rLZp7sUpJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZsKZP1X96z6K8xh;
	Tue,  6 May 2025 21:51:57 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
	by mail.maildlp.com (Postfix) with ESMTPS id 100B31402F3;
	Tue,  6 May 2025 21:52:08 +0800 (CST)
Received: from localhost (10.47.68.20) by frapeml500003.china.huawei.com
 (7.182.85.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 6 May
 2025 15:52:07 +0200
Date: Tue, 6 May 2025 14:52:01 +0100
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <devicetree@vger.kernel.org>, <robh@kernel.org>,
	<jonathan.cameron@huawei.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linuxarm@huawei.com>,
	<mark.rutland@arm.com>, <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH v2 6/6] of: of_cpu_phandle_to_id to support SMT threads
Message-ID: <20250506145201.00000f50.alireza.sanaee@huawei.com>
In-Reply-To: <48fd85e7-4940-4bfd-943d-3c9674828a6c@kernel.org>
References: <20250502161300.1411-1-alireza.sanaee@huawei.com>
	<20250502161300.1411-7-alireza.sanaee@huawei.com>
	<20250504-acoustic-skink-of-greatness-1e90ac@kuoka>
	<c2ace0e9-6565-44c3-84eb-555707f84509@kernel.org>
	<20250506112337.00006918.alireza.sanaee@huawei.com>
	<78797f80-bdd6-49ef-b1cf-ffe4dc1dc5f6@kernel.org>
	<20250506143125.00002cae.alireza.sanaee@huawei.com>
	<48fd85e7-4940-4bfd-943d-3c9674828a6c@kernel.org>
Organization: Huawei
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 frapeml500003.china.huawei.com (7.182.85.28)

On Tue, 6 May 2025 15:36:05 +0200
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 06/05/2025 15:31, Alireza Sanaee wrote:
> >>>>    
> >>>
> >>> Hi Krzysztof,
> >>>
> >>> There are some existing bindings in which this pattern has been
> >>> used, so I don't think I am changing binding really.
> >>>
> >>> https://www.kernel.org/doc/Documentation/devicetree/bindings/thermal/thermal-zones.yaml#:~:text=cooling%2Ddevice%20%3D%20%3C%26CPU0%203%203%3E%2C%20%3C%26CPU1%203%203%3E%2C    
> >> I do not understand this - it is not cpus phandle. Please respond
> >> to specific comment: how many arguments are allowed by dtschema
> >> for cpus?  
> > 
> > Hi Krzysztof,
> > 
> > If you mean checking
> > here? https://github.com/devicetree-org/dt-schema/blob/e6ea659d2baa30df1ec0fcc4f8354208692489eb/dtschema/schemas/cpu-map.yaml#L110
> > 
> > There is no parameters allowed at this point for cpu phandles in the
> > cpu-map tree. Of course, this is different than what's been
> > implemented in the patchset.  
> Hm, ok, I thought you are adding this for cpu-map, but if not, then
> where are the bindings for this ABI?
> 
> BTW, share your DTS so we can be sure that it is properly validated
> against bindings.

No wait, I am adding this to cpu-map indeed, I meant the code is
different from what's available in the dt-schema, meaning that there is
a mismatch like what you pointed.

Based on your comments, my conjecture is that I will need to include dt
binding anyways.

SMT threads should be represented in the reg array of CPU nodes, and
will need to be addressed via an extra parameter specifying an index in
the reg array. 

There are various places in the kernel where we point to
CPU node using those phandles. Now the first place that we are trying to change is cpu-map for
enabling SMT resource sharing, and that probably means I should update
the binding related to that.

Hope that clarifies.

Thanks,
Alireza

> 
> Best regards,
> Krzysztof

