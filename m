Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2840B268FCD
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 07:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748935252; cv=none; b=rbVEVMK4SOg5TQsGjG6iFV9WM7QDmOtbf5qQxy01stBQreY9JQ+5JC2b7UX0hJc0OBJs9gDApAAAUd1WA6qxv1dQmRIQ+vdSOLX+DEB5mB00B3OUb/HcGCUtsffTf724ES3ha2gh3IdWW0opeIPNJfMZbpNfmmCjwcDR5cnvd9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748935252; c=relaxed/simple;
	bh=3jf2egyw8mLtcq3fW9zBVf98pdKdjR/uB4MhmbAkkZA=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=VOziz3phkjzf58ZjNqy6lN/qcaN73nn6hgYxsKk4weH1TqLfRnVoK7G/V87CxPuyV//GhJ4twEufk+j9oG5hpspnrG1l+wZUtSkueQ/qd2bXs0sCC40hfPxF4f1nqACcKuz4Ldv3oVo3295TDQaDv31btQHao1/7Q7lYb+nfzYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AYA+CgP8; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AYA+CgP8"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6face43dfbfso53902136d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 00:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748935250; x=1749540050; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CVw1MFfFrqB2bSXjreT217o9Amr/6jJ849RcACq9jcQ=;
        b=AYA+CgP8R9Ta2L22nElcYZAjMfS+ErngM5ehCJjl53E9SO2mVQniff68qIywZO8E8A
         Ara1Eabemr9SVVmiORuW+QnJnR8Wjbl16wVRnuZC/7SODgVdorCCNCBkrYVUQ0VV9oeL
         +dzKQRrWnrOKtFiROOQakH5ttH0p0qlOTjjhv5t3wKhuiompdbYzhgymbLbSzNhc3nvw
         goi/74pTBSjwMILfixBcQRdXus3p+vqmGOTs84EjEaOXtF7i4tG/Cqq7AB2eUvKFEepr
         Cc01hyDR7bOnal3Uu6GRbcn+q0l3YjP9+gOKA/aI4XYaVr63iDS2GRnTN2351vhn0gAb
         QuaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748935250; x=1749540050;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CVw1MFfFrqB2bSXjreT217o9Amr/6jJ849RcACq9jcQ=;
        b=Z9VODaXnXfZrII+/eT1F3JszFkT4Udv8F8njFDdUnMjAoZ9iMmL6fmsEevPYKpY/wX
         YkZtkaxhbNm+8ORZPCeAGX0Du3vNXxXq220f0zWpJkMOUj3VxeuW7cuL1Lhd0gxXBOV7
         KuMfLO6ezZcCJRKsGFPkRvuuyHJWeipQX+9wn3PD2y7XrxP8U+94Q4wXLU7RQgqO/a9c
         /9BQRmK/gD3pza6FmopUmTuf0ON2jUcIEj5k7N2Er31xsiGr5tWFE24iCm9vQDmNx8gm
         a3gnmCjP0aGKrxLxpV+LSSF2p6yP6Fvgi2o5RTuQlJN+4KnEJghYtU9PkMIoKeMYJ6/T
         NVBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfw+rYXH1USRT4aSM/6n/kzcbNxN2XEmLY/EiJ1JUA9upc5wwk2nLCiL4kxk2QemcuZEJJnDBNRB9gV8c=@vger.kernel.org
X-Gm-Message-State: AOJu0YylJ1lgHaY0pTlpSYgLbo589Jh9eAEHr7XmKQXVHapRiwp0Q8mz
	8XTUzg1QbTcs2eGBq1w6YVNr4kcP21wRnM+khCT0GfRejXI5FUGhvpH5YgzApArwsosWZcmpke8
	JLqbsXw==
X-Gm-Gg: ASbGnct2shNbQNWm3r1TEN+KkBDaLwF+u2orhOlX+QwWHBHPZkJz262ACchPjJxi5ik
	o7B2eVNJx78NItBJhet/Hy/Z85qBrYJkc/lRMLYtQ8CyCS4oKbgL20iOAa9CLrcY/duMrvorJc/
	aDKObZm4VqcvPPJPXWDPHstXEOMZ9KY74L9R+bhYfKk30Gj5a0LbjQPUGiO2oapJJpNC5rtDQml
	ovTx2CxRQ1gIXi9+FG8Ff3MH8JVWm/0SiI8nbe+O1CSf8bw4B8ytk5WBeNwG+XvFgqRzmuJqZcS
	I102vEChNRncQyINQ+377RVBq6SyOlH6KPyTtc6ojRCkaKW1JVHBYwF8u5X+NY66E4fXEEoWr3W
	nK5rCXG8evnWlrF84lLNsg01u7VDexmieDhCoerZ4C/vwCQ==
X-Google-Smtp-Source: AGHT+IHnO/EZ6JM2m9ssp8mM4u1ozr719kjL4/aCHEzLEZa0Z4NMQGzXlkSN604PxUDRzffGGFHI4Q==
X-Received: by 2002:a17:902:e80b:b0:234:a139:11fa with SMTP id d9443c01a7336-23538fcf5b4mr199217295ad.3.1748935239403;
        Tue, 03 Jun 2025 00:20:39 -0700 (PDT)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bc85b8sm81597445ad.52.2025.06.03.00.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 00:20:38 -0700 (PDT)
Date: Tue, 3 Jun 2025 00:20:25 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
cc: Kemeng Shi <shikemeng@huaweicloud.com>, 
    Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Yu Zhao <yuzhao@google.com>, 
    Kairui Song <kasong@tencent.com>, Nhat Pham <nphamcs@gmail.com>, 
    Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
    Chris Li <chrisl@kernel.org>, linux-mm@kvack.org, 
    linux-kernel@vger.kernel.org, Hugh Dickins <hughd@google.com>
Subject: Re: [RFC PATCH] MAINTAINERS: add mm swap section
In-Reply-To: <20250602185706.fc305626e7885f6b63f3955c@linux-foundation.org>
Message-ID: <4ac34306-b674-5862-969a-0ac089a86f3e@google.com>
References: <20250602152015.54366-1-lorenzo.stoakes@oracle.com> <0599e483-fe41-f8b4-ace4-d570ba10c9d5@huaweicloud.com> <20250602185706.fc305626e7885f6b63f3955c@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 2 Jun 2025, Andrew Morton wrote:
> On Tue, 3 Jun 2025 09:17:50 +0800 Kemeng Shi <shikemeng@huaweicloud.com> wrote:
> 
> > > +MEMORY MANAGEMENT - SWAP
> > > +M:	Andrew Morton <akpm@linux-foundation.org>
> > > +R:	Yu Zhao <yuzhao@google.com>
> > > +R:	Kemeng Shi <shikemeng@huaweicloud.com>
> > > +R:	Kairui Song <kasong@tencent.com>
> > > +R:	Nhat Pham <nphamcs@gmail.com>
> > > +R:	Baoquan He <bhe@redhat.com>
> > > +R:	Barry Song <baohua@kernel.org>
> > > +R:	Chris Li <chrisl@kernel.org>
> 
> Whoa.  Hugh doesn't escape that easily.

Sorry, no, please leave me out. I don't need to be in any of these
lists to comment when and if I can, and Reviewer I'm certainly not.

(And Lorenzo and David already know I've opted out of these,
there was no disrespect in omitting me.)

Hugh
