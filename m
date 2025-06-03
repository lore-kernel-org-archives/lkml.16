Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217CA238C2D;
	Tue,  3 Jun 2025 13:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748958721; cv=none; b=MH8zoN+qU8UgAoza1XkwDHs0qOL+8ii2nmnx7svdgVyeNy8npBnb1qG4eHwO5nbc/abH3vQ++gf4lGZK7gICUo4qAG2lMVvZqa/mV9uC+EcJESvuJSNZD6q8+H2OOzS38EDXIsB98N5NHffLcdUlqY4ChkaxGZxxvazroaQXx+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748958721; c=relaxed/simple;
	bh=NXR1qTYe4S1yY/IRghcXhwqMURAdPna2jLsb3ojL4VY=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=L4tk/uo+Z85/E/0QpWq8px4rg3ZImQ9DLJt+ey00KHKo1+bfMt6a+2iG/fwqCA/7FsaEcjSlz+lM2Mo+v4f6xf5R8DGA+yr7egvGb0FP40UaPI57Lq5H1hJVozos7fdNA8+KzfSKkh5ewUtExXvi0SPIcxtcqbyEYa91tEQ+0jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SWsQZrT7; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SWsQZrT7"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-234ade5a819so50069785ad.1;
        Tue, 03 Jun 2025 06:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748958719; x=1749563519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6KhjbOMj7kQ7BxqljTrV8nKS4Gy6cQNvf7i0KC2fdKA=;
        b=SWsQZrT7cI5e1fejMQiDbN/eN94qknWaQTMwSyA1T/nfCl7ASXVEAvh01tjylLdx5t
         y1kRZHgeMdTngQqMgTUfA5nwWbsSh8tknnMFgkMKQgSqtGMDaQqW1m/cqy1F1oqmY4DP
         EvDohatubhL8ng32HJ6XI4qdUZuwinYVoqAXc1jnLR+ZBj9uAbl8ALxUHXol0CXTNt05
         WwYYC93h0iQFCSpMliFYX6TKVDCx2Tvh3bV9pA1kGoHWPuCmwcGqG9pvFclZC/UiYB/N
         JcSElzzYrpgqcuUyGKghBy+MjzvLIMXDWc4+IO9cbKFIBInUn/D0soNG66Z4HW3yCqq9
         2JDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748958719; x=1749563519;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6KhjbOMj7kQ7BxqljTrV8nKS4Gy6cQNvf7i0KC2fdKA=;
        b=Qc0q4rWewfmwkou7b5x+bOd+J2qi9jKZH004RwcoftCiN/6++VR4Frrx7K8AaoxtZj
         2TZnAay0xZl0xg4SaZ9GEhNCsech9Y3HZTyoS5SQNyPLt638LMsPDF18+Kj154987Uz5
         /P+/ejhKts1pjX2e+KDwG33Km1h0C9mPaY5LgYE0FmnH+GBq/zPWFylvxSZI5P00HJGJ
         MMlUE6Mrs5RdFpYjdc3dlnoR1S5kRnXvin+0eF6xMamWaG4064VuuwudPmRiCvIMjkgM
         RI+8DbgX/EJle3hCq8/0n+EpLfxOcbF9Pol+XGTEA/CC6dGGeW9Aj6mzaZOiAI3NRQzv
         dHUA==
X-Forwarded-Encrypted: i=1; AJvYcCWUgttfwtSxZO9T5gNka0nCdSOJsMzTykauZ+ii24+jz6K018F3Xbx7+3WjtG+B8yb/a95TS8Day+S0o9s=@vger.kernel.org, AJvYcCXYVxJ6gR1d7BTcB8sSUZoOAYhIZIKL6W5fuTfvkiFI4ojRW8BW2r8FUi8Dlra6/JavDy6VmErKyxX+p63fuPE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0wE6Sp9hJymDpzxK/+JXJMRIUY/bfLFfTxs8qwXNjuAYJgtxq
	Izgrt0W8czxGSXN0IZMqVjtcSMGv1I+VMRFXP45uuSdZP55WW44/Yg1Do5khfywJ
