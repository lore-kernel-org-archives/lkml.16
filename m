Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7A2248891
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 13:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750686817; cv=none; b=OrbcfRMaBouWhlfMWKDam6rnv0ViKQjayJdWen/iD6ZnbqlUVndw8tnhfDjqu1p4iRhMMEYW3+jvUyTI8xBKOEXpLb7K/P7MUzfQ7B8/6zQ8vg2LyThav5sRSzuQLNnQ/dv+6Nn9Gy2KsvTqFv7sQooJ4Kbj3UK8NrPjWimcKTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750686817; c=relaxed/simple;
	bh=WyXD0HlTkzAg3Wih1I1aD6LSwUij8meoNj0lDz3XnGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nMX+pAQ1TaOqnVSUo67VFy+ukWcwtIcG1/zEniVE+gOBcislscWh3ccCe/dsoqqD4FS0owCm4md3whbVE9PMcHHrLt+WW/x0yKycjyVupYWLa3INRSOgRfxpWjlHYOMCpHt9CYyZ+8+aONG8tAw0omtWfJQkFZ7sV9ybFi5KVNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZJzZFsZx; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZJzZFsZx"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-40a7322f081so819218b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 06:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750686815; x=1751291615; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3K6FPu8xv2O6mOsMnZyCHRYplU2tK2S/oPBdlJF7GUw=;
        b=ZJzZFsZxPzdk41g3VPBWOQU0P40jn9nA6aQh4DWxJepFk8A6+j94sW/JLaCJrFtkWc
         5FznnLawqR/NawFf3qArnlV6PD8d5Vybr7sInaDodfLsB8HgZcG/dl+3hplTTa2shQGH
         Uvyss4acOAaB66nukQNgE1+EWgUY7rW1wOFOlyJ9Eb3uqLEKGIUauj+n/3b42TRxAj12
         5/6c1OTbpeiS2BIni39+wxb24dLsC1DWzMw28a7MlyVEnbvx0PvelgkOP/aYCwuGvnVd
         AUwWbJidC7eV6nV/7FpfqAtt0gy4oQ3FhSAROHQfR25msKjSqr9BGdl0k8Ko0msogPlx
         EAaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750686815; x=1751291615;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3K6FPu8xv2O6mOsMnZyCHRYplU2tK2S/oPBdlJF7GUw=;
        b=QPt2eYcOip1fsTIRS/GbJwVey8GcitpdVPkWNfETMc+CFEs/SkDCqJ0Gule1rT7xW7
         rPe8lcIARe24P5qWaxbh6KWsiDMA0LKlMfpaMVl195TdoJrgd3kX42X0eCH8u+yypjYE
         LskdtLARjoJOYxUXV14L8nV/HgBGxlprU0ey1R7eqDEYYS5ZBh2bdKYuT0oYj6Rjy/Vc
         CS06pI+19x2HJuhY98iJAryTDzRHgB+kWKl3j9tmOsdfYLQXRAkOklcgg45ht3Afj3xX
         MzqA6Lgf67QrPdgCDrPGeMAeN0GMO34YIxz8PfW0RJvc+4yDiT/EPGitTTeKLLO6Ebfp
         cbqg==
X-Forwarded-Encrypted: i=1; AJvYcCUZ9O8Msm/8qi5irSszrjLO6HFr0b20RDaGoDYBNjAZFVXAM0O94eDb7FtjxrcCjI5ttJQ7xQgDf9mspbo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtZWvtWAVIipG80yyODq59B7DCHVwAhVIAZZGU6w+28kGyWMBl
	KENS6V/DmNGYou/fTG41sd+lfF7cy00zSLDG2ItvhQ2C7jNCezdk10a2RYeeUV82fBE=
X-Gm-Gg: ASbGncs2Fs1QBz6Wh5VLM2LbHm/d28TxSje1uk+tlaIKaTQPBTdqL0jqY9Aqn5qk3nN
	PlHN1USfoe3GGMqlKZAi3/8TyulU0n2YUb4NMjTTi/8+zkxfGMomGF5PUM9AycguFJTfz2f6qdv
	SG0pUCsZTDRQWT2Q4vREFh/1byZwzPghxeZlULgc/5P3TcT1P6E31oKJaUcIx9BLIllxqcutM7c
	2TYQuxb3VGnlnHSiDJxA9x4t1UHjYrxb7tb+iGVwLK8fl4SHnM+p9sTTZHWRxh368TLjALC1cA0
	k4SY0S+J38hUBOKfDIsoFt4sds8Lz9ueb1v/QjDpwtNcYGSrQYwQnyuD6elPRfbwu//6wAdvfrX
	/a5o=
X-Google-Smtp-Source: AGHT+IEqXwixIusFGOrWBDfBa1jltNWDM9f6X/YBAXgpQr8rertMKAekyzQDD4eMiV31CNpW761mAg==
X-Received: by 2002:a05:6808:14cf:b0:40a:52cf:8870 with SMTP id 5614622812f47-40ac7106496mr10493462b6e.26.1750686814982;
        Mon, 23 Jun 2025 06:53:34 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:608c:e09c:db47:348])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6115b6c80adsm981061eaf.12.2025.06.23.06.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 06:53:34 -0700 (PDT)
Date: Mon, 23 Jun 2025 16:53:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/vmalloc: leave lazy MMU mode on PTE mapping error
Message-ID: <9214718e-97d0-4e8f-b223-59351e664707@suswa.mountain>
References: <20250623075721.2817094-1-agordeev@linux.ibm.com>
 <107bfdb7-c8f5-45fa-872e-3e6928dc8025@arm.com>
 <aFlQv4dx7wFU5Cql@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <cb71d9f4-aaae-4240-88f5-50a745717f22@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb71d9f4-aaae-4240-88f5-50a745717f22@arm.com>

On Mon, Jun 23, 2025 at 02:31:48PM +0100, Ryan Roberts wrote:
> On 23/06/2025 14:03, Alexander Gordeev wrote:
> > On Mon, Jun 23, 2025 at 01:37:11PM +0100, Ryan Roberts wrote:
> >> On 23/06/2025 08:57, Alexander Gordeev wrote:
> >>> Function vmap_pages_pte_range() enters the lazy MMU mode,
> >>> but fails to leave it in case an error is encountered.
> >>>
> >>> Reported-by: kernel test robot <lkp@intel.com>
> >>> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> >>> Closes: https://lore.kernel.org/r/202506132017.T1l1l6ME-lkp@intel.com/
> >>> Fixes: 44562c71e2cf ("mm/vmalloc: Enter lazy mmu mode while manipulating vmalloc ptes")
> >>> Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
> >>
> >> Ouch, sorry about that! The patch looks good to me so:
> >>
> >> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
> >>
> >> I wonder an aditional Fixes: should be added for Commit 2ba3e6947aed
> >> ("mm/vmalloc: track which page-table levels were modified") though? That's the
> >> one that added the "*mask |= PGTBL_PTE_MODIFIED;" which would have also been
> >> skipped if an error occured before this patch.
> > 
> > Good catch! I think it certainly needs to be reported with Fixes
> > and I even doubt whether your commit should be mentioned at all?
> 
> Well I would certainly argue that my patch is broken as is. So happy to have 2
> Fixes: tags. But I'm not really sure what the rules are here...

I would only list the older commit 2ba3e6947aed ("mm/vmalloc: track
which page-table levels were modified").  The static checker warning
came later, but it's not really the important bit.  It's just one bug.

We'll have to hand edit the commit if we want to backport it so that's
a separate issue.

regards,
dan carpenter

