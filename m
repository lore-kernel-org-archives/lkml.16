Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085AB280CF6;
	Wed, 23 Apr 2025 15:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745423012; cv=none; b=tRtfubv3k1izwXNHGhDNPa8frXP18NZG7h7kaOuzETdChn+6M+ICUeTzw2B66hcDG0wPs7SijC+PYGKzKwAATpBYyU5LQWa+sFKN6nSgOavfdqrmjH9SL4+l6m7ll8aFk7EQiGdqeRprSREmAVG4IPuOlcGWdkdnU3kAjnGMoTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745423012; c=relaxed/simple;
	bh=PX4ME2w3S+dcCpP/2hTIRBjPlH5zpMlsR+JMuyfS+lk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hynYAMStkcJELfbgQf+1JeNfBgtqbu8u2gcAARfzVKIeZX38zNA5V4pN0UVtAjgCvHNLx269or3WycVg1WWrr7e3KfkZ4fdxWsV+L4Ni5dyayrmZJO7Hnei4d1yCjoHdYbvtjCUK8JXewjinKgPHDo7GFSc0jnzZ2ePXESQ0wks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IalKwVI+; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IalKwVI+"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-310447fe59aso753931fa.0;
        Wed, 23 Apr 2025 08:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745423009; x=1746027809; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PX4ME2w3S+dcCpP/2hTIRBjPlH5zpMlsR+JMuyfS+lk=;
        b=IalKwVI+7ZDYMUYQDZcPw60APh0jMN3FTNiYsj3zJYXM/ozpG8MjWXbf20gmcAWWjP
         lyQdFeEtp1A1Ylo04GDeItz/Gdk2/7XbGlWNZaFBPDXRSelOIBXbDGJKJKtXtKaGPd3Z
         KD49GAnsL8IxMiYW+tjltnneU9vE+mCv+NS9XJXueD6LZBIaIQTq21HzXg5m43rCX2hZ
         iIiq7f/kqqlhRo4RA/D7L4mDlC90LnYIq++LoNA60cZSyS1WMM08CvtvY89HyDXxoVJx
         LHlCIHDT4blQKzpr3rbef+JX89pPFYlM//ICHKUSuYxEVmMOUYiQZTRbmVHdBAO+Bo95
         BFSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745423009; x=1746027809;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PX4ME2w3S+dcCpP/2hTIRBjPlH5zpMlsR+JMuyfS+lk=;
        b=kx67eZu5ky0kMYnk8hwUXT/UKSQBemURN7Xe8RDwc49qXe63WRrsYRjJtWvuPhFDSS
         YS5+nm+zABnX0XCwQ0xhSfsUsfCcFl0kie9VpHveecOSgLRxO8uPy80ZpIV2uiS7zkVr
         olb7A9sY6M8gXQatR7UWcR39fV4EUzd7pVlkETol4dGOcIY750gaazlPE22zEq+En04m
         DItae69d6DPpizkWP7foi7ybswhUQJvRXZ31yvQ+Ud7pdnmQGkB5JPp6h2Pl13iyg9wX
         EFF/rknhzsvQGR+auARaWscZ+U4d28TENjiObqJzMYT0yt2Bo28/DMWxHe02jhu7GIFg
         XYFQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/r6lZFL6lNKvqpI41t/yfnDRbDiR9xkkhUy9/klXgoXiN86JL0E3pXSv7ut18y8bdQuk/Ei/LD6D4iP0=@vger.kernel.org, AJvYcCU86yyNXTpgNfKttTtt1BpQ8T6s0B56a1NldogAd55ljcUD7SSgP1E0sp4hkWgaFpkqVeZ68maSEz/1SwOV2dE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzolfRfPml86aaJvH3jBPKg4woDvH9vLretFCpIXEoBK01pKUO8
	6vG8lxjhzMWU9nPDBDzLl99aRfr3r+0Nguj9Ob6cElljQ5pY+Ajrc38yqgeX68ARNxNrAHvsPQc
	K/+QYjFhvVVClWXuuy4+zKu52GOhNMTVQ
X-Gm-Gg: ASbGncuAdRoV69ErYlXQtiwyw0NHOfejfQ1eHE0yGaWKULOHDolDtjxhLCjHk/NlRD8
	YdYVPJg9FLpuInkwPjEJ2YcRRiWAw9bPyJJafAmwP+3MbltETGZMA5mahh/OulOflmPbjDCnWx5
	jM4OMB8cO7Ms2MeKUJoGj/RFoM85xWVjZ4GKOkRBU15ap6OG+b
X-Google-Smtp-Source: AGHT+IH7SoBnssRznhZ1kxAqRGpnQ9BaX4uHJv5FWrFIjk1fqpZx8teMonpZRSxauUBNqGEQhiD16FmTA3ygoDWTJbw=
X-Received: by 2002:a2e:be21:0:b0:30b:f0fd:fd19 with SMTP id
 38308e7fff4ca-310904ede00mr60603761fa.16.1745423008767; Wed, 23 Apr 2025
 08:43:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250422-vec-methods-v3-0-deff5eea568a@google.com> <20250422-vec-methods-v3-2-deff5eea568a@google.com>
In-Reply-To: <20250422-vec-methods-v3-2-deff5eea568a@google.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 23 Apr 2025 11:42:52 -0400
X-Gm-Features: ATxdqUGHO53nvjmgJpnYa-3-3FIBOPtmp-9r0P_QNszRBVJYYkhQ801N4EG_e_c
Message-ID: <CAJ-ks9n5qzUBinofbWsrR7CH6zjqtB6QCs85L0JTzYw7JGcxbg@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] rust: alloc: add Vec::pop
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 5:53=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> This introduces a basic method that our custom Vec is missing. I expect
> that it will be used in many places, but at the time of writing, Rust
> Binder has six calls to Vec::pop.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Could this be written in terms of `remove`?
