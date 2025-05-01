Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BBA18AFC;
	Thu,  1 May 2025 13:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746105735; cv=none; b=rj4La3KLI+AyFsokCylFMBZ4fcRsflgXkaH9F1YJuoS4WN7xiJny7TmJMEQmSwqzSvi9XAt1BJrEAY8U8P5hHG2YHd2dCtXmG/mhDdkS6bFoi2JypIMUCVU+ymvk0j8jjXDpIYbcJxbxR6ftaE8GSPoV5meXoVE1C3JNCQPptEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746105735; c=relaxed/simple;
	bh=v3U8RCQAUniIoAao2nQ3ilYII6Ascb1uD9OtVNye+p4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k1wGgN8QOakuBRuT4R0KjwBBgPKBWPRKB3DG64BxC53/kDFK45uBnHKTOmNVCZufm+zUJkiZG3r0YwNO0wIrMVF1FXz1a1gJV5Q06f3XIBNM6naBmhcY8mbhrYP4i5iKWhNC0n7FOllZgquBol0LzrJmdR8yd/wwz9bJ1hqV530=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D0NkAxyn; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D0NkAxyn"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b0b229639e3so55326a12.0;
        Thu, 01 May 2025 06:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746105733; x=1746710533; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kjh2zNB1qrmfzCGnmjm5M5ScRKPzJ8DBRHas8DIGOl0=;
        b=D0NkAxyn5gBe3QdncujN9FOxew8Xf3zQYOIsembkLVNMtWpYsGyAA4EN995y6RQub5
         W+4nWikFG1CF3jVXkG7VL7s5rF6vT/bDU72raSdJo2EUpvZOPVMUfIMcJGgQd0ADpOjC
         P9p+4d6doYU4M69tyfWL1gUcUf9NSKXhY+yL7qshksCTEtrMf0FiS9m505biFFvoFJzk
         Pw+k6Ec1RqvUiBF4Rfw/S+OyGqFAiBMLajVMJ/HIdsCI22Qhjd3qh+PxR3G/31+89n45
         1f1h/E0pFlkghItx3sokqsssKoISav/lZN3kIGgJLsKsYolPGnsYOCqdN5zS4qNv4yFX
         59fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746105733; x=1746710533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kjh2zNB1qrmfzCGnmjm5M5ScRKPzJ8DBRHas8DIGOl0=;
        b=hNWaPV8KifI4Mc3d/jQQRYSEZ5InB5UudK1ldXQOvxlEYFPmzy0tWCoBb7NBRhfx18
         iqaljJ/VGAFBnGxroSHVu0vRPVXQ+cTbb+4Zq6XEnHMmnFcxvHQFEgDgEeYT+jZB2/ms
         ImYT5s7uUirBDbjuAFCM91XTOxpaa1QLSQ9JW5z60THyCHbwcHwTdZehkcnybnYDRMBt
         a2OXdR0LP/S6YMj8TGdCQLfpqf2bhyAkkRIY23jGjYLmdMlm0DqGUZe7UK9lQ0LCMKhx
         bgoDrO6gRx4CggGl9H5d8czS1fPEvHGUKQFL/VuaoXfA7dhagqn/SGmMr+E96KphUlxT
         1v0A==
X-Forwarded-Encrypted: i=1; AJvYcCVDPjou+0FztvYWowG/hh3usiaQnCzSp0MJKP+mt7x8NjBy6mkAz/Zb+5CkkTsy/xire2oZ4i+lpSXjmOM=@vger.kernel.org, AJvYcCWtvtIkuldplT/oY8pfsxn7Zd/sOZX/HrEqtLTE4oHQIwFvtwQjt6yvRrW3yU1SIZCNzYjnmAnwA2pPwzJv1KM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9BETjjhCROLsamPWLoo3tDDOK6tQlkTr31QKovJqvt+A2eftd
	JzZmUsOj0O5cnkwWcXDJ59MD+5QbF80kKrbRP95SquXIOQneLa4zV53DqoUR/aH1U8dlc0INhII
	BwnFxdumJGVQFB8yjfW830rPli/g=
X-Gm-Gg: ASbGncvmm3w6LFqQgeFBhW9USlqrOkYd8f55nsqgUFH0RiX8iLQ8ABz4urnyK2w01PV
	+XKH6zB17xw3zScIBOillwAddxx4eGSPzMbud8KoI/lZh6HKpuOO4J9ZV5XkT1TfOu69CJRsQhs
	b2XgCg3gVKCeumxw4O8NXfXA==
X-Google-Smtp-Source: AGHT+IHSVHPuFguW3BzW/LjsohHmaHpPPs7WlDmVbwPSXz11Sl/CZBM9m12fQLsLMzGV3OoOZgVcyM7zi4WKNldFSbw=
X-Received: by 2002:a17:90b:4d90:b0:2ff:4be6:c5e2 with SMTP id
 98e67ed59e1d1-30a34ab3ffamr3619639a91.7.1746105732962; Thu, 01 May 2025
 06:22:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250501015818.226376-1-fujita.tomonori@gmail.com>
 <aBNojspyH5dHsuOm@Mac.home> <20250501.220717.849589327730222635.fujita.tomonori@gmail.com>
 <aBNzIp9UF7GZVYLs@Mac.home>
In-Reply-To: <aBNzIp9UF7GZVYLs@Mac.home>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 1 May 2025 15:22:00 +0200
X-Gm-Features: ATxdqUEJzNKV7A8NwDjVpZzPnUIMMYkDw0pJK0yGodyze1IKhSEdE61bCmdWHg0
Message-ID: <CANiq72m8RfL5g9kmAhZdZZbrpDschrXf1yJVvkWmvMzdnMaSvA@mail.gmail.com>
Subject: Re: [PATCH v1] rust: time: Avoid 64-bit integer division
To: Boqun Feng <boqun.feng@gmail.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, a.hindborg@samsung.com, frederic@kernel.org, 
	lyude@redhat.com, tglx@linutronix.de, anna-maria@linutronix.de, 
	jstultz@google.com, sboyd@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	aliceryhl@google.com, tmgross@umich.edu, chrisi.schrefl@gmail.com, 
	arnd@arndb.de, linux@armlinux.org.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 1, 2025 at 3:12=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> wr=
ote:
>
>         #[cfg(CONFIG_ARM)]
>         fn ns_to_ms(ns: i64) -> i64 {
>
>         #[cfg(not(CONFIG_ARM))]
>         fn ns_to_ms(ns: i64) -> i64 {

I think `cfg`s may be better inside, i.e. as local as reasonably
possible, so that we share e.g. signature as well as any attributes
and docs.

Cheers,
Miguel
