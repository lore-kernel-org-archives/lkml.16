Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D9C280CCE
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 09:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750238592; cv=none; b=qFCCv3IaxNzNZVkOitMxqnCWxKLE5RDo+Hy7QiHSEV15mO6rRr7pZ9j0HWUD/mxvhnvo81q9nygEhoLLD3trv7JzoWh+WXb1g8va+Z9nOg3We7V5QBfdLdP3KvUeYXAslVksbVOmEPchqZLPLRntXKLT3j/psVFo2RjGfqo5XEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750238592; c=relaxed/simple;
	bh=zTuDs6bz1pawzmQ/06qQ/gHnfbRQbq99TmjUqF+L6RI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wf9aAtT0R8BYYEa4GegumcWbdclwswDypUc29Wq+SxfNPe8zQMGRVJkyOQKadBRZtDktw9gqpaggN0w/g4IWROAqqN552ne7Yd35X3zDon8p7D0S3hTj15EjtzORVEKfZSlrxiZAxc5F6qy948wuroY0finYKwjBZmOGZeMrmwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xjqIY9UP; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xjqIY9UP"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a50956e5d3so5312853f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 02:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750238589; x=1750843389; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zTuDs6bz1pawzmQ/06qQ/gHnfbRQbq99TmjUqF+L6RI=;
        b=xjqIY9UPe1GKtHdSLku3sTgzkfCKqYYp6UpyAnBKU9nz8dlisM2j4bHUywZI9/S3Kz
         O8HOyUBIyJ6NIpTFysxshM6mXz3NBRAe7l/WE6ikDFLkoZLFn4q4hfg5W5CFqZNF+6yL
         q1vVDOs+0jXzGqtPrfiVEBaFcIZiuqjZ+1eczDIn86QKWurFsc0oA9z54rc6poBMFyhp
         WrYESy/KVivGeBVrUD9wCXIe/O5KGGsAwWkx+HyPhw06WogJhfISf373k9h69FtobrYk
         J9zLGHvYVMqhTZuDsV6K7+F9l3OfZCk/KH8N48Ch/r8fNWV0bVoMdzE31OYzCo5t8tQI
         0d7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750238589; x=1750843389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zTuDs6bz1pawzmQ/06qQ/gHnfbRQbq99TmjUqF+L6RI=;
        b=JqvAy8HsLeSCvml01D6V8yA3XK5IY5d2AAIYgBY0Wv4ealJ8g/KNw4UOL53686+e6V
         FCD3XytgofWXHx72luIxhiYxin+Qn19JTC/yvEqAhyJp5tpfwlZtsBED6v0HIaJcNN7p
         z2kSG108ivccj7V7uFnT4//7Umvcsvcp5yqsa/wZOo/p8YwFW5AZDBGNq6RjJhujijZx
         yDCIKrUNaG4eBmMzKGqOqrGDAgWfqgf5oFlTtQ7ldiLvnp3Yn1ktIUMUCl62b9A5DJJZ
         oT6eQilUcwFWqir/K/ZaKB9jwZvac3X0M/MPobRPbuMt6s95X9tL5NRMm3jlQxzMXpw+
         dDbA==
X-Forwarded-Encrypted: i=1; AJvYcCXJFq17bvYHO+kxzkGGcQCEupQYddqPQgFIb9jWYVGNHHipZU9gJwLz0eb6QtFBDIwB62c94vcdKFc+uOY=@vger.kernel.org
X-Gm-Message-State: AOJu0YybT8/OrfJE+A6tQXGMRDronXy8K4pySispnrYq+HCMYwRzqbXK
	+D53SIMPnTBxHhmvMrt3fLHY4ZmIDWRHRgogpU61Gh/XaUV7nBtgtp5iaT9yA7fijMctYgVAfsf
	/VREv3uTP20qHFGFs785MRrBC7eI69f9EvpoRZaA/
X-Gm-Gg: ASbGncsrQhotsCuexXww8Vq3kxtJX0Ygjjimrw4skQBdvmMK0vSDGFBv2Y047RQDflD
	uRWPRl9hrjU2IhoOBIdPEzx5iLqNlHkiPffoXlwpIdokNEA0IS4x3JT74elWpMIOfjzU6z3fcIY
	RoI85mQOz9imDf8ImyWi++wNw2lRzuxdtsNcWD+eQZvIU5GCjDBPpUMGB/N667c4EBoc1bDrDpY
	t3tWaeorAkG
X-Google-Smtp-Source: AGHT+IFDu55zBpLTjN0YBZ0/8S08wBdjH+mMHocco39YXZmhbhmmSXQ5wtBu7D5AZ5XiCHAHE2Mwh0RzhSUyiGnz88M=
X-Received: by 2002:a05:6000:310f:b0:39f:175b:a68d with SMTP id
 ffacd0b85a97d-3a572398e87mr12580033f8f.11.1750238589173; Wed, 18 Jun 2025
 02:23:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250618091442.29104-1-work@onurozkan.dev>
In-Reply-To: <20250618091442.29104-1-work@onurozkan.dev>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 18 Jun 2025 11:22:57 +0200
X-Gm-Features: Ac12FXwBWm2g1vrL71ZUV7peDg5fj1BZheM81_V76WXGGFZadcayIxH6T_7o4k8
Message-ID: <CAH5fLggmDKjis3XSW16_E0motkK98KgHEYq5wcJHekai=Q1tcA@mail.gmail.com>
Subject: Re: [PATCH] rust: make `clk::Hertz` methods const
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 11:16=E2=80=AFAM Onur =C3=96zkan <work@onurozkan.de=
v> wrote:
>
> Marks `Hertz` methods as `const` to make them available
> for `const` contexts. This can be useful when defining
> static/compile-time frequency parameters in drivers/subsystems.
>
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
