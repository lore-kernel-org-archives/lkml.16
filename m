Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C4721348;
	Wed, 16 Apr 2025 09:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744794669; cv=none; b=THD0UV+2k1eKWFoPyoEoQhbjMjuIEoa3WyxVbXdwBnNSyVh9LZl0xuQP2uEq88RoJndwwSKL2tE/Drov6EN0PTOTO6bSPXCEmSwDteM8CQ8ICOMsnChh38UbegOF3hixoUzbWMTNGN1XlhSFSaFTsyQZDBEHKQlPb4PkkpP8vjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744794669; c=relaxed/simple;
	bh=AtY5vCivUnBR0vr8Z7EaJmyKgVbE8L3XtnXTMwpNR+w=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Z0qnOjX2ywprRGsDsSWUf2eEm1u1/kdtMtOOqyrRU60yLe0It30/08oydpOdRbkdNy8Y6w7oIswAQeQdm87XgxwNw5BTRjJI4Evgq3ColbMgHpQ9jweO5fUf8Vtxj3lC0c9gxYJxOdHPLdpKqjdD8RsdQnjgHTD0tZjI3sRAZB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e5WZQtVu; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e5WZQtVu"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-73bf5aa95e7so3051415b3a.1;
        Wed, 16 Apr 2025 02:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744794667; x=1745399467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b4mbYeAhYj76HKkcUmLK02pGls7z+XSlL/utySAHKNk=;
        b=e5WZQtVuYZepX/X7D1nRqHyPm+MCBr/fXF3QbtuGFgd656in3XVvSm6Aq41SbrBRwV
         02bCZRWre23bdUvaaXpeS/4QtFVQQzHMjzANdSC7AZjw5pYqaSf4X7rvRgpvGsDGUsT6
         r/U0cyg4NzBT5dC9ElMSQRyBJQA4FnJiVHWnzeJx/I5Jhhws5KCkBT8S/AHk9EeNOnjH
         WWCBgHg0uSsX5ocMeWtNwyWu+2Dsyd/apgksMxS2Vg2S327uTMPepBk+kZlOBG7GPe34
         VBuLq7+JbocRIDeDZGEPvFycBMtQ9lRnRCCokXa9GO8pKUWRwqxgUlevcnb/7NfUT2F2
         DGmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744794667; x=1745399467;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=b4mbYeAhYj76HKkcUmLK02pGls7z+XSlL/utySAHKNk=;
        b=VybtcIFhBoooBZ2iwFo4Cct1zIGCYocQmqz/yqI1a6yrhu4R67GuNPaQkCFAZ7Wyrm
         C4lZwKZYCxXpsdVpLubAhJwP/dVJ/+lZDUD/0q4CY5dABH61/vOXRlxmvFhZiugFaWJi
         tjYnh/RYdGoI1MoxjZvqwZiutXma63N5Vk8KylIeq8SnHWJinxcZqg8Z/FstZPzrlyB+
         xeO2p12GtBDvn/Ez9qLFc0JpUfss3juH2JqjkO4csKIMmm+FSBH61bWZnjrIXpW556x2
         NiwjJOKAmXzrOO+3JoMkRX1hO5k54Dd2SrJE3evPqhiV3ZRXtJNyfV+X6YjB16wpEmxN
         1zYg==
X-Forwarded-Encrypted: i=1; AJvYcCVHwu/6LgrLv1kfSXIBA3LaHn6bap7YPX5zAboEqIUM+EBfrAyAuWH3lJ/L++yEIxT//rlID9LGQEOy7Z4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9LgAmvMJqkMwUCIcfz2kJz/CEVpqP404C8Gu2ncSNZ83YBHo8
	soMJMXx5DCYushTXVZIDXvUTt2xTDr2VLUnNZg2YVzp8aMUKVDDp
X-Gm-Gg: ASbGncs+ru0FM8cYD+2iLN+Gk3CBzmniwT0g4eV7MMb7F2VVbdF/96ce08sOUnX0bqM
	eMFS3DKLpzOSgTL99F6Ta/Gw8AEjakjIkrpz1ZXgeRcqnifpPEHlvKrtQGyKJH1ut1yP3w1UrbQ
	BnaJf6KmnE25QG5CXzk7bh+1pllBSVFKP7LW6mvGJDdkgwwjBJ3pJLoTC1gI2YshSHXdmYC8atD
	bF6BkHKlPUFtCnG0F3kPLrLE4Tg3IgwrlB7cOpnTQf8pMeMRWyHX47URrVnZXN+jkEdSlzAOgw6
	J2S7CTQSf/GNrGlLpFjCGomIJu6oCbZHWVRAW4AoyNXgClrOS4tdPF9cT6mhz1/M2Gx50NzX4/s
	alV/iEvpEv/SvZWjp4CG36m4=
X-Google-Smtp-Source: AGHT+IHf6WO1KXu2HSqftaASOjEykjjs2Vgkx2pPpqudgmlODBjdiG+G06KiYZc0vSR7NKx9nt5IzA==
X-Received: by 2002:a17:90b:4c8e:b0:2ff:618c:a1e0 with SMTP id 98e67ed59e1d1-3086417278amr1599763a91.29.1744794667128;
        Wed, 16 Apr 2025 02:11:07 -0700 (PDT)
Received: from localhost (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-308611f42dbsm1065061a91.18.2025.04.16.02.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 02:11:06 -0700 (PDT)
Date: Wed, 16 Apr 2025 18:10:50 +0900 (JST)
Message-Id: <20250416.181050.897424811905103869.fujita.tomonori@gmail.com>
To: lyude@redhat.com
Cc: rust-for-linux@vger.kernel.org, a.hindborg@kernel.org,
 linux-kernel@vger.kernel.org, boqun.feng@gmail.com,
 fujita.tomonori@gmail.com, frederic@kernel.org, tglx@linutronix.de,
 anna-maria@linutronix.de, jstultz@google.com, sboyd@kernel.org,
 ojeda@kernel.org, alex.gaynor@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, aliceryhl@google.com,
 tmgross@umich.edu, dakr@kernel.org
Subject: Re: [PATCH v2 5/8] rust: time: Add Instant::from_nanos()
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <20250415195020.413478-6-lyude@redhat.com>
References: <20250415195020.413478-1-lyude@redhat.com>
	<20250415195020.413478-6-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Tue, 15 Apr 2025 15:48:26 -0400
Lyude Paul <lyude@redhat.com> wrote:

> For implementing Rust bindings which can return a point in time.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  rust/kernel/time.rs | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
> index 8d6aa88724ad8..545963140f180 100644
> --- a/rust/kernel/time.rs
> +++ b/rust/kernel/time.rs
> @@ -83,6 +83,14 @@ pub fn elapsed(&self) -> Delta {
>      pub(crate) fn as_nanos(self) -> i64 {
>          self.inner
>      }
> +
> +    #[expect(unused)]
> +    #[inline]
> +    pub(crate) fn from_nanos(nanos: i64) -> Self {
> +        Self {
> +            inner: nanos as bindings::ktime_t,
> +        }
> +    }
>  }

We need to guarantee the following Invariants.

/// A specific point in time.
///
/// # Invariants
///
/// The `inner` value is in the range from 0 to `KTIME_MAX`.
#[repr(transparent)]
#[derive(Copy, Clone, PartialEq, PartialOrd, Eq, Ord)]
pub struct Instant {
    inner: bindings::ktime_t,
}

Otherwise, The method of the Sub trait may cause an overflow

By the way, what are some use cases for creating an Instant from
driver's input?
