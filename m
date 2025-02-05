Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A50F13D52B
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 13:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738762906; cv=none; b=D+61G0FEbA4R33As6cLrzBA9VZgugl+ZGkOUG2F7iSgwd2i78Pdsv/TjMrBe923GFtowZznNWwzkM2tcxq1htIZGQxnQu1/Qtga/qoW/O50xWpO5m+1qbcvYRmXJE6Ah3F5YyraABO1hvxm/JpDCpt4R4wOdLCImUqsHPi2N0yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738762906; c=relaxed/simple;
	bh=Lr+5KZ13veBJ07It3Yd9s4/CTrSJcCuhjjvOpdqKT/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IDtlhjzf43JDpt4BCBeMV4tpJe7hT881llzSPxqPyxqTRT0aCex5jLOcHb+Kbp3IxpM8VgcyxzDXQPDIZsS/F459wEetD4O+igmXnkBJx4VM/Peog6JWOlsQSIiEMHthuusFQM2v8KLPemueMO3pzcqKCesmJaK7Lyz/H31zJeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZulW8iyY; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZulW8iyY"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38da586ef14so1299271f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 05:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738762903; x=1739367703; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xFPvMTIko7RUlkglGsjRjisDlAMQ0L0NE9oHfkSjMWM=;
        b=ZulW8iyYkn3cdUHfUL9JPLqKSIp28Anj5FXLxeFGsWqrGWUVLgQuCkkCvJz7CCEzN5
         2sZLQuOLPG6YsxBwLyddu0FDyAjOX57CeDZNSk98rESyo0KaHma8Yu7QIFuSFuoelgi7
         ZUn30AFEJ99rxoYxkT57/+j4E3M6iF+UQ92NzKICgXmBWvBZYWRH2Qn9tzGaIdkTKTVQ
         teWWUrklIyWy1Sf25lINk8e8lE3V35LDwp4qPCR5w+pvkiYS7K7teHzMODbSWTD0NMMy
         Bz2kUaPW4P4GeCyLeNAneb9wBVo8Rz2Lflytr2wo0CAu4m2BQIX/JBFDM1Pa6tndHFTM
         zrpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738762903; x=1739367703;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xFPvMTIko7RUlkglGsjRjisDlAMQ0L0NE9oHfkSjMWM=;
        b=RB5DgbJNITYHsJTpD677Qb7uAEDGfhZt0Fg1we46TyMElByYuet1bxlbd1qqKExOb/
         sOd/COG2+siLWI/QMxT72r93jgreIkHyHlv+o+GX8WWhCTU7hlEDL0NpcxbF5/z7bUko
         o/NZi4TBnlaLoJ2mGEbPY+1GtYc58RzTB8OIp5pUSq3H2yCOgbNXk6CaQAyzNeAk7rDB
         VIdwKEc+AlIPU7qQTcqh5FG+hrCs/oebmcelyaPhEblc3TcQfM4hgJvy7stohyWAiGr8
         x9cR6iyKGChkUVZO38yEa0zoWYNSs3KipeIiKQYpQ0q2G5kEVUYXlA7+MdzbktzAT+Zj
         hZCw==
X-Forwarded-Encrypted: i=1; AJvYcCVhNgC8OISoZ/zWT2o8GLoNwlHpbVs0jZ1AvaO4G4E7E7dmPiw13EaQk4Jw4TX6ij3+or6fr2DFCyhdANY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqLi/wDC54S48fDUh2si7JwvJd261+dSTy4Htv1KNMC1hQy0YK
	IcsKydjEb4fxGNX2gzSBf8bzeKLnVbHgcb9H68STva8sjBdfKUQzPSmS8Q==
X-Gm-Gg: ASbGncuMq7RC479jGACpytytUXd0NNOy4F52aLs9XrfbK7KMp+MV59xZP/wtUaTFYIq
	vm6/6GrJHkEANP1PI/cDpOUYsPi9EeMZISGHeSotcuqrXzd5frhw43l2e02tdJ0AgqnBVvQSv2l
	zf/GORDv2TUlPRMF54mCWq0FJ8HvhNC+JzVDFuLmniBS3RyoNAseoW3Np0rQoq11A/HwHDJMRLb
	nJR6l6iNeAJ+1M3xQlUkYTfEqp+l9394k04xSLEqIRo3jLU14Cijd9eO9Tdtyiv+72bHYN67Wyt
	a/4mzADvjcIi1dHq
X-Google-Smtp-Source: AGHT+IE41Ns76J3NfuF1YmTbO6rT4ejaawkIKve3VGyDmVrgZUVBLjFau3taVoNLAnv07S7U6/8rlg==
X-Received: by 2002:a5d:584c:0:b0:38d:a8f7:cb73 with SMTP id ffacd0b85a97d-38db48d5a24mr1971575f8f.40.1738762902640;
        Wed, 05 Feb 2025 05:41:42 -0800 (PST)
Received: from Red ([2a01:cb1d:894:1200:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38c5c1cf53asm18459418f8f.87.2025.02.05.05.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 05:41:42 -0800 (PST)
Date: Wed, 5 Feb 2025 14:41:40 +0100
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Vasant Hegde <vasant.hegde@amd.com>
Cc: joro@8bytes.org, suravee.suthikulpanit@amd.com, will@kernel.org,
	robin.murphy@arm.com, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: iommu: flood of ahci 0000:e6:00.0: AMD-Vi: Event logged
 [IO_PAGE_FAULT domain=0x0055 address=0xa14a4000 flags=0x0070]
Message-ID: <Z6NqlD2Je5xVtFui@Red>
References: <Z6CGzUSV7llweytQ@Red>
 <0e4c38a8-3f7c-4cbe-9dd0-9e73d4d947e0@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0e4c38a8-3f7c-4cbe-9dd0-9e73d4d947e0@amd.com>

Le Wed, Feb 05, 2025 at 05:33:50PM +0530, Vasant Hegde a écrit :
> Hi,
> 
> On 2/3/2025 2:35 PM, Corentin Labbe wrote:
> > Hello
> > 
> > I have a supermicro server which is flooded of kernel message:
> > ahci 0000:e6:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0055 address=0xa14a4000 flags=0x0070]
> 
> 0x70 means, Page was present, its write request, but device doesn't have
> required permission.
> 
> As Robin mentioned, it could be FW region. Can you please double check?
> 
> Also what is the failure scenario? You see as soon as you boot or after running
> some tests? Can you provide dmesg?
> 
> -Vasant
> 

Hello

How to double check firmware region ?

For other questions, I just sent an email to Robin with all answers.

Thanks
Regards
