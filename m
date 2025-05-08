Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69F0286D50
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 18:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746728832; cv=none; b=DgIaywAqKNfQea1KEqiTDAi0/eFN78tdj6JR7MvrjEAshpis9wJAGdv2dRpQa8vniVeC5CeteKbXJPlooGc1cZAS9/jq58fUJFbVSFfvkiT/WT/GcmSdRS2SxBmUQV+VGOv+yZFIVWEkH8E332+Q+GhQhSSu5lZCKrsAYQsdTBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746728832; c=relaxed/simple;
	bh=Ts6x0vey+8/mW4/OAHy6JFo3a8riecanM76bGBPagHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FfEH34bdnev4tQBksalLjZrf1I4w56CBwrdCBpKwjXTAX15hio4aiJE0xAEUQ8SGTEPHOOeSv3RKJgzQLw0BSfGEvlDXYePev8wWaG72uicmA6n/hpPlrMadyeOSyTLl5p9dhwO1+qtTvGOCV9G0P8XZ9CzNJr6wac3L+2zSLj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=17IBQ1HQ; arc=none smtp.client-ip=209.85.222.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="17IBQ1HQ"
Received: by mail-qk1-f196.google.com with SMTP id af79cd13be357-7c5e39d1e0eso148005385a.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 11:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1746728828; x=1747333628; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PHlyLK144mASJdKYjAaMmstmpFh1X5VEaIwjf195aIs=;
        b=17IBQ1HQwyTW81YFqXR5esm4p0R2SsNdCBA2cejJtUN5nzZ4OgZITBbe4hAAyilvCd
         Db7+u9DTtL52s4QV7RJGttveDwqPdxlBpoQyLWLhE4t0lMgvOCO3r33RTgV/3ZCDLVzv
         0n/0b5LqhLgn6He5WwkAzxRXvzhpBpTUcvPs7b3dvs8y6wy6xxxYbyuWQN1SY4JMV8b0
         C6HS6dZmzfuHxmS/2dtgTBejbMyERJLGFHFLy0sVFFamszJQ3xDX5iI0VapsQW5HjMy8
         tj69Snew1dM3zxiXf0FZgO7LFKu/7GBK8/naWaR9IUlyGHTEeJA+pRMmvUNXXqstFTI+
         shBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746728828; x=1747333628;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PHlyLK144mASJdKYjAaMmstmpFh1X5VEaIwjf195aIs=;
        b=Qtjgtgxn30uezVTm/FF2XnWr55X5/28VO8ZD0okw0Rk5RLBy/HEsjdp7OpuArFfpug
         CIoaLskC5BIDdLjS25PtQUW+Fn39VFgiiEzKbySiCgqMT39NnXmJgx/OOKUJvXlwYtzy
         9BRwrmqVLRw6oN5C9UJGT3NKY5UXSdvKtTJ1M5L5sC0j5E08WRY5hp5bzjn7SdKYc0Zo
         gRaRpJOLbxua0G6/WO5dM1ZCNb6lD/cBRFtw7qQYXd5GBQiRXcckRONJo1vnuKyxD1zb
         GRr4kmKqR1qLKYvo52cg13qGsYa5zxsugwX54KQJmlHI/dNP9q1XAnDYxqwsonbrEDlh
         X8Ig==
X-Forwarded-Encrypted: i=1; AJvYcCX63EqE/TDmVNWhug1qahPzj4pteXNpE4Z/SU6ZwaB9wzWXdW7RUiza5bBG1uwOrjWRZLKXADwol8og4N4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQhdrSc7/ErA3ll2RvKvBR+/hIcmUxIHJ/JDorwDnkHdYU5UME
	YRvbUt1JX0yyjd/DNWnlPv2q4J+24/iXFH6MxOvj5TXJ3Tm+A1GEosutXxMey8OU7qkzy6GAP8X
	Nl53jyA==
X-Gm-Gg: ASbGncvxPBVqhWQ62Fev4F1XNDTEN4iJiWWyESrJxP6B0NUQrMYFuhbfaz0eXHhkyv5
	f2nQRBHocWGIwaNQnF37z/LeBHzziBF420tTbpOyzGr8EX9TsCKX5Pe1e+5ZbJAttdoiwJ+t4Vi
	bb64asC2xB4aFQ4mrlPDcpXQPtVmFkijqD8ls/j5DXJhPtMshRH4EITBLngwVTfnkZM33tbfzol
	BYdW2j/OVoWOZpsAy037p7EN019AygvngUhPiK0gQjTQ/wbsNHVRGem41o65Hp8YOuvqFQYDzNZ
	8w2Ku5km9Nu6ivMu+wY1IJIGonIt4nM5zHzyVAg=
X-Google-Smtp-Source: AGHT+IEZoKsTBZgUFt7dvrjRVg6X0NBSwCpK0yq9NZRLVIPnTG7P15gYJQXX34GJavSW0KmnOQPt8w==
X-Received: by 2002:a05:620a:319e:b0:7c7:b5cd:51a1 with SMTP id af79cd13be357-7cd010d00f7mr112272785a.6.1746728828413;
        Thu, 08 May 2025 11:27:08 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cd00f4e429sm24366685a.1.2025.05.08.11.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 11:27:07 -0700 (PDT)
Date: Thu, 8 May 2025 14:27:06 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Michal Hocko <mhocko@kernel.org>, Yu Zhao <yuzhao@google.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Shakeel Butt <shakeel.butt@linux.dev>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] MAINTAINERS: add mm reclaim section
Message-ID: <20250508182706.GA323143@cmpxchg.org>
References: <20250508173735.173502-1-lorenzo.stoakes@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508173735.173502-1-lorenzo.stoakes@oracle.com>

On Thu, May 08, 2025 at 06:37:35PM +0100, Lorenzo Stoakes wrote:
> In furtherance of ongoing efforts to ensure people are aware of who
> de-facto maintains/has an interest in specific parts of mm, as well trying
> to avoid get_maintainers.pl listing only Andrew and the mailing list for mm
> files - establish a reclaim memory management section and add relevant
> maintainers/reviewers.
> 
> This is a key part of memory management so sensibly deserves its own
> section.
> 
> This encompasses both 'classical' reclaim and MGLRU and thus reflects this
> in the reviewers from both, as well as those who have contributed
> specifically on the memcg side of things.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Acked-by: Johannes Weiner <hannes@cmpxchg.org>

Thanks, Lorenzo!
