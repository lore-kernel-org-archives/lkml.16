Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24B11E0DFE
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 21:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738185415; cv=none; b=s5JGJhyxtzrSnnj1YNxP1nn7jsY2DY4iZlMi2gRY2G1zUrRC1oT3i1HYe9wotxHAiwZ4kLZuPCZWQ2KciSvBHPoTBPx8upRy2sObxF/CcNS3YmIbR/PxW2z3zDPocJrnQUn+hAqVH8bMr45Lh51w8f6jkKJJqYdhuLt+eEgJOQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738185415; c=relaxed/simple;
	bh=u8YUU6gYorxVS6+wIVap11n3aDRkyBp7z/tJ8xhznxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iONpMcKQ++VUxp7ae+n7gRDHOWVacdn0yluBgouHSaVu4vtkXCJTphM15nBC4y2vArBSE9euyf0cfAhD4HjOUK1jLx8FarcNDODLKnf/hGAzWH6fgVd2jBwe2pQXgCkAYQARokaI4duxmrfPfSeGIqWcMwfyxgTetZ8ON6xk17I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=oaGVmBaM; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="oaGVmBaM"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7b6e9317a2aso111665685a.0
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 13:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1738185413; x=1738790213; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LzitVuYlzYfLgHtJYIFCxJuw+LRhxhoKqgqBfZrikAI=;
        b=oaGVmBaMMo6oyK1ieqdaf2BaiHT/ASV0RPnHusH3tS3wBs3IchZVwoV5ysqdQWG1fF
         Dk+dspsJs/y43xBVX277VXfvwObrKQZKDgznACZ8iH8kKH2xSxB703Ow0Iaxv9e7jF21
         leJSIrTMHKvyUGkbFqo6sDKn5lwRW04yQ3C5HX4BPq2ROQQDiHsM0hLo8FOFUHHguH0b
         QWuBu9TYax5CVC9BYnJosLcmSm0XEpsxNZW9coCq7mHJFYTCuIYkiGlqpKhP6hvTFvi5
         GNGb4mMtQgDsGrZHa0i1HltEDbYiFgvff86cG4N5fPB6P8Jj1pmU0TNIBGCXeviXGgub
         e+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738185413; x=1738790213;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LzitVuYlzYfLgHtJYIFCxJuw+LRhxhoKqgqBfZrikAI=;
        b=rt7/EbwQA05rJePjCfKWDSw2QXzZqXTcOKG2sPBqDe8UHJbWEemDibv0hrer5zO+/T
         FP+gMLfANDVciwp8lxu1q2clXtJqBwh4wP/c4zH85Vf918+ISwsVLjAbTgAlfkyxRIUM
         gH+ZRTmW9LSzA133NUYe3l+CwepzEZeKvfz1/HRA/L17t2J4YZO6jFkLBmG3B3gf1oH8
         8hrns8uiZtCG8YACRC/xQButIITM38d8EQ7RUR/glK1aPbhHiSM59JoOsljxvbFDDsbr
         EtaWNhLU3suhNfXNO41AncIn6FKzIOOpby1pn1a0Gok3PPmjamRVCKdu2M8DGn5dyjCb
         q2qA==
X-Forwarded-Encrypted: i=1; AJvYcCWiZeDzIDZbairk/m7fWuVMRAextYISZWLzMkRFVJsxMbm+SncgZ5qPUASjQvMnaYYq9Nprj9PpiVxxZBU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhNoE6tXl5Hip2bK58w0ZKFW4PmQfq5JdwswpazXLIBXJu9mhZ
	wjig96lhOr2i0ZSXmqeXTsV5BN0JQSjbX7mMGl/ami0SrQeKIgHcsHWnbXAmJ0k=
X-Gm-Gg: ASbGnctAhqUJyczC8HKErGJcI7f02mRdS3trvWOX97E0zyNS/unCc3qTYIgy7iUEmHG
	52DFGa3FoiIwSlXMC2wXSAkx+N7sMIzHs6t9GsZ9chmtK5+mLCRNjPJfDT0PlwlxwdKIp5htnDR
	kv+l9VypL2swQVJ3iLKnoM26yKjfUUqDkUicMYWmTSNQgD1z2QgnrGiWpQjWXVrl6W3vAQh+GX0
	jwRPypeWx7emF1NUoYIXErNhps+tB97ojuXAs7TjNwkypcZ8gQ1kEVcd1CmCliIv9eP5gvQnVwH
	xBioC6Sj1dAmooyb/JLnBGO/TBh4YqdAMbXBX+6hvRI+Wht4A9k/j1IQu5JTdDpl2PqBfCGN6Bk
	=
