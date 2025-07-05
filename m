Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB00C33987;
	Sat,  5 Jul 2025 14:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751725067; cv=none; b=OF1Hfo8nvxlGWBpXnGie5YtylM5Jd2fT1XaiCcQkWEP3sv6j97FtGjJo23YKsBCOR0cwA5tnlh0/vvlr5tYjyGdERxz7Sgqnv5Lc8afSmAqhwSnqhVSPLm8ZwUPnbQG63tKileGQk0i0XGs35AF6bD0L5oCAMALLoq7e+lvP1zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751725067; c=relaxed/simple;
	bh=RFcVFRd+jB7yzjZEF15amP7MCa2Sg4A/zIVm0kIVtVM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tdaKwhZXWDx2IpfnoEA6eLFjU2HZeiaYRJOujB2Inn6mlRitzAwqDBAmtzqzvjOSySYH9grXRvH0vLbgWUmfcRwAnRaRmkgKmI82CvpQEzzlQFweijCHvMNHkZ7JsGtCO6sniJP2B3HuZhU+/+Eky0Tfe7/FiOFuywWAyQ3YsVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VOeAwa/9; arc=none smtp.client-ip=217.70.178.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VOeAwa/9"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5A7C34313C;
	Sat,  5 Jul 2025 14:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751725061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pS5IedIEzgY1pshAvlpXhjZDmSvEewXvev0cnX3lWPQ=;
	b=VOeAwa/9AcN38Sa7bRO3kPWHIGn4rm+OQxuxnECEY+VKRQfydCb8cc+fNZ3dBwGRKINIDw
	cT/Tu9DYMbiBm4IVMU53kqQGn/OMnBbfPq+5PcebA1Uhlx4BpgLfs1tChXvXwVsnQySKYc
	zo3H45QdkCt8Xv2Shr9oWckGS++VfHaeD4xcVxrPyZseJgOTR0Z47f71z/CR5q1sBR2De4
	CCgiO6S5sD/Tpobo/oTo5ZMYMrQ52soQaIY6xtoGCM4frODN5Qh+k+QjsrRS/PUYj5Jivp
	L1r2wc+E/vpgJs8ZwtdkZUTI9JmdUSVwxZC6FKwXIR1NMMzh5WVxp2XFt/PPhA==
Message-ID: <8f8130b2-fec1-48bc-944e-e676a1715c31@bootlin.com>
Date: Sat, 5 Jul 2025 16:17:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] staging: gpib: Fix error handling paths in
 cb_gpib_probe()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Dave Penkler <dpenkler@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <bf89d6f2f8b8c680720d02061fc4ebdd805deca8.1751709098.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <bf89d6f2f8b8c680720d02061fc4ebdd805deca8.1751709098.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddviedviecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpefvhhhomhgrshcutfhitghhrghrugcuoehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudfhffeivedvfffhfeehveevteetveejueehtddtgfejjeejhfeufffgjedvieejnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvdgrtddumegtsgdugeemfhegtdemsghftddtmehftdehgeemtgeltgdvmedvudgtfeemudehieeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemfhegtdemsghftddtmehftdehgeemtgeltgdvmedvudgtfeemudehieeipdhhvghloheplgfkrfggieemvdgrtddumegtsgdugeemfhegtdemsghftddtmehftdehgeemtgeltgdvmedvudgtfeemudehieeingdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepjedprhgtphhtthhopegthhhrihhsthhophhhvgdrjhgrihhllhgvthesfigrnhgrughoohdrfhhrpdhrtghpthhto
 hepughpvghnkhhlvghrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhgvrhhnvghlqdhjrghnihhtohhrshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhsthgrghhinhhgsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepthhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhm

Hi Christophe,

On 7/5/25 11:52 AM, Christophe JAILLET wrote:
> If cb_gpib_config() fails, 'info' needs to be freed, as already done in the
> remove function.
> 
> While at it, remove a pointless comment related to gpib_attach().
> 
> Fixes: e9dc69956d4d ("staging: gpib: Add Computer Boards GPIB driver")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Changes in v2:
>   - Fix the Fixes tag   [Thomas Richard]
>   - Synch with latest -next
>   - no compile tested. I think, thanks to commit 79d2e1919a27
>     ("staging: gpib: fix Makefiles")
> 
> v1: https://lore.kernel.org/all/459c267de8c9bf48fcb555364930ae7e3cdc798b.1729940596.git.christophe.jaillet@wanadoo.fr/
> 
> Compile tested only.
> ---
>  drivers/staging/gpib/cb7210/cb7210.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/gpib/cb7210/cb7210.c b/drivers/staging/gpib/cb7210/cb7210.c
> index 298ed306189d..3e2397898a9b 100644
> --- a/drivers/staging/gpib/cb7210/cb7210.c
> +++ b/drivers/staging/gpib/cb7210/cb7210.c
> @@ -1184,8 +1184,7 @@ struct local_info {
>  static int cb_gpib_probe(struct pcmcia_device *link)
>  {
>  	struct local_info *info;
> -
> -//	int ret, i;
> +	int ret;
>  
>  	/* Allocate space for private device-specific data */
>  	info = kzalloc(sizeof(*info), GFP_KERNEL);

You should use devm_kzalloc(). The memory will be automatically freed by
the core. So no need to call kfree() in case of error during the probe.
And you can remove the kfree() in cb_gpib_remove().

Regards,

Thomas
