Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7098F4A;
	Sun, 30 Mar 2025 18:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743360225; cv=none; b=QctXQ3RI1nXaFUC6wONqpHNdf/AWudFI7isy7uYq5f6kWJUlveb7sV/OXL/emCgm9oyiXfOgNM5pAHonn8X5RX0fEQBxsVhUGH3gnTdOSpA8uxAxu3PUAjSB3oYTeTXFVNvwPWBBWD+/SW40YKVpne0NZ6jl5bqWvhVANlLxoYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743360225; c=relaxed/simple;
	bh=yTHIj6pSnTi8mksj3ewma2KmkG/z7OTrATTw79miqqs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=qMrRTvpLP5/y/sjwFUVeamgkbo1qIcs4+DwA74fbRhPaZ1XMpEFIlWNaqHLrD2dYfYl9Hkfa88BkYSZH7zs0MMAu8nSHo2HlB8ulbtCXcyCt3i/RfFPhlaj79MVHJqlYyixCmkB1OjZYgtPBavIPNk/fU4UveE6unMM314e7lB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PFoDoMQI; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PFoDoMQI"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3015001f862so4791706a91.3;
        Sun, 30 Mar 2025 11:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743360224; x=1743965024; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yTHIj6pSnTi8mksj3ewma2KmkG/z7OTrATTw79miqqs=;
        b=PFoDoMQIuHLwpPAo35DfmyHFcIcrLM/u1J2+pCjIGR1zJoqUg8VLBOQFgRrnq8iMPr
         Sne+ul2cAvMBpQ7wZsNX565YjkEj5W8/+DLE7cRqp5LFkDNQy4456LfHRMa25Rf4H5cU
         5WoaV6/rJpA9DdZgatcQeUEjippIX35g2I5uNlQkPMeM03IQVz0YGISiBgPYvHmI89iN
         /FdTUrElBPdhu2V/VSf/z6HN9z3HS5BXD2/ZKcHbvVXThLHdNfdRIeiNxnKyFNOwzUY2
         caFrdUCwfcaNpw/4lPEzsYYBbu0RmAkJcox+tzy08wUNz0uIF9wuAe+/ciWQB9HhBpCF
         xnpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743360224; x=1743965024;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yTHIj6pSnTi8mksj3ewma2KmkG/z7OTrATTw79miqqs=;
        b=R4cTBT4Qe8KUL3yCchEr7o4ss4iMXGGq+8GhP/xTedIrIDEn/YVZUomr++QzwlT2Ua
         5LDodVOSyYcRSLaE7sc5ama8OnaYHsbwvAXQMShu1pyWKOs2h5cgfrpSZKDrWeNZWjLd
         Sb7fS2tQ2glDVkAoHKovcJ55/DdcuHYAD3KzNSj21SX5HTzu+3UlG3pEQFx8/JIkupfN
         kV/zcZaO0rdfMWDAEg3lZ+Gx7nJwWPOsv9tXjGgmOlxpaTmDIjckOz8fWAgg/FQcRSj7
         88Lai2PMIZOgqKfNtBMPhoA4rW97odixrJzowV81++EIF6ie/9ExDvvBk6gsaFPqr7YN
         tB5A==
X-Forwarded-Encrypted: i=1; AJvYcCWavualG7cSxksebGzmHFLTqTxN+P1mSrgvSwQF53X8GZNJ9pawxAc9VhNAgOzSX3qpF3KvmmS5jhbI3gF2z/sSZ2N+bw==@vger.kernel.org, AJvYcCXO4UCCkuAP8fRjW8KGJkUYzBP2jW5krJNUJnLU9GZjP5Q5I+9V/J1dvbhvfBpbRTYh8P5B1kPuoSCSpqI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXaUYCiEIWngsSPB61WHxRlJVwdn/3q93q2B/SOiSczi3ZGrml
	K0tc2vH8mdGciR/S8hsYFlVJYpRZ3MOUaJJEetUiGeL4BPZS5rom
X-Gm-Gg: ASbGncvLy2oFeeQmSZ0Zd4UqMpwhCYGnonzZaCB7lu/mnOFVMQ75OL0J8X2N66FbIke
	tuy5ZQhTgwByjodRJnzFyajWnqHIWNQ0n99h32LycmBE4z+6eUi6nnXsdQvBBoEe08e4FiyT5bK
	tepuf+q0Z9acn6BFpJHVNQXoiGdGpLUv4SVL1UMkoydme3sEOtaQYTbTzXvskQazyWxYA2SMYD5
	tat7pm7dOS8P5/CKw04fP8jt4UHX2N4y6p2Hxglh/ZYxAskke+dyGbrErciUPsxgm2ZMEQlEvc2
	epiL2+RGdSmpUm71FQMfyOMHM83QJCi/sugJ4tCjthmgATrN
X-Google-Smtp-Source: AGHT+IGTwjdTgA3d53CBEcgC1UhzuLmFkhq0pi1HXLWlT03QRj78CDBkQP1NrMYsAj+uFneRKugQIA==
X-Received: by 2002:a17:90b:134d:b0:2fa:e9b:33b8 with SMTP id 98e67ed59e1d1-305320afaadmr10451666a91.18.1743360223746;
        Sun, 30 Mar 2025 11:43:43 -0700 (PDT)
Received: from localhost ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30516fed5fbsm5734308a91.37.2025.03.30.11.43.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Mar 2025 11:43:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 30 Mar 2025 15:43:40 -0300
Message-Id: <D8TTMCQBDYX3.H8ACLTS7KL19@gmail.com>
Cc: <ibm-acpi-devel@lists.sourceforge.net>,
 <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, "Damian Tometzki"
 <damian@riscv-rocks.de>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Fix NULL pointer
 dereferences while probing
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Kurt Borja" <kuurtb@gmail.com>, "Henrique de Moraes Holschuh"
 <hmh@hmh.eng.br>, "Hans de Goede" <hdegoede@redhat.com>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Mark
 Pearson" <mpearson-lenovo@squebb.ca>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250330-thinkpad-fix-v1-1-4906b3fe6b74@gmail.com>
In-Reply-To: <20250330-thinkpad-fix-v1-1-4906b3fe6b74@gmail.com>

On Sun Mar 30, 2025 at 12:39 PM -03, Kurt Borja wrote:
> Some subdrivers make use of the global reference tpacpi_pdev during
> initialization, which is called from the platform driver's probe.
> However, after
>
> commit 38b9ab80db31 ("platform/x86: thinkpad_acpi: Move subdriver initial=
ization to tpacpi_pdriver's probe.")
>
> this variable is only properly initialized *after* probing and this can
> result in a NULL pointer dereference.
>
> In order to fix this without reverting the commit, register the platform
> bundle in two steps, first create and initialize tpacpi_pdev, then
> register the driver synchronously with platform_driver_probe(). This way
> the benefits of commit 38b9ab80db31 are preserved.
>
> Additionally,
>
> commit 43fc63a1e8f6 ("platform/x86: thinkpad_acpi: Move HWMON initializat=
ion to tpacpi_hwmon_pdriver's probe")
>
> introduced a similar problem, however tpacpi_sensors_pdev is only used
> once inside the probe, so replace the global reference with the one
> given by the probe.

I don't understand why b4 added the linux-riscv list to the recipients,
but it was definitely not inteded.

Sorry for the noise.

--=20
 ~ Kurt
