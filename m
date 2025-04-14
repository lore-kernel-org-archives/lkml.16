Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146412749FE
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 14:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744642096; cv=none; b=AynHfuwidaMe504qDrzz6ehNiOAVTSmm61D4NsJ92XIqXc8dj0qXis7l1ZVdMCyp1jYNFz26AsbyCp99JEDBaTM0S+xcIevxTTaPxaZAX52LfHfc/CMj6j8+WiXTA3ZLb3+tK0WLRh4mtLY4oH1Jp+pcZmmDyfnvJjZypAqkieg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744642096; c=relaxed/simple;
	bh=LhU0rdOmID82AZ8xNk6EuwviRRucppHfhg6LBx9zRaM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nNuzPVOUouYSEBKrmL0I2bYhemOY2GZplp/+pGsYfFej5xKrNaZWosRP1Td6ItkgcOKf+G/4yK+5rFkioOzRPgoanRrie86xCH3JcZK9ftOdRhbPR5MweWKKDtwBXVoQlgcId4y0wwzFG3StmI0mLoUe+LKD2ARI/DL93ryg2Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=D+vBenhY; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="D+vBenhY"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3d439f01698so16299675ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 07:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1744642094; x=1745246894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oHfNdnNi1xSkWYqtYrP+8jqEYscVUa2He6JVgixWP6g=;
        b=D+vBenhYK0LYA/+huTkVNTxykdTa/ahcevI4gBKcG7vUEeEgYxkpSgkbZXw4PrBM8O
         H4S/qGh5K8G4eCiouEs4N8y4ke1M2vnihxSJm5AwAivCID+nubSJHJxslOX8TNCmU+Kv
         D72qGR6z+coD/HQ40pARZzCn5AEf2LoeC8YmbDtIJjuPpEuFytSBw6NIMcWBUd63DCZt
         H5P3E5UoHzkK4cMTDFnWUcnD8wxBLIIRWHseNUa8eFeraggFNv75VrbDDhLZx+nPDOlF
         egpzBRMs7+uTpDixa1B47kQ21BQEUoXQl/MW89we+Dp5P5MTcbAnUZnxkcvJCl1cY6gF
         DOmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744642094; x=1745246894;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oHfNdnNi1xSkWYqtYrP+8jqEYscVUa2He6JVgixWP6g=;
        b=urTqAr2zCEiiAKhAjkieqbtNSd2uLVm2ox8TL/vm1mZzZgPhMCZlYfKI4xfP4vV3r6
         9c65REMaaUIokV0Qf/CPm0ZfE/ROc93vnfl8hzDhgYPlzIYK964vR+PFyQ5RJTPGfANr
         ZtHFEV10WHDTYtTJk+gOgHC6wEkINKx/e7RjnjhNy0XVwroBfU/CeSnuoRwCSQ37jBZ+
         9yvAqbanyXvpxIK8gXvCXrnwpBghvanpEm1yf/kMoQmgLkbSYs/EKqyfXbyD8VYv8bmE
         jVb8+bZqU84i/mDw9Bm26EpZNFJMTVBlNWXXWbiUM1nCuubxDOEEp2lQaSdek/ZvwzoU
         nZDw==
X-Forwarded-Encrypted: i=1; AJvYcCUgVlUXpdHaG1hM7dawI+1+b0Mp6Is1xei7Hcu8nPwz4SSjjW3KeY2h+wltO1g/n29Nr0LgRfm2ieJtBYc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhM/XHa2QiFER1lIp+ymE4HmlVFN5fZYQ1NFeqGZqu6+v73wlP
	/56S1FohHPgnjHRotDkPX9ETNCndHdiPKVu2UKUtBAC83sKfZSGKG0KW9cjWUok=
X-Gm-Gg: ASbGncsFvFtsdSt7Zexpuse0EJQgRoPL9Cr/MgWqGWSgeT3x6cWPydJefb8CtXkhVcV
	77SgBMsDOmpRDhTmTH+/+SOVg3gm2POz23vtaniQxrG9WNmfsmUEu3viNzTLMJY/zAZae+4hkg2
	D2/XrxYtl31/kM9krVO5MeQSrX7SmWLGtWUwf2GbpOYz5xQ7kYeLcPVifH87zAl2BH9XYG219Ls
	i0KgH1hOO9/XBi305GzRdJAhNmtzL+PScmwVyuNBtIrLVi3PncfZZAldiQlZ0p/Ei17KI5MXh0s
	TEO77i5Z/s56vSLAG0mLxDAgrQbAIFWyiJkDuNUyLwI=
X-Google-Smtp-Source: AGHT+IF7TuXWT67iAvYokr9eSH+aaPlPHhCcc1wcBruZkvWKMTX24qclOO8Q8bid8F0MSTvM1ww72w==
X-Received: by 2002:a92:d706:0:b0:3d4:346e:8d49 with SMTP id e9e14a558f8ab-3d7e4d02187mr131652295ab.9.1744642094000;
        Mon, 14 Apr 2025 07:48:14 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505e6bd7bsm2569671173.141.2025.04.14.07.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 07:48:11 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Zheng Qixing <zhengqixing@huaweicloud.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 yukuai3@huawei.com, yi.zhang@huawei.com, yangerkun@huawei.com, 
 zhengqixing@huawei.com
In-Reply-To: <20250412092554.475218-1-zhengqixing@huaweicloud.com>
References: <20250412092554.475218-1-zhengqixing@huaweicloud.com>
Subject: Re: [PATCH] block: fix resource leak in blk_register_queue() error
 path
Message-Id: <174464209120.57766.16774504976430724922.b4-ty@kernel.dk>
Date: Mon, 14 Apr 2025 08:48:11 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-7b9b9


On Sat, 12 Apr 2025 17:25:54 +0800, Zheng Qixing wrote:
> When registering a queue fails after blk_mq_sysfs_register() is
> successful but the function later encounters an error, we need
> to clean up the blk_mq_sysfs resources.
> 
> Add the missing blk_mq_sysfs_unregister() call in the error path
> to properly clean up these resources and prevent a memory leak.
> 
> [...]

Applied, thanks!

[1/1] block: fix resource leak in blk_register_queue() error path
      commit: 40f2eb9b531475dd01b683fdaf61ca3cfd03a51e

Best regards,
-- 
Jens Axboe



