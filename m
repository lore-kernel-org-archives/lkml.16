Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F395528C2AB;
	Tue, 10 Jun 2025 10:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749550507; cv=none; b=Xcn4VdOTNfQyXxj0uHJyI/wYD/F2PigMrfC5fx1eVv3HqevxP4YSHppRLSk+Mtdu40tR0JqD7n8RFNvYZtlL3IR+iiGWGywCmUKbe5d/ynoNtvdoze5qX87lxjuonLop4y7y0GbnGMEK5B21Fw/W4+4xLzIk3N0DlDcXujMoEYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749550507; c=relaxed/simple;
	bh=VCY3Jb0GW9x370ZxN115Ohx8Yf3xBLm5PHIx4Rwq2XA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bwgchGvubu8e//IOiZ+VyTnd3SOnPX9I1NCGTuS5IJ/v0BwuP9mKxE4qea7zfMA9443e5yJ06u5Q383MMFummmysXlLFArfQxldjTt93ZluOVLwYrbnMlLgKXg4PIC93Ijh/F5EJMPn1zXya0u/2vYy2bVYqxRIiMgm1JEgW2dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jip7Kfx2; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jip7Kfx2"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-311f6be42f1so1058513a91.0;
        Tue, 10 Jun 2025 03:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749550505; x=1750155305; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VCY3Jb0GW9x370ZxN115Ohx8Yf3xBLm5PHIx4Rwq2XA=;
        b=jip7Kfx2JYzTCyFf/mxJQ09I1W7uipWgS/9sjLY8qscLw69+T4LIPzY10HRoMU/aD9
         VIhHBpvN0ZdaltNUKkxhiFF3ZKQlTvPrC9u1Y6/CbWIqcyl0MZR+0RPxDUxexOIuCdgF
         v0bdrGGWgrtFKf7VtEa/LGd3nwvDHbX7oq2tKs0pQRHdkLr9R75ocQfK3yBfltzNIQm0
         +CTLVz5K3tj/s36tgMTgmL3zuMAijFdrqWRayFpv4ur1k54BlJdiVVz2LJOipJCIFLAJ
         toP5CroCPdMXj//DbHEus5kzWGf5dT826lP0fd/4Fqmsb0X6pgn6pM6HHW2dG6zTpI9W
         L3lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749550505; x=1750155305;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VCY3Jb0GW9x370ZxN115Ohx8Yf3xBLm5PHIx4Rwq2XA=;
        b=DcyeBhhy0QSXRt8k5EGhwublqCC8dr27UzN9UK+/LrS3f+ufFl3dXA6cxg2uk/ZFPV
         FKPGsOiwzX64OxPNeti74eu+D+2gs0YNKxe2uyeMrMCJcJIKYUpEo3c/ISHdhjy3ONWk
         kNqO6y9PzLOukQqkfZ95XPrvPgLVhR6bkVdjovuKSkmIUdiP9s6SLb49hG8a/JDd1yWx
         VScb32wDYCf4x97bRZklTweFf8WrVASFcvxKt49Vs9cvu9fJT47ZzWZexDyYyDkBON44
         zaWF2Va5nemjafW5ljlS0ds2SpgTGUmM7UtyvB45z8vwqNH5JBPBxbEQgMZ5p0BE/Uby
         8zbA==
X-Forwarded-Encrypted: i=1; AJvYcCXcMfI0a2XhRaQlhillVd2gKeZ9qUU5FJbQAA3tMezDMEwv76UjuLgW51OMk2OeRlOc/jx7KhNNruDiwRgLMt8=@vger.kernel.org, AJvYcCXd3SDUolIBPtQkRuUDxs0Tf8MWAko9DuKCbeygheMCIbhWkq89t0ErKq5sWSZL9/BP2rariNxo4o1CAN8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJiZueepA/WVdXdQOqQFigLOG02iy3+WehVrZF5ZQ/SQxEeOQc
	Jsgrk/J9TcgWinP8vixd2R5KjwMxekFNeKn98bqGNcY2XxN/+7I3BcYfQ3TZYziyyBljA4YpAaC
	zZI7+jQ60ZbE74TCuwIRSUDxxxxPap4I=
X-Gm-Gg: ASbGnctQCMNSp/7OV9BWgmu5bSOsfjZMtViAoJZQl9czoSDrSaQQl/+YynoBThr9hEp
	i6FZ1vhT5NbHvn7Pu797S27WFj2C1R/sWL0hoTIms+OyfA2xGdQrNGOr3XF8aIR+6jKDuJ6JqUD
	rjNlrUW3Sle4zVnabTl3C1X4T3gO4lLc8KM/FTCz7vj0L6eTO+vm1RDg==
X-Google-Smtp-Source: AGHT+IGPaMa1sYxbx8pM2k0jkLWftbyoZLah0011neMUN9H8lpgz7vuq/OIviMnJhDFOv4XnjSucLktKGBxZAeD6pNA=
X-Received: by 2002:a17:90b:57cb:b0:310:8d54:3209 with SMTP id
 98e67ed59e1d1-3134709008amr8810534a91.2.1749550505221; Tue, 10 Jun 2025
 03:15:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1749463570.git.viresh.kumar@linaro.org> <f10910c7585f5556869ea6f34b64d4136b8d5581.1749463570.git.viresh.kumar@linaro.org>
 <CANiq72=WpuGELzLbH-fxdOeJy9fiDFwatz6ynERDh=HP2z2MBw@mail.gmail.com> <20250610100025.e2jadqzlmimyq4rh@vireshk-i7>
In-Reply-To: <20250610100025.e2jadqzlmimyq4rh@vireshk-i7>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Jun 2025 12:14:52 +0200
X-Gm-Features: AX0GCFve-T_aP7_ML5wS2qn8FhACtOLl5AGbU1AICQ46AhxRRv-jy3NbJ0DRIkA
Message-ID: <CANiq72=dKx22CksQ_r7XuTrufTCh8ty-aAicPwFX62Q4JeAVTw@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] rust: cpu: Introduce CpuId abstraction
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Yury Norov <yury.norov@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 12:00=E2=80=AFPM Viresh Kumar <viresh.kumar@linaro.=
org> wrote:
>
> Just wanted to make sure before I post this, you were talking about
> these, right ?

Yeah.

The "good first issues" are intended for newcomers to the kernel, i.e.
to try to help others get involved into the kernel.

But if you already did it, then please post it of course. (And maybe
you just don't want "good first issues" for files, of course).

Thanks!

Cheers,
Miguel
