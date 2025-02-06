Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA49194A67;
	Thu,  6 Feb 2025 18:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738865465; cv=none; b=PRo14WCyYGiXCiYUGRBNqwNomPVWYbKOXeoUJeuB5efAo//am7qjVY3dZDwU7KqBJ8uA4sP6+JaV+9iDDxjO3qu+1gva9q8xn7A3hkhc20corjcvWnhzcwyfQLqU3Rnu6aJI/u6+cnTYY09eBExzCEYf2D1mDLhHWzB+mMyogyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738865465; c=relaxed/simple;
	bh=0ttuWAvJobLlg56YrOVOmHOt13ZH7wD3gGicocchpzQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ReZwOLoUVkuh7Ehv+uvyJKgYeltai0I+J2pkabiI8qaKXR4n2o2+cmLBNIaEx0ZJ7IGzsMDQ9D2akwEM2LvbqXOsSAPitZqXxtwMqFP93YM1eUdGEmEIUKdCkBSBWW4huOdOl6dZnXmsn++cfB/HASc0bIbOQWHDrp/Sd3+YFms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jcBhUo1B; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jcBhUo1B"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso8262975e9.3;
        Thu, 06 Feb 2025 10:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738865461; x=1739470261; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ttuWAvJobLlg56YrOVOmHOt13ZH7wD3gGicocchpzQ=;
        b=jcBhUo1BzwIvOBOE62XNHcyymjNMKNLQEWyYtJuI3pD/7ZTS5stDB3LYz+F6f+bhu7
         UnA5VlBLNWP5AhYgNPNf+atnlH9WZixEH3tflwLUbC1XmGPxjFMe5YLW69g/CLn7OYya
         l/m7lSk5hATmfNlMOic95HUPIBpdFAMvBWp/6TYiWhdFWhPE61sqX5sGwA5tdH/K7ENj
         SES4QrXQlxIZ19PRWlQcZmc7H0pDeWr9WYhj+4ZNpvN5MlFXl6qMVVC2btT9RpOIutQ8
         n5IjdmM8IPqgwLjftFpSTJRAMbWC4D62kOoUd6OenifwdbdaQbxAAjNl5Mw0QulC94Uo
         kwOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738865461; x=1739470261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ttuWAvJobLlg56YrOVOmHOt13ZH7wD3gGicocchpzQ=;
        b=A31xvgnPUJNAvNAYnruAoT2FGNK0o6l4kT8QvSaML6qvM1tbrbpnm+qDqUhdjU1ZZ7
         TcgLFH7tK5wqXTB+1Ww/IgWKWqlEK/2SRviWgwRn3GWuYYQozcQZD72cA7MFXT+LwnRk
         GmoNMuViQygUuSkpJt+ZrCagGv49cASCu6cTh5lSyUS0l+IQlaF9BXQPoTKIHXpl2wbJ
         McP3CkUBlP/uHvsTiCp9tm8cS3EHtw35+0kQjqy+/AS4ggRfrNqM9Xr+hug/AFQYS+7G
         4fmfghOXyTo5NvPJaJEDQjVLH80xWlenq7PnTA6SgqRQ6P+q+XJ6WHu2DizWyJ9Pd5SM
         1vaQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2FKxm1xyHtXJ3Cu8g8s7zbcvRz5jYVdc2yE+p8qaJnRRVfLVP6gMiVR664Ju4oSjIaHMeNDNI2qwBtcyR@vger.kernel.org, AJvYcCVejYvWDpq/zRNVkd196EL36phLSeHfLurEoZhbfZjjWsMgWtr0/vRBSBotDCEFvRYL22C4ev4ov1U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9ejW5BsBI9jh4Q8vBBwIt2FpixyWank8/ZzevlDDTzRAc5REH
	+J75N8TsAuVYr39Nhkgv+vif482RTUKjXJ/b/SwoUuY7Z3QvWKtqDu1IAJsYScBRwLOP7kiT9zA
	hmGv1mDX0ToDonvr8lgClZEIdB1Q=
X-Gm-Gg: ASbGncvRGz/qE86cOsqGZZqo3lpl2aBfUgV5zv0/rOFLftGgG/FYl/pkXex6jHr24Qt
	ZiY0XIt21DaCvGjf/4Yaw19yGr6tPVwMR0SsQVwnM9jn/xz9l9kB9SNkRaZYNx2tmGAO0IN+zUQ
	==
