Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3C22EF283;
	Thu, 26 Jun 2025 18:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750964158; cv=none; b=WvRsV3PekKZMgwZl1OmIDnpY/KWFUHaTilMRnQiw5HHD3iGdKSMgIinjcX01yY9g+GtQZ7grJUxPE3cpF2nklWuUkMMxFLDIlZSwtWwswIy9O7WNov16ap4A9VSzYyfOL8QtGZjEgASfrNi7MQiUpO123WdKjZZwXSg2v639bY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750964158; c=relaxed/simple;
	bh=DRqe2nzX4jfqs+HlvB+tuxCgIsyE7/oimrxK3Tj39sQ=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P7ZHaob6uSXcVrZ4MsYgzG3+0J4mHty4WL7bMzOkxQJy/aYypOD8cMWKXzqZYWLJati67p5mDBjhwukq77ZBBSi/xnGj0pplatSwrkrC//BBrbsgKt2ZxSFzPU0PxOtWvXjWzFmf7gA1hrgtuaojIGCKbo9hOwAq8sYMOdnwbkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kf1EjS+L; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kf1EjS+L"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-747fba9f962so1309308b3a.0;
        Thu, 26 Jun 2025 11:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750964157; x=1751568957; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0qV2RBXaIIhVx8uNkXIn8vYQn7df28o+lZ51Nk6sfdk=;
        b=kf1EjS+LMiU99CladPCHgYjdZ/TpJ+/xBd67TnEZTMlp5UB7FFMVLjd7mF3tvHg5P/
         5jfORerA5kUA49Pyh6z3RggJoiw0GzXiHb9Sgmb+6Ilk+I+sMPib2JKBEsk6X3xzkDag
         K4s5jxKFiL2CJST4JZiXkwFBK4g1VzRvadPiKNvR1LZ3I/5E4C5IHkn5cOFy04wH96sI
         LRuZLB0A4+VpFE5Vi5SX/4L5YAdHNqHJWdiNZZBAiVTVnAYEZkSzKvNA6KwM2oobJ6va
         uKORVVlm0FXnD78X+3L0AamOXgTaMbJNRM1gM7VAg9wiYEuwNc5c7VzKKhlJ/hIXcv2a
         7yeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750964157; x=1751568957;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0qV2RBXaIIhVx8uNkXIn8vYQn7df28o+lZ51Nk6sfdk=;
        b=nUWqbIl19pwNxy4Ks6UuiDutA4hSkGQxX6pdLpXk545RAjp9V3wuuX9+HGPm6kBtWw
         RyFcJncE2MJY3J4n5NWv0IaPhC/m7D+2XnmAaLxyuIlWPMfdtAlmPYtCaKmQq3RbwHJv
         MyUBOB0ZLEQH/hFCf94WFnkI2XiT3AM2DL/M7i7KwiZl7f6l4Xj458rYKD0G2u0Ny95s
         SSbbgK68cNWVXDJMmSFiOnG31Buo3WMitXna+/EYtAruzdDJ47wNGIUneZaKI34mR+7Y
         G3cH80uiincmqaKoNgL9yKR2UsGzjOPujweEDHbenPdZY6GXuJRfSMwvIzAGTonfRkO0
         YXUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMi+EQastO3Y/hatOV2/adsgYyLGgc/6UJN1hKe1OEkINonH8Vt7wBS02pPG4dTIJX3w5fMBiPnggqbM+b0Jg=@vger.kernel.org, AJvYcCXHimhtArMO+zSxMRSZ3+phKHK2kXqjvfBchJqJfv1nOHxGwOiJylK8T27hcFKoy+LvEniMKA7ZgSxSUSY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdDhfRpclwDTQDrBLGz1todZgV28b2l/XzYLzORKksVTjOatVv
	IACfryoNgHV0s2+rWxF+McRDSNmPOWvJuJISPutMdc58pwPn1gIELpOO
X-Gm-Gg: ASbGnctMbDep9ZfnIDdgtE22v3nWb4werGYX3ZIaT0/uA5VG3qYYkeqrQ/CdPgxg1fU
	nbiH2pXveM9u8eBj6489gGSwc68edGsbrmeC1JCPYvOMWCvnyzgwl4HaG85aQ3TA+ZlSiI8GjIh
	x2/3bk4OIN+0i+wSXAYtk9Cd/eLPU7huab5oEjt1h7noYe45v55H4dnz7qfx9Vz6fJRKOI5CoHY
	DKADVimV4G6N1+RcNSg/qXLc5sqMVAun0CcNkEZX1mImq8o2rBnbryM+2kEAe0dcX1+Mgj4rQ3r
	QePpjVAzn7k5UAPZItC7ayLLB8ZLLuHHvAVPtZKrNkeMbK/AIDOhZ8Og6P50kxJrDSM=
X-Google-Smtp-Source: AGHT+IHZdd4iUO4X6OH+qrKIWbRgtMr1OIG9uLTQ7Q5xNEgdniTrrw4+dcC2e9htVhZ+MGs6rFhtoQ==
X-Received: by 2002:a05:6a00:b52:b0:748:6a12:1b47 with SMTP id d2e1a72fcca58-74af7aef473mr149120b3a.10.1750964156834;
        Thu, 26 Jun 2025 11:55:56 -0700 (PDT)
Received: from Cyndaquil. ([174.127.224.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af541d2bfsm379466b3a.60.2025.06.26.11.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 11:55:56 -0700 (PDT)
Message-ID: <685d97bc.050a0220.3c0bff.7a70@mx.google.com>
X-Google-Original-Message-ID: <aF2XvKbsgJUs508n@Cyndaquil.>
Date: Thu, 26 Jun 2025 11:55:56 -0700
From: Mitchell Levy <levymitchell0@gmail.com>
To: "Christoph Lameter (Ampere)" <cl@gentwo.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 4/5] rust: percpu: Add pin-hole optimizations for numerics
References: <20250624-rust-percpu-v1-0-9c59b07d2a9c@gmail.com>
 <20250624-rust-percpu-v1-4-9c59b07d2a9c@gmail.com>
 <d938ed3a-cb00-0a71-2380-dac7d1a9e039@gentwo.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d938ed3a-cb00-0a71-2380-dac7d1a9e039@gentwo.org>

On Wed, Jun 25, 2025 at 10:23:42AM -0700, Christoph Lameter (Ampere) wrote:
> On Tue, 24 Jun 2025, Mitchell Levy wrote:
> 
> > +                        concat!("add gs:[{off}], {val:", $reg, "}"),
> 
> > +                        concat!("sub gs:[{off}], {val:", $reg, "}"),
> 
> > +                        concat!("sub gs:[{off}], {val}"),
> 
> Where are the other RMV instructions like this_cpu_xchg and
> this_cpu_cmpxchg, this_cpu_cmpxchg_double etc?

I wanted to stick with (what I saw as) the most basic operations for the
first submission. That said, I tried to design things such that adding
more operations should be straightforward. Happy to build on this
further for a v2 if folks are interested in that.

