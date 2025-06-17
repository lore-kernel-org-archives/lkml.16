Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C332CCC0;
	Tue, 17 Jun 2025 01:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750125324; cv=none; b=A16mC9FJqa8WxwN/9a9YR6JWu9oIE8PbIWpUvmNqWkwRSWTlkZxHmU/HLIz+bn0xgv5Ug6cAW11fKVXAjGodyGUp638l+z8GbaIVRWIfx7cW0GdLyKZ2a4VqWgu/nblCL/63WCbZW5B4jEsQrxONUELOjGuB1kxTO5KSVjULozo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750125324; c=relaxed/simple;
	bh=7D2Sij5eStXvjkPStHg2z59sJpTqCj9kwkk2rUQzLJM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cW5hTyWMUh9cgXAKnArDXa8IqAWqJVKo4xtjfFzsA8km5aBJo+udSPhbtl3JMlpVn2DHQV46Mghb3y/FIc2E45/k6Wz5d6dfWXJatbGl4saI/pdwMpY7bnvFti56IQ8yqh8Zw2S+wmd1Xiji68o3kyElLmWRZa6ve7BQq8Hqlgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AStBf2jO; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AStBf2jO"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4e7b20bdbdeso220106137.2;
        Mon, 16 Jun 2025 18:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750125322; x=1750730122; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sUuVVGPtVjyT2ofmlY7W4gndj0hfhhNOGd7d9phE6/c=;
        b=AStBf2jOhoWCeBuzJSog6QqL1DacwDZ6ZIzyUHZUlLB5odbAIV315Abax9t0zHTX/k
         LQm/SwqTnxfT8bg44RZrlX/Wi5G5eEFAQTk9hjl7QPZJZ9BO0HXtyobMURa1VQ+OYCuQ
         t/M4brFzFpiUWDHxy+Gb61TxOYORCcSxf55TUq7MNT9hkjzLgPWedn9r9DNxBwgZDC68
         8h8+3XpUkRWhBBbBCvxYP25QWjKutjCWa81jKow96FfdZgILzNsLBFvLuAtXkcWKmt4p
         EcqWBi94QrwHeRT8wtK1ZWUTypL+Oqv+TJa//+Y/Uj+K9/3vwJ4T4ZmfjxcdCCLAwpTK
         KTIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750125322; x=1750730122;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sUuVVGPtVjyT2ofmlY7W4gndj0hfhhNOGd7d9phE6/c=;
        b=wGZo5p6G7c6gX9wvcRZfjRtFca6VJ+nedzSs+5n+lJI6stdT9+vkBsfRZGLagOoM4V
         D435x9hKKNk3CQjWMDZRh7ndJAgxVivL3+HT6u5TThrvgvK70X75DxldLDFrjUv6sHPB
         YKL3DjwB3qmLOpUaOgT+zwSWlRBeeuS42SFfurkWrpr5cAoAeL8Z74m+99W6L6OMP0J/
         WUHIK+nDyTAwnb5HWDntOPig9UGISNbbs/avpbH7w1opmgF81oPzbggoeGXN6gYsZ7/6
         BsabKy+0FSMupv+6M1XSWJBaUf4zNlIP8udw3EBxudqoqi6zyP38Jvee22ZyzPBwegjt
         zj7g==
X-Forwarded-Encrypted: i=1; AJvYcCVK5f+ZmwbUkiUX3YXHftcG7spxgu3PKe2Yl1ZD9wD0Jp0atC3gLrN4i6UWn8Ds19UVKZJBgj0o5lcLba5IjuM=@vger.kernel.org, AJvYcCVnz/E6UdeHVKjpxjSyGUC02Gp6FJg05OTUqZYmt74sM9RACZAFGt+u3t39ev/mBMGXLvxFMzukKlYI8Yk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQvH6bQugnvLA3afXSrAXK+pmPBYeaspdcuWXxo+ubfL2UGqyr
	K/U3G1GQ/yMTJNszF5emt9e1ETqbvPCT6aPXQZ5XaYdWrcpZFoubzR10WI/SozYq4Wp4pWWMpsd
	T2TO5jb+yrq6U/gadfLfRKDebBUzQbiA=
X-Gm-Gg: ASbGncvfXjhljP7dQGUf1ajMqjtvHWb9Egm7DlEf7krF4onK2VIAwafXtkLhzV4nYOG
	GqLxq5UKZd5eMC23ZiyCliCl9NsOjfnc/TnuFkWux4ARZ5nKYSySIQGdM0QWu52nMr+xmL0MvVc
	Rdq0QPDqq69K8QeuOaSO0pfwS8kDPrcT/KBkmLXHpxCCG/
X-Google-Smtp-Source: AGHT+IEMim/AX7cWcitNok29/D3Fxnz8CTs9VqWlM9ZEE5RHw6xa11aIKBhKkCg5Gb6IHewhq8dzNlja2kGCQ80ueHU=
X-Received: by 2002:a05:6102:3e0f:b0:4c3:64f6:861d with SMTP id
 ada2fe7eead31-4e7f63b9c10mr2597207137.7.1750125321567; Mon, 16 Jun 2025
 18:55:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250615072042.133290-1-christiansantoslima21@gmail.com>
 <DANSZ6Q476EC.3GY00K717QVUL@nvidia.com> <CABm2a9cs+pTT49GW28QViwaK-VT3=Y+sV209-Lk5S_YxEnXv+Q@mail.gmail.com>
 <DAOESYD6F287.3U3M64X0S1WN5@nvidia.com>
In-Reply-To: <DAOESYD6F287.3U3M64X0S1WN5@nvidia.com>
From: Christian <christiansantoslima21@gmail.com>
Date: Mon, 16 Jun 2025 22:55:09 -0300
X-Gm-Features: AX0GCFu6NPEKJPI2ZZ2g360Ul51fQ6ryF10BwAr-A376uo_LsITLk6cJ86mkDgg
Message-ID: <CABm2a9dGo1eMBAAUkEgtKoQ7w=Vdz8e4yw_prGnxj6v=mMq9_g@mail.gmail.com>
Subject: Re: [PATCH v7] rust: transmute: Add methods for FromBytes trait
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ~lkcamp/patches@lists.sr.ht, 
	richard120310@gmail.com
Content-Type: text/plain; charset="UTF-8"

> Or if that is still unclear, consider the following doctest in `dma.rs`
> that fails with this patch:
>
>     struct MyStruct { field: u32, }
>
>     // SAFETY: All bit patterns are acceptable values for `MyStruct`.
>     unsafe impl kernel::transmute::FromBytes for MyStruct{};
>     // SAFETY: Instances of `MyStruct` have no uninitialized portions.
>     unsafe impl kernel::transmute::AsBytes for MyStruct{};
>
> It fails because the `FromBytes` implementation for `MyStruct` does not provide
> a definition for `from_bytes` and `from_mut_bytes`. Fixing this is just a
> matter of changing the `impl FromBytes` into `impl FromBytesSized`. But without
> the latter, how do you make this example build without providing a definition
> of `from_bytes` and `from_bytes_mut`?

Well, that's fine with me. I'll send the next patch with this fix. Can
I put it as `suggested-by`?

Thanks,
Christian
