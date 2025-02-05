Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215382153D1
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 05:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738731682; cv=none; b=N/FqUWRDD52ORH8op2cpl4LnaWxLlTFtlsK/FN1I2ZFUC2DdeapmXvBYrvKBQwukiwDkmc9EwzUq9jAQDQtkRlHkJKU5mmOQHxwtMg1hsa0IeaobShTkV/opCw+Xwcc5k/0gKw1chSseHIKYu80kvs0tgcuXexx+H/FQNSdHr0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738731682; c=relaxed/simple;
	bh=B5/7U3y/ZSxMChdabBC+66W+A99xM1MCzW3++Zr8thw=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qOZEBpGlcLm0wlcNpBBXxgZeW6RfEnemXhh8Eg85PkuYBngb+U+DJQXKpFN+2Ur307NuRed/n25yn98Z5fx6Wag+von46y7ANX8OmaX9lFnEq3AQhXZp//UEu3/spvhDUgF5rlRJ6QH6nlSxvpNEAikoO15KpjmC7w0iPITwSc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=njyGfscD; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="njyGfscD"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51551FJI2468826
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Feb 2025 23:01:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738731675;
	bh=1qEhteYH57MbSgndvEkXdOZErhy4TDR4xk37wx+kqCg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=njyGfscDKMPSFSWUiCyrZgpia2GO8tZ05ZLlbV//luFX1JnWKjNx4svI++CV0brHS
	 nAa9T5XNOYLAV/CWgql5cz8YN8NGU9PRhrjG9FBDpr/RFlLbh0oWrDxpZthA69Jr1B
	 Eev9YnmU1JcdsmBLF1DTx9mNWagoMO0GT8DcI1GE=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51551FPD040028
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 4 Feb 2025 23:01:15 -0600
Received: from flwvowa02.ent.ti.com (10.64.41.53) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Feb 2025 23:01:15 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by flwvowa02.ent.ti.com
 (10.64.41.53) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2507.34; Tue, 4 Feb
 2025 23:01:14 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Feb 2025 23:01:14 -0600
Received: from localhost (lcpd911.dhcp.ti.com [172.24.227.226])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51551Db6117739;
	Tue, 4 Feb 2025 23:01:14 -0600
Date: Wed, 5 Feb 2025 10:31:12 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
CC: Frederic Weisbecker <frederic@kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] kthreads fixes for v6.14-rc2
Message-ID: <20250205050112.yqaq3vkopubegljz@lcpd911>
References: <Z6JjZMdbDoAX_AVW@pavilion.home>
 <CAHk-=wiPQ8PTWZuWXw8s+OLNmgXSM3+DxmY=uKd4F-Nnu4TB9A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAHk-=wiPQ8PTWZuWXw8s+OLNmgXSM3+DxmY=uKd4F-Nnu4TB9A@mail.gmail.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Feb 04, 2025 at 11:06:57 -0800, Linus Torvalds wrote:
> On Tue, 4 Feb 2025 at 10:58, Frederic Weisbecker <frederic@kernel.org> wrote:
> >
> > - Properly handle return value when allocation fails for the preferred
> >   affinity.
> 
> Well, we have exactly one caller of this function, and that caller
> doesn't actually care about the return value.

Yeah that was my initial thought while sending the fix here:
https://lore.kernel.org/linux-kernel/20250204090838.214647-1-d-gole@ti.com/

This patch hasn't appeared in next yet (next-20250204) so I missed this thread.

> 
> The function is literally the "preferred" affinity. If the affinity
> setup fails, it's harmless.
> 
> Anyway, the fix doesn't look wrong, and I've pulled it, but it's just
> all very harmless. I think the "set but not used" error could have
> been fixed by just removing the 'ret' variable entirely.
> 
>                 Linus
> 

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated
