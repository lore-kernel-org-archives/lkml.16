Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8B525179E
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 16:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747067932; cv=none; b=oXhLAylFLYC7kS+yntLyxvvMPv2AB4iYjJfbEsTbISK4v3ktlMg6We8H5VgjMoIKBWbJ9Tu6u/zrqp3LktNf9KSlbiLHSZoKTKb8xz4RgtnMTiQ23SF3fq3qTv+bpdrZ5IgLYXX+H6K5s5/r5pdFyGemmY7X7yG7ppJArblwUGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747067932; c=relaxed/simple;
	bh=Yehlnc4ZkWKIJwXXxMMs5cwKVop6FmBrsGoE123p7sE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hETZQKGjcnlLucBCojryv3Fd/kVnnbcry++q5ogLYkisD865AvTEjGc6MogkXKi1K68wzviT6ASk+XTcVfIDlzbYW4ktHpuO7G6cSR6Pg27CPRCKZslJWW63cBOswl2bvqeizZozIYXmNT8TPZ6bAx09m6oVopHVXp/lxdBR1Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Xm8vpCNp; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Xm8vpCNp"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7cad6a4fae4so819390585a.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 09:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1747067929; x=1747672729; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1julnBD5+GcSaXU+eTIdcuLbn0p5bHzSEbl/z4yoEN0=;
        b=Xm8vpCNpFOh21VbbJXb5ohXssAScKGNIOsMZmLyI3oxETyYNV37N+q66z/aS2xHC+o
         /oyEKGkg8svFA9a8bvw5+7smp9Wyg+ch3Vb61GkXs6UoTX6y70/D+x8CZwGoQ7FxqJlb
         AYDqJa5RvRQ+yzYCnifCTclasQIQqhVftHeBW6gf5+6tzvqMXUymcPdZ33KNxXLlUHvQ
         gaPD/THBnQVMEHdbI8nLjsmLTdKtG0xrN72msZI5cHU0rotfnM7MlMJON8sBbf6fVbFR
         j/1xNs33VRfeMW5R6x7/QymSzZgOMQ3u1YtQg31akTqS4pNkGFfUMY0V9sEq74kL0H5x
         SfJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747067929; x=1747672729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1julnBD5+GcSaXU+eTIdcuLbn0p5bHzSEbl/z4yoEN0=;
        b=GsARkkd2jOrePU3k27xCPq6LZ/tR2dzv2j5Gr3Q1tnKpU9DqJX/lWxTUQM3YX2jh2p
         bFqfOkrtqezPAjeiskf0Pmf0CPAUmEsL6vgrglJcJkhRHoe6FPnMiXNXZilaEFf7tJh6
         28kQBfrC2zAPIUD9cCTyMjnuYYrqmBl6WBUNXZ948sjC7woT0zorm8fjq/whcJH9xhtP
         VKQDLFUnYljARBRhwXDofdyJVDgIr6cwAYEQRTbgZHS5FzPwv9Qm+0PKY4hlhUGkDfaS
         P5b9xjV61gOrZvo/V1e8Rtq/VnT7P74lg53n/2xNj/YU6mYy1kOOWC3R4ha0zCvJtFlr
         7ZWw==
X-Forwarded-Encrypted: i=1; AJvYcCVX/+l4z7J36c7JPkRp4aBcN2fEypY5HCcj20WwMBZnRzOEfgAOg6NgwGKcRLah09+490HuJDK94p12nr0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt4xHYPlJzVsOh48dUeGQorxNR/JTGjri73JACERnxXvWErH+i
	jxQk/VBpA/AtfGIX7/8MOqy8vNgev7880ifKsu/QGOOcpS6JP6ZSF5GbTFewh64=
X-Gm-Gg: ASbGncuIfWSvEeYZQcgvY8dkkCXH90Dm4kbwBznbQFXQ6Gqv7Cdr2ETK30+mYH5H7+g
	x1kOwjRL7rcqrx+r8La7dfk7aK/Az0nUtN1T9jrvPuDa2JjIk0BW9KJd4OB2QKXhXdrZQ58TwCe
	dosrHJbuFEBTdPjMyKFJzcmn/kanJOYxwCceB4asKHchJJelQgI+hy4s2XBsevviP+npF1UzlTO
	+mZCiwOrTfKO1Ixpsd9K24Y1f6uJsZDo9Uj86s3Mo53auHqMuAf6PlqIdEWrMKhKE52/kX7I+tp
	eW6GkJ7CbyaVJ8BZnVhKShBZnAdH+j1VjoseiJhycFyJv+608f4ra/84ehM43tC2M/xQRp6HHmh
	1dJwwd2ZnQInxbS1z+fD1JXQOepWSoNIjfXZ+8ggDuQ==
X-Google-Smtp-Source: AGHT+IHHMUdqgvopOB3bvhxDrzkGlwPiAUOBbIhdmlc5mYj64PucOzKQfQk92T4hzK7H4RQ84n8s7g==
X-Received: by 2002:a05:620a:2a09:b0:7ca:d53d:af75 with SMTP id af79cd13be357-7cd01155c4bmr2207761385a.56.1747067929639;
        Mon, 12 May 2025 09:38:49 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-42.washdc.ftas.verizon.net. [96.255.20.42])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd00f4e093sm568092885a.8.2025.05.12.09.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 09:38:49 -0700 (PDT)
Date: Mon, 12 May 2025 12:38:47 -0400
From: Gregory Price <gourry@gourry.net>
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com,
	dave@stgolabs.net, jonathan.cameron@huawei.com,
	dave.jiang@intel.com, alison.schofield@intel.com,
	vishal.l.verma@intel.com, ira.weiny@intel.com,
	dan.j.williams@intel.com, corbet@lwn.net
Subject: Re: [PATCH v3 14/17] cxl: docs/allocation/page-allocator
Message-ID: <aCIkF6RZJtU0m3Ia@gourry-fedora-PF4VCD3F>
References: <20250512162134.3596150-1-gourry@gourry.net>
 <20250512162134.3596150-15-gourry@gourry.net>
 <aCIjMNooAzKaONod@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCIjMNooAzKaONod@casper.infradead.org>

On Mon, May 12, 2025 at 05:34:56PM +0100, Matthew Wilcox wrote:
> On Mon, May 12, 2025 at 12:21:31PM -0400, Gregory Price wrote:
> > Document some interesting interactions that occur when exposing CXL
> > memory capacity to page allocator.
> 
> We should not do this.  Asking the page allocator for memory (eg for
> slab) should never return memory on CXL.  There need to be special
> interfaces for clients that know they can tolerate the added latency.
> 
> NAK this concept, and NAK this specific document.  I have no comment on
> the previous documents.

This describes what presently exists, so i'm not sure of what value a
NAK here is.

Feel free to submit patches that deletes the existing code if you want
it removed from the documentation.

~Gregory
