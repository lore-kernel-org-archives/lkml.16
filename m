Received: from smtp-fw-52004.amazon.com (smtp-fw-52004.amazon.com [52.119.213.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FC2239E64
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 06:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.119.213.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751350845; cv=none; b=mav7buNHiCVZxrP9ErhBQaCRs51g4CCDBO0FMxBxwKDRSeuYl697su/gtRVenOhy3OGBnRFz8TRtsnxGAWKbHMclhOqwXBE0yemcqaFSscdpWRYGafax7uAb+AaKe8NnUuyVyp5aMqq6zqeF/nz7yMpfu+WBi6EPR/o+ARa7v8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751350845; c=relaxed/simple;
	bh=IR4KGTzou5+QyNPIwKo6Rbfinqok8Acu0hXw6xTLhjI=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=TVCPE85url6/oqnVufUL3+tbXqhVFX2qCY0vZ8ceAIuLmOwsS6bdacrrR0zRdvIvkSPxqTl+WT8c0Q73mXW/D3vKd4qaO4REuJdnoUY41Y4hiBacXyJZbTZDpt4MV6XTdAwCzl+PGFS764kvPS6baj823dC/8Z+8OCcUz+jyyKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=Trodb4yv; arc=none smtp.client-ip=52.119.213.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="Trodb4yv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1751350844; x=1782886844;
  h=from:to:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=IR4KGTzou5+QyNPIwKo6Rbfinqok8Acu0hXw6xTLhjI=;
  b=Trodb4yvUfOSda5l1Bxy1dtgPZQP5iUS3f2u+Lua0vhZTtAArKQzBYre
   bfCHRE1HxJHgy8x6e/rxjl5IJ04X/JSZO3DgWt8VFudRNvrsqs8pt3TWQ
   UBZPjbgAE0cVr7DtB2y5jdoOnuLSYpHbKLccOZzlCdG8eOWCIqBaBKnL1
   UD/+LiZBMIMEU50hnMg2rKm4NFpabAAGvg/vSNqlHEaLb+/EU3Td19fJn
   avksYd75GQZfLYi6+XlS/SdAt6A9Vquh54EMSH8p5ailnNFHEvPZtX0Cu
   LnQwn3VXQcm734cmHFCgBWSU7ui2ljahpnpHjP7wdu4oeg8d3bCEnx8wP
   w==;
X-IronPort-AV: E=Sophos;i="6.16,279,1744070400"; 
   d="scan'208";a="313859774"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.43.8.2])
  by smtp-border-fw-52004.iad7.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 06:20:41 +0000
Received: from EX19MTAEUC002.ant.amazon.com [10.0.43.254:29184]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.42.139:2525] with esmtp (Farcaster)
 id 72c511c9-ec7d-47ea-ba87-a7fef17f35ff; Tue, 1 Jul 2025 06:20:40 +0000 (UTC)
X-Farcaster-Flow-ID: 72c511c9-ec7d-47ea-ba87-a7fef17f35ff
Received: from EX19D011EUB001.ant.amazon.com (10.252.51.7) by
 EX19MTAEUC002.ant.amazon.com (10.252.51.245) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Tue, 1 Jul 2025 06:20:40 +0000
Received: from EX19D011EUB004.ant.amazon.com (10.252.51.93) by
 EX19D011EUB001.ant.amazon.com (10.252.51.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Tue, 1 Jul 2025 06:20:40 +0000
Received: from EX19D011EUB004.ant.amazon.com ([fe80::1d31:84b:646:2607]) by
 EX19D011EUB004.ant.amazon.com ([fe80::1d31:84b:646:2607%3]) with mapi id
 15.02.1544.014; Tue, 1 Jul 2025 06:20:40 +0000
From: "Nachum, Yonatan" <ynachum@amazon.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: <no subject>
Thread-Topic: <no subject>
Thread-Index: AQHb6lBEBwLlCS66gEC7vFMhw1n50A==
Date: Tue, 1 Jul 2025 06:20:39 +0000
Message-ID: <0B2E79A8-2D77-4E04-919C-0AEEF4347F26@amazon.com>
Accept-Language: he-IL, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <AC1BB448FFD7C24288945E3F151FBD5F@amazon.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

dW5zdWJzY3JpYmUgbGludXgta2VybmVsDQoNCg==
