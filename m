Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B116F2820C2
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 15:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747843130; cv=none; b=TbXxZsJ3OVhHe6/uxPlSWxWlkMwN+MGTYrAMUOouo3rQ3M3GAic7uED8zYJA2wmaAA5+fphCXK5TWzYTRhUrOS1dHNwkW4cJ6DrRtiUVc3ehXP1m96eXoSe6IcxMtC7b6Niw7fHBP8wDahI4viMFZQJcBYPspZa/fp9aDhwYX34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747843130; c=relaxed/simple;
	bh=DLhxBNPNm1O99GYuXfyBvGjuuh3iQnjSxQqNjAQTIYo=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=u0jDTGz8yRtC6A+c4s+ZK8ftKAOukJdNDHatvOj6f0PdxPFCQkNYPkgtIH3ur/h8sVVi3Od/CfIFBUPc6+chHO4KNFC0Ka4eUf8m4KGGW8GDq/iw6Iq3GLhxffmDUqL6xxDgPVCnIbF4fKw9UjwtIw+D8jEq/NvO4BAhs7VTVqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ud+XYJY8; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ud+XYJY8"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-742c9907967so3743044b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 08:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747843127; x=1748447927; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TdRwavDDdPRD4ph6NOjp9qIhMy3uXqZoBDVVcoXM+3M=;
        b=ud+XYJY86Dp4L48L6X+niTNsb1TyQ4za3OUREctVDDsTYVaKQ+9OJWlCWHFQeaL+8F
         4wnF90Svi8w8C26Rt7WJ69pWGenLtTAYanXMEZRdrgc57DrHUwN/0kcjUNks9kmDhIt4
         bIDeIVB1Snx4PiP+VtYgctejlRMzzLsY8fTnL9Jc/tGtKpOWB9iFmWDDM1Z65WfLjuK+
         8D/1rSelkjAWCyIFyoUfLZLvtHfetL/UArfY4yLy2Pyr1AeiZVkpIezQnXKsvYurKUgS
         WnlsNouo2n6GcpHiRUPPOYmUA2+k99f1QZWJT38GI1AcgPHyBiHL1zFKhGdqi6OCg25l
         QZeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747843127; x=1748447927;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TdRwavDDdPRD4ph6NOjp9qIhMy3uXqZoBDVVcoXM+3M=;
        b=byBHeykgr/mK1DcMYhIgOQwQoBggC0zGmk5rECqIOfZipDjRVUy+ohVRAkPWMAIubt
         32pH21pubLjz4ATcxhsqHbwa3TmzYjeKxQOkKNO1g6GYrVVj0SE4CTh0uO/S/WfP60qz
         zP9bemChOoekQsBUykXpVeClSsv+7h4aCrA7v+SHKaSYrUI9AaitjTU0VMfktmwEeLJr
         o4t4DVgweRY8BmHRJfyuNPcjBDRT8yHL//7vsIDnvpytdroxXib9O8VRwzaJb3PV7910
         5vIuDqgvVeOh/1fUW6IPx/iYOVYypBAuKP+OtKktYwtu8qtiQknq+AvWVYeyV8/9+C3T
         kvfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjARR8koU8ZCGSokjKhtnvA5UrKqpMkffCzfmKvt9yDI7Ox8bM2E2DRuwLK0thoQfWWXN9he1qikISUeY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwU17hr1S4mP4+jAfy2VbDwrw1FE9k03jBYOM3JCMMt0XbzJoWr
	PvOWDYIwYXBSLBdNTJJIRdmtfL9IYvA3zYg3t1eByFLGaQsl3ZrBOq+kBI4ySj44fA==
X-Gm-Gg: ASbGncuzLWmWkbyIBjL5Gx7Gud2i0mA99Nc74cif0fooKjfDIYhYhV/ndROIBzhFLIW
	7OtQbQD4D41/C+NHzW4xyrYSLAqVFf9dNs5bwCT0QcGIEuM981yfTOsk33SsIKaczn0uzNcWPdZ
	R4oz+80FGHmvamvc/2amVyn1j4TV8TfftznYkthgCy7VCojlOSzGdPtgiQD0VoEtaRQuGtY3u8e
	jD9Eewp9TwPHxZe6WvV/aPe/HyaoSRqEAxqZTRmQVevbvz9j1qrK52Youw13sbv+vE1k6Z/H9WC
	TMqYVDivMV99NIhEeqSe5qfAg8aJPTKHoKCHFHMLY6ap/HSyFu7SlJ7n1ckd6EJb5tdKgvMGvXR
	aSEpV5Mf28TH5DlrF4lXLCZLqkXTN+Ana6fXngpTlnhfzmg==
X-Google-Smtp-Source: AGHT+IGlxIpd2UQXUEXUyT3jJiXyp4cutpSYwnXXezPFwPzdD171HXRG1N0KN3L9uymbdbj+o9Hifg==
X-Received: by 2002:a05:6a00:2790:b0:740:5927:bb8b with SMTP id d2e1a72fcca58-742a961837amr25764753b3a.0.1747843127416;
        Wed, 21 May 2025 08:58:47 -0700 (PDT)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a982b884sm10149934b3a.95.2025.05.21.08.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 08:58:46 -0700 (PDT)
Date: Wed, 21 May 2025 08:58:32 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: Oscar Salvador <osalvador@suse.de>
cc: Hugh Dickins <hughd@google.com>, Gavin Guo <gavinguo@igalia.com>, 
    linux-mm@kvack.org, linux-kernel@vger.kernel.org, muchun.song@linux.dev, 
    akpm@linux-foundation.org, kernel-dev@igalia.com, stable@vger.kernel.org, 
    Florent Revest <revest@google.com>, Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v2] mm/hugetlb: fix a deadlock with pagecache_folio and
 hugetlb_fault_mutex_table
In-Reply-To: <aC33A65HFJOSO1_R@localhost.localdomain>
Message-ID: <54bd3d6c-d763-ae09-6ee2-7ef192a97ca9@google.com>
References: <20250521115727.2202284-1-gavinguo@igalia.com> <30681817-6820-6b43-1f39-065c5f1b3596@google.com> <aC33A65HFJOSO1_R@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 21 May 2025, Oscar Salvador wrote:
> On Wed, May 21, 2025 at 08:10:46AM -0700, Hugh Dickins wrote:
> > Unless you have a very strong argument why this folio is invisible to
> > the rest of the world, including speculative accessors like compaction
> > (and the name "pagecache_folio" suggests very much the reverse): the
> > pattern of unlocking a lock when you see it locked is like (or worse
> > than) having no locking at all - it is potentially unlocking someone
> > else's lock.
> 
> hugetlb_fault() locks 'pagecache_folio' and unlocks it after returning
> from hugetlb_wp().
> This patch introduces the possibility that hugetlb_wp() can also unlock it for
> the reasons explained.
> So, when hugetlb_wp() returns back to hugetlb_fault(), we
> 
> 1) either still hold the lock (because hugetlb_fault() took it)
> 2) or we do not anymore because hugetlb_wp() unlocked it for us.
> 
> So it is not that we are unlocking anything blindly, because if the lock
> is still 'taken' (folio_test_locked() returned true) it is because we,
> hugetlb_fault() took it and we are still holding it.

If we unlocked it, anyone else could have taken it immediately after.

Hugh
