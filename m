Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86181215776;
	Tue,  4 Feb 2025 16:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738688063; cv=none; b=bI+nuWy0eZGYRyKGOxSgXvbwEugjqLlHruKj30Jed2s7jIcE6K5ORVT1bjQaSK4f2VgII+ciJ8WQyPlLRsjwYKbFvFd67STTFImyX1p8unesm4ei2Nv+P1rhcR7cEdcUfIDZeAOa+5AeRtbHcrhuCdMITADw2n5UKqZj6KnaQmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738688063; c=relaxed/simple;
	bh=dvbGjmFPIipFOAHao5it2MHqCCB+34eacpcE+gOPX6A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QlFIqynpt4BGkPQ8hcJtmDqpckNmqXN5tI5I50tJV6zTicy8zVN9f6sYzmyL+W0JKaG/vEyc0u+X7UD2K5TGKAEYI4hUrOkdxF2CO9ITEogKiPDwCKaHkfm913nMGvdSZpZo8QYZI7B3ShYt1ygAzZQiPl82lCStIvhR746FYpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UvuBcvkl; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UvuBcvkl"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3eb8bdcac2eso1319389b6e.0;
        Tue, 04 Feb 2025 08:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738688060; x=1739292860; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ufxqeTPbh5jVi4KeE739Ux/m/0UeBoN+5T7+ZjE4za4=;
        b=UvuBcvkl9pWpREAdGJFo+EOFxg70yaRag7S0x+Txq+jwq+5bpnW16FbI+L95B/9d30
         K9XrDHhzDte0He+kLJVmmeSFLVa4x5rAzBiEI+Rjutc1rPukfLXWucAy3ju7LZI4Pk20
         ObXuX9Utvllaqcma4rQ/CHko+/sTBiODL7ubTfyx++6JKEM89eEiXd/gsB3lpOiFM0SC
         yNYjj43zOnEe3WekuaTA/3T5mZtI4CAeysTA7SNuiXpRn+6dwkNJYdCqGOvK8dLxkf1n
         XsYnzxIWlcjx5fgOJhhT0GFA5hQ3AwP9Y88tWfeR8vQXEkKyo7Iap4WRUw3qyOX75omY
         lzXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738688060; x=1739292860;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ufxqeTPbh5jVi4KeE739Ux/m/0UeBoN+5T7+ZjE4za4=;
        b=bqj98DAgsJ24WwCIl9amyGO7N8I7Wj9dFLG2vlRnwh5Vx1LlhbrCZBE5rKtbJ7LtDJ
         ChRflcxUZfTccV2Qq3kQlfnvQ/6gesDDRnnkXDLO343YHrjTaBRvWrA1AwG3Us8DXGNv
         1TQT4k/2QReCVHiGIWw4fRDYiQfe8nvPdXpRoMohmNnsomd6foyTAQTghiseyasmpnW4
         YvGR+o2O1m1a288bLH+3KCUJ7Kj1UMyn9s5vHh39aBBvjGgRIpWhnRX5jfnzUrd1iCl6
         Htw2CmaNXWEhZDGpKRPaavVyjZxHJUl0e6rR3288fwfXIHTrgVFjmLabe4bG5A+9dB0K
         5VGA==
X-Forwarded-Encrypted: i=1; AJvYcCUn9UiZbyT81dY1SeY2dOkfV5+5tnYGf5jMrE8LXkjBdktAxs7z/U3TDynB5aADODppD6N7OLiGa9IKZh+lU+c=@vger.kernel.org, AJvYcCUqzTqdtXZEXMlnGKeKSDYC5OUsBlmFoM2HfXywq+QpbrzRkqcXNOaXdk6eVt8R+PoH8/Hu+TRM8hx1BVI=@vger.kernel.org
X-Gm-Message-State: AOJu0YylSEDlUVK765WcfX7acZrl+mI9ycxZtdxrCGJh7aLP2z1/RFqr
	yyvWaisL4sYeR9xAarEBM1qM+BUKIeShbOjl76s6FN4fYTf8eLN/+T6ABO8afJLIAwtjzia6Yj0
	oVwasII893WRU2tWL72BixJgw734=
