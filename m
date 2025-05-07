Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252484A00
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 05:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746595708; cv=none; b=WYXwRn0+N+KDzlWyTD+8kRMZRKO8qcOe8Dhsaari7XXHgVVRiJ+xZ2SdqGmaULEldohG29d+gqfAnaB2+KZoH6XY8nffqcE+OTYCxmqHFD8PgPfbtdmAToZeAe4fBVoHGiW3cYAqdexTykYQ56mil9wp4T8QzDTLOeLBjPYphmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746595708; c=relaxed/simple;
	bh=Foc84iPcdQW0wO0n0+L6Ev7Z7YpskrU/bj718zywsIc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=j9QxBxmZDwAGfMAIuDXkj5IczYT3C5q1PZscwQAJwSZ34sjK3+CPh8cv0db/M5yrvJf8bEjE6tvYtrD9sAlcitmL5xWJoG9OO9nJe1ocf4LhVd6I+HeZUtuR4xituc35OV/5vFknZ0644P97/qyANC/38V+oquVUIA2GXJd2Euc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=SjWvFVjd; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ge0CmIRO; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="SjWvFVjd";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ge0CmIRO"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id F2E241140243;
	Wed,  7 May 2025 01:28:24 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-05.internal (MEProxy); Wed, 07 May 2025 01:28:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1746595704;
	 x=1746682104; bh=8bStWu8KWWndJIeyD9dL6/M/qnSGw2nAqnwGzKtG0cE=; b=
	SjWvFVjd65jBMukPE7Eigo8MsCyWYI+RaZLhQrAzKALYHpJZH38023Jm02twH7Pq
	SO/iJaAgUQWlR14+yKPqiG8dGpeRPd7DDIN1AQ0XD6uDAx4sCtGrMuJ5IcDZYL+5
	G5KKRURXQVeY7XhhEFzoyuVMFoVRaUXDAQ9XW5qmDxuhK4duRkqlsEHJ/8j/lwCB
	lOeQP4k+CxkJCbY/Bz2AGyfpQT4BhFwjbuY8XDueZsYHQ+hHREgbDYaYCAsv8XW2
	H/zQZtV0atLU+y2MvzyG+gpcTYk9b07UAfliN4gEecKa4uIxqKGTxEXr+94yqZQF
	dKHzrvVATQ+Xg9L6GU92qg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746595704; x=
	1746682104; bh=8bStWu8KWWndJIeyD9dL6/M/qnSGw2nAqnwGzKtG0cE=; b=g
	e0CmIROB4Hn3u4vLg/noQGeK+/GYsAGtFElebCa8gZWLcfjuH7BhdFtqLzYU0hSI
	kGPu+ph0/eXRlgHdGJacUaod2Abv4NxT/kvE4iQhZpSA5Zy/8kJkj/RuMFBaVFva
	4x6u3OCcPKoF2E89g/wRQ/JmroHfy7HCyRPM4fWCQR6MUCD6wlUsWDaYf+ZLwdWL
	Jjp3T81NMWA7DeCYZnXqMs0OGZtBTZnPQAi/NiMpPYIHKytyOSvIC2vXGcay0JG6
	9H910LlSlKAVjSRxPDWH/VXadchRZRyFqcrW7gnoKIFkSs0PQDoV6BmBMF86xkhH
	qk1ViDieEDWusnNqjACOQ==
X-ME-Sender: <xms:eO8aaF-OdTf0YQ35bdZkExzMSR6mhkHQGaqDwXjGT8AxXwz2VoJxag>
    <xme:eO8aaJsUgSSxyk_8DdyxpncJzxwrsVUGR3aqSkfUhDW3naXjTUwdbg8QYKWqANErw
    7nIwQ-vp1Znq1179hk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeeitddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    uddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsphesrghlihgvnhekrdguvg
    dprhgtphhtthhopegufihmfiesrghmrgiiohhnrdgtohdruhhkpdhrtghpthhtohepphgv
    thgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheprghruggssehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehmihhnghhosehkvghrnhgvlhdrohhrghdprhgtphht
    thhopehtghhlgieslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopehtohhrvhgrlh
    gusheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepmhhitghh
    rghlrdhlkhhmlhesmhgrrhhkohhvihdrnhgvthdprhgtphhtthhopehvkhhuiihnvghtsh
    esrhgvughhrghtrdgtohhm
