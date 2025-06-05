Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E57E22AE7A;
	Thu,  5 Jun 2025 13:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749129777; cv=none; b=LiUj43IkJzoxnatZ/6u4pOrBtwV1Mib8lDwcuEuc8J7DKkr7dYMLHa+9dJciByjlhW52kyFMK1v/of83+c/u+6nJZPjYEsOb032mjJWciekD0w/l/xe39DSd+zJI9c8Yonll2KsVM2Bd1NQVesKddtWDgsfV1a7kA8MZWu3Bf8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749129777; c=relaxed/simple;
	bh=Of4vTHHo0c3fLH3Y13EMcDavOhIYjcqdwDcNmNcqIeM=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=GmGza8XVTy9SvXzYDHLGsvxgO4B32+o8xZgZIGKDHoIgE4c4+OoLKk8KdJIRfpseaM1E5MnprQJH3ZZ04YrgjsnJxbE6uCwvNaYWogC+AbMQl/+02RcQ0SF+YHE3+/9ziQgMmGht9THwmrcNEdnJKvHct1Z7/6He699o0s8nCSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iy4dNI8o; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iy4dNI8o"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-601dfef6a8dso1773293a12.1;
        Thu, 05 Jun 2025 06:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749129774; x=1749734574; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Of4vTHHo0c3fLH3Y13EMcDavOhIYjcqdwDcNmNcqIeM=;
        b=iy4dNI8odxi+pGphSf9nQj7g17ZX948XgOTDcZ4dfnhLU44qQyvfrE2XE1zermb1wc
         Oz7nZMClujTzcpih/vEWqmU9yG/CowBc7kpVsAdv5OmZBTv/Cz6vSyw1vAIeCcK53tHU
         8b9lAMEcshQ6JylySqXuHl8RVsvozKChZ3B/cragVGmh9ogA/UAO4KtAEBrztCD5MAab
         0lMfGzmZgqmH81LZ+qrIUkBRJlQ+2jVAmvpzBLAUW6o7DFnzyK0ThZoTOMds4pLNOL1G
         WB3O6+sDu5Sz0yRKhLzMfjpwI/U9fIdkhYpy7RzVYnDTqEy1+hTI2omJUMKX1gg6/yfx
         8ixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749129774; x=1749734574;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Of4vTHHo0c3fLH3Y13EMcDavOhIYjcqdwDcNmNcqIeM=;
        b=DINkh7Noq+j9FijiXidNmp+YEQfVfphX7hWXpBN0ruiMxoZIdd4LUCdG7/I4cEDE4u
         C5ts8xbwcJsMsj/JMbs9tUvh4ibAdJX8WqeE5y3Mif/f2W9gWBb8qFsxd94ckTKXHMzK
         pw9dlpQJM9SXwtbbZDAaHS5zwFXfa3ldfjIEQMHCiloxA4aP974FQh0AFMJcZVL8eJv4
         wRPEqmC99/ZNUHUPqlNAoW45AUQj46pObL7747Z5iEGop2kIKzFA0KsbqEao96/AcXsU
         FOaemIAn3D3qjMnn7X13FmwyOMoswxepjdf2DPEMibz05uKUs+Cly2OzT3MoMxXjathN
         T6CA==
X-Forwarded-Encrypted: i=1; AJvYcCU8MxtGARsMZof2i8FmYkR2+/W0LH8vrwcEqCINE1gBCcD7iGnBgXKTzm3i9OyMEtMWQyhl/IrqJgAGHmNg@vger.kernel.org, AJvYcCUL6DVZOUk2exGLDbvpiVBVBp0UdDaHOQ334iwoG1lxy2/v8/DFAmORuoCofguvUWqHJC12CQnXbto3@vger.kernel.org
X-Gm-Message-State: AOJu0YyzPacn0iXUZnuTWEwCYeCQWHAie3C83DUuu+RxE6Z9iI2gb7Pu
	vdkdUfPtXDzL5lQNRDvWxStJ/CpBxvRTB7UQ02uR6v1pwGVmGYmbDY1V
X-Gm-Gg: ASbGnctmKpuFWP+TyhceR/ug8C/8lP0gmXF9yRFvInS5YgpFkdtMY0CmBZ8d30ldUad
	bnzgVVXUv8OgpkacYzD4pSZ9jGRJFhAnnDS6q0iJc9OCL2eS7mHwpu3BM/Tr/vmVC+az9CyW+Kt
	4VFAMlccJRhvmr4Wbg5NczjChFBxIZMPqhwLrGU6pKTzJh44fqSSOmKmEYPl8tEcIUcrNLWogYG
	MIZgNJ+QhLr36biaXqHrA0hxqnREHc+AEa1V4x62IHB5F9kdJVRyLV+gxmxW/VNwvUv1dWfPZCC
	dlJIfOgYzCbZGb6Jkb2xsQ2z9wn3FlNQG1ssANr5rPKZveZyNv1zMpvOivMp07nOL3ZsPdaiFFY
	=
