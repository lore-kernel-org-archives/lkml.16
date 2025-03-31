Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD52185E7F;
	Mon, 31 Mar 2025 18:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743445113; cv=none; b=Vp5OB56EY6d6J2t6FaYAJumWMUO50obeK2bRinXk1E5utDjG+uQeKrBQ/XCJXvEAisLWQMEQXtgMtILrtx47Z7iTXQaKfepgAqRKR5sy6jrE8cvfOx1ievk7Ftij5kqCyli4+24clO5aZg/OCyix+KuRV8Q/2A6P1l+32oMDtNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743445113; c=relaxed/simple;
	bh=ag71ifjZzg5FtcedMq8WZUNAbJVBfWlLPZBgihIOLRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=obXX1Wu+8rNrXrGGEaJru4lV3XQzwaHCTFtMj0zFPtwCSn3It9Z3peLZa9Ewqz+Tg/rh1l74ctGKhL0Nug7052SbtsonujBcQRQQymlClyYswiZqVougiJOuZfhCf/FT/Clo3b/DvEJ7GzpOvm6yHwJtJYLb7ReUmh7kF1UEHgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EI5/g75U; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EI5/g75U"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-86d4cb6c401so246612241.1;
        Mon, 31 Mar 2025 11:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743445111; x=1744049911; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ag71ifjZzg5FtcedMq8WZUNAbJVBfWlLPZBgihIOLRE=;
        b=EI5/g75UMOVHK+A/RCGpaJpJoQs78Jt0XyBW9P1mbV+3csyOmtkMDLjiogOjXjYbLP
         I1LIpWVNhKBlS5A8HPY9kuiqhDzRVUOGVEitFfZsdnPXZqvFV+UJsCnl0Y30FHF1jHR3
         M2ZYO/o+4LdhspRGnAtmXe3zBuW50KlRKHZ00U6P3IOwO4/05jDn1eo2a801x6fk9yor
         Cwg18HP9PqDSjoi8s/igaK4Y5d4jsOLpbkw+9LtI/u9j7keuBSrsOCHt8XaGg4ph07L/
         gTacYRbmUfx+8a54q0GPknzO/rh/Xtr6qQaLCZ5yCA8nlzdDF38GL5oypdesjWhZowiz
         uAvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743445111; x=1744049911;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ag71ifjZzg5FtcedMq8WZUNAbJVBfWlLPZBgihIOLRE=;
        b=LZSjtgqv0aQe8Gav1OPx0HhFq+tDCuxB6v6f7XvFW58OIL0/eJx5W2163vOBjA3E9+
         v33IdSnqZH1GZD6/qvKpdVKt7XifMvwxPipOcX+ob8naVW3RqKQsNJmzo3P9L+TLDrsw
         zKiIqXLntkZLLiXGWqhWmlTevFl92YutfC/Qq5K7iiE3Al9nBgckQnXfLOpYvdjyHVMV
         a/eABgzD1wjV5r9z9nXa5WE8nqz78HdobWptyaDRYMPqjEZC7q2ZSS4rwTi3dVWmADPQ
         WPmwUqlKGXO3Q1oJzoZhKoee7uB+74xQhhjsqE5luB1GnzDI/ZrXPjevdfCrocHiutaF
         M7NA==
X-Forwarded-Encrypted: i=1; AJvYcCX0AuvwzVlbLpmD4kDTroaB1OhIykFuv0l7z7cHYOQvIGgqr4ODnS1xD00PrAT2JuSm3HZ6/odAFmURgeg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz+bbhzVZc/UAT2Q9zROBXhsicCEi1ieD/YSZk24xbveZren9n
	kWawizStvaE44MEZcMOT15GEe5maNfR7I9oQhhTjDy9NgenXYTlMbOOoLA5YDrSLHfYx1IhLLSO
	YS5bBGwCB7gEybB/ebloJBBFi8Ik=
X-Gm-Gg: ASbGnctqqnv88fQzN763nzlP8IcKLkhhUaPCXQLpR9ZAipSzVDKQo9hkQTuy4ZGvcSr
	4+HQDdfYAMGeYRPCLhFStNOixOn5Rw/Q3REmKlfzFZgZ+DTpuCkwfVfGFFYzwJZGZItaUHsgTMN
	Fqr79ObSb9eN51UTKimsJEVZtnAEI=
X-Google-Smtp-Source: AGHT+IHEWWLNfQtNHrp+cvF8sBI1yXLxZcmY32Rjq8N7+2OkGhSBdTK2Dwdwbf9Kv8nxAJuaauGLQ6b+3itwYJ3Hisw=
X-Received: by 2002:a05:6102:3e88:b0:4c1:8a77:f7ad with SMTP id
 ada2fe7eead31-4c6d39a7ca4mr1979655137.4.1743445110910; Mon, 31 Mar 2025
 11:18:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250330234039.29814-1-christiansantoslima21@gmail.com>
 <20250330234039.29814-2-christiansantoslima21@gmail.com> <CANiq72=GWwhMEfwBgUFpEUFoT2Wga2=uhH6Nw7fotQYjz2G=EA@mail.gmail.com>
In-Reply-To: <CANiq72=GWwhMEfwBgUFpEUFoT2Wga2=uhH6Nw7fotQYjz2G=EA@mail.gmail.com>
From: Christian <christiansantoslima21@gmail.com>
Date: Mon, 31 Mar 2025 15:18:20 -0300
X-Gm-Features: AQ5f1JpTTYE5yDAqbu7BuQ-FZP8TGYPbiTI6kiGTMZuNB3WeEEMbtIi2gGCrPjU
Message-ID: <CABm2a9ek5+KYaX9fGqXVQhG-hV1esn5EnD0PxKR29D_pwfZUeg@mail.gmail.com>
Subject: Re: [PATCH] rust: transmute: Add methods for FromBytes trait
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi, Miguel. Idk what happened seems the git send-email took the commit
and the .patch together. Sorry about that and I forgot to reply all. :(

> The one I am replying to is what seems to be the duplicate one.

Should I submit another patch because of duplication?

Thanks,
Christian
