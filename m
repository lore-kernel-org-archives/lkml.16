Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614EC1917F4
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 05:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745818561; cv=none; b=XuBVyq5dM21LvFClziaDV4MJCcZCtwdNsLHk+dsVZettTjCrdShMOm9bixP5KRNh9eRVMcJEjqngx/a/pGpQC7Ntg5IsuI0nCfh0LmmgZiy0ykXxFYls4cq775nIGLDcpS+TazRS2s2cTP5pJdReTGhkxz9Nn3z4O4kBAFp0UjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745818561; c=relaxed/simple;
	bh=r5SnptIAVywpfucvTbP/7W4oUyHQ5FhX7Q7NJyeaIek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=do69o3gKDzvo8tTgKW2o96/XL1pPTVWw42rx/ODGDlFWsQdvcLs8m2Ned4hNl6CftREaDjQ+jRKqcWJ4L//c/SvIxURrsUi4puTzEvm3gJ+fEpI8FpSRxzDk8iIO8WCE40fk7GcIHe2RKTHZHTuwtmIhzzPH3mcHRuF2usAjM54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Oj1eJLlP; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Oj1eJLlP"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso41178455e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 22:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745818558; x=1746423358; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jRhSTAhIhJUxG2IYSr9xqa5KsMX7Idz8w3xmMGK2klo=;
        b=Oj1eJLlPCug6OTE24U2n0xStK6l64exbPybETifiXpg1+Fe5i7KYTXCdeMcHYTeYX5
         dqK5T8dlTgbVjsOzFr+n18nrbh626LmM4yomqy7hb81ek0WR/PdkzuBWgd/nBeTymTbq
         8dnyKdA3AOP0hfSfEB+yGliWrQzo/JpPl38hGQqW7yseVcpdZ/kxhhEJwZa0GgSzJgxo
         hU3QuK4Ach5j2x7TeeGZsw09IwnhlkuTiSXTIJtKXurAuf3/JgLI06KUaIcpXj9LxxW1
         zVfNczxixTgf2znB5SJzxpHon/MaL+yj/3hGzy4VZDPT3av79IrUClsTxhhoLYfv7r1+
         fENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745818558; x=1746423358;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jRhSTAhIhJUxG2IYSr9xqa5KsMX7Idz8w3xmMGK2klo=;
        b=v0D0lSuTuR8O0hjwP3p3qWA9/2S7PRtCxIkjJRrNULX9niywyBecx8VZ4LXuixgmvh
         vUL8VNCFx97Y29oa6XzczseYCfdC06Y5SCjFhsh7x90+LDPQ6BDaQSzbxoYGbMszynyE
         aYWVCe+CT0FTN/9WXQT2Sp6mLa/pGF0/oSawcT/H8mjtGXGeRMg//Hrm8OLaOZL0jAhN
         RLm0ylQ97h5w/lzanH0mXi54gmnCoo/qLzIu0irm5fvYSelWTcmg+eAyCRQpJZ6pthon
         qz6jRZSgq1gYQXvFIPNAR3028ofAytjAkXqQ7aK5Jlm/REHOO/+tlvQ8XiQOidg1KNX1
         Yrbw==
X-Forwarded-Encrypted: i=1; AJvYcCVNSazhfNu2ewN5+E5ylJbtgkbp7HRrmWXnzRsLvAcH7eqN4t6V3Ns4IOAtJ5Rk8qxlb5aE3/s7U56USmw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwziTkMF76Pp9sRK8o7iU555SAyQCa0lr5wzKirI++Fizm/uA6A
	1I+1K44hTiGli1Esyrv9Wq8l/uf6/IifLNETbi1bD6Wye8UlHdC+zx5ZlVLee8k=
X-Gm-Gg: ASbGncuX362bf+W3Unr0APyCxn6+cV4wBTG65srlPN9bf4+pUi+CLQBlwmOZg3d/n5R
	78u7FBI4gxCck2/mFvBuphvCsWELmkjO4SoeMVTRAAl1NsDsRrpo16rCGXqaHXEekjEz8LKgrGQ
	pTHk+5+FLHaXy1CWpu+BbonVZKmeQyM8s2EWLp9VwCqwWW1BcIPK4K6XYJm+3ifxD7zTr18fzQX
	VqTExJrKr7a567RyI/P2vP7L2M68+5I9x5O83BdYMoD+ed0wZSBdzLFbbwTHxA1zf5ajSOvoRbl
	lr4xHAorcADNHh6TMx7iW5yKmCOVWqLLUDai/fmeUWQIPGVxwdeZKDQd
X-Google-Smtp-Source: AGHT+IF1k216EZNsBGTmdju6CAJoZ+K+NFTttBSZJ8/wDMK8c9nqKANzs8CN4pL4YN+3Yqzmvv+weg==
X-Received: by 2002:a05:600c:3d87:b0:43d:745a:5a50 with SMTP id 5b1f17b1804b1-440aa428c9cmr59743105e9.19.1745818557711;
        Sun, 27 Apr 2025 22:35:57 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-440a5310ad2sm111378905e9.21.2025.04.27.22.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 22:35:57 -0700 (PDT)
Date: Mon, 28 Apr 2025 08:35:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dave Penkler <dpenkler@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3 V2] staging: gpib: Avoid unused variable warning
Message-ID: <74272412-93e3-41df-be70-93df01c5c653@stanley.mountain>
References: <20250427091902.16301-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250427091902.16301-1-dpenkler@gmail.com>

On Sun, Apr 27, 2025 at 11:19:02AM +0200, Dave Penkler wrote:
> This addresses a warning produced by make W=1 with the configuration
> parameter CONFIG_GPIB_PCMCIA=y
> 
> ines/ines_gpib.c:1115:28: warning: variable 'dev' set but not used [-Wunused-but-set-variable]
> 
> Remove the declaration and assignment of the unused variable.
> 
> Signed-off-by: Dave Penkler <dpenkler@gmail.com>
> ---
> V1 -> V2
>   Remove the setting of the unused variable and say so in
>   the commit message

You'll need to resend the whole patchset.

regards,
dan carpenter


