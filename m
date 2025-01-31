Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E880844C77;
	Fri, 31 Jan 2025 16:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738340163; cv=none; b=auO+dwkj2BHVXgpQMk+IKz9jjsuswgR47L5py4eyGpn+g1+7RV4dJHqtBXYqvxYaAYI+TxPlyptluxzkYJAfsWLNpm9CxhckOgVb2E733M5iSHI9HNHwNie2XKWJruEksEtAsLxtazcqIXxkLlskVl5EvrAuZkU+hiobZvbGxUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738340163; c=relaxed/simple;
	bh=y3izz4GujqkaDj4Ga9/pG5hwcw9qc82F7AGF9o98TgI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=r4ebtnmYsMo8Go2mgPZCrsw2+wzgH7KmJlXa+kPe0wiFTfIZF52tphC4gWAMCE+n/N0G72JTloPYckSPYor6q5LX4WlUM5AozEUcySkVu2CGoQeWfcrF8UXoOG9Rlwj1x1KGFl+Sik+x/m3HDiztJngsN+ryq6ttpKgKrYVMSCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EhK1XwkH; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EhK1XwkH"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2165448243fso32923795ad.1;
        Fri, 31 Jan 2025 08:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738340161; x=1738944961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hO25OJFQO7QJKD0qxwtCj6juMvhQ6pC6MGM/o4lV92k=;
        b=EhK1XwkHzXlnBSMsr1h5XMF3CbjKYZ93muGfVEkDRoMmQ0vNYel1ZVHdZx4E6nizs7
         VT6Xvt9P1ctiMcRLaf7j9BiVTn+jPYjV0TT8DaIHoKthqbghapwNgKNNtOSDWkr/Vg15
         rQSyBXhAFquMDT3brze8P0lTi3a/c9ocmefW1uTjSR54dUiO7hjAI9jElIrsVjK/GX58
         sM1S5Iexgq57b3hWxHPEFKiZjnNbJcrNqhJWFcr18Rm1bd+n1xEoiG5xvSzQhgNV6+3r
         AkHN5BkBycovlDv/apZqiAGQmOCp959pvzMxGnxfeT1Eicg5MXCD2wn+Pmrlja5MfuJ3
         iMbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738340161; x=1738944961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hO25OJFQO7QJKD0qxwtCj6juMvhQ6pC6MGM/o4lV92k=;
        b=EQIlMwiaHcMq1/Bp5jOCfgug4/FWiz81khRkz+ITzDcZXXSlvk/PwAi83qac9vDyQG
         jMnDWPmizYPziC7bMTQJII6MGg6AT4sF6SPhQSiJ+GLChj9fZ3zzDfNmFxVHIJ3Y8qlg
         1mg4iStdTh1FVQH174aLp+T3QMEemfpLLUa5UoKehsJVNKKglZdHa7hIwOQUl1jjSXeK
         fStalEfrPnxwRBVJH83Kv/NbWCPql0s9es8fMrnlHn9bU3DcRuxH4q63qa++WM86itDD
         X50xdwpdXefn3z9E1C+89CudtYwXma13U5bS9h9/CwGEFjYxacUeMZmJo42HOs9S3qns
         ewVQ==
X-Forwarded-Encrypted: i=1; AJvYcCX53AzdnWFEAQ0Jaq0P+lQN4Wv/FtXY4sFkZ8Lq3TG+hWHOYzs6SpxtQLB7jygVU1jDl+An/h9qMsHp8EU=@vger.kernel.org, AJvYcCXWp3FZjrn37Q6m0kqmM8r8ODC0MXDnEhXZV52RobT5SePbnF5WX0kfZR6pmx3Jh3/aFDqgctHLHKqYGby6Ibc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFTqRxrhs1BWdImin6jFBDGelpxGEU0tae3VBl13g8mShUE/hu
	nMJpVYU65CwlNjh2FMy9Tz50o/yMAEqMtrtvVgg5sxSB5rKw2dzz
X-Gm-Gg: ASbGncufv0our7teZA1n253UC5k60ujkKbjxrGNlVHYn53YnwmkRlqFgR7HExl/DiaY
	xpfXZlrQbr4IoGIA5tQU4MLsZ7sJPsvthQ9bLxe5xjGSLg48Wgyc+y5izVbac3g62XL72pFa2/8
	rIPJK6GT9703zsQXaKssshZs48ws8CuIlnXx9QZVzUzNDb7e8R0ccMNEncsSmMYfVI5VpWDzqpy
	xq/Wsb9IK9Q4DDERKICa5frdI1iVpf8+f9N2LgBUpy90t80UvUCg+d4ttuBy3qx4Wl+ECyeKKok
	00iv2v+BNAMNaROmClP6nWVM
X-Google-Smtp-Source: AGHT+IEN/8ESaIYuE099kOBtAsC3hJDkdZrBnuRrYMQI8amgSIjmJiDSI514FC0Qymisd0w3orwGbw==
X-Received: by 2002:a05:6a21:78c:b0:1e1:9b77:e237 with SMTP id adf61e73a8af0-1ed7a61d020mr20065600637.40.1738340160957;
        Fri, 31 Jan 2025 08:16:00 -0800 (PST)
Received: from linuxsimoes.. ([187.120.154.251])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69ba4b8sm3512253b3a.93.2025.01.31.08.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 08:16:00 -0800 (PST)
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
Subject: Re: [PATCH] rust: sync: create the `get_mut()` function
Date: Fri, 31 Jan 2025 13:15:49 -0300
Message-Id: <20250131161549.306073-1-trintaeoitogc@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAH5fLgjM4SUEmhW334w_o0Zfv3mUZ76Nz4GnE0H7N0Y=e+G5AQ@mail.gmail.com>
References: <CAH5fLgjM4SUEmhW334w_o0Zfv3mUZ76Nz4GnE0H7N0Y=e+G5AQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Alice Ryhl <aliceryhl@google.com> wrotes:
> As far as I can tell, it's impossible to call this function because
> you cannot obtain a bare mutable reference to a pinned value.
So, I can call this function make anything like: 

```
use kernel::sync::{new_mutex, Mutex};

struct Inner {
    a: u32,
}

#[pin_data]
struct Example {
    #[pin]
    d: Mutex<Inner>,
}

impl Example {
    fn new() -> impl PinInit<Self> {
        pin_init!(Self {
            // This new_mutex! can be anothers locks like new_spinlock!()
            d <- new_mutex!(Inner { a: 20 })
        })
    }
}

let mut pin = KBox::pin_init(Example::new(), GFP_KERNEL)?;
let mut_pin = pin.as_mut();

let data = unsafe { Pin::get_unchecked_mut(mut_pin).d.get_mut() };
assert_eq!(data.a, 20);
```

Thanks,
Guilherme
