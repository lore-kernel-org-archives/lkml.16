Received: from smtp-fw-80006.amazon.com (smtp-fw-80006.amazon.com [99.78.197.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B8438F80
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 13:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=99.78.197.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747834264; cv=none; b=ItL1UbVwc+7malFm1/Vay7PY1Iv1c8pRxMPu2D3fhjiSDvvMcatbZX6PrxYKfeVa4qCQDrNgH+5yZfMsblPtMyH1brjRWlsF8oxMADsRt7rkHQqHx1sUJluU+zZkbQF7Hzdg5Iu6glims/YAUoRnDmgVQjG6FlwEOVz4ROMNQVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747834264; c=relaxed/simple;
	bh=P44aB8a1enw1Q7BLrCYUQEhkhj0QPfIw9MrqF9vRoLQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kTPFOf5f1dxSaH6qDCMlC273BHIejqHVlLKOmoRm+TsRwvNAYh5LDgsNcKwycVGE3XMPFb3Cxu0EA4Lh9jn5uk2JiGa5eyl51om8vvmKCCPb81GJH4zIYmYcCsYLiSuevSjU4bamusTHixGYV6r7vZ0GZ/g6KgTUspTajBdBf+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=pDOV2AOZ; arc=none smtp.client-ip=99.78.197.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="pDOV2AOZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1747834263; x=1779370263;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=P44aB8a1enw1Q7BLrCYUQEhkhj0QPfIw9MrqF9vRoLQ=;
  b=pDOV2AOZ14M04fOrUpvvRSsXqrw8RmcTS31mr0qaJqllXI9ZGzYVJ45K
   4Rc34ev20sfrkUpJkrTKZroOVQjumGbJ4QNHU0ZR9KHAdjyJTN1a5GfIA
   kk5ZGap9LJvZ7XUc+7NQFWs7MKvRRr6CSH6VdeDYUYRPf3Ipk4NhWiDiE
   5KCd3YHz9YT4V3mRXdLBfuPTjQhOV5neU9WwT+7McO37UczCIv8t/y8ic
   7/jjB1ifQjQUE58vEy1iEllyhUvxhs+2A08IX+kjaFEkQjDDkU1B+fBGt
   3JSnfZZUBUSkHYtAIQY2ScZG6Y6uvYh8lubtpUUDWqAry+005B2l9xA2S
   Q==;
X-IronPort-AV: E=Sophos;i="6.15,303,1739836800"; 
   d="scan'208";a="52411332"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.214])
  by smtp-border-fw-80006.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 13:31:03 +0000
Received: from EX19MTAUWC001.ant.amazon.com [10.0.21.151:25288]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.33.138:2525] with esmtp (Farcaster)
 id 18b2b7c1-d798-4e19-82a7-cf54732f9f2d; Wed, 21 May 2025 13:31:02 +0000 (UTC)
X-Farcaster-Flow-ID: 18b2b7c1-d798-4e19-82a7-cf54732f9f2d
Received: from EX19D016UWA004.ant.amazon.com (10.13.139.119) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Wed, 21 May 2025 13:31:02 +0000
Received: from 7cf34dda9133.amazon.com (10.106.239.34) by
 EX19D016UWA004.ant.amazon.com (10.13.139.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Wed, 21 May 2025 13:31:01 +0000
From: Cristian Prundeanu <cpru@amazon.com>
To: <linux-kernel@vger.kernel.org>
CC: Cristian Prundeanu <cpru@amazon.com>
Subject: Re: EEVDF regression still exists
Date: Wed, 21 May 2025 08:30:18 -0500
Message-ID: <20250521133018.99124-1-cpru@amazon.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <6a83c7fb-dbfa-49df-be8b-f1257ad1a47a@amd.com>
References: <20250520181451.18994-1-cpru@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWA004.ant.amazon.com (10.13.139.19) To
 EX19D016UWA004.ant.amazon.com (10.13.139.119)

Apologies for the loose threading, accidentally posted a detached reply [1].

[1] https://lore.kernel.org/all/20250520181451.18994-1-cpru@amazon.com/
