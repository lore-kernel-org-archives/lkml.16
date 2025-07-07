Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB7235949
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 09:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751880892; cv=none; b=oojCUasim708kzo467yaWU+2B6zgwXKrNJJRsrObFRxig2YQX68RR6hPXLQRLt3zxqqLQcY0OeF1Ct9R5EvfHXgOE5FNrQI0hgrB5PMmS0qgMs4im8VgRhmkXOoUm5jbu3Lkn81MOils44zNofDh4vRgXiLxgNz8vnFK4GXxPr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751880892; c=relaxed/simple;
	bh=WSBW0JtGktdegldlhyuz+NoZCuNVfYMYO/cEKFexvns=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e5vAJCkEaR60HNCnh/VTeZD9Uwpeu6OEuHEZDP5AGPQ5QuS60pEMa7rwC418BJ9hLW57OPcwelGXUrZQz6Yv88qUlDEPj5NTmyFTCv95OhlY1a662xQU4Y1QRTprSeEGFFP+TWoifadmENjqIvmsVQs13tTH6YlvHESzJjfqbwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bbJsM5F1Wz6L5H5;
	Mon,  7 Jul 2025 17:31:35 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 15D311402F0;
	Mon,  7 Jul 2025 17:34:42 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 7 Jul
 2025 11:34:41 +0200
Date: Mon, 7 Jul 2025 10:34:40 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: James Morse <james.morse@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki"
	<rafael@kernel.org>, <sudeep.holla@arm.com>, Rob Herring <robh@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
	<WillDeaconwill@kernel.org>
Subject: Re: [PATCH v2 1/3] cacheinfo: Set cache 'id' based on DT data
Message-ID: <20250707103440.000048ff@huawei.com>
In-Reply-To: <20250704173826.13025-2-james.morse@arm.com>
References: <20250704173826.13025-1-james.morse@arm.com>
	<20250704173826.13025-2-james.morse@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
 frapeml500008.china.huawei.com (7.182.85.71)

On Fri, 4 Jul 2025 17:38:24 +0000
James Morse <james.morse@arm.com> wrote:

> From: Rob Herring <robh@kernel.org>
> 
> Use the minimum CPU h/w id of the CPUs associated with the cache for the
> cache 'id'. This will provide a stable id value for a given system. As
> we need to check all possible CPUs, we can't use the shared_cpu_map
> which is just online CPUs. As there's not a cache to CPUs mapping in DT,
> we have to walk all CPU nodes and then walk cache levels.
> 
> The cache_id exposed to user-space has historically been 32 bits, and
> is too late to change. This value is parsed into a u32 by user-space
> libraries such as libvirt:
> https://github.com/libvirt/libvirt/blob/master/src/util/virresctrl.c#L1588
> 
> Give up on assigning cache-id's if a CPU h/w id greater than 32 bits
> is found.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Signed-off-by: Rob Herring <robh@kernel.org>
> [ ben: converted to use the __free cleanup idiom ]
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> [ morse: Add checks to give up if a value larger than 32 bits is seen. ]
> Signed-off-by: James Morse <james.morse@arm.com>

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
