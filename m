Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D74C25DB06;
	Thu, 24 Apr 2025 12:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745498914; cv=none; b=Bt7inYSMyu9zk+q/m1/eQqKGTI+jTHUqW7ojh/Jq1YKbrCLpQhMEs01Pr044F77RgxntqIWCy4yObHGINbIQMV5HORkh6/Dv0iqb2c5v0lTF7+7dbwb38ZEgb2z19JWIiLfR7ZQkmbFYr4yZchZwE4BXF98UL8VfKm1Qpa2C6wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745498914; c=relaxed/simple;
	bh=6U6Z2gglkvTg+b1XBRPbBh3DRtO54oMCv4RFZTYdNcM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lUarOiQRdSpL8IYYyskt7pMHCTwcOEv/8PS4GutoG75OhLF1cjm7EDIyb6wPS/g3bZtEAn9hZ65arLhdC/cUS38zowSGEYY9/Axalad64DUJ8lOrpuL5Z7WTAWNIV9UjK7O2wknDdbmXTgorYrOnZrNSvbwLhcDitx1XXJlKt5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PpQ4JdIX; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PpQ4JdIX"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b146c210207so102697a12.1;
        Thu, 24 Apr 2025 05:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745498913; x=1746103713; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zp45JdJmqXjY+RJ2vBzN9UuJyNLsaQja7ZHfGo8QaVg=;
        b=PpQ4JdIXfkaba1spv2/wampbUrSb6StvbQqbWnccW0EBn7If9XCe/brzoPjeevxGFG
         AsNfdujMRiaJZ3bzyey5h9GTCT0ztWAegXJ/NBdCtwyorPWZaavxPPQa9pw0qw7I+3Jh
         Q3X7K06Sabctrtbcp9yMRJ7XkMHjjL4MjBgehobhXxn9uD3cpQExTVtLN9beguoUGRPt
         G7fVJ9JWCTzJR1IY+6CQNEBL4oIAhx54+W8SI/rrB4r49pOY6ctDQrE6IGg93BgPQx5s
         q7+CqEFHhYBymCuBC7jMUxnGWVRcsgtNiugUOJtrS21hoFZzNvPbzITVAKsAX3000JuY
         ynaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745498913; x=1746103713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zp45JdJmqXjY+RJ2vBzN9UuJyNLsaQja7ZHfGo8QaVg=;
        b=Uc7Ivmo3QrjcX9qSQOXj73gDF5kqQvwp/CrvrOM3tbVRtj/60miqm5LNSmDXpsjwmZ
         heRchFMrrxPYp8nwkkc48xhdmW/lHH6m3WELxkt19dcrIyKJ2EZnVuBbrD/YBWZuA3pO
         00r7HqEZas+tQSs2LG+N95w/voRmWLJMZElSgzObwpHQctnayCAO/idSghXO+vq2tLr9
         m6EXSpNTkagI8gorOwzd8mCVTutA5d0HUvbpv3vPuJRswfqaOSSxjkxI7lIn6+jyQ8tM
         rPIRDowUVXSCXTf8u7yoniudgC85aDVMX+llX+GXp5+cw8mDWTpDsyAd3dogpxZ8XWFc
         0kQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJXsy8thArO7TM/Ye6SZPLAOk3ZdZU2k0uQTEurd5Ka9yx2vtT6JnXdUR2vV9YQOt8nkbYtmnYM1hgTx0=@vger.kernel.org, AJvYcCWd1EBT3K/Jhe41687doJREBhCVVGjDLdeyZ6/Kbk2MeFChhDiRerBs+kPpHPUE/XKscHveucZWiocjAOPjw5U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+Y3gGvMSC4VkfXwchVaxbKovW47SwCFR+arG5XxgEjtlCn9kL
	WjFFr6+uwru99hTT69Oc9S1Crv1omgw+51S+4Aun2WbU0YK4VDXojTuuMPaJ4WDoKlB/yUYkLkR
	64ypYZeixkH2i1kxjaP+L4d60JJc=
X-Gm-Gg: ASbGncvhd2HYhjw0KLZuZPIvkVrhvmKOJ//g2Z3ZVMJlzhsMtk4YMHzMcoG07CkTGbE
	BGuImYtt8piur2iQVxfO9F/m9yF9qgyG0WEq2AsQkuEacc7drjIlJk/Ca06sMf/MI8syQ5VG97X
	1DM0qRraUsHi4jZbXIwXO81w==
X-Google-Smtp-Source: AGHT+IEaUfZVy5nHMS32a1BzgW9hXt8tYb3kpR8WAiyqEh6YAc+aNC+BTRGo/Y0IilUGQ9QTk8H7++zOHpJmemIayqg=
X-Received: by 2002:a17:90b:3b8d:b0:2fe:a747:935a with SMTP id
 98e67ed59e1d1-309ed351ef7mr1434642a91.4.1745498912677; Thu, 24 Apr 2025
 05:48:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423-b4-container-of-type-check-v3-1-7994c56cf359@gmail.com>
In-Reply-To: <20250423-b4-container-of-type-check-v3-1-7994c56cf359@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 24 Apr 2025 14:48:19 +0200
X-Gm-Features: ATxdqUFK-lKfDAKvCwZqDSdrPREqbJzy_-yKdU4-hpp6c1gEYXRHhTLsHkUffRg
Message-ID: <CANiq72kQWNfSV0KK6qs6oJt+aGdgY=hXg=wJcmK3zYcokY1LNw@mail.gmail.com>
Subject: Re: [PATCH v3] rust: check type of `$ptr` in `container_of!`
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 7:40=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> +        if false {
> +            let container_field_ptr =3D ::core::ptr::addr_of!((*containe=
r_ptr).$($fields)*).cast_mut();
> +            [field_ptr, container_field_ptr]; // typeof(`$field_ptr`) =
=3D=3D typeof(`$Container.$($fields)*`)

If I understand correctly, we keep the `// typeof ...` in the same
line so that it appears in the error message and thus it is clearer to
the user, right?

In that case, could we nevertheless please clarify things a bit at the
top of the `if false` block, i.e. something like:

    // Ensure that both types are equal while avoiding codegen .....
    // ... i.e. effectively compare `typeof(...) =3D=3D ...`.
    if false {
        ...

etc.?

Or, perhaps even better, we move this into its own macro, so that we
document it there and why we chose this particular approach, assuming
the error message still prints the right thing.

Speaking of magic, to be honest, is this approach worth it? I liked v1
quite more. The error seems concise enough, and the first line that
the compiler points out is `assert_same_type` which makes it super
clear, and showed the actual expressions involved without using a
comment.

With v1, we could also just put `assert_same_type` outside as a
utility for others to use, i.e. in the `kernel` crate, which
simplifies things and makes the error a bit shorter. Moving the
function out makes the error slightly shorter, would also allow us to
document its usage, including the suggestion to use `if false` in an
example.

Regarding the `if false`, the kernel is always built with at least
-O2. Benno mentioned debug performance -- was that related to
something like debug assertions being enabled or just optimization
level? Either way, even with the assertions enabled, I don't see it in
codegen.

Am I missing something?

Thanks!

Cheers,
Miguel
