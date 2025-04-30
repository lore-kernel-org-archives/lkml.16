Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A75925A33A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 10:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746009760; cv=none; b=gTIgi3boPOYBUR8rKPigj+EdiJIPv+JPx5R100UBj0mDg/ZfH1yPJym3H0W0WzxhLcmPxFlwnQm9HRayHWCAcre9n4lyeGBohN2wl0csaw4YA6y9usyXO886kJb+X14UHdmoFwDYZhIIUkXwCB//7Fh6TRiVr7ibKriylbpWsCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746009760; c=relaxed/simple;
	bh=JlLvldGIfDbHrnB5LrDceGt+7VtfTDEk9EgBP//rGyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nc4dtUaRiNEbclKscAgPkZU4zgQOdoJ/iHiedH8WGg8wd7OIdY+MnMdCN/T3/sUxK1wQvdJmUoeVORAuhm6Nu/1G4Qs8WQJ0m/XjIBP7v11ckJSlXoYTFCHzk78lOTyLYxl8eByRv4Wu9uKNQKNjWjacJnx3We7IsgGNZa9Lj1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DG4fGBLl; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DG4fGBLl"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-736a7e126c7so6521548b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 03:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746009758; x=1746614558; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4gl3XU8JoJn5dwDW6OC+cxv1hib4kwdH98QGnhy+dmg=;
        b=DG4fGBLl7XAHMyiYPRpIQw1pTKIAMhdsH2z9e8JvuFys7Ef9CzDIf/E3Z7+WiC9rdJ
         ojseM2Zk8Gnz4fzcNUIGAbI87zJk2y/hjenhPCowerDToR4J8zqlcOo3G1V0UmwEIeZi
         wW2YR20mShYU4sEEye6A2DZRVlZs3bfPDfnQlEMCCggyvwjtNE37LUjRG+9OT16CQxKv
         nqlw3ckUUVo2bUALT5S80/jlG7TE92rmHQ1P366XHWdYvW3Hve5UI1XXVBCJiB0rkU8m
         eaWhEbVJtApin6MviF4HG8BvJSP+21nUfx6KofwMUPPvn1fbXa9W6NpWbMuOJMScvl9X
         y4DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746009758; x=1746614558;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4gl3XU8JoJn5dwDW6OC+cxv1hib4kwdH98QGnhy+dmg=;
        b=WlhIXiaREWygCKq2X5N63X6b/Ssz3QY4dRGrD5xTmIssa5tUB65GbsegUJCyi0wloj
         iwZtNF8Rs28+E4zrmmffG2bTj9DG/I83PsnpBC9xkdP+HQWsQ10RUPOvfQtiaetPQqY8
         5djqTdM27DQ51pTJiBBkHpXJDCJpfWyDFKLZhIw+rAps4FZKA1Yp4usNJs4M2FVtg6mq
         nwG7aNMrpyBai3UdaMPX1bj9tQ7in86VRrm+g+eQCSX3GqYvgCbIxhsJ7FpVwGaWa4T1
         1yprdVft1/hA3PJWFZPFFeqLWNkqXjfAqAZI+MuKzqTduhTmrSbihl0NuZ5YpbBYqelj
         OYrw==
X-Forwarded-Encrypted: i=1; AJvYcCXUlYV3Qs2JddVPwnQE4tufeLY1VSrjuxS97K4B7t+WTgdtP/9liXQCm1qLZDwk5v1VGvayxSPS2TpZf0E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwK67zH2RUxux8LNXflqs4y4375Jw5cwkLU71E7HQsSv1YA4MUS
	aaP08sxMDYe+ZIDWxVBDU+0XEa5CrVrWBRffejv0ns0E+w9md6IDikH58mVIB08=
X-Gm-Gg: ASbGncticQezOo5O92SE27gXwOS4BCQhyTBrWkRYCvA3/Ec7sxSxjJQ4l5GksfMQT+v
	RWgOk1vpuE37TQf9qNQfMjx1bNcSwIV0tH2DGy3HNrIeTFU/I+56OBoWu+0c7iPP9b+zR++Ca65
	jA7+U/nr25hLbtL//15xEAhOwowbfur3OXORzv3vMyAdOTMeO1Q9XzZlbVYCztXMZiKzzfSR3fB
	sZcoPgVSWlL1VR5rWQpuUgpFW3yjZDZbMsJulSq8dMPCyRHxHx6NYrIikvhWA7nqdKPupM44sZO
	xaLAg5W0fjv10BoTU7YNUAEwJBfghD29zdfXQpY68w==
X-Google-Smtp-Source: AGHT+IE5aoAUnm09kBy2axv3TvAAHpf075PJ6ak0Gwu1Lu258byCuGSU3Nwqt2mSHiDYVnppASvXrQ==
X-Received: by 2002:a05:6a21:8cc6:b0:1f5:591b:4f7a with SMTP id adf61e73a8af0-20aa457e4a4mr3055673637.38.1746009757697;
        Wed, 30 Apr 2025 03:42:37 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a9451csm1291575b3a.167.2025.04.30.03.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 03:42:36 -0700 (PDT)
Date: Wed, 30 Apr 2025 16:12:34 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andreas Hindborg <a.hindborg@kernel.org>,
	Tamir Duberstein <tamird@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the rust-xarray tree
Message-ID: <20250430104234.dmwnn5ih232kfk4z@vireshk-i7>
References: <20250430202315.62bb1c1b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430202315.62bb1c1b@canb.auug.org.au>

On 30-04-25, 20:23, Stephen Rothwell wrote:
> Caused by commit
> 
>   a68f46e83747 ("rust: types: add `ForeignOwnable::PointedTo`")
> 
> interacting with commit
> 
>   254df142ab42 ("rust: cpufreq: Add initial abstractions for cpufreq framework")
> 
> from the cpufreq-arm tree.
> 
> I don't know how to fix this up, so I have dropped the rust-xarray tree
> for today.

Probably this:

diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
index 49246e50f67e..82d20b999e6c 100644
--- a/rust/kernel/cpufreq.rs
+++ b/rust/kernel/cpufreq.rs
@@ -630,7 +630,7 @@ pub fn data<T: ForeignOwnable>(&mut self) -> Option<<T>::Borrowed<'_>> {
             None
         } else {
             // SAFETY: The data is earlier set from [`set_data`].
-            Some(unsafe { T::borrow(self.as_ref().driver_data) })
+            Some(unsafe { T::borrow(self.as_ref().driver_data.cast()) })
         }
     }

@@ -657,7 +657,7 @@ fn clear_data<T: ForeignOwnable>(&mut self) -> Option<T> {
             let data = Some(
                 // SAFETY: The data is earlier set by us from [`set_data`]. It is safe to take
                 // back the ownership of the data from the foreign interface.
-                unsafe { <T as ForeignOwnable>::from_foreign(self.as_ref().driver_data) },
+                unsafe { <T as ForeignOwnable>::from_foreign(self.as_ref().driver_data.cast()) },
             );
             self.as_mut_ref().driver_data = ptr::null_mut();
             data


Andreas, is your xarray-next branch immmutable ? I can rebase over the
change then.

-- 
viresh
