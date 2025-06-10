Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3FD28F500;
	Tue, 10 Jun 2025 12:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749557584; cv=none; b=cvI8JS7+eZOXvc8NgW+8oWhvHr9Yv/jb/Cz52U757tBkzK2ki90ZOT8vmWsdJf9HDHFdl9H79vXhC0kvMyLMrzb1FpdXFu08ArDUO1/wZCBHdwpiJm/VzZGY1VYvrYOdg7SIOjlskiOROwQqq5hkK9/nCAQl2G48GpNkO9pB29c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749557584; c=relaxed/simple;
	bh=VFVe3KxCBP5M5HvA0ecO8kup7qOvlC2xfnNmuumZZC4=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Iu+/V2ygxJExUTRBTKlkvNlkDqMbPAbUiuwgItrhdZpNdfqns/lIBBb6CXZo/i2GIxqVTXEROdRtcK9jfd1D0c6NiNvGNRvUunVChcI+ANAJSO3DjHn7YUx6PsgDya2C4kmQaBV+TawLXbU6SjqgC4phUvh3daQqiIre9on2MuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jgP2Bk22; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jgP2Bk22"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2345c60507bso37563325ad.0;
        Tue, 10 Jun 2025 05:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749557583; x=1750162383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UheSJeV/vuqqUXtKMPeiFYjWuuc1ZxQmdOYq3GQ1XdM=;
        b=jgP2Bk22O39qb+T4fce5tywtmKfwXPSrd+D22r/JbBSMtulB5LHEkGwlrCCYHuiozX
         ZXs4F8f5l8igLPESxvOx82qq+WfEcCo2CE4JIVlzMCEel7kmgXfiGPHih/KTBRnwoHJu
         Yy7moshL+dxLvDFmeDf6kNYdUl3T3Gpmf0FD9M/CP+5NpJJBon/nag70WRNJjYNqEO1h
         hMIx0zmseof+rhuUCPcuXecx8F2Jr9x5S8VGLBseJTOhKxG/9vRuN12oJOTBBFSoMV57
         dumCPsL8+m1sbQeO/Hjd2bWfC1ENDdCPX+LTWrNXVpi/ic7+3hhrV4hip1sw7Z23arnu
         vrrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749557583; x=1750162383;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UheSJeV/vuqqUXtKMPeiFYjWuuc1ZxQmdOYq3GQ1XdM=;
        b=EtJk0TWJNUA6Zax9HbaAe6dhMAzvbycFj/k+rSTgYk26/0DpYImyjS9ixePkj0iljc
         4XdWQaoaxYOhphl2OpTATkoy9ZiXnYNVZTdyUkd3M3YFsH8jL/6vtO72MOjlPcI8sIlz
         uBdbbc7xBUrPDfZkZ2K6gYLzNGxDCZ5x46aln/573Ych8zBbGIZ48O051jxQXE65OT/M
         9Ca69Dj9ESIjmagjEx5iwDaDtvWpgwLGbZ6kbTBK4/V8fOQVpu+FbdrbNbYwgzYZMpI0
         +sC69b+qcMR1cfJ2ScpRc97nYoa2KeLxWO5vGfdaXCluCx0JaQel7RZJMtCFJOTtP2mM
         pAzA==
X-Forwarded-Encrypted: i=1; AJvYcCUEL/eR64ix1leYG4nSWJ4n9rVcpWPjOXEhEdT1ym0MyTLRbIhcrZxVDitVQebLh5UAQU0hswsFJebRrXPy1QY=@vger.kernel.org, AJvYcCW/OhQvJBHf18CX6bVWOt/02A2rLVN3IoL75gbXakdZ3ohz5ZmLkfI4Wyha2lnpBmRFSCyUMprh2Wmg0k0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzD1+Rm/BM2fDXjI5J4uqNC2pTEqilKQU1PXuwHXZLHcv3ytrAU
	6RxYyXlOCluvXXGJ1Y3Ja3zwdFgq4OJTVprQwsdKPk4jE3lQdeE0JN3d
X-Gm-Gg: ASbGnctOkUa+aAxH/TMPbg4a+LDo3ARI6Iuq4W+JVpQpfEmm9wrq4DQrwYwqQayXS3j
	ZNtsR7VeObBNSjRXJrKnivNRuqEwR6MThp+uCQsV/przmxk/O7dmg7CeDMclyjG0DO/6c+GYnXe
	YIFNQZHZ41cn+efLDQpQijV3RGNI/btvujOgyk1PJQJuI+xSsu8FAewuweWrrw7oE6SXK5OQHID
	YNss7hud+1BnE2ugNrUoefzX04GRk0y4Ekfpv4rAj+xuC/dGHSJ3jdSQVGwnomQeG4T01WDe716
	tx1rZXgPoOLbWPQTV4ZdANAtcwUjC3oG7yh08fNY/UhBpRNzO83vpm1mhYRHJxDTS1YQizYvOnw
	zD+sqYDQSseNy3YRDaUE6LCX4J3F7uCBzfmAq+RnF
X-Google-Smtp-Source: AGHT+IHq7fTF8DbG3Ns8KtBuQD0XmUg43yzp62SeU6c8RnfYAXdMx3RdYSIusB6mp6LR4DVOvn9Jnw==
X-Received: by 2002:a17:90b:4e8d:b0:311:a561:86f3 with SMTP id 98e67ed59e1d1-313472c046fmr24396853a91.6.1749557582545;
        Tue, 10 Jun 2025 05:13:02 -0700 (PDT)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3134b13b45dsm7824604a91.37.2025.06.10.05.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:13:02 -0700 (PDT)
Date: Tue, 10 Jun 2025 21:12:49 +0900 (JST)
Message-Id: <20250610.211249.2063729126507233927.fujita.tomonori@gmail.com>
To: a.hindborg@kernel.org
Cc: fujita.tomonori@gmail.com, alex.gaynor@gmail.com, ojeda@kernel.org,
 aliceryhl@google.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com,
 boqun.feng@gmail.com, dakr@kernel.org, frederic@kernel.org,
 gary@garyguo.net, jstultz@google.com, linux-kernel@vger.kernel.org,
 lossin@kernel.org, lyude@redhat.com, rust-for-linux@vger.kernel.org,
 sboyd@kernel.org, tglx@linutronix.de, tmgross@umich.edu
Subject: Re: [PATCH v2 4/5] rust: time: Make HasHrTimer generic over
 HrTimerMode
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <87o6uv27qr.fsf@kernel.org>
References: <1zU91IwxagjPCPl0Nw9xz728DEqNqtV7KHWwCZYP2EiiVcUrZT3T2VFLOOdsmQ-LT9GrdHddepVw6__or-ZvPQ==@protonmail.internalid>
	<20250609102418.3345792-5-fujita.tomonori@gmail.com>
	<87o6uv27qr.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Tue, 10 Jun 2025 13:25:37 +0200
Andreas Hindborg <a.hindborg@kernel.org> wrote:

>> struct Foo {
>>     #[pin]
>>     timer: HrTimer<Self>,
>> }
>>
>> impl_has_hr_timer! {
>>     impl HasHrTimer<Self> for Foo {
>>         mode : AbsoluteMode<Monotonic>,
>>         field : self.timer
>>     }
> 
> Can you add an optional comma after the `field` entry? I think it is
> `$(,)?` in the macro declaration.

Sounds good. I'll send v3 shortly.
