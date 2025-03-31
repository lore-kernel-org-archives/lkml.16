Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E46D1DE3A5;
	Mon, 31 Mar 2025 18:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743445907; cv=none; b=QttzNOICLOiW7SPLk5RU35m/C+DanAnOfgm8L/FFP7O/ywN3ulBQ2lK9LkB1Gh2Ywp+NW7Di4b4AQZIw2vVonAbY1924yyL/zpAIktyrROxydDxQa2oq9euIcTrVEvbCZIgwaPjkNKcCJYAfa8kXvkNKFZhcC1KBzw58pcNLlg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743445907; c=relaxed/simple;
	bh=Ryh0YL1/glEMLDYhovf0G+MET7UjsHYY7E9OvB3iRs0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QDgzDWKNxPgSNCYdp0hKAPhopa97EbtJRzXWc+4uGPvZSFTuVOpP0jQha39/tpw9o/sYozOoGR3y6SCD1C53tiylC/5pdDgEpYbtDXJ7krx3bdUeyTArjLlTtOywE1mK2OB10F8oCK/AAm+DewDZbDPZjVE+6tzeuYAlRUqtEGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mL2Cc24u; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mL2Cc24u"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ff53b26af2so1056322a91.0;
        Mon, 31 Mar 2025 11:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743445906; x=1744050706; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ryh0YL1/glEMLDYhovf0G+MET7UjsHYY7E9OvB3iRs0=;
        b=mL2Cc24uc+/m24APX0gKDPlbqNrLmrG11a/FH3mWmYYBgEQ13BnpmU4OvG0MzdwJD0
         oYpN/4T/WMXyjQ/mEU9yj0l8sqA1dN6g0vy59hm+kOBKPZqiIzRW80xqM7F8LITYJ3/X
         4HHRSCjrvkslZzFCeRNhtN6sX6Z2k6IqaxgaaN+9DW3Z3Cf87FmRvdY9hanpuh1J4X8C
         ueHT7geQ+jBGbGiDXOfSJPxBvj7+NMNNzgZ564aWutz+PHMQvk8p2TvFh80wQ53w/RxP
         0AYQYf82si6AsdD/9ECgym0KputOgALjqwGZnAiHd6MxOmDFQaURNLuuJRbBlX/h8XAc
         jW1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743445906; x=1744050706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ryh0YL1/glEMLDYhovf0G+MET7UjsHYY7E9OvB3iRs0=;
        b=KZQJiayKXGUESHPl2xBgaZ+5gdWwYpWDu9KXfErdtmQut4tG70mMQdmXWDUEEQiahU
         Efrjeefb4Ek0KQ4js07tmqxO37+muhcPzBccs+JgABaVhoTck4ZDI0DDFZsqnUtCFWXQ
         Kk4v1b0RvDcKkpKhGjDpr3YF1wYUwElXUSsKfk5E5d09CMonSRvbMhzRuGpncM8fwCx/
         l+VlLPD3Yg4K+ibsm2J98diFfdaXJw7MD2ilYJjgwWXaDUSXnZQjg4R1GdhXhN7sx2UD
         k8YIun2tn2N5lFX2OLJOyS/NzxdXAlg7uYIQhL7IK+3/pJbLuSHY+zsoMtbv7eK2Mk2z
         DElg==
X-Forwarded-Encrypted: i=1; AJvYcCVNKY9YyckW3ccwvR+j3tnKgM1UbSLvgyE9FoeiP+fN58SAsi0jXvPw8HKzlCVTw5eIEyiufkniMoYpZU4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc5KErN2Bg/FQY2NDHqdAc2oLMNn21pneZ0s04Ld1gpIelD/6n
	TNsZoNm+r70JnL9pOOnh+K+t45KBbcfWCttc+A0N7AE6lccLeIkfBFXiDh/Ed2rjx7UBLKDTjNo
	+OyimFoMfz5gi1VJEtdlXokUfuj0=
X-Gm-Gg: ASbGncuMqMekVCaaBwp8etnuhLJ8m2yIGC+b6sCcDuvFO4z9lK85/Gq7y5E2UOjbAFj
	ZS9ljbPWIg9nbo9sBeJTCp+gfPO1l8XZHB2gMPjAXSGF2T54F6izy8v0o+xk/AJKUMyixGr92Uj
	7KW9LegCmG6qEvQfhErIYNsdUo4Q==
X-Google-Smtp-Source: AGHT+IExcKaWB2a/1tgKfOwDy66H8kdPcVShSGcwccJM3AQzOSIBJFBWGCgs6XPOYp08SDi9M9EdzX5sWLy0eBdIhKM=
X-Received: by 2002:a17:90b:3e8d:b0:301:1c11:aa7a with SMTP id
 98e67ed59e1d1-305321512bdmr6000911a91.3.1743445905701; Mon, 31 Mar 2025
 11:31:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250330234039.29814-1-christiansantoslima21@gmail.com>
 <20250330234039.29814-2-christiansantoslima21@gmail.com> <CANiq72=GWwhMEfwBgUFpEUFoT2Wga2=uhH6Nw7fotQYjz2G=EA@mail.gmail.com>
 <CABm2a9ek5+KYaX9fGqXVQhG-hV1esn5EnD0PxKR29D_pwfZUeg@mail.gmail.com>
In-Reply-To: <CABm2a9ek5+KYaX9fGqXVQhG-hV1esn5EnD0PxKR29D_pwfZUeg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 31 Mar 2025 20:31:32 +0200
X-Gm-Features: AQ5f1JqeX5XxF7_IM_NbyI2yON3IxrzIQpRw8ymtxMwge62n-Poad1wJkf3AP20
Message-ID: <CANiq72=++3SO+VcxmyxQGK9hXEu-=jaumGiwhExdykrKkfuihA@mail.gmail.com>
Subject: Re: [PATCH] rust: transmute: Add methods for FromBytes trait
To: Christian <christiansantoslima21@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2025 at 8:18=E2=80=AFPM Christian
<christiansantoslima21@gmail.com> wrote:
>
> Hi, Miguel. Idk what happened seems the git send-email took the commit
> and the .patch together. Sorry about that and I forgot to reply all. :(
>
> Should I submit another patch because of duplication?

No worries, there is no need to resend for that reason.

Thanks!

Cheers,
Miguel
