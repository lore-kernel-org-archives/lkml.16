Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0361E2852
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 15:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738249311; cv=none; b=moXwlcZs9zdeDZsJGq6iw9NtzO8hWQrR5PsgLUowEk2N36d2EohoDN9PgH+C+pSFX+eMljbgiIPCAeOcjf/Vq/pgRurrdRziFysEni/zwaLHs3yXnLpBrDhvqDv2RLBSukqpPfaPQlquv5viRyvfWA2BHDgodlcSd0uArrZO3mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738249311; c=relaxed/simple;
	bh=MVP6fES/TUWbVtHsv/2ozHyeaT10DKLlq68ZLIdFEAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QpNZAqTzNhgvSgW0mdldtsOR+731iR/1cFc88EGz+Tped4zPrHOrpdFhqzIDBc3xevacXsMyv3zJaB+T26TBlFwzO1BtJbdl2accYBgl1BMUo6gFnOMoarCWqjlwav/FeuZjhErn1/pP4jD+3FEEqSTAVNxGf9nlTOyjdVCJgP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WLaTFIP7; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WLaTFIP7"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4361c705434so7143955e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 07:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738249308; x=1738854108; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E5nssC4XQnkit23jxVYSf6IabWYFQnvn+VFbG9lFrHE=;
        b=WLaTFIP7a01hYALR85U8bTtPJp9m37lymNGGavUnS50ENCQMgGcvutSeig9DEkFBe3
         MFRWO1AXUj2CtsJiL+MqEKpOqvqFifqofr0TxctKjnNQZQ+cTqpshimDt0y7PpqX9x5c
         pKxCavKMbaP9yDhIZlAAfFXXfHh/J5M28d0PvQj5aje1f4Lc6P29nll53Uizw4Izjpdn
         EPYjZaSmPALo4WFvmTlAWM7yo6TDv05jPEIf2kL9mKHitd4eX4uYX07B1/wb/dcdgrSo
         mxzoe9q7Pglkcu6FYgtAhcbxkWlYjWGv1R/o+AlJCwMP4z3nzLOzTXbZVlaymWaVTVOx
         dqow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738249308; x=1738854108;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E5nssC4XQnkit23jxVYSf6IabWYFQnvn+VFbG9lFrHE=;
        b=GBgTutlPBG5cpfXf1zss7oEvaTtvTmcnIOxjpOKZ1LgxbMX0dLhDpiUU0j47mX9PI0
         5OJmwMHNhR45LJA/FCJfDpEanTEIr2x7RUxiFfPkDrXYEuSYIyM4E7i746mykZnMkKPK
         bh7pqkWEck/ya2KT00ZUc0ajIt7YEk98meCof00njh1x/sHXovYhuSXe7jWSQTe3aFH2
         wtCO47soTTmN0v9yfEGdQLQnH86H92acCa0gpF88A6mNpxkqUj5UAIQ/HJPOT8UyUWCg
         ImAI5Z4vpCc2CZbDfYAjSJSgo6HSrWdDFoQ/9xz0H2Y3WWWEJuB1X0EDg59/z20o5jrT
         rZzw==
X-Forwarded-Encrypted: i=1; AJvYcCXTdHkjg/sVh4LqxztztNQvIooGwFzN6YTLwDMkd3CqeVAs22wtw60QtXZ7GbHQkX1HDBstWOgJ/ox0bQA=@vger.kernel.org
X-Gm-Message-State: AOJu0YysqL0ACQEbpUG5Vyicx8lczyqnLD1IzFYXjpt2GnhZUCf9SLE3
	bbc5szCw316ZMi2e+j2Wr332NJGokGLMhk/PgP+0QQAHJ+ynCjym7/Eh8rP/mv0=
