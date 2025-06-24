Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E9E284682;
	Tue, 24 Jun 2025 12:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750767909; cv=none; b=LcUsKG3d9KICrrBc85lZqE5BiRDitMhDSly6BsIg1FAMlsrtG681ZhVTuC0NSaPhqobY/z3ZridXCeM/30wpqEvwc45fdfTwDdx14pexu9Jf78yuVpAJyPkMkwk91cwJnbZJvbngFFFK6KW8CT2O1X/l+o1korFKyuASwoE+v1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750767909; c=relaxed/simple;
	bh=RI237N+iEEDDXGHWhevijSlBlXFUedEd8zc16128Oec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F/1mYV2L/+f5lsGbDZXyjShHUOpKr0JBj8jlRNqvr8wzbWZhCxW5w0NSSOuxzcjIVqmgqVwxLWDq4fFL7u+Ji8nI30q13L28mujpAi+7ZDoxAoTh78sefsX4bMgw5GD+1LwDW+NkbX+ThqQbmDEZBuegXDv7mgZbxImglN8lSJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZjQlTu3M; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZjQlTu3M"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-235248ba788so4210005ad.0;
        Tue, 24 Jun 2025 05:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750767907; x=1751372707; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RI237N+iEEDDXGHWhevijSlBlXFUedEd8zc16128Oec=;
        b=ZjQlTu3MW86eCmqacWK7bnkTifA3W+keoVLGFlHBxJqameS2d8LbncXgOmNQo9nBJe
         zpQvweW6IERvxe3rWNvrTtqkCbkhRjb5YAmsTk67UEYgbom3GL05JNEz447GzYT2V0sl
         DZ5GSiIEwZCyl4G0hViIuvmm2Ym1iBw54omm1uCPtPK2nHA6Vd1rVB0R3IugVyJN41HI
         T2l855nPx8PSCWbAWcsxeI8cwSOrn0HH1uZreU2BAgRBiIPlrmXfRazlM9ukOOE5Ro7b
         RMN9X3PKN0QCjke2k86xaMbnI37MkfzGuljIgCHqOzbiDBVr/jmPDpmoOK5C9wEagQzc
         RyYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750767907; x=1751372707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RI237N+iEEDDXGHWhevijSlBlXFUedEd8zc16128Oec=;
        b=gx3ogLIiDdv+5R4sOiw+h9iMJgnM28sP509P8fcFTVgpx1npXa3uAY8uIsP6mMjJ2/
         2MIg4hrdPiAS8u/s2Xr1t4JgTgQxzzdqzex5u2FeKBF5Hc6OJCdUNVxd47EKLCLyCBfE
         uXcE7bLCCEGb5Z0rO0MXd3kTijcEcDHZdiWdC0xgyzU5tGvY6795KrUW1AeTIW1gjKUL
         UzPyK/piLtKqeINk5Ek3Yv7TC/yFb8DNULbfXWmWXoAbyouuigacpU5EhHDNX604MWvg
         c3WbLAIy+7Liei/tPXkKuPa7HV8ZaWt+GFnadqEmed6beq8WoR2Ou4i0TUtxIFE+6LdK
         1WSg==
X-Forwarded-Encrypted: i=1; AJvYcCXtNDyERG2rV259/snXvb8kAEG1j5RW1TGs5OfQzbMdcOij3Tdc9wwlc9afw6M3BizVuqC3Ysa9C66+u/k=@vger.kernel.org, AJvYcCXu+hYZXgqpxoW/j/tTWBNgtwHO/AzijEbKIrJhhOZo2WUPakCzWopTJj+zz2K5i0mzKviGVfp0JX4GSg/XWAw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzL6Et2UuAwKS859hu8OdKnHlEhS4/hXbUElO+mxTyuap1gNoWM
	Nz/yDLLpERl1hXBtc1rbGbeeEtCuNtsx1oqGajRTSmk536tnuLX2WGaqiUwjVXUCedNxQqSHwMn
	mgXDBRg1sQOIOimw4tEH8sAnHCcNbHSU=
X-Gm-Gg: ASbGncsHrAO7x/ERszPAiu1vKIW4+7SCk6M4KwG3S59tpFYq3xg+HKj3fcUz7G3kIxD
	DhFns/bACWVDwcLS3RqXe3VejhxHvZAyH+vDjjW0e16o3Ebinh4lUZ5wL+yHuGPJn7xZZBbAbV/
	VGQJOx7+94/gaNeDoEdo6f2EiwsZNiBsBg9glY+0jq+C/rtANcQEcxDg==
X-Google-Smtp-Source: AGHT+IGPFPvWxO0zZJ84NddNpo0qv/EumfthTANDa5RwJtDYi61D2XEZlpdrdwTNkZd/MkrWJNiuxhvruxDIz2633t0=
X-Received: by 2002:a17:903:1105:b0:223:5124:ee7f with SMTP id
 d9443c01a7336-237d996a6d0mr102853315ad.12.1750767907174; Tue, 24 Jun 2025
 05:25:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610132823.3457263-1-fujita.tomonori@gmail.com>
 <175015666837.277659.5038961663728008472.b4-ty@kernel.org>
 <CANiq72=mDe2kB4yQnzb=kwopyUYG936pOoj80YpWk7+q6aJwbQ@mail.gmail.com> <87plet4cjq.fsf@kernel.org>
In-Reply-To: <87plet4cjq.fsf@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 24 Jun 2025 14:24:54 +0200
X-Gm-Features: Ac12FXzytGqFDbRGL6J92HqdAk34F3bl-1kAhuCQB-wQTJVEARH7AQlfK7-O8nE
Message-ID: <CANiq72nwaxszEbn6O3xZi6H9P+U=5N0ugK1n9qBRteQwKXQSaw@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] rust: time: Convert hrtimer to use Instant and Delta
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: alex.gaynor@gmail.com, ojeda@kernel.org, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, aliceryhl@google.com, anna-maria@linutronix.de, 
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, 
	frederic@kernel.org, gary@garyguo.net, jstultz@google.com, 
	linux-kernel@vger.kernel.org, lossin@kernel.org, lyude@redhat.com, 
	rust-for-linux@vger.kernel.org, sboyd@kernel.org, tglx@linutronix.de, 
	tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 1:14=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> My plan is to merge it and go with `into_*`. There are pros and cons for
> both `to_*` and `into_*`. If someone has objections, they can send a new
> patch with rationale and we can revisit. Sounds OK?

I would just drop (or revert) the patch. The issue was under
discussion, and anyway it seems clear that `into_*` is not the right
choice from both the cost and ownership perspectives that we were
discussing in the other thread.

If this were not a rename and didn't had conflicts, then it wouldn't
be a big deal. But given it is wrong and already introduces pain for
others (and likely even more pain when we need to rename it back next
cycle), it doesn't look like a good idea to keep it.

It is early in the cycle anyway.

Cheers,
Miguel
