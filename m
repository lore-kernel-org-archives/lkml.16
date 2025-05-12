Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E3F278764
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 13:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747055900; cv=none; b=j6FUOhY9AvoKXj+T7XVbjUkiSlqrEDObU7xi6zUilvqhizlJlXxn9lUhf4sq9+hlBXzg8qBEbLjQRFNvJCPwx5nAByhUmovmZPJJwdpui7rjihYyLpWr5kOwUkt5wT3CWCvOpZyzKNN03PjSHZpja35NyP1iQ3I4AdJWyZ1OWIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747055900; c=relaxed/simple;
	bh=P2dRAMFX0qcGaFDfPPQRhczLoo1DwJLvuyQrydHY100=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mCDt2SfiX3mRmzGtpIdtnNTb923bAKPPgZvio3a8VHssIZWaLoTQY8YNGjDPt1Zn8YWshe+8Fow2zY4tVryZu0kfy6GvVaviQqDU0bog5ZSwR+GpbW5VW4AzIs5WiwUBzhKPaKUebi1mdwpuBgkXCfXUqVFgoXAETBRxrMembJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=mTFwBGDS; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="mTFwBGDS"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3feaedb4d2cso3249835b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 06:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1747055896; x=1747660696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sWBT4negj8RQi0XhwnIgygPRIevoAEB3n/nLguidEBg=;
        b=mTFwBGDSrdo7Z0mGaMloOBTTb6YH7hpbHY/cLSvbFtxD/76cJBSa457GNOMsIpGdRv
         Kl0bVrZ4KLOJ0WR2IZ594JBRz8OA7nqz2rBAmVP9ayXnmJnGtfJuGQ5wD5wPcWvD5Vxr
         hmb7QxgtEMUfwPdM01wkbrFMrGZh4M1gS8n07JUbJJgPRgYquoVi/ZCt77Aw2IAluNsI
         ouRRPylZ/NFMYWCKs/LpZFz4KpJErs/trvEr6Pivw47M8TPqz83bBjXDpm/PyQClZYcL
         4gG3nlFZV3JWaveHZQkWuzAJr5M+f1N3gGXZVQftqRDS2EjeKVpDt9oOF6ROAJrV+/ND
         Fqig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747055896; x=1747660696;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sWBT4negj8RQi0XhwnIgygPRIevoAEB3n/nLguidEBg=;
        b=Yn451FVvCczjjnCQcBSBziPwcJVkDhKUzv61H7De3xgzcyAkG3gKNr3uPMNupR8wxC
         eID6BnaDXg8ZE175sgdvNMe+DWJkt21UjbLELPIbVIwFPSKocmXU87Ai9KynChQbbBkZ
         cgP49JI4ZbBo5qRwAeYhZTvtXA+EfCtbI5l6xvvT0kAsDuEzspK7WVCi4QrunVxesHgj
         uoggvbhoN8meHzyPA1coAxbBeE0dtZ3eCgw1W4BmDjrZA9hsEgbDzGkhH/We1EBtrOb8
         LhL87uISWLh4OsfxU4CYZ5CkF5ch0eIt5CaY+gEn4g6cFeP70ydYwadJL8mdpJS/JWB5
         BNvw==
X-Forwarded-Encrypted: i=1; AJvYcCV6IXCEB56M4OIJlfgt6nvcUMEkcoUYpeQ7229fv39SBkODif4ns97WZbaToNKrmyMldarXx0k2dgAx8r0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzA+5d9GtOcPkOsP9FDLdmiID3xpi3YiAg+KC6Uq86yOUIPsxXF
	xobwqnkDvR5YOoJnsulashA4hsm4IwOBDCOXJc2j/B9t6f18ubwL2LBYIu3mHbUAIvQxcuOj/LO
	M
X-Gm-Gg: ASbGnctxwplslL+PtMN5yvj2qn85zpMSlF8bmb0lyetaHQUu//+PKZF6qGA4Q/eOM4g
	GteuvENMb4XLOXFnN3eO35aia6CLAxd1I+l9LjTHqLfz2IschKcy3OucTBth1EbnKAcOSfjM1l0
	oMHRqpkh7CoROsJamgWLE2xUN/cSguvhmEP0XS/BPXjIfwk2aaCjdUwAsN3u4LmoDBZYILU7BN6
	h7hjJyDPBpa3P9fWagUcI4kKtpGLp/p3qtyDaf54VqXoxhUySuFPZCXT1C5HL8fBC0wJFov9RyP
	rHX0ba4i2LwZb6HUHFsaymNhs8vbqulnMChr/Ucn+pgne47FlZWr
X-Google-Smtp-Source: AGHT+IG/5zeiMFHKS8IyQonI63vNtLgrs9uV3VjFWgQcIiC59hYMOOfeXSTOWS9fAtpxxqoHMH5LeQ==
X-Received: by 2002:a05:6602:14c2:b0:864:4a1b:dfc5 with SMTP id ca18e2360f4ac-8676363f86fmr1352730739f.9.1747055885202;
        Mon, 12 May 2025 06:18:05 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8676359ba29sm176561939f.15.2025.05.12.06.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 06:18:04 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: asml.silence@gmail.com, io-uring@vger.kernel.org, 
 linux-kernel@vger.kernel.org, hexue <xue01.he@samsung.com>
In-Reply-To: <20250512052025.293031-1-xue01.he@samsung.com>
References: <CGME20250512052032epcas5p46bb23adcb4a467aa7f66b82d3548b124@epcas5p4.samsung.com>
 <20250512052025.293031-1-xue01.he@samsung.com>
Subject: Re: [PATCH] io_uring/uring_cmd: fix hybrid polling initialization
 issue
Message-Id: <174705588448.247808.6501961684516109149.b4-ty@kernel.dk>
Date: Mon, 12 May 2025 07:18:04 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-7b9b9


On Mon, 12 May 2025 13:20:25 +0800, hexue wrote:
> Modify the defect that the timer is not initialized during IO transfer
> when passthrough is used with hybrid polling to ensure that the program
> can run normally.
> 
> 

Applied, thanks!

[1/1] io_uring/uring_cmd: fix hybrid polling initialization issue
      commit: 63166b815dc163b2e46426cecf707dc5923d6d13

Best regards,
-- 
Jens Axboe



