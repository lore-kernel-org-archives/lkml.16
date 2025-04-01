Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE5E9461
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 17:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743528702; cv=none; b=ko+Vpe6EValYtM+Vk63xZf1x0E2x7/KCDABj1Jc/F5B80/ZYpS1OC8jDAk0hlZxdq2ZNgx9SDD8WgBYNlnfREDd1rnCbm0F3Om6hLwvknJIML4XhHod7lyLzIlHMkF4jn6aukBMC6elQnL5B86lAFZKhk5I19eYb59+FH9+fMOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743528702; c=relaxed/simple;
	bh=+vMSuFChWt0T0DJK0Q+dCHQ9DR9+R0BNPCkLchZ9/VA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UAVC4Wvn1+27cBiweersvNkDJpDGrf36M7jbgr+c4gMH12QNn4g9xHfYhYfI6Yx6TcaznnSFTNmCPEbAf/ZCxnInYPEp0RRhwTxX6R2Jr8daUZDjm4mW1ALnZSfpXypiwOkQE5VNm54ZKItkzT4Az7ioGtc/AOnYu0hXC/65vjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G5SLDBvx; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G5SLDBvx"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-224019ad9edso33390405ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 10:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743528700; x=1744133500; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M7syCWAOyThNyQUw4zwHmCXZr8Gy/oYrWc7UBGiI35o=;
        b=G5SLDBvxJG4IuFb7rsHsSn0L33o9jBxi+8eQBPL7RDvClQqAVFwt4Tmn2Hb3hSgnod
         vLdT0fsxpkCGHBKBULd/ST6YC5pjGeFovO7hPmbb9a1RB0CBWzAQ7qTuD/vw2Jwr1q5G
         RapDhsournl2j2Rx8hT02wDz5PGgckqwBRtuEwWjc036MuGcVGTyZsqELl1V82Y/tMHL
         UmPMGcBBt1UxxKWSVT/aRBIhazdwy9x6DuFYHouGu3SBmXZJAZusi6/6PUe6MDHVGfV7
         kcJGlHePZpL50qrX8Bix86vSba5h2KVLTK4vpRbHnS13DOEDrarijFhJIO7Ox102ULeT
         kofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743528700; x=1744133500;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M7syCWAOyThNyQUw4zwHmCXZr8Gy/oYrWc7UBGiI35o=;
        b=Z5yttFiTgpmTkDxGO1l6txsFj3WwJEc9Od1AQuwn/QQ8h3Vh54cucseNY90tHs14EF
         hXN6xNs5ejsxv1s38Ms1B8NQB1WFATosDEwKFUL56itV5y2V0H+b6GYPa7W+TFZQaq+j
         AGlqEP25hX+e1sSYkrSrDymcQ+N7Jsr5jjiBJa2LUN/qxbSrUG137dDB4R1P0sR8Ztuv
         5bXeguhpedOONzFtRkzIsDTS3rWrkXNp+Im/UKNf7QTr9yRaU9MpjzuFfAuCA9CZtJwc
         vsN9IHFRwq1z1J572zUVoFdagz53mPLI7AS6axtxKSNehEeN5XGFmImoiWxvr5B+WCe4
         54QQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoKKbXLfbBYi4gZCFyzsNIRLaAshxxepjROAuK3QX0REeBQb2hHfQniT0DVl8F/55K8anb4uOqGoI+GyI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yya6bRDKvGjK8GpnEDp+s1TMsXzIgrU8KbuxFEVqYYDrg5xAqJ0
	vIsIQuM1Im9w/eyR0wpmSucTNoG4vumr+l8TZdmuZ7H3QmML1mv3
X-Gm-Gg: ASbGncskmi4fSXSoqwXMEO9CFf6k+BO2EgNOLGEam3ZHd2ClWPRn8DJQbNn2VxJ5r0Y
	3MayhVk8/5ZrzwNscQkXiTK/vNvkwmwLTUIwJZ0acXf13aScDnz1w0+M/t35Mgkz3VgsYIy2ajv
	JNBcyonVdZDWp3BypUm+tR+FQpYihtyG3qzM/aBhehde2aRBjtbz4yUeu5VylIN0fUNiLDrewbm
	HuV87RT+fYzsRefhzDzwSLpLgY4bkUjvIfUny7FuN10Mc5uTciT3c7lHYi42bbqJV7rbTeCyOnA
	mc+G0jaDLlYIjo9Ee9ZO4MLKe7q++Wpvtd3Bx1eedkhKL7ofY4HRGEt5P0uuGpf2jWUoqtT/yFi
	n63NtiZzZEQQ=
