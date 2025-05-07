Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B372E28A3F3
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 15:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746631368; cv=none; b=PXRHaIaGEn+3KVxY7kzIR1sjDyTuIeLT4iGB7rjOWA2gJvTuer/gle0Nu7sVzOxTvWjKWU9goTb0P4UKhLDt0x8bnaSo68hAYPer6XjXCyMD9u+zF25lYmkw4xqKaT5aRMXHyTj/F9KM5UC+PBDyoY1SLNRRn5A0A7IygrWf2LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746631368; c=relaxed/simple;
	bh=KsXBCAzYAm7pVlD0gbTLEZssWdGKKtfQ2zkhoFDxo/U=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Soxr5y236tGEARERy8kMXi5H8kLDpQdsY1OSJVxDFgzsJyr6FXNIEtCjXokQBklBs5fYI1sBHd+dN/ICccAUxnG2zgnkNlktJpPjJIJP1haf6sJ9YxniCshLqb2qTned0vhFDf4MMgg5VZe8Td2VPoT0wCqPPMCpJc2oCqGETq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P+dgEpUD; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P+dgEpUD"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-549b159c84cso7937569e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 08:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746631365; x=1747236165; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LBdHNH+wijP0uK7dXxU2Rf8QEIBUEILv5ndDAujqTqs=;
        b=P+dgEpUD3uWgjwdxsiXDRxxvMrqbF8NlUq60DAG2v0x3ilnsNURDKbWgcAaJ3rRSNP
         v/o4ukrDKrd1KqC/sdMWHIaHl5Hh6z1eTmdVma3VV4+zKH4L4ZT+/hs5gCABArfi0YPE
         8sgw+FIzOz8LQjCFOwQJzqibl35kzsLMh/UofGuUMlaUOPRXeuw/kxS8BfmOIRobIPgj
         +9AsEABhCLldtCm3zij+q9frQF8c8ZAgM+SP7D2hM9qBbIFpJbrqGL2whVfd5a01Duy+
         tyA6Dm5lreFDkL+S/LWnZUrxXoUt7MEYamtHWG3Tjt5mPmMDRj+aJbrcjefQYG8baqjx
         s9vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746631365; x=1747236165;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LBdHNH+wijP0uK7dXxU2Rf8QEIBUEILv5ndDAujqTqs=;
        b=XvcEn1OqV9FSqiGBnHFhVQEAkhJo74yCv/X7yDZjJAgGsNu0Rbgx07vY4sX4+BSM28
         15FJ1hqwLqc8RESvFyWeN+L4NPPHvqws+SmhyTBlb/aypG+F9eJ+rRycugq/izi1AlJA
         3hBjI6u3GPDzro75phe+jCz36w7EpjYdvWbebNkw98Q8fnK91XgN4y7p/TNmQaxF5PwP
         c+WQEyIF/1dc7OZZCgNjymsmDesCOSRJbanEkeKSWPwx9/2RUDpUHCdD1ex5qJwKH6Ps
         mI/c/Sk4hyiVytHNY+SVRmdIVEEEKhSYXgPBz38ui1B4DBClVubhpV2bDSbxIkBqRYzp
         kfXw==
X-Forwarded-Encrypted: i=1; AJvYcCUmRB0D7Qfa+MLxOT37CkSUs0bLYigZPMm0Qy1AwNy+SBrf8ClT+OuAatKhXEjmFrh0DtH4/knbDvmtljg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWGxHpec/vZN2+LNnRpZiRhGi1y0r5lsQQLOkemRVGvVvqFat7
	SD1wy5X2Uj3qZ/AqYLzrbw8Ev497BfdswEOHqStYxVbvgsnWtRKh
X-Gm-Gg: ASbGncuFLBzohBd4SlJ0CAo1SLPTUaSn5//H2SniiD9JoMMcga2CFkLSxmoWoKPJqaa
	1VSqxtzMS2NZ3wN1KNhN3cdCA8kpI0FkLUhGUUUgH6Sb4cr4p14sUAm2pW+8jWljF5X+8SPjyTk
	MJpqHUE7xEsFsfIS9qwvIxEw47Y9iRB3yucBaAC3OwHx5QQiA0B0BcOZaSjxzcHriIklZirjbsr
	Ns2FsIBDObjjh05GljZ6Z+T3f48JRw7VhAV9lSqXGwH0KHAvUy2YGqPducoilmFrK9po3M7UT0R
	rY1XKdbZ6m42B+nLj3mhWKz1M6MMTgBmRmjdI3u4aAAJo+wYIZy7WgALUqBlHwesQle7
X-Google-Smtp-Source: AGHT+IFYCONGk6yUZbJnMblegVh62d9CkAE7qLluLxjADFGfOZMr0lygyWdyLCwlzCLb0YOIu4j2OA==
X-Received: by 2002:a05:6512:3e1e:b0:54e:a2f8:73da with SMTP id 2adb3069b0e04-54fb95fb807mr1369658e87.18.1746631364462;
        Wed, 07 May 2025 08:22:44 -0700 (PDT)
Received: from pc636 (host-95-203-26-253.mobileonline.telia.com. [95.203.26.253])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ee121sm2360264e87.131.2025.05.07.08.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 08:22:43 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Wed, 7 May 2025 17:22:41 +0200
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: "Uladzislau Rezki (Sony)" <urezki@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	LKML <linux-kernel@vger.kernel.org>,
	David Hildenbrand <david@redhat.com>, Baoquan He <bhe@redhat.com>,
	Christoph Hellwig <hch@infradead.org>,
	Oleksiy Avramchenko <oleksiy.avramchenko@sony.com>
Subject: Re: [PATCH] MAINTAINERS: Add myself as vmalloc co-maintainer
Message-ID: <aBt6wSI_kwwrjjzy@pc636>
References: <20250507150257.61485-1-urezki@gmail.com>
 <08c24a55-ef7a-462f-9296-f3b0374d885a@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08c24a55-ef7a-462f-9296-f3b0374d885a@lucifer.local>

On Wed, May 07, 2025 at 04:06:04PM +0100, Lorenzo Stoakes wrote:
> On Wed, May 07, 2025 at 05:02:57PM +0200, Uladzislau Rezki (Sony) wrote:
> > I have been working on the vmalloc code for several years,
> > contributing to improvements and fixes. Add myself as
> > co-maintainer ("M") alongside Andrew Morton.
> 
> Thanks for your great work there :)
> 
Thanks :)

> >
> > Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
> 
> Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> 
Thank you!

--
Uladzislau Rezki
