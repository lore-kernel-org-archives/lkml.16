Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D1478F59
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 09:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748598688; cv=none; b=RNEmCnqI6ZdKj8nUSmxj8n/ZbXwrzmp6GuxFUdv6Poca9lcN0FlHH0/HrgWnWxf4/u562OyHVAqsvdugtI/bwQpVQ7IWj5CVwnjXgWbz7Ar8yX3IZWcWo+OIbIqj+jAe4um3eruP7GiXUHYscUD2/3e10qWmXAfVss3CtiEnA2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748598688; c=relaxed/simple;
	bh=9N+xxY7aSmoiBtNGmssy3fD2lqwfMB0am0FsqpgYJhU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NLsstRmZyQ+qG2BnOdKvTTN6EjrS8HwD/N1YTC0sKiGx22MuwnJUqXAqVbjIRCKfqJXL1h8rG9/CFtoc1wq3OJ0HhuG1yzpcx4I7XSJWYAuduJ1yZQ/N08qqD1QzAtEyXUgjz4+LBWd+bDzAbOb5ia/G2ym+E5fVCaoalnCS5Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qEWBiorx; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qEWBiorx"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-70e4bd65106so18310007b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 02:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748598686; x=1749203486; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9N+xxY7aSmoiBtNGmssy3fD2lqwfMB0am0FsqpgYJhU=;
        b=qEWBiorxscOGoef1JJgOr7/osNVUlHgyOFUci1nRtcR5MZRHnMBsneUzfc3LvS3VMB
         REjnJ2CSP2P4hitZIX3+J5sE5A0qIp4hCxczOrFnMhzm0u+ECEV7RKf3jJU+5pGCRChc
         5MzmmAzwfsPMXQIf3wGV0b5X6zMp47TM0iYCaehINC5hzzVWu37ZprA2QhQq80fJIagX
         ieZ3/k9X1PJUWmY7D4zYix+ABicec/5vAlumelZUSjvqf0iS7yIkg/o9P89y8SxovFEf
         IuqGcUjgjPKd6PtOLtjUnXsQJqwHplv5qBGl0XvDTdZZG5DE7pIpYr0WBX8mqA4U9li0
         q2sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748598686; x=1749203486;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9N+xxY7aSmoiBtNGmssy3fD2lqwfMB0am0FsqpgYJhU=;
        b=OT5LzSrGkBK/HU7+bmAiCp0JJBSHskmRxxRDbzIG/6T8o/EwERwkMfCslmynlIs9ph
         IRVYF804s3fDAC5arztOgdzx5WhRfFm7l0TUlSJgRVOTwdcgw2E5l5sf2aGJm8y1Peae
         FidO22BTTwhxS6M5JN39O4CvTrS+hffDH4kwJLO+NkScIhWIkv5I8d403cNV44EDmxJ2
         Yg6q4OJyrTsYARZ4EzQ923brayhmk7yoJ8F1a88uBuS9/FuQRk5HHzh8fOsp4mcdlaNe
         Y+Clhd+zsuxTHH+h24PRPpdc8RABzGG4LvExeYX2ljUdOHSsW7+wNRmFacaQql2fW/rd
         3c4g==
X-Forwarded-Encrypted: i=1; AJvYcCVOHDmFsVbk1EZkm/kzLyhSqTjUs8r8GTWe2Vn0vMIdZ6ppQXUyLkoFL5qJOzV1FqCzX0yIPdkO6UVM8dg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFU69+1/JBLe8ei+FrFscjClErGnoRHwdgXBkDdMZFuSFDNs6J
	+NS/Bk0JLbzUfR6/kDV8NBdJRAwxsGMrzDtMokN3oSxZ6zzhur6xOKMV1pLaXvJGv6fVJQ8F6Uo
	eS+ieqrCAigUxivX83CK1cDGOgrOPnYa00+VVbPYBQA==
X-Gm-Gg: ASbGnctnACWabkhUa1sUmw4THTUao2ncltYBLrLRX7aGC7WhPFOIQjoCQvxneNXDzMM
	SY8GI8ibjDzrvV1R3THQrTH6fszGYWC+eGzqjnN0zmukrXUXZYm8n+MqS7a8ERrwHwtjuBMHiei
	jJrzckNibwMR7F3b9d3ZU8hpkxJHsIyKDX2g==
