Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7CD1482E1;
	Thu, 30 Jan 2025 21:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738271674; cv=none; b=RvzEbwH+39bf01qWjvB6UVIHGAk0i3cdTRaiY+5zF93eDcUEwOepdJfG9EbGc1amRRf7l6t39fYt2bsRJHBSXHU4Gxq1KoXV2NrG2hPOUaNPNZ5VRQV05rlDOT+3zEsJgznZtyEtnn2Azo/K+UcgLDJBjaC0joRce7qA2GnpgPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738271674; c=relaxed/simple;
	bh=+2T0hd3zXQIgerMh8oTTU/0M6aj16vS3vzSpNL9Lt0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EgapdOspdjJ2/hT3/IkkAyZAlKz0k+mYzbro38G0N5shiSBS1soKQipg5kBhTHq4PXC8/LBQu8wURDezrBtW9QOLTwjd54ax4EkCSJfxgriww4FJbjU4GD486N20alqXZB8EJpoxS3O43wKpbpAY5ZsTX3o5DqM0u+vSomZ11Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ROdzVAGb; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ROdzVAGb"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7b6f8524f23so161989985a.2;
        Thu, 30 Jan 2025 13:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738271671; x=1738876471; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3WWG1ge772v80hApUsKf1Atr8Hoo4w8n5tFfU+25uuw=;
        b=ROdzVAGbkz4TqzCoEQj4tRpWMnGEVb/K7HPM45LaEF74NS5M8ffbwcI+62muDtHGWJ
         a+8HmzuG2f0b1KAkZ6gzHbGu55w2zvaCYyUHyWQMEPm4l6Vq+4zSkpWnh04LkAIuq2aZ
         Q6Bk+SfE62Q5NGKMPTKPIb3VA4vnxZSDHktZjcG5J45YYI3YOA55YuNfYe7U5cbUnh36
         epiEUSjxF11buqkty326BHhHp0XVERWxwQcOboCbqLReBRvOEe8qJktOPZuFsva956ub
         LS3I0SyTx4fLYYyASIt9W6L7T97nXu11D69SCInJJYm2Q2cE3IbU4o6h8hqkftWlSNaH
         1CRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738271671; x=1738876471;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3WWG1ge772v80hApUsKf1Atr8Hoo4w8n5tFfU+25uuw=;
        b=n+WbXpgq450QWQXoeLzFKsNOBJAlcazoltAtsxq/xiylzJHUnz2i8KLFqKHo4VfuQ0
         GDt5hLzdnmbbZUiJcDKUt+GYkTercJAVBhQh5ONKfvaDl2l2i6DuTMnsLKMX1+ttBeei
         UJFyp96bm8bFvyQK8oK9iuhTtbNqxL9sZij47MZle7e7GPRKVmYcYiZ0KbjarcdFQRr7
         EKomj0jGEU7StEAeqvcog5aS3nMQxR0ur1GNsC/vQ+6VZiwQM4n0C9u1/SLumTNIXs/9
         rJ7DYletv8ASIfe0Jzc6V3nSyqDFzmLMrLdr9bk1Fs9iT0udXiM6D6khHbpNhZzOzgvi
         jjKg==
X-Forwarded-Encrypted: i=1; AJvYcCXYVyBuBvmosyAxcmAHBYT2+lo2oystgEtWejIlWUjjUvxLlw8qVG9AByJBHmN3zYPGzoUo3qzk7KXGDRM=@vger.kernel.org, AJvYcCXw06sYuM687ZVOpVgeWDjZIenXZQT6SSLcXSHb7wJYsCAM3jWYu9mkKduMt/+QBlzzPhFRzziZpGL4slDhsCo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKuCa7IrSA8WngT2QSPJkA5WIE2yacoKzlaO8swIt2G35YzywT
	Hl9K+QTrWBBDieRSNJrGn8qXN4AvQJ7xEOfx8xUcCGlD5BljHEW9
X-Gm-Gg: ASbGncvWjAxS4MCncDrpZjoFz6IMN1MyNigAPnvSOh97zGrYHCk+M64DFTUBMRaDius
	Q959chHjRwvLvdgMYp0cLIYjpZJZQFjx/RXv75KS15JftG4AzeV1tbZvD9hZvi9R1pyJrdl4ulg
	6B+1Z9wUVtM96oqlLCHPa8dQD9wTdMy89kHvLXl94rmC8R/jHx85xCx5ZfyNNmwDHLujNfL6szu
	OrqrP6vTnYF5f9NTOaUtJnDMbEsx6l0rZrDVUCWkGLl579gmjVyYAIc42FtwrYn3GF6cI8kO/Ff
	mb8GZoUS0hcbrdyN3ByWUTIQiTSjar7sa+bAdgvWfyVCun0DAhdWQDwd0Y7QpLGHXdDJqzeYlwi
	ztpH5UA==
