Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBF229DB7E;
	Tue, 17 Jun 2025 08:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750147357; cv=none; b=Xe2VajlXdRD1tokNM9lzkDl+TNNncInXnU9WdYCIVpYtzvdcBbaU+eGkEOzNOQkQQWfUM85wKK6/XjoD/UXf3yCfqQJZbXxaMBkZsiXjy7A6PMr4/3T/T5pepYltxnBUr5XIPm3tGaDNERgVdIT/fE53QtDWio5ZLKpJ6tBiKNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750147357; c=relaxed/simple;
	bh=YowyLAJdvaGSFtQcwvYz9C46N3KUQ87WRTTq4W0CK+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JtR4LGjvFUSLRzGWYuSnPBAgnif7WEFLJljrPSnhLBeM9m7118q8d4nQjmjGg3z9Ji6aBhPegPk+eNkm7ujRl+8z5U7gmZHKivIibC9/Hqh1s7kJFqI4ohxfZjodrkyKt+zttLJ5PxpqKp+Mt84JnmDHvYiQh2NdamXSST7mgbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WkLEpF1x; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WkLEpF1x"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-234a45e69c8so3835025ad.2;
        Tue, 17 Jun 2025 01:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750147355; x=1750752155; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A4QfHLbe3t8h1nBqhkMwci51K0hGySst45gh0x+/MZw=;
        b=WkLEpF1xbTf8P56zR4BwClx2w6uoq1r45E9nnXmQR1F+G6tSsYOubMI0g/3tX7RTQa
         DNC9QW+PFPNDkcv5tOL4p3Iif3RXUPVK16SfhMc1OKXDCFIYbrPeqWuL0YiLUC3Jmv7T
         pLmFzu6EgNBjIEvNBobDi3TnhMmG8yAjpcxe+xVb3nWeaY7TO/tpruNGdEIaHf7U4OU8
         bC80sfMgmAaQ0HhVzO7IjHi8v23iHBYpJd6zUhBRIbz04f2lPvkxcH0A+k/BJMAFRzqn
         mVZ1LwCalp8Uv1a/9y2Po7t9U4mhUjkaZVr4MIjm9++Kg4hIfutpBxkN1hb2ZXK80j70
         oDoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750147355; x=1750752155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A4QfHLbe3t8h1nBqhkMwci51K0hGySst45gh0x+/MZw=;
        b=odneEzD9x2iAzFS9+ee5rXOA25yV1zS6jS/Fa7nqUixqFWaIlk0i4iwMLPpAMFVTUZ
         mEqO75YDHNNcyd23IvqxTbJvPy96qTrmaftpgSRSWg3voYTyGwKrPPnyDshYasHcaOFw
         ng1HczrQHfUleQ5COT1SfpOOERNr6np1cnF2f5+tSm+Ah5gdislXeIfeCpi81OTDp/+e
         U5vrSP1TWEPyRVm17seXenjef4KsjGr9DZzvzbtAlCMa/OP0qg8vOKdDbLbqpNLtGjhn
         Lu8UzOztjgJg+QhNcPSk1XOkPzjTcnxNB7k2vzgSUbW4YRNs6g4NIATeRyeSIf2ywcaN
         bH8w==
X-Forwarded-Encrypted: i=1; AJvYcCU4LGQQAxnube6Lh3r/LBiVCQwaKL7V7hacTNNnCWeG2ceRnBu7JkyI7fbkeAzFXA5PXgXPWiQ97PCTTcTkS6o=@vger.kernel.org, AJvYcCVz14Ged6GwllQk9aXuWYKqq/aH1uBqkFOb1URyIo3L0TYtYz7I8Y2RgyHEE8Kf3LeCJ5l9VMxI2pd7Gpo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHglo+1ZPPgSg34S9o/RDcB7CQanQqntcFiLqIi+HOy/HqCchq
	dWWdUkNlgYgBnZmPAdlj1sXBmWyukQn3/Qp4hM5oXk62zdHq1F4tYw4LoJO+MbpLJkFhMcG1RoP
	qM+emqGj3XjQ/KH7TpTlgvCt9Auor1Po=
X-Gm-Gg: ASbGnctkgkDFboqWt34gvAwdX4OLe4T4dJ7+F1M2NIL33Vaa3UAAkXy572OI3NfCi50
	hflYXVngTgmHBC3AcK7p0+vXBIr6uKDj9O1A4Y44zwya5ge14GJ3XG7lqKlowXyUZBa2iFiuMhM
	a84r7mse/FGax8bzHDc7tcr/BTm1IS8kzdcDk0wiCZSIw=
X-Google-Smtp-Source: AGHT+IE9Y1Quhv3vHwJj61PiVkeCG9+l2m52l/QkhOWmDyJ1PXuCBt8XYd6aMaToeAvNfrbJRLedUx778wvZOgZkkic=
X-Received: by 2002:a17:902:d486:b0:231:c9bb:6105 with SMTP id
 d9443c01a7336-2368eaa6b5emr15343475ad.0.1750147354863; Tue, 17 Jun 2025
 01:02:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616153604.49418-1-boqun.feng@gmail.com> <20250616153604.49418-3-boqun.feng@gmail.com>
 <CANiq72mES+dPBuhsdh0-hJcV69AO74j6W5vhCeo+yV5S-Zp+yg@mail.gmail.com> <20250617.120453.1403624234989149033.fujita.tomonori@gmail.com>
In-Reply-To: <20250617.120453.1403624234989149033.fujita.tomonori@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 17 Jun 2025 10:02:22 +0200
X-Gm-Features: AX0GCFshvH8jdS2U4z-D_S4Wp3zw2WqEku03xiGYr0kIDRQ98ngBwep5D0EjCnA
Message-ID: <CANiq72kB4hxsyi9D-PV0YDc9KEgfC9iYCTJVEOosZv3fg1+mYA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] rust: task: Add Rust version of might_sleep()
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: boqun.feng@gmail.com, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@samsung.com, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, mingo@redhat.com, peterz@infradead.org, 
	juri.lelli@redhat.com, vincent.guittot@linaro.org, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	pmladek@suse.com, mingo@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 5:05=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> How about adding a link to the header file where the might_sleep macro
> is defined, like this?

Sounds good to me. Though, for APIs that have rendered docs, we
typically point to those instead:

    https://docs.kernel.org/driver-api/basics.html#c.might_sleep

(Ideally those kernel.org docs would then have a source view
themselves, but that is a different problem... :)

Cheers,
Miguel