X-Google-Smtp-Source: AGHT+IFzTwW0TcXzPL/9HV49c8h7szVsDRMxjGRBWs1/HHxFZV/8F9GvGOd1FZ+sNDL/yaa7WrK/WA==
X-Received: by 2002:a05:6402:358a:b0:5f8:36b2:dc1a with SMTP id 4fb4d7f45d1cf-606ea17a74amr6862983a12.16.1749129773399;
        Thu, 05 Jun 2025 06:22:53 -0700 (PDT)
Received: from smtpclient.apple ([89.66.237.154])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6073d367974sm313209a12.70.2025.06.05.06.22.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Jun 2025 06:22:53 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH 1/4] arm64: dts: rockchip: list all CPU supplies on ArmSoM
 Sige5
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <CABjd4Yx05SCm+03jWbsEP-A5AuhL14wLj=+VdKyQgqMbnxi3xQ@mail.gmail.com>
Date: Thu, 5 Jun 2025 15:22:41 +0200
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <512E950E-E8CB-443B-8E47-79F073D217E8@gmail.com>
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
 <20250603-sige5-updates-v1-1-717e8ce4ab77@gmail.com>
 <6656934.DvuYhMxLoT@workhorse>
 <CABjd4Yx05SCm+03jWbsEP-A5AuhL14wLj=+VdKyQgqMbnxi3xQ@mail.gmail.com>
To: Alexey Charkov <alchark@gmail.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)



> Wiadomo=C5=9B=C4=87 napisana przez Alexey Charkov <alchark@gmail.com> =
w dniu 4 cze 2025, o godz. 21:12:
>=20
> On Wed, Jun 4, 2025 at 10:38=E2=80=AFPM Nicolas Frattaroli
> <nicolas.frattaroli@collabora.com> wrote:
>>=20
>>=20
>=20
> Frequencies are fine, but I don't think the more power hungry big CPU
> cluster gets any voltage scaling without it. Once I try to load the
> system enough that the governor decides to bump the big cluster
> frequency up, the regulator stays at 850000 microvolts, causing random
> reboots when the whole cluster starts starving. With the patch,
> voltage oscillates between 700000-737000 microvolts in idle and jumps
> up to 950000 under load, and the system seems stable.
>=20
> Here's what I used to monitor the voltage (there must be a better way
> to do it, but it works):
> sige5 ~ # watch cat `grep -r . /sys/class/regulator/*/name | grep
> vdd_cpu_big_s0 | sed -e 's/name.*//'`/microvolts
>=20
> And in another terminal:
> sige5 ~ # stress-ng -c8

Alexey,
I see you are using rk3576 board like me (nanopi-m5)
Have you on your board correctly working cpu dvfs?
I mean: [1][desired clocks reported by kernel sysfs are in pair with =
[2[]cur clocks?
In my case i see mine cpu lives totally on it=E2=80=99s own with dvfs:

Requested is [1]
Running is [2]
Measured is [3]

random read 1:
Requested CPU4: 408 MHz=20
Requested CPU0: 408 MHz=20
Running CPU4: 1800 MHz=20
Running CPU0: 1416 MHz=20
Measured on HW: 1579.03 MHz

random read 2:
Requested CPU4: 1608 MHz=20
Requested CPU0: 408 MHz=20
Running CPU4: 2016 MHz=20
Running CPU0: 1800 MHz=20
Measured on HW: 410.33 MHz

random read 3:
Requested CPU4: 600 MHz=20
Requested CPU0: 1800 MHz=20
Running CPU4: 816 MHz=20
Running CPU0: 1008 MHz=20
Measured on HW: 2275.07 MHz

random read 4:
Requested CPU4: 1608 MHz=20
Requested CPU0: 1200 MHz=20
Running CPU4: 816 MHz=20
Running CPU0: 816 MHz=20
Measured on HW: 2114.58 MHz

this is on rk3576
on i.e allwinner h618 or rk3588 all looks quite normal - [1] and [2] are =
equal... =20

my scaling governor is on_demand - so for sure clocks are dynamic - but =
i.e. on 3588 with the same binaries - i can't catch -at any random read =
- that requested is not equal to running while on 3576 almost any random =
read gives significant differences.
=20
[1] scaling_cur_freq in sysfs
[2] cpuinfo_cur_freq in sysfs
[3] code to estimate arm cpu clock from =
http://uob-hpc.github.io/2017/11/22/arm-clock-freq.html
 =20
=20

>=20
> This might warrant a note in the commit message I guess :)
>=20
> Thanks for your review and testing!
>=20
> Best regards,
> Alexey
>=20
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

