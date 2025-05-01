Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BCD13AD1C;
	Thu,  1 May 2025 13:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746104855; cv=none; b=aCSqFXLLtCsQsrRfPAq8b1/lg0isompfO+Lkw9TDOtbIhKVygCCUArRWFrNWGOTL9dvc03XMMU/4g3eIDxgfRkqg4+zPD7NTTl/uoidHD3hM0/3yp1dwA6/BRhCJzdhYbFyIb1sT8T3/xp4EIl9aNSq2/6UB5AyzECsoR/NMLzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746104855; c=relaxed/simple;
	bh=iciWH3TQMvTgRZbyKyAeQWMA85KUlGrMImI+Vn2Ayck=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=agI/r2CuSkbPPAWTSC1/CqsMF6ft1KEOjqUOOkmwa9KiGwR5BLHp0swmS0EUVDMou8/tdXp7igBKvKTJToUo6MdQc5aHP5M/DTJMYzlzqWuevlS8MmY/GxiYW7oVjT6GMWc9Z2f4iWnQxQc/NAct0apbpEiNXjvPabfm4XiTBqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YY10mrd/; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YY10mrd/"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3031354f134so757243a91.3;
        Thu, 01 May 2025 06:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746104853; x=1746709653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ce1OY74HS/lf973Ll6R+BYLFB5N2IGJiNhqpPO8uVdg=;
        b=YY10mrd/ggK201PZd2RfrbOmm3fd4Bkkag524h41Irq4Vat7OMp6t9Vrt5HD4iO60D
         7BeBIGjyC+EPVvGskEntPs7u7Ih2aZdB+3v1ZDn6McX9epvGv8zJfLxyUzr2VwsqTb4X
         WLfP+xuK7hjN8U4UCMq40fDvwfUVLmTJvGJlskQcA5hEdqAr5hgMloiIJLRKnfQHJEvK
         uLEHSGaxxqFAELL6ZIcelKlKVUyBrBqSN8qAay3EN9YSocVOG3LxixuQKiBQjms0ePCk
         HhUjSicxqlCDVqDiew9uM0DfjWr6/XTPVU53Zlx3awt0X61lKw92dhs7pKGyGC+9+EJ7
         SfvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746104853; x=1746709653;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ce1OY74HS/lf973Ll6R+BYLFB5N2IGJiNhqpPO8uVdg=;
        b=lQLKvYOHj734+I8eELR2TOhoxug2psfu6cT3WGxtuBJEoz/vwzYDjP739SI1tYzBNN
         rEbhW9PnwW2KePplUrmhpvwg6/CLYNJmkIwWoXy4Sgk4FYgh+okrzBY4am3PqTg1ptjG
         DcX5myKA6KUUwcdXLZruUa/Sn4rcR5JktnI2tMjiFmgDohyZYrT8kfWl1Gbt1lGrKDi0
         /zt7FNMHXNZ+FsS+jlqSOZUweIXRhkd3EwYSOv6MbbWbxPJeAZKSnm5ToveOIOByKF0s
         eqafj573S8QhkvRcpHjm7DMKyH7MCqxrHfItvIy+r0bhzH4VFAhAG3ThwjgerYtHPtdl
         x8gg==
X-Forwarded-Encrypted: i=1; AJvYcCVfa1o9S5LKRYCwjVu/9TTP/QPqUbpgvz+NJ56tu+1RQ483SflmKclGaCUzBKXLEpKvCA/QTNzv2dfR+Qk2DI0=@vger.kernel.org, AJvYcCX5lcZXYO0fbJDTIkXOzm0xSPhsoRFd42KNRUwGXn4lBzertr7DGdHaO6Og5Q76LL8Z4RxpolhFHBMdH50=@vger.kernel.org
X-Gm-Message-State: AOJu0YyC5F0BpsU4zkaReYUaEj2PXFQqX6l6WdpMv2PzZnWLMtSkaLoI
	7ee4bSviY+o9BpQ4xFEsu/6J2DBgslQaw71ryrXPkzInJHfiqe48