X-Google-Smtp-Source: AGHT+IFruJj7llGRMLC43V8G8nvyRf9Wo/GtrJAKSUVdJVIdbOELhLI6ZGSnYhEGEaeILNThpImaHg==
X-Received: by 2002:a05:620a:1725:b0:7b6:d23a:be39 with SMTP id af79cd13be357-7bffcd9b690mr1302934285a.44.1738271670957;
        Thu, 30 Jan 2025 13:14:30 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a90d433sm111711185a.109.2025.01.30.13.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 13:14:30 -0800 (PST)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id D2B441200066;
	Thu, 30 Jan 2025 16:14:29 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Thu, 30 Jan 2025 16:14:29 -0500
X-ME-Sender: <xms:teubZ-Bq44c_p_Kn7SjYW-SkF08kZgWy1VKcHm_jFlDBwQe7f92yPg>
    <xme:teubZ4jdTzyYoyNx9MIBvlylrA2DWAtcbzSyZK9hg3Uk3dv3XFnCmykMyujFE9Uu7
    uDRze5NJx4ASfSYiQ>
X-ME-Received: <xmr:teubZxnbyY-zRB11NcDlYbfzzZB7F648esRnADGaqm9Xqc1j5o54Xs5BIB0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeikeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvve
    fukfhfgggtugfgjgesthekredttddtudenucfhrhhomhepuehoqhhunhcuhfgvnhhguceo
    sghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgvrhhnpedtge
    ehleevffdujeffgedvlefghffhleekieeifeegveetjedvgeevueffieehhfenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvg
    hsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheeh
    hedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvg
    dpnhgspghrtghpthhtohepudeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeht
    rhhinhhtrggvohhithhoghgtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepphgvthgvrh
    iisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepmhhinhhgohesrhgvughhrght
    rdgtohhmpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hlohhnghhmrghnsehrvgguhhgrthdrtghomhdprhgtphhtthhopehojhgvuggrsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtoh
    hmpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepsghj
    ohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:teubZ8wruoEb55PGaCI_EaJEZfwtx65tC8Cj8mjxAgr3TszXtDkX2w>
    <xmx:teubZzSy8QOXwKfkHZDBG0Giv2-2LolhKx-x2U0Q_QLBj9rIotJb1w>
    <xmx:teubZ3Y02rQoOFrPdArZG9zoNpJZidHQ3iCFrtlkiEqDqCVtuJ0-Zg>
    <xmx:teubZ8Trby-4JOUHJvh-dnEJ19irs0kbW7-kWb_p_V7N1DrsmEuJ_A>
    <xmx:teubZ1BH2hn9GBxIP_Pgc01iqHSfJVyus9JOYtqcLxYtUYLrYCwnbI1P>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jan 2025 16:14:29 -0500 (EST)
Date: Thu, 30 Jan 2025 13:13:42 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
Cc: peterz@infradead.org, mingo@redhat.com, will@kernel.org,
	longman@redhat.com, ojeda@kernel.org, alex.gaynor@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: sync: create the `get_mut()` function
Message-ID: <Z5vrhpp9Idc3tiUy@boqun-archlinux>
References: <20250130185138.200993-1-trintaeoitogc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250130185138.200993-1-trintaeoitogc@gmail.com>

Hi Guilherme,

Thanks for the patch. First I would prefer the title being:

	rust: sync: lock: Add Lock::get_mut()

"create" is not a good word to use here, and the parentheses after
"get_mut" already says it's a function.

On Thu, Jan 30, 2025 at 03:51:38PM -0300, Guilherme Giacomo Simoes wrote:
> Create a `get_mut()` function that receive a mutable instance of Lock,
> and return a mutable reference to data because if the instance is
> mutable, the rust compiler guarantee the access control.
> 

This commit log doesn't include "why we need this", so please add the
reason or the usage of this function, maybe you or someone need it
because of some initialization/setup code after creating a lock
protected object? Moreover...

> Suggested-by: Björn Roy Baron <bjorn3_gh@protonmail.com>
> Signed-off-by: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
> ---
>  rust/kernel/sync/lock.rs | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
> index eb80048e0110..3f9d78bcb37c 100644
> --- a/rust/kernel/sync/lock.rs
> +++ b/rust/kernel/sync/lock.rs
> @@ -140,6 +140,12 @@ pub fn new(t: T, name: &'static CStr, key: &'static LockClassKey) -> impl PinIni
>              }),
>          })
>      }
> +
> +    /// Get a mutable reference to data

... please provide an example of the usage in the doc.

> +    pub fn get_mut(&mut self) -> &mut T {
> +        // SAFETY: the caller must guarantee that the instance is only used in one place

SAFETY comments should explain why it's safe, here it's phrased like a
requirement, maybe something like:

    // SAFETY: `&mut self` guarantees the exclusive access to the
    // underlying data, therefore it's safe to reborrow the inner data.

Regards,
Boqun

> +        unsafe { &mut *self.data.get() }
> +    }
>  }
>  
>  impl<B: Backend> Lock<(), B> {
> -- 
> 2.34.1
> 
