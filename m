Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A12B1BEF7E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 02:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751508801; cv=none; b=jbcUKdqx54sgRnFkbGm7VDNEbUPf/ScV15ffqDPrmcf5wHM2l/QHdpTfIBPFea9PA1xw6uO3veilMQh1cqPbsRVgJrd9gu/i0uRUn3cP5vUJJd727LSw/dYcwQqidh7N/rppJBzaiJ+stZ56euKBnOtDWtAyinADHzTMyuq7Fpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751508801; c=relaxed/simple;
	bh=5ymmmvaYHZkZ63J3xtIxq0o0ASFDyKJPxoguG2Sd+B0=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=QOfEqcQkg5PEETOLs6DYdoJBH5h/FhfL9iFVyQAna+dg2U4aOB0ZCW4Ioazrka8fYy9IfWrZXV3NFm28mxw2rawBF8nP4kHJF6hdi0ANbq5ggJ7iEvC/ecP8TuwBflo+RzpeldO/WNOb2jcVTYkWCth0IRr9/RFIn8Zh3nKKvEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=e8xmKeux; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="e8xmKeux"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4a5851764e1so148423141cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 19:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1751508797; x=1752113597; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TzXhie4CIWJW7jzt+VKFb4S+L+Efm25Tu2fG/WJtN10=;
        b=e8xmKeuxN8pjpI9dI7PMfKLhAdn3rhXeTwTPuJGm6mG9lYLViCvAOysvO2DA4uva3e
         LQ3aEQrfZ+HPPm7h4flY5zzSEnL8Ncib/SROeW5ptYSgE8iLE8WUrmYT53DFkvaZeuXU
         GJ2uZa1xQUJVL0lFeVEUpCD3+YvgvqIVQCaXJIYv08dPIfdQdQVllVa3bVwyyQpyUep5
         bBGjwkBqY/d4VSINVzCUXbjhrkY30HGAOc2R2MFl7ADcVuBRky5z3vSJ0Pb+zyNiLN83
         ljIYpLU1QinagELHB2JpPhKWvflRsq1RXfaHvFqOTosaebS9V4Fr6OGwqR20+pZfZGGp
         NSIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751508797; x=1752113597;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TzXhie4CIWJW7jzt+VKFb4S+L+Efm25Tu2fG/WJtN10=;
        b=l4HKGzjav+u+4PGGBRf0cGF4rikFtAlEVcikgoGIUhYXFQKR3lfZSKvZ+ql6pyA2EY
         0D05p162Z59NW6fCmJQ6gv3k3mVvwcIjBTaI2M0mbLcsIXmyx8Bj5A8KnzV+jyaPhL6Q
         YYqOFdkf4qRlgq2VpWtCt9t7nj+JbDgiorOibJWsY2/QW/XT1hciPtSTA8CwIbNucAp8
         gBDNhMWC1Ov++zVeR15G5jQWyvXd1XVebHfOpoW0HoXD5kUeRZS7PaYppmlyVESNDoG5
         mZph5t8JMSeegJbzphFaHP8kDLf8RQ6SjMki8R50FaIbei4yLUDDjMe0reTkPUJdYMIJ
         ZrkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXE7ZYLkLuniyU1cU5rod2wGnYjgIeootbqbHEVCAxKYxEnagWqEeeSDLp4n205i9HOMUqm8O8M/W02DTU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd4qj1y62wgluNLXHtQd3/cgi/4r7MxFJ8ry+tmhbKBoBlo2db
	ikLeiqfIJVLvVGJxBag4Mj//Ah1Um3LbFI7o34fTE67wI43wZr1Kd77avARocLxi5Q==
X-Gm-Gg: ASbGncvKOYlHD0Ay1J3JYfNqTBuJ6RXTqZkwuF/NxSzBl/l6i2CGbhDFMv2CLIMWkTr
	kQH0Em7YYk0U7dPYk05nuH075Uho8oIWiPf89m+ZLQuZOWn7gyaJ4qcS67SqU0xXLiNtmGrVxmN
	/28i/sbHexsKTM1Mr/KNRaW9ql1vyiOiKFRIOMofIXkSxnyTDkZ9NyLO7mrTCzCE5RGqfdJU0KS
	Bcn8WKRo7+Gq6xY3eK0x5/gmwXM6260l0/DbbeFEOo3uBNWj1a3HpVfXpK63+7r/ScsCz9A35D7
	mmF1yhWah3gDsOg1MNK8OfDmx5fmH0xWgVAsuUyB7+q5PcpSp+SeLO8yySohgdqAy9CBtkEChj0
	DU2ozTltpqp9mpeUT89jLMj+SxnhbyFQ=
