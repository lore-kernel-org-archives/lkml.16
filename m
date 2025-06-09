Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA5D1A5BA8
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 15:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749481387; cv=none; b=c2l3oUjahV5lhE8PBRVyCIPyX7W37zpa0yXUOsrbEh3/YOIkVZxB0CotySsziYAbXkio+yyW7HqNu21PTyAFLYjAa9uDXitddLss7dBJPipt2W8nFazj9jcBRa5iiB/3GvrMiBMZq/KnrFLouiD3tDf5R4Q268Cc3ll7+iQpnJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749481387; c=relaxed/simple;
	bh=RXAVys5zSBY8z2t6y8XO5fPsTD7X2RM71zurpDCnhqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rg3E6aMz6tEq0lTySLHHcap5xgNSjV+r2WesojzF5ZrqcuYvVQtUMNLBe5dFHK1FXRsqEQys5BeFRF2k8j77VH720r1AtvhedFft8tGP08tOvJ08ZgSyn6/BLbtTPMlUlx0GI+oSuCzZmmTpfew2S1iG8uS56iyKFIdgBgRxqaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cISdoLgm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cISdoLgm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749481384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JNcpH+bcZai1yfLZlLefAAm7I6glTiPKEZc98aEB9ag=;
	b=cISdoLgm0LnyIYyvNABpesbp2rMXdNdGKjZC3yA2VIce1fpqOfTpZuvdgvY7e/2YDO1Is0
	+pfu7nIcSTSzI6XlFXwJfqP25DyEGhbKz+hu4d+zaznOnFjNSpPtaJhb4Tyl95XU0Gu4HU
	KrJb6dLnKWt1ixyKKqGQgDzzsrNIDR4=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-wXElXXVvPBu0BwYoHA3YPw-1; Mon, 09 Jun 2025 11:03:04 -0400
X-MC-Unique: wXElXXVvPBu0BwYoHA3YPw-1
X-Mimecast-MFC-AGG-ID: wXElXXVvPBu0BwYoHA3YPw_1749481383
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fad8b4c92cso118588496d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 08:03:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749481383; x=1750086183;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JNcpH+bcZai1yfLZlLefAAm7I6glTiPKEZc98aEB9ag=;
        b=A1KMacYERxCaV+wVl+QOtLrajxk4Y2ZnqspHxCm/brxmcBTJPG+yeu/YjtXAAoK6tw
         3vjmExQM16Aebs4ON6KyrNEkH5jIEnv0b9tSTEaOH01oMnDcB4gynoyYY6cRUjHwcgtj
         zRdgF8HIglAtdgaApnEyGEZQyExHqqSfYBcAooEgMqaaJZx0mKWtjE+soyOjLmNSe5YD
         zgLjfPWJdWTVi+XkGIsKV4Nb55cvEODAMkjjz8H5Wlnbfq+7ApGIlG9fv3idyuSZ9PS3
         bHC6JrG5G+0DqieppHqit7yto6hB34VK1MhFcnJAN5gk0yiJvYbP8T/CCa6URaNVbdwK
         zE0Q==
X-Forwarded-Encrypted: i=1; AJvYcCV7T5hqDBdQbsqxVfGmuwPeSrTbGs0vHh5jr569ydVv7t4T7oqTsgCxSWttiMGVV+XwjoMfsgmZlrfG8N0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7n5/t3EjCfE1zsyk32bUxGFGVG0AR36/F2DcFiwJXKeQ9tZ2G
	WiC01eTYMbboDNHVzrWpHpiTCxyocLCd9q0rFmTv+YLo3ZIhwjQSXloZc8SSJ3eQpJHhOhiiRR2
	dRsv3Myh0cIdkzhTlyueR7pJXJRMO4SuFp0vOBX5QM5cPkEsZPYJzu3lO1rVb3ePkLQ==
X-Gm-Gg: ASbGncv7/qyk+sj95YNu8LRh6qPRin0EpQiFEwaqyxd+lgt0J2xI1ypzlWRnPCYmyuW
	wfEOoa+5tQdoGnk/IaGrNlKLoiD0h+t8NAAg4ld8EaN6wjw8u5bWW5Xg4UZ+6H/Bf0ix+zRnhq4
	/ynNVYdQSL+AsIWQzUufy4BPMPe75+PbC46EWjJ2GU+NxCQjOhUP+hkIMSC0XsgxZ6Up6W0UKTx
	0rWzP287nJEXcFT7PyZmD+uOTZvAGcszTjzHDN7B/tHgL62QANydYj1Y78bRqneTDVU6WmiSEAg
	soKVdIeqBJHNKg==
X-Received: by 2002:a05:6214:c68:b0:6fa:ca81:4121 with SMTP id 6a1803df08f44-6fb0905b95fmr182520736d6.44.1749481382018;
        Mon, 09 Jun 2025 08:03:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG31IbS/tH29+tac1BfQOs8d7QAQpKa2+wtvwN79ZFd1EW+t9uEZUIMv1somHhXHI9x3fa1xA==
X-Received: by 2002:a05:6214:c68:b0:6fa:ca81:4121 with SMTP id 6a1803df08f44-6fb0905b95fmr182520316d6.44.1749481381607;
        Mon, 09 Jun 2025 08:03:01 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb09b29fbdsm52483506d6.89.2025.06.09.08.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 08:03:01 -0700 (PDT)
Date: Mon, 9 Jun 2025 11:02:57 -0400
From: Peter Xu <peterx@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Tal Zussman <tz2294@columbia.edu>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	David Hildenbrand <david@redhat.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Andrea Arcangeli <aarcange@redhat.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] userfaultfd: correctly prevent registering
 VM_DROPPABLE regions
Message-ID: <aEb3od8YQTvDQu4q@x1.local>
References: <20250607-uffd-fixes-v2-0-339dafe9a2fe@columbia.edu>
 <20250607-uffd-fixes-v2-1-339dafe9a2fe@columbia.edu>
 <20250607150438.4439e19f74693445212d93df@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250607150438.4439e19f74693445212d93df@linux-foundation.org>

On Sat, Jun 07, 2025 at 03:04:38PM -0700, Andrew Morton wrote:
> On Sat, 07 Jun 2025 02:40:00 -0400 Tal Zussman <tz2294@columbia.edu> wrote:
> 
> > vma_can_userfault() masks off non-userfaultfd VM flags from vm_flags.
> > The vm_flags & VM_DROPPABLE test will then always be false, incorrectly
> > allowing VM_DROPPABLE regions to be registered with userfaultfd.
> > 
> > Additionally, vm_flags is not guaranteed to correspond to the actual
> > VMA's flags. Fix this test by checking the VMA's flags directly.
> 
> Wondering if we should backport this.  afaict we don't know the
> userspace impact of this because nobody has tried it!

Yes that's fair question.  Per my limited understanding of MAP_DROPPABLE
(even if as a generic flag), I'd be surprised if someone tries to enable
userfaultfd on it, being succeeded or not.. or requiring that to properly
fail on any stable branches.  AFAIU that's the only possible effect we can
expect from a backport.

IMHO for this case we can avoid backporting until anyone requested with an
explicit use case.

Thanks,

-- 
Peter Xu

