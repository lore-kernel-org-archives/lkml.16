Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6BA21C195;
	Mon,  9 Jun 2025 16:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749487187; cv=none; b=Tkjqb1pReaiN+vquJQh+qjGbnRE5+2PqWA1HP71wiHREIRNXWWmZvlG9++yiryZXwQ8R0ICq1c0sqQNHZ1aekdjqWcA0UkWo+f6uu09U8kTAV6/1giOSginuq6IUakbg7ILGUlc053KavGDefgRBNArF0Q9w7PCreDhgJHeZj90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749487187; c=relaxed/simple;
	bh=b5IAyMi8bog282MCnpmIozPAGbv4atmEqp0JP+JLJVQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Fz7tp/aLgb7yTdEPlP8koxMw2Ul9MBcgywAJd9LTHJpfufHCQUZZGYRzbbWraoaNtTP/yX5ujL9yB5R1bND9TODoIV6c5lCjjIPAKZ2sO/jueOV1Ury14HXmT5zV7fu8dQTGrQnCHCDhaC2KCGvYMqEbc4ddsr2ML+XNCNa9dxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EcJ5fHiK; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EcJ5fHiK"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a548a73ff2so1234357f8f.0;
        Mon, 09 Jun 2025 09:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749487183; x=1750091983; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=b5IAyMi8bog282MCnpmIozPAGbv4atmEqp0JP+JLJVQ=;
        b=EcJ5fHiKz71lBgQzxWv/fzNDZ+TglUKILC3hizOojSWQPqnWGy5/DM3IXXqpjlPf49
         a77OAz7KeT9IvWHaTgLx4SQ/G2E+8o3+ckChDXTcKB5Jj2jc4tZP8DGuC2LT1Np44Q2U
         gDKUcfMYhSbGFzYJa5LBK9dPh377CRKh4MJQbua9F+OFH/7d11T9vFBwyf+lQ+R4B2K+
         l4WHEASA5d56UPS4xCZnZAFhFI/VrAnecO159fbtThB4302EZ0sLdm745/yCwyaRJJQE
         ed/cvWAFqvsGDejn0PgFW3LjFUqHHZnLQxIycqoHs2CJzRDvTuD4kBBMhSidnRfvqgVO
         J9Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749487183; x=1750091983;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b5IAyMi8bog282MCnpmIozPAGbv4atmEqp0JP+JLJVQ=;
        b=HGn11xgjKDh35G0ymC9xGfP4xpv4CKccI85MaMkFyp7SUcRuFb4EzV9HJ6lgVw2Or/
         eEPZPEngLWsvCIq8HPWEIqftDqVDD3ujwOuD2Aj5hud5Zrk2WCiBcwFFG0fm8YWX2+Ih
         KJceYI7ELv2bwjF6RTXrIKTRnGDGYVgH3NNWalOC6hq7iIC2JJwxWZoxd7rtc7QUqnA6
         XT2KwHXfuulRAt/tLUyAOZAU4BV8Rgn2yraz7OwdBfbvWQqcAHEReQvXzVa919pAJIOM
         rl8INgsIlEzyQD+S9D5R25iyHRKyXjEO7WU5EtkxfsTtKhdGC/wWL7Tcl5nXstqFaL51
         SX/g==
X-Forwarded-Encrypted: i=1; AJvYcCU8SHMe0j6eSLWH5QAKUNRIVEHs+/pFHrpHuMotpdktmz8fSG4HOTJnOjrJjJb5ARUs55kOTiODM2G+@vger.kernel.org, AJvYcCXLbuYQsuL4ldIq//exKV32IXpefBmZe9dv3GLDNHi25bXh5mG6S1C5/u3FrOOzX0zWNkXbeymDSv0K90c9@vger.kernel.org
X-Gm-Message-State: AOJu0Yxrebg5Qf4yEWrFIvG6x29GC0KVnJj05tS8mS/8PP9djxCNZiRR
	DC/+2dsFfutNhORLZa1Oi+0P1aHwpUH3J9DxxMA07wd5InuqDteqhZJm
X-Gm-Gg: ASbGncsiFnTrWycz6RHOBUPMWmDu2DLlWI6wrX14ui8LiL1AED/K6C6wkiF5FbHzPgv
	DBujco3ZGmms374PWE3bagWtQN6h09p/CM05FaCKrZeoa27bjq48uA8ZrTRx2i+IhTUlkcUodDr
	/nVtUWeE5gyMxtSWbmA+h5X/qK8UZ/0OW8Y4y48HAw+Yddx+N9B92f1vnUpvMTWG/hGl0bI7ZuE
	V0psagCNdlFBiUX4pXBPgtZW5LKwKwElZUnwSUXJtOloKs5NWrEvvPXZI1NqdO3Ax8f7bIFJqZC
	MNMClGrjo6lFeGBfmFEnOcEXwHm8avVSuo7IltLYhsJG50H6+j/7keae9bvwNgpzKYY4ISYdyOt
	+bqJNQQ==
X-Google-Smtp-Source: AGHT+IE9fQxxC4zIGJ9d6F5tS1v5nb9uy1nE232lYSx4KIqFwSxQrRWo/+NPZxfe3hvsc8rcGcPv0g==
X-Received: by 2002:a05:6000:1446:b0:3a4:ebc2:d6ec with SMTP id ffacd0b85a97d-3a53189ea15mr11001381f8f.14.1749487183160;
        Mon, 09 Jun 2025 09:39:43 -0700 (PDT)
Received: from giga-mm-5.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45209ce1afasm116930245e9.10.2025.06.09.09.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 09:39:42 -0700 (PDT)
Message-ID: <902db298b21cf78a2c27ed0cdc002e7f2861c428.camel@gmail.com>
Subject: Re: [PATCH v2 3/4] riscv: dts: sophgo: add reset generator for
 Sophgo CV1800 series SoC
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, Philipp Zabel
 <p.zabel@pengutronix.de>,  Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Chen
 Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt	 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti	 <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, Thomas
 Bonnefille	 <thomas.bonnefille@bootlin.com>, Ze Huang <huangze@whut.edu.cn>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Longbin Li <looong.bin@gmail.com>
Date: Mon, 09 Jun 2025 18:39:43 +0200
In-Reply-To: <20250608232214.771855-4-inochiama@gmail.com>
References: <20250608232214.771855-1-inochiama@gmail.com>
	 <20250608232214.771855-4-inochiama@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-06-09 at 07:22 +0800, Inochi Amaoto wrote:
> Add reset generator node for all CV18XX series SoC.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
> =C2=A0arch/riscv/boot/dts/sophgo/cv180x.dtsi=C2=A0=C2=A0=C2=A0 |=C2=A0 7 =
++
> =C2=A0arch/riscv/boot/dts/sophgo/cv18xx-reset.h | 98 ++++++++++++++++++++=
+++
> =C2=A02 files changed, 105 insertions(+)
> =C2=A0create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-reset.h

--=20
Alexander Sverdlin.
