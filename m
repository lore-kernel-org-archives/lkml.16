Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2424D5103F
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 00:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744418649; cv=none; b=ORByAyQAJLYshRd3GY4CPWBs7I4xXtsCy1i6Zog7Jn55HgTFTCqRKxmEZE3TUZ7mluNiIm0u/W8pinOlexV8DtOJscBB/GIcgWDNMCP09uz/AiGA5T3d38vr2riTogMZDeTOxrV6SLFV6xWWV3rIte5++vTA7UufjfwmbO6QNFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744418649; c=relaxed/simple;
	bh=AsQTfIAqCCtsNfV8wUHTPMqEUj/kreoDSDWwnN+iuJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VKmQ2q1PlSv76ZdUcgcD6w1zDAwS9e3Qu6tAdFVLQ4P1X6tlsl9Etdq2sRhTs1b/6gRTvPSu15yiAxYd24FYRu03X/mWaR/3OqAeP/fCFE1p8AFtHkfeE1gDd8ixXQX7fuGo/CZUcL5NlBTttMw+BHOfIdMBjuQd4vxIoCh87kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=B6QQxSDY; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="B6QQxSDY"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-47690a4ec97so24676061cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 17:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1744418647; x=1745023447; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i7x4PJRTgrhycfo/8/g/qX4itzULAojrATFMqPaOifE=;
        b=B6QQxSDYaCORhBx5IFNUNAlzolBz+wUv33oqkuesYIdYSyIonBMYyV6S2/LmRjWPxa
         AlgMWYySxujd2mJSEGrKWJxhNIbSgJLxYDaK4rYr4JRXXXkcVXyyLQKnrhYly3AaPUQO
         DrBv3GYx0Bya+8kQ3czkL3kaqo7H7l+fUmhgaC9FcQbsvhame9Pj/VE7URjPiob22acF
         QKCWGWRpRNlXUtcvWzLSAjd8hshTNM/Vb1OKiI6pLs01KIvM3nYugqY5QxTACN2Gi544
         BPTxI00WOjw5qd6Hsp5+mIjehZRkCf4HUO4sgS6Mz+ph5789ObBF1szlJFc+slB5oBXf
         keOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744418647; x=1745023447;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i7x4PJRTgrhycfo/8/g/qX4itzULAojrATFMqPaOifE=;
        b=Mz1hJ6ReBHNNtXWticPT/rTO6QIK072kVXTw7zIBAu0wwCtowSEDGTIabaP6hKL7ew
         SO7t5rBstLHdbXZPGxg2buMePQ7g7YKzKeFY9kxgG3GGz1A2oCywiH0phKwF8OqtTjUy
         DOByY9Bj7FCODufrT4C2eSkWHtPq82ukj8OM77j/A4rEUbBLZwYUR/b6uiCog3xTtblU
         eRebU4D6UmZGBiTd5rWUXLrsdHgW+1NMu4fX+Ae+PGqx7iiFrmruyjsrItK7+PqByjAW
         4CncMWFUcYYBKwGEbGoL4eISTMA5s9P4DXoItE2TTJZmKOlxGEF0sT36LZWbTFYPbltt
         7Jfw==
X-Forwarded-Encrypted: i=1; AJvYcCVGfa5qv3jUv6Ykf7zuP7KvKdvN9kbM5EcFjFQQyWaHuN5C8zl6+fOTa87zw4jOe286x+b9GVQolZx3eko=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi9zeF09AQ4lrLpGMb91/fVMbclIBGbwU7IFDRNv0KdzJbOaBb
	sZ9y4PlZPaz9pUxgz1f4lH+ipF77IPw8xWYkR7S6Bvq05ud7Iw2tbRw74IJ7FMY=
X-Gm-Gg: ASbGncsVPOs+7mi0FfHv37UnqPdIevsbjZvyho3M1CCavYdERDw+zqcjK125f4K/KEn
	EDa7PbU+JYisRzDhcWDHwjeCVD0MhjuayyTYFEgVXPWtkqGtKfSr1A4HZP96GFm8y7hN5Aq7f0e
	3QM37mskSDY+SgGHj5qESVPUdRfsCIifnx9XJ9abUGTzBR104tuSAzNBDVDdKOYSVt4/Cqg2lt5
	U29L8X/dJlp1tzKkjFP53FwcqrU8A1x17CQKah5jkVSoJ+HkSwArtJw+0dQj8HpQ3e6H0Sicygk
	9QHvQyM8C2JECp4rHizraj0PN/iNa1GcvI03p0V7GcB+/YRvxwPW67C1r82wwaB6v43O2hVHIso
	3dpYZc6gWwoU9sy+lgRRcdIM=
X-Google-Smtp-Source: AGHT+IGZ+HsJjXTfcfVil7aIEcHChlVs3KaHbif0HrBfavH0A7MXCaU7PrLVQn+CXw2aOQJYs2FHxg==
X-Received: by 2002:a05:6214:2488:b0:6e8:fac2:2e95 with SMTP id 6a1803df08f44-6f230d91baemr71436696d6.11.1744418646809;
        Fri, 11 Apr 2025 17:44:06 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f0dea2179esm44146526d6.124.2025.04.11.17.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 17:44:06 -0700 (PDT)
Date: Fri, 11 Apr 2025 20:44:04 -0400
From: Gregory Price <gourry@gourry.net>
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-mm@kvack.org, cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com,
	akpm@linux-foundation.org, mingo@redhat.com, peterz@infradead.org,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	hannes@cmpxchg.org, mhocko@kernel.org, roman.gushchin@linux.dev,
	shakeel.butt@linux.dev, donettom@linux.ibm.com,
	Huang Ying <ying.huang@linux.alibaba.com>,
	Keith Busch <kbusch@meta.com>, Feng Tang <feng.tang@intel.com>,
	Neha Gholkar <nehagholkar@meta.com>
Subject: Re: [RFC PATCH v4 0/6] Promotion of Unmapped Page Cache Folios.
Message-ID: <Z_m3VKO2EPd09j4T@gourry-fedora-PF4VCD3F>
References: <20250411221111.493193-1-gourry@gourry.net>
 <Z_mqfpfs--Ak8giA@casper.infradead.org>
 <Z_mvUzIWvCOLoTmX@gourry-fedora-PF4VCD3F>
 <Z_m1bNEuhcVkwEE2@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_m1bNEuhcVkwEE2@casper.infradead.org>

On Sat, Apr 12, 2025 at 01:35:56AM +0100, Matthew Wilcox wrote:
> On Fri, Apr 11, 2025 at 08:09:55PM -0400, Gregory Price wrote:
> > On Sat, Apr 12, 2025 at 12:49:18AM +0100, Matthew Wilcox wrote:
> > > On Fri, Apr 11, 2025 at 06:11:05PM -0400, Gregory Price wrote:
> > > > Unmapped page cache pages can be demoted to low-tier memory, but
> > > 
> > > No.  Page cache should never be demoted to low-tier memory.
> > > NACK this patchset.
> > 
> > This wasn't a statement of approval page cache being on lower tiers,
> > it's a statement of fact.  Enabling demotion causes this issue.
> 
> Then that's the bug that needs to be fixed.  Not adding 200+ lines
> of code to recover from a situation that should never happen.

Well, I have a use case that make valuable use of putting the page cache
on a farther node rather than pushing it out to disk.  But this
discussion aside, I think we could simply make this a separate mode of
demotion_enabled

/* Only demote anonymous memory */
echo 2 > /sys/kernel/mm/numa/demotion_enabled

Assuming we can recognize anon from just struct folio

~Gregory
