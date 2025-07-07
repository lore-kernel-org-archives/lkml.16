Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D67028642B
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 07:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751873413; cv=none; b=YHC9TswCOirF8zv0azbMtGl/AOeuaiL4i6alUpPTPiLGpwK2A8DUn+icGUABKEvOg1Fyr9tFdZn44ghxE+yMr80sSwuSDH8vQrWKX9utM8eZ1GsGxmYZBBFv3GzQA77C7oyyvLoLRu5TccOWsxNVa4qoUZgoYq/+unTa1UkfPdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751873413; c=relaxed/simple;
	bh=pgLYMyGHLNeV2wGGNHnI3FUm05yQj+XGapiC7w3Q5Ec=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MOAGew1syNKaSk85aDCFomAxHAT5Ri3DWGEVofsvPPlRYtCC8a38KCnh3KwYtIBfZAmXqwv1crJ93Ad8bq0KMax/FLDHQZYOzGbQoNuaHnQsIgdDrwMTDUXfkbl64pXK+9PM3CXrbVhdvGFgg+YfKinxBcktBcMK29t+JodIfvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4TqsciHp; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4TqsciHp"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-450de98b28eso17399075e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 00:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751873410; x=1752478210; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SwLel3oj580C8N1fRuRBXYbCfvfOLh56/Z9RsgGJodE=;
        b=4TqsciHpe/LihS/U2gXzkNbGzEN3pysavc5xaUe/1jBACMqCHlTeoCGTm3Ffb7FPYG
         3MEuoH6D50scBmMPk0SsnoTlXPKjp32G36FGd6V+tf8G7PJobsHFZFi/xnHjCmHwIreU
         qYX/CwDd+0igE1JhJ2HtR/3Nnwjn8Nk6EmPeRCVxilQOEYYzvxObe1xAj3KCrO+19yk4
         WG+3+8vgsILOzw5D1WIoYlwBrwpf1sas4m9D671r8wGORORvcp8IPvqd72p3ep1133Nb
         u1808RsS3sN9fN0VK1Wrya2ySAVgaSl1PtNT9WQRIdzCmNvY1hxz9WPgLD5B/+4rBoub
         Nf2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751873410; x=1752478210;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SwLel3oj580C8N1fRuRBXYbCfvfOLh56/Z9RsgGJodE=;
        b=HsfXGoCrX1v3KCOe+GZgzlyH4U2AAzAbUriyqXm0obVxoTVh9b56AncogkAYlugfHV
         Ig/s3UxL1avVuFNfjR/x4VNMqkvxWCXcfGE7KOzM6mKkhbxZexRL3FLSwYZn3L+sDcEW
         jkzidr9DPuA/BqcuDtmbt2l1a1uoiGYlirbeFxKazpLVtFqUSHlRWdGm5a/l/eM9fUhY
         zuVc6CIMkm2mBCvx5sr6/SFYjJHNFsNP17396XHM4TC1PspYUznY3eFWvflcVZZeATC+
         cRspaX3nu25Pr1U3WfXsYAQ2/wnjQ2M2z55ON5zRVJiGCIv3530EtqVQFCIjep9oJc1H
         8/PA==
X-Forwarded-Encrypted: i=1; AJvYcCWH74JxPS9Y10J1/Tve3Mgo5o4a3BZ+DuPdKFQz6TckeyocLuQHoyGi616Vl8g4R/jsWSlrPk+vwaQbWLs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUty0+5hdAoLF2qzC9k/QJnasI7yaDffcm6zZdhcVXsbfBZVUL
	OvH0YXu1yN3H7lig7nbxL6U33B2tzC+7Kq+h8Rzt41KUYoHkwab/bnrT1lY8Mdi+C4mRvFVXtEh
	qwP4NK60ypizAXnzwGA==
X-Google-Smtp-Source: AGHT+IH3sHQSTPT6qkcRPl99+vS+dV0MBa5vxmJeSjdd/cUZL8GfFrqHDPKIvhdS958mINyUuAOllmYPCuUOyFY=
X-Received: from wran1.prod.google.com ([2002:adf:8b01:0:b0:3a4:ead6:8232])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2484:b0:3a3:6478:e08 with SMTP id ffacd0b85a97d-3b495cc168fmr8923049f8f.23.1751873410477;
 Mon, 07 Jul 2025 00:30:10 -0700 (PDT)
Date: Mon, 7 Jul 2025 07:30:09 +0000
In-Reply-To: <aGlgpyuz2JKErAUj@cassiopeiae>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250704-topics-tyr-platform_iomem-v12-0-1d3d4bd8207d@collabora.com>
 <20250704-topics-tyr-platform_iomem-v12-1-1d3d4bd8207d@collabora.com> <aGlgpyuz2JKErAUj@cassiopeiae>
Message-ID: <aGt3gRsnwfNs6jHT@google.com>
Subject: Re: [PATCH v12 1/3] rust: io: add resource abstraction
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	"Ilpo =?utf-8?B?SsOkcnZpbmVu?=" <ilpo.jarvinen@linux.intel.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Ying Huang <huang.ying.caritas@gmail.com>, 
	Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Fiona Behrens <me@kloenk.dev>
Content-Type: text/plain; charset="utf-8"

On Sat, Jul 05, 2025 at 07:28:07PM +0200, Danilo Krummrich wrote:
> On Fri, Jul 04, 2025 at 01:25:26PM -0300, Daniel Almeida wrote:
> > +/// Resource Size type.
> > +///
> > +/// This is a type alias to either `u32` or `u64` depending on the config option
> > +/// `CONFIG_PHYS_ADDR_T_64BIT`.
> > +#[cfg(CONFIG_PHYS_ADDR_T_64BIT)]
> > +pub type ResourceSize = u64;
> > +
> > +/// Resource Size type.
> > +///
> > +/// This is a type alias to either `u32` or `u64` depending on the config option
> > +/// `CONFIG_PHYS_ADDR_T_64BIT`.
> > +#[cfg(not(CONFIG_PHYS_ADDR_T_64BIT))]
> > +pub type ResourceSize = u32;
> 
> I think someone commented on this previously, but maybe I also do not remember
> correctly.
> 
> Anyways, can't we just do:
> 
> 	pub type ResourceSize = bindings::phys_addr_t;
> 
> Given that phys_addr_t is already either u32 or u64.

In addition, it would be nice for the documentation to mention that it
can be 64-bit even on a 32-bit machine.

Alice
