Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65A91D5AB7
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 09:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738919209; cv=none; b=lHjiR8I9E1U75wXUMbc+fcoBKUOD2LoXoGPrq9v9erFAZy83Mbsm8QfYJecBKBJKd0bNyI38fZ+DgpNFODH0OPWpEnKmz+oDvXyojDpUwOUOt2lOygQLeilA2fWCikEvVPsf1WmPZx6rbFX/Vu8+CICEXduscCMDvyFiFenLmMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738919209; c=relaxed/simple;
	bh=+woGmxCMu2JzyJ0YCPBlHL3Y4fLfMfw0zcAOzy24UFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jfdwdZDgE5Xl2oxSezr5opRHjbP9m7f4SFEMexKZxA72uJqbVLMoGp3GQTGO3QMYkmEMML2nfmE/XmeF7+EU3eTU3AVld5P8LP58T1mdpaUFtWvk4Wb5BuUovx55LZtRXSxNIZZV4xiKhGJDDQ8eOq9nLBE+kHkCZ0wObYOKZcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=JCmxkFc6; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="JCmxkFc6"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7b6f7d7e128so290399485a.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 01:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1738919206; x=1739524006; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KlsCGWDYgEMFIAxn5ZNnnG9gpMSYaXAreXaY6lgyHOI=;
        b=JCmxkFc6uPS2abEWD3dIr+ZpHS0Ao8l6xX5LBWYMfkKvh0ZqegTfDiDeNz3UFhDKcw
         xxQNfEPD+54bcfZ0XLQFzRI2sgThRUeWc9x1Gg37912KVQoW3q9PqMaSPxE4WxH8LBPO
         AQW1kfxd5Mg9xbNrjxHSHc68MXUb/vO86DEUk2Fp0Bia+oMMlrWy7nX5c0/RMiIJRVNh
         S8SqlpHjzMgAodoBfxLInmylziYZbbMNfhGeq1NaqRZYO05NZW8x0Ghp5z1gmn+Yvhi8
         XMI7FYcoq7rI16rQ/q58G5yV9B72opVHXVoyGVzI0gu0V8x+AEC1DaVtyWfZ/l67tKkk
         fFEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738919206; x=1739524006;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KlsCGWDYgEMFIAxn5ZNnnG9gpMSYaXAreXaY6lgyHOI=;
        b=wi4OMH/9uJORZ3hy1chHsO8DUp09ys/FItJr05TL35cRNEir1eGdGaOFQiA4CCyxRu
         dLLqM1USxZd4SpuIhYeBQBJng69WiiPKiys0X1/G3ztM1bWsNjmWjSwG1quOVTNmJjfv
         vm+TDN5T7iGeBfrrZGEvJ17OaiYxczPKz4n8rOsOB+7X+pLSHgcvunvPuhvybtXBZ+aP
         YG9XHeLNGZ32IEyQxSBbXq8UijoLYD6KZlcxU41EWtwhJkLrwWTRQH2lIfuJ7c8iJV0D
         G2RIr6HsAOl9BJj/XijbylugMtnz/UlZJTB+PDpK/hXEGcYFLVbNNcEZl6FOSMWUwZoX
         j/yA==
X-Forwarded-Encrypted: i=1; AJvYcCX/woNAaD9WnPOL5xzAwjjsB23UsfsTxJzVhPTFd5ffHjJ21HLDximRkMyZmI3Rf50Dp1ileJs/lqjtxFk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzE+yv8IVS+tmEc6aIGMPz6qfYu9TdgNcaanXZEiIakc70D6+IZ
	3loEtlJojHOIaWSWrETc9EpfGPdt1sZWz/py1EsYX40nEBMY4La+nA7bqIitOWA=
X-Gm-Gg: ASbGnctwsocFesbJnFfc6t+AHrmDzDF06poV2W8FQ8iPjLaI3umFBk42YZKzeSnLm+h
	puMlPGyRVD89iZ5ZUf6X82+yFDVNiH4P0CuLxqxXuCoQJennh+G7gUBcpqWlM4qy2uhURugFtsX
	YAlI/dEQEaKwxDuqRecv/JporN9TP87o0L+1ZwwCuDZ18wVMUL8cyCxcMXKkBUCqP7g88rqCBVb
	8O5EvplUTUXICSYDZmoNsJeHNJBP2qLwulg/Hv/7wcwaG90fPGvuZmNdGz4S99Ho5MDe/NglyYC
	NOAtyJi0qPhTKAh1UvlyfmF3TadwZeVfznNOZ1c0cPGl6RjNYNF3VYs17WoHXbxZrdc+KXHBPw=
	=
