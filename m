Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532DE634;
	Thu, 19 Jun 2025 00:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750292904; cv=none; b=qkHpOAEYXoCyIXnTwuN6jnHDKZJ/wTxz/mN5/dDOUYewWv39s33Hul9JfPJpN/+DlHzRfSpdFx/2ya8ooeHr9gvpyTgBmuE2ha6T8On/1i+2jIvwDxMzb7LgxghudYSzdQ22G3Txn4CLqYh/0JZp9g90LCkQYXzvLnQiW2XNvvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750292904; c=relaxed/simple;
	bh=KtXqC96KufQRLYIs/T5e/VVYnSU6wTb08NWDK0ptBmI=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=EC+sGsmxxi8vn9JknXqjlUiUmhbXEbVqEMECbFz1K9X7mjiBu1FH7WOrDKNsPt1YSysGIG/QQcXXJoPhSrBDGAP+jzT+r+a7RJ5Zhl4IS1v0S3kFIm2TifHUKOyrTKRz+RlqsDs7mWpyIIOl4Iwx55Pb8mIAI74GOaE7AZV53LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iGmyOPDT; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iGmyOPDT"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-748da522e79so111214b3a.1;
        Wed, 18 Jun 2025 17:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750292902; x=1750897702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xBNn1ZwX5lBITz0U2pqk9RXsZgVfNijNLXMYRIMOiFY=;
        b=iGmyOPDT6gt7pTxX30mIZHd9ZUd51BsOBRMrnbGVu8lTJABaV/P4Ozm1MMozLSl8gS
         fNXQ2IzbZQ5g9iiDYv6zGWJwEGg7+DQDUYXwcrAU7AhAK+sl/Kj8rzl/QVKVQ8Pso5UY
         9Z24TJWYK4A9Ks7VEs81Ua32sihWbhpVaZy90EOO4G3smEtbjddgkkxB10IwQFpro+RG
         nO44HwfMy1w96asxBPEiL0OpERWGLOJ/machGB3sbpMKV8ejpw12icsEEMoBmubXK7Qw
         6UD7T0vJfRNiTfcKIYp15jfho9NTK1QuM0dPAwnw4SUb8c3fxJcFbpu5veJOtSIXl8fg
         AjDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750292902; x=1750897702;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xBNn1ZwX5lBITz0U2pqk9RXsZgVfNijNLXMYRIMOiFY=;
        b=VjDuefgsK3NmsUcWSu7K96mdVBgmUUfRX7ADQihyfIWO0KLQkq93+Yec4XKz0CYWvz
         P1Ey+Mq6vySyb/oe0SZS3oyi1cVUpQBJQKmwWupSrfXhEaW3b9BgPHizDdZs2EI0vbei
         lK2LNc0cHM21shkm0yYJhS8O387NrFIGEq29ethjs0cLddrlbCDwblD+a9xs+ucJpNKg
         zRano4jrFslqpVHno1XY/Y05wcz2qkbCK/PmfMJ1LE/Zw2UaHH4l3RL+Fy7MdiGpclDd
         Zyysr8gk0Vtmh9Kmet5ToCYf5UrM3RYe2d3Q/tM6Cum3DoqiIVjhLbmcbwMwZQ63jrmv
         tZeg==
X-Forwarded-Encrypted: i=1; AJvYcCWxf1+Qvg1aMd1xjZY6yKbf+0mlriGvcbDGXaxZo09xZ+0sQqo8HzV+gZPH5qOemFL3Eop/gqj+DXoJ8cc=@vger.kernel.org, AJvYcCXNbaRVyAdtCp9/Wylv7k48z4be8gJdxB4RzfiwCcbkAvZJvfVdcnKz6ExMzE0VWP8SB1Q/K1gZUGBe+5dg3VQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWs81ADQyCeodXEQTtHXoPB1VaCd2C8FgjpQBZggeof1XOLFh7
	IJQqa9p0oZS9xstd7e+ajI/avTXoanWeqLgMyhz7NSXqtaf9mx3kBUb8
