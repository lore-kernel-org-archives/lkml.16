Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1152750F1
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 18:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746037001; cv=none; b=GEvXBKgvaYPzxKjFI3E8UAHgkhY/phVGbBFci9ZYZ7G6FVRsvI0dtE2gHUQulcjnhr0XjdwSh9gkXPriLh8OI27pLTqCWDEfb2be0wx4wrBncRslowc+Ec/lsaUX05w8zK7mj+J0LtNbMYPSqFGWpuiqqWiLczM2u8wTvMOHooM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746037001; c=relaxed/simple;
	bh=S2zZkE8kYk7DeYMqbaUF/R2UUdCZOiBVgolXvwU4Qzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hey6snBH7IwVYpCvfo6VfECsg7L81cHncPN6+VvyJGnrXHi0cxtrU4Ng96YSpJP9v4PMIOaMpaAVDGDMJ3reiapwWwG2AdNGC3PJiqneI1N7/ykW+UT/ptGKzPtD+Xat+FbIvWGKbvJqi7sT2ogNn9Ql8KSi8L66e6jqCJtq104=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eoNGQ7+S; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eoNGQ7+S"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2240b4de10eso224065ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 11:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746036999; x=1746641799; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S2zZkE8kYk7DeYMqbaUF/R2UUdCZOiBVgolXvwU4Qzk=;
        b=eoNGQ7+SZM4rlBucKl/0DaYbRi30+E4Bjp5cIjS22O3Onb++0R8yNXhIvpckylWMne
         UsqOlPcfo5BvpNnnVr+18SsNQ+zxpz82K/XUhvh05WSjFERP4wI5D52T3JQgyskGEOO8
         puiUtdL35+3ueFO9+BTTMpqVVKoChdyie1HxXuNjzNO6cNV+oZa8aJ9GwVFCu4KhMUNw
         k45V0P6LCjCn8BijcX81dBzvwi9LrUwebEU7NoC+Ynqz4Ni/TdosiNuDUMh2msREfKBb
         UcQo4p72QxrYQcVJb1t4rg6slr6ky9vUHTZCr8BsJSvn2WRqcfkBs+8jMPyJR4cWk/Ht
         IKJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746036999; x=1746641799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S2zZkE8kYk7DeYMqbaUF/R2UUdCZOiBVgolXvwU4Qzk=;
        b=rzoPkK8hJyAD2IHoQDcGXO0KR62I7hDWIcliQevEgL0iHF6mZKd4HMBJqumrtDtjr9
         uVHfj+50NJ4JdlonF7tfysMOv2HHSd4PK4hZ2JosTssPqr20CZpIsldtzhjVpCqrWmGO
         hWYpC4e0Yg9vbwGZWo9HrTtocns5j/D0UUy+ey/D9oRYTpU02gMpQJG79KxBTw59h6Dp
         ttJB4xTwGFFd8re17VC1s4qGIB5/FFHNGawwV90jT3vPfokXFgH+kH5NAAmPy34iMT5f
         pO44hbLF9rlVT2GkA9MELE3lDV4Q2p9enfec8WMmKqfgLkWFqKjcFWlQt7Z52RKX/460
         WRjA==
X-Forwarded-Encrypted: i=1; AJvYcCXYYBMXXStLyZabHVXT3CIlRny6qedJcct65UU65XIQ0muvyOLKXSgzhsPv0Lhq+WkkRfHjKhDSNkgtqQM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8HizLDCwbpqsaoDHNz4iar8WOWI2hFAe+Jav/V9DOQGpUprl8
	OOhOG+61fecakv8PQYjhVyaTwi8pvp+xyEbORW4vr3+SKh31Hbn1a5Q+QJxdeg9ZG2nRTNqnIym
	Lfv9n3ftWzZntKUKtJ9pWaJg6NnI=
X-Gm-Gg: ASbGnctTAckIFN6yA50RrWlOU9GMVPOvVs8ZmhG/uSsIYAZuENLbtEP91KYECud+54C
	1hM8XuJDJBJVGHGokWMWl2Uf6Q7QS5LNfI88yuSC+Ibxd0b+HEBkwcp2bHIOAdXWamgaMAo6EFb
	WzwZE8u9Rp1KFAUmsBCNIc
X-Google-Smtp-Source: AGHT+IF1N28ck+ncNtfwPcI+Xrl/j3rXmoy8i7dANTP5Fh1Weylgg5D+MGt+ZyUiTckDw4nsn/uqlyoK2BhO9nWWPw4=
X-Received: by 2002:a17:903:1b2f:b0:221:751f:dab9 with SMTP id
 d9443c01a7336-22df5835e22mr21391885ad.14.1746036998735; Wed, 30 Apr 2025
 11:16:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430165343.GA1436080@ax162>
In-Reply-To: <20250430165343.GA1436080@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 30 Apr 2025 20:16:25 +0200
X-Gm-Features: ATxdqUF9QKjnhgdhbv81XkThLwmEAwlHnaUZr3nyNeFy-Sx2UyqWacT6ckzKa1I
Message-ID: <CANiq72n+0kxXfbnDsjNMH8wUXAPySfnPKx5OCoppotiNye9CVg@mail.gmail.com>
Subject: Re: Prebuilt LLVM 20.1.4 uploaded
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 6:53=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> I have built and uploaded LLVM 20.1.4 to
> https://mirrors.edge.kernel.org/pub/tools/llvm/.
>
> If there are any issues found, please let us know via email or
> https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
> opportunity to get them fixed in main and backported before the 20.x
> series is no longer supported.

Tested the x86_64 binaries for Rust x86_64 and arm64:

Tested-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel
