Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48B31AF0C1
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 12:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743079162; cv=none; b=ByCmjtvBiZF5rFFILS7SCtW9/r4iyYnCfuXvdx6vckAI8nNP9mRdQm24mgNl+HboHkmUQM50wMO8WS1OziobIwtR175eko6r/NSTEpWwFVTbLhsnSulD7ThMPm0jVw0lS9VE3EH3yVNV9yoixndgWwPvNbOmSZxuHLcnnAMJ4iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743079162; c=relaxed/simple;
	bh=WWk2aAaq6zdeqJwi9KMh3mESgi1HjPX0MLnZB921QL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K1w0p6/i+6shDxq4GGupgekOsa97eB/kpvgdBWZAVEBBnqmtEqh7pQ2B7saKQ9ZH71CUiUqD+mWfVNRf00rfMMm2n4EMe52FhoZxWAFmZkK90CAL1FOuxj4jajOPLTN20574bGVnRkjzggvThCGhyfm7uof5jqjSZIQvltPfRVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=vEwkFh4g; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="vEwkFh4g"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6e8f254b875so7448226d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 05:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1743079159; x=1743683959; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FauV6XaAhhMNOVmnhLCm2YoazvoXLrFgf7nD2aWpfAM=;
        b=vEwkFh4gNvMsBY2/2YL6LH0OGyKgb0sB6tEXk8IxKmg4LW5cRRo67L6oSiAu/PMu6Z
         k3RuCs3VZNObpMGSnkYYc8GB2HhEpcWFeqbFM/8rWbJQiw9Air9RLIuBlFNHF7vO/UWD
         W64ec3X9PeoKZFcXMh+IOAKDba3b/VFuxo34u4++lTUSWfOqszve+d41VFQtx5C76CZ8
         4PgtH3amQ9NHSSs3WhyxPkAFRPvuhHvyyKttM1iltRLDaU3/hTsT6NL8gzMV1oGeumAQ
         oMQvx8IB5DQ1vkUNDf+zCTam89DDrBfWLzTzYPe+Cn6+13Y1QYu3EtpRBHGBEkf1Dh73
         TuHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743079159; x=1743683959;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FauV6XaAhhMNOVmnhLCm2YoazvoXLrFgf7nD2aWpfAM=;
        b=G95aQuW7w3Y2LIpiVvK0Y6jyOCGO6DB6VzX+rattr8lfBP1Uxsiffh1IyKsUr39UWb
         YMPk6VxnpGpmf0xcsVINwsKMj+J19Db3509BNdgyZry5AvASY8j6l5meu1mjtpnTwt/B
         ciALC6V8Y3HlnxM1B5/l+duZj7sFT0Cl5NEHKoY49w+ThDSL9oWovlo6+Jpvw4/dPkzG
         BIw7GKTQOJnlRiu3wldAULPLbggFHYyHQ58G7Zeypgc2VWLHvu/YglD+KgCkOwq9NWZR
         SGRTtv7JWFtI7oD11Yk79xj4Wet6P9ySsEB/9vCJIV3hCyaZ8IYSgLLghy8LEdFiwOvN
         0njg==
X-Forwarded-Encrypted: i=1; AJvYcCXZR8hXmF4NAmRkK39JFeXaxJRX3HLzMUMCWzVgD0zBrdZ+BxvUOQkpdCTkOOatsMcVk2mG0cVoWmYtADQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFbN40Q28FQ3k7WhHMwMFb3V6h1cfNlyJWFz5rKqIcJsNoGIGx
	DuuHzp6iO/U7COWawg3unCNHg8X1b6HBMGngUaPgB/+YUgnrd41ScaAzns/P/G4=
X-Gm-Gg: ASbGncsEnJnIKr7WwODNa+xhhBdkIG0av6j81+UFLY/opgHX6PNGaf06IDn5b50tEdA
	m1e4um7TXAWnF9H1asrjhxRRafV8P2PHP4DnFj5AXIbwx+HJVl1zENz9gjdWR8dXT+PBZT0CXJy
	32wE5t0EVqgF67yi+5DAnjYQiVXCJiR5GYIF7Xir91JC2vlEjTMFbMKXLJB6kY4XIj3mydXzKbn
	X7HiEo8eN2K53jui8tKeKSZlgMZ/mKJBK+sljhhXac9GPLn31rluW0U4oE38VF/U+YKpbUpiaGs
	dUEBTrfex1HOSjFmA/l8CGSf195G+lKHQaJdnW/rBhznWCVxpzZhMYs=
X-Google-Smtp-Source: AGHT+IEugMcsVBsNP6xK+ytuQacNPJrLg+xpOV2Yf8FWt8NTaiL4BjTxneHpSew8BFvHk8lHrqxIJA==
X-Received: by 2002:a05:6214:dab:b0:6ea:d361:a4ca with SMTP id 6a1803df08f44-6ed23933cacmr52304966d6.32.1743079159410;
        Thu, 27 Mar 2025 05:39:19 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([208.94.110.98])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eb3ef344fasm79611566d6.57.2025.03.27.05.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 05:39:19 -0700 (PDT)
Date: Thu, 27 Mar 2025 08:39:03 -0400
From: Gregory Price <gourry@gourry.net>
To: Oscar Salvador <osalvador@suse.de>
Cc: Joshua Hahn <joshua.hahnjy@gmail.com>,
	lsf-pc@lists.linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, ying.huang@linux.alibaba.com,
	hyeonggon.yoo@sk.com, honggyu.kim@sk.com, kernel-team@meta.com,
	yunjeong.mun@sk.com, rakie.kim@sk.com
Subject: Re: [LSF/MM/BPF TOPIC] Weighted interleave auto-tuning
Message-ID: <Z-VG5-U1XFprCjww@gourry-fedora-PF4VCD3F>
References: <20250109185048.28587-1-joshua.hahnjy@gmail.com>
 <Z-Uye2V-6Urz2IIA@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-Uye2V-6Urz2IIA@localhost.localdomain>

On Thu, Mar 27, 2025 at 12:11:55PM +0100, Oscar Salvador wrote:
> Hi Joshua,
> 
> as discussed in the LSFMM about how you can react to nodes becoming
> memory{aware,less}, you can register a hotplug memory notifier, as
> memory-tiering currently does.
> 
> The current use of the hotplug memory notifier by some consumers (e.g:
> memory-tiering, slub, etc) is a bit suboptimal, as they only care about
> nodes changing its memory state, yet they get notified for every
> {online,offline}_pages operation.
> 
> I came up with [1]
> 
> I did not publish it yet upstream because I wanted to discuss it a bit
> with David, but you can give it a try to see if it works for you.
> But till it is upstream, you will have to use the hotplug memory
> notifier.
> 
> [1] https://github.com/leberus/linux.git numa-node-notifier 
> 

+CC: Yunjeong Mun and Rakie Kim

Something to consider as a follow up to your series.

Thanks Oscar, we were just discussing this.  Seems there's multiple
users doing the same thing, so it seems reasonable to discuss.  This
would probably deal with my race condition concerns here as well:

https://lore.kernel.org/linux-mm/20250325102804.1020-1-rakie.kim@sk.com/

> -- 
> Oscar Salvador
> SUSE Labs
