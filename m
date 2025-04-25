Received: from smtp-fw-80009.amazon.com (smtp-fw-80009.amazon.com [99.78.197.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAD913DDAA
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=99.78.197.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745575338; cv=none; b=d7zGY2yAfrgnTDO0w1Rc44kWI6K9l+6j0XChT4mWWWlNGugx/7+gYdTJhnQICnD47qK5W/nhiG8TQpEz1f6EkwpIwfi8NJESB0CELiQFby2X1SoPUWsSEWLOQ6bfi9V8ACGbhmip2gLhukaG9vjtUl+lC2gkZBARdmNpKZ1GVUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745575338; c=relaxed/simple;
	bh=yal9lwCqGuNOtoRBSPCamKbzMaGWto6/yb4OR4lzTE0=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=d31FkNgEPoGeeGj0Aai6W2wDy9C3p6mFfciqrJ8v7hF6N1If58LPRiZpHnNkfl/gyzO6dZ2iFe17VXWuhmPdGBdgsGTgUXKUC2wbl010LcJFFIzg1Uhk+NfDS+dDxSDEbDNUndjwa0C2uJEZiuzxiJFn6YG2bZmlR4eegYl0x8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de; spf=pass smtp.mailfrom=amazon.de; dkim=pass (1024-bit key) header.d=amazon.de header.i=@amazon.de header.b=Nlu1XCxf; arc=none smtp.client-ip=99.78.197.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.de header.i=@amazon.de header.b="Nlu1XCxf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1745575337; x=1777111337;
  h=from:to:cc:subject:date:message-id:reply-to:mime-version:
   content-transfer-encoding;
  bh=cF5QB9sYw+Xl3Kp3sr18k8pRzKSX5fAtpwidswIedXk=;
  b=Nlu1XCxfG5NiJjZeKt5DOp7yuYu+IOg1wl4CM9p7UXuOBd+Rr/MEffps
   eNU6iuAqWwL4ed5ZRQsz0wnh+pDzdqbbhqfBZ/gQtT+U+xaXs8jKjWZZ7
   TLX4+NuVeE0AWcvQf+4dwmdc5JfAZiyZLcKVMIy5fpyRz0oFER/WAH3To
   c=;
X-IronPort-AV: E=Sophos;i="6.15,238,1739836800"; 
   d="scan'208";a="194314763"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-80009.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 10:02:14 +0000
Received: from EX19MTAEUB002.ant.amazon.com [10.0.43.254:55341]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.14.185:2525] with esmtp (Farcaster)
 id 91e8e608-dc2e-48df-adbc-7a134a9c9407; Fri, 25 Apr 2025 10:02:13 +0000 (UTC)
X-Farcaster-Flow-ID: 91e8e608-dc2e-48df-adbc-7a134a9c9407
Received: from EX19D014EUC002.ant.amazon.com (10.252.51.161) by
 EX19MTAEUB002.ant.amazon.com (10.252.51.79) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Fri, 25 Apr 2025 10:02:13 +0000
Received: from EX19D014EUC004.ant.amazon.com (10.252.51.182) by
 EX19D014EUC002.ant.amazon.com (10.252.51.161) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Fri, 25 Apr 2025 10:02:13 +0000
Received: from EX19D014EUC004.ant.amazon.com ([fe80::76dd:4020:4ff2:1e41]) by
 EX19D014EUC004.ant.amazon.com ([fe80::76dd:4020:4ff2:1e41%3]) with mapi id
 15.02.1544.014; Fri, 25 Apr 2025 10:02:13 +0000
From: "Gutierrez Cantu, Bernardo" <bercantu@amazon.de>
To: "yajun.deng@linux.dev" <yajun.deng@linux.dev>
CC: "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>, "lkp@intel.com" <lkp@intel.com>,
	"rppt@kernel.org" <rppt@kernel.org>, "dwmw2@infradead.org"
	<dwmw2@infradead.org>
Subject: Re: [PATCH v4] mm: pass nid to reserve_bootmem_region()
Thread-Topic: Re: [PATCH v4] mm: pass nid to reserve_bootmem_region()
Thread-Index: Adu1xWGtRnOVME03T+mfcIE2Ywerww==
Date: Fri, 25 Apr 2025 10:02:12 +0000
Message-ID: <bd5842a92bd340799a74063f8da83d96@amazon.de>
Reply-To: "Gutierrez Cantu, Bernardo" <bercantu@amazon.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> +		if (memblock_is_nomap(region))
> +			reserve_bootmem_region(start, end, nid);
> +
> +		memblock_set_node(start, end, &memblock.reserved, nid);

memblock_set_node() receives a `base` and a `size` argument. Passing `end` =
would
cause us to set the node id on an incorrect range. Will send a fixup patch
shortly...

Best regards
Bernardo



Amazon Web Services Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597

