Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37196225762
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 19:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750447766; cv=none; b=FwzBlWgE1g8Zp0TWU0CHfp+FR/2wChFukvBthZnGQ2etizxmQiVsC5QgM3SSeDjcvDRQy8kD2H8QfIyPU8gczXJ4fJgDib719w73flRcscCg8KGMXxJW4mxklDkQcdhHnXvQ+Ot0ob4Y3fcp/KF7UgpAk3Yl8qExYAECA/O337o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750447766; c=relaxed/simple;
	bh=++mNnEsEJVQVCd9D0wJIlXaWUcaKB1Ggp9kMSokg9CA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ZK/zWR+fuKtkyUK3wJeaDlI+xQ47Ef/9BMFwmyNFDELa4R5lLNoh+JjzGIqZ6sor+j7t4Ad+wkrSfcsOBuq5j+SAXvxhkwxz+xgk7bMqqoG+6pb3UVuxWCCqDRkCLPES35sidJtKZVwo6PZaG6SPpKan69QpeV23O4SdCsWo5DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Wj+ZKeKQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=X9ws03ck; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Wj+ZKeKQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="X9ws03ck"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 4B3031380483;
	Fri, 20 Jun 2025 15:29:23 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Fri, 20 Jun 2025 15:29:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1750447763;
	 x=1750534163; bh=UrarUtOd0EyOKgTF8yM1WqJ3oiJY098/Joh074uugmk=; b=
	Wj+ZKeKQWSvl4rVBfqViw/2Sm4weaMpw2fZA210Hi0Kv3rTEtPpfxM/HIwzhNIU2
	DXHEtwbKqnZ2WhXywixG2X5n0rn82mGakLWDK3CoyXhzEz3lHxdDp/Or7VDHNNJe
	cyYQp34rXJhSTJ0GdW97B2xKOVyvRz1ZVvNo1iyJEmfo0n4mZUBzmIuMuQv1YABL
	IYr3GmGPDBfL2lPltJgNS5IzGMXoLs/VSUCY6Ue8noH7tMZ826byx7GpnptgDeSH
	7MtVCwQc9EOS1/bqTK4DW0Q+PMAw3HqJCnQNi4K76BppuwxGRxH+Hbor0NgTPWHk
	fk5ESqhSAIEvZ6X3mHpiaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1750447763; x=
	1750534163; bh=UrarUtOd0EyOKgTF8yM1WqJ3oiJY098/Joh074uugmk=; b=X
	9ws03cknfRFVo0gz81ynueDMngFXv3hmJslHbyASX6yVKOjsr5wGfICuvF12QA0V
	OmT46+GeJcrsouoqD7RojcPNCPEadUbtux2ek+gzMcmOlRoApWh54EnhQUxTAFTH
	lyzHY/JtShw9pMDX4LdohWaySumo5T5k+UXg2yknqPooq7Vd9wKePbGwYLwbNiSi
	1xAFSfUE/2zG1mg6z7QuSS4p9T1TW170VkuTrKjxu4yh5PoHrKLHJkKxHJa36ynu
	vRTyYvzKOJsi5V4cKocLJal9uAhzs2+X6WnZNsdnimqDni+P+W7KMDJzItF+tC2+
	crd3TveWvICPLVbm33MzA==
X-ME-Sender: <xms:krZVaNPk62WNj1fJa3FmIceNf3z_ku_YxDQADW1xyuZl8kMr3L1OLA>
    <xme:krZVaP8bgImECxKDDu47G4Yo4p8bgu9fijUWLyoU4t5q7k4GTXm-om9RWjAbAgP4A
    wINRbpUGutmFXhN5Ps>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdelvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhguuceu
    vghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnh
    ephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdeinecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhguse
    grrhhnuggsrdguvgdpnhgspghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhhtpdhr
    tghpthhtohepshgvnhhoiihhrghtshhkhiestghhrhhomhhiuhhmrdhorhhgpdhrtghpth
    htoheprhhoshhtvgguthesghhoohgumhhishdrohhrghdprhgtphhtthhopegrrhhnuges
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhohhhnrdhoghhnvghssheslhhinhhuth
    hrohhnihigrdguvgdprhgtphhtthhopehthhhomhgrshdrfigvihhsshhstghhuhhhsehl
    ihhnuhhtrhhonhhigidruggvpdhrtghpthhtohepphhmlhgruggvkhesshhushgvrdgtoh
    hmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdho
    rhhg
X-ME-Proxy: <xmx:krZVaMRdJ422W-CSzKg9GG1hvim-m66FIut3s_9KpJ1MDMtUXomfgA>
    <xmx:krZVaJtwlCXHGbQc0TshjnfRFTKvr9w0AiL5WbGbSdVaBoY2kcNB7Q>
    <xmx:krZVaFf4htKS37kwpWoX5H4F_1udD33uXoCmzJnYSkHGyuBHetarFQ>
    <xmx:krZVaF2DsMlMc18BeNb2zReRLEDbYDujoog6WNDtZylDMqZD6dNAtQ>
    <xmx:k7ZVaLq2wVxR9fPRaPcpn1OGgtU_fbA9v8Eq3c-Bg5MQ8k04ip_NylW9>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 92AA4700062; Fri, 20 Jun 2025 15:29:22 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Tfb6be10fbbe3f164
Date: Fri, 20 Jun 2025 21:28:42 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Arnd Bergmann" <arnd@kernel.org>, "Petr Mladek" <pmladek@suse.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 "John Ogness" <john.ogness@linutronix.de>
Cc: "Steven Rostedt" <rostedt@goodmis.org>,
 "Sergey Senozhatsky" <senozhatsky@chromium.org>, linux-kernel@vger.kernel.org
Message-Id: <d3b46690-0822-46cf-9736-43a3ff7cf58d@app.fastmail.com>
In-Reply-To: <20250620192554.2234184-1-arnd@kernel.org>
References: <20250620192554.2234184-1-arnd@kernel.org>
Subject: Re: [PATCH] printk: kunit: support offstack cpumask
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Jun 20, 2025, at 21:25, Arnd Bergmann wrote:
> 
> +	if (alloc_cpumask_var(&test_cpus, GFP_KERNEL))
> +		return;
> +

Sorry, I got the polarity wrong here, alloc_cpumask_var()
returns true on success.

      Arnd
