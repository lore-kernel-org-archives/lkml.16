Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0B01474A9;
	Sun,  6 Apr 2025 17:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743960535; cv=none; b=g58WzjqEYFHtW+4duDK5vbGLdePqY2xPmBdAI6y1MGmG3te1uOdajgSj0GMVFQ7aW4YbU8WCZK8q5jYUxm8BNrjcvw7ZkWoonykfSbVwsdGw0IsV3f620QXjboGoqinBSWDVM8iiF6JUB8mqmaqZVOM19GR3KqQPJI5/e5vS4sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743960535; c=relaxed/simple;
	bh=URzcgJhSpfLInZMMyrMpW/e7W+8FfnsY/G6MjxzpGmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SAZ4dX1HRoP+jBbagejeUG1OI7ZIFDYuOan/nyfqflulmotnBIeNnDQsqaATRzi1yOG3vuw0RgfFrcbqIuTjT8Zb+uoPCkRUhguGi892N5bg+6a0JnqtEosLEk3uYAEO5EMSJeMUTCOClfmtLLH+FMjATNBGFpr2LYr5VIcmvsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SdyR4ckB; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SdyR4ckB"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22438c356c8so33844085ad.1;
        Sun, 06 Apr 2025 10:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743960532; x=1744565332; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e/5RFZliJG0ZG+62Z3/jm5yPeEZQcNzb0cHk62JRo8A=;
        b=SdyR4ckBdrQpAuFykSMRM+Li/VuVRVUtqyJmkZkMcjUSLReJwdILjv06f9o7KHZhOI
         0pgYlqpaxMv5IvpxSKCTj77iVkX528PsLPpUXLYCdw71T/+I++A8Ku/pqlBGCvAbmjhQ
         Bwroph8xju0jwYevQs3nwCTzDV6wOf0yXi3K7LOhB/tnEHYsCdvQg5DpY6KEOqqUya8p
         q+l21IuEaR9mlPdbgusFwY3cBRnCWcxcmWaFTXSB0iTvyz6b6ddfGLZ7YIpjEpC1mAo9
         YsMYZEkDcLmA8kQd5lCMGu983dRbcyKC7oApja+HwDbAadxLxwFRIiB51rczKFUlXKAe
         qxhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743960532; x=1744565332;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e/5RFZliJG0ZG+62Z3/jm5yPeEZQcNzb0cHk62JRo8A=;
        b=g4D/XIZG1cxQ0XqrkvngS2vQQTBMbM+8g+JUCaqTwoV0b4vZ6unjGupj8YRLHuAoHC
         M+om560nFZpj86bl9t44TAGizA+Roq3vQcb/jWnWdYvaD3xImxxua8/Khb70eJT0orGd
         Ug4IxkeSwYUtODRE08pRYuy9HOqBgACKp3pJoITwVcEySk01oChPTRsra4Tt4VOJpP/c
         yO3qnlc+tA+n8zcvgfYM5h53PTI938TY2jb2vHVVBY9Wavt6gghUL9PhJmAKbAO8Vhk5
         pwc9hgBY8Dry3KtCJyYZdnzL1z9BO5nT5x7eFPWlv2dSDlzwNl/uubrMUvgML/JfxABt
         r2ow==
X-Forwarded-Encrypted: i=1; AJvYcCXR70IK5GEcOXj7J24s1J+L7x6I5sDwWP9AzbdlYiVFhQxGUmaJrY0eaHqnaH8Ei8+fzyx6Dyqy8eWALA==@vger.kernel.org, AJvYcCXqz53U+b3FVx9JjEd59hK+kV8+QUWoZBrzg/Ss+2Ktl1Kevcah1vuEZChmdcNHo44cxvqajLU5vhAPPVfF@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3TJTv42lumup35Q3iWqffNw7nxXDWbkQHFYvy+BGiKSQWJjNU
	Tv20spM+r8gd9MP4tWsWKmoXFo1uqZkrGVGYBIjzIAE6PJ9bm2DcRLnqIg==
X-Gm-Gg: ASbGnctfaOmgkxjqwSt75J76eZ+H9NyeR8cXCCU9UYDs2jpnDMMmNbUh2p7iWUtFf+t
	p9Obpf4szwVRJG49LKoHpm9wcJbIGhNRCIOl4juSGJUMwlS8ah1AnKAGkgbT9t7+FvFkcttVPfj
	rJpmbo5tBVyzWE19FjQnW9mAsWMryYsn7WeTfzlJg7hZf18Ka8dxBSG/oJHuslTKgmbvQyFob8g
	iY4no+p0BTwXxURDkW/9uK4VPbcX0LI/5rsMwk/LtduTS53pOsizLAPVQmC45IT2T386ZbfTmLe
	QkdhXsAPKRebcNa3JC1xUhPlif1HJyXCfXEARjg0kIK0Oxly55BZ68BP/Q==
X-Google-Smtp-Source: AGHT+IH8L5HaU9UrU+YowTmkLvGrlkQalpizP6ejoOQtI09SyUHhu/xLB13z3lYX7gusvSJ7YmOedA==
X-Received: by 2002:a17:903:1111:b0:224:5b4:b3b9 with SMTP id d9443c01a7336-22a8a8c9e71mr133720775ad.33.1743960531561;
        Sun, 06 Apr 2025 10:28:51 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785c30cbsm66037085ad.101.2025.04.06.10.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 10:28:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 6 Apr 2025 10:28:50 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "William A. Kennington III" <william@wkennington.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] hwmon: (pmbus): Introduce page_change_delay
Message-ID: <295ea363-dbeb-43c6-b8b3-3992776b84c0@roeck-us.net>
References: <20250403211246.3876138-1-william@wkennington.com>
 <20250404193103.4174977-1-william@wkennington.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404193103.4174977-1-william@wkennington.com>

On Fri, Apr 04, 2025 at 12:31:03PM -0700, William A. Kennington III wrote:
> We have some buggy pmbus devices that require a delay after performing a
> page change operation before trying to issue more commands to the
> device.
> 
> This allows for a configurable delay after page changes, but not
> affecting other read or write operations.
> 
> This makes a slight behavioral tweak to the existing delay logic, where
> it considers the longest of delays between operations, instead of always
> chosing the write delay over the access delay.
> 
> Signed-off-by: William A. Kennington III <william@wkennington.com>

I tried to apply your patch, but it fails. Please rebase to the upstream
kernel and resubmit.

Thanks,
Guenter
