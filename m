Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE7D2701A6
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 22:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745965896; cv=none; b=dOoz1pxpydm0pNPOZLX5398bFZJcEYlHNhd30OHewO2zc1bilSdOVxWnf2OkScoC+lxvZQhPFBiUkx6vh6bd9Y8mVd5qqX47A/iWnCsJmZMQJKnzorRYPFLcYRC5LwqOvTzUEodVd3C0HX2Nx2yMdAcHhAroji77DcshBewYcsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745965896; c=relaxed/simple;
	bh=Muz/IBVd38234DzRtmIrPAjqvcPfmz5s3bcPNClRuD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WON88JGIOE1heIFzDG1q/nmMetzEc6EQmD50ur70E/mb1Am38xXMQVQmway5qQsfLVosEsV9NMSQUW9X0Q1YJcZfrRBG3VwgyWJg1ChnPEy05IFe5V8H13njs+ebt70P9Wgk3rGoSc4epKNsXE70WwHnF9ZUYnCv32QesHtkvvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=evfEIwri; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="evfEIwri"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-525da75d902so2527774e0c.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 15:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745965893; x=1746570693; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tyFlZw4rIlDv7mRXlmbnpKYKfaVLPKDpm+FWHBjk6WU=;
        b=evfEIwriRFcOp2r9gC5GLoGnpiXpkVqvUhqWXfJE11OUeF/097T40Dc9qVAiUNZz0N
         oIYney0z+mgpUqoWgCGAFqkC0GPOwFKIeVICFiv96RKPEMXtnARmzUbdOAifsIU+/lh7
         5JgFgIjAfe6SIX/7oHHS549YGNLhQotQDnMgV6KVdbSOv/buIlpSszmPmqMgQvHtcLxL
         Nqu4COKlZMY2QY4sDYZ+DQOKQUyw3dAk+2df2jeoV1eQzi0Z6HYCY27giKmSyQqYjiKf
         XLxcBzwY7RbrcvnbdLn+749VhKJjbsdNAc/ApXSYpdDfHYlhnQ+Mm42UXPYsG4J5Y432
         6d6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745965893; x=1746570693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tyFlZw4rIlDv7mRXlmbnpKYKfaVLPKDpm+FWHBjk6WU=;
        b=Ho50l7AuZCYMFdkLVF9EFx7knKbM0EIFJHs2455Ymob11bxeRetDYaQh8PU16AtgM1
         LkGpUPHZyrMRGZzncSTY9RuXHkidYVlGrNgvDBs4uilXBNyq/LRxPgySqpyEM6WU3h3q
         4lnGCE4Soai6YjWYGKFsk89leMYJW/9ppp+81Q3Rabn2KaWpsGxK2mSfO6l70erLGUMo
         /Y+vetbbFZp5hKfA/g0J7AUfUX0vGyK2q3lA3wWS7rkhPvExTtBIab+qWwaWUL4P8xJ9
         OBthHkUtFGevVmhsrCX4mFbWhlGo31IkzV/8TGv8lnM6f1B8Z9tK/+w7l8QvlgUSnVyE
         df0w==
X-Forwarded-Encrypted: i=1; AJvYcCWFn+U68Qk0OWdhXCwZB0HEXQrNfC8FLhVN4ZpKpJW7p+LrkfLq1Z0dHJBCr6Zw5LHqMq74EYM3CMMkjjc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyLP+HZPxlHifrXvd6JYM7CBX/YtMAf6aWwc4DQ0DGENxrHcnD
	9heSI+pIzbPcUoDl3bqy/hrCE+tCwY+SS6rvIK+9Lq3j0+yL2GYCgOKNEYEUcihY/KvIF/OaWyh
	i7f5i/PdB9LQvBiAdhOOAH6aH73o=
X-Gm-Gg: ASbGncu9iLyD3cpmtqLU+eeZRCqnXCl8oNPGWKzgPwNzl1QkP81/XIgH2ontK5jXoba
	xGmvCMFqIylCby2BGIqXuvR+CG036gYoHusK8P21jaLCm/b/4t4qJdImkz8FzgZ6XLinIyhTq0C
	2bmdDiL5FioZkW9htvid4togq1SrIqgVkyg4tPgmiFmlHQdvcjAfUE
X-Google-Smtp-Source: AGHT+IFx3yw7sAM5yQ6zBnBuCz5GQkXv2WgJTbTYabw5FKr4VXKLZ+lyu7etEqs76IL+yQUoJnThSbvkwf7+0Bkt1No=
X-Received: by 2002:a05:6122:2a0e:b0:529:f50:7904 with SMTP id
 71dfb90a1353d-52acd8907edmr985080e0c.9.1745965893555; Tue, 29 Apr 2025
 15:31:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424101333.2908504-1-alistair.francis@wdc.com>
 <f3282cae-ce46-4aa3-8f55-dcc73da93d0e@nvidia.com> <0d46ca2b-3cb2-48c0-8e6d-989e1e5f9325@suse.de>
In-Reply-To: <0d46ca2b-3cb2-48c0-8e6d-989e1e5f9325@suse.de>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 30 Apr 2025 08:31:07 +1000
X-Gm-Features: ATxdqUHvxR3ZYqDI1PTg7F-zxT-6O74-9yaFVlMQJOiNRwTCZtKm7eYERz377_8
Message-ID: <CAKmqyKMixf=KR6tSZXW=ZxDxHfOOf7Nd00a=T3HKu6sr7-iH8g@mail.gmail.com>
Subject: Re: [PATCH] nvme-tcp: select tls config when tcp tls is enabled
To: Hannes Reinecke <hare@suse.de>
Cc: Chaitanya Kulkarni <chaitanyak@nvidia.com>, "hch@lst.de" <hch@lst.de>, 
	"sagi@grimberg.me" <sagi@grimberg.me>, 
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 3:35=E2=80=AFAM Hannes Reinecke <hare@suse.de> wrot=
e:
>
> On 4/29/25 18:28, Chaitanya Kulkarni wrote:
> > On 4/24/25 03:13, Alistair Francis wrote:
> >> Ensure that TLS support is enabled in the kernel when
> >> NVME_TARGET_TCP_TLS is enabled. This allows TLS secure channels to be
> >> used out of the box.
> >>
> >> Signed-off-by: Alistair Francis<alistair.francis@wdc.com>
> >
> > Looks good.
> >
> > Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>
> >
> > -ck
> >
> Alistair, I think the same fix should be applied to the host side, too;
> check the last patch of my patch series to convert the authentication
> code to use the kernel keyring [1].

Yeah, you are right. The host also needs to be fixed.

>
> Should I send out that one as a stand-alone patch to get this issue
> resolved?

I think your patch would need some changes to remove the
`NVME_KEYRING` part if you split it out. So I just sent a v2 of this
patch with a fixes tag and the reviews added. This patch already has
some reviews so hopefully it's close to being merged :)

I will send a seperate host fix as well, but I'm also happy with your
stand-alone patch being applied instead. As long as the issue is
fixed!


Alistair

>
> [1]
> https://lore.kernel.org/linux-nvme/20250425094927.102656-13-hare@kernel.o=
rg/T/#u
>
> Cheers,
>
> Hannes
> --
> Dr. Hannes Reinecke                  Kernel Storage Architect
> hare@suse.de                                +49 911 74053 688
> SUSE Software Solutions GmbH, Frankenstr. 146, 90461 N=C3=BCrnberg
> HRB 36809 (AG N=C3=BCrnberg), GF: I. Totev, A. McDonald, W. Knoblich
