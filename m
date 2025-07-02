Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23ED223B63E;
	Wed,  2 Jul 2025 09:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751447381; cv=none; b=sEXj1qiztRF0OjN8Od+WXCCJ9hCMi00UNkhnbcSrx0nRoSELzcBrbK/OwqwwYZsWdyI8u0hXJX87Cn22dbxiRNrM8a/d5dvgm2FeUODmM5wNOC8gmPytOQY7r+1Vi0lKsAYY2Pac64sfnFHwqZJT8ejmLN9KW8m2vN79HGepvQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751447381; c=relaxed/simple;
	bh=0H4VRNhn1R1ZPAMSoJAocfaIlIuamu13v6O6ErSefU4=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=VuEP+8UKSe1DO03o8a6rDn5GAu6JrxyprfRoJz/1D/zwAxuT4QeT3VaNCqcscMQfcqE+1nSoQ29PiizDo9YEyJbNv5qYWxRtNRAg//RdCn+ebcw6/3AfwkPaSgM0tuMTT9OJ3s+xeMBttOQX/h1dyy+3OVyKFjLPReddT3+ALEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ji7PweCC; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ji7PweCC"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-747c2cc3419so6206713b3a.2;
        Wed, 02 Jul 2025 02:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751447378; x=1752052178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gGDtUarx9LAAEB5xju/1XolQrw0biFVaUKA480eEFPQ=;
        b=Ji7PweCC9hDqw5WJamM2MbJvvTOKcO6Rjepk5Q2vM5QdQU8NkpWRcTT/CSsGN4z1Vz
         f3g2W/mom/ra4t9sFk5StywZjw9PZsAqGMT5OyE34SkyaeuAz2OEwodqlC9H7OG7/EtH
         DPUC/aJUvhc9iH3ygIsCABMwjJ1Z0N9JVkReRO7Xxor0UwA7EBhX9CZIAv2tpfJfw/8x
         lDxbwQ/D5F1y73jhp2W7HjZxYYa6sKPp3vvP4xhMPWpBQrnEdM1TtsSAANoC4ge80Jgx
         12vYKyYIdTQeZ+QVdJ6boTZeMDVT/USW+YpaG/sqH7uGxAT4yYBTU7AFbpQuxy1BhDSo
         XZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751447378; x=1752052178;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gGDtUarx9LAAEB5xju/1XolQrw0biFVaUKA480eEFPQ=;
        b=LWSMf+mGqXR9YYo+rCovkqXQmVvWRPONHPZ+SgtCxEUsDUiNoU5ASyNSPWBzMaGi4Z
         ZtBR9/CljSNTf5LRqQh9mc2oqYKqKyA97ntTwA1kIVbh17krZE0Dw38+pp8ZA/TFd6ZR
         hURhdc4Oy/zl5aGlTb6YY03qRPgBn+QE1wt/x2GmYpnVW0fl5TEtA3daws88mkFo9pSl
         JcVf2hPup+37zMlJGjXd3p94+daa/0r2MDwAt6qLCZS0abqbJdomOlWsyN+S29j7qn7B
         U7hy88SQ6iJ0pzgAKaM48k1njxihxckY1gk+CzMKrhKnVTOs4Et2lYYXky6RkfO+cooI
         4S3g==
X-Forwarded-Encrypted: i=1; AJvYcCXFYnRfZN0jotMOb6tP41dZWtCPaZgaaqoCAZP1KgYVM/pW+TlilcvjDZEoXR4i5BqEkBSn4BTnd/vRy5iui3Y=@vger.kernel.org, AJvYcCXheHhHibgmlSwI/AdcLBqovMBmrdqb6L3s6x0s7+72hO70UuoYo1Ag+fB+f+ctcyxbZ4U0lGitSNVwKlw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCZb8Xfxny8zTx7yqf8TJmkGv7vMyvQU3LscG6Usw+kTrjcLJH
	5QSSB2TcqR800WWrTxPrtQ+Jxwf80r+M/TiNcebeMto/BWM4WftmIh4S
X-Gm-Gg: ASbGncv1kXQ+En4XpwGHaBr9Wu6OBr/Az5Bb6EdSAiuNcgD847Ve7B6wahRwewdEl/M
	kuIV+xGQGuQYcrbj+SopADN57wb1C5b1b+cPe/1hA91DKgObFZKCdxBRl8q+wiqhVFsEeBeGXk6
	GOzl/cd8cXoC3JE/nPp1Imnjzdor22DKx4qKGLUfaUDotCBYwJfRUdAqYwlLjkkQ7PHkZJFQd/x
	iyV4G4yGv859DnHrLh1bQYk4vigWm1owDIx6iBB6JzZxN2ve9FuUSWDppsE/JmSLtxhewkVD/IG
	IH2/ctWazdFN8wI8DTzuQCLaLrUHAhC7N/TlCRFhbCuHVqZEgX//6BY+i0l0B2+lgj9DZLB3OXr
	AGFQNsUrf0nXL6sxDB+0Mx1c/vBS0h+xF4TaUF62Y
