Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6381E7C3B;
	Wed,  7 May 2025 05:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746597462; cv=none; b=gVZHYPup3SboQLyZVNW8oGfjtOM/6kUVT3tY1sOc7qi92wAEJyQQY6KBJYWLR3XPN71FvfvM0ta0IY1GTNwPlpw4qzkGmclmva+rmkjHonwrgh17GIzVcOJXT8eZiSM0Aks2+hptsOIndPCVJBsAiUw7FHK0y7VeMACnJtWDzto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746597462; c=relaxed/simple;
	bh=cxsBgxzXrjHlyhpzEVh1b+vFhILuzbmXu0nJ51K/W74=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AT+y8eJvLjpxKQYdTj0nYArW0S1eKOgn/3EDIARm+zLB9+50QJbQapvydsbYesiQ42Hf4whG+ONNvJwlvzSfvBrq6A0ELYzsOGpDQ2t9TwptviCPBLi5UajeRfSBL2Sr1b+Nzt9BIvOWemuaXSo28TCQpVO9SFnDIqFRXuT68vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rk67TViE; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rk67TViE"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-47686580529so75413381cf.2;
        Tue, 06 May 2025 22:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746597460; x=1747202260; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HufoIjmNyVzcJFg0jomA8QUVg94XLpMUqr8P5yXKbvk=;
        b=Rk67TViEcEHHMt2lE+EYLTAo13FknV57MTrlE4Fjv5v89wVnldFS/cGqFbIS/dfM4f
         VRIgQPcAenePs5IMMR7yzyIjhIpUflf8G03GE2GGKu2jCZPW74+1g7NVGMKQhjalWFy+
         3e3htvPne5W9V/NETGDb2/v0SJNRMirk2tDkxs8/ANyCre1tklA5Z6DGblBvO+TNBZUM
         hQZHNyoGerr8hrCW2W6wH42ZUpBttO44Dg/9m6/t0XlFnGma5Ak75SmsMXeb5GwXCHQe
         P2sZyZJefwSqArii9AR90Tw8+yuRjP6bqp7v+3q+bq/VFcgfyrd38vScp570ZEEetryY
         +qIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746597460; x=1747202260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HufoIjmNyVzcJFg0jomA8QUVg94XLpMUqr8P5yXKbvk=;
        b=j8K+AoT/C2RiLguYd1CbsC9uOBpLUJiKUfzuOkFL7UuCJlzl2Al9CxgCP20dWZimDL
         ti0NU+kkR1Qt8r3he7jothFZmI1nP63tBszYp6XxAPW8qEitkTIQnH8QPWnq4rentHdE
         e6xp9Bnb8Y/z/SPbStud0sPf+6f2DJW8z2mgM5rtclX9RjQkcOKWUWpbgAM0N2dinP6E
         lua1ksKzgTjtp7x9g6U1ov3N6tFSw8JXfcY+zvdNEz97ZF9XhkqdS8Lvisutf4TxGlZd
         neEnF2SpWzIdO7wMPseae+ukkrUTjJ0dx296AYO5jAaTzXDYYfxkZ+eJN8ugkYmIy429
         845A==
X-Forwarded-Encrypted: i=1; AJvYcCU7FAfatxR14/1yXOT49/fUyAknYB3Qg1JCLzdDBC5fZSM5XP2YFMJxmfQkaDcrWaD6J/MOpm9ztHHa@vger.kernel.org, AJvYcCUya08TIH/JdmLuGDoHmZhNKY9Of8IQkVyuDMnjZUx2DUgHplXAPAe/ce/G5FUJzFkT9k8yvIBtzlLg9tV/@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1FI672iKv/oR+gj8Msdl3vgu/UAmCyj+MPPxTDDQRCeuURTYv
	AVoMCMTaYPFqPRS0/KpwtrdloZHGvQSevO2d28jwB/GVaKpB9TtTHtJeYgoBo15c4hmWaBsyqHD
	uXEq+L1U5pYZe2+E46tedfHyozngB4RUoPKRacg==
X-Gm-Gg: ASbGncttJ34ohiEMGhgV01TCqJLaeYc/A+AEwjMajQaemsV6j7+9cjwV91rPHuq+jti
	ypsGkBnW54UHie+FQNkaEGUjG+9O/t9rDfkI9OMkviRlU5M8wR5HrKZuo1EGGlRk0a3y1Q4RN3a
	hHxiF2T7MmkPRxlO0AeSIT
X-Google-Smtp-Source: AGHT+IFRCluZQlhxPKsFdNka+okgx5aQmUZgSazAz02utL1/C+ZaDsPFqak1m4n1xLXLSRPrTvV/l0A6YJSFNyvzJeU=
X-Received: by 2002:ac8:5ad5:0:b0:476:8d3d:adb1 with SMTP id
 d75a77b69052e-49225a42445mr25889741cf.21.1746597460173; Tue, 06 May 2025
 22:57:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507-vt8500-timer-updates-v1-0-6b76f7f340a6@gmail.com>
 <20250507-vt8500-timer-updates-v1-3-6b76f7f340a6@gmail.com>
 <8d3c2ab5-dfc0-4a65-94c8-48a94c850aba@kernel.org> <CABjd4YxjC13H9G+ZpQO7EcmA4quu-9OMYjc5z6W5z+f=pwkTbw@mail.gmail.com>
 <9e8f1384-ccc9-4c99-bb31-2d3868bcd418@kernel.org>
In-Reply-To: <9e8f1384-ccc9-4c99-bb31-2d3868bcd418@kernel.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 7 May 2025 09:57:29 +0400
X-Gm-Features: ATxdqUFg7Y2xJtDfnU-UW7rha7DBsuYJ6UYd2cMbpsuR6mErQtZfh0ULWLYbKv4
Message-ID: <CABjd4YwGMe=iZ_jsOLdLt0p43vP4ZSEtUa0X0xzKLA8kfatVqA@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: vt8500: list all four timer interrupts
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 9:52=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 07/05/2025 07:48, Alexey Charkov wrote:
> >>> diff --git a/arch/arm/boot/dts/vt8500/vt8500.dtsi b/arch/arm/boot/dts=
/vt8500/vt8500.dtsi
> >>> index 2ba021585d4889f29777a12473964c29f999f3a0..d1dd37220d41becece5d2=
4fbb19aa71b01723e35 100644
> >>> --- a/arch/arm/boot/dts/vt8500/vt8500.dtsi
> >>> +++ b/arch/arm/boot/dts/vt8500/vt8500.dtsi
> >>> @@ -111,7 +111,7 @@ clkuart3: uart3 {
> >>>               timer@d8130100 {
> >>>                       compatible =3D "via,vt8500-timer";
> >>>                       reg =3D <0xd8130100 0x28>;
> >>> -                     interrupts =3D <36>;
> >>> +                     interrupts =3D <36>, <37>, <38>, <39>;
> >>
> >> You need to update the binding, preferably first convert it to DT sche=
ma.
> >
> > The binding change [1] has been reviewed by Rob and is pending merge.
> > Shall I fold it into this series when I send v2?
> >
> > [1] https://lore.kernel.org/all/20250506-via_vt8500_timer_binding-v3-1-=
88450907503f@gmail.com/
> Nothing explained that in cover letter or changelog. It should be
> obvious for reviewers where the bindings patch is and what the status is.

Indeed, I should have mentioned it in the cover letter. Thanks for
pointing it out.

Happy to resubmit the binding change as part of this series for easier
merging and full-picture overview: I will be making a v2 anyway to
address your other feedback.

Best regards,
Alexey
