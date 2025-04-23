Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD4C46447;
	Wed, 23 Apr 2025 16:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745424226; cv=none; b=aCDYU9X9aahyPbXF40Bzvmgg4ZWzl+VWXBeZA0OWkaRqoTnr6hYlLFsuHe5gVvlj0JS1HEjhXLzJ9CQDStB/kkwShr/aNqcAT1CVMpBfHy0ysbbpKbL3Lz3XZ9fYmbZ37APlGktzwxTVYFawvLSY41l+PqAMmoA19vVBwaeQvLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745424226; c=relaxed/simple;
	bh=emZpf282GDN9V7HwCDFKCQDujOfucgjK50DPJwK5gw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kqli9otLNZOwBGJ8oFwQ71g3+Ou6c2IltajEXkEkzdKRHrwsQoYKLqjioz68xhikeznlWUitpV3rETiJJP60LujKhHSump0hOOChHn1SkLA+vKfenAdefrNhwg/XToVyOE62ZG089hQ2VPYpK/vs7gqZrvYRcHLgRYytvp2q1C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ifZoWAMD; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ifZoWAMD"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4769f3e19a9so135121cf.0;
        Wed, 23 Apr 2025 09:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745424223; x=1746029023; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N292pc2aKroHpAxtVVv0Ioq/dhp05vkoFF2mjeItEJ8=;
        b=ifZoWAMD8PBT9JsZwUkM3AZFBEkNMpbxVRwjWDuHgVDlY4p+9Z2KakMiCU83CcOMIf
         +SCivYDYy7zJNUry6qpfpilsfqGRV4FV9/twlSv8dBOtH3/InKpBXfo0qC6Ztw80Q6kx
         pS87hFNmubB2u1KvWwEeaLyR8XnIvEedZPAGCASwHv5sFEtXeNvZfP/pcaDoeH4GjOy5
         bVaUFZ5LG5wwfTJ39faFDCYftO8IOHL6NPmesZabyhzb5gyoLXZHZ5Cfwws3LOZruQ1H
         +A9uK4ZI5fNP8W0wXxtljmdQ4/k4+aUDzKWDnLYhubX10783C1Vo7PzcyiHJk+sgcOr8
         y+9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745424223; x=1746029023;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N292pc2aKroHpAxtVVv0Ioq/dhp05vkoFF2mjeItEJ8=;
        b=sMdyuS1etHChizindPU/JVgxbenUhmH9IsNKRW7nnjJyrxONRo60Kh6kS7BY9eRELw
         6+v+5yzOKCWzihK2X6wzg85bQAd2Z0Bg6Q0ztE1kBLH0MInq24tBO8Vk7Tzq+CecMrXY
         xuR4qIXseWi8N+5EkL0rgcT7hANzRIA3ANa8y+KoDrM6DOvgf3O/yA9hkzd4hDNnq5mK
         LpVvHuzOStcVZD9WKfzVcuKv8R5J0MpohG+G7SEs2WKDvLkH3swHfQMaKfaTDg8o3BYW
         EM/OHLOXFszj493ICATIsmj6jCL6iP6rd4gG97CxbcnRm4Y+7lZMyVLSd35vkWfxtLe2
         oVPw==
X-Forwarded-Encrypted: i=1; AJvYcCVCAemMxPGriKc+t2FFgR69cd5RMwIGO02O9Z7JSEf5uBqAqzptCbeNPTjsq3tzMz2fRyQ9WuSATAhRRiw=@vger.kernel.org, AJvYcCWP6uz7+GtqcmwTjpM3TJAmkGgTcKNL/x9IDZND6hFFVoNSNHHsHROJkf+XkzRgY5LtX2QpDwyevlfw1xpfWgw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzLvd6k53MbNEbfLnbRkMI8ZxXLCjyHbaP9YfXHwY9pZlu3cns
	RgwOuFnSsjEIIJpU4XYItq+vM5bORT2GBMBbJZ1oQTnKw23/nk/9
X-Gm-Gg: ASbGnctx1gB3tQTrwVyeVg3BFi6FRKPvfns12vFZNuI8luEhluP94YKRW0YnsVgMHq8
	sPAtRs3MQQSK9WkioI9FSiRwth/TlQclj6QGWmMBJ9WcNeFtiaFRvT7kHHo4+WG/2TKKnF+yjp2
	idJe7ZKIREW8oIF8SzAM7SSRgEtdhtD8oiK3XjvEW8wq0rtZaLjvJI/U6LDzM6QFbgeDyl7IwQH
	moQS0LBQn8rAUE20g/NrARNEj3NUJTm1zOkgBx2hPi9V+2MdDnlh3lFwTwAZV9TSsonQ9+RcnDa
	ydIvwsXa/D/um1Wcq+ckryRyY9yhpzgYLqratWcPnU7YiC65y5x9cLJofWcmnzPAKAFV7EQpowG
	VNAe6oy/kEfOKnFjX2ZCOrfzP89tFO3Y=
X-Google-Smtp-Source: AGHT+IE5ThNiw6qXd0uen05uQ/iz9D3cPLNb+F9HVh+Gr1cTKXa02Hk1+4kBxo3wxDkrc0YAFHs4wQ==
X-Received: by 2002:ac8:7c50:0:b0:476:c666:d003 with SMTP id d75a77b69052e-47aec4d9b83mr291195041cf.43.1745424223350;
        Wed, 23 Apr 2025 09:03:43 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47d8963d112sm7761661cf.34.2025.04.23.09.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 09:03:42 -0700 (PDT)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 54BA11200043;
	Wed, 23 Apr 2025 12:03:42 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 23 Apr 2025 12:03:42 -0400
