Received: from mail-qt1-f225.google.com (mail-qt1-f225.google.com [209.85.160.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA921BD9E3
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 21:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745531447; cv=none; b=dXsBOs2LfSWm9qalytsyqq+FEZwb2sd076UshXi0ZC3Zfi3w+RDn0DPVnP4vvyGZ7YqBOeU09I0vjTjpyPvu5ly5XsJOK/pULFbo8tFS/RBtrYr/eWCb+xFhAf3QmHClF5JgOJsxg/6Lves62pzzoX2vPm2JDwvyFPsSSv11OMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745531447; c=relaxed/simple;
	bh=VAkjxzioc4l4S/JoUph8QTwsKDihC0ujHpvZ8VmpIKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h1I7B+/VT4t6u+1wacrkZimpALP8UfzALP9C1ezriR9rrWgk5qj4bWdo0SkO5OJooS9K/0ODFO+ePzWiiXkRbpmxSIKlBEIBlkbLAM22wgZ75KcpdtuLMFv1vfVCOP91gAirqXmEEKsyj8NTjEddLOyt/uyKAIkeI05D5RDcvgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=F36trYWY; arc=none smtp.client-ip=209.85.160.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="F36trYWY"
Received: by mail-qt1-f225.google.com with SMTP id d75a77b69052e-476a1acf61eso14723911cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 14:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1745531445; x=1746136245; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VAkjxzioc4l4S/JoUph8QTwsKDihC0ujHpvZ8VmpIKI=;
        b=F36trYWYYAO7zRA9+CqIOHp/xMZQ/yGMiRCOsnZNnpawT2gFl0CP9Jd6IaugzA5cpA
         tmg0swpYhAxsEXfr6ozHpzm7BF7DxFDUMRmstQa5fl/Sr/o74ivIH81wkW8HXJGCqB70
         d7opo2WsFqsgs25i7GEttWD/++biEiw68kdxdP3sJbcZkwYpKwmj6xNHMDxsiMmFbef1
         iox6W6+sysztp2ue0Krx/8SLaghYNtFSh6gvQMzKKQC+AYkHdOc6mzmYo/hiMnFDc6/F
         N7Th1XBkG6g7ZVdfzNBD3RjccmVJqrD5tQHvjpo8zcq1+UWWnVE2nHXBndRLh3kwt+Ix
         3Yrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745531445; x=1746136245;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VAkjxzioc4l4S/JoUph8QTwsKDihC0ujHpvZ8VmpIKI=;
        b=G0ubixIB9YD+T2wPt1ZlurLGKEQQ+wg8rfb+EHTor1iwGkMplv3NImFsnEUldB6UOk
         0PrtvnseBtSXonuNNhLD0njNGO9caVcZjXdhsrwDSdYrxM6RIM9mvW8uRgPvRW0ih15R
         PW2tDYwqqdg9p8dTsU9yjML1sgsLJt3nZ9xMEtR/vvtxQdBZaWBgq8mU9DbvfCdKAWnr
         yW2QA6Dk86baTcUUSREFRfxBe1uNADCFgYZOCr2dSi5FVSpQHKK9503DF/LoLukruMON
         G05S70Zdpmiuqq4L5IOLvqQxCcdaTOCKEkxANtSq/d6hf+s7FoICfLzNqJxo9hUjkzlt
         uNjg==
X-Forwarded-Encrypted: i=1; AJvYcCXXe83GG9Xtef+xlOGrlDEtd2dxEEPtuR6l8Cdm1Ukn8YY0bo64eMSl+DQlJ9A0kRiQHtOIR/YS7qvz83o=@vger.kernel.org
X-Gm-Message-State: AOJu0YywZUBHrkTy0ACjYaflbaFx+j0hArx/CA0dKtBsFiI5s/2p+DUQ
	hND39Xy4opCsT7wcf6U0VPCWuLM4q6lJdrdiA9tLmBC3HORhNBUZJdXBWZHcaDXlhie3Y9+IOmh
	0ngJok684xOqLj1oJJJb7aiFq7HYLXaCt
X-Gm-Gg: ASbGncupoYuWvs8oRlrFa/E9aJB5Lx1IgCk0UEhRr1VFbu9oClOXe34644HvZcesla3
	/C5sUqehAj/TzVdnDeJJ9QJfIA70PWTf+9uI12pksXUryEFlcMybiScNk11c9ScRRDeq+BW4WiY
	NCXeX7mUVqt585Pj69EOcbaxrAY1Cuq2ZSV2+AbfrcWbe5pJQ2FY8LHzNM65jYTQOkPCqcgwJvD
	hNdZjjoya3B2yooz/LUDcConDSJPTjVLSzsvtkoUiCOh2NvOTlJdqTn3n4h4KYfeOyBmxGAn8m0
	cPb0E2oPZ0jP//P/rbI6cH26MwE3LvW++dmY3CzjgUcFtA==
X-Google-Smtp-Source: AGHT+IFy3w7UKAPLPpwc4M8Gt3wbst/uUl2BFx6KYgJpJT/hFQQGZOa6VEGPHcDP3605TF/rjo8LT2ei8W6D
X-Received: by 2002:ac8:7f89:0:b0:47a:e6fa:9127 with SMTP id d75a77b69052e-4801ce540eamr741971cf.23.1745531444715;
        Thu, 24 Apr 2025 14:50:44 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.128])
        by smtp-relay.gmail.com with ESMTPS id d75a77b69052e-47e9fd9baddsm872581cf.14.2025.04.24.14.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 14:50:44 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [IPv6:2620:125:9007:640:7:70:36:0])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 1A5303402B2;
	Thu, 24 Apr 2025 15:50:44 -0600 (MDT)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id 042F5E40269; Thu, 24 Apr 2025 15:50:43 -0600 (MDT)
Date: Thu, 24 Apr 2025 15:50:43 -0600
From: Uday Shankar <ushankar@purestorage.com>
To: Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: Re: [PATCH 0/4] ublk: refactor __ublk_ch_uring_cmd
Message-ID: <aAqyM1DyLL22b7S9@dev-ushankar.dev.purestorage.com>
References: <20250421-ublk_constify-v1-0-3371f9e9f73c@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421-ublk_constify-v1-0-3371f9e9f73c@purestorage.com>

Hi Jens,

Can this series get queued up? They all have reviews from Caleb and/or
Ming.

