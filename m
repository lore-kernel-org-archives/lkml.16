Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA9C747F
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744850799; cv=none; b=XJtV2l7BGjc/nszG9kB4W2H/QG8z5bwc0QN+ZTf8Xju1orUhaNTYoIShYN7TfCSXrxBGogbT5vI6HZrW11bD88pjnrbp7QtTg1ED1UKUpvzb6BMSv7ClrPKeC0ldD0804qVD4TDxl2sl6xGteO5c9NSOQn30D17Q6i1aOjXVCjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744850799; c=relaxed/simple;
	bh=YAS5+GUEHwVduH4rwHd/rC19Nkw92l+oej3IXK4AgY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ryrEiQPwRV3WR1MCq4+eexUmiQyq1RRUmKt3tVFqNCJvO0WZkdwKlhErf+PWm44wggXnKABdfEReZGyJD8+r8l5TVMUMZME47m0zYHU/W2jv5MM9PdX0+FkPzyieM8McA++yJ37gYWDNy7JJ49JWbhwJGUBRwWgc1U8LIRhb+48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=WJW/Lmiy; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="WJW/Lmiy"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22c33677183so2697285ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 17:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744850797; x=1745455597; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TeLoQ/UYs1n3T3DVaNgpAsmgWZp6GaYK+MwPlSRGTSw=;
        b=WJW/LmiyVDY0ZihDObgBPKQU1qob0qDrJSgoByM6AnbzDcp73Uf3GfiaMqhKLbhBVN
         gwW4hqUTZdzocL/BwNydGoYvkji5pnVrUMTGEZ611v5b/uFVjr7ITsBVbArS/cRllYnY
         UmzF495Kxwy9uKdD34LwrsP8yfLyVGDvkbOc6Nv0tz1JUd51aIZ2vnpxM8GkcKsu1SjH
         f84TU9ApgbVMiAGPhJaQgv6iVXv6qMiSOhEj/UDxvQc3mDwNto2i3S2zX0c/knB/ct52
         jmTYbEWCLpQN98hkbD89dhVMKugTGcbThKvdWRjazC04C0H8vCEr+mTuZOXFMrT+vOZs
         8TFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744850797; x=1745455597;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TeLoQ/UYs1n3T3DVaNgpAsmgWZp6GaYK+MwPlSRGTSw=;
        b=i80/qaQ2wCVZjMtf5eQEsu4wY9KJtmQqlk/D5Z6Ef1pCjaSmrxTdKLgc5tcPDxyaUk
         G98Ol4bc9jF4McCNAmR88P6hYHLBKw+AojrEULHmpgW8D2vhVm0VMyJx4da7af8+GYZu
         zi0XW5tjzidMUhRzv0FrPKrzs+GIW3RiiDp9p2AJ3+VidJ7oGHFnhCvWZXXqD0EV4KbJ
         Ry2XPKaOR87rdDl+XpgcMM4Qmmn7rcL4GdGYEaSIeCWYU+EzDVHEC+gwwCcIZGPXq8mf
         jfLu8Zm3f0QTlZL4Qm6wzcAJNVHCRFjZsHK/qUeKdofDnyNXwGjuNrwIyMjyoWJ8u37Z
         RsOA==
X-Forwarded-Encrypted: i=1; AJvYcCUsVQu1jBfIEiN9MRf2pnMHKdRfFTbvQPcCNli9tgbN2p37a8ka5GQ4yCawWmQ517ZzvqEdkQSYJhOuA9k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+NCKnkxQcfWih1/kydR8fupje6V8vqvt/0vGpmhRxpsiSjeB4
	KcGbqVkLJrZ80JqYLZLOi0zs5cQj7eCHd5C06FzCkufQJx+gx4d3wQoEprYZqcc7iQFX3vQe5UQ
	=
X-Gm-Gg: ASbGncvWBOXDzcRDGirda4gbu8h63HNrV/5GE1OtAoDxRsu+nzRjv/vCKRvM9ULvH5y
	AGXwjFNrqF1aUdQfSsJ04iVs85WiWrjXPHuE9ivU5YJzNFAK6BbsHwb10udR8ky+09GL3IkCpul
	OFTdhzPJ3nReNeVmZOs9JU+LbmHFfd87UmLc9OJhIZV+3rrmAa8djLy1SNG5c8N1rg5Gns/Scgj
	9xjspZaTNgqbqvRJsA1T8YgHfnNNQXvjzzVjZzr5F9Q5paKYSeXeEbayfOvnEbuGGqj9qGWmEH7
	f0cXEuVuJeXPF5Pqpgt+tMzEv0B1XEMZBa9+r44d0FfG+j8zsFNyWVxb9PkR0e9UBn4Be7E+6t7
	ejKHSvg==
X-Google-Smtp-Source: AGHT+IG9OH3j12WASxNXpwelI1Q9a4h/4hUcpL+nlXZsuQbgJp92YodXxQVfhtEwvmGAfZZzvCB9ZA==
X-Received: by 2002:a17:903:2c9:b0:223:6657:5001 with SMTP id d9443c01a7336-22c3596b92amr71109105ad.40.1744850797089;
        Wed, 16 Apr 2025 17:46:37 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fe4de0sm20906765ad.212.2025.04.16.17.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:46:36 -0700 (PDT)
Date: Thu, 17 Apr 2025 00:46:34 +0000
From: Michael Rubin <matchstick@neverthere.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: dpenkler@gmail.com, dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 00/23] staging: gpib: u8 over uint8_t and u64 over
 uint64_t
Message-ID: <aABPat7WxeVBIOQ5@tiamat>
References: <20250409180953.398686-1-matchstick@neverthere.org>
 <2025041519-drier-decimal-8a7f@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025041519-drier-decimal-8a7f@gregkh>

On Tue, Apr 15, 2025 at 04:45:58PM +0200, Greg KH wrote:
> On Wed, Apr 09, 2025 at 06:09:30PM +0000, Michael Rubin wrote:
> > Preferring u8 over uint8_t and preferring u64 over uint64_t to adhere to
> > Linux code style.
> > 
> > * Patch 1 - Patch 22:
> > 	Reported by checkpatch.pl.
> > 	CHECK: Prefer kernel type 'u8' over 'uint8_t'
> > 
> > * Patch 23:
> > 	Reported by checkpatch.pl.
> > 	CHECK: Prefer kernel type 'u64' over 'uint64_t'
> > 
> 
> Only a portion of this series could be applied, as I hit some patch
> errors that I couldn't resolve easily.  Odds are we are out of sync
> somehow, can you rebase and resend the remaining ones?

Done. Hope these are the right ones.

Thanks for your patience.

Michael Rubin
