Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B51525FA10;
	Fri,  4 Jul 2025 06:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751611199; cv=none; b=aP/Ujb7CzzslhB10jIFbeozElPnjkK1d9ZLKseURls9bvzzfVTqRGTvauyDgoBvCStghM0o1uUPxRSN8HTUi0kPUrMxieNgaU86P05m04TpgZlUC2OfOcxxY1SXKpAwV6qcJbi0GTyhKKNT4SjPX9ADR2+tLAdRmtRpMiQ12CkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751611199; c=relaxed/simple;
	bh=pvuhNh618YoO0a35GFC8Pw7Z07LNofJkXZ0OpcrTbTY=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=qwzLPGnhgIKdF1a/CdUfwfCP/JOdjxFfJgL0dL0vu+oU4kem71lvKQhyIIkV7t6L0U3zntJ4swWt5YozTGG+1NaDP5Lh6XkkTzHNOBdn4jeJ7TFibQmA97s/klZQyovpSrbzmSqicGPBnCH0VefO3eKWOxCIlBASfyV6KkSAI6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aqQZ/Png; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aqQZ/Png"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-237e6963f63so4711915ad.2;
        Thu, 03 Jul 2025 23:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751611197; x=1752215997; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ymwt9R5fmPgIM//LR+Lj3Iy4Vwk081dGhvYmgoS7Ai4=;
        b=aqQZ/PngDDzaa+ZZWQuzLCTBuwmNbwju4mdV0RXfuEatQtUkaMCMHNiflYVosrg0lH
         oV0D8LcMbzlLNFHVzrvxNPz7rAuux8dw3/l1WrLx3aYiP2/SJcK+pfyqJ9WauaA3nh/Y
         NNQy0cj3fS2iLZBvR2y60lTq1CnPBFtU42R1D3P4WoniDF8yPz2oipjzn/qUsDq14Ua2
         AwFWwBhCjnbfRNOJaqLcDIe4tS8J8CEhLC+WzK9B6UZzsbf2mmiWxtYa2okLrsA3yOPV
         7Xwxx+Y5bSdvQUR9GspKutDeDflMrqDC/UCIqeRTmwPmDIJb+QzgX+45Rp02PxVmYOIG
         U2wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751611197; x=1752215997;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ymwt9R5fmPgIM//LR+Lj3Iy4Vwk081dGhvYmgoS7Ai4=;
        b=UPXwZoHD1P02QwRPdog/sW1lfVbQNL2M0OPjdN9zTG2fZjrgl2ueEfdbmjiv2FdDGb
         lDp4MOIEWVQaJ17MVsInHDbrbnhgxnA/97rX0NT5MX9tKNTlAdKrhqkX59xqWgmwofGr
         dkEKM/FJzLhUJYuPOyxnXqtZQYfCUYjIZvjo0tTg98qyzFDjINVxM3yzj8qPjG+X2Ozr
         pvSgRTYsGdoGzT/bWhQISIzbfk6e34HanuNo8sGBhS3mCO4nNrmILT/sLrbnIfme1JRK
         r7s0WP6MNRV81t7non+wPEll5Qh0WVkQGRws6UmLNSGo9zVM11npNYv1UVX3dJ5Qeh5N
         4WAw==
X-Forwarded-Encrypted: i=1; AJvYcCUuUC2vg/WKqZXOtGhkLNnGVhpJnTdQeCfTkZeQpxZ6tjG+VcP+afQTsGphIMnZcNnVipQSSSN0Ozcr@vger.kernel.org, AJvYcCWx5duVBurfKwXf4j8S54Vl8L8K6FWH8Lc+0Zfcjz1Oh6nYDbd5wi8U4tWh3t6KnVd+Yp9/FOFt0u/tkP8E@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjyk4WIhdyH2z+EZ6LtTIGG51sSG5K0+NuI2eq2HfRI2ltFt2j
	6OCs4zQm2mxqtKtkZdIuxEhzYliDPbc1Eo3AjTPZXjWUn4qgFlK/v2YV
X-Gm-Gg: ASbGnctlQ/XOX4kAPCbsESN2xcYUs/FP5OTFurXc6fqyfogvGGX4uPRbkSP6nGFFEN9
	jVG2K9Te2B658XrdcUgF5BS1C87Fr9oUSYDU5UDj0tYJovx+TxCAABZOCFO7pkqjH5d7DOpeoXi
	OCwWVWrenlBD9K7XoDar8rKSEY8PxZTl35cnAeeN3Wa11GqGFOg/zjBw8S8wuRp4m+dSMOIQMpk
	6410RZ/zVw7sy9dufNuf36z+agDPTvUY8Wj6Kc6ITACTf2kqRN0zIwCeqfZjQmlreHRoY17uraz
	AnQqJS92hw9+B51k+wwA9ZaRFGHyy8KbsM+EavCCNr9mhHeZfFJzg1yo8cAnuolQKxXugw==
X-Google-Smtp-Source: AGHT+IFOkhU+1nxlQZhAQxZXi77aM4zfexPWDU++C9eDMbXR9WmHMDnfeoJU+xJpMd5beE5eWd6dYg==
X-Received: by 2002:a17:90b:264a:b0:313:f6fa:5bb5 with SMTP id 98e67ed59e1d1-31aadd853b5mr1776898a91.18.1751611196972;
        Thu, 03 Jul 2025 23:39:56 -0700 (PDT)
