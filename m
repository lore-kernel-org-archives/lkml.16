Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBED19DF5B;
	Sun, 13 Apr 2025 15:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744557160; cv=none; b=i3HY33QjccvTLIH554oLZm8TfHYKFB+kG2zekpv0mVTop1uuQag9Ig0U7SR9YIX2zDRts7zNud2SKlg7reIj9m3QdLPfbtltKQ29g16M/vwugec+D+eqo929ZhsPE8cV4cVJmairSwSFfcLvvQsDcHhJJAzSofnmj/uqae+xBY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744557160; c=relaxed/simple;
	bh=XefX3ZhXcT6t6VYUiUzs8lT/NUA3wO9bD/H9AC6ueTM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eHo0/Ja5Btbaoj88DdNzZQ9Pj9A7b6EXom6EW7/vAH4qbQPiTMy4bhCnOwAsnnMat25kTAVwJUawTJUg2dQ8dPThBcQXT+QbpxD7MHEJptsUFwjoWvjxeuKkS4ytWVKyOIMiX3lEvav277X4ZwNEDC7TuQqocX4ADaYgcQp8rwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H2+i+G08; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H2+i+G08"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso26565055e9.3;
        Sun, 13 Apr 2025 08:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744557147; x=1745161947; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YPnIJoZ8+elFFVZr4aSmeME78biJPyFsR8gxdEab+5A=;
        b=H2+i+G08BAnltCBqAkFauDeLVVsT0dzFjRiHbsT9rU1p66IzP5qNnnLc13odwsPhDQ
         yVFu907cEgeyOY952t5X7M4cWlIubu4ktXHGmSAZ15Kh7X3gj19KABBAAuEL3Bteyxh3
         WeqF+qpft8+6I7hZXOfRa5gH7UmfUP2Y5gns3k34GZkHH26/nMjcB3h/3opLMoQjRQEJ
         TsJejWSOs1scp0Uhq9ntoxif8KU1E05aLVzVxTWR3qNbgAgS+WKVGohmi/He0QoAsgad
         wiypti2EQCSFL663yHqQTAG0wpMmDz+w5u7isim6y/mQULWbYCBoaBpyrxETx/+ezce6
         6kbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744557147; x=1745161947;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YPnIJoZ8+elFFVZr4aSmeME78biJPyFsR8gxdEab+5A=;
        b=wWYUKOLC9F8LdujAEjwt6Vu0yJwzriTyGIwfAyWeWcBMSXC2ywFVhERdaREoTqqLFm
         ufC89FGEedO2tWY/vVGU5ZdQhvVlzb8IZKWgJkEDhpiQ4AiDGGzwkXLUz9mLXH7MUBjz
         8/6pgVAQH+1GVMM7ghB/0OCnekdTA4lz+A0uIdTSQMu+RF/8lFeh7shS9RpkXl6SG1O0
         BeABiI0eo8P7X01EN6iiVbm8UOtuEftLkPAToumlHE/S/jsx2nR2OIO9yCnj10r/iPK/
         jui8itS63fFgoXpuYXPaqIqQnN8zAZH9ZaOGpEPvulTNWgpY+pd3LxpTQtdWNQfddI+q
         faQQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1QBPMGURc8haB7KHo/0TZbCjUscO5fSqihIUknKvW6JxMVTI7YuGZwcqQhWEWe2wuEjKHXWBYBmRM0Qs=@vger.kernel.org, AJvYcCW4x9HYplSTGw8sUjds/G2hHAvj/W1wCdUb+UNFeD0Wsb6RfOjuyV72z+c+5IT4gl4YJsofEHcM52siBAv3A7k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaHlXfzbQS59VqDDHMdXsKX8CnQuSKSGKNMMTw63ZubCDIgfg5
	J98ffa1eA9GyloioYWtNGVwi3uUblQ+HmXl7WmfV0LdGZqq8XVsK
X-Gm-Gg: ASbGncvBVm44bQri8GwPbCzptcCbVcM+c0RqEhbZHJhrwHTJIHK29OR9OyGh+QJqkcT
	u3b+aqA3JgolE8gQu7/ZqV5C/RZA8dzzodH3vFGE7OuJXWmqvFsrvxyykZlzNFGMS+Fj/5hmV8V
	F9uEj5TQvUKi570J9Ydds+wqCi+jtmtaGW/NLM44+OswJX3qtpTHEUQXOncIwZ85OiDT78cz3GA
	Z7AnH0i9GF+QaJ5totY4oQmFcAmLKa0lGJeJ/yhWR14l0SraS3NsxPJ02vveVz27YtBMCiPvOLH
	pZBT74AuYJkyzHCiDd9coP0JiIVgFwB/oKgZ8yLQztvWipwaP1KKRw==
X-Google-Smtp-Source: AGHT+IFDateLENhRah1veZqKxHNb7QuhiRGbYxs4AN7UB7WEcNnZaRVPAnS3Cwvgo/hUbSSl3lnWtQ==
X-Received: by 2002:a05:600c:22c6:b0:43c:fded:9654 with SMTP id 5b1f17b1804b1-43f457d1e26mr31761005e9.19.1744557146673;
        Sun, 13 Apr 2025 08:12:26 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:99c5::1ad1? ([2001:871:22a:99c5::1ad1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233c8224sm145843495e9.22.2025.04.13.08.12.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Apr 2025 08:12:26 -0700 (PDT)
Message-ID: <d4147269-6a7f-4fb7-9199-54f53be61139@gmail.com>
Date: Sun, 13 Apr 2025 17:12:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] rust: Use `ffi::c_char` type in firmware abstraction
 `FwFunc`
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
 Russ Weight <russ.weight@linux.dev>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20250412-rust_arm_fix_fw_abstaction-v2-1-8e6fdf093d71@gmail.com>
 <Z_p-UoycGk3BceXm@pollux> <c04d3ec9-46f8-4ccd-b0ed-52a1adea11b7@gmail.com>
 <CANiq72mpKQM8v1=qhACWGYo1c0jtOymnACDxXiRgjEs2-+X2=g@mail.gmail.com>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <CANiq72mpKQM8v1=qhACWGYo1c0jtOymnACDxXiRgjEs2-+X2=g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.04.25 5:07 PM, Miguel Ojeda wrote:
> On Sun, Apr 13, 2025 at 10:55 AM Christian Schrefl
> <chrisi.schrefl@gmail.com> wrote:
>>
>> This causes problems on v6.13 when building for 32 bit arm (with my
>> patches), since back then `*const u8` was used in the function argument
> 
> In v6.13, the function argument used `i8` -- if it were `u8`, you
> wouldn't have had an issue, no?
Yes I've sent a new version of this section in the thread with Danilo.

I'll send it out as V3 soon.

> 
> Nowadays, in 6.13.y, everything is `u8`, so you shouldn't have a build
> error with your patches.
> 
> Cheers,
> Miguel

