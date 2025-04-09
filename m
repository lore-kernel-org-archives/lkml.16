Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7D521B9DA
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 23:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744241160; cv=none; b=Y2ynFNELgaY82qNmRXZLcG2dq09xWHKzChCse704MkCP2Ss+tPd+iPpExHzJ4opvsT859onsvF5cjSYZ436VvLhB4Spr7c78plCHjaS/dynh/w2+mcmusojZQKL+MoeEbN88ib00QIQBrUNPFZccIIYnx6dgfZyXHVVsALR9F/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744241160; c=relaxed/simple;
	bh=ukrjupH5egcWjPIrYEOXsnCeUeOpJ1/OzRvd7wSeBYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o2RsRcxpybFvml9Yujp0C7zHhugHh8LdX4CTeoXsHGjQwtkqtoPaG9jSoEjcYR1U6TSQHj4DC1NZgaEHQm3cxK1EqmPRgbtKllt1jHtSsOR3lxz7AD6rhDxNTtd9CsLuW9RWX9Vznj95bRQ0sZ5lrsNU1X+qoajV86/wucD//G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jsxM91CR; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jsxM91CR"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-730517040a9so175338b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 16:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744241158; x=1744845958; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B5T7Kq+JsezAl05ddJh0OEYqxPcCvamnm3AWczPZJNs=;
        b=jsxM91CRzc8iheC6kl+ee/Cd9odEmxmvsRMjceARdbGhyxz2t98nWKGrkDYDt7IEPs
         /ojWvrCaKcNHtTJLo80oc351DJIWQyCNCdTTS4vjpisYqsxBHwYjDxJYPlE6oj1SR/7N
         spfOgYW4LOSo4bEUT0TjS+mxJjsLMm7RFVX7mRlp7V9bdDu1eqxfLhRmzgqDyMpnx9sy
         hv3FWeBtKHxKzQNE/oIS94vJDTTr/aSGLqC4asVqdQ7J0zIyuOK1gRwRckxrVsRLQOVp
         QRZSvXDvm5VxMr+NqIilMhMpf2684JLYKBFtg4gdjfTauKN3B+XLafnyiwO7L4QkNuIA
         Ch6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744241158; x=1744845958;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B5T7Kq+JsezAl05ddJh0OEYqxPcCvamnm3AWczPZJNs=;
        b=ao00bEBPrIWJJkPYkPTKdphgHgYHxJXpD2mfNoUstmFf7e76L09m5Codrury9B+UyH
         f5VTgizs09vIENsYg+ObATTf2lwyEvpHqTzVpE4hlmJhzcElF25TKgAbDBLBBj4Q9zAb
         gbvQVUiJ7+HvnlFK1ouB2JfSHbDv1+q/3hOEhBksph4E5Ott2HSTedWJcOR6HRv6i4TY
         icnkph/IG+NdddmDkxQP06bC48pxDSSSVfzfxW3aRe3gGv1N8sTS5S0hjTMgcTI0Vz1J
         Le6bMpo/XdfGkuCpdm3g1SvPPyPtzS7x4oxB1klWf4beFaJw6YIB4hFeb6CExI8Ppp0n
         5Otg==
X-Gm-Message-State: AOJu0YxGEeTZPqKga6Stm7cJVBw9DXzCaOMuuN4GjymhjUDFZ2XOa2Zt
	RGAtsyki5QFTdClLrTL9SIBkKRzlErxxI/uijXbJZxKdL2Hsonf+pTiP0lDd0w==
X-Gm-Gg: ASbGncv7wakwH4pMXjImO02ckgEmXBFq117NnaGw5KBvwpRl0rJUtTHgU6+Bdregk7J
	o9GwRf3EJcfuynMbSEskSfJtmOhVjE4x8+vSFs0mInN15/L+X1XlrLA5CZ4Vivif3ojyuj2h8rO
	S70sG3YDoFumK+oevi3JsPBahUOu5H7wmT7VlvoKWE8taHTerx/Hms1M3IzBYZWm1zYqPC7KRHq
	ukQedA5hAx9XeK5/jKIAHpK2TJAaTTcx5Dkg6brkbew0GdA4eodF80cx/P8WkPgw8JVsnT6gE2T
	5uyJDv9UizwZGIZ8zdvPXL6duxME6BcG2E0=
X-Google-Smtp-Source: AGHT+IEMzFEpbKhzggyTFKKB85VjCgHWSEXWQpQeollmLsyxwUqUjZkxvTzRUd/ogQVz1sI3xUGNkA==
X-Received: by 2002:a05:6a21:3394:b0:1f5:8e94:2e81 with SMTP id adf61e73a8af0-20169450f3emr1291592637.9.1744241158222;
        Wed, 09 Apr 2025 16:25:58 -0700 (PDT)
