Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED1D2E11CC
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 14:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749912628; cv=none; b=LNGMpvISM5zVgq8MN2CRINhfsjJn3ER/2j3R0x+vtyFhjg3NorYGUWYaBiOKGwFjsDZHlW2CRMs87mmNVvyGRUIxD6dKR0DwwdIzLTsRQGPlFy4C820Kws0rSmUGM7wrgOl9Qc6LB3VGuN+dOEZ6sDknFFmFmxoHMpazQWOYh/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749912628; c=relaxed/simple;
	bh=BrM95uFQCiveXc3halmb2r0s2cwqdslus3D3PtQPrT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZGmYCN8BIIbYivolqphnJO1hSWiQrPU8Z6xsyUtx/nAtr7NaQZAo9Y7hmkjYyuK2INXg535hNPbq5D0aidzE5RYi8tv+1FhsLtz+Tza/NP3CtK0vwYHUiv2uD4Z4s4o8hjvDddhjEllRW4wWWeaKO5ki1CY+wF3SdGtFGrz5Cx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AocHFOor; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AocHFOor"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a53359dea5so1990185f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 07:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749912625; x=1750517425; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wbRMLc2DHSmY3gtRYXV6hsuWddG4eIKep4QdutNHpX4=;
        b=AocHFOorTe5jncVOqP9XxjbfHl34vYaKuOAVIysWLHbOtOr7gaVdWoV4ICZg8w0hMK
         zjdlqg6ZyKnTpevhjL4+Wh7Am4e/+H0x4UR3MJLdOsqMQkOhK9ShZJxN22m0S48sP0p8
         M1/d4nlAYorpqVCjmB9zACeGyHVAGdwdeeOQRXrg5vF6Jy/9t+rsEAVqCASlFX1BPelb
         KJG2uJIzEC0NZuG0G9T81dfJPtZpo+EhtvM99Z0FCPnrdBdjLtsf8haDwjc3oRH61nEp
         CvbLfeiWICYxiQ0eilHO48Vh5ilkzSTGLnwDPWthTfaf/d5EqAygqUhUVg0XYfc/UZzE
         TEXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749912625; x=1750517425;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wbRMLc2DHSmY3gtRYXV6hsuWddG4eIKep4QdutNHpX4=;
        b=FHFSQFIImzjusE0N3FAy7yWOwrZOGpjrtHUi+QBu+Pc5jihT2P1xxvtb5lDi2OngnI
         Hk6zaEOhfwa1u0r0ViGCKy/IOTiKBNHLUmPAiMtMBsllyZ0IDIVbZXFxKVwiB+7ao52e
         UE2O22MarpQ9Y+ySI5vAzLi/fqT3fVJ3/ncqx2qK9RMsXeYhHwBa09NawBPxDSvxBh/q
         Rqos5ipz3rA8CKkrlK2x5+9g2tJ7Bwpd2Uh0YpTXS/ZO3UNND//bD6yXvZ20oqzyQARZ
         5mkokIBi8wwQ6uoLnR4W7byeXy7wGgJ5eebZ4N+IMN0XzYKo/cF8OHDne6Omdnor7Q6q
         WqgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZ11BIF/7qyizdSkqk8mH8OiR5Rs3lQ29TxCp1SYb+8HycOd/U2i7mR1VYEiGmi583pR8eME5HodPVLnM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWLZNzY4/jvRrloxs/rmDLRdtSu5fn8Td8ZEgMT5u6vmAIDoFE
	fNXzhjOUlO/Dqmxb2y01m2SIrF4kQMEfG9eSkrRZ9FW9YNNeDBYn68uy
X-Gm-Gg: ASbGncvtwnMqbOL5AEmvWAFtHRk/+WZz3QdnAadnbmoZS2snVklzd/hptnjrvoDH1Ll
	Cn9+aCIjRdHJ7f/v19TnSeIKNA1OFzLYdUi3BPswhu+kzIlYfJ/O4FuZOtK1jte1ZFSjgWjysj6
	vImZ/rPAgrbhyHPeK/ZH0OmB1dYpcC/avTXTkMPhJ/DSIDE3gOlTU2g3i3LDxmrq9hNW7fs21rs
	al4NfS0JOMUcCqvfnGKEdLJbTZdtL4NZWTJ1OrBCXd60bstZ08qQokFLJx0sbOQkA6WJmJ6T8t5
	iYEM1Ubd+94SCyzqed4mDfY1cNtdA2ls4IeQieE42ZpjGQ8tyWbP273Z8VJGLn0owRPvbXWkca9
	JwyZpxW4DcwazZr6DsvDdsHTBR20=
X-Google-Smtp-Source: AGHT+IEni0696dlbfzFqWZBuZnunRZWdNQTsGCmjg9gZBYVPMKFqm2DwLd5HLiSgEdoqGRVzf1WUXQ==
X-Received: by 2002:a05:6000:2913:b0:3a5:2257:17b4 with SMTP id ffacd0b85a97d-3a572e58fecmr3447561f8f.55.1749912624775;
        Sat, 14 Jun 2025 07:50:24 -0700 (PDT)
Received: from ed.ac.uk (pat-125-253.wlan.net.ed.ac.uk. [192.41.125.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a734b5sm5521753f8f.33.2025.06.14.07.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 07:50:24 -0700 (PDT)
Date: Sat, 14 Jun 2025 15:50:21 +0100
From: Karim Manaouil <kmanaouil.dev@gmail.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org,
	david@redhat.com, catalin.marinas@arm.com, will@kernel.org,
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	steven.price@arm.com, gshan@redhat.com,
	linux-arm-kernel@lists.infradead.org, yang@os.amperecomputing.com,
	ryan.roberts@arm.com, anshuman.khandual@arm.com
Subject: Re: [PATCH v3 1/2] arm64: pageattr: Use pagewalk API to change
 memory permissions
Message-ID: <20250614145021.7yve56wcxf3dlvwg@ed.ac.uk>
References: <20250613134352.65994-1-dev.jain@arm.com>
 <20250613134352.65994-2-dev.jain@arm.com>
 <8077b321-8953-46aa-b06d-95c91823e6ce@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8077b321-8953-46aa-b06d-95c91823e6ce@lucifer.local>

On Fri, Jun 13, 2025 at 05:27:27PM +0100, Lorenzo Stoakes wrote:
> On Fri, Jun 13, 2025 at 07:13:51PM +0530, Dev Jain wrote:
> > +		if (WARN_ON_ONCE((next - addr) != PGDIR_SIZE))
> > +			return -EINVAL;
> 
> I guess the point here is to assert that the searched range _entirely
> spans_ the folio that the higher order leaf page table entry describes.
> 
> I'm guessing this is desired.
> 
> But I'm not sure this should be a warning?
> 
> What if you happen to walk a range that isn't aligned like this?

My understandging is that the caller must ensure that addr is
pud/pmd/pte-aligned. But, imho, since -EINVAL is returned, I don't think
the WARN_ON_ONCE() is needed.

-- 
~karim
