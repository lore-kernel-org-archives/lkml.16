Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0721D2DE6EB
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 20:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751487874; cv=none; b=D3aU+5yI140aF7RD/STRtdNqFHt0lsq7xMoByhuQ7xFwbaSO64laEm/gw8uVdElfLyoNSQv+Sh8FLZPlYpILjx5opS8pqW3ny6LD/H2BB4OcCHNg41u4m44fXGF6J3/gVsKCUSAPRksl2KSbF77kRyR+fWNyS6FkyVHY9UgJ7u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751487874; c=relaxed/simple;
	bh=LADJRcHUvMlWd3z5DT8zkUwYlbg38bvUxz4P+c1d7L0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q/FiU/QTGoVRC45/PAXRyQDXUsPBiRkkyqqWk1qEv/cIO7zLK7Fv4VT0t0AUTAg4WQS5g8eNjFwv1DB5WRqCCVRJEC1cNI3OSfPQQ4FZ55h0NxHeugroWKrPj3+LOHpzc1G1Ra6my8x3xzLBO2JBj/DBFQ5290w8lhtCF5v6UkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SYYbkg4O; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SYYbkg4O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751487872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yHu+7nIFQdm9XuF+s5Bnm/R30cVPD1jHoZbC2RZEZrU=;
	b=SYYbkg4Ok/tfewmHexG9CIRL6UM9AWnsE0ejNXyPqmuWfkw+D0HdTUcu/lsOOLD438t0VQ
	ghOWqwUm6pYVamgOk7PtQt+zU8OqGpgpuagE5aY4herBGkLC/5Bb3RRV2isp3lnitsprla
	dD/V4GQgQiSSZhp6Hwe9jfYQOTqn91c=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-60-t8dD6E9dOPqZQwmZOmaJ0A-1; Wed, 02 Jul 2025 16:24:30 -0400
X-MC-Unique: t8dD6E9dOPqZQwmZOmaJ0A-1
X-Mimecast-MFC-AGG-ID: t8dD6E9dOPqZQwmZOmaJ0A_1751487870
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d413a10b4cso1239071585a.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 13:24:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751487870; x=1752092670;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yHu+7nIFQdm9XuF+s5Bnm/R30cVPD1jHoZbC2RZEZrU=;
        b=Zh//s7+M3DvHjSmiiLlFDGeHvRPP4d78ertU7FknhioF3nD34UuOtQ+u9slVxSBYpY
         +xDQa/AH9GAuIi4jtBNNlbxJhrcPkHesHNS0jS3JDhti9I83u+zqJ6ZvuC4epYw6z3R8
         x49gYGaV3Et3mF/ihr1osEKgYFN6y6FJ1ChDXJV6RFS1LMVae9HTRro6NDX071xf9Y7b
         gTDmcc/21qJI6S4YcucyzZN6cM260fI9OLD9tYuFTGO5kaOLZIvOBexp5x01sxS9gcQA
         OgeYyrJB757XySkPSH3dcl/QzFE4WXTSFSS/KXKB5cOFsBHvEeixLzNX7cIF05+dGLbF
         QUsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPTBRDiXdQ1w1X5eQR2Qi4eQUjb9IgsznDIsFGCOhTYXV+hiN8QYeBI0WITkjz+IurTCDS2c/jMLXmp74=@vger.kernel.org
X-Gm-Message-State: AOJu0YxO2d+Ye75GtKSVpGqsCbfOXMMmHAdN3s69rhPgqrwYPBWbRPy1
	sYoePA2ouIDSxQRjzTXJDU5EWoaXuCU0ZuelSGbcugefRPhWfIX7m6p11dbvzRYe+7USyw7cJgt
	Z4T/M0FdBS92ygvIebaLqQJMcF0Y/xTSJOgL0KXZR3uvdTtAtXj7XcylNoUXYSogaNw==
X-Gm-Gg: ASbGncvyElL+VbKuw7yKQyl/PuMcqx91XwA2XQp1vJUjydrmMfRVR5v01AeBVt9LQUj
	onsPYiOwj3f+ClgoMbIusN3//ljw5rzRJQeYRj/+bnsUG3P+hrYrjC4Lwfm5Rk8I0XR00OkESEB
	L637bBjF4tiSPPbzzymszuCNaaGUA28/Qiy6w6SzSuUG50JNP6TUshZ7BcANhs+aVbhSgkW8Ky7
	hfyqDmfeK3KsUq3LfyamCn03VVQFcg6KvGTiVFLetFux54y1zFopKjMuuVEOuRK/U1p2JBZa5b2
	W+zUJYSdgKXnLg==
X-Received: by 2002:a05:620a:4154:b0:7d4:5802:6b64 with SMTP id af79cd13be357-7d5d1ce5a28mr66901085a.38.1751487870242;
        Wed, 02 Jul 2025 13:24:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEv6fqEr2DinqBU8mO22SKdCshY0XNZLPu7hbq8oWJbGzE7VFqq4sp+SK6tOjcx/9A5aGEZ5A==
X-Received: by 2002:a05:620a:4154:b0:7d4:5802:6b64 with SMTP id af79cd13be357-7d5d1ce5a28mr66897285a.38.1751487869642;
        Wed, 02 Jul 2025 13:24:29 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d443150adesm994680585a.26.2025.07.02.13.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 13:24:29 -0700 (PDT)
Date: Wed, 2 Jul 2025 16:24:25 -0400
From: Peter Xu <peterx@redhat.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Suren Baghdasaryan <surenb@google.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>,
	Muchun Song <muchun.song@linux.dev>,
	Mike Rapoport <rppt@kernel.org>, Hugh Dickins <hughd@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	James Houghton <jthoughton@google.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Nikita Kalyazin <kalyazin@amazon.com>,
	Michal Hocko <mhocko@suse.com>,
	David Hildenbrand <david@redhat.com>,
	Andrea Arcangeli <aarcange@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Ujwal Kundur <ujwal.kundur@gmail.com>
Subject: Re: [PATCH v2 1/4] mm: Introduce vm_uffd_ops API
Message-ID: <aGWVeaz4onkGDl7x@x1.local>
References: <20250627154655.2085903-1-peterx@redhat.com>
 <20250627154655.2085903-2-peterx@redhat.com>
 <aaaca9d4-b8df-45b8-a3a4-a431c99f26c7@lucifer.local>
 <CAJuCfpHN6vpDx+UNPEzJgZ_qD9USTJZ_+yZzQg2BpF_aRpufYw@mail.gmail.com>
 <982f4f94-f0bf-45dd-9003-081b76e57027@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <982f4f94-f0bf-45dd-9003-081b76e57027@lucifer.local>

On Wed, Jul 02, 2025 at 04:56:04PM +0100, Lorenzo Stoakes wrote:
> I am also absolutely, to be frank, not going to accept us EXPORT()'ing
> anything core.

Could you be explicit on what you're absolutely against?  Is that the
vm_uffd_ops (or any form of it) being exported, or anything else?

Thanks,

-- 
Peter Xu

