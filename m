Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2560020C472;
	Mon,  3 Feb 2025 17:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738605369; cv=none; b=EDHMrwa3Xn2kDzux2ujtoeLW4WZHhLJAb0x4LnMWzwP/WH8jRha/7fdOsFSKkdSEY04s9nzodpsCZYB1wTm7MfPg7dPtItFIQtjX6grx1/eGOWvIecFN7qB+LyKAhqXV/JunSY85ehtoQzcST+BWjrNXjUKqjHd/tyPo1JS42is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738605369; c=relaxed/simple;
	bh=BZlG6qukcR1bKoGzv2A3zgsDzpoRIrNQk0E5BjV2Y58=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CtbWccUKrXMCYxP2rqKMSXIwOxpXPpWZ7vJTAsMIqpCzuoC4fQKmNyvz7lulfjWYgWLMyym7cGc6j3kwOKrTGM0uM5uFiiNKmS2g2ptcjiyL4lrRvGaxIZHIPyyfziSEUHxXnpVhgwvFYU6wFZmkjs6Nl745NKzc8FeaxNl/4gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j233aCve; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j233aCve"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21ddab8800bso65522645ad.3;
        Mon, 03 Feb 2025 09:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738605367; x=1739210167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TDFyGSUMafApaHTWLMKsKf+VtO1Au4f2gqXMw9bztTY=;
        b=j233aCvewE0DyDc+0Hf6ZmBVXgjNaHRA/ENyIcwIV7OeZb0dgE/Rifexaz+4LZ3Yru
         TyaezSagUt9aXTPoIAB4t77pUyW0gGanKyioWNHcWunMk0OfOFOfiCqEqhJVc9BUDbCr
         87zLFup3T/89WEcZ2vybChVWHtGUm81hHjzomDWfXnNlDxrZddT33BEombq4YPn+RUdw
         dgaOl+wvnvRK4dBvz1AJ7qLLFR8TYenj9XRPdXWDUZ7NN8a4PmpmyJ6EzYhfvLHQejg9
         MF7v4fVuj/vMNz3ttJhjQdpwnMvGyEVi1xZ+JtvrAj8i9L0dtXKQE8aEDQXbLAqGErgh
         Kf8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738605367; x=1739210167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TDFyGSUMafApaHTWLMKsKf+VtO1Au4f2gqXMw9bztTY=;
        b=DD23ahbCM+uwPljHclKVMbpJOTvwagfiATTTdjAUsIlVoKcquNBizqHPeSTtlWOro9
         +dzypOOgjLcc0fwwJWj/nFrFcC2Ye5GinDwL6gN1Wfgn4+23MxXykI/hQ7AsjhaiTAGd
         gThCyvXk9LIxFXd8euU3aCgwXDa3ISq1a2YUa8jniskjyjprNW2BJQR9Xjf1/Xa+AZBA
         454/DLm2dYqWoE+cLBgmr8Hd+gJsFETCFobskhFN7gz+/Gzk8zg50rvDxBSj2rGDSMpq
         OzXtbxGKg1USFSA1hv+UfizoqVftE2nPzUES0n1VqiULowImWJmqHIXdOtYnsr4QEPAB
         3IRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnnX9jzZDbeJeI2vhKiOQs6t6YD+8Q3934v4mj89vhwcUhDAqgk0QU8lJSUF96fPh6FCla39RPZdHyhh0=@vger.kernel.org, AJvYcCXu6TGwbs4JymIIjNLKOpiKTnjYOrXsvPu9rtf1eIsQKUSLSAiRzSnJddaA0rJOTampsaWUhKpwauOWQVN186E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoKF6L1D2q7ZJZbWdxcfmYE1ktvBpLVdfqCH9JjS0onIDEnRja
	AuS7ioGRfI3rUllN7Bs7by/0cPlUbiZwlfqK++O9rCz9HWMiKru/
X-Gm-Gg: ASbGncvJFcT0txGW0lQmdnMUd+2q20Jf+BRHSHQR5BE8arZGEGRwusuEaQSZ0PQCCil
	ZsHPwU7cb3NZ6IH4ZgnRcOtPPMFwaJZeN6tGvRJyAuMynxe+M/Zx17eTf7uDE8KeuhharCq4mRf
	EiTOtdNqQRx8nLpovL+sLX/biuQenvbv7fNMpGUFMHH+/l1zxdlpZq6beedUaNjPjC/P+XPjIbm
	TjmltJGDFHKrkW55yoUVzdoHj4zPymSK+reRmW79lm+ss6wrBePu8yab5yqOQ0IB5KgHXpboiwg
	vQJL4holM9XlToVC7GL3vX6o
X-Google-Smtp-Source: AGHT+IEkTa8FxVIrVL+m1U43PB+nSpX468AaW+BikDxgCuAaSXwqFgJWsRFVk4vKia6BVf0PGj4GGw==
X-Received: by 2002:a05:6a00:23d3:b0:725:ae5f:7f06 with SMTP id d2e1a72fcca58-72fd0c74eb1mr32982941b3a.23.1738605367235;
        Mon, 03 Feb 2025 09:56:07 -0800 (PST)
Received: from linuxsimoes.. ([187.120.154.251])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe6a1a78asm8699082b3a.164.2025.02.03.09.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 09:56:06 -0800 (PST)
From: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
To: aliceryhl@google.com
Cc: a.hindborg@kernel.org,
	alex.gaynor@gmail.com,
	benno.lossin@proton.me,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	linux-kernel@vger.kernel.org,
	longman@redhat.com,
	mingo@redhat.com,
	ojeda@kernel.org,
	peterz@infradead.org,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu,
	trintaeoitogc@gmail.com,
	will@kernel.org
Subject: Re: [PATCH] rust: sync: lock: Add Lock::get_mut()
Date: Mon,  3 Feb 2025 14:55:43 -0300
Message-Id: <20250203175543.241946-1-trintaeoitogc@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAH5fLggJnaTD3_uc--eZfXMHurPab_Y_XuJOPcSk5oTeiyjbqQ@mail.gmail.com>
References: <CAH5fLggJnaTD3_uc--eZfXMHurPab_Y_XuJOPcSk5oTeiyjbqQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Alice Ryhl <aliceryhl@google.com> wrotes:
> I maintain my objection that this function cannot be correctly called.
> Yes, if you use dubious unsafe code, you can call it, but we shouldn't
> do that.
> 
> At best, you could change this method to take `self: Pin<&mut Self>`.
Yes you is right, we should avoid unsafe code. But how the 
`self: Pin<&mut Self` help us here? 

The unsafe code at the get_mut() call place, is because of
`get_unchecked_mut`. You probably already know, but this is unsafe because you
need guarantee that the value is not move in memory. The `get_unchecked_mut`
return a &mut T, (in this case return a &mut Example), and we need a reference
to Example for access `d` field. 

since we have access for `d` , we can get get_mut() without pinned `d`.

We need a way for get `Example.d` without `get_unchecked_mut`.

Thanks,
Guilherme
