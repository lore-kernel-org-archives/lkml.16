Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D597228BAAB;
	Thu, 22 May 2025 13:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747920458; cv=none; b=oXBeXaEWCyDOha4ZaXEMnHJwmJMO5RHa9ItFSRyjDLAGGMZ+oLRNMtBLc7uLbWNB0zjYLg9wERxaRctj5yhy3/LW+sIcXQI8PFs7ZS/pU1RQtamVEuauJlBFQuwuaQl7pOUQ+SsyZlxhY64ARLnluQAIInCKxP+MI0SWoZ8SK3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747920458; c=relaxed/simple;
	bh=VON5sS8LJxFlkbqVCWCNdXM9FXCW8UNRgLDxNs7O+oY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e2h6+wexKodjk5dQmKo/PAujwFeiGIQ0I5yIpESCPDEFzZC84Rtha4sKMBZAKqkh+X4lSIKW3whqJkqZlQS53uAcw5K0qMfQ2CpXBYQIdToF2w0G6aIIbWJka5w3LhEWjDcTXRsmnmPDanK0K5HO2Jn2DoKchWilUaRMZLNOLjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KFipqWI0; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KFipqWI0"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2322bace4ceso43960465ad.2;
        Thu, 22 May 2025 06:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747920456; x=1748525256; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VON5sS8LJxFlkbqVCWCNdXM9FXCW8UNRgLDxNs7O+oY=;
        b=KFipqWI0dgTdIKvCNmFf2UXa4QxWRMJzZHRxVYWyNJ4sDeB+U78vX99QY0+4OaXk4G
         v1CeqXDGnl8jqolKEkg6ykK06oXR2pxKakvoWQutknxshD1oCPT0BCZmM2qzgbWH5Yz7
         PjXCHDN1Lt/9NlJyqy/VjC6hFnrHy5684CRK8FtXyzzop9NSq3oWvlRIxoiY8RjmFl11
         500Bzdh3oTLfyyRIhzrYQtNQmCWdhB01tG0lYydsAqBQcYqce1L8cL0PZFzrGbeZcDMU
         PNj39z1j2vV9CbiduXo70h66eht2mdrdObifXTCaYDyuiVtATs61qT2Lrwa3exnsRAwS
         Iidg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747920456; x=1748525256;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VON5sS8LJxFlkbqVCWCNdXM9FXCW8UNRgLDxNs7O+oY=;
        b=NCrBph5yVWEnOp0Kaej9STeJhIB24/QMoHwD8ku2Cgv+4yax8IhMLJAzVPi75tKr+C
         IzAog+GBGb4Z0GVFnDFLykCv5l8mNqOl4nTTgEYVyJ9jDjAyve3DA/DUd6Slf5qZL/cl
         Qnz97kR+u6gDRYgT2NT3eQItDhdiXZkL1fS+1fnxq8w3Naa4One3wkxIVVnrvAFj1Nd/
         rY7xCmCKsHaS0dvoP2Df1q29Ikvp7pxdDp2zVbRzOK0XRdaR0j/3UM6eqaWyiW0T9ZLs
         5bXW5hRstP7yGzCWV+NdriIIIaMWaO8rStMIGIuJLAcaLrA6nMZX8luDRRyG0MOwHQh9
         3Y1Q==
X-Forwarded-Encrypted: i=1; AJvYcCU2b6ipAq0AmrV3/N+gQjM+X4q1ZC++I8eSVgPuQkhpCI5UGhMT7C1IUUqWPZH2EVqsSL3oxrW78AI+5AFqmBI=@vger.kernel.org, AJvYcCWiwYwn+55CwjaldZnYGy6DoStsFup9DQRjMVRqc51LDKLNDlnnPwdW1J69n6OsJNiMI5RwmeuToykgSUU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd/Tna9OeDH54AoszkTWoe0EcqELIYJb2nApfjE5McVn2K/ulL
	MvqxmxJijWg18Ynp1NYMqPjyayguw3s1vUuMFc5FZDOmYlVbDomE56C1
X-Gm-Gg: ASbGnctcX0ZwlOt9HYPnqF4z745ri0bKJDDVLxupUSQWmWrFvs1MJhI4AsxRc/isMbX
	0Iu6pLEp7hgIS/I5CMcRvUMz7vY4lhjoFaa//I1YAb6i7tV6nIjYCGbZM76PJ/JSjTw0NDplhBM
	fW0JaZAI74ZgUlJsH+7tzZLKnKdE8XwIwPuDe2Z7WNIcOJxs0cnfYA95SChWLDTYawuECPC3IC1
	ixz2PumtVfxBS7lzhbNONiLacjxSDN+EfKkIxEO+acvr/0E25xNenxMVCWkn7aKkcss/oFMMtzP
	bUOuq24BxFWna0XW+hbQPYzraJQdCOtuT7Y7ZnhYc6JYbFNYXDMYR/DVYOAsmfc7SHHfGb+j5U3
	j7Hec72e+q+7J39t+IGNX/A==
X-Google-Smtp-Source: AGHT+IGoR0yoC9myMkoF0rgaolY05/kfvKBGhWLPHaRfhVOAZcjekosrdfYg+pqRVBmeDx2+U3UV+w==
X-Received: by 2002:a17:902:ea0f:b0:22e:72fe:5f9c with SMTP id d9443c01a7336-231d454daabmr327119345ad.42.1747920456051;
        Thu, 22 May 2025 06:27:36 -0700 (PDT)
Received: from ?IPV6:2601:644:8500:5dd0:864b:f5ff:fe5c:59a5? ([2601:644:8500:5dd0:864b:f5ff:fe5c:59a5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4adba78sm108376655ad.65.2025.05.22.06.27.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 06:27:35 -0700 (PDT)
Message-ID: <db93019f-0a57-4b1d-95a6-ed5a6ab9a989@gmail.com>
Date: Thu, 22 May 2025 06:27:32 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm: Fix rustgcc unknown argument '-mno-fdpic'
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, torvalds@linux-foundation.org,
 Ben Wolsieffer <ben.wolsieffer@hefring.com>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Christian Schrrefl <chrisi.schrefl@gmail.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, Ard Biesheuvel <ardb@kernel.org>,
 anders.roxell@linaro.org, arnd@arndb.de, dan.carpenter@linaro.org,
 laura.nao@collabora.com, lkft-triage@lists.linaro.org,
 regressions@lists.linux.dev, Nick Clifton <nickc@redhat.com>,
 Richard Earnshaw <richard.earnshaw@arm.com>,
 Ramana Radhakrishnan <ramanara@nvidia.com>,
 Linux Kernel Functional Testing <lkft@linaro.org>
References: <20250522-rust-mno-fdpic-arm-fix-v2-1-a6f691d9c198@gmail.com>
 <CANiq72mh1h8d-EWrZef=BPPtadZyHG0B+tg9GgA_RnWiETWMkA@mail.gmail.com>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <CANiq72mh1h8d-EWrZef=BPPtadZyHG0B+tg9GgA_RnWiETWMkA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> Thanks for sending a v2! I was going to fix it myself, but this is
> even better :)
>
> By the way, submitting a patch typically requires / generally implies
> that you actually tested it, so your own Tested-by is usually not
> provided.

Thanks! :D Happy to send in a v3 if needed


Rudraksha

>
> Cheers,
> Miguel