X-Gm-Gg: ASbGncsWFnYsuj4FoJELsKnSuiyUaSrJqJtS5uOZ2974Y9S1ClZHSYxKvBZuwSRqYvp
	tc7v/TVnNZSJ0sVxwNpmwF9fHU2A7sYrrDTp8KhMkey9kzdofFerTdfQBy0Ua/+rXBTLJ3+6vci
	JxQOK0cYOTCpoW+HsPRO/aMCb1hP/PgbD5RYSWmB06X3NVSWRvTWNJWQ/5Qfye8A5B+HCwyRgFo
	bhp97MTmcMaR2BJauTuEDVdXDKxiUDfotvuY+qBlY4M8eviQGcaey8IqOZUOdKi274MNW8634//
	yy76Kq3mNkVWYZi4q6syWpesPw8yhiZbOvc3EatQLRKK3pbAfmyd4YEaXcDPQaAEe5giM1ntXrP
	322ExQDeeIM4v8CwkOVW96FzQwpMKC4Wg63+0OUogHTLIahNuAw4=
X-Google-Smtp-Source: AGHT+IHG/W8QGalwUgPhpoKvQ12ryvSeTDCWtpobYi1br7xjqhqpHAmEO1/fzsSHw9f6YTTA7oQiMA==
X-Received: by 2002:a05:6a20:a123:b0:217:4f95:6a51 with SMTP id adf61e73a8af0-21fbd7af798mr30051859637.29.1750292902507;
        Wed, 18 Jun 2025 17:28:22 -0700 (PDT)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74890083324sm11763024b3a.88.2025.06.18.17.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 17:28:22 -0700 (PDT)
Date: Thu, 19 Jun 2025 09:28:16 +0900 (JST)
Message-Id: <20250619.092816.1768105017126251956.fujita.tomonori@gmail.com>
To: a.hindborg@kernel.org
Cc: boqun.feng@gmail.com, fujita.tomonori@gmail.com, alex.gaynor@gmail.com,
 ojeda@kernel.org, aliceryhl@google.com, anna-maria@linutronix.de,
 bjorn3_gh@protonmail.com, dakr@kernel.org, frederic@kernel.org,
 gary@garyguo.net, jstultz@google.com, linux-kernel@vger.kernel.org,
 lossin@kernel.org, lyude@redhat.com, rust-for-linux@vger.kernel.org,
 sboyd@kernel.org, tglx@linutronix.de, tmgross@umich.edu
Subject: Re: [PATCH] rust: time: Seal the ClockSource trait
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <87tt4c983g.fsf@kernel.org>
References: <aFENRtYZixePYn0XFOGCbNOkSV9338iV4jWk8XJYKI0crpf4QniT_GyZCmFuqmsKs5Cl64z8qlIK6aVfdTBjbA==@protonmail.internalid>
	<aFJINI8ImfxMnvrx@Mac.home>
	<87tt4c983g.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Wed, 18 Jun 2025 21:13:07 +0200
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> "Boqun Feng" <boqun.feng@gmail.com> writes:
> 
>> On Tue, Jun 17, 2025 at 05:10:42PM -0700, Boqun Feng wrote:
>>> On Wed, Jun 18, 2025 at 08:20:53AM +0900, FUJITA Tomonori wrote:
>>> > Prevent downstream crates or drivers from implementing `ClockSource`
>>> > for arbitrary types, which could otherwise leads to unsupported
>>> > behavior.
>>> >
>>>
>>> Hmm.. I don't think other impl of `ClockSource` is a problem, IIUC, as
>>> long as the ktime_get() can return a value in [0, i64::MAX). Also this
>>> means ClockSource should be an `unsafe` trait, because the correct
>>> implementaion relies on ktime_get() returns the correct value. This is
>>> needed even if you sealed ClockSource trait.
>>>
>>> Could you drop this and fix that the ClockSource trait instead? Thanks!
>>>
>>
>> For example:
>>
>>     /// Trait for clock sources.
>>     ///
>>     /// ...
>>     /// # Safety
>>     ///
>>     /// Implementers must ensure `ktime_get()` return a value in [0,
>>     //  KTIME_MAX (i.e. i64::MAX)).
>>     pub unsafe trait ClockSource {
>>         ...
>>     }
> 
> Nice catch, it definitely needs to be unsafe. We should also require
> correlation between ID and the value fetched by `ktime_get`.

What's ID?
