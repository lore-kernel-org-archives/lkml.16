Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB4926156E;
	Fri,  4 Jul 2025 06:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751610882; cv=none; b=jOwn0+H1hcQfc1lJEwyi88vd11NhUC0kuHCm0pRRe1Hh/fT6PgOK4TvhxX64sIRwgoG3qusu892ioYpkcL9GN2ew4oSnzJ4U53RH+1g4BdzzwPCGu6cxN9O2x6xIjx4iDOhh/VSXdmK+uvILorskamBO60dUW4/Q7hnK8uvi7s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751610882; c=relaxed/simple;
	bh=zVR7lBlJEEEeubKMfUP+Rqpd+a2Gj2iVNlm2/FjJRYs=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=lDWuLMyUAqynotktqvYPIVai5vflRqo93p4pLgXeZwhIPtzpbs3mayPwvncWQa8yFtAn/HAGvApGEUB6zBcMaAbST9bQhMlAkA8HJHUOshEgm44/cAIsRSfXPLrPcuqmpVJAsl1NMB3qCvmBrMGRuZpWxg7H5xJBFE4/A8aRzSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PUpsdkhZ; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PUpsdkhZ"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3122368d7c4so657322a91.1;
        Thu, 03 Jul 2025 23:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751610881; x=1752215681; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OYiCNFfJqMeO2073S6siJ3ufZ/e3IN78WfGZjIKg56I=;
        b=PUpsdkhZrgTEfh79VrxahakSR7acNVQZhiYjv8qtLSMlNRMjWMSw4F47F01bx2hfIo
         BxeiBX+lxqaiIcE/BEDYyI9CTZP/bF1ooDXgx11ljIrma4HPNpakBhpeJ5axVSQ3ZAIH
         vasSQGIyJEQ1bMm9Z6c3Lnx/rRn7pMpcHoBQO9bKRkWmv/n+Py7jrIOr8tU18/3Hl829
         zV+Js9fLRQyGzBlAtiyKO+a9LmRB0wQZs30MH02N5EkIIToK1SxTZfSbpCR1yGeqS4Wt
         CovPxJZTFF29PV2Fqkg2Fc6Bz15rSlyiBvZry/DAbo2l7mKIhtvYIMNPRvuxNuIh1EyA
         RD1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751610881; x=1752215681;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OYiCNFfJqMeO2073S6siJ3ufZ/e3IN78WfGZjIKg56I=;
        b=oFIkoxiIk4JvUOQVNzQcvfKDIHi4lT0mTuUSbl4/Vanz1OCz5bkuz25wL6+2K3VqeA
         3OO7jwszs3tj/tfl1xjyAjqZ/Ettx4xC9eJqBbNRPl3vdxD24LOqMa2ZeK0eXhrDrC97
         sownpMxKm/cbhCKYWEuCfA2S6DSxLfgAP60t5J9xHE05h8R7NvuDYqWp5VYtxb1fD0Z7
         1i7PG/eE6mVDcH5ocATt/gBNl2Db/Vlo9LeASzlPYkVreA+DfXmKWBcVx6Vfr1D9GZX6
         JbK/ueSXY5DlGTzrAGrHj7Va1Ediosf/aidDOmoYUJpYd2g7y5inSx33mJFZL2bJ7u75
         J7sA==
X-Forwarded-Encrypted: i=1; AJvYcCWCPV2p8wJmMjtRk6OPYGUBVynGHmEU6D9hXVVokK7s4ijzJuaySovHgP8vwXBbfrIB0h5peiccuca5o/6A@vger.kernel.org, AJvYcCXH6mxzQEEXb/DwGafDQo6DIboFhHJNxueeaECaI3RrzC9JSiEcEFsi3PhAXEPabAzU/54jVmdk4rvn@vger.kernel.org
X-Gm-Message-State: AOJu0YwVbnihTlMncxXa1pJHjAMxqgVxQgvJhU8rnNoM5YQUqskCs2H1
	/rUtG9Le0s0YF3+Ix3lSyqGs/cwPnXeKcCZlWzm3khRiJQ6dvwtdF+2O
X-Gm-Gg: ASbGncsKT8V2R2SbtJEhiinL2D40DgRe+0mo6GgCeHcNyG9E238URFc3LlIR3bijrZY
	zeUq3Uid5Q0lu8WLuIRTV6f6qI+PbVOV0Slv2MVewevv7tAw8/nNtU2w1z0mw8j2DmSWGTiDJWt
	o4sk+PRwA3sNBjeSEDYayY8Ay0CvCwuRxhVIEyqFE6jHXqjwFUq8SkZeOf6OSKlzzSwSujJQkM+
	BT7PFhwcxnhir2AniCFW9rrvhUYzasicamNxIcFf4iHd8Gfjlfx1bXXgCwMPRQQsqpMRhFdG/dO
	dhGJ3u8Pfus23Ws46eB0mfuqXstsu7BY7AVZGvVCeylK02R+zwLwQaufRCi7xscdBZG1eSmExJN
	kJpIH
X-Google-Smtp-Source: AGHT+IHEHJgrSAlf4QtYjnnpQojHpV64nqFJPISlrnqx4qrKwtRHYPIo6YcfJzG+LY6E90mpEFUBOA==
X-Received: by 2002:a17:90b:1c07:b0:313:2f45:2fc8 with SMTP id 98e67ed59e1d1-31aac4cf19dmr2508356a91.18.1751610880251;
        Thu, 03 Jul 2025 23:34:40 -0700 (PDT)
Received: from smtpclient.apple ([206.83.106.227])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31a9cc4ca0bsm4159360a91.4.2025.07.03.23.34.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Jul 2025 23:34:39 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH] riscv: dts: sophgo: sophgo-srd3-10: reserve uart0 device
From: "Han Gao (Revy)" <rabenda.cn@gmail.com>
In-Reply-To: <20250703004024.85221-1-inochiama@gmail.com>
Date: Fri, 4 Jul 2025 14:34:22 +0800
Cc: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 Chen Wang <unicorn_wang@outlook.com>,
 Longbin Li <looong.bin@gmail.com>,
 devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 sophgo@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 Yixun Lan <dlan@gentoo.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C7422FE9-1DAF-405C-99B1-1838F2ECE6C1@gmail.com>
References: <20250703004024.85221-1-inochiama@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)



> On Jul 3, 2025, at 08:40, Inochi Amaoto <inochiama@gmail.com> wrote:
>=20
> As the uart0 is already occupied by the firmware, reserve it
> to avoid this port is used by mistake.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Tested-by: Han Gao <rabenda.cn@gmail.com>
> ---
> arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts | 5 +++++
> 1 file changed, 5 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts =
b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
> index 96ccb6120114..1b506972d465 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
> +++ b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
> @@ -113,6 +113,11 @@ &sd {
> 	status =3D "okay";
> };
>=20
> +&uart0 {
> +	/* for firmware */
> +	status =3D "reserved";
> +};
> +
> &uart1 {
> 	status =3D "okay";
> };
> --=20
> 2.50.0
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
>=20

