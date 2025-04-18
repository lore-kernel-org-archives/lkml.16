Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1DF1FAC29
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 15:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744988924; cv=none; b=ZSOMQnnNy8BYnbmlUO/drJqydu0gevx5ICBXKLNfU3Ha9avwTdPfUjtNDm4v4K+IKbnluoaHaWTHgzcZa/euQNeGBjeIp7in0GXoYUORnuFaY2T8Ce8LbXS9ycmaOXokAf6XUbIU3fJF6+coRlHcgVYh2A5WjtLFa7dMhSAlP4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744988924; c=relaxed/simple;
	bh=833Lov5OrGShT2sPcmJuHqNCUoZcqgQRSOcAWmZvBtA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WjYmtNoF1Ubf6idbp5quuQPV88snCQQ7rixKSXYhmrEYTu+0JpGtmUz8DoosemCecHXmwGB32E2X4ptYgGHTapZmKN6u0O1WZFFcnKLKXnLKN8B6hHSzYdAr8O36HNmUcOmdr1c20+sNzy+ilgizkIqjvvskQTcFqdYBuVWpzDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZgWPjn7M; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZgWPjn7M"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-223fb0f619dso23828515ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 08:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744988922; x=1745593722; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xXrHi2dDhsHjFRrFFlLx3951AzAuiByzthX8mF+kPRc=;
        b=ZgWPjn7MVEd6SypU3tg9wBgYzntYzOzM0+LSAvCyGHLgP/RtsXtLG20zSFSEl+2yod
         GolfzZPm+/tpE8XWysmNfbnlXhHq7c41DY0nlxpzwBYHtpopVsh204oQKtQ3flMFifJ0
         J7P3x7QnG63uZQRWJ7HssJ2//1eIONKVcOR0frPakqkGMC8Oi+WfUc519r8aYnIDyQxK
         MXWQcjG/bl8SuRGaLSOL18admFg735ghimT/HSsuord5e7eiUfo9Ye9yyAg3zDKedzxe
         BotReLAHfifgfOzFp5MLnAwB44kS+5nHzuguKx3KykSZsAJXS9dXU2XCzNCmaP3TjfQ0
         IIeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744988922; x=1745593722;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xXrHi2dDhsHjFRrFFlLx3951AzAuiByzthX8mF+kPRc=;
        b=OOCaexBAIWLfg01MEiCZOuMQehS2Fb5VOGznDn+snZvLe7KZJo5RBKVFZHijFa+09p
         HfVyBs1P+jJPabjie5GZXgvFqN0MB0vpXPWTPj422tSH+V03hVgKG0Jn19n35BuyZmTL
         ezXwkL2AwHRpSeOUiy1XYWpW3/ZY1vKrLbKVQ+bcqB29HemqLwUB3Q3aeUV6O0yHdO2Y
         utSyAyOyjNRMxarjgkTP4jZ5Po0RJROZkflepM+Vw+QqcC38LuR8+MW3ZuiZimkkxOfc
         gZ+es3N7urQEQC12XQOdOh1wuF64CoKHijG8u19+vzMTLllnoyyLBU2iRF3Z26fKud58
         Amvw==
X-Forwarded-Encrypted: i=1; AJvYcCXHhRn6V+jf8MNS42VBe0A4e/10gCVxB/YVEZBAthhAdpMqalpVNmr8J60FdtUM4FsNWl7lUCjrR5wg2lU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCd4Y8NiTdkn3QENCW32mYUOMBWztqYhRfgd8OqKWFBQSougkx
	UXqSG/NPMxnhrY8syq+Re9fg5FXSgrxsuyNlsodbXpW5IUaP1U6Z
