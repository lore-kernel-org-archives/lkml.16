Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4921C2BF3CC
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 16:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747153284; cv=none; b=uG6i3ZWCGtjKBzPdW1W4aA38JAwQgNjS3U9/oWAMF57k67QXS9D65L9pBQrdK80Okt+EGIbxiCEPiEKTBQLb9pcrF3z1EKq9cNJvqc25sau7VQfTDcqJ9JpON0rPpe7Zrxh2lsjg+lHHWZeW6xIVr/2BH566x1Lw48cSaU2jdcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747153284; c=relaxed/simple;
	bh=eCaXiga+j/8EMRUdXkh9uSao0LUjaRvza4W4oBkuDJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nfRA1RF6LY+O7hmgJzIjKYfP5sJ20WoAlh+i6wT3dHiz5Zpepa579XOlUf3EumOtU8zCJVE/bAEXz+8aSE68CvIDXAL8bM6Q/4o10VdcMGjM5ZgTBAfVxIcZmDcVSrsK1wSdL3ThQuuwExVeXiAbHg5YxQRemRKF13dpIu3dYVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=ky1B0IzY; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="ky1B0IzY"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7cadd46ea9aso906638485a.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 09:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1747153281; x=1747758081; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6H6slo2C8Gndm07hb+HXLDs7j8Gj6uFeqJ4EhQOg2UI=;
        b=ky1B0IzYdLQ3Jk2wG5CDK1AyujCgBP8oqLmAyFvSIgSSZKD4SQKeCwjmvzujWIaSts
         RIHmA0ZHCXkNGAJjgU7X1ndD0Fr4iQEh/WZzJ1kudQMnHitYjdYsLwiuNXkXpNCg2bNS
         HNCpB8t8I+3LdyHqyRIqNGA2kbgePBMmkYzhpZDuLUfEkVq7wcR/6Dl951UKo4RNR0EX
         XVkm4eY366asj2nZG1mOJmQwYVqFJ4DnGbFTydWwOG9qWnVAn+hH0TMqh1Yf5iyCCAdv
         /t+HVhXLvYGSj8mZM1X2p32NNG4QQ/teeXidrpoJ1Z+0yMB0szFAYdgn3YZPY0/Kj1UR
         gRHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747153281; x=1747758081;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6H6slo2C8Gndm07hb+HXLDs7j8Gj6uFeqJ4EhQOg2UI=;
        b=Oe7YlV8biwMu/jSl+pLd8/KZoNRQgjHe3eRwB5cG/jNDviFYAF4ltRBTQJ2a/3S+WT
         Ya1zBnlyn8awb38ONM08+DkYHUqgMeg1/oO2hNztKg8HX+4fyFWxXoVDgjSSKPaMyOAn
         YxdKMRcE+0OA0H6t0vGY8Igk5mgC7gmEL3nBAM9KnjXb1pW2h7LcqZVBbB8oxhwXpWbN
         cEr67/re5hpN7dKrvqhggykR4oylifXme91InKlxRQYd02qmk9ox7scNpGXWVHqyv9Ob
         OrKlErgbU53oEnNNSfLduMf9VPclPigvqWhFZFZ/tGS2hCr+hBNX4TVUXWpClBhi1PDB
         4u/w==
X-Forwarded-Encrypted: i=1; AJvYcCXNsw2aII4U4+MO63BumeFpDKmXUXfld8gvjRY19HFIEYmjKoerastvWK/tQapGh5DElkoQ59G2bhjT3Lc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv/XRPKSee/4oSnf9Ntm9mHZFtBDLDR/uvgqXbOlYYVWHSpOhX
	qDJWmUA7Es0KVHFONwdvfHBKhi2x2LfpkWLzrPIj26GamGml0BR+jWwmWpguB59J1TqcoViSIl9
	T