X-Google-Smtp-Source: AGHT+IFix9/6/WikxUXpr4E81NDyDlXxaQWFzjmD160fcdkrmvnCsAAyMkgJA4E3sG1vrdNPNKoSjA==
X-Received: by 2002:a05:6214:d68:b0:6e4:47b0:8b53 with SMTP id 6a1803df08f44-6e447b08f9fmr22904806d6.9.1738919206428;
        Fri, 07 Feb 2025 01:06:46 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e43ba368a9sm14778966d6.29.2025.02.07.01.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 01:06:45 -0800 (PST)
Date: Fri, 7 Feb 2025 04:06:42 -0500
From: Gregory Price <gourry@gourry.net>
To: "Huang, Ying" <ying.huang@linux.alibaba.com>
Cc: SeongJae Park <sj@kernel.org>, Bharata B Rao <bharata@amd.com>,
	Raghavendra K T <raghavendra.kt@amd.com>, linux-mm@kvack.org,
	akpm@linux-foundation.org, lsf-pc@lists.linux-foundation.org,
	nehagholkar@meta.com, abhishekd@meta.com, nphamcs@gmail.com,
	hannes@cmpxchg.org, feng.tang@intel.com, kbusch@meta.com,
	Hasan.Maruf@amd.com, david@redhat.com, willy@infradead.org,
	k.shutemov@gmail.com, mgorman@techsingularity.net, vbabka@suse.cz,
	hughd@google.com, rientjes@google.com, shy828301@gmail.com,
	liam.howlett@oracle.com, peterz@infradead.org, mingo@redhat.com,
	nadav.amit@gmail.com, shivankg@amd.com, ziy@nvidia.com,
	jhubbard@nvidia.com, AneeshKumar.KizhakeVeetil@arm.com,
	linux-kernel@vger.kernel.org, jon.grimm@amd.com,
	santosh.shukla@amd.com, Michael.Day@amd.com, riel@surriel.com,
	weixugc@google.com, leesuyeon0506@gmail.com, honggyu.kim@sk.com,
	leillc@google.com, kmanaouil.dev@gmail.com, rppt@kernel.org,
	dave.hansen@intel.com
Subject: Re: [LSF/MM/BPF TOPIC] Overhauling hot page detection and promotion
 based on PTE A bit scanning
Message-ID: <Z6XNIuVbYvZMYJs2@gourry-fedora-PF4VCD3F>
References: <20250127183403.67757-1-sj@kernel.org>
 <87ikpmgooo.fsf@DESKTOP-5N7EMDA>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ikpmgooo.fsf@DESKTOP-5N7EMDA>

On Fri, Feb 07, 2025 at 04:10:47PM +0800, Huang, Ying wrote:
> SeongJae Park <sj@kernel.org> writes:
> >
> > I agree the fairness is a thing that we need to aware of.  But IMHO, it is
> > something that the async approach can further be advanced for, not a strict
> > blocker for now.
> 
> Personally, I have no objection to async operations in general.
> However, we may need to find some way to control these async operations
> instead of adding more and more background kthreads blindly.  How to
> charge and constrain the resources used by these async operations is
> important too.  For example, some users may want to bind some async
> operations on some CPUs.
> 
> IMHO, we should think about the requirements and possible solutions
> instead of ignoring the issues.
>

It also concerns me that most every proposal on async promotion ignores
the promotion-node selection problem as if it's a secondary issue.

Async systems fundamentally lack accessor-locality information unless it
is recorded - and recording this information is expensive and/or
heuristically imprecise for memory shared across tasks (two threads in
the same process schedule across sockets).

If we can't agree on a solution to this problem, it undercuts many of
these RFCs which often simply hard-code the target node to "0" because
it's too hard or too expensive to consider the multi-socket scenario.

~Gregory
