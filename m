Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0061DEFDA;
	Thu,  5 Jun 2025 17:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749144185; cv=none; b=OYwtnxzacroBXMZy/HLxKYcI7QzsBAo8xPdhJqVay7XHMoFwUHmG2Udgf1Bp1+eM6dibhCHhzvqD2R/6GRENyafZ12F3HgjDVgA1Rndz/6QU0nEWwzNchAsk22qVBcMhjSGyA06n62bDH4CobPHxPhBBwx6j/JxVBxPFvJYZpYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749144185; c=relaxed/simple;
	bh=qfipMnTx7xeKxeo0c7dR7MpB300bOpoEqcpahufYAl0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rKStIExpfQLhGS9I+elDyWMQxwWCAKzHC6Fd4IP8Nr0l3MXaG8bPdUrpwpyPOLfQ6hyL/yUel27JgpFDQ0OzE7aUYOCxlRVNWWY9S3qD/WhEWf/UwGINHKZhTgiQxRrMf/zxTbae4m6RT6I8JPaFvtU8ml3jskTZpFjpJLw7lN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kjt27mKA; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kjt27mKA"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-31308f52248so168427a91.2;
        Thu, 05 Jun 2025 10:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749144184; x=1749748984; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qfipMnTx7xeKxeo0c7dR7MpB300bOpoEqcpahufYAl0=;
        b=kjt27mKAqemjrmRTLU6Yl+y3Wsca5uipYqg4LJ0mRkQyz8nOjeoiGSWoyzIqO68nRO
         BlA7+LRNTi3DOQ8yeSkALHAPJBJMQ5FhrvdR0ep74fbaphl/z4oCqvAnYpURAjTm3NHS
         3eyDqzZtx5nhhQwTnVxwAzIzGDXVd7oX+Nx4E6EWe8PVzLRtKE5fGR0U+b7EtxnaR7Ay
         OlKV5fh52VIg1mDjalwq3ezDO/7gGsaetmFGYWrV8PzScekZERWoAefa5py3XZRJaIbu
         rnWjYrrF/XZF6N2ZsOxifdB8ZnWpQtdFok4uV7ubp0AB9RVRNvm2tclZ3ltdrMho6lfr
         hrzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749144184; x=1749748984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qfipMnTx7xeKxeo0c7dR7MpB300bOpoEqcpahufYAl0=;
        b=CNsMM5TJPRuy71x3aG6PU5BQ8kaiJ7yOYytyZRyxQaghf5QHi/QyxRC+eqFRFL9L3r
         zASv+Bx1MNYeUXC4cpF3Rw9hseSYlLQDl7F4/c3lz81czL0OWQk7Fd3lQIdM2/63cTsE
         LSbBHuqMZrP+z7V47yDOmWlerW5Sho6C6ELkvYFr7sUKD0g7s7E361+/bR9z7tWK5gBa
         ttgdBn5ju26gjO2PI0CPOCsezE1t+1Yk67Y5pYz+P+uAj7JWZV7oYG5r+I48bVRzbJa6
         9RucL3+BPkcQo6ehBMW3+0lHcGy+Rx26j3yb9aXc9d3me7+GQ13krKsq3iUEebA3DSWw
         eMSg==
X-Forwarded-Encrypted: i=1; AJvYcCUxeQyCstxm3DD8nyh/KEkPE6tCSGk2BO0P85zPqxDYg3CFIC/dxuixllN1Ks0GOz94zw+1EPiUSVssE1ne0A0=@vger.kernel.org, AJvYcCWv+tAP8SDCNrn74Kk/MBB/Q2v0KBbY1OTC8HHQgjcrLMbG6RWmHlo+0tQw2m3Ok+ZU6RtwmFVLCtXiOGg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKVyOcfoDR/qHilxlFhMnHiQrUXOzOk4FEODccMqmdM/oxzyjq
	h7zhXsvNiVMTigenlb5GkoOowMT7TDahEBDt83Rva8UGjnJvR9XbzQ8plHvnU6ZILufV9XQ52EB
	6oEOd/rlTb+RX5NrAUA6QDtfnZhdoX0E=
X-Gm-Gg: ASbGncvAtifu5qIPQ7zpSerJjmofvrjmRHQ6lkNQclNPbfJxfuHZSP6tC8xNmyVCcnU
	QmmEHye8OC9suInVKmrgLitwGAz1SPYtItXUBDzJQdqRxzv1epdBpPLCpTlH5nMzdnJ/FiYoYq5
	a5IUSQowRSnQPbH3MlJGGT3EndZ93K3rBBUFdaIWIrzIQ=
X-Google-Smtp-Source: AGHT+IFL93Dn+JPYLvdJ97OS1e9Y7WI8nNfScy/BvawuaHEKEfXx1cgMVsWswxX1DXxUVjKFqj43r25VkwIzBxqwwJw=
X-Received: by 2002:a17:90b:57c6:b0:311:c939:c855 with SMTP id
 98e67ed59e1d1-31347a28f5dmr221166a91.3.1749144183617; Thu, 05 Jun 2025
 10:23:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250511-rust_unsafe_pinned-v4-0-a86c32e47e3d@gmail.com>
 <20250511-rust_unsafe_pinned-v4-1-a86c32e47e3d@gmail.com> <1553eea9-9ced-410a-b6e7-886e11e2edba@gmail.com>
In-Reply-To: <1553eea9-9ced-410a-b6e7-886e11e2edba@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 5 Jun 2025 19:22:51 +0200
X-Gm-Features: AX0GCFsKx2Moxjr3HRPaNrk2wzvk9Nc89fe4Aa5PGppcA4ASb7L4anzao8sQk4A
Message-ID: <CANiq72mVuPex3fLd5n8jMtU30QStLs=vhsChENdX1hGhA4KKpg@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] rust: add UnsafePinned type
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Sky <sky@sky9.dev>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, =?UTF-8?Q?Gerald_Wisb=C3=B6ck?= <gerald.wisboeck@feather.ink>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 7:03=E2=80=AFPM Christian Schrefl
<chrisi.schrefl@gmail.com> wrote:
>
> The upstream rust PR [0] that changes this was just merged. So now `Unsaf=
ePinned` includes
> `UnsafeCell` semantics. It's probably best to also change this in the ker=
nel docs.
> Though it's still the case that removing the guarantee is simpler than ad=
ding it back later,
> so let me know what you all think.

Since upstream's will imply `UnsafeCell`, then I assume they will not
take it away, and thus we should just document it the same way, so
that eventually we can just alias the upstream one.

But that last part can only happen in a long time, when our minimum
upgrades past 1.89, since otherwise we would lose the `UnsafeCell`
with an alias.

If we really wanted a type that does not do that, then we could have
another one, with a different name.

Thanks!

(By the way, please try to trim unneeded quotes in replies; otherwise,
threads become harder to read in clients such as lore.kernel.org, and
it also becomes harder to reply)

Cheers,
Miguel
