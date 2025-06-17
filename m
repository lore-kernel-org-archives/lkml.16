Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5480C2ED868;
	Tue, 17 Jun 2025 16:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750177623; cv=none; b=m4bqxc9wxFAhhP7uXKpYUDpAAqC7VghSbo9nnPPtEX8t/qlLHpD+G3Y4A1u5HtRWmXc0mJrbkoigp70o5VczfJiRfk8OGs3Nt1IRGRv7MR8gb/SdgjUuj6eRwPtP3NupiweO6daQpH1QYlGBdv0yHEJPJERYw0YMd99ezBn7oGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750177623; c=relaxed/simple;
	bh=F51JDOYIn5h9dNZW6ihjN280RdHMlDIc7Gr1e38ZgJY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iyFgA5vNndzDJi4GUw0mxpUg1QAwIHiTyfVKNaPubbax78v78vsMI9zUIptJ6c1o6swh0lg4Egj9urvIXeqDvT6nH3o2it+gEAzNogpDgCTMXQEaBlm8Lh0439lWOMyxkC+NrqywHMFPn8An9Ko1QDarFCSys5vLX+ssp2eV8Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ffZawkpg; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ffZawkpg"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-313fab41fd5so703418a91.1;
        Tue, 17 Jun 2025 09:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750177621; x=1750782421; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F51JDOYIn5h9dNZW6ihjN280RdHMlDIc7Gr1e38ZgJY=;
        b=ffZawkpg/vy84fBqI0wJR9Q6ANdsi+rgHq0RR3YnW7Li0NkH8ZPKpyBMqPSw71RtaY
         ffTq81wwK4+AFRWyAKUIXaETTgvChs/l6NjXBlCry2TkQSGG7TGHc1/lOYpBz8ECfuwV
         6e2PZCrO3ed8X9FtaGuOIsQAtLQWKIzHvb8f17x58dqJGlVWZqOizR7WQDrniNQ9BO/m
         t2ggFdv7tNE2GWEAp3kKWm4Y74RDz+BEUz1esYd2Z0l9OkyAXk+zL94GhfBZX9iptXfY
         Sguax4WSQsFXXg8UzDRDcS1MzWgkwwhmX6mdmbUUBrzf6kMTUxC6lUyFOKmq3QoVj4CI
         +jZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750177621; x=1750782421;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F51JDOYIn5h9dNZW6ihjN280RdHMlDIc7Gr1e38ZgJY=;
        b=oL9hAq/Qa2AwxzhNTW4ntwO4ssTyKQo9nTLOroQBi7ntgG9mN1hRwOttOKE4p2GUAk
         +1uvRy/jA7J30Pr6X/BfGH1euCEj5roBNSUEUwheQiAKIMcdm+lpsxqzre+DD804by7c
         jFznilNttqrMPZ9ga9QBqfAuURVGM4kDplRV0FvLPb63Cd/9b7iM+v34IrQtuVDXfjIR
         VwzwopsjpUyD+t1NmEHxaJtNXjScH3AL8Aq2MO3oeZnDLcq9DwTrRibBJeRiI7DRVQA0
         5vCpCHTfRRW1r6xJniaAae+kdDHJ7WJefBH3R0rzYfDGfQ3jRHlj3Ks3pKYVjD3aKeib
         9c/A==
X-Forwarded-Encrypted: i=1; AJvYcCV3/HsFFSWNCKuH1KydK3Rabu9dsQ0jKPMCfSU8zhAgi7Oe8mshBfuLCFivBLC7/2P15K1F/IX9k6ER/vbcuTM=@vger.kernel.org, AJvYcCWhsM8z2xVwxIK20cWqX5Y8PsA/2VGhhX44DXLleF2/GqaU+CdRQtL3ORXvGCyGCPgm6pFWNEGZ7Ky+JUU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzK8XDomnuuZH37f+ZZwKgx1cHLKWSDrTV3HA/VeYkNTrpaA1Jx
	lpJ7dxgLXy7MXcrJRBMzz8YznayCk1iuv+/CE5Vfi4whMOd1soTQkc0rOCpgHfrESo3R6FZd0Fk
	X0rCY5gQ4ele50kKNPGf1vJcw2ASMlFk=
X-Gm-Gg: ASbGncsRHGri7Q/aqTKuWZgHeY1+yF7s2fRiMY39xHuHqSxpvm4uA36kZB7GCu/T7oJ
	K38mORavyZnnad5h3VktBwQ0U2BAgmQOR7Xi3EsIMEX33BNwa9zl7dJtXUZs4uI6pKn5D197YQ1
	oW6HPScNk35lw3VAH2F2+QL/w2+XDOM6sWY7weN4S7Z74=
X-Google-Smtp-Source: AGHT+IHcmb9NQChH3GIvkatRmyIxieky9J1mXG02lOTxM9Rt4noubdb3rJ2E/Oa0yJDcdsTQeB8KKdY9GuqMZVoqA/I=
X-Received: by 2002:a17:90b:4b4b:b0:313:151a:8653 with SMTP id
 98e67ed59e1d1-313f1de63b5mr7729221a91.8.1750177621484; Tue, 17 Jun 2025
 09:27:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616153604.49418-1-boqun.feng@gmail.com> <20250616153604.49418-2-boqun.feng@gmail.com>
 <CANiq72mZV3Ezxb4FvDdMvn=O+ReUPBx9usUahLgwTKKCFD_+cA@mail.gmail.com> <aFE0pjPsuB0gBgvT@google.com>
In-Reply-To: <aFE0pjPsuB0gBgvT@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 17 Jun 2025 18:26:46 +0200
X-Gm-Features: AX0GCFtCj839nTFDnIwha9xYGkw6_-6Cxy9wRtrEveDCzdYvTNQAJma8Z_zymNc
Message-ID: <CANiq72=mQ+JCGsfhADR6NYeyA1qrNFWfs8ke4GVEHeWX3o9jUA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] rust: Introduce file_from_location()
To: Alice Ryhl <aliceryhl@google.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@samsung.com, tmgross@umich.edu, dakr@kernel.org, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, pmladek@suse.com, 
	fujita.tomonori@gmail.com, mingo@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 11:26=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> We will need to coordinate with
> https://github.com/rust-lang/rust/pull/142579

Upstream Rust just closed it rejecting the change, so no change (so
far) needed for this patch.

It would be nice to know if they feel the signature will stay
reasonably stable now -- we can ask them tomorrow.

Cheers,
Miguel
