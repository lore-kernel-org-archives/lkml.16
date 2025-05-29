Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DF2D531
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 00:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748479554; cv=none; b=PDIGXo9E26vZettv6HQNRrYz7mMbaqFYxNoadx9QnGvuAgSk8jHMqXrQHmrBlNyFkqVEejTxQZVFXNio6gGo/VcQlCZFYWKHHvoHYtZ4AyIcZ1rJyEZRUkqOb36EsMwuTns2lSscRc2NeRix7ME4NZIHFjAgJ8WWThHFla5F1T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748479554; c=relaxed/simple;
	bh=RBRQJtrU1o/5GEIK3NL3AuJ9HmHI6MTEnzGsJ8BgC+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NrLfFNQZbf+I/pVzPSuFvnxnlPU7EwUcZMwXof7+5cNZaxKqgGDqdZ6MHCd4izWceqTbmSYbNNfKZyTp9piLa74fuLa3Ac4LkXMpuEPd8EghUTw+lK8QfTSeHAmbmEMu56P3rBaCzweTZjyUi345cy5g6X1+A0Jxf+DaGsHH5rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=dIK/KI+O; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="dIK/KI+O"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-47692b9d059so5181931cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 17:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748479551; x=1749084351; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u3lirCGQK/pK/dwoYb1WbV7HzR0WtFCYVJUxyqG54gc=;
        b=dIK/KI+OamU/fEUYVanrHke3Qr2mVSwUdo7VwlQp1izojqRScUx9+uhQMCMxvH6q6V
         alS8JeifXBGtNCg0wgAslfleLjymfKgiyMaaJd/bq4gCEd3kpXj/Y9QI94pVS4a6zw28
         bTW11Plg1s4BRFeu7GJJqiELFWr/Uo0oFsxySDNgStfKEpBq7Og9bhMoLS4ccGg4g5O8
         Z85rDMP0qd7u+VkyYIqVkrcSCx5j4qdT6btxaePoynHNacNmNdMIOLCjFRyYSmBz9HYn
         2+xvVdM1XmNGedAVf1qWJQgTMHBYgj3MHu7FlyDLg9mMJ7/7CufIxCw9aUwqJHYOnyjL
         JFpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748479551; x=1749084351;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u3lirCGQK/pK/dwoYb1WbV7HzR0WtFCYVJUxyqG54gc=;
        b=oxtjF6ZmgHTBoSPu4ZI+deN9eIa5bdsDHYu/7ouk/rBzu2/Fr2xOhmKqHBRZcTbmng
         IBu2+/uhZQZERJCUf/7raGWLoMjB53RCFS5fPPTBj1rllQXW6qVCZbtLGC+FH7M/3u2U
         KuXNYmYuRe2rv97MiPLmIOjH4eKryM+6JYob/tS0HbZIvoPxIXOzI5U2P4goFochBNi9
         +VWqRnJrNp6xL1FC3NcANaYlFKlHNN8GRtgdFOklgBxODIV39VAEy5Ovo5jbLAbcq0jZ
         nG13k3rxgVbh59VLFPCIpu0oZDMvyPIhvPNmTqFA6tMtGMLJu71uPBQMiX+CW4ycHl3n
         95gg==
X-Forwarded-Encrypted: i=1; AJvYcCUuU7qnWE9HeRW8n/jw4hw9yzyb25t5bBF7hBorgnZRGG8148w8eUQ+wQOafeP3AhWRRfgN+cG0qsVXuj0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxupZeUEO4shOpGL77NTENR53+LCEu1jvL67hljs8Uba/2mOowk
	PAEKDjW6pmPgWERdrnXkWjWWIcRqaElBj+Z/Ky0IECGxZMnPY24YBpIr/idG3h6tlYo=
X-Gm-Gg: ASbGncsb3QNPptCq+mAhU1LTK+8vmk/5Q6gD+lbwqjlk1xG+gri9N03Vvu1KQ0IYg3D
	JGEH+fThN6r8Y5jRJUTv2Km/p9eQM1DaQ08dXDxpcMVQyokyeixp8J58ZkvSrA7+9hZamqiw7dx
	5bA3rkVBNvMUcAuG/o5qQ7S7KwUTvH9aMXizzZErbWhrFOLwx+7Q/lTwaSvpi4Zd2I9rWCwGBsd
	j2rKc+QUkaUZvSU9iES+GtHu3zrWm102VWA4e0AvL4j5PpMfLOrQiGjH/DHLwO9WyddKUIVr517
	6x4htyn6lj3tgYH2NRtrYgDLvDzrd60UxVanxKJKUgMDQ/4n9GhFPl58bKuGuLySn0apuWVufjj
	knjfpAjPuNbIB7RuNA0PbReBnAhc=
X-Google-Smtp-Source: AGHT+IHnqnRTolKjMO7lt2c7vFTmLmTqjyLGW4orbu4JZw/Ke3zfhB9aPh390EN0T2RwX/GWqU+5fg==
X-Received: by 2002:a05:622a:6107:b0:494:7e11:fe59 with SMTP id d75a77b69052e-49f46d32fdbmr301749631cf.25.1748479551637;
        Wed, 28 May 2025 17:45:51 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a435a633c8sm1683561cf.70.2025.05.28.17.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 17:45:51 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uKRP4-00000000qoo-1zjw;
	Wed, 28 May 2025 21:45:50 -0300
Date: Wed, 28 May 2025 21:45:50 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Abdiel Janulgue <abdiel.janulgue@gmail.com>
Cc: acourbot@nvidia.com, dakr@kernel.org, lyude@redhat.com,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Valentin Obst <kernel@valentinobst.de>,
	open list <linux-kernel@vger.kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>, airlied@redhat.com,
	rust-for-linux@vger.kernel.org,
	"open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
	Petr Tesarik <petr@tesarici.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Sui Jingfeng <sui.jingfeng@linux.dev>,
	Randy Dunlap <rdunlap@infradead.org>,
	Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH 1/2] rust: add initial scatterlist bindings
Message-ID: <20250529004550.GB192517@ziepe.ca>
References: <20250528221525.1705117-1-abdiel.janulgue@gmail.com>
 <20250528221525.1705117-2-abdiel.janulgue@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528221525.1705117-2-abdiel.janulgue@gmail.com>

On Thu, May 29, 2025 at 01:14:05AM +0300, Abdiel Janulgue wrote:
> +impl SGEntry<Unmapped> {
> +    /// Set this entry to point at a given page.
> +    pub fn set_page(&mut self, page: &Page, length: u32, offset: u32) {
> +        let c: *mut bindings::scatterlist = self.0.get();
> +        // SAFETY: according to the `SGEntry` invariant, the scatterlist pointer is valid.
> +        // `Page` invariant also ensures the pointer is valid.
> +        unsafe { bindings::sg_set_page(c, page.as_ptr(), length, offset) };
> +    }
> +}

Wrong safety statement. sg_set_page captures the page.as_ptr() inside
the C datastructure so the caller must ensure it holds a reference on
the page while it is contained within the scatterlist.

Which this API doesn't force to happen.

Most likely for this to work for rust you have to take a page
reference here and ensure the page reference is put back during sg
destruction. A typical normal pattern would 'move' the reference from
the caller into the scatterlist.

I also think set_page should not be exposed to rust at all, it should
probably only build scatterlists using the append APIs inside scatter
tables where the entire model is much cleaner.

Because this is also wrong in the sense that it destroys whatever
sg_page was already there, which may have been holding a page refcount
and thus it would leak it.

Jason
