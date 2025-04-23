Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CF722F773
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 10:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745402455; cv=none; b=OyknLddHKL5JiADIJpg3oBSCjLQr9kD3bXzR/GFTSXhzVVQv6m7T1+2bAozA9DRxsK2NlIsziojO2EStjGhfSLpYgi1bcnXW1/6Vhvq8hATC443MiRfX2/EkvceqkMVRvkua2M+sVAMmLnpTKhL3mWoK8awNdUmJF3DHQS7ZPKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745402455; c=relaxed/simple;
	bh=m/m3Zi3WJGCCbSxBVmJAV4i980XntSjl3Xv/YQtfVdU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AeAZCEzPZ0vv/1zIsVIwa28ErASiu27hCfj4vc0co3ZZvSAJ/IoWfNrdgZPuuPhk2PdSN7Dcnp1kSqQQS6JHahbzMdhS0U1n/bZ5g8ENDSRqj3ArpbZfneQ0+K1VPmvh1tO0B7y6rF75whEO/UbFRpTuoOB77lwCL2HAcgWeJqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kvjPhUTj; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kvjPhUTj"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3912d5f6689so3364784f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 03:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745402452; x=1746007252; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=x9ea8FDSGTjimpgbQtzDKV0aaZXb5dzMPALaWqc0V9Q=;
        b=kvjPhUTj9FKA+E+2Zhe+yPN9yT1Ifto6Ruu8nQCqrqUBqJOhz2FJAj8T6siXGN3Uel
         pD+bAkPoi61tICcQnG5YFMkgyNuQOPyO2uIdbbUQJNTMhCH71lniLhAYNMA0EFN0NuPd
         934MGfz1lBNhYcZKETUl6Q7XTM8v2T4096Yz0XDl0Md18+IagSKSMFcilVO55n/pq0wc
         9BGYt+aKEa380sqt1nJ2SBSvFgH4MIS57lN+BVKEdWcBbkg69tw06sm7eDt98F9l9LzX
         Mtsn7i1AVmaQHONWlWcfofOh/Zh5TXwElCSwjON+lc8wUh3uSymmM42amDjsO3go48WX
         A9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745402452; x=1746007252;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x9ea8FDSGTjimpgbQtzDKV0aaZXb5dzMPALaWqc0V9Q=;
        b=ufLXGIMRUoNRcKfFTLyaoTgXi5IeMss4dv+Yp7HL3D4E/sdpqVNYMR0Vr1r7mBhqaj
         AqlFnQbrQoZNuasc5qNS/mdZNRIx0SIofSYBJtTT1kvQtNIBGQNj7fgrpW61IGnzkBYy
         QBVuoMU6Nyab41hfCdxudm7T8OR9TXym1RhHeTdT8ZPDP/E7os0grvIOXyPCGwu33J1X
         zb0xBV8PiYwW35WBnZMiYjXBzh+QgEohOhjx68LRVtEBaMRiFIBtFMMSeKPbAMIyEzLh
         QH/Y58N16fGJwe9hIsNai7WrwgCQFCju3GFdktfM/jJfnUsuDJ6PV/8aBJfKG+2or5iG
         dJrw==
X-Forwarded-Encrypted: i=1; AJvYcCVJAaW0naDo7DSsuu5ptGltqHH8Q5WN1H0JCxA5TwE7q2D5E+L5seHSBRCk3dNgUkrhL+sn2w0ZzSRjVwY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlq3T++EHAzkjq44DxyZdHArrVLzl3d4ummE1dczCPrrOW9aaZ
	vLujcb1tiOVd6C2p+7CgIsv2lbnprQSTuf57aMxQslcwwfAuuqiKh/CmjqIjUt0FYlEtdgLgIPM
	i16wjl71gypNSRA==
X-Google-Smtp-Source: AGHT+IE9zXDuF6/3Qje+ijkWm3TvuUptKYBFBLiLxoP3ercMlWlVPk7z7/Sk3nAv484A7KqI7PmqPFwUMJ3NqWk=
X-Received: from wrbgv15.prod.google.com ([2002:a05:6000:460f:b0:390:f353:6538])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:584a:0:b0:39c:141a:6c67 with SMTP id ffacd0b85a97d-39efbad398fmr14776100f8f.45.1745402451935;
 Wed, 23 Apr 2025 03:00:51 -0700 (PDT)
Date: Wed, 23 Apr 2025 10:00:50 +0000
In-Reply-To: <7320995f-cd6d-4e65-b144-bd20151f9e5e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250407-vec-set-len-v3-0-c5da0d03216e@gmail.com>
 <Z_-wlwaiJNsSZbCC@google.com> <7320995f-cd6d-4e65-b144-bd20151f9e5e@kernel.org>
Message-ID: <aAi6UujKysn14fOv@google.com>
Subject: Re: [PATCH v3 0/4] rust: alloc: split `Vec::set_len` into `Vec::{inc,dec}_len`
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Tamir Duberstein <tamird@gmail.com>, Andrew Ballance <andrewjballance@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Apr 22, 2025 at 05:42:24PM +0200, Danilo Krummrich wrote:
> On 4/16/25 3:28 PM, Alice Ryhl wrote:
> > On Mon, Apr 07, 2025 at 10:52:30AM -0400, Tamir Duberstein wrote:
> > > This series is the product of a discussion[0] on the safety requirements
> > > of `set_len`.
> > > 
> > > Link: https://lore.kernel.org/all/20250315154436.65065-1-dakr@kernel.org/ [0]
> > > Link: https://lore.kernel.org/all/20250316111644.154602-2-andrewjballance@gmail.com/ [1]
> > > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> > 
> > I'm still wondering if the divergence from upstream alloc is worth it...
> > but the code is okay.
> > 
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> 
> Does this still apply to patch 1 in v4 [1]?
> 
> [1] https://lore.kernel.org/rust-for-linux/20250416-vec-set-len-v4-1-112b222604cd@gmail.com/

I replied with a new tag.

Alice
