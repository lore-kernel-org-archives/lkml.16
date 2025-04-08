Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BBA23FC4B;
	Tue,  8 Apr 2025 23:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744154412; cv=none; b=mWpddCslTuAfUlhkEDred5t6DawSJVnwtDW0ULztZw9MEJ+Xrb6SiAKkcUfMFm7NuwOuW8PKyMtk9tJgUmvPuBiPdZxU5GpWRujw7pHl83a7M6d0xlWhDzNsNrggryjKUrnKg16I279F8iQrh8k4XdTlpF1EXYOuDg3Vjs+2+aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744154412; c=relaxed/simple;
	bh=NPGSlYJwNwAIxWuWfIwr5rYkydh732r7iTc8MzULjA4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iQovUW7Qh8f7JM1ZnUETv4i4h5dAI5q7WBoFNw+kI7T61UAKuufkJtS4IdG0iLjnEzfrwOFvyEE7Q38QmvgzHY82t+nx4G6MDQB21NhtFa302UMTWVjm55DCDizuH+ojcBXo4TFnwht24RU/L8rOpEotfQP/HIe8NviX8zxLrqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dqBulqHr; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dqBulqHr"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e53a91756e5so5864967276.1;
        Tue, 08 Apr 2025 16:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744154409; x=1744759209; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q0fB+IKeLyIRbapePVfANbbyhFuIZhjPV0fgnOr+ssQ=;
        b=dqBulqHrmblt+oNEOjMCpVCP/3SENubuwzUb9paCrUxeuiHCQhQhI7dtMb/H39QCQh
         lClrDsm92lKLL0g6UYf7W0Q6aPFex5fHdqDG49JVu/cEP2mm1vNiRCG3IjiPYZi7vg6d
         4jDzLd+Kup3V0ogQsSMNaUJF+zm/osep5vMeSHN5Q2Mm2BN18aOQGFeEFNWgbAJpl3wX
         eXqjGI+V6E1VZxaOYRzBYLbPdZ1z3t1KvqiQoiMJ6k5Cru/DzkYVovQQdurVD63OEjSI
         dTIuQRdMXieeO2bvLMOy1giOVTRAILOodyP8uuFrAZr12bJ1hn7BX3hiN+lp+g4TbOzi
         A3oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744154409; x=1744759209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q0fB+IKeLyIRbapePVfANbbyhFuIZhjPV0fgnOr+ssQ=;
        b=BdKeAsFGr81URV1LPmEkeMKzh3VkcDT1LrR+pftohGYDnxrMFHgcQt5GOEGJlhbJVR
         38Szz0+goXNnaDhTI7bvNNiCZustpXDh4e5pdBJlFrGiDbzzGdq1cJiJrKINMANsphLX
         NeexFDw//dkNtat94lGSUOkyUK4KIYWD0rrr43puecK1xzO74STui6wNL3/lDuPJtVF2
         AKyHpEiqnuV2Hx17mEwBmLDyF0FiCi2MBWiamr6tbC7s0p1yZLmLFh3wKDIVRQbfj7vy
         P3ot9joPDW05X72+gR6WsDYhJsnBA485/uZ6uekn2FnjUX4Q734ODzUPKHVhrPT8vojn
         5ApA==
X-Forwarded-Encrypted: i=1; AJvYcCVd2xRMg50RPPEKMpFhKXZuexbF4V0oe2TKHF+Hfo3AUzxTYoc9ZMoiOCbi42odWHgoJtStI1su13vrlWBL@vger.kernel.org, AJvYcCXxOCVZSaqL4UErR8GytuG0Y5SwwyJArJTdVw5ALPIjWhYhoS4dmoPCfmkVzETPqDIdMLYnFWjKs6+H@vger.kernel.org
X-Gm-Message-State: AOJu0YyJY8Xh30GJdRW7yj4Q2zfAI/XHsDFJbrP/t8v5AVnEmo6Wuktv
	Fku/qOleIeqaqnDclsv6vP1RBQInKxb9VKFsgrlPgildDywofXTvqk+6CO4+uzyGLMHKQtGWj8P
	T81gSm6BXXbE5Ez13Uen7W5tWZ48=
X-Gm-Gg: ASbGncs6ql83gsRinaf8r0ih+qz3bqSo7v/gD3ychutCFDr4HzhvFYAzA/rnE/ngvAx
	aox6AjYo+85SsKtCW3UPYix0mnar2K39JrkQlK9rrVa/iVnDV7TwihLoqV7cGJIjUywByUyWNee
	To5K2J9pZ0wGj6lKBJShCyOIh6Fo0OuZPtNP9FVQ==
X-Google-Smtp-Source: AGHT+IFpDe4WZSyDgZhnjQhwlrjTlvrI4BE2l3Nj2Xpuah2KBF9AOZ056+dpJFQvlFIchgOZLbDivnYaGNNGCRdpSoM=
X-Received: by 2002:a05:6902:981:b0:e39:8e5f:adab with SMTP id
 3f1490d57ef6-e702f06db4dmr1162901276.39.1744154409254; Tue, 08 Apr 2025
 16:20:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408231823.826163-1-robertcnelson@gmail.com> <20250408231823.826163-2-robertcnelson@gmail.com>
In-Reply-To: <20250408231823.826163-2-robertcnelson@gmail.com>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Tue, 8 Apr 2025 18:19:42 -0500
X-Gm-Features: ATxdqUEqOr2dxKhn-iktIhobKCO_F83ejdgGyZozs2sb1C-LOU6OcOG2UtmJ-zU
Message-ID: <CAOCHtYhFKO=LRN8qp-w+rkTGKJ8t-LnqgqbQW9P6CO3=EeuufA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: ti: Add k3-am62-pocketbeagle2
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, Nishanth Menon <nm@ti.com>, 
	Andrew Davis <afd@ti.com>, Roger Quadros <rogerq@kernel.org>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Judith Mendez <jm@ti.com>, Andrei Aldea <a-aldea@ti.com>, Dhruva Gole <d-gole@ti.com>, 
	Jason Kridner <jkridner@beagleboard.org>, Deepak Khatri <lorforlinux@beagleboard.org>, 
	Ayush Singh <ayush@beagleboard.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 6:18=E2=80=AFPM Robert Nelson <robertcnelson@gmail.c=
om> wrote:
>
> BeagleBoard.org PocketBeagle 2 is an upgraded version of the popular
> PocketBeagle.  It is based on Texas Instruments AM6232 or AM6254 SoC.
> Its dual or quad A53 cores can provide higher performance than classic
> PocketBeagle. The new design comes with pre-soldered headers, a 3-pin
> JST-SH 1.00mm UART debug port, a USB-C port, Texas Instruments
> MSPM0L1105 Cortex-M0+ MCU for ADC, 512MB RAM, and a LiPo Battery charger.
>
> https://www.beagleboard.org/boards/pocketbeagle-2
> https://openbeagle.org/pocketbeagle/pocketbeagle-2

dmesg:

https://gist.github.com/RobertCNelson/c68c96a8a1dc6e4d39d8c48fc13ca1c1

Regards,

--=20
Robert Nelson
https://rcn-ee.com/