Received: from smtpclient.apple ([206.83.106.227])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31a9cd1be78sm4231889a91.42.2025.07.03.23.39.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Jul 2025 23:39:56 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH] riscv: dts: sophgo: sg2044: add pmu configuration
From: "Han Gao (Revy)" <rabenda.cn@gmail.com>
In-Reply-To: <20250703003844.84617-1-inochiama@gmail.com>
Date: Fri, 4 Jul 2025 14:39:39 +0800
Cc: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 Chen Wang <unicorn_wang@outlook.com>,
 devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 sophgo@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 Yixun Lan <dlan@gentoo.org>,
 Longbin Li <looong.bin@gmail.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <58869404-7F27-4299-AB26-1B5E9F59D8ED@gmail.com>
References: <20250703003844.84617-1-inochiama@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)



> On Jul 3, 2025, at 08:38, Inochi Amaoto <inochiama@gmail.com> wrote:
>=20
> Add PMU configuration for the cpu of sg2044, which is the V2
> version of C920.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Tested-by: Han Gao <rabenda.cn@gmail.com>
> ---
> arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi | 91 +++++++++++++++++++++
> 1 file changed, 91 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi =
b/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
> index 6a35ed8f253c..2d21b2881ab8 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
> @@ -2778,6 +2778,97 @@ l3_cache: cache-controller-16 {
> 		};
> 	};
>=20
> +	pmu {
> +		compatible =3D "riscv,pmu";
> +		riscv,event-to-mhpmevent =3D
> +			<0x00003 0x00000000 0x00000010>,
> +			<0x00004 0x00000000 0x00000011>,
> +			<0x00005 0x00000000 0x00000007>,
> +			<0x00006 0x00000000 0x00000006>,
> +			<0x00008 0x00000000 0x00000027>,
> +			<0x00009 0x00000000 0x00000028>,
> +			<0x10000 0x00000000 0x0000000c>,
> +			<0x10001 0x00000000 0x0000000d>,
> +			<0x10002 0x00000000 0x0000000e>,
> +			<0x10003 0x00000000 0x0000000f>,
> +			<0x10008 0x00000000 0x00000001>,
> +			<0x10009 0x00000000 0x00000002>,
> +			<0x10010 0x00000000 0x00000010>,
> +			<0x10011 0x00000000 0x00000011>,
> +			<0x10012 0x00000000 0x00000012>,
> +			<0x10013 0x00000000 0x00000013>,
> +			<0x10019 0x00000000 0x00000004>,
> +			<0x10021 0x00000000 0x00000003>,
> +			<0x10030 0x00000000 0x0000001c>,
> +			<0x10031 0x00000000 0x0000001b>;
> +		riscv,event-to-mhpmcounters =3D
> +			<0x00003 0x00003 0xfffffff8>,
> +			<0x00004 0x00004 0xfffffff8>,
> +			<0x00005 0x00005 0xfffffff8>,
> +			<0x00006 0x00006 0xfffffff8>,
> +			<0x00007 0x00007 0xfffffff8>,
> +			<0x00008 0x00008 0xfffffff8>,
> +			<0x00009 0x00009 0xfffffff8>,
> +			<0x0000a 0x0000a 0xfffffff8>,
> +			<0x10000 0x10000 0xfffffff8>,
> +			<0x10001 0x10001 0xfffffff8>,
> +			<0x10002 0x10002 0xfffffff8>,
> +			<0x10003 0x10003 0xfffffff8>,
> +			<0x10008 0x10008 0xfffffff8>,
> +			<0x10009 0x10009 0xfffffff8>,
> +			<0x10010 0x10010 0xfffffff8>,
> +			<0x10011 0x10011 0xfffffff8>,
> +			<0x10012 0x10012 0xfffffff8>,
> +			<0x10013 0x10013 0xfffffff8>,
> +			<0x10019 0x10019 0xfffffff8>,
> +			<0x10021 0x10021 0xfffffff8>,
> +			<0x10030 0x10030 0xfffffff8>,
> +			<0x10031 0x10031 0xfffffff8>;
> +		riscv,raw-event-to-mhpmcounters =3D
> +			<0x00000000 0x00000001 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x00000002 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x00000003 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x00000004 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x00000005 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x00000006 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x00000007 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x00000008 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x00000009 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x0000000a 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x0000000b 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x0000000c 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x0000000d 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x0000000e 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x0000000f 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x00000010 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x00000011 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x00000012 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x00000013 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x00000014 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x00000015 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x00000016 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x00000017 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x00000018 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x00000019 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x0000001a 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x0000001b 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x0000001c 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x0000001d 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x0000001e 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x0000001f 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x00000020 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x00000021 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x00000022 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x00000023 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x00000024 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x00000025 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x00000026 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x00000027 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x00000028 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x00000029 0xffffffff 0xffffffff =
0xfffffff8>,
> +			<0x00000000 0x0000002a 0xffffffff 0xffffffff =
0xfffffff8>;
> +	};
> +
> 	soc {
> 		intc: interrupt-controller@6d40000000 {
> 			compatible =3D "sophgo,sg2044-plic", =
"thead,c900-plic";
> --=20
> 2.50.0
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
>=20