X-Gm-Gg: ASbGncssXnK68B8zNHWdVux4WxTSOkkG8OAzqqUNf1b09ClrHtwc/T9onr0thGdHEA3
	eJic/O5UnVZzyi/jxzxxcTwu+yrtRFJ2kVXDRoQVH9STAhOWxNiV40mcrcHNm56g/hERrjvPiux
	ggV8Alqnc/DoHVpAXrrdkR1N8YX8QYdlpYHzgPoxf7gNo7Weyx0YTwERrGDU/3xnUjvoR7+RRau
	V1pxRqPl0GMK62gFiev1ypG44tEIQvoA4nBZ0vLu79ZxOa63vsQ4iJqLrgc5W6kbWX26+omWUk0
	wtRY4quiOBT+zLfzpSpklwb2qV/DWldsud38W3pu6EwjHsg/evln/blPU0z/vOw2TZm2FsturMe
	tQV0Xpn6ZbSMUZMIqjiA/FFvnik+Qya/OL/jTW/vg0gv6
X-Google-Smtp-Source: AGHT+IHyD5KvbTYxjb3ruO/fAO6V7egBmvMC4zHEr5ErXMQ0i/jDrOv7HitdHOg5MddXssBDcDFYKg==
X-Received: by 2002:a17:902:e5d2:b0:235:779:edfa with SMTP id d9443c01a7336-2355f74fdafmr189779655ad.32.1748958719228;
        Tue, 03 Jun 2025 06:51:59 -0700 (PDT)
Received: from localhost (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506d19c88sm87192855ad.247.2025.06.03.06.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:51:58 -0700 (PDT)
Date: Tue, 03 Jun 2025 22:51:43 +0900 (JST)
Message-Id: <20250603.225143.1147206358060510971.fujita.tomonori@gmail.com>
To: a.hindborg@kernel.org
Cc: fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org,
 boqun.feng@gmail.com, frederic@kernel.org, lyude@redhat.com,
 tglx@linutronix.de, anna-maria@linutronix.de, jstultz@google.com,
 sboyd@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/5] rust: time: Add HrTimerExpires trait
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <87ecw61c8v.fsf@kernel.org>
References: <20250504045959.238068-1-fujita.tomonori@gmail.com>
	<20250504045959.238068-4-fujita.tomonori@gmail.com>
	<87ecw61c8v.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Fri, 30 May 2025 15:04:00 +0200
Andreas Hindborg <a.hindborg@kernel.org> wrote:

>> +/// Defines a new `HrTimerMode` implementation with a given expiration type and C mode.
>> +#[doc(hidden)]
>> +macro_rules! define_hrtimer_mode {
>> +    (
>> +        $(#[$meta:meta])*
>> +        $vis:vis struct $name:ident<$clock:ident> {
>> +            c = $mode:ident,
>> +            expires = $expires:ty
>> +        }
>> +    ) => {
>> +        $(#[$meta])*
>> +        $vis struct $name<$clock: $crate::time::ClockSource>(
>> +            ::core::marker::PhantomData<$clock>
>> +        );
> 
> I think a macro is too much here. The code would be easier to read
> without the macro, and the macro does not remove much code here.
> 
> Could you try to do the trait implementations without the macro?

Something like the following, right? If so, I'll do in the next
version. I'm also fine with that way.

/// Timer that expires at a fixed point in time.
pub struct AbsoluteMode<C: ClockSource>(PhantomData<C>);

impl<C: ClockSource> HrTimerMode for AbsoluteMode<C> {
    const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_ABS;

    type Clock = C;
    type Expires = Instant<C>;
}

instead of

define_hrtimer_mode! {
    /// Timer that expires at a fixed point in time.
    pub struct AbsoluteMode<C> {
        c = HRTIMER_MODE_ABS,
        expires = Instant<C>
    }
}
