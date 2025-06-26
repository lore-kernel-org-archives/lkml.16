Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6430025179A
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 07:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750924711; cv=none; b=OTuS6U9Q/J+vdf9m+wV6O/BWKj9i3L6ZK3Dfw3/LCT7XCMZj70Z5SmPig7J0iCIQbGvLfDjj8oT4lu8JdorDGJMFOmmvOZXddjiohULmu4nSYNmwiYalTuN2VCHaeuOVsgrQ03OpzePpA8cnOLzB1gEotH/az8NBQ6hvxtTrUZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750924711; c=relaxed/simple;
	bh=U956XuvvizaJ2RMiBSnvmF0Rf8XG8VxMKnFJYt86iug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dX/3GVkwMeRyw0MA2xm/74ezpTMYswkwLqfiPZYnQAlCZUvvrnAxbw7aRvcM9uEeXnW79I0+nRBfi4j193+qa3dNq2ybBBA1la4yCEY4uAgTrcGHYzURuSv8ST/DvqxA9pSChDaw+I0w3lgkFb+VwetJBmYQ4NX4c5wvO+yh2X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=irGrB+hF; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="irGrB+hF"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e818a572828so422712276.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 00:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750924708; x=1751529508; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aZ/4DEN1eZvLVjrRd2IQhI+AZUokpaevmaxAHJOdK2Y=;
        b=irGrB+hFB6dFJUbmHrzFQlswqrkXcWEcZpxOw0ern0ks7RkVk0gqhLyt/8OEHWnj3x
         NJOtLGTnU9Pw3BQy8vJkNzJvPqaVl1vWyuP1v/4ImIN6aHv+0Soxs2JOXcMrtvH6pcF7
         9QsoWU21SCdGJxlinHvgSgJu3ONXgOhr2nvJ6QzJQUjPfGmQr6VK5Y4erMKz6HvQtSvo
         PAeK+3vzBi/q/TzrhEd/KmLqo9TICOGvghgJ7X1+vr7wQwycRZ/y16Wg/aHZPudX4ZrS
         8h2VRhLPWkfKbxUhWvfI4o1HmckES642QzKQ51Z9ZoZaL92vN8ksfuC0niNzeYUurZJH
         56hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750924708; x=1751529508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aZ/4DEN1eZvLVjrRd2IQhI+AZUokpaevmaxAHJOdK2Y=;
        b=IqRPNz9n6OLKF3+C/74jHX1DvZfhHx90oyqZee7aKhlm8qRWQOba1Wu/rW1/h/PL6S
         g5KwCYga9dvdEMuULk49DQ3KWPpv1OxGLX+aguhciOUoOgmqVXanZ64kfstJtDCYGzQ7
         aakkHhWywis6cJBohwhh70li+zFxq8z5wwGg60Ul40/xMQsGIxDesn1Z+3HoRaCgZvNp
         YFpcqDN6o3VrtWbXaQb2uu1nCYyNr6536o9Z7y33e82B75NRXuw5rNoJso1ZS12zk56R
         AFG+zbZFuR2si/fxm0sFMi2zzsBkOX7PRVJ6puvTRzo/fSgtSZ/vnR0qFGErxx1dEIp2
         XRug==
X-Forwarded-Encrypted: i=1; AJvYcCU5FbB/M1S9NitGEgZAJiPhltayiz45jbA7KFDOvDvNFgNL8aKwleH5TwPKNJW3+jG/k2hw4l1z5VhNopg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzC+cc1lmWGl5Jh6gZxWLgBCdPHVgVHEEFsCx7twkQzLoTDCHOF
	b1p1C6EQgXHgLfnTP29jQUHs3QFiEeNqwgUT5d0dVTcoW1m1LJ3fm+eul3gOpjZiq4SkUMTiWp5
	6TbsXc/OsDPaSiIIwe/lAc7UjK4B9sYkAUvaHNRhx36Qf32TxY5i9Teq4dDMHcLc=
X-Gm-Gg: ASbGncuAwNoR+WmHBDwoROynjljqui6lObXMHXLP60ImcpKiLl02EgRWx+/arikd1lT
	rPuKQnP5fl+rItzPhLOsC9Gi88j9xMYuN7i5VI8Acu5N5nLWwrKL7v8OfdwhtAe6TR7TxJxWh/w
	WtLdFldjdBUtt5/IBobKuE5zwT3v4tad1AZnRxmnKNP5o=
