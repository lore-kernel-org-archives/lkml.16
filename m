Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A3015D5C4
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 16:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738861129; cv=none; b=OR+5uAaehaOKcpSkxyVoJlfOaDtFwiH90Yj8SonODxlEP97/ZoE4GoEyZnW9tqo2sfxdH4cDtulu3rkcl51Y1DNitzbvqjuneURKWLW1yGAuER9o2JPUcgkrAgJxNS/lFKUp8begyd23hSwK7RfKuVNQNB5133mboUpwK8EChg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738861129; c=relaxed/simple;
	bh=xKGzfXZ4PBTCrOXIHa2JGlq6uDtGA0t6GCPWqwsfEjY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HacUt5Q8kUw0o+iW+kWXgFlLApoHaf8VOel9T3R/ynvEoXN0BmWkBLaNOHv8DA/k94be92EsdvSa5LwHybyaFWdaywmnuHis0oLCr5O5eRvWykMGyDDhCum0mvXRaRm027mP6xJSbWQOvgMZ5FMfapdfGSbq6X/2rjrYoDlfPjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fxc9kl16; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fxc9kl16"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5503344120;
	Thu,  6 Feb 2025 16:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738861119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=54udYs+xLDljQYkiA18WIt8yRAThdRISYzwfpUmkHzc=;
	b=fxc9kl16k6rTWF7UcziTvb6qxwT5lUtLUKvlu/Pof52O9nKR4reeV3MssSEsgsnl43Heg+
	d3i34yM2xytHudcfr6a8Y6mccKiMd3tutoqFGKY0Hj+fNAbDds3BxP/huA9u2MfF4Yw+lx
	DVD8UaFj39pPRXe5FAa3BuVLuuzuHtQVs7/7B+3fR/fgvGkPBvPBYzpoOg7/S+uyN5eHqz
	YD95D/txvilnz8wpEQ6n4dFjk8HCOGxDCnHQ9rdU5eUNJ1s/i4hu4Z15iD9F4VgPMg2Eej
	9Cecr5pXTDt+zJsBnIXKGUphLJTqZYhmfm7SnBIhf6/vDz7Zq6YR2ra/cq0kDw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Edward Adam Davis <eadavis@qq.com>
Cc: syzbot+074732af3fc6c528f8a0@syzkaller.appspotmail.com,
  linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org,
  richard@nod.at,  syzkaller-bugs@googlegroups.com,  vigneshr@ti.com
Subject: Re: [PATCH] mtd: capture device name setting failure when adding mtd
In-Reply-To: <tencent_B7365D9CDDA8990DCF8C0DFE25B28DB31207@qq.com> (Edward
	Adam Davis's message of "Sun, 2 Feb 2025 09:31:45 +0800")
References: <679cd60e.050a0220.d7c5a.0045.GAE@google.com>
	<tencent_B7365D9CDDA8990DCF8C0DFE25B28DB31207@qq.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 06 Feb 2025 17:58:37 +0100
Message-ID: <87ikpn57sy.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieelvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepjedprhgtphhtthhopegvrggurghvihhssehqqhdrtghomhdprhgtphhtthhopehshiiisghothdotdejgeejfedvrghffehftgeitgehvdekfhekrgdtsehshiiikhgrlhhlvghrrdgrphhpshhpohhtmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggru
 gdrohhrghdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehshiiikhgrlhhlvghrqdgsuhhgshesghhoohhglhgvghhrohhuphhsrdgtohhmpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com

Hello Edward,

> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 724f917f91ba..a71cd75858e4 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -741,7 +741,8 @@ int add_mtd_device(struct mtd_info *mtd)
>  	mtd->dev.type =3D &mtd_devtype;
>  	mtd->dev.class =3D &mtd_class;
>  	mtd->dev.devt =3D MTD_DEVT(i);
> -	dev_set_name(&mtd->dev, "mtd%d", i);
> +	if (error =3D dev_set_name(&mtd->dev, "mtd%d", i))

Thanks a lot for the analyse and for fixing this. May I ask however to
follow a more common pattern for error checking that is:

       error =3D dev_set_name(...);
       if (error)
                goto...

This way it is closer to the usual error handling and also aligned with
the rest of the file.

Otherwise LGTM.

Thanks,
Miqu=C3=A8l