Received: from google.com ([2620:15c:2c5:11:b49d:1682:e317:e4f5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a11d2f78sm1810783a12.44.2025.04.09.16.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 16:25:57 -0700 (PDT)
Date: Wed, 9 Apr 2025 16:25:52 -0700
From: Chun-Tse Shao <ctshao@google.com>
To: Thomas Richter <tmricht@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-perf-users@vger.kernel.org, acme@kernel.org,
	namhyung@kernel.org, irogers@google.com, agordeev@linux.ibm.com,
	gor@linux.ibm.com, sumanthk@linux.ibm.com, hca@linux.ibm.com
Subject: Re: [PATCH v2] perf test: Allow tolerance for leader sampling test
Message-ID: <Z_cCACiCzF-2-6GI@google.com>
References: <20250408074641.1471473-1-tmricht@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408074641.1471473-1-tmricht@linux.ibm.com>

On Tue, Apr 08, 2025 at 09:46:41AM +0200, Thomas Richter wrote:
> V2: Changed bc invocation to return 0 on success and 1 on error.
>
> There is a known issue that the leader sampling is inconsistent, since
> throttle only affect leader, not the slave. The detail is in [1]. To
> maintain test coverage, this patch sets a tolerance rate of 80% to
> accommodate the throttled samples and prevent test failures due to
> throttling.
>
> [1] lore.kernel.org/20250328182752.769662-1-ctshao@google.com
>
> Signed-off-by: Chun-Tse Shao <ctshao@google.com>
> Suggested-by: Ian Rogers <irogers@google.com>
> Suggested-by: Thomas Richter <tmricht@linux.ibm.com>
> Tested-by: Thomas Richter <tmricht@linux.ibm.com>
> Signed-off-by: Thomas Richter <tmricht@linux.ibm.com>
> ---
>  tools/perf/tests/shell/record.sh | 26 ++++++++++++++++++++------
>  1 file changed, 20 insertions(+), 6 deletions(-)
>
> diff --git a/tools/perf/tests/shell/record.sh b/tools/perf/tests/shell/record.sh
> index ba8d873d3ca7..b17e8b0680e2 100755
> --- a/tools/perf/tests/shell/record.sh
> +++ b/tools/perf/tests/shell/record.sh
> @@ -238,22 +238,36 @@ test_leader_sampling() {
>      err=1
>      return
>    fi
> +  perf script -i "${perfdata}" | grep brstack > $script_output
> +  # Check if the two instruction counts are equal in each record.
> +  # However, the throttling code doesn't consider event grouping. During throttling, only the
> +  # leader is stopped, causing the slave's counts significantly higher. To temporarily solve this,
> +  # let's set the tolerance rate to 80%.
> +  # TODO: Revert the code for tolerance once the throttling mechanism is fixed.
>    index=0
> -  perf script -i "${perfdata}" > $script_output
> +  valid_counts=0
> +  invalid_counts=0
> +  tolerance_rate=0.8
>    while IFS= read -r line
>    do
> -    # Check if the two instruction counts are equal in each record
>      cycles=$(echo $line | awk '{for(i=1;i<=NF;i++) if($i=="cycles:") print $(i-1)}')
>      if [ $(($index%2)) -ne 0 ] && [ ${cycles}x != ${prev_cycles}x ]
>      then
> -      echo "Leader sampling [Failed inconsistent cycles count]"
> -      err=1
> -      return
> +      invalid_counts=$(($invalid_counts+1))
> +    else
> +      valid_counts=$(($valid_counts+1))
>      fi
>      index=$(($index+1))
>      prev_cycles=$cycles
>    done < $script_output
> -  echo "Basic leader sampling test [Success]"

Would you like to add an simple division by 0 check?

  total_counts=$(bc <<< "$invalid_counts+$valid_counts")
  if (( $(bc <<< "$total_counts <= 0") ))
  then
    echo "Leader sampling [No sample generated]"
    err=1
    return
  fi

And then `$invalid_counts+$valid_counts` can be replaced by
$total_counts

Thanks,
CT

> +  isok=$(echo "scale=2; val=$invalid_counts/($invalid_counts+$valid_counts); if (val < (1-$tolerance_rate)) { 0 } else { 1 };" | bc -q)
> +  if [ $isok -eq 1 ]
> +  then
> +     echo "Leader sampling [Failed inconsistent cycles count]"
> +     err=1
> +  else
> +    echo "Basic leader sampling test [Success]"
> +  fi
>  }
>
>  test_topdown_leader_sampling() {
> --
> 2.49.0
>