X-Gm-Gg: ASbGnctLpb9B6dhzS1CjDcXHWVJ7vmzwVNlj+uYywnWoRXEbinRryASqlTGCfen++ce
	dRJut/bRDBYEX+6iTW8ifLUxlkmqQ/1LzFuXIQvY1O/1V0OnH8YRZXm+2kcEaDFb0/vR4h/vIdq
	e3vuGm4Vuxx/ZSweRw+ZPTIp4Zol3p73IAx3ipxOjP5DJqDbl8SEPiN7+NSIfY4Qsb1WgfAOoiH
	MdFTxdcLNezHguPuz/pv42SLafchqEIfWTfs74eEuYT87cQB3N4XE/3voGk2zYciGznuuMaBZ4Z
	TMAmnedSVOglE8ePyDrSFiglYUprhXKKBn0R/jim6zfDyYIO30T6M81loWICT1pTy1fLFlS4fqo
	a7KikY+nD3tmwv+uIjkX/vz4=
X-Google-Smtp-Source: AGHT+IHN9rwQjjatNJ/9eX0PfCCsO11jAcWMSBH57N2WIfuTg7rKRcI9v1q84tM6ZUTT4C279BUN7A==
X-Received: by 2002:a17:90a:e185:b0:301:1c29:a1d9 with SMTP id 98e67ed59e1d1-30a41d45eebmr3813199a91.21.1746104853330;
        Thu, 01 May 2025 06:07:33 -0700 (PDT)
Received: from localhost (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a4745f945sm799307a91.4.2025.05.01.06.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 06:07:32 -0700 (PDT)
Date: Thu, 01 May 2025 22:07:17 +0900 (JST)
Message-Id: <20250501.220717.849589327730222635.fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com
Cc: fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, a.hindborg@samsung.com, frederic@kernel.org,
 lyude@redhat.com, tglx@linutronix.de, anna-maria@linutronix.de,
 jstultz@google.com, sboyd@kernel.org, ojeda@kernel.org,
 alex.gaynor@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, aliceryhl@google.com, tmgross@umich.edu,
 chrisi.schrefl@gmail.com, arnd@arndb.de, linux@armlinux.org.uk
Subject: Re: [PATCH v1] rust: time: Avoid 64-bit integer division
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <aBNojspyH5dHsuOm@Mac.home>
References: <20250501015818.226376-1-fujita.tomonori@gmail.com>
	<aBNojspyH5dHsuOm@Mac.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Thu, 1 May 2025 05:26:54 -0700
Boqun Feng <boqun.feng@gmail.com> wrote:

> On Thu, May 01, 2025 at 10:58:18AM +0900, FUJITA Tomonori wrote:
>> Avoid 64-bit integer division that 32-bit architectures don't
>> implement generally. This uses ktime_to_ms() and ktime_to_us()
>> instead.
>> 
>> The timer abstraction needs i64 / u32 division so C's div_s64() can be
>> used but ktime_to_ms() and ktime_to_us() provide a simpler solution
>> for this timer abstraction problem. On some architectures, there is
>> room to optimize the implementation of them, but such optimization can
>> be done if and when it becomes necessary.
>> 
> 
> Nacked-by: Boqun Feng <boqun.feng@gmail.com>
> 
> As I said a few times, we should rely on compiler's optimization when
> available, i.e. it's a problem that ARM compiler doesn't have this
> optimization, don't punish other architecture of no reason.

Did you mean that we should do something like the following?

pub fn as_millis(self) -> i64 {
    #[cfg(CONFIG_ARM)]
    {
        // SAFETY: It is always safe to call `ktime_to_ms()` with any value.
        unsafe { bindings::ktime_to_ms(self.nanos) }
    }
    #[cfg(not(CONFIG_ARM))]
    {
        self.as_nanos() / NSEC_PER_MSEC
    }
}
