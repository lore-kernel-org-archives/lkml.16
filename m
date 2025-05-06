Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDD3283FCC
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 15:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746545279; cv=none; b=DVKcTGLNnoYpGuQ3cvuZWgi36oe4nktPlrMU1v3p3KsjaOuik1IER5eZbQNw9AZm8OP8sTgVgKSAKfOF49K5eGvE70d9GhPyOJsNhb69dEO2cpb5toV6pKlMNhIATi2nk1c2zh7B2n8tJuVV8N4bIjPN7WhwgbbmaR3t2a6fYow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746545279; c=relaxed/simple;
	bh=q6yD1hgb9gL5tWjzslo1xUDCSEc3dComkIFW77xR5V4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IRxkHV/4HO4i0+AzQGO8QFJcuygRtNKEkPZ9Hw7quNK6rdTHs9KM6w8xa5t9osVAARRA9ZlFfa1KC0GbG6MRa+kIoJZ05Td9m1ayjOb4AjR/hpvaUo60jEH2oco+s2ZG+bzIS5+vJH2oUQ4Go22xTRnC72E1Flo0H887fNUiIPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=XLCJNHYA; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="XLCJNHYA"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6ecfc7ed0c1so53249096d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 08:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1746545277; x=1747150077; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UAmqzYzWZIcDvblA53R8o+pxqG6akPJefQO4BMgGGbg=;
        b=XLCJNHYAIBkm5AJuhjUlcGjnbGsxNBqm/43bo9v+VCiU/5BvOmT7Cqfx56J/BwnURO
         aLZczKJSo3SJy8o+sH/GaZztPV7714S9XO4s2MiI21PMn7G5HmTBQml1ptNNvAMM6Wu1
         64EB76UkDBParXRBK8qpEELdYIhUf4sqOLALyIH41fYaZBn5Q+HfZiPw2Er34tzqqgGg
         dqRxL6MRDiunpYwtl665Rkg/u+NddQiUa+r+uSSqIVb5hx7iUuxOPeCoQeg1IW0e0MDt
         zSobdqffhd4iGOVhNQHXBVOKoTnDokGFbNvNXXcOG/sp7IcapwY0s9Jab1K9iu0l6HCA
         Qyng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746545277; x=1747150077;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UAmqzYzWZIcDvblA53R8o+pxqG6akPJefQO4BMgGGbg=;
        b=B9vx8lYqTk6aC7Ga9XOwD7MfGCqwWf5qz8JiY3L/1SEhwWQScBb1Fu0R3DPO0x/YsD
         fdd5hR7gHR+0fMSp0XmXJbMUdLHHurHV5FtNXHD851r7rgsQuo7BrtTFMIBHtFhUdOW8
         fmCtEpM8rsmMGBdH/K63ig+0Lr1eFqkm5RLPZS7QBUEv+tcNrh2Yi1JuVqIHgARFpfii
         rJiE+tbsjHabCs0429RVAkalo9IRZrUEx+yqRLRc5txxE28HUgCvwbtuK3/R6OXDu29l
         cQFatGDUuvqekLjBo85Lv5hDHolq3M3S4z5xmL7c0Vo0+gNM9XhQNtBdAah9zodxFX6m
         45Uw==
X-Forwarded-Encrypted: i=1; AJvYcCWmH0xWSuzUDLl+8XKBRMaCFBPSfp35ZiR/GoOVu58xCOMX0KGt8oDCJuuYlhObotv2w+5cyFLzWM1+FbQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkY1AH2rw09e8oReic+Ts/KIHBtypq97YhNnwEb30BnTnB6BUf
	4/hZwxnr3wTQJHVOU8drJW7bgt4yzLiqbT5D5cYRO0yEowIqUFjR+rI2lkF5gm8=
X-Gm-Gg: ASbGnctZduGi803DFhav9j8lA7OZxBZFCxm7eH83VAavrltYpjKXzatKBxOIVYHsSu1
	LVMI0OWttKKUXGatPNAYC20DxIX1edTQBpW/+Vm/mbI9dyO6YhuFGi3UOEXAqr18gSuRsbu06mm
	nZ8Eyu3HcinBq09Jp49rQ98G8L8mPUNr7rfrOhJugnszQkYbtL8gIewrPTuilWXmtwCQEQ5WVs4
	bc/d2tJ1g6NICBXG5G8yFEfWlq1OfKGJAut6PXrUSl3Pjb0zgZM9NBcT7XY79TC9MTMmNTNZ3iL
	73bwSyH/C3KnD4AhNCrZlUQDUUI8vuN5p+tMIchxfHnsRTUrYfrj+lnRFhh1UY6zjy5YBVCDBXm
	9zgajpc311XhPY953fbU=
X-Google-Smtp-Source: AGHT+IGk8GO6QkuDXe8YPX7kWFBYemERDMNBd+Jcc85mtaA3x/CtnVOa2UU6sYAQeDk4KAunVgGCKQ==
X-Received: by 2002:a05:6214:d0d:b0:6f0:e302:7c1 with SMTP id 6a1803df08f44-6f5358873e7mr64121196d6.5.1746545276896;
        Tue, 06 May 2025 08:27:56 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f50f44f489sm71153706d6.90.2025.05.06.08.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 08:27:56 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uCKD5-000000008S4-3tnb;
	Tue, 06 May 2025 12:27:55 -0300
Date: Tue, 6 May 2025 12:27:55 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Vasant Hegde <vasant.hegde@amd.com>
Cc: Ankit Soni <Ankit.Soni@amd.com>, iommu@lists.linux.dev,
	suravee.suthikulpanit@amd.com, joro@8bytes.org, will@kernel.org,
	robin.murphy@arm.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] iommu/amd: Add efr[HATS] max v1 page table level
Message-ID: <20250506152755.GK2260621@ziepe.ca>
References: <cover.1745389415.git.Ankit.Soni@amd.com>
 <e11bcff900090636a547f03c77baeb35b43234f7.1745389415.git.Ankit.Soni@amd.com>
 <252eb71c-9913-4199-8645-59d8a7513b10@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <252eb71c-9913-4199-8645-59d8a7513b10@amd.com>

On Wed, Apr 30, 2025 at 05:27:10PM +0530, Vasant Hegde wrote:
> > +	efr_hats = FIELD_GET(FEATURE_HATS, amd_iommu_efr);
> > +	if (efr_hats != 0x3) {
> > +		/*
> > +		 * efr[HATS] bits specify the maximum host translation level
> > +		 * supported, with LEVEL 4 being initial max level.
> > +		 */
> > +		amd_iommu_hpt_level = efr_hats + PAGE_MODE_4_LEVEL;
> > +	} else {
> > +		pr_warn_once("Disable host address translation due to invalid max level (%#x).\n",
> 
> s/invalid max level/invalid translation level/

This should have a FW_BUG annotation too?

Jason
