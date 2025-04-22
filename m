Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC651E990E;
	Tue, 22 Apr 2025 22:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745360674; cv=none; b=ahEpWPh63jYtWZ/nW2Ctb4DPTtBOiEmpbnsh0NcruMGfHw+7hnmhMYoFhSBDy4YeNXK3zb2gTtulUYbNBM1njAux4GDKhCgpt1ICD0Vm9N+OepD9i0DOyAQDt7RaaXvueHihj+KKy989O3bXm4O5incdkDV9gmPqyq5CAehPJiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745360674; c=relaxed/simple;
	bh=bKsRpw3/HJh4vzOZJ+DMduybUXIlX/HGCuzUw9WwpMk=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n+vXeFZGhDgPg0Zrwo5FwsOOXkO3JPVHQ9Z3SxYOtgfxmtHVG0/HoFGYwu6yj0+CvqJWHZPwmUGV0IvvTj5ZLqZ1bDdUe/7NatkShPa5bZGCAkn0lRD8mepLU4MRJkDvwBPexbcvgBb5gkZqgZ/izYOVS0aDMdfaoYwrKNnDRvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bzNGMWN4; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bzNGMWN4"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c58974ed57so546162785a.2;
        Tue, 22 Apr 2025 15:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745360672; x=1745965472; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:feedback-id:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HpFTTPVUTQeIiwPC3slJtA3farY/LD+/e8TE8Mh80rw=;
        b=bzNGMWN4SEod7dwWITflaYNE93SuIFhGI4sRjHQhzzTBT/iaYNL3euJc36racByXJu
         SEKxdoDvcW5gO0n0sUJp+hZR6gFah/zJFtLgjYqLSkJ/JAjm+UA4SCxS+4GCiaLave+s
         0RT4z/5YarY7X/KHNgY2Lw0Cxrh+mGVDF2kVjQ+7/NeF2yPxDUW6TymV+/jQmaYdR3yF
         z25IQNPD9L7RxJomGYNgTFShHi+BFh7oJgMpy2gOTrZbxUDoufXOqWNqPfYvWZf3O1Lf
         Cn8oat0KzSX9r1TibUJUxsPJVgP64GNGlOCHPa/HwYZvc95qqk2WqG5pI0DRPBRbf0/N
         ZJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745360672; x=1745965472;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:feedback-id:message-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HpFTTPVUTQeIiwPC3slJtA3farY/LD+/e8TE8Mh80rw=;
        b=TSNjuDq+THxdLXcKG4FxWymwajCBmwrf4BKkdzCS3sV3Z0slK5ppbSIUq85vZOyqeh
         rNcrM6TS+J3qoBcXqQQYxSudGgc9fBVtkQxFCh6aYLGhShdcLST6sHTDDItictTZmvqs
         90mBQwLew9W+H2/BcISDPzFcs5V0mRAFA7wxP2DPx+tvN+eqFgpq/Atti2XhN2ZZ/+B5
         NTPJeUCkt9AluQFp2ZJ7yvGhY5HYOlPbUOtJox4xezMgHWoFkeh+HPHUbIaILxjLx4Jc
         wyaxIH69wDuYnci9vLLopG8zAGPtT8k94SxNb24LD7XvCZti6S1kuiD+JEkroZYgsaxD
         1SVg==
X-Forwarded-Encrypted: i=1; AJvYcCUzUctEKEynzvQYkkYtb11hXd0mRbC3u5Kpi0or63+wGLyGeFEp84tdMt7ARY6JziG+z1g411raddyOpPr/2sE=@vger.kernel.org, AJvYcCVn8WcQDbRZdDykF3DpT48eMb1G7c/EuqNIbdQTq+y4hMVeZxP+aXgRq+Mzrd47c0hK1TeqRcsUIqEt5sA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmZi7qDcsKe4QxVDa3lmgYOs+77o82rBGc2TfCgNwY4bqGxUlr
	Xa7uR0GZZ4u9B7fyFpboyENvTCHYCAXv5wdPXblb+L4BYvwt6NotBkXmPA==
X-Gm-Gg: ASbGncuFJ8jtJ05DInm0BN6+UmZqZmwcKPKqIGr/NAkRbcKYzlrVfangjcJrGqkuCsK
	r2k9crIQjAvBkyBeUuDosubv0g1sHy8BPzXRf6jqKCmRCmeIsi4l788CWnF0mxodUqzB/37HLWH
	B/wagjAitlKDaxpL/HExD4EQmsXDRIiI2J8jTeIbeh/gFvYxMTyxR49blZshyG+QDrj2ciFbZAU
	zBMz3sSz6ZBsvGOqeR/u8TftwikTjNF7DRTooW20ZSokpWOUuLPo6c31guhqPvMAyE8AsDZxkV+
	ejNXxmHn0OLsKuEFMQf6iZulN3w7PdI8aRZxHIt6LHmfakKuvSZ/gAqx+RU++kdccg3p9plZnOT
	l+3XNZerAWSwqVOcfKzyFZUA/hiRPjQ0=
X-Google-Smtp-Source: AGHT+IHTGWH+2oqQXcVY7jD7PDEtqqy1wLWnahYbKBUkpMPe0CgX5V0ZECRSgnN92YVXl8oMm8XBrA==
X-Received: by 2002:a05:620a:198d:b0:7c0:c332:1cdb with SMTP id af79cd13be357-7c92803949amr2382609985a.38.1745360671763;
        Tue, 22 Apr 2025 15:24:31 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925b6a3c9sm606277685a.100.2025.04.22.15.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 15:24:31 -0700 (PDT)