X-Google-Smtp-Source: AGHT+IEzDH0NRWqzIEote+KhgyU/fDNmW2VP0PKdVNT2yILrISQmmaVeujNnwl/coWmd3McvdKX6qUuA9VblGYbEEvI=
X-Received: by 2002:a05:690c:3391:b0:70e:2a0c:bc5 with SMTP id
 00721157ae682-71406e1ba1fmr85608977b3.38.1750924708356; Thu, 26 Jun 2025
 00:58:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250623-k1-dma-buses-rfc-wip-v1-0-c0144082061f@iscas.ac.cn>
 <20250623-k1-dma-buses-rfc-wip-v1-2-c0144082061f@iscas.ac.cn>
 <CAH1PCMZ1YUC9SLOSEuCL3oUhYN23UOL+kLrOk8fbJ+EG-w3Umg@mail.gmail.com> <965d5dca-72b0-47da-bd9d-efeca16db826@iscas.ac.cn>
In-Reply-To: <965d5dca-72b0-47da-bd9d-efeca16db826@iscas.ac.cn>
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 26 Jun 2025 15:58:17 +0800
X-Gm-Features: Ac12FXzAOZiKHwn50uOUxMMWJ46pZGPTTL9IzHlqGbLf3HaSvxr5iudx5ZkTgoQ
Message-ID: <CAH1PCMZp9pr3SKYroyDfY-p5X=ojY5ZPt8_m7xXLejEzH07QOA@mail.gmail.com>
Subject: Re: [PATCH 2/3] riscv: dts: spacemit: Move UARTs under dma-bus for K1
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Yixun Lan <dlan@gentoo.org>, Ze Huang <huangze@whut.edu.cn>, 
	Alex Elder <elder@riscstar.com>, spacemit@lists.linux.dev, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Vivian Wang <uwu@dram.page>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 11:21=E2=80=AFAM Vivian Wang <wangruikang@iscas.ac.=
cn> wrote:
>
> On 6/24/25 20:21, Guodong Xu wrote:
> > On Mon, Jun 23, 2025 at 6:04=E2=80=AFPM Vivian Wang <wangruikang@iscas.=
ac.cn> wrote:
> >> UART devices in Spacemit K1 use dma-bus DMA translations. Move these
> >> nodes under dma-bus to reflect this fact.
> ...
> >>
> >> -               sec_uart1: serial@f0612000 {
> >> -                       compatible =3D "spacemit,k1-uart", "intel,xsca=
le-uart";
> >> -                       reg =3D <0x0 0xf0612000 0x0 0x100>;
> >> -                       interrupts =3D <43>;
> >> -                       clock-frequency =3D <14857000>;
> >> -                       reg-shift =3D <2>;
> >> -                       reg-io-width =3D <4>;
> >> -                       status =3D "reserved"; /* for TEE usage */
> >> -               };
> >> -
> > Are you sure sec_uart1 should be placed under the dma_bus? Please doubl=
e
> > check. If sec_uart1 and other peripherals supported by the secure DMA
> > (base address: 0xF0600000) share the same address mapping as dma_bus, a=
nd
> > if they can be accessed by the linux kernel in some cases (as saying
> > 'reserved'), then that makes sense. If not, better not move them.
>
> Hi Guodong,
>
> I have confirmed with SpacemiT that sec_uart1 uses dram_range4, a.k.a.
> dma-bus, which is same as the rest of the UARTs.
>
> Also, sec_uart1 is usable in e.g. Linux, but only if no TEE is in use.
> Using status =3D "reserved" is the safe choice here. Platforms that do no=
t
> run a TEE (or anything similar that would disable access to the
> 0xf000_0000 to 0xffff_ffff range) and wishing to enable use of sec_uart1
> can change the status to "okay".
>

Ok, with that confirmed, I'd say this patch looks good to me.

Reviewed-by: Guodong Xu <guodong@riscstar.com>

Thanks.

> Vivian "dramforever" Wang
>