X-Gm-Gg: ASbGncuDfgSUEds1DJdOooBWIyyavjh8KO5G+ZYkmKLZf6CuBXvxREyA3lx09sw0jAU
	mQbnp3EIAIoVFoYaiq0MsbmYvIWFgEdDlDE6ezhe5KBw9FcPEws0Q3cROQxDRebWWmN+8XwUK9k
	KAnmtgy5FBQJOfeW8u9WLa7ZwJ3qrUjqOqTQENafT4kukjQCVZhno1LGAEh8Ye4MlzxUaqUGrXY
	ZGRnjFpUJJ4elSAk3b3A1tnIwFuUrU5xpr0zpQhxyj0XGOH7Ik0rW60c8uBsOs9BBL8MrPlJyey
	JAVc0SgDjNQABJwr0f1imMmfYw==
X-Google-Smtp-Source: AGHT+IHJVA2266rmoxJiX09wabSR2xxdi0Gz1sWKTqvW99DCo9PqjlqaD/mbeA1plo2F8oEJXL+mTw==
X-Received: by 2002:a05:600c:138f:b0:434:f1e9:afae with SMTP id 5b1f17b1804b1-438dc3aa785mr56757255e9.1.1738249307796;
        Thu, 30 Jan 2025 07:01:47 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.107])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec7aasm2253797f8f.5.2025.01.30.07.01.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 07:01:47 -0800 (PST)
Message-ID: <0ba0b430-6215-4997-8a13-8ea74b3fe784@linaro.org>
Date: Thu, 30 Jan 2025 15:01:45 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] perf test: Change event in perf test 114 perf record
 test subtest test_leader_sampling
To: Thomas Richter <tmricht@linux.ibm.com>
Cc: agordeev@linux.ibm.com, gor@linux.ibm.com, sumanthk@linux.ibm.com,
 hca@linux.ibm.com, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, acme@kernel.org, namhyung@kernel.org
References: <20250130115756.3961722-1-tmricht@linux.ibm.com>
 <20250130115756.3961722-2-tmricht@linux.ibm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250130115756.3961722-2-tmricht@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 30/01/2025 11:57 am, Thomas Richter wrote:
> On s390 the event instructions can not be used for recording.
> This event is only supported by perf stat.
> 
> Change the event from instructions to cycles in
> subtest test_leader_sampling.
> 
> Signed-off-by: Thomas Richter <tmricht@linux.ibm.com>
> Suggested-by: James Clark <james.clark@linaro.org>
> ---
>   tools/perf/tests/shell/record.sh | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/perf/tests/shell/record.sh b/tools/perf/tests/shell/record.sh
> index b905acde8358..a17018181afa 100755
> --- a/tools/perf/tests/shell/record.sh
> +++ b/tools/perf/tests/shell/record.sh
> @@ -231,7 +231,7 @@ test_cgroup() {
>   
>   test_leader_sampling() {
>     echo "Basic leader sampling test"
> -  if ! perf record -o "${perfdata}" -e "{instructions,instructions}:Su" -- \
> +  if ! perf record -o "${perfdata}" -e "{cycles,cycles}:Su" -- \
>       perf test -w brstack 2> /dev/null
>     then
>       echo "Leader sampling [Failed record]"
> @@ -243,10 +243,10 @@ test_leader_sampling() {
>     while IFS= read -r line
>     do
>       # Check if the two instruction counts are equal in each record
> -    instructions=$(echo $line | awk '{for(i=1;i<=NF;i++) if($i=="instructions:") print $(i-1)}')
> +    instructions=$(echo $line | awk '{for(i=1;i<=NF;i++) if($i=="cycles:") print $(i-1)}')

Minor nit, but you could change the variable name too.

Reviewed-by: James Clark <james.clark@linaro.org>

>       if [ $(($index%2)) -ne 0 ] && [ ${instructions}x != ${prev_instructions}x ]
>       then
> -      echo "Leader sampling [Failed inconsistent instructions count]"
> +      echo "Leader sampling [Failed inconsistent cycles count]"
>         err=1
>         return
>       fi

