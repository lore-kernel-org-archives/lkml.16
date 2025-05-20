Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DC22882C2
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 20:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747773439; cv=none; b=CvPiFZar4VkzWDHam8yIgLaJSbqdE/xUA9KXCQbr9gxotoBWIRgU0xY/EOueBePspJhj1HMsaFonreuBV9rtsQmxY0k+tPAtnng7tZy142imIv2N0Po/yDX/oI0+pRHXzFmb4ardsWiGZ3bP7T2u7OD0o5hOVjqOcN1uRfOYoZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747773439; c=relaxed/simple;
	bh=PcGonA1RR/Bh4aDPJWXGR/GCW6N0h55uO6CJptM5iA0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YP9c8u3ClXQ0n/5V7+eg8H1CssTgLraNTr/f8fmM3z233BBW1S1zF/OL5bT8bB2LeJFpUNX1tCIeoTJnLUXHRhhzXSmEHi5XMss2c73gg5Lx4IQvXXIKvHIDIQIZwJOqRAEogb+5H4kPfSrJ818a6G2PisafbN2y6xSoO01oPuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=SyZvc1p3; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="SyZvc1p3"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3dc6f653152so7943055ab.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 13:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1747773435; x=1748378235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yr2qm/uVt8l/rpjOe0yZQh8gZ09b5P0fXzbngb/+feE=;
        b=SyZvc1p3eyXk2rRMDqEt7kQsTRE7vy4Ai8HonGJgyH8qA8Y0qFrQwbD7/6Falidal5
         fIb6wD5wAYen7CcBaQDcjY+wFdMqgqPdoNy3ByTeF2tC25PvKZNY+XhavaYTqYASc81L
         5lvcYSfYbx7OQm35dKEg5xJOXW4+U0R5jpF0e2nPrkryqISDrKx1/4AdE59sT8dL8cez
         Er7h4+1ojYQniPU7dDn+MmWhbixvgTfml/6hBfCKw/+VyVM9QiCotF6qXT3BpZ19JYqg
         pRvwr0A5A8YSHLCuwUBjDEGzr7wG3S92AuIShdVJhifO9Z5aOrKsP/QoNwLIL71BnSO5
         oxow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747773435; x=1748378235;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yr2qm/uVt8l/rpjOe0yZQh8gZ09b5P0fXzbngb/+feE=;
        b=j8/zWjPf2KfYYKy65n056m1GAGQ7z9P+efixsjGu+OUfj/fwf8lDbPrqxm2wbOaf4B
         8r7eE3g7KSd1d6HyyXpjkPYZLDmS+dmkOjl2062Wcmm9/M0CN10TfLIS0F3d7igtWni4
         N2WLJHVUe8OL5VwkJYku+di5F/Pihe2LdY9tPCxVBAwvTkHSMf4vEZdtckyp71Q2BIpZ
         KLlEt3h3ACLdlDZlt4z5tGl5aY9bod/ZSW4r/gkC3uh3093Li+ZfooV7Ii6mPrsMbML4
         sVmAiNecJI1Y/chWjQVR8q1gjP0NcIOtVprRlfSz3Ob0DBzpyywXrvaN7V3HzlYwGkh4
         43+w==
X-Forwarded-Encrypted: i=1; AJvYcCUEEkoEDMOQ8wFVXscr0Q5IMEsdqc6Jd7WaBciW2U+XVpN+mL1XqyEZSlqsCGvg/MIybVOZJei0QmrrrHs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+n2lPpY2nJRAISN12jB2GHwsSWKPmauo7TltHYh+3etb5D4YY
	xPRoSJfw5cqUxDlXyMFZopX9QYmWeAg6FBH0KTsl2DfjQpXBdkFeyp2yn2Z3QHGAmD8=
X-Gm-Gg: ASbGncvvzMDHKgDHkKb+EKNkQECkIvU/oO/HLN9xtQbKj1DTNJYqdoz4X08K/lZ5zeL
	mnUxoE69kGP3EgXAZ9Dro0QbjJP0K+86eIYZ7Y7gE0fWVytFZ8CsYZC4qcSw0htPn2uiGy1hEV6
	rDV5Cpv++s/tOaM6ERkLGk0zQen9fH5eky/qpchzng5jQ0Z22S/jyHezNEbrGnnN3O6yv6+3ruJ
	3WdAQttulQpl70njhb4bsft8+YyNe9cOpYQgTze7rd1kpWSGg4Ewt2QAIT6EjMFKg0KSA7f4IyF
	rJPfXGB6uXfSem8fzbGEFvnuvFf742bw5epqCi8y6g==
X-Google-Smtp-Source: AGHT+IHQOfx09EhKv18CXsHHzPjzP2hJg44ctRPVvRhmzfoiRLtIk23NWCiO4sg7r/4nts0urSf4PQ==
X-Received: by 2002:a05:6e02:1a6c:b0:3dc:8273:8c81 with SMTP id e9e14a558f8ab-3dc82738eadmr11155935ab.22.1747773435659;
        Tue, 20 May 2025 13:37:15 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbcc3d2b49sm2388684173.59.2025.05.20.13.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 13:37:14 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Pavel Begunkov <asml.silence@gmail.com>, 
 Caleb Sander Mateos <csander@purestorage.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250520193337.1374509-1-csander@purestorage.com>
References: <20250520193337.1374509-1-csander@purestorage.com>
Subject: Re: [PATCH] io_uring/cmd: axe duplicate
 io_uring_cmd_import_fixed_vec() declaration
Message-Id: <174777343432.778148.1451499189557344108.b4-ty@kernel.dk>
Date: Tue, 20 May 2025 14:37:14 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-7b9b9


On Tue, 20 May 2025 13:33:36 -0600, Caleb Sander Mateos wrote:
> io_uring_cmd_import_fixed_vec() is declared in both
> include/linux/io_uring/cmd.h and io_uring/uring_cmd.h. The declarations
> are identical (if redundant) for CONFIG_IO_URING=y. But if
> CONFIG_IO_URING=N, include/linux/io_uring/cmd.h declares the function as
> static inline while io_uring/uring_cmd.h declares it as extern. This
> causes linker errors if the declaration in io_uring/uring_cmd.h is used.
> 
> [...]

Applied, thanks!

[1/1] io_uring/cmd: axe duplicate io_uring_cmd_import_fixed_vec() declaration
      commit: f1774d9d4e104639a9122bde3b1fe58a0c0dcde7

Best regards,
-- 
Jens Axboe



