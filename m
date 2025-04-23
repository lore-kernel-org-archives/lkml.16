Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683C222D4C0;
	Wed, 23 Apr 2025 19:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745438354; cv=none; b=qZoZXlzOuJq/9qsqVEfDdPGGVjyL+ySJlwBiG2t9MSEy/6iLYOnuDXykyWA+i/78YwqI/33ToHaZYrqmjw3ruvZhI8/H3OM4YP+3As74AMDs2nb0fMpuad+djfStv0Rj/twZOQX/YoQQ5LLC2P3j6W0kZ+LMuLlBqgGh5V9EB80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745438354; c=relaxed/simple;
	bh=w4yYtmDkQXfJGOqxGWKA84mTYJl0vv9VH4t/qFAs2uY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=X/jeav5QQhForKsQr+U+XW3HSjkzGfNd/gXbMNl2YExJO40e1fVuOrYjhPEO7VEB4/a9QwwzY93FjqVK8quCIqSkTQ1/xsOX3LETgpRBTZ3/rRXqUzm5NoPuTPTb8TpQ6idMnNRsNxwPVaytAWnGUuif5tBcgKE6lJxrAMlDJns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=uga2dHQu; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Bfq0pUe7; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="uga2dHQu";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Bfq0pUe7"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6FE16114015B;
	Wed, 23 Apr 2025 15:59:10 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-05.internal (MEProxy); Wed, 23 Apr 2025 15:59:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1745438350;
	 x=1745524750; bh=NX7mL6jZyvAEQWdC/PwOiBIA3444r7oIpccK2YL9TNs=; b=
	uga2dHQumKbsNoqMg4hfjK5pl0+eqEPynXfEzHnvzYME5jCqjxlIRASyXLrL3pUB
	sDPat9wIYeGbzb0duK39VMPFEysZm4sde7S9cCptltFx7tYhIXoe+xSWdRtsoTfK
	doH2DRqtgheiCQe/bly3ywOyYEgR1J3pTMx+k2l2q98jduf6uJ/UUpNG04SwiR1e
	pEZgGfHDDfHv9ngNONMPwm+Ne0TwSg8mCYSiiHVuSuUPbFHauP934ynu6Bd+9cLE
	HZ1Vgd+RjjGSyzpJrzrKy+JdsHLpZ8d3lifgbtdlGAhyVElfKBXe9qLBZAbZ5Vc2
	Op1p70NpCmuLrL9QPclsew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1745438350; x=
	1745524750; bh=NX7mL6jZyvAEQWdC/PwOiBIA3444r7oIpccK2YL9TNs=; b=B
	fq0pUe7ROi6r8/0BeKvRun/9zf4Y/VGHukaB5O+bPbAd2mReA8kks6SH1Hu4A0cy
	iO3Xqi5MIxx+Dryt0wa0pF7fIE19Uw04/JcsuJCjGovmoqvGPoWqGcYAZHrYdjGv
	n4k/JCXcmwhePjYw2136X7f6Iw3KGHNbcC7zeLuq22330H4QYF1/S0F/FX49LfJ/
	YV+epMWp4u6IOjhzB5mQAhVM3+HOcBkCL3XkZJ036ubMGfdcm4lgIMRFgwZ1MzEg
	Ii+Ce+cTUOFtorN6rpCOyFwpeIqgqpklyRhADSOTVmGfCJDR9zm/+2nT9nXv7i/p
	ZsTz0/xHfJfr2UjpJdHCA==
X-ME-Sender: <xms:jUYJaJAsiT_zagkb0AkeiP1LfHu6yGWg7UybxbH42jEKMxmX97FcRg>
    <xme:jUYJaHh1J4j3A4Ogx_1mWwc1AV57S2I4Lxr_A-Y77P0uat9t4ZShBHEzResUHcjI-
    FUdx3HW5rThrp_NzZY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeejhedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    uddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnmhgrghejsehgmhgrih
    hlrdgtohhmpdhrtghpthhtohepmhgrthhtshhtkeeksehgmhgrihhlrdgtohhmpdhrtghp
    thhtohepphgruhhlmhgtkheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhitghhrg
    hrugdrhhgvnhguvghrshhonheslhhinhgrrhhordhorhhgpdhrtghpthhtohepmhgtrhgv
    vgesohhrtghonhdrnhgvthdrnhiipdhrtghpthhtohepghhlrghusghithiisehphhihsh
    hikhdrfhhuqdgsvghrlhhinhdruggvpdhrtghpthhtohepmhgrtghrohesrhgvughhrght
    rdgtohhmpdhrtghpthhtohepihhnkhesuhhnshgvvghnrdhprghrthhspdhrtghpthhtoh
    eplhhinhhugidqrghlphhhrgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:jUYJaEksV75ANFSWg8BAxJh10R8urQb9EQrVHXilMeiA_q4gcSOlTQ>
    <xmx:jUYJaDzdFsO0oqrOrn2uut3G2w3lvavQNDSYv4-_TbLbg-GXjFk17Q>
    <xmx:jUYJaOTeE9ONPWB-hSnhvFmi5nt0iR683ToE9X-tiWCTxl_ESAohXg>
    <xmx:jUYJaGZbzWyxqls5Gap7PEzTAy4EIBPeS8eLpMe7qKBlTU32os5Ssg>
    <xmx:jkYJaJrZXW_cFtDlZfku7okAwFtsUAD85ShCu5qn7opqusb3jvj1wgVo>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id BCE3F2220073; Wed, 23 Apr 2025 15:59:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T11d5567f2ca40195
Date: Wed, 23 Apr 2025 21:58:40 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Magnus Lindholm" <linmag7@gmail.com>, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org
Cc: "Richard Henderson" <richard.henderson@linaro.org>,
 "Matt Turner" <mattst88@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>, macro@redhat.com,
 "Michael Cree" <mcree@orcon.net.nz>, "Ivan Kokshaysky" <ink@unseen.parts>
Message-Id: <41157e81-0dd9-4950-b9b2-245c0007d2bd@app.fastmail.com>
In-Reply-To: <20250423194958.30715-1-linmag7@gmail.com>
References: <20250423194958.30715-1-linmag7@gmail.com>
Subject: Re: [PATCH v2] alpha: machine check handler for tsunami
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Apr 23, 2025, at 21:21, Magnus Lindholm wrote:
> This patch is an attempt to implement a machine check handler with detailed
> information on error conditions in the event of a machine check exception
> on the tsunami platform. This work is inspired by how machine check
> exceptions are handled on the titan family. This patch implements
> processing of the logout frames that is generated in the event of a
> machine check. The logout frame contains platform specific information
> and is helpful in pinpointing the source that triggered the exception
> or fault. Some faults are recoverable, such as a correctable ECC error,
> but others may not be possible to recover from. As Alpha hardware is aging
> we may see more errors due to failing hardware and proper machine check
> handling can assist in detecting and diagnosing such errors. I hope that
> someone finds this useful, any feedback is much appreciated.

Should this perhaps be part of drivers/edac/ ?

     ARnd