X-Google-Smtp-Source: AGHT+IFBXwAWBZSqAQNZNSNHSzoLAVr1CNJP2L4UHFdx7M4GAP/8l/IbE94sQ0Me34sY2tikWvpyzA==
X-Received: by 2002:a05:620a:2995:b0:7b6:fdb9:197e with SMTP id af79cd13be357-7c0097a0121mr131686485a.8.1738185412839;
        Wed, 29 Jan 2025 13:16:52 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a904781sm3916585a.78.2025.01.29.13.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 13:16:51 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tdFQZ-00000009UD2-0Qh0;
	Wed, 29 Jan 2025 17:16:51 -0400
Date: Wed, 29 Jan 2025 17:16:51 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Zhu Yanjun <yanjun.zhu@linux.dev>, linux-rdma@vger.kernel.org,
	Mustafa Ismail <mustafa.ismail@intel.com>,
	Tatyana Nikolova <tatyana.e.nikolova@intel.com>,
	Leon Romanovsky <leon@kernel.org>,
	Zhu Yanjun <zyjzyj2000@gmail.com>,
	Bernard Metzler <bmt@zurich.ibm.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/6] RDMA/rxe: handle ICRC correctly on big endian systems
Message-ID: <20250129211651.GE2120662@ziepe.ca>
References: <20250127223840.67280-1-ebiggers@kernel.org>
 <20250127223840.67280-2-ebiggers@kernel.org>
 <ae41a37e-3ee4-484e-ba53-1cad9225df7a@linux.dev>
 <20250129183009.GC2120662@ziepe.ca>
 <20250129185115.GA2619178@google.com>
 <20250129194344.GD2120662@ziepe.ca>
 <20250129202537.GA66821@sol.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129202537.GA66821@sol.localdomain>

On Wed, Jan 29, 2025 at 12:25:37PM -0800, Eric Biggers wrote:
>         static const u8 data[52] = {
>                 0xf0, 0x12, 0x37, 0x5c, 0x00, 0x0e, 0x17, 0xd2, 0x0a, 0x20, 0x24, 0x87, 0xff, 0x87, 0xb1,
>                 0xb3, 0x00, 0x0d, 0xec, 0x2a, 0x01, 0x71, 0x0a, 0x1c, 0x01, 0x5d, 0x40, 0x02, 0x38, 0xf2,
>                 0x7a, 0x05, 0x00, 0x00, 0x00, 0x0e, 0xbb, 0x88, 0x4d, 0x85, 0xfd, 0x5c, 0xfb, 0xa4, 0x72,
>                 0x8b, 0xc0, 0x69, 0x0e, 0xd4, 0x00, 0x00
>         };
>         pr_info("crcval=0x%x\n", ~crc32_le(~0,data,sizeof(data)));
> 
> crcval=0x5ab72596
> 
> So yes, the InfiniBand spec gives swab(0x5ab72596) = 0x9625B75A.
> 
> It's a least-significant-bit first CRC32, so bits 0 through 31 of 0x5ab72596
> represent the coefficients of x^31 through x^0 in that order.  The byte swap to
> 0x9625B75A reorders the coefficients to x^7 through x^0, x^15 through x^8, x^23
> through x^16, x^31 through x^24.  (This is no longer a sequential order, so this
> order is not usually used.)  The spec then stores the swapped value in big
> endian order to cancel out the extra swap, resulting in the polynomial
> coefficients being in a sequential order again.

> IMO, it's easier to think about this as storing the least-significant-bit first
> CRC32 value using little endian byte order.

To be most clear this should be written as:

  u32 ibta_crc = swab32(~crc32_le(..)) // Gives you the IBTA defined value
  *packet = cpu_to_be32(ibta_crc); // Puts it in the packet

It follows the spec clearly and exactly.

Yes, you can get the same net effect using le:

  u32 not_ibta_crc = ~crc32_le(..)
  *packet = cpu_to_le32(not_ibta_crc)

It does work, but it is very hard to follow how that relates to the
specification when the u32 is not in the spec's format anymore.

What matters here, in rxe, is how to use the Linux crc32 library to
get exactly the value written down in the spec.

IMHO the le approach is an optimization to avoid the dobule swap, and
it should simply be described as such in a comment:

 The crc32 library gives a byte swapped result compared to the IBTA
 specification. swab32(~crc32_le(..)) will give values that match
 IBTA.

 To avoid double swapping we can instead write:
    *icrc = cpu_to_le32(~crc32_le(..))
 The value will still be big endian on the network.

No need to talk about coefficients.

Jason