X-Google-Smtp-Source: AGHT+IFrgdARhEFfvez2DLqR5DhUrUFREzAIsj4WG+NeSvM84PY/b6JyKRGyF2HOs6rD5AG+dqJd5A==
X-Received: by 2002:a05:6a00:1309:b0:736:55ec:ea94 with SMTP id d2e1a72fcca58-73980452a03mr22291576b3a.20.1743528700372;
        Tue, 01 Apr 2025 10:31:40 -0700 (PDT)
Received: from fedora (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739710b0f31sm9455943b3a.146.2025.04.01.10.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 10:31:39 -0700 (PDT)
Date: Tue, 1 Apr 2025 10:31:37 -0700
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Huan Yang <link@vivo.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	Brendan Jackman <jackmanb@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 0/1] Introduce vmap_file()
Message-ID: <Z-wi-f9WTQ8PiWtW@fedora>
References: <20250328211349.845857-1-vishal.moola@gmail.com>
 <02ba63ed-ef1c-426d-b469-09878c5f03d7@vivo.com>
 <Z-tGXf5mfTclxZgl@fedora>
 <a3618dd8-5b4d-45d7-b619-1c89ca7fd6b5@vivo.com>
 <Z-tbTWP5MYzwrRYX@fedora>
 <efd24da3-2da2-4acb-be7d-a070a78b80bf@vivo.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <efd24da3-2da2-4acb-be7d-a070a78b80bf@vivo.com>

On Tue, Apr 01, 2025 at 02:08:53PM +0800, Huan Yang wrote:
> 
> 在 2025/4/1 11:19, Vishal Moola (Oracle) 写道:
> > On Tue, Apr 01, 2025 at 10:21:46AM +0800, Huan Yang wrote:
> > > 在 2025/4/1 09:50, Vishal Moola (Oracle) 写道:
> > > > On Mon, Mar 31, 2025 at 10:05:53AM +0800, Huan Yang wrote:
> > > > > HI Vishal,
> > > > > 
> > > > > 在 2025/3/29 05:13, Vishal Moola (Oracle) 写道:
> > > > > > Currently, users have to call vmap() or vmap_pfn() to map pages to
> > > > > > kernel virtual space. vmap_pfn() is for special pages (i.e. pfns
> > > > > > without struct page). vmap() handles normal pages.
> > > > > > 
> > > > > > With large folios, we may want to map ranges that only span
> > > > > > part of a folio (i.e. mapping half of a 2Mb folio).
> > > > > > vmap_file() will allow us to do so.
> > > > > You mention vmap_file can support range folio vmap, but when I look code, I can't figure out
> > > > > 
> > > > > how to use, maybe I missed something? :)
> > > > I took a look at the udma-buf code. Rather than iterating through the
> > > > folios using pfns, you can calculate the corresponding file offsets
> > > > (maybe you already have them?) to map the desired folios.
> > > Currently udmabuf folio's not simple based on file(even each memory from memfd). User can provide
> > > 
> > > random range of memfd  to udmabuf to use. For example:
> > > 
> > > We get a memfd maybe 4M, user split it into [0, 2M), [1M, 2M), [2M, 4M), so you can see 1M-2M range repeat.
> > > 
> > > This range can gathered by udmabuf_create_list, then udmabuf use it. So, udmabuf record it by folio array+offset array.
> > I was thinking you could call vmap_file() on every sub-range and use
> > those addresses. It should work, we'd have to look at making udmabuf api's
> > support it.
> 
> Hmmm, how to get contigous virtual address? Or there are a way to merge each split vmap's return address?

I'm not sure, I'd have to take a look at that. Maybe going into a large
folio world that might be a useful expansion on the APIs?

> IMO, user invoke vmap want to map each scatter memory into contigous virtual address, but as your suggestion,
> 
> I think can't to this. :)

We could discuss vmap_file() supporting a series of offsets to map
portions of a file; I think thats a reasonable ask for the general API.

We could potentially do multiple files as well, but things start getting
really complex at that point so I'd like to avoid that.

The Udma code looks to be doing some buggy stuff, so I'd prefer
we look at fixing/reworking those before hacking in a 'generic' API just
so they can keep doing that.
