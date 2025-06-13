Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9912046A6;
	Fri, 13 Jun 2025 15:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749830052; cv=none; b=l+NO/gwNgtjgdtfUcho+Go18M/09fEUcpPGxf5/ztrAt6lwd6CKZHf2AI5SqxWnVYv3wAd0//nAiryFn/7X3FKnNits/I+4DgGOmRadHtWElJqkyeq2TX38vC5M2fbRi38tTxP37JB1H9fD8GOtErVJEK9EYjMXdEv+xTfruukM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749830052; c=relaxed/simple;
	bh=F1JnVw0p0/51zuxC+hsf+LFfBL2DoEB/4Xq9imp2Vs8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qzAtTw6JFBOd6z+kMT2s/eVN75nGWRREkthrsVJlCmuJd71eODYbRB9yPhiiBoSDFOKGg37fJuicWaoi8GoPBXN/1cDytDooe/JUQJI5uQpbAGHmAF5XQx2rbfS7sle+ta2G1k07L8l4VwbTijoNSi2eAEJC+rmqAzS+O+Qw2rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a7Mp/0+k; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a7Mp/0+k"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-312a806f002so293796a91.3;
        Fri, 13 Jun 2025 08:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749830050; x=1750434850; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F1JnVw0p0/51zuxC+hsf+LFfBL2DoEB/4Xq9imp2Vs8=;
        b=a7Mp/0+kGrVIhz+rxPUTcEQrpY8ZkD9ccB+xbXDY9My9r51EOW6o9d+lNGVTwIfeDQ
         VUT2B6qLiFLzLwqfm8YA8MOcx6SGuQc7i2a7hki54XlQ1UM0AyUww33OF6WuzYkowF00
         D9cO+BxRGQJHrl8AjQexZPl+6MbfNL3/QiKyUADNiZ1fDcGzQwuz7fswgsAH+TPSobEN
         +RFgvlv4ujjKTh1CsmAuFssT0lhCuVCPUl1QW1aJPB7owh5hLHkUAYKInmKrQnfJNZwd
         Dr2+El01EQzSjye6Sj6KwsQ905e8pN7Ay7iTTe/2ohAo5Sju0ARcxF8HB9ua6wkQZ9lv
         M6LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749830050; x=1750434850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F1JnVw0p0/51zuxC+hsf+LFfBL2DoEB/4Xq9imp2Vs8=;
        b=nvLsWymRLazGFnNPeCPY3GkThYLqpOEkqfCwxTMfQ6iFXWR4SSjnBGCFV49x/nkVSb
         ws6rM1vqciqVPgzyxxiCwYCwRo8WK+cz5ldbyAWh67q9Is1EqWBiHyDuKQU0fJaFUGft
         FW8mvumt+nIyTs4DeLbHjCcNR2mC13SUxM+S9LRyPYiiWx1kY3e6HxDnaq7FS/6pjAZV
         nRaDBLFcpTzghSt1/FEZiDmeRfXtzxJJCg9m62w+0lNIjJlmlWyvzPAMValzfy7Kg2m9
         Emt1giODosq6iG1Ja6w0sGQAXTMSZod9tTlorV0iJbYAf1eS/kK7DKHytuMdKEJmMUMC
         ZPXw==
X-Forwarded-Encrypted: i=1; AJvYcCUXssqckI9asF1WrZZ+3s/afpr4EIpO9coj5B8p4SYnfDrsxchN6aybWk98MEjFyYUT99LCg3OWro0aDr8=@vger.kernel.org, AJvYcCVcNbOpT8TvEOZwEtgJiEoRS72mDmMzzTNbIyspHutuLQbVbuPKiXcqy9IKRXsGPip/43IR2RA/KU4GrenC3UI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmP16iosWvuTdsN3OkKk045sM6x3Px/cg230zJI4JCm+1ZVkoo
	QEZrXD/E7d0GVXLJV/CJaW+CaSpbr1TtLC2o/2BmQszQ//v6VtSJXHYz9d5nQYPsCLVMET7ImAe
	HWZmEsUItAabG7vXVpgFRwAzxJHK292U=
X-Gm-Gg: ASbGncusyXDIGdPDzk+gcFlte/9Eeir1iepMVVl4vvhhexekfYlnM4DJ7ZP6Y0XBkyV
	4zd18oo4ZFJJjWZeiSTc/1Xab8SFHq57U1OebtXb7AyJ+o/clt8H3YQQJ8KdP9TYsAyZhJm15Qc
	8PsO6xQgby2XLNYenhdMR8sf7XZs1n5mitBQW8tRS8gQo=
X-Google-Smtp-Source: AGHT+IEutSGhzrVzZp353DQsvucoRhfU9Pb9eKBmICJwzNO/eIqSsKoJ9xbqFNRSpRh941H1RajsZFy9JNia6i0i1HE=
X-Received: by 2002:a17:90b:43:b0:312:25dd:1c8b with SMTP id
 98e67ed59e1d1-313f1c77faamr121787a91.2.1749830050438; Fri, 13 Jun 2025
 08:54:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612121817.1621-1-dakr@kernel.org> <20250612121817.1621-3-dakr@kernel.org>
In-Reply-To: <20250612121817.1621-3-dakr@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 13 Jun 2025 17:53:57 +0200
X-Gm-Features: AX0GCFuWyLCVdATo6M3ik_x21S8Y1NYHfUwmkMyJqdnnsONzWmYGNZz6toH3roc
Message-ID: <CANiq72kfO6qM=14Fx__DFTvdKJrn_sT26QVyK_NFEkdvunW4HQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] rust: revocable: indicate whether `data` has been
 revoked already
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Benno Lossin <lossin@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 2:18=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Return a boolean from Revocable::revoke() and Revocable::revoke_nosync()
> to indicate whether the data has been revoked already.
>
> Return true if the data hasn't been revoked yet (i.e. this call revoked
> the data), false otherwise.
>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Acked-by: Miguel Ojeda <ojeda@kernel.org>

It could help those reading the Git log later on to mention the use
case comes with the next commit (i.e. the "why").

Cheers,
Miguel
