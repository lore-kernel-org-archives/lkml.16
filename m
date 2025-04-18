Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392CA219304
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 17:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744995879; cv=none; b=ctITnxJQhw53AWVZpN1sPhUcJRcqRd14C0eg/wWEYXrQhhsPk6MRnxAGQsvHF0f7BpblMSd8QF7Hv9ysglKUSeJCkMT3itE7D681gJrAvFtc30qcySZxcYUGAmqDylzWCR6Rx+W0d8CZVaCNNBjnT/Dr4qs7L6w1BA95MlAKDSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744995879; c=relaxed/simple;
	bh=1pwYqEYc6XG1eoznV3U3yKal7d9cVfNd2CuRCZxOjN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hPgfS6zHUv1p8qg4wfDJn+ZRewlcwgXI+RIEZOnX0bP81o6XFcXPyre/tNgmR0RKKsD62/zv6NivZP1RDL+hNf1ZDaoNi4WrM/bjwaS2MUfnd9fItWS3JVrx+LJIsq4FUT35avBtGcWJKDRc/7bP2E/kENZgogAQds9mfP/MP1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jAM7RMEo; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jAM7RMEo"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-736a7e126c7so1789692b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 10:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744995877; x=1745600677; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GmDYdCFy/X2BM6MIhNTfkBMtV16BYD5eNM/8mtgykck=;
        b=jAM7RMEo1DMfBdCzbIQL+1mbpOyAo1kGfAr72RfILWlGkAxKpfK8DjquZHTVQqSVYH
         LL3qkEXaswOzkwBZRrTEAr2wtCkMT+mhkKVFZMTRuC4ZERx9VNnPuDST0IxFgPWPbH4f
         GdcOsKT3WZHeAWylgRiP69CSLv5rK9Ov8fYsiQdHQaC4+fWi9wk5aGSL4I+44QNOQVBS
         H2077/xxxCLbWxgxCUOd4u/rLfZ76WSoCAQdLYK4YDLHZzihxGehQlZXRHAXSfY0jPWs
         1/dH5E8AqQpPRk9r7wC6m98fbFyEyYuzBJTYOZw9oMCWlnjM/72ssq0KS6X6u0Dkg/Gu
         A1/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744995877; x=1745600677;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GmDYdCFy/X2BM6MIhNTfkBMtV16BYD5eNM/8mtgykck=;
        b=VtIvrYPrZAVuTDlpaQr6iv6/tCyFfhfEPIriWTtbu4ZNkKWxsyQdq70iO2SNKGhdjO
         xYdg+F/tcUdPVZSJiwbzKZEwRDpXcppv1M6ROheiDEo8Xp6zOQQzngWBvAr5JSOgG7dC
         keKC0zMOWrGbXKVu61PrHujM/bhxP3FTcy1lnBZEV2QxHn4FXycKH8SnPEQT/s/9T97T
         KjCAQ/PriIkkF+MRP37dP42hQOkDtlL5sU1ikerjq05pvCyvnQhLo0dt/afEJEbkRQn4
         cuvC9IQ0kZKrIlbUtysJOEuGwy0FPvViVVkWod2Mdta9GXfITxwYo6qwgZ+pafrNA8Zy
         zBvA==
X-Forwarded-Encrypted: i=1; AJvYcCUxJ+uwIh0M/LxMBcNqTXn3JGXtL8pAzJYUr5AK5Q4k5EHoXbxhhPSm3YOiXCXcFBhpwaYpqywPL5f/I70=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLluN/jaeRqsKHDV1qmd8Gr7eIOybmnL0pxHkhdS5GxSxLW/SZ
	7o+yo1+U53zze3ZwhxfmWf5ePdahtGyipqAHqV5D1kaVRKZFCkSb
X-Gm-Gg: ASbGncv1uT2A0wf93EDfJkkJNeokuRdJ+WK3TIwQkGG0VCSNO17JZPqhhOgQS5dq0Dc
	kCJsLgnsW3vrFsfdgcT8vq1D2iJjRh+Uuf03oT9dT8XumLedz27Ag4yiFyESJxyLfGVCzfOdd5S
	Jq+nQvqnS9nKyv1LMYQvS791gO4/qJChU5TKfA/ciL7IssaZqan3kaB80ZfOudglex7jK8Q3T2C
	Yj+1ADtbr3GcibsqAC5YNFoOCT1RiW87vvdAj1Z1ZyA4E8qgPtf7XmKjdQxfzVhSIt46M+4+5vm
	wbnVV38+Z6kJ3YB4TA7561/+lFqjpOXH/vxdT+ua
