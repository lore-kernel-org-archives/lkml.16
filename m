Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1341DED4C;
	Sun,  8 Jun 2025 11:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749382951; cv=none; b=N6zGwWRFQiwNlZX/UHtwhL4uMPriaIq8K8SIabXu+X/ZxwyZHiKg9FVPZF5ZCPKtpZSLNO7ffKE3rb7UbaQOLxsvExXgPIb5uEQ7eL7OiEG9AoXhqoiYxJUzLPU64t3xh1novi20WOLCpOp24YEcvkD1biEpJizi/ZIYpi9cGnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749382951; c=relaxed/simple;
	bh=2LQVOpAapLtPp9HqHg86YqQuGmPwthviJeadMcrJG9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eWUNZ7WAbts6ZgvZbTW2eCPRCbOEB4rqypkXF3NaPDNBh2+T+T6QSOf6cQc5BceZhAsmqRemKCiUqplDgNoFUHv3O0wtnaMj5jRlkFSY0sn2O4PrLvvd6GUMY5AFVHk3KyqnHUn1OTaa6/ptJH9OXi4HCAbeN2v8pO8VEMCDrE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ElSjEnk1; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ElSjEnk1"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-31308f52248so473787a91.2;
        Sun, 08 Jun 2025 04:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749382950; x=1749987750; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2LQVOpAapLtPp9HqHg86YqQuGmPwthviJeadMcrJG9I=;
        b=ElSjEnk1TWfdA1kr44sL+AhVWaI+9f0n6Y/C09UO45lkmb3bYvZ+kwkyboDHy5bwsM
         IrYOR1QpWYGB8ox6EBJRsOkdb2iV64DcflyN9zEDr5khv+0yGCD8qKIBInd+sA+NpkOX
         ObHM9UECQnCqT+B1VZq6Avzd66zGjT1YQQRy0yP3epTzWnBkDzylJtCEI8TvqC++QWhD
         7vVW6W2aAKL3rpYzUCNr/sH8w0ipzlU7slwwgnRbwSCpoc9Y9ia4ZSnHajIlG7bLPDc7
         ezaIsqjX1JE0cLsTUu/Mbv4U13v4F+QKR+8vD6tL+Fb4mfaj0jp3KFdmdApoBJeDMdAJ
         pcRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749382950; x=1749987750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2LQVOpAapLtPp9HqHg86YqQuGmPwthviJeadMcrJG9I=;
        b=JjwdPbg0lKhbBFfyZ3EXyk2VpDVBx5lFj26F4/+eT+Rvw5dXaTZb6J/JCQjiY3/sxf
         NGf9kEilZO83MlEnVDdW2VIHkqhiCLOkAM9jbo5lOWDbgBXJb4jXku5gbBJPBJN/kzjR
         MZSDrkAPznhXjXjm7X1n0UQvOE2uRE2PHpWKp0VZ0JWGDQAN4Wp3Duz5csDyz4QgANtI
         vC/Fp7pMdA0SSw2BGomISrWzVD6TxVht8eLLMznI8+h5ys7FeyaO2WwiveOW1GuUfAYi
         H+KzcalOBUOpQVnZW1sT9UsIWgZ+plH8KqOb2X8FsyPbSYQ+bmrnWFbpH0tY/tWzXXE1
         UByQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3p6xC7TswpghKCX4AcDwtrfJN/tmneQMuF7RhI5xiFGT0P107D1JtLX8ibFm4d710xW97qVcZCZY4cg4=@vger.kernel.org, AJvYcCXS4hMZxGbv/XYeZF7VuhDX1jzOXORD6sVpqpCSYSPBovc47DipECVoBWASANuRScmjY7C549fRjCCArAjxVo4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOSqi6aviiG/2lDpu39Pc9PX4ACejFQS4GbZtPWHzhwUbRSUKy
	zoK3sDHMjFBflmk2pB0ACCuaqM91jkBloDT/sjhOezbSRxkHRzQOhyCdWLNJKxoewww2OmKUkxD
	kY+HwHu6ZLmkyU/Tbn51pkJkABGgsQ1Y=
X-Gm-Gg: ASbGncsvLgFV+E0GCLy+SH+WZQyqgvosWT+IVIDrQ0kDEqsqhYWOIr7Du1tr6uYjher
	ZhUJl3DvPDnD8AwbQ3vDfYw6jEdFGPabsHgnstK8ynvlUhvcJRRV/wlTQ7NrJJI4ax1iWCWTdVZ
	4QJi9dJSgzATTSG9RuYaLxAxrVhvPoupEtZ+1bYZCcU+o=
X-Google-Smtp-Source: AGHT+IFvv9nKffJcDgtWaphy4IVLFVeEoYsT8T2wCGI6dBukuF4xlnO7xAtyBVdjU1LIo1VYQLLMWBm5ZDlskXtXwgI=
X-Received: by 2002:a17:90b:3c04:b0:313:14b5:2521 with SMTP id
 98e67ed59e1d1-3134e4223d1mr5163697a91.5.1749382949675; Sun, 08 Jun 2025
 04:42:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250607-b4-rust_miscdevice_registrationdata-v5-0-b77b5b7aab5b@gmail.com>
 <20250607-b4-rust_miscdevice_registrationdata-v5-1-b77b5b7aab5b@gmail.com>
In-Reply-To: <20250607-b4-rust_miscdevice_registrationdata-v5-1-b77b5b7aab5b@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 8 Jun 2025 13:42:16 +0200
X-Gm-Features: AX0GCFud51_LP2UO22hI-gWlMOfHEPzLbixeb5DNZQDWbv6ajYnam20HEwzrs6I
Message-ID: <CANiq72m=cw7kqc2hBU5_REXPMOpiW4g=NtXRNqvd9uajZGtSZQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] rust: implement `Wrapper<T>` for `Opaque<T>`
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Benno Lossin <lossin@kernel.org>, 
	=?UTF-8?Q?Gerald_Wisb=C3=B6ck?= <gerald.wisboeck@feather.ink>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 7, 2025 at 2:07=E2=80=AFPM Christian Schrefl
<chrisi.schrefl@gmail.com> wrote:
>
> Reviewed-by: Gerald Wisb=C3=B6ck <gerald.wisboeck@feather.ink>

Was this a privately-given tag?

Thanks!

Cheers,
Miguel
