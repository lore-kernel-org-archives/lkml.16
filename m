Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B0524679C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 19:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750707521; cv=none; b=DvqU7Y66TyDTkfgdMwaRu3cZX42gH3BUdprLFBgu5e6AIRZmbrF3B+E89J3gwmF0+gQqUImE65Zadug1894HX3e5q3J4YXVy6xTP89Wmg/ZXHiVYcFhE8qsWMLCywTC9YGmCsE9RF4/0KukauWX+T+kb+8R3C59uLKvFVjIqcIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750707521; c=relaxed/simple;
	bh=SUcO28iflARfNEkJ1ohNxfXTZlHppMemTQUfxW2VsWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cGflDKLNya3z5SoqBNT6cc8wfky8OfBlBdDChJSaibdKzdfNQ/nymZ74XKZOG2h4/vveAYUD5++CMyI09SBIodMeyUPUz9bDqAumms3Tcx7hyolX7TK0B5+EIKGqDuZZQGJPWUUZ0oS7kta3QnGjS5nqbTRRkQS3X9qSx1tfJK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=UKrNLTBK; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="UKrNLTBK"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4a43d2d5569so60904571cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 12:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1750707519; x=1751312319; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OsDFFNadcPKAi2oIob212fTkg2LjML9Ql3EAFUmRUHU=;
        b=UKrNLTBKpKaBUnh67CB1fjxxDLLpBBJlH4ElR3+LebtbPOMtxAbxqW26OWB+e8SP2L
         KVPA79/UvnxJA3fZbbSpnRubrOl8CNTMFKiSMwYErojpdX7zkAehNdYqX1IHR2qqPATG
         RlHJiwR761EFYXGQeWKYmSeJRqjcAOmhCEHXjNOgNZ5Qf5uYZxWsg4FODA2L7825WcOJ
         Ly64cwO9fd1+/gqx4mSqg37XmJBuwiY85PdfkqGdsQ1IJ4YG4S0zNRCipCSGdtIwOhfw
         7PY09QP2KZI+hI8ebYuo5IAmL2vwWP+p84ULiykV/nibuLmzSBotCriXKBk8Y8UWEwh5
         meLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750707519; x=1751312319;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OsDFFNadcPKAi2oIob212fTkg2LjML9Ql3EAFUmRUHU=;
        b=tnZAOzr8zXpPE+SIh4uJ/S4IW/Dj9806F1A/giYPC58+5XWIH/vUYqPmtmbP1gxImn
         H315o4peiOHySg/kdBgPnhuCOSe8NsOtQBO+REuRqQ+hEeZc6Qwmpw/PMke5gv3Y7v9K
         MUjkGutXil77dt6CEbrzX7IpGxWRpBgO/K5n91/jX8Zq7Yag+hVAYLImp9JRXzRoJSMl
         uekG/yUcfVBKq5b2NKOYJztCFFNEG6521cdEe77RCwRvxn+6/gP0lZnmGxHrulstOb76
         b/cWG3a31rEonzXRphLW2oQDTkqcL6+pU4OdGsv6BVnCD3mN3oJtZJ7uSv1CfssURPKr
         QyvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjglHgdGJQIMjTighO7lld4Kkijsdehil+iAjuATz0sFIWq+rUVA5klZSvZNkY5D5HBePP9j/7aDgKrT4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUKWa7/+7ND78njNsY5nUeoOu0DACmEFBkV9YyzzEjFM7iyI1Y
	/RTSKrnaPmpjaQztQ7Er+89e0KcBFgraokC26BrBHb6EJG1eI0VYmWGxwD84/1WKFkI=
X-Gm-Gg: ASbGncvKJQY7B9BuSXxNBOlMSFzrChxmH5Ol+d1E5JpQh5SSSDjlA2eLv2vfi34DQ1l
	PmUX9YCj+elv7Wy5ad1h8HZWO3h5z1dOtHAihkvORSJ6/NCqz25439B7i78RWpLbtkWqm2er1SK
	dAp0T7Mt9OBcaU8IVgXlOMT6AMJRLe3kZTPRUVUkc05cJyUdSakH+g0vh/iLqDfk2GzIWrqcfN4
	dxJcUtOdwe5ycCVV1L5Sa5UaUcxntHECMfgYqJy0XRiGOoRb0o4+Z5WQARn6M1/hPeUYFuYjDh2
	xyiatoKnIhU4pyWaMwFJk1KZGK6hUFyNFnUR1Tz2P9Cw1f306FB8weJJAA==
X-Google-Smtp-Source: AGHT+IGEe4owoKuwDVOewVa/4Edect3j8Yf80FLCWoMblOwP+OBaPb93AZugTiBwPwwRicj7AyEi8w==
X-Received: by 2002:a05:622a:13cf:b0:4a5:8387:8b9f with SMTP id d75a77b69052e-4a77a24bc82mr181710941cf.15.1750707519236;
        Mon, 23 Jun 2025 12:38:39 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([2620:10d:c091:400::5:e19e])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a779e956bcsm41726641cf.74.2025.06.23.12.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 12:38:38 -0700 (PDT)
Date: Mon, 23 Jun 2025 14:38:36 -0500
From: Gregory Price <gourry@gourry.net>
To: David Hildenbrand <david@redhat.com>
Cc: Bijan Tabatabai <bijan311@gmail.com>, damon@lists.linux.dev,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, sj@kernel.org,
	akpm@linux-foundation.org, ziy@nvidia.com, matthew.brost@intel.com,
	joshua.hahnjy@gmail.com, rakie.kim@sk.com, byungchul@sk.com,
	ying.huang@linux.alibaba.com, apopple@nvidia.com,
	bijantabatab@micron.com, venkataravis@micron.com,
	emirakhur@micron.com, ajayjoshi@micron.com, vtavarespetr@micron.com
Subject: Re: [RFC PATCH v2 1/2] mm/mempolicy: Expose get_il_weight() to MM
Message-ID: <aFmtPIAYnp4oeAZ1@gourry-fedora-PF4VCD3F>
References: <20250620180458.5041-1-bijan311@gmail.com>
 <20250620180458.5041-2-bijan311@gmail.com>
 <0067568e-a604-46d3-96fd-41b62968a90e@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0067568e-a604-46d3-96fd-41b62968a90e@redhat.com>

On Mon, Jun 23, 2025 at 09:14:34PM +0200, David Hildenbrand wrote:
> > +u8 get_il_weight(int node)
> 
> The function name is shockingly confusing when used outside this file. Do we
> have some namespace to at least highlight what this is about?
> 
> node_interleave_weight() might be a lot clearer?
> 

this is fair and my fault as I didn't consider whether it'd ever be used
outside mempolicy.  So i agree it should be renamed or wrapped.

~Gregory
