Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F507272E7E;
	Tue,  6 May 2025 10:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746527130; cv=none; b=nCRLtl2gUyUJ35toHWfNLJj9oOemiAJR2t79Wo8AZokiLdYe6VYsx0bGtE52i00sOMKiC4Unpl0Ct7i8Ivitlaeo9EaYeN7lq82A4eFYo+O5K4sVOlJtnNzu2mBxzqRXGTB2AZ+ANeZLqoOyFXPoefqYqIsdCVAlV5ONwBGNlDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746527130; c=relaxed/simple;
	bh=Gxeu/lHitlfOUk5aO+/kjKeR2jgfFH8H7yWTg/NYvQI=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WksfSFuK0+NBhOEbODU7U57yXrRv78syUwdCu/qY6DMuGU4UpReS21JoBewdYA8ka+cKXNNO7eS6xqQEAhANXUfH7z7thlR+oyMdnxvhYAY8NVZf/sxYZEJqQusT3GdfmRGJraYfIFwVlfMY3WT59IUMKgnJyv2frYm0vF98Qdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZsDxM0Gqrz6L5hX;
	Tue,  6 May 2025 18:23:03 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
	by mail.maildlp.com (Postfix) with ESMTPS id 99F731402F3;
	Tue,  6 May 2025 18:25:26 +0800 (CST)
Received: from localhost (10.47.68.20) by frapeml500003.china.huawei.com
 (7.182.85.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 6 May
 2025 12:25:26 +0200
Date: Tue, 6 May 2025 11:25:20 +0100
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <devicetree@vger.kernel.org>, <robh@kernel.org>,
	<jonathan.cameron@huawei.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linuxarm@huawei.com>,
	<mark.rutland@arm.com>, <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH v2 6/6] of: of_cpu_phandle_to_id to support SMT threads
Message-ID: <20250506112520.00004545.alireza.sanaee@huawei.com>
In-Reply-To: <20250504-acoustic-skink-of-greatness-1e90ac@kuoka>
References: <20250502161300.1411-1-alireza.sanaee@huawei.com>
	<20250502161300.1411-7-alireza.sanaee@huawei.com>
	<20250504-acoustic-skink-of-greatness-1e90ac@kuoka>
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

On Sun, 4 May 2025 19:51:02 +0200
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On Fri, May 02, 2025 at 05:13:00PM GMT, Alireza Sanaee wrote:
> > Enhance the API to support SMT threads, this will allow sharing
> > resources among multiple SMT threads.  
> 
> <form letter>
> Please use scripts/get_maintainers.pl to get a list of necessary
> people and lists to CC (and consider --no-git-fallback argument, so
> you will not CC people just because they made one commit years ago).
> It might happen, that command when run on an older kernel, gives you
> outdated entries. Therefore please be sure you base your patches on
> recent Linux kernel.
> 
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on
> some ancient tree (don't, instead use mainline) or work on fork of
> kernel (don't, instead use mainline). Just use b4 and everything
> should be fine, although remember about 'b4 prep --auto-to-cc' if you
> added new patches to the patchset.
> </form letter>	
> 
> > 
> > Enabled the sharing of resources, such as L1 Cache and clocks,
> > between SMT threads. It introduces a fix that uses thread IDs to
> > match each CPU thread in the register array within the cpu-node.
> > This ensures that the cpu-map or any driver relying on this API is
> > fine even when SMT threads share resources.
> > 
> > Additionally, I have tested this for CPU based on the discussions
> > in [1], I adopted the new cpu-map layout, where the first parameter
> > is a phandle and the second is the local thread index, as shown
> > below:
> > 
> > In the CPU map, there are two cases that only one occurs at at time.
> >     1) "cpu" = <phandle>
> >     2) "cpus" = <phandle> <index>
> > 
> > The first case addresses non-SMTs and the second case addresses SMTs
> > that the variable must be cpu(s) with an index where we later look
> > up the reg array with that.
> > 
> >     core0 {
> >       thread0 {
> >         cpus = <&cpu0 0>;  
> 
> Not so sure, dtschema says only one item is allowed in the phandle
> and I do not see here binding change.
> 
> Although this wasn't even sent to me, so I'll just ignore your
> patchset.
> 
> Best regards,
> Krzysztof
> 

Sorry, I didn't use the script, I will next time.
