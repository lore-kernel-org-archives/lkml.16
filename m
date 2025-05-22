Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65EA29A329
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 22:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747954187; cv=none; b=oXPArWLm+10cwD8wezdqCJ75rSWqMC3SVCjN/bTuE5Jc+dhWhdA/O69ZjN3iWjc6R1ZSfOVLPkFh0J3R3srW1nrVgbzulh8PDeCiR/KDEBwdaF9Ttm9NQjPdemFYcfDpd86CbuuJCxoQdDO/FKAuphTfQ81ikCNezQXs0R8dW+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747954187; c=relaxed/simple;
	bh=MpOiOzRLBDqHqB2k9gzP+UZBhD0AxK51yQUlhLwvf8k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j4YRJSP4Vk6FeEMgFEry3j1XtPyyE1623Su/VFg5thB7EHtjb7Fn0FhTmSwWD5/2tXgLQVpf1mKHpsj2bMvqhqaPdQS8Aadi4ISNhEDEt0Nhv95kH+0q56KWBWP2ZT/xikj57fZpXBAjfVYX5JmuTUamYAaJ89x+Nbio25IyoNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PX9kju42; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PX9kju42"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3da82c6c5d4so61050435ab.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 15:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747954184; x=1748558984; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4s3zSEh4snp0xBeK01CCVtJfz7Wl6wxDOdDf1VotpRM=;
        b=PX9kju42Se4jcYByT3jUj7Ppby8Ei8CjFJ9oexJxCKCTsRLDidqC/VI8/LotcVF/zW
         VMjoZbJ1vFlc8afW3s7Gk52e0B0shET2dDZjz2ebu0tY76H7F4eLY+gkrQN35Fn5BqjR
         ctB+2v24C0uj+rnxDUZ6M+ssCv+/GYsYcWhy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747954184; x=1748558984;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4s3zSEh4snp0xBeK01CCVtJfz7Wl6wxDOdDf1VotpRM=;
        b=XgRc+EgHXjxO7C0R7iB9PKT7I7HwZm8T2op58Loq9gar5o2T1tJ1UNaQqkBNdvwtqz
         Xq5/+qiw8Cjs3y/77xZLVsf176avJEPePjE1MabzB3n23nQ0Yrm9NowWtG7tkXkMPIfK
         +FZuWNsxxzDr73CQajU+abptmg2WSY/KvVNGkMxnO8lZe6qXaRuc2M/LQXuI3ECwBgnK
         S/aMTl9lhNOdpbMoc+4MzhvcKJws8oi4GnWRqwXXP2mqyr+5MUJlGjk7LQpj2buuvCIz
         iF+jFMQkODAcMFOOC2jQA6C+OGKEYYjvJFKC1NhflXV3/DhIqA+8dbipdFpFGVlJfzxl
         OMJA==
X-Forwarded-Encrypted: i=1; AJvYcCUhXRpQ7rN9Iot8QZe6/f/7chEdc0OZsuVBnrJ2e3Y8HT2QUGDRhTI2dMvRhXwCbLv2/iaA57/XUAFmTTc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJUcZpvfhmt+BwCEQpTv9NA6C1scFt9sx6b2hgAh/pTwpmqvy5
	JA38xUtxkn0RN6aONrNrLj9uycvpex29IpDctfn46tY/DpVQqIyNB/uCzf1xpR5gK08=
X-Gm-Gg: ASbGncu46A8Xz8g4VrTlCcnmiNb2e3n7o7p2/zAEREvwuWiAKRqaQPquzkYRJxTBOgS
	cADyp1HAAxTH+laI31S/2MN3Ku5C9aHhsS91ahXTZqVHR+ZYLnYEyR3BK3mFaiHComChf6jy+DF
	t9YLi/BoTpa/wHmUtxVLJN15oh5BpdEhqJX/5vhFWKln3RZ4iUMazEe3sT701RUXV+TiZfsW3Yj
	zrPfCUzr2YxT8+qeFbPegGaLojeTv1eM61D/NIc4LTydvf5zQBdq1MCPLxb/qeTzN/W8v3RYmGj
	pgjzUTHhSqdSVb6G2fLEAA+2lpkboZUlpvfrdic3h+jloP61vkAwF02nlFA3+g==
X-Google-Smtp-Source: AGHT+IHQS+ZDp8ppQECt+VzLm3Py7wm28k4VQfjNDxyLCiw94PysHUBvarpgdnsCuhzk1t38nuqn2Q==
X-Received: by 2002:a05:6e02:19cf:b0:3d4:244b:db1d with SMTP id e9e14a558f8ab-3dc932664c2mr10876065ab.6.1747954183964;
        Thu, 22 May 2025 15:49:43 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3dc84ceeccesm11041375ab.45.2025.05.22.15.49.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 15:49:43 -0700 (PDT)
Message-ID: <57f3f9ec-41bf-4a7b-b4b2-a4dd78ad7801@linuxfoundation.org>
Date: Thu, 22 May 2025 16:49:42 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] selftests: Add functional test for the abort file in
 fusectl
To: Chen Linxuan <chenlinxuan@uniontech.com>, Shuah Khan <shuah@kernel.org>,
 Miklos Szeredi <miklos@szeredi.hu>
Cc: zhanjun@uniontech.com, niecheng1@uniontech.com, wentao@uniontech.com,
 Amir Goldstein <amir73il@gmail.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250517012350.10317-2-chenlinxuan@uniontech.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250517012350.10317-2-chenlinxuan@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/16/25 19:23, Chen Linxuan wrote:
> This patch add a simple functional test for the "abort" file
> in fusectlfs (/sys/fs/fuse/connections/ID/about).
> 
> A simple fuse daemon is added for testing.
> 
> Related discussion can be found in the link below.
> 
> Link: https://lore.kernel.org/all/CAOQ4uxjKFXOKQxPpxtS6G_nR0tpw95w0GiO68UcWg_OBhmSY=Q@mail.gmail.com/
> Cc: Amir Goldstein <amir73il@gmail.com>
> Signed-off-by: Chen Linxuan <chenlinxuan@uniontech.com>
> ---
> Changes in v2:
> - Apply changes suggested by Amir Goldstein
>    - Check errno
> - Link to v1: https://lore.kernel.org/all/20250515073449.346774-2-chenlinxuan@uniontech.com/

Short summary should include the test name:

selftests: filesystems: Add functional test for the abort file in fusectl

Also if this test requires root previlege, add check for it. The rest
looks good to me.

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
