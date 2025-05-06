Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4224280CF5;
	Tue,  6 May 2025 13:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746538298; cv=none; b=TTdNIlV+IChAsY/mJ7tHzXl6m28l+fDCq1btnMIcXl/4RMupFMTB7o+PlZ744SRJegNkjW7qGcLXECUFm149tQWe61SXfayxuMlzokwfqxC8KjSNsg9kc7pgSfLJ25j/qFC+VCLBDx4QQ+v7Ydgxp7jzlbgwqngVGlg4TfXDaOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746538298; c=relaxed/simple;
	bh=P63SDXs3MrPmFdM87Z5r6w/XbTJFa9pqgHAV73sR79o=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fBXQxDg9cDBtHZn6tKzhFhmRPkLBhzIssnAwRYJf2FqtRWPvPjTI2fabsGRcfYeayAPB89wOi4pEbD9afPHu/uJ1QoHkwDK3yTp/nn5p5pu6B5z6Jxy+/vGFdHxwwCAsYaijB6Z3AAdbwA/sW87TR18TFK9Mh2KH5+W55fN+WE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZsK1f1lPVz6M4Qt;
	Tue,  6 May 2025 21:27:02 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
	by mail.maildlp.com (Postfix) with ESMTPS id D14D3140370;
	Tue,  6 May 2025 21:31:31 +0800 (CST)
Received: from localhost (10.47.68.20) by frapeml500003.china.huawei.com
 (7.182.85.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 6 May
 2025 15:31:31 +0200
Date: Tue, 6 May 2025 14:31:25 +0100
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <devicetree@vger.kernel.org>, <robh@kernel.org>,
	<jonathan.cameron@huawei.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linuxarm@huawei.com>,
	<mark.rutland@arm.com>, <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH v2 6/6] of: of_cpu_phandle_to_id to support SMT threads
Message-ID: <20250506143125.00002cae.alireza.sanaee@huawei.com>
In-Reply-To: <78797f80-bdd6-49ef-b1cf-ffe4dc1dc5f6@kernel.org>
References: <20250502161300.1411-1-alireza.sanaee@huawei.com>
	<20250502161300.1411-7-alireza.sanaee@huawei.com>
	<20250504-acoustic-skink-of-greatness-1e90ac@kuoka>
	<c2ace0e9-6565-44c3-84eb-555707f84509@kernel.org>
	<20250506112337.00006918.alireza.sanaee@huawei.com>
	<78797f80-bdd6-49ef-b1cf-ffe4dc1dc5f6@kernel.org>
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
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 frapeml500003.china.huawei.com (7.182.85.28)

On Tue, 6 May 2025 12:56:43 +0200
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 06/05/2025 12:23, Alireza Sanaee wrote:
> > On Sun, 4 May 2025 19:52:34 +0200
> > Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >   
> >> On 04/05/2025 19:51, Krzysztof Kozlowski wrote:  
> >>>> In the CPU map, there are two cases that only one occurs at at
> >>>> time. 1) "cpu" = <phandle>
> >>>>     2) "cpus" = <phandle> <index>
> >>>>
> >>>> The first case addresses non-SMTs and the second case addresses
> >>>> SMTs that the variable must be cpu(s) with an index where we
> >>>> later look up the reg array with that.
> >>>>
> >>>>     core0 {
> >>>>       thread0 {
> >>>>         cpus = <&cpu0 0>;    
> >>>
> >>> Not so sure, dtschema says only one item is allowed in the phandle
> >>> and I do not see here binding change.
> >>>
> >>> Although this wasn't even sent to me, so I'll just ignore your
> >>> patchset.    
> >>
> >> Ah, there was no binding in the patchset, so that's why I did not
> >> get it. Makes sense now, but question about missing binding change
> >> stays.
> >>
> >> Best regards,
> >> Krzysztof
> >>  
> > 
> > Hi Krzysztof,
> > 
> > There are some existing bindings in which this pattern has been
> > used, so I don't think I am changing binding really.
> > 
> > https://www.kernel.org/doc/Documentation/devicetree/bindings/thermal/thermal-zones.yaml#:~:text=cooling%2Ddevice%20%3D%20%3C%26CPU0%203%203%3E%2C%20%3C%26CPU1%203%203%3E%2C  
> I do not understand this - it is not cpus phandle. Please respond to
> specific comment: how many arguments are allowed by dtschema for cpus?

Hi Krzysztof,

If you mean checking
here? https://github.com/devicetree-org/dt-schema/blob/e6ea659d2baa30df1ec0fcc4f8354208692489eb/dtschema/schemas/cpu-map.yaml#L110

There is no parameters allowed at this point for cpu phandles in the
cpu-map tree. Of course, this is different than what's been
implemented in the patchset.

> 
> Best regards,
> Krzysztof
> 


