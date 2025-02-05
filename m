Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB3D215176;
	Wed,  5 Feb 2025 23:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738796924; cv=none; b=NaAvNCDS6mnTrjCZQiXN0j7d7OayBOf2iMoZHngVp/acXoeydE7WqqdKG3y6e4FLIBtSADDgOh26EX5iwDncmdk1hA90hajuIwoeRuluP2BO/48jPq2ElNq7XEjI3mL95Io3GcmWUF9Hl25n8/3srdRGpdLq5VqcYOl/H1dj6a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738796924; c=relaxed/simple;
	bh=119CI6OFDj+C/3vID9nFN97S1ov2S8Vw/j7B+ZUYlT4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I9LM7/+QiANAsSADDkrHgKPUp6Cz0FcJUiErzaBMr2iEkODnjrcya4szfqWw5mMSlTG4DIdf0zf8+8cSOqmohc7EwKcy2atcKcT0zS/5OOG3stkD/uy1zfGhnWv6/ZDpoLnwMgH5+WFfxlOeDKVvzchfnnbxiZ5T+OObd1XxG4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dA4Wegnd; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dA4Wegnd"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2f9e072f155so51297a91.2;
        Wed, 05 Feb 2025 15:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738796922; x=1739401722; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=119CI6OFDj+C/3vID9nFN97S1ov2S8Vw/j7B+ZUYlT4=;
        b=dA4WegndU+KDoTr9oxGQTKtnxPRzRuk3m6Nbz3D8HO3ojNnYhqUjtlj6ayodmkRtcW
         o59MmIYsfLrFafqeS85JqB7hhdHQCNTDA9b4aCM4sgEWbtioFqtkZJBcuMEUidJ03Fxv
         WiLwtKxIkV6xl0W3XOBACTOSiTxnZnh9S0ScIhPbi+Vyl2rJc1DMNA5/mwVHgOz7whhQ
         AYOPzdZju8KsPxtZpX/uBb827xFXFiebvK6pucMHJxcWp2QJNXUzLi9YLewR1Dghh0eG
         6KBbjYPbBfTs862YkWkD7kPsy+cssnmsO9G7hrl85Q9pyFuUEKEj7vjh+JnarU3iyj5w
         e9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738796922; x=1739401722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=119CI6OFDj+C/3vID9nFN97S1ov2S8Vw/j7B+ZUYlT4=;
        b=lxnrLmb8E514nmV/D4T4OyyXOeDsUaxfD80B+weu06xIycYcrPrUYlY3Nm9e47yvck
         Ayit2gkzjXwI2d719EiFXnbG41TW2hLd+nOnXN1axKId2SUh96WnM1FBOSio72FDj8+g
         ijnflDEC4VZ8q8SNhRoD51zs58Lu4X9jhT2HFMSkC2Cg+s8BK7OF5436ggwFyUC2uucM
         31XgZgtPotwLn+jJ2qnax/rvyb8fhMSSv/KrTMZISQYItDd5Mh1BUSQNdsQUE2fL2YBT
         0CvaQgCIJ2NG6v4SQx7PMXBIv8ppBgKGTxAbon9qsChXAVqEjof0Yy68ArOIBCBU8hUp
         FaJQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7f0XtIpqHaYAu3/SK8kFhF4bFaXDJYaMmaXwnSeVwjZVIAMXS0sjlQWSGrWx8F9NDaVuvtjR1Sc6D0gqVAk4=@vger.kernel.org, AJvYcCVkkuI4Gzz3jNP2u7mtek/MFbN6NhHdvlD6o7BR6d3zW1IDdCuZgw/lV9BXOnKPpJ0nJlf02wyC+uqIuAo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2QRTcaRHzVx3R27at9PE4ve4/6MPaU/pwBl1qc3DLkU5T6550
	H1grbI0D1ta4LiYh73OXSdBbsd79DZddN7vbuJGyM4YyjATAZzRXqxJYZp8sF5Lm2nE3atd47RK
	tySCbi2A4am3la/22qdKL35Ed/oQ=
X-Gm-Gg: ASbGncuognwNKVb7LdZGmdeiOU94dlG2KWPj52nTvN2uCAZOC/xflUZ9hjTcGJ0ajsM
	fjPdfePbIuLURSLzzYAJuFJxpnu17zeJrbP0UgK53pTgEbh08hz7CAK7NivEup4kR51rCadKP
X-Google-Smtp-Source: AGHT+IGPQWN6lu7lXi70uGtcKR3m7Ux+2U34rhG09J16VU2W7p7726JMw8V/FzkqaeczPU2ki2ORnRLXXQHf5fEjNNk=
X-Received: by 2002:a17:90b:380d:b0:2ee:d9f2:2acd with SMTP id
 98e67ed59e1d1-2f9e085a504mr2961268a91.6.1738796922117; Wed, 05 Feb 2025
 15:08:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250122-gendwarfksyms-kasan-rust-v1-1-5ee5658f4fb6@google.com>
 <CANiq72nr9vTgUF9u0uyypzprQrEpGv4qbOUJS_QgYbMZhTTrRQ@mail.gmail.com>
 <CAGSQo02HFMn0b=d6LVFr35Bc06F0AY8XmPFtqWi4b17cQSF0+g@mail.gmail.com>
 <CANiq72mo66FCLQTsBMU+Sc-VeS617uYgQdtCXJF9PacpUhSbLA@mail.gmail.com> <CAGSQo00uUYdjeiRHEz465WyN_kDyiV2L0Ojaomr8ckMYipmp6w@mail.gmail.com>
In-Reply-To: <CAGSQo00uUYdjeiRHEz465WyN_kDyiV2L0Ojaomr8ckMYipmp6w@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 6 Feb 2025 00:08:29 +0100
X-Gm-Features: AWEUYZkAO5tt7mVoyojcc-IcIgPA8kzPSscdi5FCv3UdWiVIWNe2t_rNumho7Qk
Message-ID: <CANiq72ksOc_ncUXycySPS+JUur8GZZSHSSEQYOg9aKtpBRvnPg@mail.gmail.com>
Subject: Re: [PATCH] rust: Do not export generated KASAN ODR symbols
To: Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 12:03=E2=80=AFAM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> Fixes: e3117404b41124c88a4d834fc3222669a880addc
> would probably be most appropriate

Thanks for the quick reply!

In principle, the backport to 6.12.y nor 6.13.y is not needed since
gendwarfksyms does not exist there, right?

Cheers,
Miguel
