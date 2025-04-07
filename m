Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01442225390
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744009892; cv=none; b=IF3EHD0Fhbz6Ht+NtMI2pKvk0Yk4GR3D2re1CfLd5Pu1oP7LkGikvjIOo9fVHpZwOIX+Ri5jTkKLYPkXE4DprNs1hQM2D4DCNBJoxGtIXrqAzNrPjPa3Yic4tM4BJLclTva4/uDIRWCjrXMvxIEwrDzLzLFZZzhRR3bpLtgjwQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744009892; c=relaxed/simple;
	bh=bgbX/1TAGw3gEOnX+gc4RFwpwUDnnTk45cRn6/6NpE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E+WadxKTaMvKanggQIUp6Tqov6pAlHxTx0+o/mfSnVwwJapy87IXGFSzsaEeoLDT6v5FJpV3DjJruEXfAxYWzzjpXGb2+Z2s5g4Bn028YvMDVMI8/GhBur9t5St2YRK2yLN4pfJU3/Ti37c8uJB8ZLIvGtCEt5ziW19VSFxGwAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fUewrST/; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fUewrST/"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39c1ee0fd43so3332092f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 00:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744009888; x=1744614688; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rh2kVYU0upvV4LKj4WnQxMYuJ0Huyu7zHvLhWV/epMg=;
        b=fUewrST/ji6HzmcExHtBg2sIfUeBgzVvFIiU/m4snQoyTMa8fN4404kq3PGRt1zMf2
         cwHSI7cXBGPDPExn9EYRWcuOKq70rOycBm3T0oYBBDgf6Qp15UjiglMr4DqH2W57DqiW
         moJmVAH/0FzqI1PBUXnDmv30aM9InjxJ7RY4CdsLUCx4HN5W+JTVvluwWPx8sSTy8ltg
         kaFFRlG2H3AlbMLLkajrWF0I0ctJot8edZKQpOOwqDzMqbOzN2evH0gDyUeLlFVwciWb
         PbbfXM205EbhuDLV+YJXX+s9ezp7ZydI8MnidQh2F1lZjyYbu48WUaKO2//IwrOVNh/G
         Nf2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744009888; x=1744614688;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rh2kVYU0upvV4LKj4WnQxMYuJ0Huyu7zHvLhWV/epMg=;
        b=lrDBEr7cU9GjjNXLxbfO4nl0NlmKYAkVMxadraGRau1tqP/52sN11xXtvk57VUYPuI
         T+7BHDR+KyoWZUp7w4xnbLI4e9eQff1o7IhqpBZ+3hxOeAxZg9n/PaxvYE1GjigVmY/M
         oCe/BeO6B+W15ijDKC7uDRuhO3FrYTYn62J49k6e/h5izyxJXmPDIw3Ky0BWJRoPV8eC
         xsjQlHN+pNrhKIAEWux9gmcCe+UOVqCDx6VW99Q10C55Szwh9IjRr0NiDHz8j7+v3vps
         sylaVC90qtMhCY3lP3mQ9M4JYVlyHlO1CtnYh7g/LN8LuDQ9Ak+IlsOFc/802eayjEJH
         IFjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwWq3DZ3CnLa4nW8EluOwfDJfHBvYBOeWzpAaNibvkJTIEO2BIa6Vbfav1DPPI/IGOIQbThP+1HP+Mwlo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlKYGVx4lIQMC5Wuftjc0iQEb6zvzcNHN3Z4/bMRgCHKGDJgDh
	qZ19mCKpZx53ApGdGm2M+s/n1KejNpNPKnUL73Sy7hvWOWotQrN7VN8BCcJYhwc=
X-Gm-Gg: ASbGncthHgcrQq1nTYFXTdCvk/oqD0BeBaLVk4XQ5LT55ki2xODnfKMEawXmOX1RXQm
	4tRhBojwknTsQMZgX3jLG5/YXe8lNfflnZlSvFmKMltSfBJp0ya6DzRieBC0g5hllMuSbf729mv
	EcZWCHM8th/V/AN5dI0v8fn31ihh2xqR1yn4sTXbTKHC+BfMunHPuwOMMH7TbEOMhDHApwLeKcS
	amxeaoHY01FsAApqvU65YpBkevPGrF5oAoz1wbIcpfRz2miwXumfKL9pOl7uUiX9thyABp0PXnX
	YW+640v3OEnvzgVM0hRbFrgGOSz41sZU9TDhmyKvGAAU62J+Dw==
X-Google-Smtp-Source: AGHT+IHSxbAtFG8xM4hSgYaqnUaxFKwYLaPl6ubSMAn718vF9KSqrQf2fosBFbGX2G2epezcb1G3bw==
X-Received: by 2002:a5d:59a3:0:b0:39c:30cd:352c with SMTP id ffacd0b85a97d-39cb36b299cmr8256949f8f.8.1744009888228;
        Mon, 07 Apr 2025 00:11:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43ec16a3aefsm124095515e9.21.2025.04.07.00.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:11:27 -0700 (PDT)
Date: Mon, 7 Apr 2025 10:11:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: David Hildenbrand <david@redhat.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	kernel test robot <lkp@intel.com>, oe-kbuild@lists.linux.dev,
	Dan Carpenter <error27@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, x86@kernel.org
Subject: Re: [PATCH v3] x86/mm/pat: Fix VM_PAT handling when fork() fails in
 copy_page_range()
Message-ID: <202ba609-277d-4f16-92df-8a5a94f99ad4@stanley.mountain>
References: <g5vxcrmdjjsvrjeo5k6uzwypctv2mvbteoommwwpv6sfjpbcyd@lackqksyahfs>
 <94c35e89-f915-4122-b1a0-436893201373@stanley.mountain>
 <a33df3aa-7f37-4d1b-bde8-642115dd1441@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a33df3aa-7f37-4d1b-bde8-642115dd1441@redhat.com>

On Thu, Apr 03, 2025 at 10:59:12PM +0200, David Hildenbrand wrote:
> On 03.04.25 17:14, Dan Carpenter wrote:
> > Sorry, I've been having trouble with my email recently...  I replied
> > earlier but my email got eaten on the way out.
> > 
> > What happened here is that the zero day bot emails go to me first and
> > then I review them or forward them depending on if they're a real
> > issue or not.
> > 
> > Here it's a false postive because it's set and used if the
> > (src_vma->vm_flags & VM_PFNMAP) flag is set.  Smatch doesn't parse
> > this correctly.  I've been meaning to fix this in Smatch for a
> > while.
> 
> There is a slight complication (on top of the VM_PFNMAP checks):
> 
> If "src_vma->vm_flags & VM_PAT" we
> * set pfn
> * set dst_vma->vm_flags |= VM_PFNMAP
> 
> Then, we only consume the pfn if "dst_vma->vm_flags & VM_PFNMAP"
> 
> While we won't be using the uninitialized pfn (good), we'd still pass an
> uninitialized pfn, which IIRC is UB; likely nothing happens on GCC clang,
> but we better handle it.

Passing an uninitialized variable is UB, but if the function is inlined
then it's fine.

regards,
dan carpenter

