Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D65C2040B5
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 19:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738783120; cv=none; b=UOGD9HD6Th2ZNRAczN6z9H28AywR2iuemDwiZ37DgRfxP+GKGYR2TA2AswxQ4Z/Mqn/riENHQMKBAT35a5HVF70OMpDVbqtz7hdMXZDhfFatRb1djsZHmJ/JEmanaFrwHi3zJX2qU5yZ+vvIkdYGGB55jYdlB/Qha5inVJdUjcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738783120; c=relaxed/simple;
	bh=oPEtVOpN+aKW2p42nBcWfhpXpIMCi7MvBIh1JiLFbt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BoM/otNMdVU/hi36qJknNdVQGuDzXUOlbVVrEQoIvSl56ElgXTnr0hCcnN1TUVWzvJMeQuMREW1kNLR9rSxNwa/Gxgg/wdUCjjLWnVajw0sG/0DKI2ElEfc914uBzsyHbOqydb+PyLVsz0dhukPerluy3jn4e67AcxINh5D5YIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=SBE/+U6p; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="SBE/+U6p"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6e429a885f6so2428186d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 11:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1738783117; x=1739387917; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E8qwzDwdGFn2CeBU5qdUptdR+RuNYBJ5DWAN8nwQPu8=;
        b=SBE/+U6pNqiac9f2AE+Mi+L/wB0n9/czpmR4d2yToZX5dDz6kVykMDfofxgKwFg1BH
         L3R61OCJo3JCECKarg02v85VhM3jsj5aQysaK3vkQl/An2GOyZMsnJKnXyG3bdC/x1Mr
         xI7VL7EbZy4ECa4sw1alBxw1vOnCMBkaoNOPZTzmYXRRDuGcT0vgVPrm1gnobXF9My/1
         qL4gf/GX8MsJmtVPb8YeVJzgA1sa/qaSnZ2bnUl20qN7BYErG0vPkhw9adhlldd+RJOm
         c/Gr/lmJ4UixOsDbeZBTJRXIlUD//xUlbq6alXtE8ZxuuDkHvAb0XKjY/jlGxeS8Ixss
         Iq0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738783117; x=1739387917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E8qwzDwdGFn2CeBU5qdUptdR+RuNYBJ5DWAN8nwQPu8=;
        b=MB4FGqGNfS5zfrAAdDC1bFHrvHtsIJC9uE0mtt6RJ5Fm7Qa1M1/wJSyRdfPuKOUIps
         MFTMshB70wOiEc9jxKO0Qfx3QS94MHO0qW29naz03dVEM+EJyNj+DeCJTiEWcGNlp5Kn
         9+n6NlXlfftgtsSjEx4mkQoRMqlX7FCKVQtNjqmH5qcxELwX/vQ7pOphgFueoCae17Hu
         hLIhzbprOf255p5kWGOCOpqf8s1E/6WifIdGrxX1iFfazLGC4o7BYqam8KGW8OLfjk03
         kFAEnIADbBxjRvvEd+YLk28ZXriFLGYe2dIcEzRoqyd6ro70/9yniwVKByY9awkU2FUF
         EyWw==
X-Forwarded-Encrypted: i=1; AJvYcCUIIFFmBWXNp0MVJlugx8ZqB/PBML3dTYUZ0f2CocjdWJXPyPLqtQmhXlxhGefo60sgGnpY1MkChBr8OnY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9GyF3uHQNpucXeruryQlAqhjd8C7f1MHsjxalyxoe35PP4hr7
	/qFLSQAv7ivHG0AMrhPDyk9oQown5zi91VpUqwVoApY50RKpdAxUzdWTqmc7GYY=
X-Gm-Gg: ASbGncuOUU8pA9ZRaobH6PncExAkBsEvEx65HrWIP3ApafrvCrsH60k4gUSOu8XDLoK
	rvl/efAwsV+Jikc68ZKP/dqgt0yDivF7ZhBq5qyhyTXmlZvQJmQ5kr0+/aCV1eKDAneq+3vXXXD
	HFsEKmdGtHfDkwQ7UOGtnAa5kj8nTfWEAZZ2HogtAbx3dfePcKvJ/dCsi2NBx8+nwujbKlkwOJH
	SHnifG45mIDXl2TNQOrt2b+KQ72TBzowRLLqCfqPVRvGaNg2LRb1IG7MajqPnSnL8vVbHIOe/Ea
	RGxHbzYE7SwQy/V/tYM9ZW7ofpdOBDtOqNLHW0Bt+C4i6AYWftOwJmEbK6XBzrQeCluJSgP8HA=
	=
X-Google-Smtp-Source: AGHT+IFBZGVDEyC791dt6sAmkuAb3iqn/vqzDlTFUXbWrByVqgD+IDHPq9lEi6GiDD3ACBsbSTEaKw==
X-Received: by 2002:a05:6214:e4e:b0:6d8:821d:736e with SMTP id 6a1803df08f44-6e42fc4fc9cmr64862866d6.36.1738783117509;
        Wed, 05 Feb 2025 11:18:37 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e2548141aasm77300476d6.28.2025.02.05.11.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 11:18:37 -0800 (PST)
Date: Wed, 5 Feb 2025 14:18:35 -0500
From: Gregory Price <gourry@gourry.net>
To: Smita Koralahalli <Smita.KoralahalliChannabasappa@amd.com>
Cc: linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-cxl@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	Terry Bowman <terry.bowman@amd.com>
Subject: Re: [PATCH v6 3/6] efi/cper, cxl: Remove cper_cxl.h
Message-ID: <Z6O5i1ic8lCgKN9z@gourry-fedora-PF4VCD3F>
References: <20250123084421.127697-1-Smita.KoralahalliChannabasappa@amd.com>
 <20250123084421.127697-4-Smita.KoralahalliChannabasappa@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250123084421.127697-4-Smita.KoralahalliChannabasappa@amd.com>

On Thu, Jan 23, 2025 at 08:44:18AM +0000, Smita Koralahalli wrote:
> Move the declaration of cxl_cper_print_prot_err() to include/linux/cper.h
> to avoid maintaining a separate header file just for this function
> declaration. Remove drivers/firmware/efi/cper_cxl.h as its contents have
> been reorganized.
> 
> No functional changes.
> 
> Signed-off-by: Smita Koralahalli <Smita.KoralahalliChannabasappa@amd.com>
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Dave Jiang <dave.jiang@intel.com>

Reviewed-by: Gregory Price <gourry@gourry.net>
