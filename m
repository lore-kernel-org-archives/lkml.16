Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83EA2505AC
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 14:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744900517; cv=none; b=LRTs7toomVjesakAgWixmpDs6lT9C05x86p6sqe2TIedkGfRJXu4XDIK8EgVUvQsxe3+TYH2l/czV8/9cCauiFpQclKg05jK1Uinh/QX6XBsM1TfW11QV6ePIzJsHemYfwvouY/yQJDVWQmrqrabPeraxe2d/yT9v40BZ/fIYtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744900517; c=relaxed/simple;
	bh=O0K23XSzDEzmMB/Nds0E8PhPNDtKwqVd1INaDJ8nPZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PaWbq7jlFVJAcilpnfNKRoCDTLrgHYAgaDol1PB/NKZ6Dce2AMjWbuHN2u0NSpMBqrgGM8Gt2ujMUP/dG2wZp+BmqVY2/YxElE2qDKWPFdBCkUZtoRWDVSm7bJws10uyAf8vkpOo2Nda9gSVh+D4VIDnHJIwidqdvtGBNUfcMdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=ZA0N50W3; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="ZA0N50W3"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c560c55bc1so80234385a.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1744900513; x=1745505313; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g+NB8lZ6NCb5rcy2wsnpxavIgQ1EfGlMDna4xShLC5A=;
        b=ZA0N50W3TtWLJRhkOpNv7HyCD9nMejKoymandPWX8VQePiydScp8JCIhe0PctRVeGc
         FhY5sSfxltQ2eq1lHB5xVG2N0mIl9RMrOgQYXN8KXAkimbI6aDn5zbX2vbbKFV8GXcs9
         ndVr2zeiALLHkvyvGBM/sUtqb86MYeOXvqiV804NtM17mOuV0+qjdxgV9N7GJcCYakM5
         fzwLGVSwHaH/jxTjfq7QKR5RPxZ5++5pI/Nkpgm/T1AsPfxWUPBV9FKyURH1glfxoPHh
         nsietg2aa0dMCg++vj4Nm/r9ChlfsMv8A6OnwBGX5z9owemJVxKzpxKhcczfkh5/z+ho
         I1ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744900513; x=1745505313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g+NB8lZ6NCb5rcy2wsnpxavIgQ1EfGlMDna4xShLC5A=;
        b=EDchoCw/fvcXJ8RDg11CxctXrwffF60ldvm12QbUAHvjJ8q/n6/qVm1IOksOHkgGYf
         PwEj0aP+gcEqK4eBOVTiZMmCd2qxPOeF0a5F7kyPBOPGsMIPxyE4VgYDP1RsU5YHzm+8
         GCqmxoY2+ftojaTWdLOikG99wNAcjfaStk2/H5eX7C32kwxfgKGQEaxA0Do3a3Weob2w
         0GbdjRyQ/gF5Gnm62GJVZxaVQeus+ZxMn/XyVfeyZ/CLWeDuXsPdFFaV7d2pbwiIcZs/
         dq1RV/mncx8i6rCXlqdnjt/rV8YPcLmuDPVFD9wj1l/rHKNp3jvQ0L82HOlsvNbxM62S
         AtpQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3sw892+F0+EIpgmEKgvSFV7Mahj/lIdJf3SnlqZSvwc+o/H0ffka1SvH1QjzGNEgTljIAztcZat9p/+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjMwYFQm9U+6/pRm80dsFikKpg47m1EE5ogDQXg0wAhBEGDour
	VHCJO57FQN4Bxg3qJPQvIzIzqcjublmCMDdVfd7d4sI7fwK4FsqCUpbttPMtAuY=
X-Gm-Gg: ASbGncu7qiV7fLs9oV5UwnxseQOALNtze3IGFkF7IRQRJR5mdqtQqaOfw493SnTmTpl
	RZ6pT71qGHTmLEh6UorycP0KrDQ+pu+sJysZZe8xHR0r+rzrOVnNkpLgvfRS70gGhRNWGYc9jak
	z7HSczEkh/zlt8GmXz9XimfvKjVnMtjPV5d0DkhR9ysg7ZgWgMR45I2dbazXeKe4SaNUz6m4axn
	j0YZeW0AFgydxuczY7EISrmtkSfIHBcMd2Y+oObur1J718o4JMYUe94yeL30X++h0lc3C/Mwc0g
	/AspNXsVD1vA0UqpVs20X0ua9VG+rjpO+1WZFc4=
X-Google-Smtp-Source: AGHT+IHExexEDk+KWQVgVehLFedYA4ygWhu7sUn8lfwq5cCL9JrL5njO5WYNRXhHDbtsDX5FvbrU3Q==
X-Received: by 2002:a05:620a:2955:b0:7c5:5768:409f with SMTP id af79cd13be357-7c919083be9mr889987585a.57.1744900513667;
        Thu, 17 Apr 2025 07:35:13 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c7a8943834sm1182663285a.22.2025.04.17.07.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 07:35:12 -0700 (PDT)
Date: Thu, 17 Apr 2025 10:35:12 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: mhocko@kernel.org, roman.gushchin@linux.dev, shakeel.butt@linux.dev,
	muchun.song@linux.dev, akpm@linux-foundation.org,
	david@fromorbit.com, zhengqi.arch@bytedance.com,
	yosry.ahmed@linux.dev, nphamcs@gmail.com, chengming.zhou@linux.dev,
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
	linux-mm@kvack.org, hamzamahfooz@linux.microsoft.com,
	apais@linux.microsoft.com
Subject: Re: [PATCH RFC 01/28] mm: memcontrol: remove dead code of checking
 parent memory cgroup
Message-ID: <20250417143512.GD780688@cmpxchg.org>
References: <20250415024532.26632-1-songmuchun@bytedance.com>
 <20250415024532.26632-2-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415024532.26632-2-songmuchun@bytedance.com>

On Tue, Apr 15, 2025 at 10:45:05AM +0800, Muchun Song wrote:
> Since the no-hierarchy mode has been deprecated after the commit:
> 
>   commit bef8620cd8e0 ("mm: memcg: deprecate the non-hierarchical mode").
> 
> As a result, parent_mem_cgroup() will not return NULL except when passing
> the root memcg, and the root memcg cannot be offline. Hence, it's safe to
> remove the check on the returned value of parent_mem_cgroup(). Remove the
> corresponding dead code.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> Acked-by: Roman Gushchin <roman.gushchin@linux.dev>

Acked-by: Johannes Weiner <hannes@cmpxchg.org>
