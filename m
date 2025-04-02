Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4756AA7;
	Wed,  2 Apr 2025 16:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743610573; cv=none; b=qk3oIBSkh+NYjZJ4H3pXRvUwONGAf66W0pKHGoJ7YmLH6xivYlIvMO1U60C11IQmkPIYqvQifctH/caOVnzLD/868ehPYIHkJES2BfNu9CzWiwy17fTTNjyXIzUS+3AVCPw71jws4M01wYgDQa5pmkipSuUFYw06EUbzEeujtnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743610573; c=relaxed/simple;
	bh=zcYxExDJJxUptiQNmO51HdOub5wf/xEuUH9Jg1yCEj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L3EU7pSv+lU5VAYTIL52txG06gSFrpf6t5RfCcCltZE5LL4n3r3grdCksqcfDvsPYik7RS6nkUZblunfVoLpVWxmG2tn0yd5AoPeEIOi8EXz4tpSg7Tf1GMoUDwNc1Ci6zWIPIMCW+PlFjgLl+Vz9Vhq6XCBOEj+HJTLrDxxCeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A+hLVw3k; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A+hLVw3k"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-224191d92e4so322275ad.3;
        Wed, 02 Apr 2025 09:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743610570; x=1744215370; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eWeEUdKrFFopGkcEPw9Fy9Pt4KEeMAVjE/LtGWy1gjY=;
        b=A+hLVw3kDmOKThaMUAZL88qP9m56y6fspo25gFTrjtUToK163KqQyKiigvNnqSBVLg
         cU3A8xsyXkmhoqchyffec28FG0blQq9Tz3mk+1WySOyiCISCqXzBsvazWNMHcde2hbtv
         YpTnzOdDL6jGmNhpX8ux+fjIHZzZGZYI5fmgdwkZc8G2zjoSp57R3T0pNC9o4LCGDXwg
         JabdNE8/NQgitOyVMSvkLdeZrgYKImOOUYA1OZ4NUcjE6eDl/fhWcWf/N0A4/prcAOP1
         5o1FY1j2R7o/WV8MJBdkpVqLVMBR3Q0bEA6QSEp87X/RaYX6FxfzqpAPdWTcEh6/rVjg
         gfyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743610570; x=1744215370;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eWeEUdKrFFopGkcEPw9Fy9Pt4KEeMAVjE/LtGWy1gjY=;
        b=e4Z+pJSQIVDUFK0ZHHqcy6YSB7X+MVeCNlrv6Iyg3Leswg9dPyV1Ep21u1BonhiLJf
         oejKoAi6ib5kSZqEeOWU07lfXE+sYZlWoaskdp8IOCMPMcwEwJYB2GzfGckI7gAFYV/W
         YkKq3kv/AK0NS26O/RJvawijec8I3xygju1CiV4SIz8L4AoYFQiBY87cSPjK8wKNaKiu
         uAV8N+J4eWpu+g1oG4YQiW5honIjXx581vjzKbZnVh+u3/yQ15dhFVm0Dkh4e2oqgzUB
         hOCRPrcihhjnFj23n7eR5heKmxYIYm2E3kjOZltzz0LkZmlsSQgAQzgFeamLV8hwLRYZ
         AtWg==
X-Forwarded-Encrypted: i=1; AJvYcCU3SxOdpEtXr9eac1VRj/EPDVDuYb6v92AO0ykHaEKCwCP6vKnGh1Y3mPbJ32JILakvf0rOOHI3aGRGBFc=@vger.kernel.org, AJvYcCUG1TLxhnjxteHZqJbMSBmvKWCv35Gpa6q7rF+grkE9obnkgWXaOu6eLFxdWqqMowypsWNrfiAUHLFVHOuA@vger.kernel.org, AJvYcCVGlqTV+KFupGoPeSgr3R/6ejtzOrVIw9yOGDm4lRPbt0n2Da3+dt2vkapzIspGQ3ykKH8kC9+RKTD9@vger.kernel.org
X-Gm-Message-State: AOJu0YzIhKiLD7z+H564LZu3lnyPbwqSGFTJIyo2tuqP3KrEx4SXih31
	rlVqWIc6bTU/2GCLw5K0+0Rf171EmsR4+JhJ4ykHxGRfUNUp+u4d
X-Gm-Gg: ASbGnctPf2MIoCRh4s2zYAzrcNI+ztzFbBWCka1gzPlu6F5jiqYs5YvD8/W7XgN0KEI
	qpoOQc+ITRBS9mlsM3zxUQxxk2Z9Y+0cr3horL/DMmePU2dm5YuzorpuedfeaUN4Xs3eYip3u1h
	A4HrSMG/9BdX7pqt9NNYxcNT+0Z+/+flcwgh/KtpNUH8DZNsJk3TT71r47FJU9GcpVwg+OUWRUs
	moevwuHroYHL0JIuRQsCsi3Y1A9jqRcWdlhXe2A54xv3KiQoJtE9dzTf7aht+3suUW6lUlGqNe/
	TEkuEJ++IPtMuNLTyUDoPL7+H00aPm0JRk41t9LiVnq+LkIU40UVkpE1c8++uzvGK3vY
X-Google-Smtp-Source: AGHT+IH7Eyq5GdL4gc0rSkTOHhzZJgdGRbbIO16jVaT1MBVp7f4c1IA7kf/22Y/v4TZFYtbF/l1TZQ==
X-Received: by 2002:a17:902:e5c6:b0:224:f12:3746 with SMTP id d9443c01a7336-2292f97970fmr273680515ad.30.1743610569832;
        Wed, 02 Apr 2025 09:16:09 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739710d4d71sm11153029b3a.161.2025.04.02.09.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 09:16:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 2 Apr 2025 09:16:08 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Farouk Bouabid <farouk.bouabid@cherry.de>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] hwmon: (amc6821) Add PWM polarity configuration
 with OF
Message-ID: <c07b61ad-25d3-4ecb-8d95-d025f449fa54@roeck-us.net>
References: <20250402102146.65406-1-francesco@dolcini.it>
 <20250402102146.65406-3-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402102146.65406-3-francesco@dolcini.it>

On Wed, Apr 02, 2025 at 12:21:46PM +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Add support to configure the PWM-Out pin polarity based on the device
> tree. The binding would allow also to configure the PWM period, this is
> currently not implemented by the driver.
> 
> The driver has a module option to set the PWM polarity (normal=0,
> inverted=1), when specified it always takes the precedence over the DT.
> 
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>

Applied to hwmon-next.

Thanks,
Guenter
