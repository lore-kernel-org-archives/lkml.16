Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BE02F4334
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 17:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749749210; cv=none; b=FVXNTDraoGKmclavW/qTzGJJwSCYPsBAn+9fivj+KPsRiJI1PVpTazKPmWTvh4Th6XSgrKRWd9rQVXVpwj/160Y9Wjcq5DFndJ5I++0ldLexQG/RyBk+LTbgpOzBvHbzdy7zZLKTgElndZttTbO43wq2v1qoppUka7vDxcXKff0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749749210; c=relaxed/simple;
	bh=dz2SWO/qjquiwy0PGFDKRs579mkESAbU2M9tXv9NTak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P7iopIO3B+BEkP8LeMOub0zHhCMYMIv612SHAQQP4kzT1iIgi0VMmn8zGCP/J41vqzBl5ivgF+llNR4NAeC57iF16YG4VERjBLnt1OSB412/5TH3RLSGcpSkYs0ZjOzEXaZEaocOiYLnS5+hbbK1KNMqmwfmalz+VQFPd8jPvmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=dEtOwcIy; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="dEtOwcIy"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7d20f79a00dso159903485a.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 10:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1749749207; x=1750354007; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GuFH7G0Hkg76CbNkjUTmYOvrBIu7sqIQnC0f9hQ2KpM=;
        b=dEtOwcIyO7ULimBGYuxjCGgcAOWTRKEdJZZSwy25JWjwZAuss7vsNK7JHseaPxcofz
         gQF5E8Jmv21ZDy0mMi+H15eb5Riqu2vGYGa6zbNeOZzWngrafD3KQ3uF3r9QivaoopHK
         y+Uv8I8LWWeg9LJzynBGBWXzrtRUNwjoHGVd6SMOs98n7+p+6AqBwvEpWVPxUWaUpWoW
         2q37He5pxJHCFB/TDTYL66Z6jaASlxVxgFdQJ4oPFCPgCAV6p5E+m0SZlKRwwsBoIvVI
         yd7nc/VqeyekGPrtkehCnCSMvMPxVKfYtHkkimBDAOppfAaygcloa0FRgQssmUtKmvqO
         U5dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749749207; x=1750354007;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GuFH7G0Hkg76CbNkjUTmYOvrBIu7sqIQnC0f9hQ2KpM=;
        b=RwaOvVRaZ1thYwxOpMYT+Gr4PSpjoVglDgfrkiNOsQ27nropi4oO6d29iATEQrrFL7
         RlTBEADg13F1/CyK43MLR8hT1aDtNlQVg0cwNTN97lrUBjsRTd30VwWyPQxqjJApRd2D
         7oKmIhZRDwnZJF/GwfFnz7JOf4a8/wp0AuSU2BrZaBQU4mOGdx9PxmCHpfUVogj0hcux
         MlkkdX/MgL7K+gR5xiiT6uHbqpMz18iM0A6HnJFgoauhSGrAjtc2JpskgSsv3EOcwr2E
         2dVhY2BK22r6Dno+nXz9uklt/Z1+Oms0ob3jKGh+lsxbd9oNpptKwPVcb5PW2F6g6Ido
         RJ4Q==
X-Forwarded-Encrypted: i=1; AJvYcCV60Yt3dmcYmXPr6usSFxF7r3Mekhk9QQg3/lIDWfvuNtdvNK3XyjXXEebK/AQIf6h83UcunDa9iHY+BOk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYIgNHq60lEgAiBarc6V9Ajl6LchVM1nDZenuHcND/AJpgq7nC
	BhP+uBZxpejOvAm4yzEmIYblCl1gAaygIjKCrGEQtFcPl/qMNKLl6zM7qj3orN7Nv7M=
X-Gm-Gg: ASbGncv4QsV4gjlQ3L1gJNfs8uBdw7lWnKpsE4ZvKoRk+0/szI97YB2sJA+uhKFciGe
	YyT3loQ7D7fgq/NSd9SF3rwtx7PnMAFeFZksovyIepwWu0d+40kVhaSmQUbysDFUb0EpqOx8HG8
	0qMRnS5j9XFcqNfJ1SdmWuLLubiGO7+USuhUW47wB5HsFgtoOo2VTTGOzqpbyqOajiJADNZiOkC
	jDaafptkJpQCIFNrs96vTm/ijKv+4Poy6cH7GwosfO/+bEadokqZQsblA6bJ7i9ER7nCEa20k75
	S1pJeOxZT2SUHVjmRDepEWcVFLMokrTc4zukV/yLE0JvMvXtRiSl1Ca4x00R4WHMTyhqba54KCK
	CxRRslLKj/1FS12D8cxiWC9eTuEFDZSvFfLG/ZA==
X-Google-Smtp-Source: AGHT+IHVaXV9q1/g3bfVZTOIUWaYAAdnUAw+rE/fgRBDKnHHDj1/DxZByJn2xG4v2ktw08xsfrlTOw==
X-Received: by 2002:a05:620a:24d6:b0:7ca:f40b:f44b with SMTP id af79cd13be357-7d3bc48bf32mr17454185a.50.1749749207028;
        Thu, 12 Jun 2025 10:26:47 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8eaca67sm63213985a.59.2025.06.12.10.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 10:26:46 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uPlhN-00000004kAV-2fRR;
	Thu, 12 Jun 2025 14:26:45 -0300
Date: Thu, 12 Jun 2025 14:26:45 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>
Subject: Re: [RFC PATCH] iommufd: Destroy vdevice on device unbind
Message-ID: <20250612172645.GA1011960@ziepe.ca>
References: <20250610065146.1321816-1-aneesh.kumar@kernel.org>
 <BN9PR11MB527606182417BB7A35349F598C74A@BN9PR11MB5276.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB527606182417BB7A35349F598C74A@BN9PR11MB5276.namprd11.prod.outlook.com>

On Thu, Jun 12, 2025 at 08:05:37AM +0000, Tian, Kevin wrote:
> The initial v5 patch [1] from Nicolin was similar to what this
> patch does. Jason explained [2] why it's unsafe to destroy "userspace
> created" objects behind the scene. And a general rule in iommufd is
> to not take long term references on kernel owned objects.
> 
> [1] https://lore.kernel.org/all/53025c827c44d68edb6469bfd940a8e8bc6147a5.1729897278.git.nicolinc@nvidia.com/
> [2] https://lore.kernel.org/all/20241029184801.GW6956@nvidia.com/

Yes, we have a problem here where we both can't let VFIO go away while
the vdevice is present nor can we let the vdevice be fully deleted.

At that point it wasn't such a big deal, but the new stuff seems to
make vdevice more complicated that it cannot out live the idevice.

Probably the answer is to tombstone the vdevice in the xarray so the
ID is still there and userspace can still destroy it while destroying
everything linked to it?

Jason