X-Gm-Gg: ASbGnct9m3HZ6EynAvzclwbRoSHC3gyGr+I5AuEBTlcSrMTINVTMRkN11jLTA4Dpu7x
	xYhJ5i453HU96YGJ6Mm7QIQO9j+a06VkH/BEKCnVr9x7b/oIrQN6n0VredP++N/Oqt4nRmbzHg8
	rW6GRin8m4b2LCHsfW04Rg2cT7jOXSoENs9j4dfOtRY71OD8+DrYbNNp8RUdKSAM166HBSEunhc
	W1/tAS6OvwUMgh4VR/4U+jQfwHDpgD4I+VDKHpbT971N7+x2RE8OIBbNrJm5Qnlv//qF7IhrqSl
	ty1LY7FUshN4dhQc74ESJNI3Dw56flNqaXgBjzYUJhtrM7GfUXCZ0/jlUT46EFDwuTbKMGeqkLW
	nIvfaucZFuVOGn/GIQla5HYUCQD25Vj4=
X-Google-Smtp-Source: AGHT+IFey9M1mMkoMIGDJ0aONMi/bFqSGIobVxsbW8zA1E3pZs3KzZ9PqK2LHNWvH6rS0foeITZR9g==
X-Received: by 2002:a05:620a:40c9:b0:7c9:55c5:76f4 with SMTP id af79cd13be357-7cd288169d2mr22425985a.13.1747153280773;
        Tue, 13 May 2025 09:21:20 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-42.washdc.ftas.verizon.net. [96.255.20.42])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd00f63830sm721592685a.26.2025.05.13.09.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 09:21:20 -0700 (PDT)
Date: Tue, 13 May 2025 12:21:18 -0400
From: Gregory Price <gourry@gourry.net>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] MAINTAINERS: add mm memory policy section
Message-ID: <aCNxfgSjeWUgpOus@gourry-fedora-PF4VCD3F>
References: <20250513160007.132378-1-lorenzo.stoakes@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513160007.132378-1-lorenzo.stoakes@oracle.com>

On Tue, May 13, 2025 at 05:00:07PM +0100, Lorenzo Stoakes wrote:
> As part of the ongoing efforts to sub-divide memory management
> maintainership and reviewership, establish a section for memory policy and
> migration and add appropriate maintainers and reviewers.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
> 
> REVIEWERS NOTES:
> 
> I took a look through git blame, past commits, etc. and came up with what
> seems to be a reasonable list of people here, if you don't feel you ought
> to be here, or if you feel anybody is missing (including yourself!) let me
> know :)
> 
> David has kindly already agreed to be co-maintainer for this section.
> 

Thanks for taking the initiative on this <3
You can feel free to add me as well since i added weighted interleave

R:	Gregory Price <gourry@gourry.net>

>  MAINTAINERS | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 80aa09f2e735..29d73593038c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15567,6 +15567,24 @@ W:	http://www.linux-mm.org
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
>  F:	mm/gup.c
> 
> +MEMORY MANAGEMENT - MEMORY POLICY AND MIGRATION
> +M:	Andrew Morton <akpm@linux-foundation.org>
> +M:	David Hildenbrand <david@redhat.com>
> +R:	Zi Yan <ziy@nvidia.com>
> +R:	Alistair Popple <apopple@nvidia.com>
> +R:	Matthew Brost <matthew.brost@intel.com>
> +R:	Joshua Hahn <joshua.hahnjy@gmail.com>
> +R:	Rakie Kim <rakie.kim@sk.com>
> +L:	linux-mm@kvack.org
> +S:	Maintained
> +W:	http://www.linux-mm.org
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> +F:	include/linux/mempolicy.h
> +F:	include/linux/migrate.h
> +F:	mm/mempolicy.c
> +F:	mm/migrate.c
> +F:	mm/migrate_device.c
> +
>  MEMORY MANAGEMENT - NUMA MEMBLOCKS AND NUMA EMULATION
>  M:	Andrew Morton <akpm@linux-foundation.org>
>  M:	Mike Rapoport <rppt@kernel.org>
> --
> 2.49.0
