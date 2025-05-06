Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687711A3141
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 23:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746572796; cv=none; b=dQrrKqUcF+pF2RmaOuzR+SHAwG8zqTUzXAnhGdBbtpZ7icbHIjR9YpMie8+TlD1V8eUqz2do2cgNvl6h2S0Dw47pKKFwdG6KVlX83n+iDjMTjAtOBhbMfMCbKYZaQzeDP5m4fHWjq4UZ22tZ3AzrWJyD9EgxYVjKh/KJ4KbZNyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746572796; c=relaxed/simple;
	bh=AkWTf635RjG0EvzFpzLnPFZugQ89hkoZEH4JSEwN0ns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZPYEqHsIsLyBp9cURQN/diK3juHBqG2f5j6q8Ssqcjm8sX8TLuzTW759akCmB0MJz9FQiJCpfCulf6yw2Uubk4JiGdh+B44iblP/orC5XKCDSNHR6XjNUQBrFX44tQrlY+C4gg26/yuFCZq7vP9KzhOTI1sCcVTLAU7p0pjHpyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=ltMMkir9; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="ltMMkir9"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6e8fb83e137so60074466d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 16:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1746572792; x=1747177592; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jMzOedZBUFQh6ZOzmCW4ghlDT1S6oF17/0z00FndM84=;
        b=ltMMkir91qDPV3NyGesMnX9DIlK4Nynun0G4iANXsHtee4tkC/GqUKj7ii1kFcqBf4
         IlpHUUvbnljkBM6RtO5JSIJXix8BaAS0gzHqpUsznN/YIZiLV4Jl5+hsnR3c4AUzflN+
         U/cuF9omvO1GJAWmN6jQ9/0bd8MbiMobNkb8r+zKG2HHn77vtzq7zjMgIDKkxERE5NK8
         fmkCi83BEolUSpV89YO4DLTUGt5+VxGxhUaUP2XCrQq+XVyfqBFN6+9ZlG3hw2c0WjEG
         62FBVZ2hxPXlw6w9SU0dEk5sq3CeoSw9s3m/QGprf856/RiOm6q6B4ezIztJvbivwvWt
         0/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746572792; x=1747177592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jMzOedZBUFQh6ZOzmCW4ghlDT1S6oF17/0z00FndM84=;
        b=qFWIiyTL0SNeBXldJ4tDBDqyy/mWeF7eY4ggjV3IgAcDBCCBSfRib4x+7cnS2J76Cm
         iRHojPDRkbQuP+RKuhB3ssNDyTZ8O6eiH17AaFK0iHvN+hnvlPZPJxgllUaK0marq7vH
         hmzYzYaxRnCgEvddF7nYPBaHk/7F/E5e4yZ9CTonrEsh4hfweuWbdP2tqlIKr2p5kv7j
         WHpJW3H1UtAja3gT6QGuRSSqjBD9rL2bfFhwLlJyoQYbxbGbRaOBCufVlcRBX0LwktHo
         swjap8kESuJLx4dMfJKDZsCQcnNI5c7nhWMWaN/HT57xd/oYoOdGV4tcE3xH+3+Oj0QH
         063w==
X-Forwarded-Encrypted: i=1; AJvYcCVxN+UoCA9FU+l0nclZOsBnMd4tbYNBdCS3ppyoYGQvUyAukvZ4tcK3nMIDy2MjGlAhuKsIVYfa0u5d/xE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu7d6e9ubUAccHH0ktoWsfX+K0oKdQqnggM6ulSjXmw1VEhAk3
	JDT0KatDVfzHZDXxig1gzQC8Mwu0OMUDEzfBbh969JgtJtF6dQmZs8IS8J4nycE=
X-Gm-Gg: ASbGnctfi6wyrUacNRl+d5xXhxLeQsqq9QYvicfeADwHLYUVAq6pBOmocBUiUL2i4sx
	bDzrSZmBg8ImpD25Aa/P8x2IZoZizLs/6Z40YwpQnk4XvYr9BkLlGf7PrT+U6duqqhhnweuqw7B
	5E3lhBn4qDsa1cBkcDQc0NUfT+BAF12C4jegtJwd4JEoQFbbeG++DWrp+FvuIkAxbBezCp2KLXo
	PiyLRX8FvRIL9STWkxUfBr4+09/HHQ+pATNuUleZf4b4UGlXPHv0loJG3tf6bDMVx//XwXzhiid
	mUYeCwfu5ppmW/NFqjSnUnTqAksKNe8owSSk4hiD/E7xtoI5rNi5ROT7vS+Ak3af9322boDPAwP
	7MTjOvmsYDokEzZm+sjAW
X-Google-Smtp-Source: AGHT+IFHH0FvrhCCJDSr9P751dSZJYI7LDjUr7c/DSSKJlfVzJvDae2X802XdK+1BLRbg8tORhZb0Q==
X-Received: by 2002:a05:6214:dcd:b0:6f4:c824:9d3d with SMTP id 6a1803df08f44-6f542aad789mr18656576d6.37.1746572792237;
        Tue, 06 May 2025 16:06:32 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-42.washdc.ftas.verizon.net. [96.255.20.42])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f5427d40b9sm3559536d6.118.2025.05.06.16.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 16:06:31 -0700 (PDT)
Date: Tue, 6 May 2025 19:06:29 -0400
From: Gregory Price <gourry@gourry.net>
To: Terry Bowman <terry.bowman@amd.com>
Cc: linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, nifan.cxl@gmail.com, dave@stgolabs.net,
	jonathan.cameron@huawei.com, dave.jiang@intel.com,
	alison.schofield@intel.com, vishal.l.verma@intel.com,
	dan.j.williams@intel.com, bhelgaas@google.com, mahesh@linux.ibm.com,
	ira.weiny@intel.com, oohall@gmail.com, Benjamin.Cheatham@amd.com,
	rrichter@amd.com, nathan.fontenot@amd.com,
	Smita.KoralahalliChannabasappa@amd.com, lukas@wunner.de,
	ming.li@zohomail.com, PradeepVineshReddy.Kodamati@amd.com
Subject: Re: [PATCH v8 00/16] Enable CXL PCIe port protocol error handling
 and logging
Message-ID: <aBqV9UCF6dQFtcyP@gourry-fedora-PF4VCD3F>
References: <20250327014717.2988633-1-terry.bowman@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327014717.2988633-1-terry.bowman@amd.com>

On Wed, Mar 26, 2025 at 08:47:01PM -0500, Terry Bowman wrote:
> This patchset updates CXL Protocol Error handling for CXL Ports and CXL
> Endpoints (EP). The reach of this patchset grew from CXL Ports to include
> EPs as well because updating the handling for all devices is preferable
> over supporting multiple handling paths.
> 
> This patchset is a continuation of v7 and can be found here:
> https://lore.kernel.org/linux-cxl/20250211192444.2292833-1-terry.bowman@amd.com/
> 

I've been testing this for stability on a fair number of boxes for some
time - backported to v6.13. Haven't seen any major issues related to
this set in that time. Outside my normal wheelhouse, but for the sake
of runtime stability:

Tested-by: Gregory Price <gourry@gourry.net>

Trying to get more explicit testing feedback from RAS folks.

(note: there appears to be some conflicting changes in v6.15-rc4+ that
a bit outside my current timeline to forward port and test.)

~Gregory
