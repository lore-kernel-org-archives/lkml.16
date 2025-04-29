Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D656226A0AF;
	Tue, 29 Apr 2025 20:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745960129; cv=none; b=Fbt+DOnJdRFyEA4BALZDdEjP4+oSlyD7lJ/JtPxBebgrGSJGHe2ORbLXjxZ0U7wIVgu1eryyyFOaIyEcfw4mPkvG0WEUsJdhd4Hy55hNdnod16e7J4IFxF4Ofr44SEZDI3GxKvq4HfhWrGYnobYocMDWj6JwIPYdSU5BRiF0w3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745960129; c=relaxed/simple;
	bh=IZs2KyUF8bS0s/zuWlAY31QCI/5++IyvP6JYPZiUZxM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TDv0wLr5UExfQPJFQhCe72ifpzH6j+OEfgOAiAbpUhwTeMJQ/obkwK/3QNR0CJ9Qwe6lSHbGFMIHWdXGXOjEcXJQS7Op6Id1WKdOtS5rXUG/8PIpbF3GNHcKf1LkeR8mQ1zie34HZYFFRI8X+/INN2OHLpReCDYQ/580XaTmCJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bk1YJhZx; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bk1YJhZx"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-301001bc6a8so683544a91.1;
        Tue, 29 Apr 2025 13:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745960127; x=1746564927; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UjZP7SKGa/lOiFPGy1gvEcxP3gLkWXackph/rj10uQ0=;
        b=bk1YJhZxyYDdle4WEA2t2dDw4gFHaY7mK5JbmS0jdvGz0P7LlAyIn8UgOJYSmNJUz8
         N28EgMROzuDF0Ohjk+eWwYVDZX7wtVXlSBIR2GVxzF6HUFKJhiZ9f29XuhKpSvVEtDwP
         ofTiV/crF/b7ifbdhE0563oI94Nqci/BCFnstMtmg30wtk7+JMDEoZVSuhLZmraBWzBO
         B2sI0IQKNce+yudVjlbqOZizucMLoCJrlEkEz8BswHVLlk4RALxDbHXmynhQ72gcqq2x
         yma2FKZha2QOqCM3XEeqMK3vtiHjtrywfUXfyaE44ewcg03ELTYuQqnGozqJPj4fuVe4
         XCWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745960127; x=1746564927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UjZP7SKGa/lOiFPGy1gvEcxP3gLkWXackph/rj10uQ0=;
        b=FP+coy2H02GDc340xRDcltxgWsFa+iVgpxeoB1IE1dxf/UAmml+poKAj2JydzhYAU9
         C7XSS2d8zHfX3wfs6l4x3tzgfTtncjTuD/GNW+jfyoucgBfZVTat/IbkWNPToOaOAfFp
         T6Y7aJqAz64DQ23s3Y86mB3s+EiH0dNHoe7rDzgevm1iqvK8HC12kSNiT8I4dv2TEwX0
         Q87pGkqE4pE/r9cmvtBOrbn6qxM/GnIBAdeMsXWaDqPaj/W9ysDWjnlKRvPzH7bHRBrh
         /rC2enkOz12TKIzf5qUlXIgkUlYYjccdSthyF+z6FDGZjICqt5PLwek7FbCrJ9SmKytf
         rrVw==
X-Forwarded-Encrypted: i=1; AJvYcCU33XyNlV2+zE0p0vbUFKDTn8lKQtJ9NLD7elwLNsu3cS5CKfmKW81KIx+ipDfJOybH8sCViHa4MoOKH2qa2wk=@vger.kernel.org, AJvYcCXqm22XSn8t9OQC9GV8StvANc50Il0MdQ8H4hMsb+r4dJxk21kNbn372MZco16uFSqJQMM74eCkK8sbq1A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrgN9LImV4oO5VAY6Tn0tfA5deuVXHJxN/MLqqM5rlpOKNvf6R
	yCWCdkgtYw2mGp0qQ+uMZ4MHm7JGCimBuIjZu/1hYwZ051OZWcWkMeQvgPO2qFLnevUERiyaa8I
	v5NHkjSW9iYMNNyna00W1Y6cuQRw=
X-Gm-Gg: ASbGncsLxGj6oVWvmiMNI1Wg2kiZlAFxf3nGaTqXuKN2RISTjR5XeLICKsuMfMwNiWi
	owr9G3ZbtA24F29WLlFlWRGOCHOwJP3hZI2inZ4bolY7FJQYFjMvV6ffjMTUHKbgoBKMxPz7CbL
	hTCXi6z3pBa3OrrQBpsFoGng==
X-Google-Smtp-Source: AGHT+IGI3dWf454g2VdZ/hQyML1L2ZQp6KDpNjEoyxmmQcm0gi99/QVHYQdS0+Pj2cdwsiKT1rby++mWtgctqkFSWAE=
X-Received: by 2002:a17:90b:4c08:b0:2ff:4b7a:f0a4 with SMTP id
 98e67ed59e1d1-30a33353d61mr267847a91.3.1745960127037; Tue, 29 Apr 2025
 13:55:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-rust-of-populate-v2-1-0ad329d121c5@beagleboard.org>
 <aBDi2LE3O1rIsGqn@pollux> <2025042904-trade-leverage-0f98@gregkh>
 <aBDl5oRIRpwbPrC1@pollux> <2025042945-aviator-subzero-0263@gregkh> <1fda026e-9ec5-46f6-84e8-4111263350ff@beagleboard.org>
In-Reply-To: <1fda026e-9ec5-46f6-84e8-4111263350ff@beagleboard.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 29 Apr 2025 22:55:14 +0200
X-Gm-Features: ATxdqUFgHa2NcB4YFc2Tu-9aQjvYbll4GB3mHRim8TaNqk8ZJzd4m5hF9EGtzXY
Message-ID: <CANiq72mqY1wxJmeSx7VNiSYz7rNk4c+dZ7ve6rvjM+kLpnWXXQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust: kernel: device: Add devm_of_platform_populate/depopulate
To: Ayush Singh <ayush@beagleboard.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Jason Kridner <jkridner@beagleboard.org>, Deepak Khatri <lorforlinux@beagleboard.org>, 
	Robert Nelson <robertcnelson@beagleboard.org>, Dhruva Gole <d-gole@ti.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 6:07=E2=80=AFPM Ayush Singh <ayush@beagleboard.org>=
 wrote:
>
> I am okay with maintaining the patches for Rust side out of tree,
> because well, at this point, it's a much smaller list than the number of
> out of tree patches I need to have for the C side to be able to show a
> semi complete connector setup anyway. And nothing is going to be merged

In general, abstractions are not upstreamed unless there is an
expected user in-tree, i.e. the relevant maintainers already need to
agree on merging the user, and just having something out-of-tree does
not count, see:

    https://rust-for-linux.com/contributing#submitting-new-abstractions-and=
-modules

Thus, given what you say about the C side, it does sound like the
first step will be there anyway.

Cheers,
Miguel