X-Gm-Gg: ASbGncvZwhJMPybv1guNKaY02qPVNefF7UD71DOqb8GdaTUUrCo9ELjQzL1svhii0nF
	evW7/rvxFAYEcRenf+sFdy5DpfbVXuIK9gAqTVvvU2lAI+3wXHkTBBx9iAqGqt4z8ILiWntAtTb
	K5L5XMQunq69xyP64X+OslC1Ofly01hUfX0k6NAy+pTMUPDn0dh64F4k5EBJdf4u0nPu8JrPx/g
	ojTb4YgqJw/tSHL8qbFsLMpDqeTUIj43YaaoxazmZkF+nIIoyfYp+QUkl84QZo8+biEyidGRNgU
	YebvZPj4lwLXWmR5Ecla2UXoIUI+AiSwx4eJOLx3
X-Google-Smtp-Source: AGHT+IFgyjtFyh0D1cewNDh4KCf3omEopwXw/CgC9qM37WkDXknCiuMsdR9x6yE6lYdQVJp7loAorg==
X-Received: by 2002:a17:903:3202:b0:224:c47:cbd with SMTP id d9443c01a7336-22c530bc965mr45650025ad.0.1744988921670;
        Fri, 18 Apr 2025 08:08:41 -0700 (PDT)
Received: from localhost ([216.228.127.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bf3fcbsm18016695ad.78.2025.04.18.08.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 08:08:40 -0700 (PDT)
Date: Fri, 18 Apr 2025 11:08:38 -0400
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
Message-ID: <aAJq9mGswYsnAOS8@yury>
References: <20250417-field_modify-v3-0-6f7992aafcb7@quicinc.com>
 <86sem7jb5t.wl-maz@kernel.org>
 <0c97c659-bd28-45e0-8537-d9be2637cb22@lunn.ch>
 <86mscek7h3.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86mscek7h3.wl-maz@kernel.org>

On Thu, Apr 17, 2025 at 06:45:12PM +0100, Marc Zyngier wrote:
> On Thu, 17 Apr 2025 18:22:29 +0100,
> Andrew Lunn <andrew@lunn.ch> wrote:
> > 
> > On Thu, Apr 17, 2025 at 12:10:54PM +0100, Marc Zyngier wrote:
> > > On Thu, 17 Apr 2025 11:47:07 +0100,
> > > Luo Jie <quic_luoj@quicinc.com> wrote:
> > > > 
> > > > Add the helper FIELD_MODIFY() to the FIELD_XXX family of bitfield
> > > > macros. It is functionally similar as xxx_replace_bits(), but adds
> > > > the compile time checking to catch incorrect parameter type errors.
> > > > 
> > > > This series also converts the four instances of opencoded FIELD_MODIFY()
> > > > that are found in the core kernel files, to instead use the new
> > > > FIELD_MODIFY() macro. This is achieved with Coccinelle, by adding
> > > > the script field_modify.cocci.
> > > > 
> > > > The changes are validated on IPQ9574 SoC which uses ARM64 architecture.
> > > 
> > > We already have the *_replace_bits() functions (see
> > > include/linux/bitfield.h).
> > > 
> > > Why do we need extra helpers?
> > 
> > If you look at bitfield.h, the *_replace_bits() seem to be
> > undocumented internal macro magic, not something you are expected to
> > use. What you are expected to use in that file is however well
> > documented. The macro magic also means that cross referencing tools
> > don't find them.
> 
> $ git grep _replace_bits|  wc -l
> 1514

FIELD_PREP() only is used 10 times more.
 
> I think a bunch of people have found them, tooling notwithstanding.
> 
> As for the documentation, the commit message in 00b0c9b82663ac would
> be advantageously promoted to full-fledged kernel-doc.

The FIELD_MODIFY() and uxx_replace_bits() are simply different things.

FIELD_MODIFY() employs __BF_FIELD_CHECK(), which allows strict
parameters checking at compile time. And people like it. See
recent fixed-size GENMASK() series:

https://patchwork.kernel.org/comment/26283604/

The _replace_bits() functions return fixed-width values, and intended
for: "manipulating bitfields both in host- and fixed-endian", as the
very first line in the commit message says.

Those using _replace_bits() for something else abuse the API, and
should switch to FIELD_MODIFY().