Message-ID: <6808171f.050a0220.393a1.5936@mx.google.com>
X-Google-Original-Message-ID: <aAgXHLq13zhKj-v-@winterfell.>
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfauth.phl.internal (Postfix) with ESMTP id AF0E61200068;
	Tue, 22 Apr 2025 18:24:30 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Tue, 22 Apr 2025 18:24:30 -0400
X-ME-Sender: <xms:HhcIaAheA7OsHWTY-eOyJIYzfSRiXrRUOUSJJGajkUpJVJnGL_OwWg>
    <xme:HhcIaJBVQCZF2RRXtnyIj1r_IjBgJViowFIhy-uNtbYox-mmAOToV7YQ1yKsqiPHG
    -Rw-_ycyk5Vmv-fWQ>
X-ME-Received: <xmr:HhcIaIEmZM5hF0k_pA2ehgT7x9HYDfc9Q_re-0ktjKjM6x8-HQVoQPBRofyd2Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeegledvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeehudfgudffffetuedtvdehueevledvhfel
    leeivedtgeeuhfegueevieduffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgr
    lhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppe
    hgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepiedpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrd
    gtohhmpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehm
    mhgruhhrvghrsehgohhoghhlvgdrtghomhdprhgtphhtthhopehruhhsthdqfhhorhdqlh
    hinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhk
    vghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegsohhquhhnse
    hfihigmhgvrdhnrghmvg
X-ME-Proxy: <xmx:HhcIaBS3C30YIEyW3gDLiiB5CD1MNXldoRyr2crQUn-Rrn9CBorKcg>
    <xmx:HhcIaNyvLB8e9wDshrcTOHilhQ5m6CzKyFCbJRyiZFq3-bVU2b-IUg>
    <xmx:HhcIaP4kvdNQay8l2j_ue_wrE6Z5TE9ens_87K1vXXt_P3NoSScLAA>
    <xmx:HhcIaKyFiudCeG3YugEHcVf70qBw6Ht8ILuiJDolBd00Du9_H3sbXw>
    <xmx:HhcIaBg_VHVCeiIiULvk64d8917zK7uQYUAd27T5mp-p8Z_HCTSuyEFO>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Apr 2025 18:24:30 -0400 (EDT)
Date: Tue, 22 Apr 2025 15:24:28 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/7] rust: alloc: add Vec::remove
References: <20250422-vec-methods-v3-0-deff5eea568a@google.com>
 <20250422-vec-methods-v3-6-deff5eea568a@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422-vec-methods-v3-6-deff5eea568a@google.com>

On Tue, Apr 22, 2025 at 09:52:21AM +0000, Alice Ryhl wrote:
> This is needed by Rust Binder in the range allocator, and by upcoming
> GPU drivers during firmware initialization.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/kernel/alloc/kvec.rs | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> index 2f894eac02212d15d902fe6702d6155f3128997c..2f28fda793e13841b59e83f34681e71ac815aff2 100644
> --- a/rust/kernel/alloc/kvec.rs
> +++ b/rust/kernel/alloc/kvec.rs
> @@ -386,6 +386,37 @@ pub fn pop(&mut self) -> Option<T> {
>          Some(unsafe { removed.read() })
>      }
>  
> +    /// Removes the element at the given index.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// let mut v = kernel::kvec![1, 2, 3]?;
> +    /// assert_eq!(v.remove(1), 2);
> +    /// assert_eq!(v, [1, 3]);
> +    /// # Ok::<(), Error>(())
> +    /// ```
> +    pub fn remove(&mut self, i: usize) -> T {
> +        // INVARIANT: This breaks the invariants by invalidating the value at index `i`, but we
> +        // restore the invariants below.
> +        // SAFETY: Since `&self[i]` did not result in a panic, the value at index `i` is valid.

So a out-of-bound `i` would result into a panic? Then I think we need a
"# Panics" section?

> +        let value = unsafe { ptr::read(&self[i]) };
> +
> +        // SAFETY: Since the above access did not panic, the length is at least one.
> +        unsafe { self.dec_len(1) };
> +

I think you need to move this line after the `ptr::copy()`, right?
Otherwise, you're using the *new* length to calculate how many elements
you are copying. (For example, in your above example, self.len is 2
after self.dec_len(), and the the following copy would be copy(p.add(1),
p, 2 - 1 - 1), which copies zero data, but it would be wrong.) 

Regards,
Boqun

> +        // SAFETY: We checked that `i` is in-bounds.
> +        let p = unsafe { self.as_mut_ptr().add(i) };
> +
> +        // INVARIANT: This restores the Vec invariants by moving the valid values into the region
> +        // that is required to hold valid values.
> +        // SAFETY: `p.add(1).add(self.len - i - 1)` is `i+1+len-i-1 == len` elements after the
> +        // beginning of the vector, so this is in-bounds of the vector.
> +        unsafe { ptr::copy(p.add(1), p, self.len - i - 1) };
> +
> +        value
> +    }
> +
>      /// Creates a new [`Vec`] instance with at least the given capacity.
>      ///
>      /// # Examples
> 
> -- 
> 2.49.0.805.g082f7c87e0-goog
> 
> 
