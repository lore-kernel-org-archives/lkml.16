Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49ECC192B75;
	Mon,  9 Jun 2025 04:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749443630; cv=none; b=uT/wRervtI/tXlPB5pmwM9gQ3f22HLdUI4cWWrASZ7W3BZRmDumA/xSOlxz6IGFzUr2Ssia3wMG1mvsKs/fyS9d3O59ok1O+km37zltqG5PA9/rt99JC+DBn6Ljg0cl8S6Fnd4Td1qfZllKcdPGgef3JPEL9BzTHp5V3qCvd9zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749443630; c=relaxed/simple;
	bh=h7Ihb1Epf9mKshAeBFCCEqXVUjHJ83/heXSibl9WC8s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZhbQY7pF2fHrkRNkin1LZBk8LVBqMYkLQzMctDxTT8Fwhkb74sTuyegmIGFPa5E4d0Wotww5zCl5JzOOtc+O/VOFo1g6UWOgbtYrGaYXj1KJh97GBgGGYca2MlanT2r5t+nmZHFpttWaY6eN5X0N1dIlvzojCvQ13kgeYkBZBAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z5jDqTeT; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z5jDqTeT"
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-87ed1c2b487so25725241.3;
        Sun, 08 Jun 2025 21:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749443628; x=1750048428; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h7Ihb1Epf9mKshAeBFCCEqXVUjHJ83/heXSibl9WC8s=;
        b=Z5jDqTeTlrwfCy0qmNSrypujvzYo3TlWHvl9DSrz65xMLBXQuqBVg5mHaZ5JkoLZBx
         Gb0YmCPMEsBjOP+VGAyO78nCnCFIJVWPjQatGi1YE8ijT00tDXdXzO/WxWC6x6v8aEyn
         IPdPYmUDSRZXcEDNjr7gSiodUnKmequP9+osofxBNJD5QAaLCP915cYOGlttUUixZN8k
         DDCsRIWr7h9t0UHtZZ4dUD3Km156GBoK/m+aAGLLlAZ6M5fcBzMJrTXqgLN2MUTzd7wE
         0N8LYfzGpnytgQ5cw/G1Xtj47gm/RUCYh7NazT8hiJFn7/5ATzL+q42Fpu/E4XUhLd7V
         83aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749443628; x=1750048428;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h7Ihb1Epf9mKshAeBFCCEqXVUjHJ83/heXSibl9WC8s=;
        b=O+49IbtY/pPE4f099yRgkR78rYzd4A/AJbFBfQdChckfV0PI5B9musw+IDsocMucz8
         YxYwWKPUp8nPYdoIT4LxHQQkf48bLFZI4fhasf2A59RjR1Nd922FsxKWW0DWubMLsczB
         YUJSU/QCRVec116IOnY+PQwWBgLJaG6R5tEHlqHDyxUvcDYKvm/SzETUr2PGOUcJuavC
         2I/dO9NInTUCRtRHPuQB3qXMl9ejfj0xsIUGultGBoJHCDQUcsl6qlxAirY5lAt2DT4J
         YsS48kmSTBgw+7ltGg9wjPM4I+7emopZSwsLixiTk0jFzc9ve7DZ9Sfy2oaT8E/4enkd
         CxOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXe34GhleP3rExJtXdOXXcfir+QykxO1pLl/6JCCLOWvLa6/Rpj40Fc0cEsSvvPAkCInLsINK3YQHdvZoI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZUgT36/HY2XrybZ+IIal4neFjBI7Q+OmXMBcsmKrkVGqbXzex
	jReSVQaODbEOzDsNrXGbPTwcpSu0XQyNLamRIip4FxPHyIT9j9Fr/QxlVpFAm/QwjNGOkkzPDKl
	dhdOEgyOmVxJUbi0If8zlm7V4S6yqYgY=
X-Gm-Gg: ASbGncuCRaDiJ+DWRjgKaw/uw1tbgwT/whTKeHuEZjLPCQY3myLWHjr0lIfU68l3w23
	i3XV1FNVf32rN+NYylJg8IBY6osrXqVwxpJwejgCbc9Jm4Bu727AcZznn13Kvrhj4GExwpkq/s9
	L6h3a3hdBLO8uRIfKJPW+bYjaxcnLwry9nrbbT+LJqGfME
X-Google-Smtp-Source: AGHT+IGtpm+GjWAwqV8qVoEDAmnJRMAo3nk0UIoeXRspYT7fEctsZFNHIWIcj9ybIPdFFPHQ6MVaaX/a/l4nZY7WVIM=
X-Received: by 2002:a05:6102:15a0:b0:4e2:955a:afea with SMTP id
 ada2fe7eead31-4e776868f61mr2758162137.1.1749443628173; Sun, 08 Jun 2025
 21:33:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250330234039.29814-1-christiansantoslima21@gmail.com> <aDdoGfo1kynqWCDm@cassiopeiae>
In-Reply-To: <aDdoGfo1kynqWCDm@cassiopeiae>
From: Christian <christiansantoslima21@gmail.com>
Date: Mon, 9 Jun 2025 01:33:37 -0300
X-Gm-Features: AX0GCFs0dVdlWIfhndTQYEYg4XEql-HsA2ps-7Otdev-q1VN0yt0nLUX1PRqxmw
Message-ID: <CABm2a9dEOXS4xAsA9LQXE5Ct36UnWxmhUx7dqJAjwc5yL5ToHg@mail.gmail.com>
Subject: Re: [PATCH v6] rust: transmute: Add methods for FromBytes trait
To: Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, ~lkcamp/patches@lists.sr.ht, 
	richard120310@gmail.com
Content-Type: text/plain; charset="UTF-8"

> What's the status of the series? Are you still working on this topic

Hi Danilo, I'm currently working on the alignment issue that was
mentioned in that email. I'm still working on it, and I'll send a
patch this week.
