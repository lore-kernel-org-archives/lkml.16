Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D677926B956;
	Tue,  6 May 2025 10:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746527033; cv=none; b=fFdxTllSNz1QLYDrMJR66kaTNkKDQnriMbBPOMVnlls6mnrO/sOYTWqNHFchHw8wcN+S3bWBAU+CxYgHWVkImqkAxoOXRlmG69Ua68kSH45nQ51qKs8weNvhkav/2qLrVJnXu3llLzlzqqUhB7J5ZYtduXMfi6iJGktEQo2k0Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746527033; c=relaxed/simple;
	bh=3T426FVXDALe9YIxCpKFHnvGDhhQrfEXP/m8eJJhAQg=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ok3vuiPMsmlDqCTQ6ATi8+uCol3upYclC6JmsauRuNwT1Xb3YCFSFFYVaZPx6hJLQyANL6Cu+sgFzkgAW0oPxcgWaMW9esrvCh/84upT6jA9IWgPKmEo9SG3fJb23TvRZ8ZgyvOBjMcM2tOO1WzyOcZHUW1vxguiZt/se7z/wFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZsDry1NHHz6M4YD;
	Tue,  6 May 2025 18:19:14 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
	by mail.maildlp.com (Postfix) with ESMTPS id 963BC14011D;
	Tue,  6 May 2025 18:23:43 +0800 (CST)
Received: from localhost (10.47.68.20) by frapeml500003.china.huawei.com
 (7.182.85.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 6 May
 2025 12:23:43 +0200
Date: Tue, 6 May 2025 11:23:37 +0100
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <devicetree@vger.kernel.org>, <robh@kernel.org>,
	<jonathan.cameron@huawei.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linuxarm@huawei.com>,
	<mark.rutland@arm.com>, <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH v2 6/6] of: of_cpu_phandle_to_id to support SMT threads
Message-ID: <20250506112337.00006918.alireza.sanaee@huawei.com>
In-Reply-To: <c2ace0e9-6565-44c3-84eb-555707f84509@kernel.org>
References: <20250502161300.1411-1-alireza.sanaee@huawei.com>
	<20250502161300.1411-7-alireza.sanaee@huawei.com>
	<20250504-acoustic-skink-of-greatness-1e90ac@kuoka>
	<c2ace0e9-6565-44c3-84eb-555707f84509@kernel.org>
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
X-ClientProxiedBy: lhrpeml500012.china.huawei.com (7.191.174.4) To
 frapeml500003.china.huawei.com (7.182.85.28)

On Sun, 4 May 2025 19:52:34 +0200
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 04/05/2025 19:51, Krzysztof Kozlowski wrote:
> >> In the CPU map, there are two cases that only one occurs at at
> >> time. 1) "cpu" = <phandle>
> >>     2) "cpus" = <phandle> <index>
> >>
> >> The first case addresses non-SMTs and the second case addresses
> >> SMTs that the variable must be cpu(s) with an index where we later
> >> look up the reg array with that.
> >>
> >>     core0 {
> >>       thread0 {
> >>         cpus = <&cpu0 0>;  
> > 
> > Not so sure, dtschema says only one item is allowed in the phandle
> > and I do not see here binding change.
> > 
> > Although this wasn't even sent to me, so I'll just ignore your
> > patchset.  
> 
> Ah, there was no binding in the patchset, so that's why I did not get
> it. Makes sense now, but question about missing binding change stays.
> 
> Best regards,
> Krzysztof
> 

Hi Krzysztof,

There are some existing bindings in which this pattern has been
used, so I don't think I am changing binding really.

https://www.kernel.org/doc/Documentation/devicetree/bindings/thermal/thermal-zones.yaml#:~:text=cooling%2Ddevice%20%3D%20%3C%26CPU0%203%203%3E%2C%20%3C%26CPU1%203%203%3E%2C

Would that be good, if I just include the link in the next version?

Thanks,
Alireza
