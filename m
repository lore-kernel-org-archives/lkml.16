Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DC51E231F;
	Mon, 23 Jun 2025 09:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750671604; cv=none; b=YvJdoF4X+yE+addi2J/LqwF3J5PcJc+KiLlr3g6QD9tabXIC7tjd6BvJS+3EmXm81yahG6lj4hUTofol2vzMgN5oZNKP/e4TV6oJZ5yza9HceO506q/oxk8pscxnzWpPpFKs9Pjv03deCsJcyFQ9cQhWlOK8kQnTt3I2Pp9T3Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750671604; c=relaxed/simple;
	bh=ZKNEJgDXO9EXRvaarNnIiZt3L2xof+1ejrRb6+1xU9E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H3Y1GLD9+eWrIcT29h7Pg7v09rs6Z7xDJNvmOGIS4B1p1Au6qPfEMVq89RPb0ZpM+qsYRNhwe3ZEql4m9Vx3ebkVdiTsHea3XcQ3qalt2tJJGgA5z9puB3aixMYkIYLMgEFZLsWBRW1ol1mNVZHvx956wJWAElXPMv05wjj/Wq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D5GaFz3F; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D5GaFz3F"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-312a806f002so347906a91.3;
        Mon, 23 Jun 2025 02:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750671602; x=1751276402; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZKNEJgDXO9EXRvaarNnIiZt3L2xof+1ejrRb6+1xU9E=;
        b=D5GaFz3Fx/Ido+UDBFSou6d9QK51XVDlCOb/zsfpNR9UH6j3aXTnQThNEt4F9yR9gM
         RQLFpyjG38RMZ5N2IaNHLB7k+/D/sOzww1RDNwvgR8AB4+vTFoeTsWsgFSDXeSWfMEhw
         /sR5KktrPyfRrCRvtvakBklQuwPvrP/f8vjeHZg6Eqxu1eglEUsMCv1SZ/rxP+6P7/TV
         /ydv0bRnW9WSrHIBb1WjCFUlpbiKCYLQsMWgYL8O8HvbmlnrPrFbnO0NnTCEgKFSDW+I
         wVcmjLpui2PeqCltqJOhj2L7JklmpjauD9VfsMkcOCvIIjgX2JOJIkOrsBMCP00rHNms
         ZYOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750671602; x=1751276402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZKNEJgDXO9EXRvaarNnIiZt3L2xof+1ejrRb6+1xU9E=;
        b=nIRGl6MXImUlZgm5M1youze7uZLzXUxuaptqi+9dAhddQwsTWMzZx/MG9hU5GQDBTm
         T22Q4W5qS5HlUdyiLOy8grNk7NJ09RphLBiWOdLwgJYNHWvyCaTrO+GfYKIWeVHshy3x
         +17adZvl9m0wZE7rK1qG3WHzf2+YfeN09Wk7re6oZegTMmxWmB04M9FCpF+a+bzPsFMS
         GJXj0TEnMrK4lh7Op8SN9b4T043UowfjjlWe6bpW32ATuHhDMAiC/rNMeklUOMFoJ5Ex
         lD51D0yTGA0e69AzeCLiNZuVzE1ROGcwqWMkosQmR0tPs7VZWDBJ1SMPTnx+4arcmGaC
         RH9w==
X-Forwarded-Encrypted: i=1; AJvYcCVP8LZ2nJZXQUuOc8SWfYGOl2zW3iy8u1znmGSkNWo+PxeFYcvqEprXVy0EEpsh5aeClAqdMhiaDIA2/949EMQ=@vger.kernel.org, AJvYcCWPAd2yxmgrayJaw8c19GIzelBYWgJCWSeI4OGKcaqFiA41OK2x8UbbCTdj8krm2R3z2Qa9btqBtPdCBME=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaD4klELenpvVt8FINRq/vEf4xUgRBU0pu1ZZhLkaUL2IFX1AB
	uTciRKPA1Vmnzz8MOZWvY4zxHMSMTJ0HboucB41oT4ZHb/G8Ypm8qnFn8z7QGYAQAQl24DBDAZq
	ZGQkKdjkNQ1PZZO1dgcbtxc3wAwLxSmE=
X-Gm-Gg: ASbGnctD6O/dh39M2pcIPQhwjgr2tO9+lgnwxCWOUh13C6c2ig9etWTFocprJIq9DbE
	hOrHaMQrJPFLJ1Ny+h6mMhH/ZJPXSrEY6L+SBSXDgtUtXFakAqP5JKkla2R9FcYPS9e5Z6ylKJF
	HxP2fuaEizAmkCr8FgdJpSHEbyV4dcT74uQWdaKQ7xLsgSqRUfX3TUnw==
X-Google-Smtp-Source: AGHT+IH6MnmjBrD69AiruLg/McFuY2Qa/akCLl9ekRAN3hnV277++V8+pu0fSU+UkjIkm+NTuQl6CXaYftb1wNgR7f4=
X-Received: by 2002:a17:90b:2dd0:b0:311:e9a6:332e with SMTP id
 98e67ed59e1d1-3159d577a7bmr7206435a91.0.1750671602464; Mon, 23 Jun 2025
 02:40:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250621230231.100181-1-contact@antoniohickey.com>
 <20250621230231.100181-2-contact@antoniohickey.com> <CAJ-ks9n1SqM_1xAstHQpp8Z7-2JSTkp9zUn8kwZA7OAAqWxQ6Q@mail.gmail.com>
 <20250622222023.29071-1-contact@antoniohickey.com> <CAJ-ks9kDTjw7ukrErWgS06HRQ7d-gAsqzzgAnQC92pi2xLFdBQ@mail.gmail.com>
In-Reply-To: <CAJ-ks9kDTjw7ukrErWgS06HRQ7d-gAsqzzgAnQC92pi2xLFdBQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Jun 2025 11:39:47 +0200
X-Gm-Features: Ac12FXwnDiWG7z7SLhB-An4b96jyohXb_jDXhZcV-wlQJEN52iINnecBitXiMmo
Message-ID: <CANiq72npbnkZKpELET4GoGWHYhb7cowvxCoQaxUXL5oZQ1Q5wQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] rust: kernel: create `overflow_assert!` macro
To: Tamir Duberstein <tamird@gmail.com>
Cc: Antonio Hickey <contact@antoniohickey.com>, a.hindborg@kernel.org, alex.gaynor@gmail.com, 
	aliceryhl@google.com, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	dakr@kernel.org, danielstonecote@gmail.com, gary@garyguo.net, 
	linux-kernel@vger.kernel.org, lossin@kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 12:54=E2=80=AFAM Tamir Duberstein <tamird@gmail.com=
> wrote:
>
> Ack, thanks for that. Still, I think the "any expression" version
> should allow the caller to supply a custom message.

Agreed, we should add that, like we did for `static_assert!` recently.

Cheers,
Miguel
