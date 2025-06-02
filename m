Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0000D1514E4;
	Mon,  2 Jun 2025 21:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748899205; cv=none; b=HPZ9bRto6qFJ+k1xJLV91WHIe9LkVstGaC1f+23URmRAKtUXl+higxv2oyP+ISs32iGz3sT0xbAU8jqcEcFsqsKVOSmF+Dvq6MZzMPgUXLIaq4Q5bXmAf1OhRvBHIapioCRfQiuhFPH9hkXiOY7AkpbKklQK3eev7fs9MsFGlpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748899205; c=relaxed/simple;
	bh=zRYSgvThWwZxaNl/CufN+FxgyjCanKiIaUURCNOV7rw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j+P2xnXHFYJAMQIxKxVc7h1v+HM2QYnz/VoIOnEKMhZDC2QH31pb7vFnFs1uqCMAxXEqTOvse7TAqBLIqaa1gIT0uEFjgd9ywOUnLMLyiKK0TzyCbPFoXLa15MDttD8BsGOzpotFeBqs06ENnVQ4hzIZ0qwBRPkMfJ7nu5mh058=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZHQ/wUYb; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZHQ/wUYb"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ad89333d603so952113266b.2;
        Mon, 02 Jun 2025 14:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748899202; x=1749504002; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hdUEsBdZpON7jrH6ZJsC2up0CamAqY5UjT4R1pWvEcE=;
        b=ZHQ/wUYbitDVDyudfftCMTCJBcQIR2crugzjr2Y9pw9PqPa4S/QK0+rzZAR6SN2Ci6
         Ts6Kqul/qmGdMRYDJrlm28pHq4DNpFIrXjv5DrHCEEWUFZpvY7OOFhkn3+rOsVwfRhqi
         0gDD0AtbghiyV9Taodkd+AjI2N/QcHoFef6U2IyiDd7UwyvRGdPSZD27BLDfuJqziWkQ
         xNVJgGogAzvDjpQo0M7JNZuWiEnKqvxEwAPaF2NoEZwXQcQ356H4xIy+cRUrMaQTLm9t
         i2lzi9ZQH0Q+1c0LkMjGV3kPBppEsENoFHKaLf5RHQ6+Os8/Zr6CjyOjKdcoOEjfrH1M
         5U/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748899202; x=1749504002;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hdUEsBdZpON7jrH6ZJsC2up0CamAqY5UjT4R1pWvEcE=;
        b=OGqRsQ5C2GSpj8HetuFV/efVKqtfPMj27q024rZSEnulvNXpTyV8lTSEeFXVcywhD8
         X1N3mytNiHvCG6z0X3rwrS6KB/BHwEsKeUvm4suCXd1dmNu7YmfoSY2JLjwioLHncRHj
         VshKaMg2dHJat0IOOh8PsxwvNBKdzRRgWU8WeEdalYgWU2k4ZMP6Ue3990JfA/2YpoKM
         Tc46ZA8f6/cgjY/IEPjl19oec65JNf5VTsXHfeTmLptGQGCz+GauWLNivEOAsUPcRDnq
         0U6yyJhrTlwQ2Mikm4Z76amas8BqDEbpOxzHvEStp2Wq6nqVX21Qd8cfGzgFddTkmoiY
         4b8w==
X-Forwarded-Encrypted: i=1; AJvYcCVcTxazCS65HuoYxH6pBQ04lR99QqFVVn+LW1gOyA8lI4I22e0A8zRk8t3WHjArJ6yHQYWLcwDPo8hprL8=@vger.kernel.org, AJvYcCVf2czGXOW+kjRx+zKybJX6G3v0sZLu+ZI+Tv+IiajVCSQ5o0Jn6zxyd6+LQUjkLm5CdpP1jVNw4WR0mxuszek=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpnhySfanEI738BuNbBhGG5aB3HPcXxmgB64Qdozc+8uauQWjv
	yZF41RwoC2OWDfSJAipPrtNRi9p36LNtbN4vcdpHyq9iy72AalLvAbz9
X-Gm-Gg: ASbGnct1kq3zt20TYELQfFKo+9x90w/ECntdCfSBY5QcE1EFBhl2aKlytno2jOSbA0r
	dQnoAXIUKC3FmV24pPr+4cP4NvCun0NE1YMOVM+k0iOisUKbdVWr6ZrLnRKPbcvd89QuCrc4AXy
	31T+VeW5OeN6qcdZhkQu+07rXOEXgdBVocvIWhCeTIBvNEVOze8qbaCaisKmuxlE7aya2SK55zy
	iOc7B0mJJUhg5Ka9yhewvfl6VZ1uUuoKxg9CaC12wS818HyF9mEvqj2Yq9jN78hMQoPTyRG6KtV
	yRY/1MPrFZtIwwy70EB9Zq43yPpBIFWQufso0Q5VaxiW0fowuPqirdodkAq8fQtfjq+qs/uO3pL
	96pINLQ3xPw==
X-Google-Smtp-Source: AGHT+IFJJf1xtcKNWTGZSbngbMDy8Gtm5lWF/ASzb2cGdMdwOdtb92j/YwD3lmYIOsmitKTM+AcNiA==
X-Received: by 2002:a17:907:7ea0:b0:ad8:9909:20ac with SMTP id a640c23a62f3a-adb3243b5f4mr1234826366b.50.1748899202038;
        Mon, 02 Jun 2025 14:20:02 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:cd68::171c? ([2001:871:22a:cd68::171c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d7fed53sm850073066b.27.2025.06.02.14.20.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 14:20:01 -0700 (PDT)
Message-ID: <6802d4d3-e2f2-4150-a9fd-26002527b42a@gmail.com>
Date: Mon, 2 Jun 2025 23:20:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] rust: miscdevice: adjust the rust_misc_device
 sample to use RegistrationData.
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 =?UTF-8?Q?Gerald_Wisb=C3=B6ck?= <gerald.wisboeck@feather.ink>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250530-b4-rust_miscdevice_registrationdata-v4-0-d313aafd7e59@gmail.com>
 <20250530-b4-rust_miscdevice_registrationdata-v4-3-d313aafd7e59@gmail.com>
 <DAACGEDVW8D4.66KOF7PWD1I0@kernel.org>
 <CANiq72=mdaekPrR-LWzfM5hKkNaQ=zGqDFh42Mbi8eqQT71tLg@mail.gmail.com>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <CANiq72=mdaekPrR-LWzfM5hKkNaQ=zGqDFh42Mbi8eqQT71tLg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31.05.25 3:40 PM, Miguel Ojeda wrote:
> On Sat, May 31, 2025 at 2:27 PM Benno Lossin <lossin@kernel.org> wrote:
>>
>> Let's keep this newline.
> 
> There is also another apparently spurious change:
> 
>> -        pr_info!("Initialising Rust Misc Device Sample\n");
>> +        pr_info!("Initializing Rust Misc Device Sample\n");
> 
> In general, please try to avoid unrelated changes in patches.

Sorry, fixed all three for v5.

Cheers
Christian