X-Google-Smtp-Source: AGHT+IEsBSMK5TYD/oqHlzADGgv8Ty8PRAvsgXvC9q6zY+nAsV0h5SDcPLVnAAh2GJhANxgklQE9hQ==
X-Received: by 2002:a05:6a20:3ca3:b0:220:9545:2c96 with SMTP id adf61e73a8af0-222d7dbae47mr4015764637.1.1751447378212;
        Wed, 02 Jul 2025 02:09:38 -0700 (PDT)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e3200874sm12296530a12.69.2025.07.02.02.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:09:37 -0700 (PDT)
Date: Wed, 02 Jul 2025 18:09:22 +0900 (JST)
Message-Id: <20250702.180922.1185854079687770335.fujita.tomonori@gmail.com>
To: a.hindborg@kernel.org, ojeda@kernel.org
Cc: fujita.tomonori@gmail.com, alex.gaynor@gmail.com, aliceryhl@google.com,
 anna-maria@linutronix.de, bjorn3_gh@protonmail.com, boqun.feng@gmail.com,
 dakr@kernel.org, frederic@kernel.org, gary@garyguo.net,
 jstultz@google.com, linux-kernel@vger.kernel.org, lossin@kernel.org,
 lyude@redhat.com, rust-for-linux@vger.kernel.org, sboyd@kernel.org,
 tglx@linutronix.de, tmgross@umich.edu
Subject: Re: [PATCH v1] rust: time: Add examples with doctest for Delta
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <874ivvvvjw.fsf@kernel.org>
References: <kyrCsGDYN5QdXPkUe4OxMxU2UzHfJ-vH5z643gA-_KFJIaew0duyMXU0yfTrGN5ZCNaecP8Yu2kIXKXMoWS2lA==@protonmail.internalid>
	<20250701001809.496389-1-fujita.tomonori@gmail.com>
	<874ivvvvjw.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Wed, 02 Jul 2025 10:36:19 +0200
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> "FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:
> 
>> Add examples with doctest for Delta methods and associated
>> functions. These examples explicitly test overflow and saturation
>> behavior.
>>
>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>> ---
>>  rust/kernel/time.rs | 67 +++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 67 insertions(+)
>>
>> diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
>> index 64c8dcf548d6..c6322275115a 100644
>> --- a/rust/kernel/time.rs
>> +++ b/rust/kernel/time.rs
>> @@ -228,11 +228,34 @@ impl Delta {
>>      /// A span of time equal to zero.
>>      pub const ZERO: Self = Self { nanos: 0 };
>>
>> +    /// Create a new [`Delta`] from a number of nanoseconds.
>> +    ///
>> +    /// The `nanos` can range from [`i64::MIN`] to [`i64::MAX`].
>> +    #[inline]
>> +    pub const fn from_nanos(nanos: i64) -> Self {
>> +        Self { nanos }
>> +    }
>> +
>>      /// Create a new [`Delta`] from a number of microseconds.
>>      ///
>>      /// The `micros` can range from -9_223_372_036_854_775 to 9_223_372_036_854_775.
>>      /// If `micros` is outside this range, `i64::MIN` is used for negative values,
>>      /// and `i64::MAX` is used for positive values due to saturation.
>> +    ///
>> +    /// # Examples
>> +    ///
>> +    /// ```
>> +    /// let delta = kernel::time::Delta::from_micros(5);
>> +    /// assert_eq!(delta.as_nanos(), 5_000);
>> +    /// let delta = kernel::time::Delta::from_micros(9_223_372_036_854_775);
>> +    /// assert_eq!(delta.as_nanos(), 9_223_372_036_854_775_000);
>> +    /// let delta = kernel::time::Delta::from_micros(9_223_372_036_854_776);
>> +    /// assert_eq!(delta.as_nanos(), i64::MAX);
>> +    /// let delta = kernel::time::Delta::from_micros(-9_223_372_036_854_775);
>> +    /// assert_eq!(delta.as_nanos(), -9_223_372_036_854_775_000);
>> +    /// let delta = kernel::time::Delta::from_micros(-9_223_372_036_854_776);
>> +    /// assert_eq!(delta.as_nanos(), i64::MIN);
>> +    /// ```
> 
> 
> I think this kind of test would be better suited for the new `#[test]`
> macro. Would you agree?

I think that Miguel suggested adding examples but either is fine by me:

https://lore.kernel.org/lkml/CANiq72kiTwpcH6S0XaTEBnLxqyJ6EDVLoZPi9X+MWkanK5wq=w@mail.gmail.com/

