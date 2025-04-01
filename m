Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92677207A1F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 15:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743521184; cv=none; b=bqH7cCl6OUs3CVv07ssNHn8NpEP32EBY+DOs5V99qntVrO/GHm97bt7+4b4ywqrA78Cb7ptNXGdiqZIlUMvphqfaNcXVPponxdFYE0vS+Y39jSgvwd4c/6ODMF+WSsB5BdaO+vHcZm1zyzQx5dqvRbTw6TJ6tSylE7CVp//d3e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743521184; c=relaxed/simple;
	bh=vFboLmEFuu02I4h6m3CmT8LvPhmuOPFsnUOV3jftNu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HxPpTMQQjkgV3bIquMb5H/+1XyNsFK3o0zyV+1PN8vo/oQ3LVSeTo4fdS2iUBKdE+gp5hk0zcPF5pgz1YwsoP57LjIKMDQi6/RkSpmpvNR2Hma1pli9RL9VwI1KCDQSjxJjAVAdR1lBhZ2gaX3lm0GmjX7fdH25pyQ7X4WH59Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=GWx/HR9o; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="GWx/HR9o"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-47664364628so60921031cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 08:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1743521181; x=1744125981; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xCIQqA4ZGzk9QkSYxmyLd6ZmAQH4PEoYwFtk60P0jAg=;
        b=GWx/HR9ojKMYBQWNss7Y4BIuDJ04xzYRPKXRa4jSyDtE1uY3x/x+snHSDUIDjrFyzy
         2+ogIvbhZu00dP6anm03R2LaCUb3ZJV3jPyIBv/PpGDcUtTaQSmmWjquV0P/fOXPtjec
         4ecdrLzeuzy7geHBfknjCbo6xPlY03I/diuN0lKp5fuHZRVXxdRuAYGK4ypF58hIpWGg
         7WaMMsJpDwAEP22iFkFuYqP9kbAereIdNbnwjPwzgZu9LDMB3p+S6oiPKumpqGtQecfV
         vrfpsd4xzRckmU4Y+qDbN314zCgT7x+o1SF9zZ5VFuNBETBWTBwllqGmjk3qED79pY0v
         b/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743521181; x=1744125981;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xCIQqA4ZGzk9QkSYxmyLd6ZmAQH4PEoYwFtk60P0jAg=;
        b=Yzi2MBtT4DeqLGByxktNT6nXEDIK50LrBxsGy/fpAPpv4wPTBW7hQEnBzj3xTfo51v
         fqMxngkAizxOjlmfmMOj5u7mjZZTJXLshd/8tZbvg51DkGw/0QdemhLM/SyWTlv+z/kh
         TUYszM/PA8Zqg1ra2nGSpwkWA9sjpR2VsqXRDulhAZl8dJC4DrJcRuiGjN2LZaxZUrtR
         KcSOcMkb8pkcCSGchJw9oXWKCtXH7pYSMkhO3zv0h97SHCG3y5FFFor7uoSYCr77m3ph
         hsraCYQMefCVtolvNFzJatmviEUQUp7cI0ZQfJRdyUgDvpS2c/gF+37z+pBvRmoWT6zn
         pEeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMuGToNNZb5TwcngQnmHK/3DPGD7VcoGEZEg9Jhch+xd5qhgjfcopkGB5fQ0kBG+MzxPo/Qb+xelrzjiA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi/86u2NBhwOaqw5IVOnZSFuLP9qXD8casm4CXDxlENMohXIU0
	Wq2fuDL0HGuFqmVO/tmYRLLeBNXe2BL5p5+3SgHFbzItAxqag17zEh/o2L3MPQw=
X-Gm-Gg: ASbGncvSux1g+UC2cBN4aVPdsnS8N4qMMdqBXPJ2Nf1sBpmlBfXxsRphGYKyHF5pCeM
	6yRzZbt1JuQUp27AfJELEXgi89J/dK8ciuKe+jK4qUeCSdSO931D4HpMC+mXNiNd2tvNotSoLrI
	s7wla9xKSDpVtyPeS0sHRNb0kSZm8C7cM2O4olLvV8J4u7HrzWiwPcMVJWRe0XCtzMEvcMsWogG
	vEx6rPCfi9xn1zEa6OEFiEyLpRQPoPsSl9hXULHH7PRfGsGvk43zxkm7fWw11UfvGDWlw2Egi+u
	oMzCVJWczw3i5xQvLQtrNTvCFdVcBIBRJ41hm55mUFpKFvNt+BCdMLYvcXDJ6irxnSHFyGkJNDs
	RVX3GqDL+CVtDbOGNwvk+rGNht+E=
X-Google-Smtp-Source: AGHT+IHzkThr7Aq5f4/8WZu6xqfIvqH1zUuQXxKYJ4v0IT0w+E6rcLFyC2loEB95SdAcliC5w56vtg==
X-Received: by 2002:ac8:57cd:0:b0:474:f1ef:3a54 with SMTP id d75a77b69052e-479039b2455mr4837241cf.9.1743521181535;
        Tue, 01 Apr 2025 08:26:21 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47782a7aad7sm66913571cf.35.2025.04.01.08.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 08:26:21 -0700 (PDT)
Date: Tue, 1 Apr 2025 11:26:19 -0400
From: Gregory Price <gourry@gourry.net>
To: David Hildenbrand <david@redhat.com>
Cc: dan.j.williams@intel.com, nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-team@meta.com,
	vishal.l.verma@intel.com, dave.jiang@intel.com,
	linux-cxl@vger.kernel.org
Subject: Re: [PATCH] DAX: warn when kmem regions are truncated for memory
 block alignment.
Message-ID: <Z-wFm_zwDZy6jvVz@gourry-fedora-PF4VCD3F>
References: <20250321180731.568460-1-gourry@gourry.net>
 <Z-remBNWEej6KX3-@gourry-fedora-PF4VCD3F>
 <3e3115c0-c3a2-4ec2-8aea-ee1b40057dd6@redhat.com>
 <Z-v7mMZcP1JPIuj4@gourry-fedora-PF4VCD3F>
 <4d051167-9419-43fe-ab80-701c3f46b19f@redhat.com>
 <Z-wDa2aLDKQeetuG@gourry-fedora-PF4VCD3F>
 <a65fd672-6864-433c-8c82-276cb34636f9@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a65fd672-6864-433c-8c82-276cb34636f9@redhat.com>

On Tue, Apr 01, 2025 at 05:19:28PM +0200, David Hildenbrand wrote:
> 
> Yes, it's valuable I think. But should it be a warning or rather an info?
> 

dev_warn, but yeah I think so?  A user expects to get their memory in
full, that means we're slightly misbehaving.  I'm fine with either.

~Gregory
