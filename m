Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF34268C51;
	Mon, 28 Apr 2025 16:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745859036; cv=none; b=CnxAZeKdihO0rbc9KQuORb9rSayigg6zHjTlwCG1BqSMJsFpkzlAUL3o4/t55CPErI4oecxS7+TZEHqxA48b3N/sEjWSWeWeKbeU4d0hgMEUt5uqKr/b8PMaRsck6zSiaVP/SQmemEUk3cilf7u5WL+JisdGfEHlGB7H563yCr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745859036; c=relaxed/simple;
	bh=jDCO39/hs+ZwMillcnuEdfEDY+rJe1BnRJvppt32CF0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eZSPee2S3pH3EYwHxc1C0GEFuMoGEtSLitGqs71ZBF7H68KW0yEsQfZ5m5n2VY9Nq2JKvNoV7VUjSdYkCfeFU/Iz4M3UsxWbpPta3DLK4AjIzOvG11dJom5bQJNHPKE8Gm25sAi5uAyTc11s9Q0l2xAhvb/SJHAwxiKdH4vKSuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YpD1hQQj; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YpD1hQQj"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5f7ec0e4978so3017517a12.1;
        Mon, 28 Apr 2025 09:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745859032; x=1746463832; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jDCO39/hs+ZwMillcnuEdfEDY+rJe1BnRJvppt32CF0=;
        b=YpD1hQQj0X65SKOSDPm2WKk7V0Gdd13jCcShqT4cIUau5DMAE0oHu+F0NHqOn7i+Do
         fzxB2pU2+z00mQ+lz9fosf4Of9H69yOSBXkDCJS2Q/S8bz0fbGxeuKbCod0x0krKhm2V
         Kh6gNvgQ+XHg47swrB8Im96md2qrZkL9D+nXD+au9xy846mZFkZufnracH+SbwxVzfLD
         O83E7UL7Nx9X0k4xKUbfEmXZzF4d03tC2y3pn85720BZCe7rH2K1WTh1fgPZpKfzjgCX
         3TqExBVpYBSS9AzbhEGSJQnCum/vE2fDBAeuKbvxn5QUnOmAnKJommQ9OGKK2BXn0Mjl
         aLMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745859032; x=1746463832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jDCO39/hs+ZwMillcnuEdfEDY+rJe1BnRJvppt32CF0=;
        b=HQLoYXF2zk4CIkMpK+zaI37k27TDeK2CMSh6LPgwc7/9QgOoP18dvAXN+R2jr0N0RP
         Tu2vTiPBaVGGJWAEAtgDl4Hbz9WqmtnXjd8A2yPfsFDQlBUd+MtZHPF2sET61wiiT4VK
         l/TmwOF54d/1UaEksJ1azZeJe+lhxGTo0s+AU2G5tsqL4lMNaxNKG9ts+dqAwp8ek4x6
         UWWanT+W6wAKt+TnoklNxtpP6EsMW4VmtiPeow9W+ZZfBnabXFlKE/5NTgnnpj9r1x31
         SSvf1fUgfDXTuVRLVbC+sle8gvKqxVijSrf6aLKCmrEMRYQzhGj+6AzObfgWgQZj2M0m
         OjZw==
X-Forwarded-Encrypted: i=1; AJvYcCUxQ4K2FOQAbMc1D0SOAPnR11ReFEpE1Jkm7NZc5fev51BBHSj8BIg3883EFRx7HvGawjMhABXOz5AxgY8=@vger.kernel.org, AJvYcCW/N9hz/v+O6Wntdpn4AyWWfWVXVprR7cATgKKWBPQ/kTdag7rsYHY07PMv/d2VL21fj1oPYBLvAPdV3oA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzauUgEXfpTWbcb98h/CN3mUGomj1dEh/B9qDY3Ru9QkZgE0kMv
	NRPMwfNXdeVy2kjAHv9aJukAyLNjZAr1iRSlzJGJZlqN6rdcZ1BcGc4eJkonbgUw0PnFCClClD+
	wvURQwhEg8A15Vec3m5Twe+UqLBk=
X-Gm-Gg: ASbGncu5hoa8CV+hPGO6YyaZygc2R1sEuK5HuZWQnAhCyBSyGILm0wcTuJ44OQ+vUvo
	1O1BlWMvoxeihvhn/M8z1NSNHPvr4uh0W74NQ8Gq28+j54cj+Rt7XjcpVWupsE+4Wq8Jk4FprwX
	nEhV/geF/NADUgimAXBLHk8dc=
X-Google-Smtp-Source: AGHT+IGI8v7PDHY/Lp1BHCcSAppZx37v1ebO95EwXmrWNUcOgw1ylwg5FVKqNvX10dP+azameA3ze2h9GEqyI9hzmew=
X-Received: by 2002:a17:906:6db:b0:ace:4ed9:a8c1 with SMTP id
 a640c23a62f3a-ace711175e8mr827843666b.30.1745859032158; Mon, 28 Apr 2025
 09:50:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428161236.126200-1-laurentiumihalcea111@gmail.com>
In-Reply-To: <20250428161236.126200-1-laurentiumihalcea111@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 28 Apr 2025 19:50:10 +0300
X-Gm-Features: ATxdqUFmw4_SpJjE_h3pfWCT_7xaVQP1K-2_RunOVPd4ywM1CYGZQMncxadN-Vc
Message-ID: <CAEnQRZByMFrDoPsQ+aoqfS7+1eDuiLGZYYywf+Cn=hGjRm-BzA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: SOF: topology: check if machine is NULL during tplg load
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>, julien.massot@collabora.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Mark Brown <broonie@kernel.org>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 7:16=E2=80=AFPM Laurentiu Mihalcea
<laurentiumihalcea111@gmail.com> wrote:
>
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> Check if "sof_pdata->machine" is NULL before calling the machine-specific
> "get_function_tplg_files()". Otherwise, for OF-based machines (which set
> the "of_machine" instead of the "machine" field), the operation will
> result in a NULL pointer dereference fault.
>
> Fixes: 6d5997c412cc ("ASoC: SOF: topology: load multiple topologies")
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

I think same patch was sent by Julien, but this one has better explanation.

Julien, I think you can add your S-o-B tag here.

Thanks,
Daniel.
