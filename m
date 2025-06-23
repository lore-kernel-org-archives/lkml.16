Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DB622FE17
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750675826; cv=none; b=FCwott9Rr2cUjvuLNQuLFvZd1pl2ViyulN9/NgX8PJWaBE5sr9sBLdEJ2TIK4lRM9Q2BnDK9keWSVrNs6G94Nl7dZngycsMIao+sRTZgZUQ60RamkrFufxn/QNp5COsoKjsKDmjMwh0kzdXNk/jcrCDdTgUijMh9+UCUp9kSRj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750675826; c=relaxed/simple;
	bh=TMhuI8oyTSVxw9bC+sp9sw5qCfSwlWgIVLQsz6K/PlY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iwH2vk+XlyH5+j5poVR3a1GJtrI7A1MDAieCkiGxJdYqclomvhRkPjhSARUcc4peMQG3goAD5nkrS3uWMrvj9VmGkqCJvwMCUNACmaCoTvcIQdnJIsUCZH3EqSMMtkf+tLSqxTrwQtmPRUjWdRIWd/z4wlElVdm23QyqCB5ZIhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=neuq9Jjx; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="neuq9Jjx"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45363645a8eso22968785e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 03:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750675821; x=1751280621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m08zWEvJfz/USiHAalcZNBUXJ7ks7hFL+IV7NJ3Oxxk=;
        b=neuq9JjxqU1xexPv4Ifsv6k63Uzb2tGUjK67ZY1d8olgPhUNdXQOVFK5NM0taocIgz
         2AxFWNSyg3hU/AhqWqhgwnJe2QUm85gUv/CqLjVXHHfVBBkM8fesWjzDkaSx+qAMm4lW
         N8og2V5kDGDscqKaUgNwd4oA1HNHDvFdW6nT3QD3wKACR9TcXdqB6LJnLhgA1eRt0CXm
         3VBwSoVu5g93tZ8NrQ0TJsSUQVJMld06hUu9e6TmAOxIYDqNoWsfQkr2ZHMrVvLJaXc/
         9PYjhfwGGnlTOq6jMVsBPDbNUIH2qNpUrRyU+RNDv6MkWzcOcoAtPcNWdzi15ReFBOFM
         s1MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750675821; x=1751280621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m08zWEvJfz/USiHAalcZNBUXJ7ks7hFL+IV7NJ3Oxxk=;
        b=eqvApwhl7FMyZ4RdVdAuJRKu8L6UW9r64WUB8PdnBBBTXsO7U+BfBijRwOYqEbtksS
         tVn8GBaaSjGrCXQVl6qAsUumjCru9GJlFPDSNU1MU0pquXLORH1GCdnQlamsdPE51lNm
         tbNWJJwpsLEsFdc1LBB+7iuC92b3omnTR1bEfOC7PY7U12MUPqrf48/SZ3MeTQEUPYkO
         ia7Lh6XipWHoXHG5kndd5ndOfaYf141LHzE/ulg2o7G8boXWf7SFEA+YwLD+1SkdFH7y
         WpRymMEipwkHNDYzqNniGRkvqXVnKkWyhnrHPbK+wX0O5wPFrujv5WLNDqXYzw0j+zz+
         WaDw==
X-Forwarded-Encrypted: i=1; AJvYcCV9Ih9J/6mV5bJ7f+5kqWF/DXKpNJWbDRA6892iMFIBnQhYFx8TGD7T0De3hatKamllHnsvY57THANBeM0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOyH38QoypmdjNhpHnDRFa4eGxJ9H+te3f6qFevsXuEn/pxdKp
	W5vz093SFABZeS/PkkRk4Fgbb0q4fRX9JJvbue4sbqmdJgU3VjikCou7
X-Gm-Gg: ASbGncsvyZpPCMSfibp/Y62/wirQg9Zc1lYQJcqVg8Hqif5v/EddQLsMB9Zl1/zUp4t
	DgVtDsMdaLyQY/XqfgSNBjwJrth8bUaZDQPTgUV3EQNe2SkuXTksx4klWdzgQ1xwdeEhDcOQdMO
	vREVe1teL/t9iSW/zYW2vHdGjJAE90rODWqfvCbmWakAT6wgy5D78QQzJywlUMzRRn3hQf1GsKy
	8Deez/XQDlCY3KSH8Aa2YlZc6jbjyY0uhfRp6SQlGwnTUwcFdy/8Z6aa4ndXLr2pzxirhrLzg9e
	fpypUyF8dDfrf4YdDgBzq+q4GErXcSEUUTXo2ZGoAFjKLPn/Uza9ukuSkZePrheFsJ9UcSE41cB
	bmKvrCds/wByP7RgVWDGGxX/1
X-Google-Smtp-Source: AGHT+IEp4jMR6u+d1seVukmVVWep1jFCD0YNNzWaNs/T8+Bt7/CO4kjMWT6zCDPPwvwNBaZwfFxNRQ==
X-Received: by 2002:a05:600c:6995:b0:450:d367:c385 with SMTP id 5b1f17b1804b1-453658ba6c1mr103607175e9.16.1750675821079;
        Mon, 23 Jun 2025 03:50:21 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d117c03asm9004137f8f.49.2025.06.23.03.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 03:50:20 -0700 (PDT)
Date: Mon, 23 Jun 2025 11:50:19 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Rik van Riel <riel@surriel.com>
Cc: Nadav Amit <nadav.amit@gmail.com>, linux-kernel@vger.kernel.org,
 kernel-team@meta.com, dave.hansen@linux.intel.com, luto@kernel.org,
 peterz@infradead.org, bp@alien8.de, x86@kernel.org, seanjc@google.com,
 tglx@linutronix.de, mingo@kernel.org, Yu-cheng Yu <yu-cheng.yu@intel.com>
Subject: Re: [RFC PATCH v4 5/8] x86/mm: Introduce Remote Action Request
Message-ID: <20250623115019.6a750e10@pumpkin>
In-Reply-To: <49eee1cb79b75b02b8ed19a7f6d39e1ee8fae171.camel@surriel.com>
References: <20250619200442.1694583-1-riel@surriel.com>
	<20250619200442.1694583-6-riel@surriel.com>
	<6f9d7c86-9faf-48a0-b7b9-d58bb21ce948@gmail.com>
	<49eee1cb79b75b02b8ed19a7f6d39e1ee8fae171.camel@surriel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 19 Jun 2025 21:10:47 -0400
Rik van Riel <riel@surriel.com> wrote:

> On Fri, 2025-06-20 at 02:01 +0300, Nadav Amit wrote:
> >   
> > > +/*
> > > + * Reduce contention for the RAR payloads by having a small number
> > > of
> > > + * CPUs share a RAR payload entry, instead of a free for all with
> > > all CPUs.
> > > + */
> > > +struct rar_lock {
> > > +	union {
> > > +		raw_spinlock_t lock;
> > > +		char __padding[SMP_CACHE_BYTES];
> > > +	};
> > > +};  
> > 
> > I think you can lose the __padding and instead have 
> > ____cacheline_aligned (and then you won't need union).
> >   
> I tried that initially, but the compiler was unhappy
> to have __cacheline_aligned in the definition of a
> struct.

You should be able to put it onto the first structure member.
(Which would match the normal use.)

The padding doesn't have the same effect.
Even for rar_lock[] the first entry will share with whatever
comes before, and the padding on the last entry just isn't used.

	David
 
