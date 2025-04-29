Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D510520F066;
	Tue, 29 Apr 2025 12:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745928666; cv=none; b=jHlWfzU4RIHADbFAn0xANc8y4cFjS64HJl8nQyPgE+iqpqGqvmf8im5GK9pgTyFUpIE7z7BLZWCsy6RZBKGXJcHEL0aNalnphZRZJX5LLVf67HomseLAzXmJD6qP8jUc2/K9P2IdsdF+9sTsAaqTy50MxSZqvbHCzgEYc1qkloY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745928666; c=relaxed/simple;
	bh=yNEyqYG3GckGSFFv6aBQ4pUR10hoGY2aFo1t828Mwi8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IE8+IUySAmbKoA2wpjMlkH5PyWTiFUQXCOB+vV4PP9cMkD++sxpV18v6eSaaDPj2tzkHG3U2x5uYHPvW0YTi1Oa9YU8LmD79cX2YpbSS5y6B6G9zygF31RONQg50vCQBk7pQ2LjoiTIBNmUExMY3lIAhwcEwXy37quDhdU/inBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gL83D+qR; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gL83D+qR"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-225887c7265so11087065ad.0;
        Tue, 29 Apr 2025 05:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745928664; x=1746533464; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=20qeUKkaMbvWbqATJAd/aBKlKoQKEizD0yoS5BHg7sc=;
        b=gL83D+qRW++SeL3lPMA6LQ5XlcABHOkWidrzfB2AS1a3q9+j5+DdMEuwcr6E+AO5N2
         AzM3fQtHY2ySi4G9Z52AEeaNZhDutSa4FjJvM2jng9QDD/fCLaK4sR2j/NEBsCi60kkU
         i1ihTO/bTTrFED41bvowrFWdcgoJGlHZrYixjhfxdNLpBd0FRhO6K1hc/5zZ+j1qQoRT
         GgS1AwnUlfM2g0LPdw1aqs5MQtqH9F2Ph1CnHYIk17CkT+Am4Ikim4uXQvY3QvpxK0r3
         PI5VBG36ovsNxgNmMlxEiW6lFk9DCxoZRLDJB7m4DlJuej380fomhDBGXsdr5avSZWC5
         xXAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745928664; x=1746533464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=20qeUKkaMbvWbqATJAd/aBKlKoQKEizD0yoS5BHg7sc=;
        b=CTEtsteT28Kc86z5g0INQH76RqUgWW0G8QJRjzbN2DPWIjWS7VzYdhSjW0NFbqPsNy
         FeX3Xp+Uu8ZJWGD97SH69axjioE1JkC+r3N7IVyhayW73R9EDfWSZPpkH41q9oygKFqL
         kn7kVYwV/HXCkcMgJk2n+rqY4jKTTKE0djcG2BjxY2Pso9pu1Q/gmqWxjoWFNilAaIwH
         ciKN0SzFEIsp6XRuRdkAY3YAU89uguq/GP+QuZC2L9l7XrDls/XdIPep+QXOf3CRpafu
         TgSV7oFrBrp2fUR3Z9vqwBGlcfO3ZZxNIZCIry7x7JNlZmoLpwr/bxEk4/KpXZJjSwKJ
         XTBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUE4Dbbfnfx9wYnmervN7kJ/8HFcD2cFY7+pgbalrKE9TvC17vF3IYc+SQ0kHOriAvO4p6egD9pneOAMbY=@vger.kernel.org, AJvYcCVLm+sjteRQI4mvRWqem2BV/gqSv20fMp4XNGGapRX3VV6kbg7LdvhY//v8WkCBRsIUL53neL5o0iRGMxCLvnA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf/HeCB7xTEFy5Y7mZWjdfUjd2jGN3YmwVDAX/D0yjRWZGbzoW
	mVZ4AGzPckRSpVfEER4B6y8Hy5MI2zUKjTbI62jHcRHcv2t2wQ8+j+oElLS0O/yVwow88Ci2t1/
	J/1grAVf6mSJ5yX6RU0fO7HZNSm0=
X-Gm-Gg: ASbGncs/go273TW/EqwNnTfrrFgD84K4/R0Z7vb+odzDQxT2ZR3Lid9Hz8jZ8V4QpN8
	qyw5O9wuoWsjsFeiju/+OhC2By/XsrximLFcD2uuD+Q/pDsTmBGPiUPYeJ2XRG91ex3Fp8Hb8m8
	QTVFEZDOVEHCvPsuUpuyjHXg==
X-Google-Smtp-Source: AGHT+IFnZkMiz7gm785M26PmoO1U++D0GLVdIxG/BJXcTd15QPowgI2xJoKOCOrCVFa6pMFdGyp9GSVgsdVND+88ARw=
X-Received: by 2002:a17:903:2a88:b0:223:28a8:610b with SMTP id
 d9443c01a7336-22dbf740e51mr84157215ad.14.1745928663902; Tue, 29 Apr 2025
 05:11:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-rust-of-populate-v2-1-0ad329d121c5@beagleboard.org>
In-Reply-To: <20250429-rust-of-populate-v2-1-0ad329d121c5@beagleboard.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 29 Apr 2025 14:10:51 +0200
X-Gm-Features: ATxdqUFSP3hAwaq7OiNlYETkDcEGRBn-sNeCxUzPcMDK7fwPyqS4nAob7jv1aw0
Message-ID: <CANiq72nkPW3oG8bzxV_=dqNFTDAiMr+viRE9ttG8P1d3Ug7vzg@mail.gmail.com>
Subject: Re: [PATCH v2] rust: kernel: device: Add devm_of_platform_populate/depopulate
To: Ayush Singh <ayush@beagleboard.org>
Cc: Jason Kridner <jkridner@beagleboard.org>, Deepak Khatri <lorforlinux@beagleboard.org>, 
	Robert Nelson <robertcnelson@beagleboard.org>, Dhruva Gole <d-gole@ti.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 1:41=E2=80=AFPM Ayush Singh <ayush@beagleboard.org>=
 wrote:
>
> +    /// Populate platform_devices from device tree data
> +    pub fn devm_of_platform_populate(&self) -> crate::error::Result<()> =
{
> +        // SAFETY: self is valid bound Device reference

If you import the prelude, then you could use just `Result`. Also,
please try to follow the style of the rest of the code, e.g. use
Markdown in both comments and documentation and finish sentences with
a period.

Thanks!

Cheers,
Miguel
