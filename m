Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8793C17
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 00:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745885076; cv=none; b=TzD+2+tJKw6LSxNW2TSNkfvCv5RwTO3X9+3G9918aDPBJ/IECkZ5mFkcglQUjJ8MM8SMhvPTDLAkls646uyHO9pi0g9JrH6oTJdeNYA0dnj/mWoxXclIYf8PZdVy019HDl09th5hxERjFh0l8Q663hVrOBlP0084slCrN+tvrjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745885076; c=relaxed/simple;
	bh=pm1+6lHAg8kFKuzXKLaoKVWctIhuCttRdaDkOc3bA2k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IafrKK3y+G1smqwUmIEtJp9FPlOZH3ECjMaQjDlUNrzVHBq99+ryIMTP7WfS5GNKPGblntOyLkibuhQAV0OsUpa0eL1weNnfWzn3GSDNCcffRgdjXy0Xo1hrzBydQ0+L7n3h8mMgDcxyDdU84E9/V6f4SPVlTdboRSEFSLRRtbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=l0+rY/ru; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="l0+rY/ru"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b170c99aa49so3052855a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 17:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1745885073; x=1746489873; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pm1+6lHAg8kFKuzXKLaoKVWctIhuCttRdaDkOc3bA2k=;
        b=l0+rY/rudRF9Nx0BorM+YShY1L6EnYSIc5waRlktulNsrk7BogyMCsRLSFYrKPm29O
         EAyB2Y5fQZEbOxpLKtmv2MTichm/9/tBquuGfbrFXDYC1z0KoWHWD+1NjVebb6OFsI2R
         RV58smPAgOAKIYTKF556rG0HV64qPcpDZ9I+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745885073; x=1746489873;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pm1+6lHAg8kFKuzXKLaoKVWctIhuCttRdaDkOc3bA2k=;
        b=Oa4SXgsWwUK+BPkXRgWqCrJnw24rdpID/PTuruH8pNb3mwSPro09kFixTL7PIQ0OIK
         e51IEDyQbOCEoUSQZe9qqkPjfAkz4c5DyPV+HsfQMsq5iOB6fjrzVn4OcXnBmYY0YNNC
         kgsnuOQ2Z+FfDEHTLbNT0AaRRRVfncizbji+qiiCJx+yTRqKLMahSEEkfRCbTGFUGxL8
         q56KGdHZnL1HLYpnViQW0O5H22bBuJp+eODpNPwDz2NV2SllUIaIBlncgyMGZvVHSN3x
         rvRysRg0zWjXsHP+xwATXs6CVgxZDDTMuwWQknmX47bJo8sVp0HUu4HhofVpeZHuMhZu
         YnZg==
X-Forwarded-Encrypted: i=1; AJvYcCXuYg0bql1xFFoRQFj7OnJDTMfnFWDkOx7KCwyAazXEWd3RJAam2J8nDXUvlee/8ennK2DOikm4M9ryac8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIbT5nqri+656nHT+B/61TomY9LqtMbfO3YMoCMj1QV+jvGFn+
	VXgkw5WvJhplST8KTrU0TrOcYlsKr9+hyGCJCChj523YyDF/Zh+Zh9R8KH6++ge5KvgZwT4G94J
	KBIAQ+8xyH2+WoMvWbLFHQIMM71bOODMICTcc1A==
X-Gm-Gg: ASbGncsZK2sox+CSNQRNSbn8cQwh8OW5+CL+tpir/t7zT5nYNisJyFKtoW5iH5KOsCQ
	DY/DAY+ITMsfdTYMxF9Xthxxpd1DejNmEfD5AndWDoRybne8nd2spU7YGyxexBPs4vxoggiSLW2
	T6IFffOA5CRnMePvK42ruy0TMWMwMHhsZLo/qXfBO7w788tGzTZ6oNJnbM
X-Google-Smtp-Source: AGHT+IHODQs6hlSHS3ey+DezbNAm7mdXVwvvBJJmUkxpQmUDI1R7g/QJMgfhaFo+GAPgW2tFTHfPxuVQXs6avEnvSMo=
X-Received: by 2002:a17:90b:2b86:b0:2fc:a3b7:108e with SMTP id
 98e67ed59e1d1-30a23dc1e01mr944498a91.4.1745885072890; Mon, 28 Apr 2025
 17:04:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416114240.2929832-1-daniel@0x0f.com> <ac188e54-7f23-4ecd-805c-c0437a53247a@linux-m68k.org>
In-Reply-To: <ac188e54-7f23-4ecd-805c-c0437a53247a@linux-m68k.org>
From: Daniel Palmer <daniel@0x0f.com>
Date: Tue, 29 Apr 2025 09:04:22 +0900
X-Gm-Features: ATxdqUHQKTGOMSOv8SkE055vDmiDt6du5-89tna8BU1UHWG1e9Uo5AjH1ewooDM
Message-ID: <CAFr9PXmrVUL1HubP04iHR1ObhaNo+mObg7FC+-HpTF7QR0og3g@mail.gmail.com>
Subject: Re: [PATCH] m68k: Enable dead code elimination
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

On Mon, 28 Apr 2025 at 08:37, Greg Ungerer <gerg@linux-m68k.org> wrote:
> I notice that some other architectures (arm and powerpc) have version
> checks on gcc or ld in the config. Do you know if there is any version
> limitations for m68k here?

I'm not sure about that. I'll try to work out why they have the checks
and see if that affects m68k too.
I'm using GCC13 so probably new enough that most things work.

Cheers,

Daniel
