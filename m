Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0A31B87F2;
	Sun, 13 Apr 2025 15:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744557742; cv=none; b=E/ko89owpmwTPrYwcB+oLlLyGi63ncb8CO6JnES4u+ngievztKjeCogVEQKLFAYn9yy4E8DOXwsH7/SXMz6ly5PJ4wiOsRqKyQK5VORP0QrYts8S8Bgvjej1TWA5FCHWAv3EByPQjDorekExtlqrAeTUz35mJY6nlEfBilCIKqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744557742; c=relaxed/simple;
	bh=p29f/d2ZwO1V6CtmbkFXj4jH6WQCqOk0DFQqugs2SBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gWEwKIc9d22Yr1EKgS68xhh6dEdf+i3ZSuBLlmpt5+fg6FV08ES5PF1vNVXOx+rMm8otvVj84EYigsbcftFXoUVOaSv+iu0jSfqTp3g2B6VPF0vmaEYyM2fboavqBl7OOxE6gDEG9d4MR6fHEXTO3+WnllvF4gmwAqxdTC+4JeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NrFLSlvq; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NrFLSlvq"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-301a6347494so677805a91.3;
        Sun, 13 Apr 2025 08:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744557739; x=1745162539; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=61dKwWrOnrryuz6mIEKH1vAWluHJxwfCHHzktKnA8PM=;
        b=NrFLSlvq8Dr0xf67OMXW+uZ1aD0Ni6wgrw9gI4nFdAp3GEhAr2Tx13AoTfkos6a6V0
         YCdJWwWPoqReAAZXQo1BJJ3KHMuXfeMh9GI4BxLUj3D1BogySXYZHAzuiH7zpJWonqO9
         QrqCJfgM3aV3yrTpnGh4EbGz4FNDOIh8sqhTYzWGOqShSzHofDwfnh5fHegwgeoZkXF8
         oWuiOVAANXyoHLahv9ZO/bAZQpnA6b1nwAXnY6SoUXDi0T3dnA7mEKQL5gvNMi3cbJHs
         Knz0iIzYdrr22TEWUd3SNUnAKstE4kNhGqh+rmm3EIsWDhkIbAXqYbGgeEIErUx7DhIA
         iinw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744557739; x=1745162539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=61dKwWrOnrryuz6mIEKH1vAWluHJxwfCHHzktKnA8PM=;
        b=JAU46HOJeAGRf00tr3QGfi0a10SXTkFyp67dnCXV6ZPcTnOV9082dEpyey6RFIHl61
         gKYbSMLNDwyRKAgmoVzGaH+rmYfzXGMVdV41FhWKrcE4ODloowXV9YcmD2mQ8DZLvgKq
         xbmnBmS2HfiRTsiR2mMzrX+CrwKH1VDTaSDoc1lUMi8WQYMMPDgdcKauU9NXZXjLrE5I
         iHqdyLlc8zdS0Uz6luyRVdh543REL3AI6/ZCc7wqMolQBsCJ8UtlxlXRlxE7i4crCg+K
         5XpwT6Y4wOZmWpz2OAxQQCwbiFD6SFkhmw177pkKuSFjllMJG4MmKgyBRDyzTmAnslgj
         Prng==
X-Forwarded-Encrypted: i=1; AJvYcCWV+ThQYkmVKuvdP47GoquYDEpTs02MCRZ2HQ/CEGtU8HQrd5GQVOLZnf4fECs3lgdi1XUfnm1NcpdDXqy/WNo=@vger.kernel.org, AJvYcCXvH9/iVN8fqpL09gvyQPPD7xnHEhD8bWbAH2fz4QF5zgozweqPQ6ja8NoStgc9gOz0QBAHEsDPuL3HbBQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPRv7JxbFmJRb9wKncgFPbNbOzuPMsCKOp8bAtMk4cylL6Ypyy
	gdngLkj7e11tndncvjrGRVMRZU22QjFvADpC/Rnmyk41Jv39pswMawB0JTdye1X1OyjM3hiLFQB
	emUq6E+iMgvMQ2LKVEEPzzOGn+Cw=
X-Gm-Gg: ASbGncvPFo78XwmAubw+908RzR71jco62vKa66tC2OsniAh/z4koXyhYXUdMOfpL/nr
	35912XjYwx+9TbaZxWdj1WDu7yFru7sC+Khvv05x2s8udPRUz9wyRsWSRsdrOQviO+x/qrof3My
	g0g8BfPcpGSa19MprGtpuIdA==
X-Google-Smtp-Source: AGHT+IHvzVfyuJfuNJxwTCOWEJZtAsGw3V7viQldcIWk0IRZ5zIy7kiE413OLyZMzHBPCjTGWDYkgkeruUcjV2gv6lM=
X-Received: by 2002:a17:90b:33c3:b0:304:eacf:8bba with SMTP id
 98e67ed59e1d1-30823775bfbmr5210335a91.4.1744557739557; Sun, 13 Apr 2025
 08:22:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412-rust_arm_fix_fw_abstaction-v2-1-8e6fdf093d71@gmail.com>
 <Z_p-UoycGk3BceXm@pollux> <c04d3ec9-46f8-4ccd-b0ed-52a1adea11b7@gmail.com>
 <CANiq72mpKQM8v1=qhACWGYo1c0jtOymnACDxXiRgjEs2-+X2=g@mail.gmail.com> <d4147269-6a7f-4fb7-9199-54f53be61139@gmail.com>
In-Reply-To: <d4147269-6a7f-4fb7-9199-54f53be61139@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 13 Apr 2025 17:22:06 +0200
X-Gm-Features: ATxdqUHNZ_9tuDNS1wlzYN05khNIGHxxHrij-7T24dLZlKtixuvPQCy3z1-AOMk
Message-ID: <CANiq72np_UkQS_Lv9O7CJAuLvJ2jdzEy+M1A+AeHFJpmjAq7gw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: Use `ffi::c_char` type in firmware abstraction `FwFunc`
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Russ Weight <russ.weight@linux.dev>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 13, 2025 at 5:12=E2=80=AFPM Christian Schrefl
<chrisi.schrefl@gmail.com> wrote:
>
> Yes I've sent a new version of this section in the thread with Danilo.
>
> I'll send it out as V3 soon.

Hmm... the version I quoted is the new one, no?

    https://lore.kernel.org/rust-for-linux/c04d3ec9-46f8-4ccd-b0ed-52a1adea=
11b7@gmail.com/

Or do you mean some other thread?

Cheers,
Miguel
