Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DEC3200CB
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 02:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738636642; cv=none; b=B7VmWqxs9wQvmrSJwiuYKNsgZzy8OSsVT7qVvaebPZcTSwSlYDOAzB348K2d2fzFJMgVim9zZVGcrUTg2SxEsoh8LAlAKDwU9iAuJaUTUcHnvN7ymbYpibGqqg9MRsRHPzI9hzg7yjJ5zbu2Pw+mYhWp4LURnbtB5KaoHlcOxCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738636642; c=relaxed/simple;
	bh=G/JDL4CZvtnFG+K594zW5mLTCXT8Go8wkd+5IxkgmFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y7hV3CI0JQulAPeS35VRu7wdixzjCHlN7FCKciHyUL/Za0CG/nf4YSocVOomW1BD3En478q17UP6nv3kpJlZ+Yl0gFpNUDFYkWo2ff8PTq3Cf5lzS2wX1myzdhlUw7SRgZet9akNMJYBQdN+13o3+9iBPDgIQXiGqtppaIEjZus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fiEtv9ly; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fiEtv9ly"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21661be2c2dso86365045ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 18:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738636641; x=1739241441; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yt6RbmCntOwwe39DpGUL4OFVxrqAVfPAILMTe6WFfx4=;
        b=fiEtv9ly1e9QqAq+hRTvHBYeMtsfmNp4T8+9Lh+VP91WyNK9ajiSlifhEaNEIZfnD8
         aHrF7QZe4GALHb5zE1al/YJaJlhJYcfjD6uk73e91lLersswNwVff0lK0Mj1RL010QH7
         0c/UMhAA8js6m4MuG76jqmZLE2UkYuaJ6MX9YEjZ5cqNUTbFYgk93Z3RWEUpkL6zJOh3
         eEvXXMWpe1QXDR8Ilk0dzq/CK+0hGIpo1Q8b7uJDv07k5UiObmKNdLXvjRJs3rveOWjL
         5l3QDSnp2vLm7R2EaddYKjVNOzoAtAalxtTGpHxdqm8IMbgcH+kJ8AjF81yFqoF5ghRM
         IlXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738636641; x=1739241441;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yt6RbmCntOwwe39DpGUL4OFVxrqAVfPAILMTe6WFfx4=;
        b=jfM1QxYZR8GyyyxVDHCqMfLnS12AoTg+RoXNO/zkR9KfeedqFlw20gSNiGN1e5zev8
         slRFg0UJrF9+sXQ+7TejOrC13LspRoLJF6LbQuLIIo05vOKVqLWlcf7tl2juh5oeDg2O
         elIMYnzlNm81lF1qlT7t52WCNyWIB8L7OpcpQPTqQuWjfi+RLY2trdIRuY/BlM6BwxLx
         f3xkm3bEL3Rd4Cki90O7lppb/nI1otSE374nvtZsnPHKyxz6tu9VblN9J8v2Hg9+q8qE
         6EtLtPgQkH6Ud3cpEhps8KBiBoUVyfDrRlVMMhncsf9N47WOW3prUfE2BhySAPhTAya7
         BDuA==
X-Forwarded-Encrypted: i=1; AJvYcCUGGuM9Puy6ewVzexjbun0fbyTnz5QnIJNGaJb/hIZm4MZUxpza499K4EbRvhOreA7mS0DvOdSkAVN3P4g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1QAPNgRUqPX0CGb9VkEkzI/NKFahFaU4i6xfWfx8mIsF+Xchh
	6nwMamyZp5Pxlps1ISODT40N1XXyElZksjeZwRYK7dV2MAmuh2mN
X-Gm-Gg: ASbGncvjg8Cv3qFoeLaz5XpFTnYwdqQoWvqoK+I0WNG7Wnu1rDm7rLQ0V6qxZc/ynfP
	+KOZNWbMdIms239eyNe8g/hDFUFzSjQ4NRwF9qIc7jRCRgTMnxJwkdD6Gzlo6VFGhaX1ytMRf0X
	TGEXTb0sg8bqus2PxOE/TIsZt2amnmxE/Tr+Mjlm04nRqYenaMrluGYs6mTFYcGrd0kG3mpXjOG
	cpD89C9BPWTI0Pnwn9taTpUkgBudLenUXg9tb2fxur15tSlB1RmX4zj53RT6Wm7BSWILPXZ7NiC
	nSCzJB0GhRmJ8YZgA05a5w15BlfQkuqGSgrhhIKbhfc=
X-Google-Smtp-Source: AGHT+IHvHDj6oICAor1q3Ki9y7w6OsAFt7AAlhEJySJFeaMlGdK+UIbJJbRF3JM15bkQQHc8pDZPQw==
X-Received: by 2002:a05:6a00:4ac6:b0:72f:c58e:9af0 with SMTP id d2e1a72fcca58-72fd0bc6101mr36744652b3a.2.1738636640616;
        Mon, 03 Feb 2025 18:37:20 -0800 (PST)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe631bf73sm9298745b3a.36.2025.02.03.18.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 18:37:20 -0800 (PST)
Date: Tue, 4 Feb 2025 10:37:16 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Yu-Chun Lin <eleanor15x@gmail.com>
Cc: akpm@linux-foundation.org, skhan@linuxfoundation.org,
	davidgow@google.com, linux-kernel@vger.kernel.org,
	luis.hernandez093@gmail.com, jserv@ccns.ncku.edu.tw
Subject: Re: [PATCH] lib/math: Add Kunit test suite for gcd()
Message-ID: <Z6F9XJdig6KlGvsZ@visitorckw-System-Product-Name>
References: <20250203075400.3431330-1-eleanor15x@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203075400.3431330-1-eleanor15x@gmail.com>

On Mon, Feb 03, 2025 at 03:54:00PM +0800, Yu-Chun Lin wrote:
> Add a KUnit test suite for the gcd() function.
> This test suite verifies the correctness of gcd() across various
> scenarios, including edge cases.
> 
> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>

LGTM. Thanks!

Reviewed-by: Kuan-Wei Chiu <visitorckw@gmail.com>

Regards,
Kuan-Wei
