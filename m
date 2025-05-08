Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D71813635C;
	Thu,  8 May 2025 15:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746716534; cv=none; b=KR2xO79Dg+rfK8/XoOHs2FO0pzJhIMnNu7ojS0qXCEuXkj1D0HVa1f6PRv3vjTjFEMsFCfKrRUl3K41t7Ger8N4GPdyCGKKTn5GRSJCRXOmw8ml1MewpRl1Ch6aDps0WfXbyPauZE7K1HhuSt4dnjfL5boFYaMGUvNDdCo5IuBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746716534; c=relaxed/simple;
	bh=SjMorZSEEhUVxlivOPjaGzogzcdVpoFwgxHS3tWkzi0=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=VUVHWzgkijxgNnRrGb8ZNeVjieEZ2nf8RuQO6ltxevI66QOyMzvjL625n0tsCbqQBktySZ+dmR6d/aPQht2JrQmGzM1/EW9CtIe6TsjTZTuxZh5zYasA5TWyxZztFnXnpL2zOHu01pGf8zPzRScmM+qVJ1F9m6dmrEx0fJAyIeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=NBy+0edq; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OqWQ7ATu; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="NBy+0edq";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OqWQ7ATu"
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id 5F6B613801E9;
	Thu,  8 May 2025 11:02:11 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-12.internal (MEProxy); Thu, 08 May 2025 11:02:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1746716531;
	 x=1746802931; bh=g8AJp5cmHz955S1tjFyzd5FQ3sp+0zBbwr569rPT9yw=; b=
	NBy+0edq4czxBfkDiIggyfrdf8earIPi9fo6cODr5KAmtTEykF4VOzPhGZLQlOPS
	c2pBkrpmTue5W08BuE6pz7znLy6OJpUTD+d1vZnKXGHswv1R/UF+TGOxVvm1LKl7
	lEWWQAbMZHa2P4d4uFM+qO7yQCOv6f/IKWOJ7rw+GqmLJ3Z1HJbjzu0z4kH9y+Im
	WuhovyU1m0M8+ckD7u15+jt1zYCFS8ne/imXsmBzLfMZac6FOiSmZe7KLHpdgEPu
	6WtPEuWgDN7kWPYLwMEOtdSnUJIf2AKfLzlhRVPMuQVQj4pPjRIfQ8Tzajp0djgA
	bg/wqdwAUk9G1HXFfbusRw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746716531; x=
	1746802931; bh=g8AJp5cmHz955S1tjFyzd5FQ3sp+0zBbwr569rPT9yw=; b=O
	qWQ7ATuIh4/FAgKEFcyJDxviX1gZXjB3xyOX96XAt/FASMFnPOgyEGgFxgueyTZI
	tGcP/5dEazFORH2W/vnA8FI3COjRHRtM0+VI8Ie+mNWtS7ZK7XlvCnjjQgT8NPU9
	+yytkcEzmbpRk6EIoZ0iNTJ/gIYhwxEvY0IWzJJHdQqYiJ4IkeEfKBNKmF3laSOW
	BEZvt+Kft+rUIi/Zq/q1+dnNgWijUv3lxMmhCOi6ZnmU0mb1f2+iURefb8zm7dPT
	4zmXq9KrBSrb2xEImCVCyZhu6NhDQaYRmdASpmmJWx0c3OaDhx8MXsLEzMw1JKqr
	NhC8drt+g6ksp9fUXfijw==
X-ME-Sender: <xms:csccaG_WRHa0Yznc8RinZBkip0aoUkYDtGDGmHcDVo2I2dHJ8RxWxg>
    <xme:csccaGsjQWynD7axHMAnQvIvpu6lw60S5h5P9JARgyGICGcCPOgG93Zj2ue-J05hi
    EcTGJPH6_2aFu2x9-k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvledttdegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedfofgrrhhkucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlh
    gvnhhovhhosehsqhhuvggssgdrtggrqeenucggtffrrghtthgvrhhnpefhuedvheetgeeh
    tdehtdevheduvdejjefggfeijedvgeekhfefleehkeehvdffheenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmphgvrghrshhonhdqlhgvnhho
    vhhosehsqhhuvggssgdrtggrpdhnsggprhgtphhtthhopeekpdhmohguvgepshhmthhpoh
    huthdprhgtphhtthhopehikhgvphgrnhhhtgesghhmrghilhdrtghomhdprhgtphhtthho
    peifpggrrhhmihhnsehgmhigrdguvgdprhgtphhtthhopegrnhgurhhihidrshhhvghvtg
    hhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepihhlphhordhj
    rghrvhhinhgvnheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehisghmqd
    grtghpihdquggvvhgvlheslhhishhtshdrshhouhhrtggvfhhorhhgvgdrnhgvthdprhgt
    phhtthhopehhuggvghhovgguvgesrhgvughhrghtrdgtohhmpdhrtghpthhtoheplhhinh
    hugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphhl
    rghtfhhorhhmqdgurhhivhgvrhdqgiekieesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:csccaMCOkgWp3QLLhXiskazPgE_o1E1NE9YkYTJ3FLp-Xt02QmNrUQ>
    <xmx:csccaOezimliUHnHX-J3win0h4G3OoNarvBkp8L-lfylM-cj5u2pbw>
    <xmx:csccaLPn5_RTUVaJ_UM_hRG1I9XhEVDRnoHsFuJuABjsJB3llFLJrg>
    <xmx:csccaIkV0_Sh-9Rw7hd5wiLR7T5i0puERaCC2jDDH9GbFR-EXS60Qg>
    <xmx:c8ccaChglLKv_xTSssEMyL_TTHq6N9QCXL7NY8WkVpzRdXKHqFF4fcwF>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id ADC953C006D; Thu,  8 May 2025 11:02:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T747cf12b99a35bad
Date: Thu, 08 May 2025 11:01:50 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
Cc: "Hans de Goede" <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 ikepanhc@gmail.com, "Armin Wolf" <W_Armin@gmx.de>,
 linux-kernel@vger.kernel.org,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 ibm-acpi-devel@lists.sourceforge.net
Message-Id: <d423ac66-bb8f-44e4-b995-f88cf2ece70c@app.fastmail.com>
In-Reply-To: <aBzAWrgEgmnAnum-@smile.fi.intel.com>
References: <mpearson-lenovo@squebb.ca>
 <20250507190456.3004367-1-mpearson-lenovo@squebb.ca>
 <20250507190456.3004367-2-mpearson-lenovo@squebb.ca>
 <aBzAWrgEgmnAnum-@smile.fi.intel.com>
Subject: Re: [PATCH 2/2] platform/x86: export thinkpad_acpi handles
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, May 8, 2025, at 10:31 AM, Andy Shevchenko wrote:
> On Wed, May 07, 2025 at 03:04:35PM -0400, Mark Pearson wrote:
>> Add API to be able to get the thinkpad_acpi various handles.
>> 
>> Will use this to start pulling some of the thinkpad_acpi functionality
>> into separate modules in the future.
>
> ...
>
>> +#ifndef _TP_ACPI_H_
>> +#define _TP_ACPI_H_
>
> + include for  acpi_handle typedef.
> Or it the forward declaration works
>
> acpi_handle;
>
> but I haven't checked and my gut feelings that it's not correct syntax as
> compiler doesn't know what the heck this word means.
>

OK - I'll have a look and figure out what makes sense.
Thanks for the review
Mark