X-Google-Smtp-Source: AGHT+IFLjBIAYmNf23xJJKoS/fi4jO2Zv3lRydVslbcuKYfFZSoy/LLNwK2RXNGDnjZOnf14RqtA6A==
X-Received: by 2002:a05:6a00:4489:b0:736:ab1e:b1ab with SMTP id d2e1a72fcca58-73dc119334amr4736522b3a.0.1744995877338;
        Fri, 18 Apr 2025 10:04:37 -0700 (PDT)
Received: from localhost ([216.228.127.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaace0dsm1823852b3a.126.2025.04.18.10.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 10:04:36 -0700 (PDT)
Date: Fri, 18 Apr 2025 13:04:28 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Luo Jie <quic_luoj@quicinc.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, linux-kernel@vger.kernel.org,
	cocci@inria.fr, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, quic_kkumarcs@quicinc.com,
	quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
	quic_suruchia@quicinc.com, quic_pavir@quicinc.com
Subject: Re: [PATCH v3 0/6] Add FIELD_MODIFY() helper
Message-ID: <aAKGHIssRW5jXvdA@yury>
References: <20250417-field_modify-v3-0-6f7992aafcb7@quicinc.com>
 <86sem7jb5t.wl-maz@kernel.org>
 <0c97c659-bd28-45e0-8537-d9be2637cb22@lunn.ch>
 <86mscek7h3.wl-maz@kernel.org>
 <aAJq9mGswYsnAOS8@yury>
 <87plh9xz2d.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87plh9xz2d.wl-maz@kernel.org>

On Fri, Apr 18, 2025 at 04:35:22PM +0100, Marc Zyngier wrote:
> On Fri, 18 Apr 2025 16:08:38 +0100,
> Yury Norov <yury.norov@gmail.com> wrote:
> > 
> > On Thu, Apr 17, 2025 at 06:45:12PM +0100, Marc Zyngier wrote:
> > > On Thu, 17 Apr 2025 18:22:29 +0100,
> > > Andrew Lunn <andrew@lunn.ch> wrote:
> > > > 
> > > > On Thu, Apr 17, 2025 at 12:10:54PM +0100, Marc Zyngier wrote:
> > > > > On Thu, 17 Apr 2025 11:47:07 +0100,
> > > > > Luo Jie <quic_luoj@quicinc.com> wrote:
> > > > > > 
> > > > > > Add the helper FIELD_MODIFY() to the FIELD_XXX family of bitfield
> > > > > > macros. It is functionally similar as xxx_replace_bits(), but adds
> > > > > > the compile time checking to catch incorrect parameter type errors.
> > > > > > 
> > > > > > This series also converts the four instances of opencoded FIELD_MODIFY()
> > > > > > that are found in the core kernel files, to instead use the new
> > > > > > FIELD_MODIFY() macro. This is achieved with Coccinelle, by adding
> > > > > > the script field_modify.cocci.
> > > > > > 
> > > > > > The changes are validated on IPQ9574 SoC which uses ARM64 architecture.
> > > > > 
> > > > > We already have the *_replace_bits() functions (see
> > > > > include/linux/bitfield.h).
> > > > > 
> > > > > Why do we need extra helpers?
> > > > 
> > > > If you look at bitfield.h, the *_replace_bits() seem to be
> > > > undocumented internal macro magic, not something you are expected to
> > > > use. What you are expected to use in that file is however well
> > > > documented. The macro magic also means that cross referencing tools
> > > > don't find them.
> > > 
> > > $ git grep _replace_bits|  wc -l
> > > 1514
> > 
> > FIELD_PREP() only is used 10 times more.
> 
> And? I'm sure that if you count "+", you'll find it to be yet a few
> order of magnitudes more.

And nothing. It seems that you like statistics, so I shared some more.

> > > I think a bunch of people have found them, tooling notwithstanding.
> > > 
> > > As for the documentation, the commit message in 00b0c9b82663ac would
> > > be advantageously promoted to full-fledged kernel-doc.
> > 
> > The FIELD_MODIFY() and uxx_replace_bits() are simply different things.
> > 
> > FIELD_MODIFY() employs __BF_FIELD_CHECK(), which allows strict
> > parameters checking at compile time. And people like it. See
> > recent fixed-size GENMASK() series:
> > 
> > https://patchwork.kernel.org/comment/26283604/
> 
> I don't care much for what people like or not. I don't see this
> FIELD_MODIFY() as a particular improvement on *_replace_bits().

Sad to hear that. Those people are all kernel engineers, and they
deserve some respect.

We are talking about tooling here. People use tools only if they like
them. Luo likes FIELD_MODIFY() over (yes, undocumented and ungreppable)
xx_replace_bits() for the reasons he described very clearly. He's going
to use it in his driver shortly, and this arm64 detour has been made
after my request.

From my perspective, both functions have their right to live in kernel.
They are similar but not identical.

I'll take patch #1 in my branch. Regarding ARM64 part - it's up to you
either to switch to FIELD_MODIFY(), _replace_bits(), or do nothing.

Thanks,
Yury
