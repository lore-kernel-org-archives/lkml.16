Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B57288C9F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 18:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748974612; cv=none; b=d886LvxpPFzCQanGGe4z3gMxioaprlhDuCiofQ7aT7q0l9RjwK1k95vXyLtAousR7acHP8FOYvTf5MeuVg1pTWfxWB+WTmJgguVWPCiWmPar8uQTLHdqx7E62ecZSL8OBDiY0P87SQkkq1MdS3UcHFC6C2eTGmCK0hqL1iOPpQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748974612; c=relaxed/simple;
	bh=XwZYNNYPEhCRT8H8UpMTHiRDWFFej+uLkqOYGvKnWqc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EqA21yFolj7aBcPMOl15rEgEMAmRdMWofQQo9tjPQR3wPVoyk0M5L4sb3XgBD4JzbrSsrhW8faW1sOQMEz5rn1QHBHNK5TKH873ewOcPcQYmyD8B0+h+/CzY1oH/NkslcDYZi7qsFKK+vI/WCrCNAx2EoQE8GsOU27IJNkDEHGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=riscv-rocks.de; spf=pass smtp.mailfrom=tometzki.de; dkim=pass (2048-bit key) header.d=riscv-rocks.de header.i=@riscv-rocks.de header.b=evnlob9Z; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=riscv-rocks.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tometzki.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscv-rocks.de header.i=@riscv-rocks.de header.b="evnlob9Z"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-70e4b1acf41so50235897b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 11:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscv-rocks.de; s=google; t=1748974609; x=1749579409; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XwZYNNYPEhCRT8H8UpMTHiRDWFFej+uLkqOYGvKnWqc=;
        b=evnlob9ZzLNV28C1gxEo6ftwlN4sjSnk1SjzS2x+wUfx3A1i6+a7uSuhssvlZsSVnU
         otsyxwNsGZXlDVx3S2Vd0IG0tNdU4ZkL8Jv/cxt6y6jbfmxVFoonSCUveF0cZrqs0mV6
         CrsXnSjjp6gJ3S+Ok/jCAw64LV/tTkzkh4CnWg7TcT1jmDyma1ohRE5Pg2WG3ZapGG3Y
         Q31x7RjPYMHuBLHUgJegDRMbIyLD4zY4fPOrcdubX06tYSPqkyfUUqHt2F5zHAzaJaTS
         jQutileHkHkwFEVhL5wbhuMCy2tfDvXQe8iRonXGrfS5XOfF0kscQxTPVnip4KI2kXb6
         SQyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748974609; x=1749579409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XwZYNNYPEhCRT8H8UpMTHiRDWFFej+uLkqOYGvKnWqc=;
        b=JHfGk4L6pWMg/gyb8/qQJCpkRxVs1HEEnWu78v+UHpZeGjWI2eoJ75OLpHKTF/jp5B
         rG9tj1lqqCVd14cOed65tYNVBwAShvJhi4RfrtcOliAZF3qkxaQ3POLsu16SCIEW0BDg
         igAOG0FVPEMBIi1rteprqn8r7UF/AwXTnAm9TSlipN2UMI/VXZeRCnSK7f5KmtQn9Nk1
         bvUD6yeT5i66Kbl9thlQrh8jjEZ3yLhALrByk5dD8+23/cAEf0+UBhVdyFfsLBwXHhWO
         Pk62HatzDvK/xOE8b7C9ZlwFnK0z27BKaPHQojGqsks/3+56i2FpU6V162Fl+KRShMlP
         tr0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVSkXsb0A4ugplFfRH8+uKdnxoEeiFMCYmHn2jo9SDQrU+FcodAxq1ejZjPSKi/T1FAmQ4gT3lx3nwh5JE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyExfnsJFOcKGkiFPe6Urz/p5OibqFYSYiLHnxsCwnSaIfFMK9M
	iLws1JUzWZGnx52a9H4VhO5/AaG1UujbH1mRQVkicZNyDKv0fsoW4tRuFhmKIh0mrirmulR3LAa
	hgcS978OjT+ol0QxkFeC8uHqZYD1+vgasaDN5wrQWfA==
X-Gm-Gg: ASbGnctpLPtxfPa7sCwVtI5/pIlOR6KbuNOusdJfsmIbhAjwa93RNLelc+NqDxM/CSl
	g+Rt/i/TcBj78HGuHZOWmVZO3u6asr+tnAM4zAPzCEpksYkplLshpqZ8rZwfQVNdPY7kfAMi9CI
	va6rlBq09hlGnL3x/eAw1uJfxWkx+B7kRPzoHXgCQ4cEOUfjanaY2kit7fwu1XMlt1t3TvNLe3D
	Io=
X-Google-Smtp-Source: AGHT+IFBIpNs5ZFdnmrMyOSBi+WesTkbjtEja3Fo1Yjt1PD6fJ9G9DUcF4K51Sm5nZUrijd5LAIIjQgaZFbzpSu/HG8=
X-Received: by 2002:a05:690c:6107:b0:70a:2675:70b3 with SMTP id
 00721157ae682-71057cf83e4mr246755997b3.17.1748974609387; Tue, 03 Jun 2025
 11:16:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0107019736e3a599-79e58a4a-0dfa-4f43-aeaf-4a4208845b32-000000@eu-central-1.amazonses.com>
 <DM3PPF63A6024A98E210FB9D166A3CD1316A36DA@DM3PPF63A6024A9.namprd11.prod.outlook.com>
In-Reply-To: <DM3PPF63A6024A98E210FB9D166A3CD1316A36DA@DM3PPF63A6024A9.namprd11.prod.outlook.com>
From: Damian Tometzki <damian@riscv-rocks.de>
Date: Tue, 3 Jun 2025 20:16:38 +0200
X-Gm-Features: AX0GCFuLbmz7320MGfValmAaRgWc694_-_RyvStDPr9rmaaBAYCOu-qNr0PlmX0
Message-ID: <CAL=B37=-q=Veghr7bo2GGiy1eyKP_xF0g8SeK5Lu6uKTVZgxoQ@mail.gmail.com>
Subject: Re: [wireless] WARNING in iwl_mvm_sta_rx_agg+0x9d3/0xb70 [iwlmvm]
To: "Korenblit, Miriam Rachel" <miriam.rachel.korenblit@intel.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Miri,
If you need a kernel trace, I can provide a trace-cmd log. Please
confirm which events are relevant ?
My idee ?
sudo trace-cmd record -e mac80211 -e cfg80211

I will reproduce the issue and attach the resulting trace.dat file.

Regarding suspend/resume:
- The warning appears after resuming from suspend-to-RAM.
Please let me know if you need further details or a specific test scenario.

Best regards,
Damian

On Tue, Jun 3, 2025 at 7:50=E2=80=AFPM Korenblit, Miriam Rachel
<miriam.rachel.korenblit@intel.com> wrote:
>
> Could you please provide a trace-cmd?
> Does this happen also before suspend?
>
> Miri
