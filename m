Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848411E2606
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 19:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738179828; cv=none; b=D05FeOol6vMLKFnBbZW232XBOzLeM0Pz1a8l0DEozTivHxSNSYOHmuyocOnVLy1zQ0lSome1KI4zoqxZIOqKwEWWurkdo6C8RjyurtWVuI0KJg7EqRqOo6GZHkORAfMxbg23kj3z3qvXM9C5t7VUpmAYVkkq5dQgOSh2j4HP6ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738179828; c=relaxed/simple;
	bh=D2Kx2P+neXMFIw5ucuqV34P1DzELWI9lZRYaExHir/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GzXGOPij0dh3CLwLRaAa5igFInP9v1KP+P7kN4+1xY+gHK000YLdzHzbZrpz6b61jhK1bJKMqSXacQnpvGvAMr2BSS85DbYMJgRGHyItT65YduIQh761vLDvSagYeCDIb4Jhz35Gji1BlnRx9crcZJWVQE2y0xxXh6CjDa8wazs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Tj8GLVoi; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Tj8GLVoi"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6dd43b08674so380326d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 11:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1738179825; x=1738784625; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nSbrJF+0ambUjTCtJ80jRG3qCyBlWZS208KWFiT6W8k=;
        b=Tj8GLVoiZsOTrswFhHGP77GfLsoowQIELQYtveI4jjjohsTUVJr90rslbrec3rrSb+
         uspIDXlcp/CLBlKEp8VHv215Bf3zikezcqhWxc6jjuCJVvSUUAx0e3J07vkz6cRBLdbe
         TUON74UBOLhODuLk2s/6vS15geLiCgR7/hgtpmqcyA/QpP94e2e3WP2usQ2PstKJ5JIG
         QOH0Pna5xJwPTMwUu984n8IO1qVKEnfVGY539FinmEavTHXrJ8/DteoToJdVZpBVGPn0
         P5wcnB18dVT6xHvC45mFsvDF3DI94Ugwz/P6EWojTC3xdce4mi63N2F+SCH7RVLeC1E0
         zkPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738179825; x=1738784625;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nSbrJF+0ambUjTCtJ80jRG3qCyBlWZS208KWFiT6W8k=;
        b=YKpN6JLbMKrMdSG7Aqql85lgx5uEJk+AR/2+e8fvBpVB0/CV84Yf8IuI1hadeT547F
         oK/aSPXfmzCSAa/WkXuFoJ+fdVkhqidqdy3gKSQXws9sDO1Ui/xy47yyBV2gSYNoJTZf
         kg7DNAsiSj7m206v099osw2oiOb6UCNJ9Ii91UPCw3RTsquDVbP42elhluiCAR218bmI
         HVM5JPlQTEaaegbvM9FpREz7lODXl9FA4Z6CzysXMieOcATCBMBv6uGi/b8U0eWdsMKd
         Lwztw8DhpBluS7QJpnWR9STVYqCI+R5WafDw7YuS+YoYgAtPzSYLZ9xam06DQaMWtS6z
         vUog==
X-Forwarded-Encrypted: i=1; AJvYcCXeVNfTmF5TZVqSAmCIWZ15UgpKDfZTa9X2+qHPoHSLPNp8xTLxTMyozZ7DEs2QbDx+AeJoDSwYwWok+jI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhYuep7PIYYna3+WNiANaJIzOofnEzEEzhiXYQIDlrJ6G/9feq
	HkYqns7nYuknZmcGw+C2SP5lCHnsp/UhbPlDDei3NBEP2nlIwIBoYgVVf9VIHEQ=
