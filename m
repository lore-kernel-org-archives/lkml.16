Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B15821019C
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 11:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746617678; cv=none; b=g7AEaECxfKREprgs7C7jecwRiSGewKLKNdQAUNvCZgYSPTT9fUdSQKaNf2r5MpW17MIrV8Udmzjhf/ZBqg2F8MeHVwoQYnCestIm+b2/DDWvF13XsC2vTrP/X2Fotr0FFMD6QCt4Fq5+8LG9swFvyEw23qPOIq1dndHouwYoNQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746617678; c=relaxed/simple;
	bh=jan/G1jQO8QSF9VgW6ZR8MQYcfJJl6I5cqB21kUF2ik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=djNO2DCwDz2o/9z28bpKoK9RieW4omBg2cIFvpWHZQGugtAgCeMmZcloP+Qs50KjfRGCMIMsyQBhrAF+odnTkA9uaPDpF5f9Z5KmT9aINoAfSnwT+gFK6RQ9WE62Ak354fIDrJmQ6Rn49lrVMzVU0nWA+ecEOAVnwjWMqJ7zbUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GBim/7vG; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GBim/7vG"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30ddad694c1so71873681fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 04:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746617675; x=1747222475; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jan/G1jQO8QSF9VgW6ZR8MQYcfJJl6I5cqB21kUF2ik=;
        b=GBim/7vGi65tic4KuM57tHL9NcgcAhw5EHWXDCx3XJ7aGSYr7JIQWr7hphcjz0oHTy
         cPpNoqL73F/rq5+AtZA1abaciUBaWQJeT2ZMgNL9nuBU4xSO2340v3j7QWwBJwolAWH5
         xhMzboXa6No6DHqdUm5jVc/X8zxz2BwHwtHaXN1Vc4jqbRgcHmeE+FTw/WX+gUkhcyix
         XqxjY+eYyR2rfsp/2cKe1d1PseNNAIO5oJ3rZFvJv2DYSk+SwAw4mG8yHQs4pr/tYjZc
         BRpbZkt4nIDuiw3G+etFxHTDMNax9hxHKrfw+RdBLTRay+3siqEBPvramSDQViEnneRL
         gOpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746617675; x=1747222475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jan/G1jQO8QSF9VgW6ZR8MQYcfJJl6I5cqB21kUF2ik=;
        b=LbJxDaJ5y6VhI8OVBuOPS4Sq2KMq1ViBGjRnMJLjszbfo34GmdofhsRVXLLjU5iGji
         tc9EhebShh9cHrilJHI/eUWh8+s2SQgLi3gX6b0BxaL72Ew2H6D+bw9qHV69NG/Rj6ze
         YPYP3WAInO1jLSwdK/intqMbN7op6YfPA4prIdP2EgydYRhLgVbNWqoD60OSxEnjUGQ3
         2+EPXxp7+Z2tearJjk9Lm4xVbzLZy2IF9vtHXwfmUy+fS6nBl7+nhZmONa5FAhdENI0f
         7Es71Q5BgyzxBUuDsodSjQLFUAL+zl+R8kqS/cBjsmbBl3nAbo+V4VdaQhmKg1o5kOwU
         mcXg==
X-Gm-Message-State: AOJu0Yx54kRcm//Dc0B7osNJONg2lYIcRQJ52dnJkxG6VZT41lZOxKqV
	QvmXGcOdIl3YKtEAILlTEwx8Mm+MWuXAF6sVYyKPIfYTRxjQt+ZWzBohUNczSAvYwB+GA3Byltp
	TV2XJ5baPsVZAkxqE1XgTIGHQPVQ=
X-Gm-Gg: ASbGncsdyP8SmgQePgBDA328ckG2Avx39GkfEt+UmMGD8E0bIarW92sTlTMwlh+VqOE
	qXOBjj3D9p1frLZK6lsR/2WsLfsXFvVXRyexVpgTnsMvdnYI+BD3bJIuI5mX9lXgj6GKHHxute3
	WrocTlJktbP+3nlKMuC0FICUU7hUtLkQNB+uCJxSKBSb/BFCfu8CnZRw==
X-Google-Smtp-Source: AGHT+IG7oYllQDERw2pyvJWmXVrE12zrrXKaUEIUOHTWAMUs72mMelYAuwrsPoTFhtZ/3Wy5Zk6JHEvDerw2HFlQK2c=
X-Received: by 2002:a05:651c:3136:b0:30b:b956:53c2 with SMTP id
 38308e7fff4ca-326ad1ba97amr10036641fa.11.1746617674951; Wed, 07 May 2025
 04:34:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507112131.3686966-1-tomeu@tomeuvizoso.net>
In-Reply-To: <20250507112131.3686966-1-tomeu@tomeuvizoso.net>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 7 May 2025 08:34:23 -0300
X-Gm-Features: ATxdqUF6JkkRipTIVERvqlVRf3tIXAdsBzMHDW0_XZtQPGtanxPvgGhL3Es3bl0
Message-ID: <CAOMZO5CK11wByq3BL9XZgvfFv1_kp94CNFMYDaEJ=WxcEFATJQ@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: Fix flush sequence logic
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: linux-kernel@vger.kernel.org, Lucas Stach <l.stach@pengutronix.de>, 
	Russell King <linux+etnaviv@armlinux.org.uk>, 
	Christian Gmeiner <christian.gmeiner@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, etnaviv@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tomeu,

On Wed, May 7, 2025 at 8:22=E2=80=AFAM Tomeu Vizoso <tomeu@tomeuvizoso.net>=
 wrote:
>
> We should be comparing the last submitted sequence number with that of
> the address space we may be switching to.
>
> And we should be using the latter as the last submitted sequence number
> afterwards.
>
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

Does this need a Fixes tag?
