Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EDA1FF1AD
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 07:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747641540; cv=none; b=HE5kShx/ZIEXPiL3gM8298K5kKSa4pCzu63hF7HkuZ9STJn0uoq6WNBmB17Q5Ry/aPtPAGiaeglkKPKWTf94vurLAZClRGH3gCydb+pyp8a449oSwa/XqPFeNm9ZXaG05pJHkqvd4XVmc9kaOSGdOaGENkgzbwaNvvLCVT6GccE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747641540; c=relaxed/simple;
	bh=EbuXgYNC3YkFJf7lalZRaDMyCovxN1m7vKdcLXMkKvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IDT5oEWKO7A9QtBMsdQrR90emIR9Pxb9Wb5xu+wDv+JWeFJPyES5EuB08lfWNvPXoe0aw1hPj2nwziNEu6fLkdZ4gkjHU965BAlFzzWc2b3iupjXm8bbCQCEsvTu92Oz7ymbVplR5Rv+xhX3qgEXcpzzwXPsDn41b6PdZeoX+qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pjqEAHZP; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pjqEAHZP"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-30ea559c18aso2160561a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 00:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747641537; x=1748246337; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RpvLkghwnQ67hxohbUA8tW0bPeYjdTkXfUPxTmszPjA=;
        b=pjqEAHZPFWVHNAdv6FMGmafDTy0xGenR1ALVWIGz3hfVOX4XNHdR5eyUahQXHvd5g4
         58S+U/8/OBBelhoagMieZkTN11U+0m50AVttxp6BIUkKmM2U+fuxsFYsLCr0cS9kP8yA
         R0TT7y1HobZvWqhGbA/nunq+uhD2FU9rt6VEP/KK5RI/Rewu37kykoY/mFU8FqT593z9
         PspSiXr7m7gyCjkjfu8dhVJH8GSKZ4TpBvu+zbDPzoTsgy/8QSwjehDszDik0qz6biYG
         k8JGdleMV5+nmS38Ya48/Y3Jug/S4vQFM7nDCToHleRQas3ejDgraHFwxKkH+t4dWGcn
         ZW6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747641537; x=1748246337;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RpvLkghwnQ67hxohbUA8tW0bPeYjdTkXfUPxTmszPjA=;
        b=VFsB9JF7uR9pMw9pXnQDpznMeV7MLaURmPMGhBpwGZ7hhXC4mge6xmMilmZqikPF3d
         Fk7ZvXcvi/XDPNA0HDaasRRaCkqZ+IXJYCoR/Zrl15AzVcRespqMvRW66TOwX9rC+DXh
         vC2kxjYK5bqk6OeHU5hqsrOlh8N1IV4fgIwExaqGd5MsMUP2x1p7dmn29URdklVbk8X7
         c0hFMATn2d1D0cZa2Te2VFD0T3HyNmUcH9qMb9EDut1W37AkSHByq2TupW1jb4OsOqNB
         SZGPLu7YkdBpJ5zMQFej8Q+WjhabvHIs6D+ofjf03hJr/7UW6ccWrLemfvuM6lWVNAwV
         ELhw==
X-Forwarded-Encrypted: i=1; AJvYcCWakXP4rkYuKPhKjelAzsMsMYaYQaaPhxX1A1+0M+jY3gJMNqc3YgyRW2afp5ItqoiXIN10fpBLff24SMA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwD8UWKXcX8R8fyR2Km18gK1FTgAYsVKcSRKbkqupAzfDATLH/u
	QgWV7VBAWK+zOG2hvCfjFfzJIct6sc2+OXFepC93/8hKZgYv9I2QAFOJDX/pEsIzpjE=
X-Gm-Gg: ASbGnctMiXKypOzxuZFJ1DZ3kS+mK+qSzajHsxIACnCJtLf3S5u3KD7VD+VE+QbRqNc
	vuL5kXu4ANQ4ZTbRViRZbofyUaiGQRFNwHwUlmAbq3sh0QWpxO/xgZ5ezo821aOOypBtHECcO0q
	pvPpUjGaupWmL3UOFwckGGio8Gg3nG3HLMFP5fxKRtfulmWWKa1PavH9t2T2OUNqMA0G1YlMoJJ
	Wj8QnFBd3dy9O/U9pge1MX9SB9SRbDlNwWnyd6jpJScbsAfpOnxy8VKb8bAINxJD50JaOYIrnj0
	KxSexSqnPxx5fO2n4PQvKaPiGwoJvj6I6T2dvZy8sCh+Jv9+MIxZ
X-Google-Smtp-Source: AGHT+IEZ6YoOJYJfcEn2EhDcAyO09w38EVkyVoz32suEBq8tkoBJ0tXmq87v02CJgG3P6opbs6/Fyw==
X-Received: by 2002:a17:90b:4c08:b0:30e:ee6:6745 with SMTP id 98e67ed59e1d1-30e7d51f9f0mr20343707a91.10.1747641537491;
        Mon, 19 May 2025 00:58:57 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e33451984sm9685833a91.23.2025.05.19.00.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 00:58:56 -0700 (PDT)
Date: Mon, 19 May 2025 13:28:54 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Swapnil Sapkal <swapnil.sapkal@amd.com>
Cc: rafael@kernel.org, shuah@kernel.org, gautham.shenoy@amd.com,
	narasimhan.v@amd.com, linux-pm@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/cpufreq: Fix cpufreq basic read and update
 testcases
Message-ID: <20250519075854.opnlhjlbybrkvd2k@vireshk-i7>
References: <20250430171433.10866-1-swapnil.sapkal@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430171433.10866-1-swapnil.sapkal@amd.com>

On 30-04-25, 17:14, Swapnil Sapkal wrote:
> In cpufreq basic selftests, one of the testcases is to read all cpufreq
> sysfs files and print the values. This testcase assumes all the cpufreq
> sysfs files have read permissions. However certain cpufreq sysfs files
> (eg. stats/reset) are write only files and this testcase errors out
> when it is not able to read the file.
> Similarily, there is one more testcase which reads the cpufreq sysfs
> file data and write it back to same file. This testcase also errors out
> for sysfs files without read permission.
> Fix these testcases by adding proper read permission checks.
> 
> Reported-by: Narasimhan V <narasimhan.v@amd.com>
> Signed-off-by: Swapnil Sapkal <swapnil.sapkal@amd.com>
> ---
>  tools/testing/selftests/cpufreq/cpufreq.sh | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/testing/selftests/cpufreq/cpufreq.sh b/tools/testing/selftests/cpufreq/cpufreq.sh
> index e350c521b467..3484fa34e8d8 100755
> --- a/tools/testing/selftests/cpufreq/cpufreq.sh
> +++ b/tools/testing/selftests/cpufreq/cpufreq.sh
> @@ -52,7 +52,14 @@ read_cpufreq_files_in_dir()
>  	for file in $files; do
>  		if [ -f $1/$file ]; then
>  			printf "$file:"
> -			cat $1/$file
> +			#file is readable ?
> +			local rfile=$(ls -l $1/$file | awk '$1 ~ /^.*r.*/ { print $NF; }')
> +
> +			if [ ! -z $rfile ]; then
> +				cat $1/$file
> +			else
> +				printf "$file is not readable\n"
> +			fi

What about:

if [ -r $1/$file ]; then
    cat $1/$file
else
    printf "$file is not readable\n"
fi


-- 
viresh