X-Google-Smtp-Source: AGHT+IGjlT6+E7s19Biqi+L66hD4CAB7+vWZ8IxthOzy0VOqSvauytoG4hxkI1K7a56pR3Wt3sBZqEuajrgrIm/RerQ=
X-Received: by 2002:a5d:6da4:0:b0:38c:5b52:3a5e with SMTP id
 ffacd0b85a97d-38dc8dc342amr4349f8f.8.1738865461496; Thu, 06 Feb 2025 10:11:01
 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
 <CA+fCnZd1dpqv+rM2jD1fNGvhU_0+6c8MjzsgEsi2V-RkHVteJg@mail.gmail.com> <cj2w476ui6g6bjtrnmhozgruhudjx7dbeifxtx4q26c4sqmobt@ill63v5yc3ke>
In-Reply-To: <cj2w476ui6g6bjtrnmhozgruhudjx7dbeifxtx4q26c4sqmobt@ill63v5yc3ke>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Thu, 6 Feb 2025 19:10:50 +0100
X-Gm-Features: AWEUYZkYq87i7dcuraqL9nv2V2zM6XbkuTsSw_RSaFUD-ppNitROYVtIB8RMtyU
Message-ID: <CA+fCnZfTvFzX32ZU=Xa0qsNACM4Y1vA1xQDtJkhhk1fYH1QxRA@mail.gmail.com>
Subject: Re: [PATCH 00/15] kasan: x86: arm64: risc-v: KASAN tag-based mode for x86
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: luto@kernel.org, xin@zytor.com, kirill.shutemov@linux.intel.com, 
	palmer@dabbelt.com, tj@kernel.org, brgerst@gmail.com, ardb@kernel.org, 
	dave.hansen@linux.intel.com, jgross@suse.com, will@kernel.org, 
	akpm@linux-foundation.org, arnd@arndb.de, corbet@lwn.net, dvyukov@google.com, 
	richard.weiyang@gmail.com, ytcoode@gmail.com, tglx@linutronix.de, 
	hpa@zytor.com, seanjc@google.com, paul.walmsley@sifive.com, 
	aou@eecs.berkeley.edu, justinstitt@google.com, jason.andryuk@amd.com, 
	glider@google.com, ubizjak@gmail.com, jannh@google.com, bhe@redhat.com, 
	vincenzo.frascino@arm.com, rafael.j.wysocki@intel.com, 
	ndesaulniers@google.com, mingo@redhat.com, catalin.marinas@arm.com, 
	junichi.nomura@nec.com, nathan@kernel.org, ryabinin.a.a@gmail.com, 
	dennis@kernel.org, bp@alien8.de, kevinloughlin@google.com, morbo@google.com, 
	dan.j.williams@intel.com, julian.stecklina@cyberus-technology.de, 
	peterz@infradead.org, cl@linux.com, kees@kernel.org, 
	kasan-dev@googlegroups.com, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 11:41=E2=80=AFAM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> >I started reviewing the patches, but this is somewhat complicated, as
> >the dense mode changes are squashed together with the generic ones for
> >x86 support. Could you please split this series into 2? Or at least
> >reorder the patches so that everything needed for basic x86 support
> >comes first and can be reviewed and tested separately.
>
> I'll try reordering first and see if it looks nice. Since the dense mode =
would
> make some parts arch specific I think it's better to have the two parts i=
n one
> series for easier reference. But if it turns out more convoluted I'll jus=
t split
> it as you suggested.

Yes, please do. I also think if you split the series, we can land the
basic x86 support fairly quickly, or at least I can do the review and
give the ack from the KASAN side. For the dense mode part, I'd like to
also hear the opinion of other KASAN developers wrt the overall
design.

> >Also feel free to drop the dependency on that risc-v series, as it
> >doesn't get updated very often. But up to you.
>
> Okay, I was mostly interested in the patch that redefines KASAN_SHADOW_EN=
D as
> KASAN_SHADOW_OFFSET and then gets shadow addresses by using a signed offs=
et. But
> I suppose I can just take that patch and prepend my series with that? (af=
ter
> applying your comments from that series)

Sounds good to me!