X-Gm-Gg: ASbGncvx/pndItooKa9jwbPxYfKmItjpg5ppkkS4MCcWae7xKdKhUMbeQtXV2iiBdUf
	Hh7pVvFRvTTu8rfmIbaEc1lI92P+tz5di+fOCimSKkYVk/F4xGGLN5uRBmMRlmVQ4dvXbDdam3J
	DX3wApP+hWeFDqUzNNxJuldeo54WRB9GOLFKrq2T5SUsXDalhf0FGc1qfoPB5jbCW5MVOHQ2YsA
	MLH5RIS9T20hNtGotDQeaSefR3k5ZY8gvISNhZHdsSqBtSq8e3k0IU/sGaIYwnMhDP0ViU8WwSe
	t8q4DWWKEZ7qnVapStElKym6kxcsubb7jjltbKU6TnRKeh0N+Mp1tM89ODf0mugt
X-Google-Smtp-Source: AGHT+IHKhwF9xVpyoe5TNTrRCljlNEHVBKNqffPwSJMO26qOJXy1Tszicm+AOtcvz51i8IzoHdTOuw==
X-Received: by 2002:a0c:aa10:0:b0:6e2:4b52:ee21 with SMTP id 6a1803df08f44-6e24b52ef3amr24887696d6.9.1738179825298;
        Wed, 29 Jan 2025 11:43:45 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e205137058sm59033796d6.22.2025.01.29.11.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 11:43:44 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tdDyS-00000009RKn-11CL;
	Wed, 29 Jan 2025 15:43:44 -0400
Date: Wed, 29 Jan 2025 15:43:44 -0400
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
Message-ID: <20250129194344.GD2120662@ziepe.ca>
References: <20250127223840.67280-1-ebiggers@kernel.org>
 <20250127223840.67280-2-ebiggers@kernel.org>
 <ae41a37e-3ee4-484e-ba53-1cad9225df7a@linux.dev>
 <20250129183009.GC2120662@ziepe.ca>
 <20250129185115.GA2619178@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250129185115.GA2619178@google.com>

On Wed, Jan 29, 2025 at 06:51:15PM +0000, Eric Biggers wrote:
> Hi Jason,
> 
> On Wed, Jan 29, 2025 at 02:30:09PM -0400, Jason Gunthorpe wrote:
> > On Wed, Jan 29, 2025 at 10:44:39AM +0100, Zhu Yanjun wrote:
> > > 在 2025/1/27 23:38, Eric Biggers 写道:
> > > > From: Eric Biggers <ebiggers@google.com>
> > > > 
> > > > The usual big endian convention of InfiniBand does not apply to the
> > > > ICRC field, whose transmission is specified in terms of the CRC32
> > > > polynomial coefficients.  
> > 
> > This patch is on to something but this is not a good explanation.
> > 
> > The CRC32 in IB is stored as big endian and computed in big endian,
> > the spec says so explicitly:
> > 
> > 2) The CRC calculation is done in big endian byte order with the least
> >    significant bit of the most significant byte being the first
> >    bits in the CRC calculation.
> 
> (2) just specifies the order in which the bits are passed to the CRC.  It says
> nothing about how the CRC value is stored; that's in (4) instead.

It could be. The other parts of the spec are more definitive.
 
> The mention of "big endian" seems to refer to the bytes being passed
> from first to last, which is the nearly universal convention.

The LFSR Figure 57 shows how the numerical representation the spec
uses (ie the 0x9625B75A) maps to the LFSR, and it could be called big
endian.

Regardless, table 29 makes this crystal clear, it shows how the
numerical representation of 0x9625B75A is placed on the wire, it is
big endian as all IBTA values are - byte 52 is 0x96, byte 55 is 0x5A.

> (I would not have used the term "big endian" here, as it's
> confusing.) 

It could be read as going byte-by-byte, or it could be referring to
the layout of the numerical representation..

> > If you feed that to the CRC32 you should get 0x9625B75A in a CPU
> > register u32.
> > 
> > cpu_to_be32() will put it in the right order for on the wire.
> 
> I think cpu_to_be32() would put it in the wrong order.  Refer to the following:

It is fully explicit in table 29, 0x9625B75A is stored in big
endian format starting at byte 52.

It is easy to answer without guessing, Zhu should just run the sample
packet through the new crc library code and determine what the u32
value is. It is either 0x9625B75A or swab(0x9625B75A) and that will
tell what the code should be.

Jason
