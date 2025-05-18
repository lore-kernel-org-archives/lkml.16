Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27531E3DE8;
	Sun, 18 May 2025 12:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747570001; cv=none; b=hT4hONFsL0JVACfkjtcs/+Rcm1W/A0te/bVJ3Zd63cevnGPQNeliVQgAD0HqUQCFnakczXYMGLfZR9V1tjX9Dbej7gI0HbyuxQqb8QU2qM6FQVee/aNrmAPBQb7JRWDxzPDIjzJ5SvH6bfPezQ4xD5bJXTG12Ywov4KrmK+4sgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747570001; c=relaxed/simple;
	bh=Z9sPuqChQojAWKg0fz4wkdvAY/+fmKjMSJBj97hXBxs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VAlxO+mY2ebMFVWcnG+H0Kc6uRTyAbk4iqBBwNcSin4ACuGdltNRFeE3DFA0xEKn/OivFukbMqG8lUpCHAl/Bg7kQwn7NP1qPIaC9OGhOvkzq4FjoIuwL1JlnKexkKcsc3MKilxUwdLpEWOKvt7XWnIILFNlm4n282Nv9nhyMRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RLQSjWPV; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RLQSjWPV"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-ae727e87c26so2192076a12.0;
        Sun, 18 May 2025 05:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747569999; x=1748174799; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9sPuqChQojAWKg0fz4wkdvAY/+fmKjMSJBj97hXBxs=;
        b=RLQSjWPVUAioNip2uBsb++ryC3etl7XP1qQiA7Z/ENij4DijO4LhhZlk9jFRV67rg+
         PmB1MtdOyJWuJOQUyccSc+OOCkVQwvAa2Uv5WpMQWv0w7BkIZMWprNH1APcTZiB02Sn2
         zDQho+cKXCa1GuK4DyWn5ZooZKOBoXzC/aTJxS0az1x+29EBvvQQfLTvUWaFoxTtmHwp
         BZPGzlsa61PQZ3NdjXjBdPMxMo1w+Qye25pit0JW1RHGLpNttRU2I6jiM8SVksSQoEiX
         VQg9vR9vtDwCrKl9J/hm2M13JBHyK/QERSJS14YHwSUJ3/LA9si/GcjWoAfv6Oi4drS0
         HGxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747569999; x=1748174799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z9sPuqChQojAWKg0fz4wkdvAY/+fmKjMSJBj97hXBxs=;
        b=Q4wtt57/ij5fhN7UK1fCoVdrV5Pufzh//JqnTpv5S+AfUiyuUa3rXaIHXVv2bvm5PV
         5VUz5f5wKZddgTEVPpYuU+P1QmK8sGLGIdZrJlI4L9GIk/uEAaAM4kI346OhUhwibOf8
         QLVhnKpoTLstd2ENbRxKaqAvABKhwBtNXiQf25x3yIzsHrn+g6jipMIUKABqYC6ADGVg
         ey8mXBrycdsvK1yPozUYg3hdTytGy/zZfAVRrqyiEeXyWIepsVjYeclNl+PI2boXPM9g
         GADZiLhwTsekl2h69Nsk6bTc0/MfR/BWg3PDaqFOlfSI7CBn4nRzCZqxcdfqHN3+JG+Y
         de6A==
X-Forwarded-Encrypted: i=1; AJvYcCUVsBrQzezlkrHRqXIy/OOXboXnRvUURjEVyOm5tzBFMnzYdCFWYX8Ma58k137TISaEXUvAm2QLVTYq@vger.kernel.org, AJvYcCV6sWVkhVcwRaZRHzuyR9P3no6ktaj9T1bcNOV44MgX6QYKvzhSolhOrl64Awp2LygLypxozoBJfmxgP3LF@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc7MY1MI62N7KabKOh4IEkoz4JZ0SShZc6tHUVaeYyMnkQnIeN
	ydWMvN7WBnGFLKjAnCITZ5c5/3RX7VEFHxJfEIk7/mdQn8wIBHLfLZdC/yCqdYwIzqrUdvsJJxx
	GncWUmfDVqxe/4VxmgUi4NlfC8PiN1l2T
X-Gm-Gg: ASbGncvnSTzvBjlp1AQkGCaJlfdlE6kmXICq7wySdwwxmPmIfHFWElCP3+VidQv8AyS
	sEGh/k9kxsE/flfqpJ32wRsrKxPgcCMtBQnfrkOoYF2qAa49TmmdKCfjGeorL0/ScsAfCx91SnT
	UdMRGpvnoBmCM2AuvwaF8z3p+58nKxQZ+qGyQskHNRvS7ICJDSN7e3Y9pCkbw/v0o=
X-Google-Smtp-Source: AGHT+IE8Jj3CM/JmTKb2ASWpYNZZ62w/yVrXgUBmwdTYC8IuyZ/ZSj3++gk2EU+iZobraqih76E8olzgbMxd5+52uZs=
X-Received: by 2002:a17:90b:4b0f:b0:2fe:8a84:e033 with SMTP id
 98e67ed59e1d1-30e7d4ebdbcmr14696049a91.2.1747569998909; Sun, 18 May 2025
 05:06:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250517020552.737932-1-jihed.chaibi.dev@gmail.com>
 <62bd6757-c4d0-42c1-a76d-abea18a8a55e@kernel.org> <CANBuOYpRQNx+n6BjpAF0LufpUqRA3wU-GzSNygeWurohXYNF6A@mail.gmail.com>
 <5f7f8cbc-6501-459f-906a-250be5443d0e@kernel.org>
In-Reply-To: <5f7f8cbc-6501-459f-906a-250be5443d0e@kernel.org>
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Date: Sun, 18 May 2025 14:06:27 +0200
X-Gm-Features: AX0GCFuB2F8YdWG4M6QquX7RSLJifIP2KUvWmNy9H9sSlJ0n7sh9CbHxp2tuYXU
Message-ID: <CANBuOYohE0JofP6vnN_sLZrPkURDxRgOBCM2-NqtCPw1fZ24+A@mail.gmail.com>
Subject: Re: [PATCH 1/1] Fixing a minor typo in YAML document
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: heiko@sntech.de, briannorris@chromium.org, devicetree@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-kernel-mentees@lists.linux.dev, 
	skhan@linuxfoundation.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 18, 2025 at 12:34=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 17/05/2025 14:05, Jihed Chaibi wrote:
> > Thanks for the feedback, this fix being kind of "trivial" I didn't
> > initially want to include everyone and thought it would end up to the
> > main maintainer after being reviewed by the reviewers/authors of the
> > file, sorry for that, I will make sure every maintainer is included in
> > future patches.
> >
> > On the other hand, I can confirm that I'm using the last kernel version=
.
>
>
> Please don't top post. If you do not Cc maintainers, how is it supposed
> to be picked up by these maintainers?
>
>
> Best regards,
> Krzysztof

My apologies again for not CC'ing the correct maintainers and for top
posting in my previous reply. I understand the importance of both for
the workflow and proper communication.

I've taken note of your feedback and will ensure I follow the
recommended procedures for future submissions.

As I'm still learning the contribution process, I appreciate the guidance.
Best regards,