X-ME-Sender: <xms:Xg8JaKsNHcP8u2m4KyzglZ2XZhELHqbERfehRI6WI11BNbEgcbTLVg>
    <xme:Xg8JaPePQFlfPn9S_FpCmfxJsMYdDfch8IyPyPyQVuZe3iSEi020Gbzt5GOXL9hYu
    L-T6VLGrsnpaJXldg>
X-ME-Received: <xmr:Xg8JaFyO6eJRZoIievUsTSrigZfhwyqBBTosAiyvhxdCNgJAFDULKOIP>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeejtdefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtrodttddt
    vdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeeitdefvefhteeklefgtefhgeelkeefffel
    vdevhfehueektdevhfettddvteevvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgr
    lhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppe
    hgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepudehpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopegrtghouhhrsghothesnhhvihguihgrrd
    gtohhmpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghp
    thhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgt
    ohhmpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepsg
    hjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpthhtohepsggvnhhn
    ohdrlhhoshhsihhnsehprhhothhonhdrmhgvpdhrtghpthhtoheprgdrhhhinhgusghorh
    hgsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:Xg8JaFOxC7283e0ssbVS7aKr81gaTZUEaDsbCukQFznHKjwKc_YJUQ>
    <xmx:Xg8JaK_WEq5YpOin9Bs_1bsqy7xGb0t50YwnR-E5MovO7RHr-DECJA>
    <xmx:Xg8JaNU-ITf3RN6-Cp6jdVolW3vdeQt15ro4s1yT8y1RWZlwRXpZRA>
    <xmx:Xg8JaDewlGx44Cu5eCUTzscrdd4CejzZbbdMSrxaa5kJSi_iDLk3xw>
    <xmx:Xg8JaEc-Bf8vE4f3dAArIMg-A98wGRMVfKSqKvmzhn_7jZFuGjHWXldf>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Apr 2025 12:03:41 -0400 (EDT)
Date: Wed, 23 Apr 2025 09:03:40 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] rust: alloc: implement `extend` for `Vec`
Message-ID: <aAkPXBHNDugnXrhc@Mac.home>
References: <20250406-vec_extend-v3-1-ec5c5c0acf2a@nvidia.com>
 <Z_OwmEKHgsZlt2cs@pollux>
 <D91AOKOTDXWC.7R5K5DI87QU4@nvidia.com>
 <D9C61DDI99JX.31T59XPQGYBB1@nvidia.com>
 <aAfL-e6qA9oBce5t@cassiopeiae>
 <D9DM3AR3FUAF.6JSNSB9WAJ4T@nvidia.com>
 <aAiqCXB9sJe_v6Yc@google.com>
 <D9DX39CF2RB7.IM219BZLVMCY@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D9DX39CF2RB7.IM219BZLVMCY@nvidia.com>

On Wed, Apr 23, 2025 at 06:40:07PM +0900, Alexandre Courbot wrote:
> On Wed Apr 23, 2025 at 5:51 PM JST, Alice Ryhl wrote:
> > On Wed, Apr 23, 2025 at 10:02:58AM +0900, Alexandre Courbot wrote:
> >> The problem I see is that if you try and do something like:
> >> 
> >>   vec.extend((0..10).into_iter().skip(2));
> >> 
> >> with the standard library, then the use of `skip` will remove the
> >> `TrustedLen` implementation from the resulting iterator and
> >> `extend_desugared` will be called instead of `extend_trusted`, which
> >> could add some unwanted (and unexpected) overhead.
> >> 
> >> If we want an implementation of `extend` as simple as "confidently
> >> increase the length of the vector and copy the new items into it, once",
> >> then we need a trait that can be implemented on both shrinking and
> >> extending adapters. Anything else and we might trick the caller into a
> >> code path less efficient than expected (i.e. my original version, which
> >> generates more core even for the obvious cases that are `extend_with`
> >> and `extend_from_slice`). Or if we rely on `TrustedLen` solely in the
> >> kernel, then `extend` could not be called at all with this particular
> >> iterator.
> >> 
> >> There is also the fact that `TrustedLen` is behind a nightly feature,
> >> which I guess is another obstacle for using it.
> >
> > The stdlib alloc crate relies on specialization to speed up methods
> > related to iterators. We can't use specialization, so losing these
> > optimizations is simply a cost of not using the upstream alloc library
> > that we have to accept.
> 
> Yeah I was surprised to see
> 
>   impl<T, I, A: Allocator> SpecExtend<T, I> for Vec<T, A>
>   where
>       I: Iterator<Item = T>
> 
> and
> 
>   impl<T, I, A: Allocator> SpecExtend<T, I> for Vec<T, A>
>   where
>       I: TrustedLen<Item = T>
> 
> in the standard library, which clearly looks like an overlap. Didn't
> know it was relying on a non-standard feature.
> 
> That's going to limit what we can do in the kernel, but nonetheless if
> we can support only the cases that can be optimized I think we would
> have our bases covered.

I think if it's a critical path and we really need the performance, we
can use a non-standard/non-stable feature or get that stabilized.

Regards,
Boqun
