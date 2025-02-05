Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF8E15FA7B
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 15:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738769872; cv=none; b=E2J+UUVu9TJwbfXKQPIR4h9kza8mkKH/CrbdGhxU2sygvLknQwdfws7ZFp+UKsldAzTFB5LAkm4lxT694Av8e1GcRdyEPXNN9WzJqy1dkitIcOFS0eACc1Kr44nPB2+PaxmfEWplisgsO6D6W9MzE58tIr8QFguQSQaphekMgA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738769872; c=relaxed/simple;
	bh=9L1QGlbJh4WY4sEcjNiiWTatr4uX/44EQsPNfcxNP88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cOG38BLC17/LiXv2XnityTEKW1AbyO86AMB9yVDdwIJDkMdMz8G1MiOgkfpp/J7XRJt99yWaTHw26aQoDKUj+jvefHnh7IzeSI3PmfULPU7dOjFqwCl8UpRydzxm4B1OnUFKDofQOhn0txOQvLllAkiB5LZ92u9vVrZ8sbIfm0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HdQakbt6; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HdQakbt6"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21619108a6bso116710115ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 07:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738769870; x=1739374670; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S5GMWW/WHgfd+n4zB50D6s7SU2JvnxRhIweS+yznRTU=;
        b=HdQakbt641yNmi/+1k7mKHR6fOHTJ1OJEa/siAlAYTYaObEBBryWC08wLeSX4VLo7U
         8Wd2lH+iZI+ZMiYZ+Z5fkpLY/GJtbjLKjEp3kmnH3ee15f7rgAut7IqwyHf3/pSr9MAu
         wFz3J7+2e25c5u6n0F2nZZXcJmfkw4itmpj1MO669Hc6uB5kHkljG5BCzPWxawbPa0ds
         lSFm78hSWxEtWxhz6fHBSnH2GvDn2oVpu6dioEEps1sO0MNCgSLjpwzByNAOmWMSAhjq
         UycvMvHHpI1+KVITXNyVlP0GiofG3PU9lHB56zui1/6E6WpsJ21s/Q897jH9yYrg0z+0
         7++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738769870; x=1739374670;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S5GMWW/WHgfd+n4zB50D6s7SU2JvnxRhIweS+yznRTU=;
        b=O5UInnjNpKtGZuo9+T06kmoHs+k0/0blquWTUTe3jaR9gRIMWZOs8tF2gv+vAWS/cN
         ohUUhGMF7qOqrSn4PAKwSLJgEyqF0LsSvRahx0gLvLJm0fHh0BavFsOUrZgU8vjlSCyX
         tJig3gXaLsIWke5uJiHBZftW/zJJ6GWYerYfLFdiYVfxT+mIOuAYsI/q78fzBGB4nCBX
         lYY3jUindHXXatvt5dIXQUB/Miixfhqysq7YgdWL59PL1XCJkXBfewnGnFmwiKIytmrp
         tGs7mgOyDNhvES1ZDhnsJLrltboJws9H/TEYNJEY8BVGzRr0TIsWMaE+6cu2emtb1g0w
         JRGg==
X-Forwarded-Encrypted: i=1; AJvYcCXPy59/ilYsj0lgvAEqQafw8sgQlR+XBdqgiZd0D+yQ8UTCVQGTF5lS6PPl6woXibjncilbDlFUcwW8jFE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+6qVw9Vl3uqJtACXp5x7GZpR2Jv1+y8idoqqlVNvC3QjGwNvr
	wxmIJWF8iqQ6O7roDSLKmMzsss1K5TutSNQdDyZ+NZoYBlf8EoNrcuaqFAN23G4=
X-Gm-Gg: ASbGncvWFCXGhi91Jd2QyS7t45SaGsmORb94MoIsbMJpcyJ47OPfb3UVu15qPb0ouUh
	YwoX7GfDUkk8yOvZIkqrTQc+7JkX2SifBoxb7abt5lAlYlA6tZvxxb+IbAlZDv9f39Lq3NkyjeB
	0vrdQ8ImAIQ9SttAQKrDq5g9T/eyP6uW3XBdXo1V0gAdED5fJy+fy/0gkH54QuCUOszZcQxJDnz
	Wv8oyCjjIjndRIx4JenGKXhZQKThwMnX5hYLsynKu8yoW4LK83gc0YClko4AjdNs4x2cK6tPipJ
	fm39ErXK16FpRC6zBQ==
X-Google-Smtp-Source: AGHT+IF4C/g5tls1Fv/Oo93D/Eb0Rphct6uCI5wuyLqIdTAYDuKgNBS/oYL43ivTaMRV8tDecHZsaA==
X-Received: by 2002:a05:6a00:3a13:b0:72f:d7ce:5003 with SMTP id d2e1a72fcca58-730351ec970mr5210315b3a.22.1738769869540;
        Wed, 05 Feb 2025 07:37:49 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe6424facsm12685358b3a.39.2025.02.05.07.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 07:37:49 -0800 (PST)
Date: Wed, 5 Feb 2025 21:07:46 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Vinod Koul <vkoul@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Viresh Kumar <vireshk@kernel.org>
Subject: Re: [PATCH v2 1/1] dmaengine: dw: Switch to LATE_SIMPLE_DEV_PM_OPS()
Message-ID: <20250205153746.e5wkwm6iromxxqta@vireshk-i7>
References: <20250205150701.893083-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205150701.893083-1-andriy.shevchenko@linux.intel.com>

On 05-02-25, 17:06, Andy Shevchenko wrote:
> SET_LATE_SYSTEM_SLEEP_PM_OPS is deprecated, replace it with
> LATE_SYSTEM_SLEEP_PM_OPS() and use pm_sleep_ptr() for setting
> the driver's pm routines. We can now remove the ifdeffery
> in the suspend and resume functions.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
