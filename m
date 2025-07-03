Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976CA223324
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 16:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751558989; cv=none; b=n9PEoBs6Xg7Cdm6ZKf+lP29+VBl9MsJMZ8FZfiS8M83vtsvOg+EtmnZY+jgWkVxvHhB10S6UrRCEi6pTQhA5HcAuedUp9EsmnAJuIsovnXrBvQgUTnGn6Qb5fesleKBzilOaf0abcrfS4h10cqw+Cu6um+LwavR6JTrhSqW2Gec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751558989; c=relaxed/simple;
	bh=cDeIx4ls2IA+kyYej8b+G0j+zfHVTr1MwjTEoqpmkyg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NIdp5myZynERstVWsg+TVuIZhCL+NaiRC11iGT7739w2kYwmzqt47VkgKJ48yprW3+LzsnO5mHh0EobaVjB6hLOaxOlAhaRbD/AYLoCHYoNrg2reRDMyaQKmWAHzY6eNnqU91fu5eEpiF5OBRlQHFEVioFY67wFzmC98g9GXmnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=SqNYAzL+; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="SqNYAzL+"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9994941C7B;
	Thu,  3 Jul 2025 16:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751558979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4nSERSeA7C0DLENpf6HUi5tGEKPv7HPliI4tgs5ohhg=;
	b=SqNYAzL+Q7AM3d+vcwsFu0JIBYCvQm4WsN5x4lq5U4t3eeToTDHnfqRsSsbTD7/U40uizF
	vCjiHpTrHt9GuHxJZTdfMyil/F5xrANR3NH1v3eTxZwdEQTzRSPpt6ps4bTA+0Htjc5GsU
	KjudJiPXw1xL+litVuonQYF3hiZfQ8C+JuowYqq/Nvfbqsuw+oc0FW01Mk8qy7/ry7E4Pv
	CET/6KpZ7u9h/2n1W+QVRteBAEtTrTRljbFtGkjL5RqCvE0CoaDIZi7lHvIt3UlS71X8NW
	2OP/Aicwy91bKkqlft3KfvcnZoQx6J2HSkWYbbUmJnWS37ZEm/Khd5jk906/zQ==
Date: Thu, 3 Jul 2025 18:09:24 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Colin King (gmail)" <colin.i.king@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: drm/bridge: tc358767: convert to devm_drm_bridge_alloc() API
Message-ID: <20250703180924.55aa0fb0@booty>
In-Reply-To: <056b34c3-c1ea-4b8c-9672-c98903ffd012@gmail.com>
References: <056b34c3-c1ea-4b8c-9672-c98903ffd012@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvtdejvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeglefffefghefhtddvfeeufeeiveekgffgleekieduteekkeetvdehudekgfdvvdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphephedurddujeelrddutdefrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeehuddrudejledruddtfedrheehpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtoheptgholhhinhdrihdrkhhinhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepughmihhtrhihrdgsrghrhihshhhkohhvsehoshhsrdhquhgrlhgtohhmmhdrtghomhdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvr
 hdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com

Hello Colin,

sorry for the late reply (vacation time).

On Wed, 2 Jul 2025 10:41:52 +0100
"Colin King (gmail)" <colin.i.king@gmail.com> wrote:

> Hi,
> 
> I believe there is a regression in linux-next caused by the following 
> commit:
> 
> commit a59a271769149f0b8258507276f3d2a24370cbdb
> Author: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Date:   Wed May 28 11:29:36 2025 +0200
> 
>      drm/bridge: tc358767: convert to devm_drm_bridge_alloc() API
> 
> 
> the issue is as follows:
> 
> static int tc_probe_bridge_endpoint(struct tc_data *tc, enum tc_mode mode)
> {
>          struct device *dev = tc->dev;
>          struct of_endpoint endpoint;
>          struct device_node *node = NULL;
> 
>          for_each_endpoint_of_node(dev->of_node, node) {

Well spotted! I wonder why this was not caught by my spatch runs.

I think there should be an extra line here:

   of_graph_parse_endpoint(node, &endpoint);

>                  if (endpoint.port == 2) {
> 			...
> 			...
> 
> The check for endpoint.port == 2 is checking an uninitialized field in 
> the uninitialized structure endpoint. The code before this commit called 
>   of_graph_parse_endpoint(node, &endpoint) to fetch endpoint and now 
> this seems to be missing.

As the commit message states, with this patch we are iterating over the
endpoints twice. However when iterating twice we need to parse the
endpoints twice as well.

I'm double checking this before sending a fix.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