X-Gm-Gg: ASbGncvwBc8uw0ZNU2V+ImiyoyIGZiDZAnt6p7MySEGg9QDhG44F6UaBah7ttScu6S9
	HYbcDGwBsZLt9frueNpK9V6jUQntXMevhbJG10EBEccf8Dw8aB/u8RR1DJ+5EzyLKMKkWU7EilQ
	==
X-Google-Smtp-Source: AGHT+IF7EnaFEJFCSlyCLr+nn83vnKdF6Emxb8uA3hFJPTocYeG615mU6+dytSHRjTRpgNZMbqe79WfG5L4cwrXkxj4=
X-Received: by 2002:a05:6808:1b99:b0:3eb:6044:5a85 with SMTP id
 5614622812f47-3f323a76658mr18482915b6e.20.1738688060469; Tue, 04 Feb 2025
 08:54:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250108122825.136021-1-abdiel.janulgue@gmail.com> <20250108122825.136021-3-abdiel.janulgue@gmail.com>
In-Reply-To: <20250108122825.136021-3-abdiel.janulgue@gmail.com>
From: Thomas Hampton <thomas.j.hampton@gmail.com>
Date: Tue, 4 Feb 2025 10:54:09 -0600
X-Gm-Features: AWEUYZmrSMVxm_k1uivRyBQVGcUir-2h4LgjAJyf97InNoJiKzYSKb_gYdAF1GQ
Message-ID: <CAEmX-ZUbPqNUBj2-xAf=5uGE_GWAQQ79akADZCDxNsmx7Lf9VQ@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] rust: add dma coherent allocator abstraction.
To: Abdiel Janulgue <abdiel.janulgue@gmail.com>, daniel.almeida@collabora.com, 
	aliceryhl@google.com, robin.murphy@arm.com, rust-for-linux@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Valentin Obst <kernel@valentinobst.de>, open list <linux-kernel@vger.kernel.org>, 
	Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, airlied@redhat.com, 
	"open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On 1/8/2025 6:27 AM, Abdiel Janulgue wrote:

> +    /// Returns the base address, dma handle, attributes and the size of the allocated region.
> +    /// The caller takes ownership of the returned resources, i.e., will have the responsibility
> +    /// in calling `bindings::dma_free_attrs`.
> +    pub fn into_parts(self) -> (*mut T, bindings::dma_addr_t, usize, usize) {
> +        let size = self.count * core::mem::size_of::<T>();
> +        let ret = (
> +            self.cpu_addr,
> +            self.dma_handle,
> +            self.dma_attrs.as_raw(),
> +            size,
> +        );
> +        // Drop the device's reference count associated with this object. This is needed as no
> +        // destructor will be called on this object once this function returns.
> +        // SAFETY: the device pointer is still valid as of this point due to the type invariants
> +        // on `CoherentAllocation`.
> +        unsafe { bindings::put_device(self.dev.as_raw()) }
> +        core::mem::forget(self);
> +        ret
> +    }

Would it be feasible and prudent to avoid exposing `pub fn
into_parts`, `pub fn first_ptr`, `pub fn first_ptr_mut`?

It seems like some sort of functional access method might be better
for keeping future Rust code maintainable and Rusty.

For example, making client code from:

> {
>    let ctrl_id = unsafe { &*(id.first_ptr() as *const NvmeIdCtrl) };
>    number_of_namespaces = ctrl_id.nn.into();
>    mdts = ctrl_id.mdts;
> }

Into something like,
pub fn expose(self, op: F)
  where F: Fn(*const T) {
    op(self.cpu_addr);
}

let number_of_namespaces;
let mdts;
id.expose(|data| {
let ctrl_id = &*(data as *const NvmeIdCtrl);
    number_of_namespaces = ctrl_id.nn.into();
    mdts = ctrl_id.mdts;
});

And to avoid code docs like:

> /// The caller <...> will have the responsibility in calling `bindings::dma_free_attrs`.
