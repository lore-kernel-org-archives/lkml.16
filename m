Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FB31F5EA;
	Sun, 15 Jun 2025 13:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749993956; cv=none; b=TbuTtYmuNCjFtiToG5qdDSGJ1kXSfPyW3Bn57SYqTBYBGm6mJ7bFHytU3NAheOP1aIV67vFWXUzhw+PcsDduw4XJjkrivNOGphc2RI6A/06dZgK7ceWz7XLOTcp9eD+0bpbPLp10li9etjP91lkZKGL56sq0U6J0uMufmFCsXo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749993956; c=relaxed/simple;
	bh=l5OH9PCzejWxmwiCg2oZBKE4xaj2vEtEDn1R9hGp/JI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LTotx/X2L9ghaJmIyaUkha7wGHANjtvV3+m+/d22aE97lCyynkQs0kkYC5UWX4f+ez1GI1/MKRbytsvJWW0pEWlVqxEyaGdESTA6ZHakKywXdwq+C9RwK+sLARrlzu+2X3CszQehHFdBw1CuWpOO/toW5mJ5zcJHhF9LPMdxuC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lEEY8is9; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lEEY8is9"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-31308f52248so601468a91.2;
        Sun, 15 Jun 2025 06:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749993955; x=1750598755; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FSZZSMDBPFtEVqKeoNqHLJlRKfMjtGjyva/WaUGres8=;
        b=lEEY8is9Z7csvX8BroiiCPtd4n+Va5yLcp2nH2ZnC7Hv06KvFQSE5IlSnOTog2PbaA
         aMtaHfr/DVe2ISiNx2XIKO7bUKQCPwgkp92I4+Boqf5ETzJ6KYfUj8AXJfXzfTmCs4KT
         2LHcnWDVEhycJkEnQtoPnHfQtODVMCUlYiRjBsl/Wt8VRQ1gaWpF3aj/Bj8yKTDYjf2I
         XFIH+0wmE1xNMiR0a0TukPkj3O03Zrxio/GkMa/CLwbA3kBVE7HnSMaHS1wBvWmZORTM
         v1cShomyeDXrxXWxwmn2OsY8XS3M46IQE2nX3eulVqXyzzABo1UoqqbPkYp+QxmtYHv4
         eH6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749993955; x=1750598755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FSZZSMDBPFtEVqKeoNqHLJlRKfMjtGjyva/WaUGres8=;
        b=aae1JV9Ncxyc5K2TOvbcQDjONT9lDasg3MX2IKzbpQOILXRN2CsJAm1UOwZyPY1n/q
         FqRJQpSE3MT4VSotTPjyAtKTIQWCuq6DKSrgz4kae5MdYCh0yIwG5CYRvKzWeYzCdLt9
         5056/jb8/c5BoD2hr2XmCDqHJ14DDoGbLQwqfWJ6MT35AHThMUHYr4uj/zyJXLn9QA0Z
         vhWV7xN4xKz1I+kRDxXliOJgrPUfvSL7qO8YPS7YAafMsYWN2OMvHmuJtNhfGpkxFvO5
         MIVL4lSa6qLx5It31E3IkKZUEpsYSsRXVSAEp3fv6tOd6p2TFCz0vwywYCgAZhBAYua6
         HSyg==
X-Forwarded-Encrypted: i=1; AJvYcCVs9vsvyq9Itt5rHUVUgeZwbHu3iXSNAe8C3RFfQk79AVS92vrtyPOrfJZ98EBtK2CDvoh5JEdC+y1ypTcBr8Q=@vger.kernel.org, AJvYcCWsJY3Ci6o8hTSIdtDa1Aeh82a1JxC43gmpyAIW+LOBGzsF3WRnlYhFuLTLl8ePAON6nnSPJ6qonDLc0F4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLiMVX49AwPdrxLfLXJbjj1sS8dFTjuNMgTXbw63G5b6DolXXP
	PZsjDzg9MzApHnhe1Be0I/4JoLEbYMQfRUi5j2zq0EtjOKOCD0aGOWSRGWxWNz1Yi2DqTk+zjTh
	uURKK7vjpXiPbAe8mRD50JI84iAWOYXM=
X-Gm-Gg: ASbGnctweWMjW3gmQnZzLPrrjGPJpul1/1tEWZYWGPd5HlCG+TCfPsMj3gqYd42Zidw
	jYi8WfqB8B/f4OUa2hXyncqcOZ/vR6sgb79uQLNgurY9sZ94e9a3hDeH9AncsKaqH/A0d2DuARL
	mC50YpkxSALjpTzNHaVOQG+P/HUNNo7/H2kot0nJVkEas=
X-Google-Smtp-Source: AGHT+IHL489+Ip7x87tr3uBuoh4+FL6dhvUV+iEgTRFzqe+7NJzeg4yWPgNk3PpSOcE1u2TzipBmgzEfpVIaZmoYc0Q=
X-Received: by 2002:a17:90b:4c45:b0:313:2bfc:94c with SMTP id
 98e67ed59e1d1-313f1e70849mr3454988a91.8.1749993954821; Sun, 15 Jun 2025
 06:25:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
 <20250612-nova-frts-v5-5-14ba7eaf166b@nvidia.com> <CANiq72=3nDR=J2OXu9nWwZW_kcWfZ4KhZ3aS12_dcB=1EP2icQ@mail.gmail.com>
 <DAN1SGG5DPVE.UUW0B523LQHO@nvidia.com> <DAN1XS7Z0AFO.3S7PRNH5FWWV4@nvidia.com>
In-Reply-To: <DAN1XS7Z0AFO.3S7PRNH5FWWV4@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 15 Jun 2025 15:25:42 +0200
X-Gm-Features: AX0GCFtthC9dPN0SJASTPTNnA5ujZZS706Vksi3r_Hn7M7E3IClaBsBN60VbcoY
Message-ID: <CANiq72mpFX2pSuy7JU+Xb_6fCkEA96er6Rsg0bVv+wBBO5OqUw@mail.gmail.com>
Subject: Re: [PATCH v5 05/23] rust: num: add the `fls` operation
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Benno Lossin <lossin@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 15, 2025 at 12:58=E2=80=AFPM Alexandre Courbot <acourbot@nvidia=
.com> wrote:
>
> Also, although this will work nicely for `impl_fls!` which is a single
> function, I'm afraid this won't scale well for `power_of_two_impl!`,
> which defines 6 functions per type... Any suggestions for this case?

We can always generate the same "cases", i.e. sharing as much as
possible the lines, and just passing the values (numbers) that
actually differ, which you then plug into the example line
concatenating.

The standard library does that for their integer macros, e.g.

    https://doc.rust-lang.org/src/core/num/int_macros.rs.html#3639-3644

If that happened to be too onerous for some reason, then we could
ignore it for the time being (i.e. we don't need to delay things just
for that), or we could put them as `#[test]`s to at least have them as
tests.

Cheers,
Miguel
