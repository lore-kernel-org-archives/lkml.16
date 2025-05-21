Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DC3221FC4
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 16:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747843948; cv=none; b=mrRUkOdo0CZtbNu49tBtAeT0UCkyaqQaycVgcQ/OM9S/duRFA//ks792TCk3IBxByIVvJsdVXlgw/itx+9YIZddkyomhprUBF0SRYktj3ilSMwVd+mtuKyiBjzV4OgAwEsUj0Py0yQWMRxfSS5GY/+NSbGA2n7SVmSlJIUBWmHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747843948; c=relaxed/simple;
	bh=dtaeqU1G39an9ZFiTdwsQrShvS+qIXW0eE3WX/z5y3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R98EgPLxgOHNX6/p4+1Ldllx/pdYAq/amRaOU95sIwclf9xqsAN4G0tZOy2AeHv3elqTeeeToI4MStCRB26bInTJ8atNMjoz8GcB7g5k309b6kHqX1qnbyHwwYDHXw1CiOoVjab7+1beNp4hQnUU2igN0OlfY4bO2JDf5y5AhUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geotab.com; spf=pass smtp.mailfrom=geotab.com; dkim=pass (2048-bit key) header.d=geotab.com header.i=@geotab.com header.b=UCsaxLeF; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geotab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geotab.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geotab.com header.i=@geotab.com header.b="UCsaxLeF"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3d940c7ea71so28124115ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 09:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=geotab.com; s=google; t=1747843946; x=1748448746; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=csfhBD7WPqjX3LJWwN1LAplR1IKrc1AR/UbxXmoRkgc=;
        b=UCsaxLeFoZA8NiusDSna2cFlcCa3h3hScuZsV2Xy7bgVUboSA07/BSdjii07WDa/L+
         C4d16pRZCe7KP2zdTKz341geb0K8zT7T8/RrUAmcKyUJhmUqNQ8ylAmdyoBt8s4Be4wr
         ZzJJmR3tsIbuaf1NFMPI1crEv4hzsd+vuM69ObLe2MLRqeAlZKJR0LoXzMrxWjeMR0qZ
         2gK2v/VyhYEMafGIO82p6qqT+GR4fVuvlw+dnGbKLSaKZWisorBweuN8ESh4wCxB4BgJ
         a8SKAyfu3KIBiCqz4Bv91sJOdN9epSkjeUQF+04hhEQkzz8FYSCAKmH6pYLZW8zKpufb
         p9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747843946; x=1748448746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=csfhBD7WPqjX3LJWwN1LAplR1IKrc1AR/UbxXmoRkgc=;
        b=GF24UwyZVISwS67f1i7ZAdyi6uadqXBalRINRzrD4hiZ1XyZ/94nwEWA2jxBTa8mdY
         t4TMAMv3Vu9UIH1hzPh9lS7+xnoWudc5lcoxsgwiL7RraUiFmoGlVIx6cCpB0fv1J+pg
         fDfXfDXhW0qjIXNx2coGNdECISRS+Hyrv7Mu9n2hkm8dU5PDDTO48SvwCMtfIkJAZ7GE
         /tMun/a6WhHXFV8jmG1W1UCUPUSMVqRYD9Srv1vZsbkDkKOpipWQ0s1y6Cx2Bj3bY+wO
         vzT0SnS0XoC/SV0I5QlPP8vV+1HSCyr6wDSUd6SpuCyGWWiiwhSY52s2r7l8Cvufcnzt
         eIUw==
X-Forwarded-Encrypted: i=1; AJvYcCU5dTQTiiRPS4XJTWcDK2gmbQZP57hWmZZne2N95VvqV3abq/ufzzRKIleGwTEKh68oVFjGrHDWS+WtktY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRiWFab+cBLemx0NVW9uHg/mn+z/HECaH2vxixriVfqPlHGQHE
	uAMHaievzY7bAdQm2h+cBn52PsD4VO2jIwiBkX+uPAtUpdvYZsbSHo7pal1yBffAAc51tjIAAJr
	NMd5hwjzKHQ2dun7rEI9SZOok8WDKmr1Oifes4wgixA==
X-Gm-Gg: ASbGncsIcWX0CTx0o/e6R9bttqC2UOeZX3Fvycqy4saAO+07AsjgnVs0vZo9b8Z5CZ4
	rLRqhDEQNxUdfst7Yakae7JSVvVtXNQxGD3j5lIQyFxM1ztVkbtF4xMH4m9XGBcdkJZ62uAyfzy
	4uOWWEoxFnm8EcMqRTb43kbfHrhzcIAolDQvD3JIfW16JFy7KJ9urv7blePpWXoNmhETc=
X-Google-Smtp-Source: AGHT+IEJfNximcpI4sHlE4lUNome16vdlnckLggBWOBVg6ylxViQRV/IB8FJAzsAfgLOWXvqDtLN+SQeS+vb85gj9z0=
X-Received: by 2002:a05:6602:b85:b0:864:68b0:60b3 with SMTP id
 ca18e2360f4ac-86a24cc81e9mr2366719439f.12.1747843945979; Wed, 21 May 2025
 09:12:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514-ubx-m9-v1-0-193973a4f3ca@geotab.com> <20250514-ubx-m9-v1-1-193973a4f3ca@geotab.com>
 <20250514-saggy-shifter-e4ac7152f823@spud> <CAN=L63qsjEAvfocgP0tGrpe-x6Rx1gvTAkPE9i99Ai2zJj6ssA@mail.gmail.com>
 <20250515-varying-swan-31ca63615b43@spud> <CAN=L63oc7a6+_e+nhiyCkttX-TSbcjcwBmSzPsSk94m1ebGt4w@mail.gmail.com>
 <20250516-unfasten-submersed-e854fc9a0142@spud> <CAN=L63phSnssXs1p2HXhf08HMaHCE80EgMZQR0vPqhME2tknBQ@mail.gmail.com>
 <aCsrIcQ5L3kcXE6L@hovoldconsulting.com>
In-Reply-To: <aCsrIcQ5L3kcXE6L@hovoldconsulting.com>
From: Alejandro Enrique <alejandroe1@geotab.com>
Date: Wed, 21 May 2025 18:12:15 +0200
X-Gm-Features: AX0GCFv8kYLaeRPM-cP-DAyeZqg8MlZwbWA_UKP8dwerk5JNpfJvQrsyWDYecjQ
Message-ID: <CAN=L63o=wuv-7a1U4W-=mee+JAWhmvYMDsqkckYV3zYYaDTPnQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] riscv: dts: sophgo: add zfh for sg2042
To: Johan Hovold <johan@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 2:59=E2=80=AFPM Johan Hovold <johan@kernel.org> wro=
te:
>
> We still want a new compatible string for the new device. Depending on
> how similar these products are it may be possible to avoid adding a new
> entry to the driver for now by specifying a fallback compatible, for
> example, to neo-m8:
>
>         compatible =3D "u-blox,neo-m9", "u-blox,neo-m8";
>
> This would then need to be encoded in the binding.

OK, thanks. I will submit a v2 removing the new entry from the driver
and modifying the binding to permit the fallback.
