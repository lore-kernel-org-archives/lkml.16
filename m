Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46CA2638AF
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 06:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744092426; cv=none; b=R6B4mFwbSjKw9UIqAh33tLa1eQ4DHYu+jn0OFIaYJG2Nm3mVZdJcv3NSLWZxIyS3+b3XN+LSo+wp5SacUe1lTMtMOr0EFEkZRgX/nsRebV/nGlBKG0YIMHU90kxDWFpcsD6sD5Th2PTRGAmnKAC7yRKiqXL0G9D56D/TlG7+C+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744092426; c=relaxed/simple;
	bh=0HGe9p+Kb3EY1mdIOfIYhz5qJ2LRhzKzm9odfdxCr2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lFngmsDvWFTUZZ2fkRj9WvWJuIP6PeqbACG7RCMsJySRut2Wt1Y6yTxjBJgRd4vWsCOMFXM2bYuGPp2QAlIvn0uAnvqjRnwQ4FlNLSG2hFp71L+pgUC9kcpn2kOpCxeOXBn0ETdOYW8kyaMX04Na0ztDTWexg6DmN4TNfNs3t4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kARhbRRa; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kARhbRRa"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-226185948ffso52143075ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 23:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744092424; x=1744697224; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HInC8FIYBgKJtb+4x4aKQs4vGqqbGkS3dp3Y+WU35lQ=;
        b=kARhbRRazLKhy7b6tvjOg4W//f/9khbfLdIXHnwBFKfaFA+TPrHSOMvq++XELoIgfT
         Di0Hd1705rHF+k3ZQm1By0G7mU3AvyE3ujoqBxBf2eCVxSH3q4nOVWLUhxS5WNhEWiP2
         aJ4C6ozVFzBRJ3XZ3lmIgFrkXHmFbxmTBMutcNGe6mTRX/ati061PZVjBJ5kDK5o2T2U
         ZoRcV/5xA45sl7zLRdDMIGTMnZ1QIkHmBX2CLcYgB9RIQ37iH8KTTKmE+YNOt4GIQ6yd
         rmD0v2g0w2E5lJwCPrJp9WeMJb4pEzOJBa2erj2cI4KE6bxoUekYYf9/SKRBFCcGdSak
         ugAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744092424; x=1744697224;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HInC8FIYBgKJtb+4x4aKQs4vGqqbGkS3dp3Y+WU35lQ=;
        b=UgjwkYPz3Jk1ldjXtiF0ZKwGrgDUbhczRIxlfFaCc45n+crTfIceyBMx6uPIJPAYrl
         IWuZj8mhx/iMqTG7j7pl+DB/uO+2Jd9lMPi4A5rE37T40oEHMQw581G0Us1Cln+kBoIr
         v6esJEpLR81jmz/00Y02H20DV8ecAIUsJRojH4GkokdAWMRf+DQpIYJXKVsamblsLFdg
         dXRfpePdLBUjsCe4ffIjAPDh9AhAJEsQdlPGnEYg2ZnVybUpVWRGBDT7Tt0b2RX2pN9r
         ILeVmWOAPaPJ3SBjoqVtND0G/muZpijrEYnyvGK3uvDRAsjgqp81914om6YDXZ+uPK7T
         +2Lw==
X-Forwarded-Encrypted: i=1; AJvYcCW0fyOLwEtFR/qV/FZjuWDMmYPMLaZVc17AbvpoywyTLTGB6vmUD0FuS0kOPPXHzJGbOjgVjklpy9wkpn0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwV3WURmPsm2Ps/zHuaEOF4zMA6RBXirPHit8HO59/u6zRcZAXL
	OeTYrdLhIbmPVdbK0H6Gp7BYeItPMhLHP/oEadLEmbr36xNjvw4lSwXI7iWLRuo=
X-Gm-Gg: ASbGncuLgwGvIM28D2Qtwv68zELRP+8fWqNreZnvoWSwzTZb7INIb5n5twemhxB8Lq7
	06yRWZgXpTljKYkuNxKnyn9jQtH/BRzPhmyAgURi3ky79ZmUjIyoqR7WgE6Y8XhTrznWg0UEhiy
	TlpXak3Coo/p1+rFNarDd5stM4ghQjeDPO5bdY6W2rxZSEKZ4ZlNYvt83cXpDaztauqjRXLXxHD
	ecZ3Vnj6YWPX3DQhmLqtRwPGvWbsGiHwMxUA1DInxsdgPr9OMu/m5U3X5XFvKoJ+edCDxy2tbxi
	eOWuR8h/V5qSxy3HbDj7wGYrHIWmuI8sepdxgBQGb8JxTA==
X-Google-Smtp-Source: AGHT+IG7e2ArizWP4MnnXCzEngPDf9Y1vLQ4VTedx+YDDLVARLF74VDfkQ2yz9thb5Z0JKu5GA+XJA==
X-Received: by 2002:a17:902:f546:b0:210:fce4:11ec with SMTP id d9443c01a7336-22a95516714mr124727405ad.1.1744092424080;
        Mon, 07 Apr 2025 23:07:04 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866e3ecsm92141755ad.198.2025.04.07.23.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 23:07:03 -0700 (PDT)
Date: Tue, 8 Apr 2025 11:37:01 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: Do not enable by default during compile testing
Message-ID: <20250408060701.raoidknorhun5nn3@vireshk-i7>
References: <20250404124006.362723-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404124006.362723-1-krzysztof.kozlowski@linaro.org>

On 04-04-25, 14:40, Krzysztof Kozlowski wrote:
> Enabling the compile test should not cause automatic enabling of all
> drivers.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/cpufreq/Kconfig.arm | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)

Applied. Thanks.

-- 
viresh
