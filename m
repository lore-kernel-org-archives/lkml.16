Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB6C1EEA40
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 16:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750265793; cv=none; b=RL0R1rWeQBHO1uU5cCoHH2umr3JyEc6fOAFjvGCYF2p/sGtaVL5hFdB0oFzRfmYla7JaGkBZj/f0wJkdA1voVeFx1xfMsn9cu5EC2cAnMpdg7eiJxjtkjhlg4sbi9yiYD94zOQ+s0SysbK6A0odn+VxcuCgv2sAitIBu3LyHGTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750265793; c=relaxed/simple;
	bh=edKXmParjhRu0BhM9r3sRCPgV6sjq8X4X6plBTPVfNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qJJnEbHlRGRHrrBsSst7/+k9oqG64bd6Mrv9rrr7l2+1p2vEe2bRTnz8CaTruF+4XceW8TRsuJYT1EFggosQ4EOPciOcxN8IpGs1oWdk++KZeUnjrKgMbLpx788U71vctFvYQcw2iidqO8nNWilCUV1l5weNPNZtFc1ZNh7fTYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xch4s/Ju; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xch4s/Ju"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-311a6236effso5611635a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 09:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750265792; x=1750870592; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MLNHDlj/zAzYGC80eowNg066XecWuUgwFQMmbVio33Q=;
        b=Xch4s/JufZ9iFOiO+9YKUYq+1EthPTGLvE86YKTwY9I7s42WMHiB1K3vBjr5+RwZMY
         Fje3qjqMcihZ+QlclQJURQSzxJjB9PMeYVlcQQ/ioEdOajJskqoTWn4HmlP30E57DpR1
         sANw5cT0SBFrIUz56QbTGOapckZUo5fd8X0s+2u0nGFP4ONjxeQAwhx+4lTT/aGCOjns
         GLGrdb52afks1mzvGUgHIZQiZIPP94uTHvNbBNtkmTiKRj1RoWWspIl42c4V5K+753t9
         vsqApAL5M4FvzXPlJ/nH8eGNi4vqNjS4NmvFg33r6JobLxyRmY031jYB76Zvxj5jvxRr
         yPzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750265792; x=1750870592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MLNHDlj/zAzYGC80eowNg066XecWuUgwFQMmbVio33Q=;
        b=pFI+r4uxJrkyd7ZM9gNtiTxKHzJmZMyQQEJbhkBNfPAggZkl1rB6G1lLeIaVHfVdwE
         gL8A/c5RTzjIZzF0ZggnhCtOjUU+qu4ux4nPK/gNHZai7cVwsgZFCITE83InCbjisxan
         oaBRt00do+jM5vMBZNElWX1Pfwyfa8fX/GWttRkXX6UwNYPeoP4q4E16yhCrTd3drNZa
         74P5e9KpucTieDaDvrXKAzcXtOcRiPHydotk1kk+MsQ01bLAb/r4CHzBv0wQafrm7YFl
         bSnN2Uy29e/bd1i0q3gisGB5h15RSDtiQtlxQgEb09tAFkpOox9V5FoWAy1uuA52ROvQ
         PJdA==
X-Forwarded-Encrypted: i=1; AJvYcCX21bvApFXC3Y4MddtxWajicPgoRK5iUlUkk1e9edUaO5l1Zfn6a5x2SmB+s7tn3vah7HM7BwfHfFFqtRA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhyhRHrFvmqAOw8yAGsJhiC7BW3YdrB8hc9F8CIvj52c9WZm6E
	kto6d8d27YrLfLdr7kaOqtItbKa9YX10k8BdvWHAjZy3PYMUCHhklHe8+B8j+5nI
X-Gm-Gg: ASbGncufDjb43AUOweZfxWHykAL6YrcK4weqbO0Rg2KU87fErILjwekZRhv4ftOHruu
	FycvPgGutqQnPpQGlIaFbReS9hjIbTfRe+92jfj8/QRJukK2g5NeM2y++sBh3vbLByI5RCuJDS8
	qo0izx8xbJEJ6gdoItEp+VZy/jtnlgcGdcwYyzLk20d/NXDAUGpbipu6f6BdOFIUw7sxj+RAgvI
	c1AHJ1pKZIv110ssSDA0/BmbX0Hb7VyKsPSApPTxFsbpybd9Mzm9CB5Ck4SG9pwXCWSc8EFU3Ij
	F8mAhg/qsLiBHFXdrGnMkKffEvzCcIdSg+XoGc3fl4LYiNw/GhrKtqnObYFkbvGaoivGO2k51fG
	xSVrwhODmfxP4auzMfQ==
X-Google-Smtp-Source: AGHT+IGbG5+rTgIf20wLcHyLzd/2R2UT4T7M+n2ZkFgbdZx4r8t5wgYFo1GhEYLYd0AZgdFs9EwxoQ==
X-Received: by 2002:a17:90b:3dd0:b0:311:ff02:3fcb with SMTP id 98e67ed59e1d1-313f1dee9c6mr27723365a91.28.1750265791565;
        Wed, 18 Jun 2025 09:56:31 -0700 (PDT)
Received: from fedora (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a23d5e3sm182153a91.16.2025.06.18.09.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 09:56:30 -0700 (PDT)
Date: Wed, 18 Jun 2025 09:56:28 -0700
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 0/4] Convert motorola to use ptdescs
Message-ID: <aFLvvBuz8gpdJdEE@fedora>
References: <20250611001255.527952-1-vishal.moola@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611001255.527952-1-vishal.moola@gmail.com>

On Tue, Jun 10, 2025 at 05:12:51PM -0700, Vishal Moola (Oracle) wrote:
> m68k's Motorola still uses struct page (it's pointer tables) to track
> page tables. This patchset converts it to use ptdescs, to help prepare
> for allocating memory descriptors independently of struct page.
> 
> It also includes some minor cleanups to make the code more readable. 
> 
> ----
> 
> Based on mm-new. This has only been compile tested, but there are
> no expected runtime changes.

Just a friendly ping requesting someone takes a look at this series..
It should be simple, just make sure I didn't miss anything :)
