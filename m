Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB7629DB87
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 21:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745356616; cv=none; b=reJFz58+w5gXjU4mkhE3OG+U4ng/OHgo/CIVkhyx0gmDmzuY45S1QcAhevmI+oCETgStMl+BPFIZ+YKRYdV/qKjQU89g9c9LTfJU8synzWNiiD7CTOoSr038L3ma4LFZfSES5Jy0ce0ne7ZrlaT9ZllyLB9Wb29CZ4FUwReFUZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745356616; c=relaxed/simple;
	bh=+m0+rZaMUVhx55kLzsDbefp3yOwpOWuZ/8QI1r3dduA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MSiOoVgdoqwP+ac+31HjzkRd/mmLBBTtuuZnqocycpVmC5dXIHgL9KG77T3YCX7tF3iVd+36sd79jdSmvTrP+Lzbpj/ONgpdo7jB058QYne6Fr8Nvn+gp5rxeN06KLUbbgmmGYZl1TR/jRKL6iFegB1iqkPr9W2ltgK22rN/EIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=fkGqwW1l; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="fkGqwW1l"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7c08fc20194so323281185a.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 14:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1745356612; x=1745961412; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+m0+rZaMUVhx55kLzsDbefp3yOwpOWuZ/8QI1r3dduA=;
        b=fkGqwW1lubqk6OOyqkEYtzy5ew5RKHH+XAr7AIeJxJZVOtDR1fLjUm9yMBNoL8aBgW
         F9lggnX6fX3GMfphgKfZwupC6tAlbd8Si8s3gbyfEJw0PcZCTz5UM6StyCLgbX7OGNHX
         5N/8+mi+cfvyrrkIbOe6JdeaZV27zqTzoFgqgT6jNQqhJLhuDgve5uhEz2C0oOgLgFSc
         7Fdggj/hYsTcYAZKVny2xRyOOv0gPqxnXNWpcsA51kBshSifFNlDmTWrdOPh5IpTA6bT
         tH/C0dsYjGvq9HUJ9DEvO25Js9DpMfA0zquqTPy6Mm9PcHwZbaNOfot2sDQuldYje8om
         yzVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745356612; x=1745961412;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+m0+rZaMUVhx55kLzsDbefp3yOwpOWuZ/8QI1r3dduA=;
        b=RDP6bdn1ijOBHyajRikSUBs+3dy6eJxeOmuMuwgaO/8g6y7/7OrUg863hfwZt8cozh
         IRpohL5FtYU+Phj96dvsCwyeXPgPVJAbReSV/dwY2tfMJC6qRsV5W/sOwY6o21Zm4kZA
         3xB+LTEY3sg58Dei7QEN1xI+6M3Wzy+i8dVQKLAu/77Nt8U85D8IQIB2QijHyOVHwgjW
         GHCdne6uB3o2FTXVfPQhrqzeFB4pZ7Ipqr2qd3xgsdjzdFUjsjPrYl6O2LULMzoKtH9K
         YodmiZUr6Z/ovOR35lWldLzphBA9s35ROucCC44gr1H106QvUZuKN59n0ingJnqloxex
         W/ng==
X-Gm-Message-State: AOJu0Yz4JgrdL1LD/QJfpg3eoe8qWTRwDf6u4BCLRrQ6/aj9kakRlo+B
	MRfrWpSrXb0gsAtTbOkBjFgOvo3/RJ33CB32RGgwmqW4xG/5geDdPPqf1aVCWsM=
X-Gm-Gg: ASbGncuvOUQcowssddSHTwjmkDxmVbhW59igJbWdYwAM7QyNaeb5W02qnuDnMD52w04
	ENVTx/Y65l21j4vr7fB8sm5xCCwEtSuHU+G8TjuP8WNrJPHu1NzlZqhSb2PwPVw7VitwwhB0Vt/
	/ddgOc5oYzcVRdcNZn99Lk0wl+ddExQrjtrUS7FtKoRbvUzBufG07zvne89PI7j1oZFblQ2AZ7l
	sCIexBWrp3WWiJjAxMGBMH1VUvK8kOJ307AwYrpbtLCPvC05J1DIZpo+7eA/p9jJW+OMZ7ryPpU
	M2rm+B6U2rEfDLds385Cr2rDL7hpULsoNA5DVNvuNp+YAg==
X-Google-Smtp-Source: AGHT+IFlVYwQrlKP3gWhwX7NhLyudB3xEPPmGML846D2Ka5x+PhwfULA1XTH/jRLhi8F5/suU+o3Hw==
X-Received: by 2002:a05:620a:1929:b0:7c5:562d:ccf4 with SMTP id af79cd13be357-7c927f59484mr2864605185a.4.1745356611750;
        Tue, 22 Apr 2025 14:16:51 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:9913::5ac? ([2606:6d00:15:9913::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925a8bf65sm601475485a.25.2025.04.22.14.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 14:16:51 -0700 (PDT)
Message-ID: <b24a722c7d41eeddc02b81226132aa55d7a82bf3.camel@ndufresne.ca>
Subject: Re: [PATCH] media: amphion: fix potential NULL deref in
 vpu_core_parse_dt()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Markus Elfring <Markus.Elfring@web.de>, Chenyuan Yang
 <chenyuan0y@gmail.com>, 	linux-media@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Charles Han
 <hanchunchao@inspur.com>,  Hans Verkuil <hverkuil@xs4all.nl>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Ming Qian <ming.qian@nxp.com>, 
 Shijie Qin <shijie.qin@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>
Date: Tue, 22 Apr 2025 17:16:50 -0400
In-Reply-To: <23cfd97e-b520-4e9c-a193-e0fdc885e299@web.de>
References: <20250411184356.2910366-1-chenyuan0y@gmail.com>
	 <23cfd97e-b520-4e9c-a193-e0fdc885e299@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Markus,

Le samedi 12 avril 2025 =C3=A0 17:15 +0200, Markus Elfring a =C3=A9crit=C2=
=A0:
> > The result of memremap() may be NULL on failure, leading to a null
> > dereference in the subsequent memset(). Add explicit checks after
> > each memremap() call: if the firmware region fails to map, return
> > immediately; if the RPC region fails, unmap the firmware window before
> > returning.
>=20
> * Do you propose to complete the error handling?
>=20
> * Can any other summary phrase variant become more desirable accordingly?

That could equally be a machine replying. I'm happy to get help with
reviews, but his isn't useful. It simply confuses the least experienced
submitters.

>=20
> * Please avoid duplicate source code (also for corresponding exception ha=
ndling).

This type of comment only make sense inline, there is no true
duplication either.

>=20
>=20
> See also:
> [PATCH] media: amphion: fix potential NULL deref in vpu_core_parse_dt
> https://lore.kernel.org/all/20250407084829.5755-1-hanchunchao@inspur.com/

I already stated I prefer this version.

Nicolas