X-Google-Smtp-Source: AGHT+IELjxIty3QvxZPgn1IkijyUpwDEpAbFyjSsKr5nQr+vunzikG5BR25gm20fjjhw/qG4dKVsnw==
X-Received: by 2002:a05:622a:4e:b0:476:add4:d2cf with SMTP id d75a77b69052e-4a9879c3c8fmr28867621cf.16.1751508797160;
        Wed, 02 Jul 2025 19:13:17 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7d44316a54fsm1034468285a.34.2025.07.02.19.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 19:13:16 -0700 (PDT)
Date: Wed, 02 Jul 2025 22:13:16 -0400
Message-ID: <a888364d0562815ca7e848b4d4f5b629@paul-moore.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20250702_2201/pstg-lib:20250702_2201/pstg-pwork:20250702_2201
From: Paul Moore <paul@paul-moore.com>
To: Shivank Garg <shivankg@amd.com>, <david@redhat.com>, <akpm@linux-foundation.org>, <brauner@kernel.org>, <rppt@kernel.org>, <viro@zeniv.linux.org.uk>
Cc: <seanjc@google.com>, <vbabka@suse.cz>, <willy@infradead.org>, <pbonzini@redhat.com>, <tabba@google.com>, <afranji@google.com>, <ackerleytng@google.com>, <shivankg@amd.com>, <jack@suse.cz>, <hch@infradead.org>, <cgzones@googlemail.com>, <ira.weiny@intel.com>, <roypat@amazon.co.uk>, <linux-fsdevel@vger.kernel.org>, <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, <linux-security-module@vger.kernel.org>
Subject: Re: [PATCH v3] fs: generalize anon_inode_make_secure_inode() and fix  secretmem LSM bypass
References: <20250626191425.9645-5-shivankg@amd.com>
In-Reply-To: <20250626191425.9645-5-shivankg@amd.com>

On Jun 26, 2025 Shivank Garg <shivankg@amd.com> wrote:
> 
> Extend anon_inode_make_secure_inode() to take superblock parameter and
> make it available via fs.h. This allows other subsystems to create
> anonymous inodes with proper security context.
> 
> Use this function in secretmem to fix a security regression, where
> S_PRIVATE flag wasn't cleared after alloc_anon_inode(), causing
> LSM/SELinux checks to be skipped.
> 
> Using anon_inode_make_secure_inode() ensures proper security context
> initialization through security_inode_init_security_anon().
> 
> Fixes: 2bfe15c52612 ("mm: create security context for memfd_secret inodes")
> Suggested-by: David Hildenbrand <david@redhat.com>
> Suggested-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Signed-off-by: Shivank Garg <shivankg@amd.com>
> Acked-by: Pankaj Gupta <pankaj.gupta@amd.com>
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> ---
> The handling of the S_PRIVATE flag for these inodes was discussed
> extensively ([1], [2], [3]).
> 
> As per discussion [3] with Mike and Paul, KVM guest_memfd and secretmem
> result in user-visible file descriptors, so they should be subject to
> LSM/SELinux security policies rather than bypassing them with S_PRIVATE.
> 
> [1] https://lore.kernel.org/all/b9e5fa41-62fd-4b3d-bb2d-24ae9d3c33da@redhat.com
> [2] https://lore.kernel.org/all/cover.1748890962.git.ackerleytng@google.com
> [3] https://lore.kernel.org/all/aFOh8N_rRdSi_Fbc@kernel.org
> 
> V3:
> - Drop EXPORT to be added later in separate patch for KVM guest_memfd and
>   keep this patch focused on fix.
> 
> V2: https://lore.kernel.org/all/20250620070328.803704-3-shivankg@amd.com
> - Use EXPORT_SYMBOL_GPL_FOR_MODULES() since KVM is the only user.
> 
> V1: https://lore.kernel.org/all/20250619073136.506022-2-shivankg@amd.com
> 
>  fs/anon_inodes.c   | 22 +++++++++++++++++-----
>  include/linux/fs.h |  2 ++
>  mm/secretmem.c     |  9 +--------
>  3 files changed, 20 insertions(+), 13 deletions(-)

Thanks again for your continued work on this!  I think the patch looks
pretty reasonable, but it would be good to hear a bit about how you've
tested this before ACK'ing the patch.  For example, have you tested this
against any of the LSMs which provide anonymous inode support?

At the very least, the selinux-testsuite has a basic secretmem test, it
would be good to know if the test passes with this patch or if any
additional work is needed to ensure compatibility.

https://github.com/SELinuxProject/selinux-testsuite

--
paul-moore.com