X-Google-Smtp-Source: AGHT+IHzSRq1Zn+D2K1JppDukGT+sZpKP9zzEx/fhnI37XZflFs97UedocCKfSqLpuqv6atgOvNqHnjodtGrwTGQGZA=
X-Received: by 2002:a05:690c:3687:b0:70e:1b53:b9aa with SMTP id
 00721157ae682-71057cf853emr18270367b3.19.1748598686198; Fri, 30 May 2025
 02:51:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
 <20250513-gicv5-host-v4-1-b36e9b15a6c3@kernel.org> <aDhWlytLCxONZdF9@lpieralisi>
 <CAFEAcA_3YLMSy+OsSsRayaRciQ1+jjh-dGzEjrh2Wa8BqdmqrA@mail.gmail.com>
 <aDhtVkHfJvDfkfaX@lpieralisi> <CAFEAcA-=0GWG+rnHDOnsHg8cUq1pszN=x1-W+4MYZXXD8H8Pkg@mail.gmail.com>
 <aDl3lXiw3+l43+Cj@lpieralisi>
In-Reply-To: <aDl3lXiw3+l43+Cj@lpieralisi>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 May 2025 10:51:14 +0100
X-Gm-Features: AX0GCFtpWHF-oX0PV5KG99Dy_ZvteG1wTB1Qwy2wuK08Ij84L_Dw6bDr0vyWyFA
Message-ID: <CAFEAcA9M1Wppb=Fy66iEJTj60LiJHiYdiWDQiMjU7F2Zi014HQ@mail.gmail.com>
Subject: Re: [PATCH v4 01/26] dt-bindings: interrupt-controller: Add Arm GICv5
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, andre.przywara@arm.com, 
	Arnd Bergmann <arnd@arndb.de>, Sascha Bischoff <sascha.bischoff@arm.com>, 
	Timothy Hayes <timothy.hayes@arm.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Mark Rutland <mark.rutland@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 30 May 2025 at 10:17, Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
>
> [+Suzuki]
>
> On Thu, May 29, 2025 at 03:30:51PM +0100, Peter Maydell wrote:
> > It's up to date in the sense that so far we've only needed
> > to have the 'status' property have a secure- variant. My
> > suggestion here is that we might extend that to also allow
> > secure-reg, and to have root- and realm- prefixes too.
> > Though I don't think we would want to permit secure-reg for
> > any old device, so maybe something more-GICv5-specific would
> > work better.
>
> I am not sure this is a GICv5 only requirement (looking at SMMUv3,
> for instance and there might be more IPs that require security
> state awareness).

For the SMMUv3 I think we're OK, because there's no separate
set of base SMMU registers for S vs NS; there are Secure
VATOS registers and a Secure Command queue control page, but
those addresses are discoverable by looking at SMMU registers
so they don't need to be encoded in the DT.

> Or maybe it is a non-existing problem IIUC the paragraph below
> correctly (albeit to be frank I don't understand how to determine
> whether a dtb is consumed by eg secure-world-only).
>
> "Note that it is still valid for bindings intended for purely Secure
> world consumers (like kernels that run entirely in Secure) to simply
> describe the view of Secure world using the standard bindings. These
> secure- bindings only need to be used where both the Secure and Normal
> world views need to be described in a single device tree."

The purpose of this paragraph is to cover situations like the
old versatile express cortex-a9 board, where the firmware
booted the kernel in the Secure world. The kernel didn't care
about that, the (non-autogenerated) device tree just told it
where the devices were (and didn't mark them up with secure-status
or anything). That setup (and the dts files for it) pre-date
the addition of this secure-status binding documentation.
The text is just saying that it isn't making that pre-existing
setup retrospectively non-compliant.

> I assume "standard bindings" there would mean that "reg" for the
> GICv5 would be just eg "config frame" with no NS/S/Realm/Root attached.

Yes, in the (hypothetical) GICv5 case the dt for a "boot in
Secure" system would give the address of the Secure config frame.

> We don't strictly need to have the same dts file for NS and S (example),
> NS will never "need" the S bindings at least for GICv5.

One common workflow is that EL3 firmware is passed a DTB,
consumes it for its own purposes and passes it on to the
NS kernel mostly untouched. This is particularly useful for
QEMU where the DTB might have been autogenerated. So you do
want to be able to express what EL3 needs and what NS needs
in one DT.

thanks
-- PMM
