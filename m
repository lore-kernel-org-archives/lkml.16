Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8DA1B412A;
	Mon,  2 Jun 2025 11:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748862693; cv=none; b=J8n5wBmeZmPGld3tPZmwrflWxUy5slgLyHRlVaJrRhj9ZwC6/WEPsbDqHyhk/+QdGaseCPYRDiqOGbhdZQJ+3zQuqXTSS2WTzxv7i6aPE4jM3cE707f0qiTm1HAGgBqAWpxevCCQQ2KSdAZ9EvFidrg0AH0LQdpmU9K080ZHZfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748862693; c=relaxed/simple;
	bh=SOjGNSW14/xBT2UsSSuvfNWvvNMcBWixS2oXTkx416c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TG2cFqGEBccd/xwp2ujdoqAJGUnBqJZMRqIZJ35e/t1A0I9Pmy5ds5zVq8owT/6wqK2CQFQaCyiA7Sf3htubWa+mK0t5aGkuZbAchV4ACJ8W54vDXWZZ+gW+RGx+JdohKDu7M/CLiXzzyIqlPiVmlVV8hJb3Ub+tIioVtc21zIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JkbeG9Lr; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JkbeG9Lr"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7406c6dd2b1so4163530b3a.0;
        Mon, 02 Jun 2025 04:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748862692; x=1749467492; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SOjGNSW14/xBT2UsSSuvfNWvvNMcBWixS2oXTkx416c=;
        b=JkbeG9Lr0KKdtHoUIPMFDfWIcRfcjwSB08BlWI+0222a5aeepREsAvdL6x86AD3rS6
         yvv1l5yGhZARcuzDL17ifT6+M41CClAWrmlwSNqbB2YzCaHNirRgz/TBqxcOdTsp66hE
         KycpBZjlhKfyjOLY2/o9f1b/q6m5rhP0lO3Xz4KKt6YCtgjF+ChiK1jTpdU+mMnCfFfF
         YihhfcB4C8VR6pwaGAU+Az+j9PYki9hxzI+dX5EeG8IlVdfy79U4I3W7DmYHzhkeer9Q
         8BnbScxdx5IujvWYiTdthFVcz/zzh4+IDMDJSvhcsRWvjw1HJVGuSwxM3neFYeA+9EKb
         jljw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748862692; x=1749467492;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SOjGNSW14/xBT2UsSSuvfNWvvNMcBWixS2oXTkx416c=;
        b=ohcsAEITWFw8xnNcYQ6LYo/HFirQIkVifjzOE3PJuWnIcbDN+fhx9zjsZZ50NsrANr
         0c5p0aozGxZDSZc4AojRnmwSUJzj3Ipv37+D+7p7LHvE9KpuIF5pJrJkGl/8WbPnpcCE
         byY96B+Elr7xzcWv2HC5MLlyQa40oYexw2pxObNskCM8ZDP1xwj+rrWeExY/NJOpUAM/
         RwNbYCxtpN+84EFLjqTdZgXq5u4nO6Fli3xfQR6GjNwa6b70lYCAoJqK7FB5Oo0BqrqV
         GD56WQoTzfrPTt15xyk6ln6lKRhFH7K3/zew5E9HBKsM81SRH6CKE2hK5oeYL68pR+W+
         4Nyg==
X-Forwarded-Encrypted: i=1; AJvYcCVI3ni3oGreT4wplcwZjxom1Dfdx8vDnFDoMWZ03ehlEQDSSVB1jfFLgUxUCejI1cBO8HUnqAmFj1rGfZA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmgRn9Sy88l/CLekNqmtMxU37ayIzrKlM5IibrqIGW4i95/+/V
	4ETHICEJIyQdpNmCUe+RIppMe3CtGDXiMpCih79Ih9tnNitObByubQ88LXcil+45P4SOnz96Ujx
	XVuBzHUpdTGy2QnevxgxCdniG18ysrJU=
X-Gm-Gg: ASbGnctvLIcjzAy4Hdb2e1tPtjuB3WrHCGPu6ElOT25q7AMYlcILkT3GJa5Y++dGUjb
	H0IiQV0BO2N+5XXbppkTGOXJ5y+/Vkb5lkls5Ry87tfbYgRKQ6nSTD9w8/7/ZZDsi44Gkt86EHN
	0YojGeOFuWjpWgfo4YR8eulLXk7U3CPSwH8mmYGX9PwSFQNlxP3wl9QnsR5/iPyAAQgg==
X-Google-Smtp-Source: AGHT+IEndQjLdhiP6A0nQ6vA7U2d5miDEZEf1JYhcaA1W5PWXcjW92kStxqRleNjUCIRM/jEy5sYYGpvQDJY/zv1Dxo=
X-Received: by 2002:a17:90b:264c:b0:311:1617:5bc4 with SMTP id
 98e67ed59e1d1-31214ecdacamr24038231a91.12.1748862691728; Mon, 02 Jun 2025
 04:11:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602083119.17752-2-saivishnu725@gmail.com> <2025060244-dragster-unknowing-23f0@gregkh>
In-Reply-To: <2025060244-dragster-unknowing-23f0@gregkh>
From: Sai Vishnu <saivishnu725@gmail.com>
Date: Mon, 2 Jun 2025 16:41:20 +0530
X-Gm-Features: AX0GCFu3T3OR2_GG4ZzL7Loc9bKzO9dhY9CsI7icXQD9dgQfxG219UDY6QCd2ZY
Message-ID: <CAFttn56vNVcE=pcGgxGrSZf=r=h_ceFwEf+D71yc9GnANww5Aw@mail.gmail.com>
Subject: Re: [PATCH v3] rust: doc: Clean up formatting in io.rs
To: Greg KH <gregkh@linuxfoundation.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, daniel.almeida@collabora.com, me@kloenk.dev
Content-Type: text/plain; charset="UTF-8"

> below the first --- line

Is it the one below the Signed off by line? To get the complete picture:
1. commit title
2. commit message
3. signed off and other tags
---
4. The version log or any other necessary comments
5. actual diff
---

Additionally, I suppose the `base-commit` tag should also be placed in
3 (above/below Signed-off-by), as it was added to the very end by
`git` when generating the patch.
I am sincerely apologizing for taking at least 4 versions for a simple
fix, but I am trying to figure out how to properly create and send
patches.
This clearly explains what you meant:
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#commentary
.
I will send v4 after thoroughly reading it multiple times.

Thanks for all the time and patience!
