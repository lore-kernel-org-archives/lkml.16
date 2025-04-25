Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C860F154BF0
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 02:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745548828; cv=none; b=rVKvwXtPtZDu/unIdWi1AVNNWOPBhwK+S2ubJNYprKeW1nLmr8VF1P9dqHzn2Y9C+S6MDa2cffF4UIZOO0MJI5mTVZmBM9QdmTVvEUnkNdCsswlGu/4K6/TLOAEzdqFiYE+1CXZogKKWWBZC+RDDFl3KqV2PjIJ8Ui0R8Rebd6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745548828; c=relaxed/simple;
	bh=IOc9ugYjCFV82Pir4bUEbckx+boiU5DHn+5MOzPNxAE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CVw//5fOhbIme3VFvgG+lJlB86eeB3ItayGmBcgciAi3MyS1455sZLmS2UI/wMhravOcswRUIMQ30xge0Vz/wXIj/gdzm2ZWiWxd7glnLAGrfImege8M9/wffX1+Iecm+2GIlfBEOS6j2Us0idQ6DVDkJpbs7D3GzB6ZS52oFFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=k89EETB2; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="k89EETB2"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3d91db4f0c3so8668305ab.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 19:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1745548824; x=1746153624; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=viKGbo00S5J9vQp5avpf40UBRQJ3a3rob14D32XEglU=;
        b=k89EETB2BxL0ZZPgqwjO7H+bxACT24dsI7bEyfJY9uKSPmbUsyhaN1Zcl+74l0JyVZ
         uGW9s5XJkyHhGnCPJGtUuJcuoNOf77JRd1IHy/SG6SDBI1+/XrA3nj02Ca/6xowlD8Ai
         QJCkwGmFzW4hUaipVy+uCAQclozJ3mxkzM/3aFvXRL7z75qVkPbtGQXqV4JGBB6hpAac
         X8lBvO5duu7Ei3p2Rosy717Docb50OenF4mOHlJEdepp2BXx6vvWbti5yd9sfceCzH30
         eg4tn7Bm9mLnsQvJLbhRCS5k5rJ1UD7jWgz0Jb2OK3NlsHyefbIiRBE8fMpcOTEvjrxZ
         rgUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745548824; x=1746153624;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=viKGbo00S5J9vQp5avpf40UBRQJ3a3rob14D32XEglU=;
        b=W2BqXkL0jrzly8C5wqwG+tWzOQO7LyX2+pWSvB2qe1ZsqaMjksg6xLwAFIaOpBPcg6
         OJfW5jjCkm0s8DplZ/1ALWgrU3JbY66zfVq0nzKCj1FrBXC2ugAlmCnNI12cCVcCbCJw
         ikoBLlRXHKtwDcDTH70ZgBxypYxuz+btxkfJmVyTt+n8xq/m3nw819bYNMCDhNKffS2X
         uTeIkceYtJhNBJSq9VOmuZRCG7b0vqCuGUBiqoGvES5LMBvtENLT78ciP8if5ayzEJif
         I/BkXxATCOXEESiQ3x03HuCl5G2X9hbudcmtEA9AEo7sWqAxq5TMKuK4OPe1ajNJN+tC
         oHMw==
X-Forwarded-Encrypted: i=1; AJvYcCXacQ7+gyYlCewoJc9ZiVpkAETj5vQauIrFG2gSZsfJEYtDiDqlVFm3RyUfcELlrwsEzIOBtw9r+Ph/gYg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2geVOwT8fDhAyj/6/VC1oeTYT3P9mLFr7loULcDiJthPIKT9X
	ZVAuZeeCdciYfqne/mLrT0XWIG1QXTdAroBrUQ0+CJB+SXET55nn/CkhIZ/X65w=
X-Gm-Gg: ASbGncuQPl3RH9xDG3W3cD8pF2BY4QJZQh9Octf5kbVvFolxgMeTBtK/GeHnT/oUZ17
	uxGfryPsY3fkC0GXFm4WkHd0fJq7P3OkNMUxqapPJs8BcT84lEgSQ2wQFCX0vALZqA4pWRIpfYi
	o3yoTaQctmtw3VEkK9oYFoHpbrpdWPGbndaTklUlnzmRC0JUNdITCPC2GUolZ5DjmB4EaTavbKT
	E6W822ErNOuuk0cWgBPtSkhIon+MuVC5KySGMycbTMCXV0tN/5DZySVfotdl679ggOfxAS5ge+T
	TX4FBp9PXlnWtg8kr1ow9uDT2fEaBp590V0Biw==
X-Google-Smtp-Source: AGHT+IECJV8CCdR02FZ0JRlS5jxcu364IcbtNEm57VRDcxWQt6J8PPzMYUElfcOziYG+iGtCrCI6bA==
X-Received: by 2002:a05:6602:608b:b0:85b:4ad2:16ef with SMTP id ca18e2360f4ac-8645cd5b2c8mr80694539f.9.1745548824606;
        Thu, 24 Apr 2025 19:40:24 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f824a7fc65sm566012173.71.2025.04.24.19.40.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 19:40:23 -0700 (PDT)
Message-ID: <55e0a09d-08fc-450e-ad8a-8f4ff8cbcfbd@kernel.dk>
Date: Thu, 24 Apr 2025 20:40:23 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] ublk: refactor __ublk_ch_uring_cmd
To: Uday Shankar <ushankar@purestorage.com>, Ming Lei <ming.lei@redhat.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 Caleb Sander Mateos <csander@purestorage.com>
References: <20250421-ublk_constify-v1-0-3371f9e9f73c@purestorage.com>
 <aAqyM1DyLL22b7S9@dev-ushankar.dev.purestorage.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <aAqyM1DyLL22b7S9@dev-ushankar.dev.purestorage.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/24/25 3:50 PM, Uday Shankar wrote:
> Hi Jens,
> 
> Can this series get queued up? They all have reviews from Caleb and/or
> Ming.

It can, but I was assuming we'd have conflicts between 6.16 ublk patches
and what is queued up in block-6.15. And looks like I'm right... I'll
merge block-6.15 into for-6.16/block, and then please re-post a version
against that.

-- 
Jens Axboe