X-ME-Proxy: <xmx:eO8aaDBgveOaNkWCzr35Rsb989sg4jben8hcvlDKWhVcVsrQmSS25A>
    <xmx:eO8aaJeAMK3_TrTitgAPfkgeXlUgMI50TrKHfAY0a_0_x0PucRYHUg>
    <xmx:eO8aaKMupgpV1OZQze2TFuu0BjEYieA8-sASGzcCY4q6eQ2cy-ZM8A>
    <xmx:eO8aaLnp0q-8MECg7RMW_WWs1QKqvV3Nu-OOlgQVnQ-PQtNwUZiCBQ>
    <xmx:eO8aaDBF_L7S0QVs_Gd4Gz2wluOdk8bhxIu2VT7XM6B5gMSKc_BXahof>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 478121C20067; Wed,  7 May 2025 01:28:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T3cfc56977be09ec7
Date: Wed, 07 May 2025 07:27:53 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ingo Molnar" <mingo@kernel.org>, linux-kernel@vger.kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>,
 "Linus Torvalds" <torvalds@linux-foundation.org>,
 "Peter Zijlstra" <peterz@infradead.org>, "Borislav Petkov" <bp@alien8.de>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "Vitaly Kuznetsov" <vkuznets@redhat.com>, "Ard Biesheuvel" <ardb@kernel.org>,
 "David Woodhouse" <dwmw@amazon.co.uk>,
 "Masahiro Yamada" <yamada.masahiro@socionext.com>,
 "Michal Marek" <michal.lkml@markovi.net>
Message-Id: <667849c3-e522-4fbb-9d45-fbe28f7e6da7@app.fastmail.com>
In-Reply-To: <20250506170924.3513161-16-mingo@kernel.org>
References: <20250506170924.3513161-1-mingo@kernel.org>
 <20250506170924.3513161-16-mingo@kernel.org>
Subject: Re: [PATCH 15/15] x86/kconfig/32: Synchronize the x86-32 defconfig to the
 x86-64 defconfig
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, May 6, 2025, at 19:09, Ingo Molnar wrote:
> Just a mechanic synchronization of kernel options enabled: nobody
> really develops kernel features on x86-32 anymore, so make sure the
> defconfig is roughly equivalent to the 64-bit one, so that testing
> doesn't cover some combination that nobody cares about.

What is the size increase here? Some of the options you enable
look like they might add a lot of code to the vmlinux binary,
and 32-bit are often might more limited than 64-bit ones.

IOW, is your goal here to keep something that works on actual
32-bit machines, or do you want something that will in practice
run on 64-bit machines and have a comparable feature set?

> @@ -50,7 +76,11 @@ CONFIG_ACPI_BGRT=y
>  CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=y
>  CONFIG_CPU_FREQ_GOV_ONDEMAND=y
>  CONFIG_X86_ACPI_CPUFREQ=y
> -CONFIG_KPROBES=y
> +CONFIG_KVM=y
> +CONFIG_KVM_INTEL=y
> +CONFIG_KVM_AMD=y
> +CONFIG_KVM_XEN=y
> +CONFIG_KVM_MAX_NR_VCPUS=4096
>  CONFIG_JUMP_LABEL=y
>  CONFIG_COMPAT_32BIT_TIME=y
>  CONFIG_MODULES=y

I have a series to completely remove KVM support for 32-bit. There
is one powerpc platform that may keep it, but there is really
no point in enabling it here when there are practically zero
32-bit machines that can use it.

> @@ -234,6 +295,8 @@ CONFIG_DMADEVICES=y
>  CONFIG_VIRTIO_PCI=y
>  CONFIG_VIRTIO_INPUT=y
>  CONFIG_EEEPC_LAPTOP=y
> +CONFIG_INTEL_IOMMU=y
> +# CONFIG_INTEL_IOMMU_DEFAULT_ON is not set

I'm pretty sure the Intel IOMMU was only in 64-bit chips.

    Arnd
