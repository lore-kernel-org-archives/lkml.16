Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B3529A9CE
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 16:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747929790; cv=none; b=ljBuSK5T0hF8LNcyKJlFWyT5OoLDQIV5u60bkvMlZQmKTQ006rdNxmpe8kldzL8NuhKNfaZ+m7XMZrdYNq661QuKbKR29dWD4T8UXnVzmd2LU/2BkrqMKTvsESFTiAOGgEwlP/98cKnTKEN2Rd60oOQp5EBIusrt2j8wWX0mq5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747929790; c=relaxed/simple;
	bh=02J+lUQM09QU/MiWrd5eMIiS/Xd+Qw6fLKpYjCz1j/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cUzYoU4ILoB7FqrCW8NnupDrqKkWuX8omp1Zv1SqY8RJ8PZ4uJbWbLZNk2JLAFUPjR1ASs/AkZtSZ0QLt14thBFzGNBriEtbdSfgeZNz5NL8MqE8gd8dRdg7yeQxdiePntpk+oLEJka/a/1ayZemKzfpME9qn6AOOKcnXjMObN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=iEEf4mFB; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="iEEf4mFB"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6f8ae08e3b3so78997126d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 09:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1747929787; x=1748534587; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JQE+uVMIFL5TeNeV/XRqB9jai38Oc42z6aj1CrqDpGM=;
        b=iEEf4mFBDAMyMxS+yy9U3WtlJBfC1IQwuRXGi45G1OkclXGvHVxlIdqNuF5xbiq3UR
         XbWya231GqVluybxCpJhO21L6Ro+tLXjMFcNL3WxmG1vXug4LS757+F+48EjZOeZcvLv
         zR/JZVLuGt5g8ouz316P+cwNWX+a5rIjOOJr/Yx45wFLEVkMcQW+vLjW82sxEvzuAXPG
         OcAi+NItCrxV/DHU0bXT7YitiknqfO6Jb3LHQwfhiy/JRj8AXfAGITnoMqB5zKLYxp2f
         nqgS7uqoA/QRuM0JqL7n+McsZycM2ocqX23H9ajo84d1/rK1jx++ZOCWFJtVnuY/ubog
         tyKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747929787; x=1748534587;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JQE+uVMIFL5TeNeV/XRqB9jai38Oc42z6aj1CrqDpGM=;
        b=lteSmBQcn3AWIe1oSNq0EXfvsM1vJ5wX7aMDkZIkxLWZ9/RDknsjwNngDdOhF1IBUl
         HbarbSYu6BDtkGk6mi1k1vjlWBZQ0V3Bf0oruslgIlGOVq+gkmIJnJRvuRxO9UzCOdh7
         2M+5dKXAgcmK/MKUP3I1K91hUnCuOrJVUgTXsamWfYg120tG2KR/yK2oyB4rcqdtIju+
         nDVMw1qVc3BzMBbo9V8hahkP+q6/iy9NPz6Hb6/JsPW0Gj64dEmWYcmMenIymbfADtA7
         ULcFc7MccCrnkYYbA/PmL6CbcD1tNRn0/Z21NiZ1RXtswdUXqGYPJxeD7btGxpL8dUnw
         SaFg==
X-Forwarded-Encrypted: i=1; AJvYcCW7c7gmf8aFAyGja+tdZhxdRvo5L4uQ65KCfl0wMPoJrnitlg1cASTyxexLDH/Zp9J+yjRlpwVBiazOemw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+nw2AwKanPgfZLerLvnpwab8DpgfAObVnfKJ842xUkTJCRjjH
	HDrbfQucUNYXZPPqYvFTA2KbPsBK5VpPFJU1wsOJsykqq9v0N8OEo0WzvAerS70RpLw=
X-Gm-Gg: ASbGncuge2ucv4MAJkf/I1wo2fZ1TB5gDWPzHjkxQ2bgHStyfwiyOC2FoIv8Xq/S1B/
	3tGslkLV8YVF2kw9DJe/a7sXx+C2pskGEUTIHvYjIrBLBKVD1xgcVlVcK0cThW0epWQ4lQIo7xv
	4a1GNWaMjgHuMDLD4y6sfcLCkx4LMUF5B6L++axpeNzqs0H4UDt/ZEB7AGIpw4sTegIJMsuRS6u
	vJ9URQO43D1Y3fJV2GCVllKj8WI5P81w0rZn7YZkwVtgfP9EQrTduoz/3rrktvc/Nh/BIh5Z4aD
	/80mAZbVBLJu2PoM+DZvLC7tXoaX+PeyGGU5y0YfSc4WpHQSjib59g53T2aPsjsOmo9zXPD/01W
	Cfd2+lBC/iEICugCb4p3hMnutArJ6Nec=
X-Google-Smtp-Source: AGHT+IE22jLhxmWPYsUhDc/GY+CVMA8Yeiz28+hiLcKrWjM53NIhpDTwjP5lQC4/yKV/TaOS4q+nUg==
X-Received: by 2002:a05:6214:27ef:b0:6f2:bcbf:1030 with SMTP id 6a1803df08f44-6f8b09542abmr350193746d6.43.1747929787501;
        Thu, 22 May 2025 09:03:07 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-42.washdc.ftas.verizon.net. [96.255.20.42])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b098750csm100679676d6.119.2025.05.22.09.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 09:03:06 -0700 (PDT)
Date: Thu, 22 May 2025 12:03:04 -0400
From: Gregory Price <gourry@gourry.net>
To: David Hildenbrand <david@redhat.com>
Cc: Bharata B Rao <bharata@amd.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, Jonathan.Cameron@huawei.com,
	dave.hansen@intel.com, hannes@cmpxchg.org,
	mgorman@techsingularity.net, mingo@redhat.com, peterz@infradead.org,
	raghavendra.kt@amd.com, riel@surriel.com, rientjes@google.com,
	sj@kernel.org, weixugc@google.com, willy@infradead.org,
	ying.huang@linux.alibaba.com, ziy@nvidia.com, dave@stgolabs.net,
	nifan.cxl@gmail.com, joshua.hahnjy@gmail.com,
	xuezhengchu@huawei.com, yiannis@zptcorp.com,
	akpm@linux-foundation.org
Subject: Re: [RFC PATCH v0 1/2] migrate: implement
 migrate_misplaced_folio_batch
Message-ID: <aC9KuC1UbJYd2Q3i@gourry-fedora-PF4VCD3F>
References: <20250521080238.209678-1-bharata@amd.com>
 <20250521080238.209678-2-bharata@amd.com>
 <15744682-72ea-472f-9af1-50c3494c0b78@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15744682-72ea-472f-9af1-50c3494c0b78@redhat.com>

On Thu, May 22, 2025 at 05:59:01PM +0200, David Hildenbrand wrote:
> > +int migrate_misplaced_folio_batch(struct list_head *folio_list, int node)
> 
> "migrate_misplaced_folios" ?
> 
> :)

something something brevity is the soul of wit 

I think i went with _batch to match surrounding code (been a while since
I wrote this), but I don't have strong feelings either way.

~Gregory
