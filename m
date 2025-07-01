Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879F7244688
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 06:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751350999; cv=none; b=sPVJPE3z+woojL35kl+fXJqhg6lmeG6c/BY36nyURP2FFTEkA6pYhXwy1QKvLF69lReifWr4LV1JPzlNU2WbIqQxWF7Oi10qa/l8X70fUkFOVam01qUTfM0kEfwvmJuwSwAx4g/5RPaLPdkRd+XyyESzQK7+TWSurXXDp8I3Wmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751350999; c=relaxed/simple;
	bh=Pkm5eBG02tWRKAdbUim2tyIzOe7R5n0k12DcqymuK0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZzBICxUFaZEMHFGzAV3xF3xIndRZZS1cZBiQpgqXqkw4BVWVCa810pXMp4r1SLKb94RQS9SENp8iv2A1s4BICjcz7W8pFvQ6DEo8dgJN2INd0nFr7wqk5iGQ9naRqnmkNa+diWl1JFdUv70bQY21PC/1yJB/x2cZ3NH7+Y9MxdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ec0cx7zG; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ec0cx7zG"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-23633a6ac50so65894635ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 23:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751350997; x=1751955797; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rW4h4Azwa9b41U/MJ+0olhYYxjHSpz1IrlhZfFrXOVY=;
        b=ec0cx7zGbBOa23C0PtT1hQaVLmY2Yrz5uzWzNP12IcHcknoJAHsaW8sQ7LqYzMMg7p
         oDDoEIYvLinIdHiK7EZwv2FS2YE5Z4Y8a8yJAY9ggw3J1L1nK+vknPlWHQNOVZjJyIIW
         4ns/McMFbQkQ44Nyi0b1C4CgnTDZ3iOfYUaoW/P6H/RrhMUt3yZg3e2qWBPBe77GIQnV
         DR6tKIf8bCCpm37yUjjhCA/0veiX5dPYTCVxq3KvuYvIgr3onJWNKSGSABmB204x+XeK
         4KGIrGBiTj1v6eO7wf1qF1JKNN3DOimL6lWTUuz92FEZrOhw/qmWK+fz7GQZpZvxCh8U
         G7ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751350997; x=1751955797;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rW4h4Azwa9b41U/MJ+0olhYYxjHSpz1IrlhZfFrXOVY=;
        b=tD4gluIz3DBsxxzlNLtKQqy5bZxqKJ41lr1p2AkppWOkROgwJeLCz18inXSo7GC3tX
         Mf31fz1Q/pkGUkxCMQakXkpD7LaN0Mh/lf+SQXwGmlIqP2Uath+lTzOnqN2I++vko8do
         x/FMquoYnExGUAMewFyvY4S7IRggotGmpJTiID5iwn8VNhE4tjteWL1/6uavOLrhBMYr
         igiNGnS6RID5+9obIQyUqFY30aOGl/zh/sV9eTVHB9B3prKwi4PaJfkW2gT7IdF8EKKn
         8V/iA1NW2Q+1QoPgsbjTVctqlq1y80CsZw4vaH54bdE2lBA3BJAFRV6eWncAZyA5DjV9
         Wr8g==
X-Forwarded-Encrypted: i=1; AJvYcCXcPq1+nYZgXEWBx4WJnRpi9LSv5BGsM7A4hozkJ4VzwJV4SNBqcmQNbtPs+HNDSwDbxZfRzExcEiuW9FI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx25bavl604Kjhc5G5JzKS8+Der03gKu1IZl1OfejK0OxZGEndE
	BYAYfdU/f8KobyXFBvFrci4/udABiftD5v4b4UVtRWzp/Z99r59Si9Mi0gEh8rWlw1Q=
X-Gm-Gg: ASbGnctkA6cQKEwozP84i1/VQaYwz/yKB+hM3Y3kqQds3bM/DbVZK9SSD6vUNqEDfvp
	2m7eRdW1McOKYuGBqT6vuHOBWiqjJmB69Yv0Ggziw/0kGG1iVasJW6oIJN9xCYz/Quwb63Z9zC+
	b/vpngZlw99sLCCvLszKFz1bo1ZcmhztlkTCqTlegFOxUREUIb4I9smVqTZ79dkCxDcO7wVMKG0
	XSsBsl4g5jxmVz/CDNXGmqexq7Q0jTU1bjL7CmxTO3N2a9Ibd1KzRzuR6F/TmK6FhCiqIKGzB17
	sa405nOUXD/lV6dFsH6PHXlazbx1YrMwMROq7MjjP+MMERuJ7qGizNSZwBZSeXc=
X-Google-Smtp-Source: AGHT+IGanyq+1JfKGAQVUmGzDCF/NOtl/SVC9FC+zmGFUYpqyIfc1oMAT6U/DUOWZXgu5l+4XMVi3g==
X-Received: by 2002:a17:903:4b24:b0:234:ed31:fcb1 with SMTP id d9443c01a7336-23b330c6876mr34741925ad.20.1751350996743;
        Mon, 30 Jun 2025 23:23:16 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39bfbesm105884895ad.109.2025.06.30.23.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 23:23:16 -0700 (PDT)
Date: Tue, 1 Jul 2025 11:53:14 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 1/2] cpufreq: tegra124: Remove use of disable_cpufreq
Message-ID: <20250701062314.42hudnylecbrta4f@vireshk-i7>
References: <20250508-tegra124-cpufreq-v4-0-d142bcbd0234@gmail.com>
 <20250508-tegra124-cpufreq-v4-1-d142bcbd0234@gmail.com>
 <040b0d8b-e862-48dd-9b77-9266a5194f99@nvidia.com>
 <20250519101725.k644wzizjwygtwa7@vireshk-i7>
 <49e7d006-e9cb-49da-a4cb-b73a08f6b792@nvidia.com>
 <20250520100218.te5i5ltrx43zjsq6@vireshk-i7>
 <9826e66a-3474-4a00-967d-b7784ff60be4@nvidia.com>
 <20250605105151.5s6eblr472mbhunt@vireshk-i7>
 <CALHNRZ-uA6vHYbb5UdDvhRrNy5j2jyds4iTsiOxc6O=2nnedbg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALHNRZ-uA6vHYbb5UdDvhRrNy5j2jyds4iTsiOxc6O=2nnedbg@mail.gmail.com>

On 30-06-25, 13:43, Aaron Kling wrote:
> In my opinion, I'm thinking the original flow makes more sense. If
> resume fails, disable cpufreq. Then the subsystem doesn't keep trying
> and failing and causing who knows what kind of havoc.

Lets do this and move ahead since we aren't able to conclude for a while.

-- 
viresh
