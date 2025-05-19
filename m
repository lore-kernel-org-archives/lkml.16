Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AC720F077
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 18:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747678391; cv=none; b=rgCPEt0BLlFT8bzZNBvES2+ja0ShgwPxRHfg1TmaQ79kKI1WybCGtrQRzvsPsI3z09Iuxqhra0ztqcshMVYu3cTVsni1hZeQ9eoHwmpk4IEylPibkkJkhRylsbqYHPFW3iGM7ea6aNvv75vHrcch8XTXBKVUukdBkonp1fn97B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747678391; c=relaxed/simple;
	bh=lXNzC+xIYyXzFQuiXFUqSV9/VpiYUpNoNLPoFlPE768=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qz+zYlxciiBGc4yVMt0AuNY44Juw0zKwB7Kuvm0d9VdDE5MqQw03GKk+Z3yE/fGyU9I8MncF5ijzhtn3YviXR5BNM2Mk/BVLKZraNVDCofw+E9F9xYzhDku5Cx5nMwEtW/Vjjyr1zLBo05ANQFB3T/FGrwSuz8YSjsjyeM5rwaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j+ig2hs3; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j+ig2hs3"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a37535646aso707226f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 11:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747678388; x=1748283188; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lXNzC+xIYyXzFQuiXFUqSV9/VpiYUpNoNLPoFlPE768=;
        b=j+ig2hs39jz6ha2tCCueeMYrmH8F8drIdNlvH42McF3aTDYcyzypMMXMwCfxAxcLbK
         oOMDJ9bH50WiA7TEf45yRTMONakCGp5NoN86o/aYEr13oyXDEfEGbdE3cTCBOyp0Sa4F
         7yRbVGbwOeLclZCIWb/rY8O81pViSwkDzXiEFjK05OHgccSlDTAG2UFbdoyfIOl02Rmo
         38wNxDPFUZ1bvnWnvEGD0FEi2AKivCoo8i9siBx4bzN/GcsNKA6M9at0UyVLjJNTN8yX
         4wOXfmkHaXdWNAWyW7S/+SPdjhU98gCPvwg6JCf1t/hu7zZqbzvM6u49h7veRYmBviKb
         piSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747678388; x=1748283188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lXNzC+xIYyXzFQuiXFUqSV9/VpiYUpNoNLPoFlPE768=;
        b=mvSRCistDJPg7XjMI5ixWiNm802ApKJZ+ztBKiZCJumbZ/lPXE9Cg6Z0aHQkvEJbQP
         PDPPXcz6JKyHeBfNm3FxTLTp9o6mrXHAB5nkaqkVC0DQne8Eh2CSAqPM1swxUkKH3FTc
         UlOulJ64A2Urrk4hOtlOZuxTwecD0rKgwKLDGfrVbes5nAxoUofQsBwVB9NaOy1GVBf9
         pJZTZQ/Uj3RRNoDu6vcX9gyzbWjCNv61WS5REBVRbsKDqdQri4eOmhXf9tmJVwsUNrOa
         NpdMSC1T0Yz6qSBLM/QcqvkTBMoYmsMquwqTs9GjVarxbt9eqMy3Feo55XT1tC4KWEUS
         36wA==
X-Forwarded-Encrypted: i=1; AJvYcCXWa/sI51wkum7ya5WmLC1Dskrel/qhGY1sJgUwKhbunQirrEI+JpTW8w1/wzbu1TQlVxJ5Owsrd4BT95I=@vger.kernel.org
X-Gm-Message-State: AOJu0YynmRLOEcplFTnsEokySIfgCCYpzl6OCfrTRq7QOVujQY+yb4Q/
	hvMIwvYDEqmuUw2CC7Tx9GqFAGXRo9F6a28GM7KvH/MgFIBpNEhDnSKfyRbd9m8/fbVIDK//TRt
	kb02f9/ceFfKitKDM9cj+MQ3kVI6cAnPmTUdNx5/B
X-Gm-Gg: ASbGncsaJTN3Hc4ORXMfpAVxB9xa2tmHqX07Y2uTYPPQuHprglqsQBO7C52KkwdykDI
	1eO2JIWBrpacSwS0PImVAF/jQPQnnRsPHU+n+iVDrgEyNJqtXYk/ab4W/voauQsqjfoWGSgfGmo
	9uk2ufm9+ZJLo64KcSBhPx8RHhJufYEWjPKidGj+xl/Jiby59ScYYhjaRgiB4ZD2I=
X-Google-Smtp-Source: AGHT+IEzMOKZMBkeSAD0ow2tHsmyWyV8vi/5NsezCGm1OU3PD+CuKt/pbnUIaf/Due2KAUhWZ4yaK+DNemgDcXcpkZk=
X-Received: by 2002:a5d:5f94:0:b0:3a3:59a3:fa24 with SMTP id
 ffacd0b85a97d-3a35caa2f1fmr13202792f8f.27.1747678388514; Mon, 19 May 2025
 11:13:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519124304.79237-1-lossin@kernel.org> <CAH5fLgj1k6juFMoBWeeWgdkF0UDewF1=VThj-dnusXwjKGFnSg@mail.gmail.com>
 <CANiq72=Y6aZwZpQwKHFq2D9H9qFYH-b19SJgTRyUZA18UZvjfA@mail.gmail.com>
In-Reply-To: <CANiq72=Y6aZwZpQwKHFq2D9H9qFYH-b19SJgTRyUZA18UZvjfA@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 19 May 2025 11:12:55 -0700
X-Gm-Features: AX0GCFu4WoOhuem6Ei_w3r7-2rKbGcEyAcPt1ynSlpFx7_WYp_l_MpIIWkxmTqE
Message-ID: <CAH5fLgikAzVv5A_eP7vwqRNka5RAkkyRnSxh-jjnA9DGfbYf_Q@mail.gmail.com>
Subject: Re: [PATCH] rust: types: remove `Either<L, R>`
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@gmail.com>, 
	Dirk Behme <dirk.behme@de.bosch.com>, Kartik Prajapati <kartikprajapati987@gmail.com>, 
	Aliet Exposito Garcia <aliet.exposito@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 11:08=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, May 19, 2025 at 7:30=E2=80=AFPM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > I don't mind making a custom enum, but I do use this in Rust Binder.
>
> Yeah, Wedson added the type back then for Binder and kasync from a
> quick look -- in those times, I see it in a few places only, e.g. in
> `get_work_or_register`. Do you have many nowadays?
>
> i.e. I don't want to add extra work for upstreaming Rust Binder, so if
> that would make it harder downstream, we can live with it for the
> moment.
>
> We may want to add a line in the docs to ask the potential user to
> consider whether a custom enum would be better nevertheless.

It's used get_work_or_register to return either work, or a
registration waiting for work if the work list is empty. I believe
there is only that one use.

Alice
