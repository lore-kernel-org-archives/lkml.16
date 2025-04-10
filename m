Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541931EBA16
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 17:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744306259; cv=none; b=aZsb7ITVAXWs1JHXiagAvOlJbU3kgq4+B+nJ3IZFs+HKkBgld+VBH19av0PumMr0456zzQTbQTA9oipKm9n/+nCaXzACMTNvu9vp6pcbPEv45FoaJujBpJvtbLVwANNIUzeH7pFa8gPH0/4iFgA7Ca88161AYRHSfoQ3uySNw74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744306259; c=relaxed/simple;
	bh=5CYYrJD1PYEc8v13A26EEmpGoRj0xUIYoIwF293jrI8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ds961dR39WZwclLaQmwPZ5qDbic8k0cbtaf5KoXcEBYoNKunwERrxVvKjKyOiHd5sP4SuhxkWqVpWq1pzQIcgmMbmbyhZCUgcpTTHDGFdVLmT54BEFsDxIHqxoRdpZ+xDBhkxwTNQmPyV20fzuX7MWkV5olL5qe1DYzf1BuBLWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AbFSbj8H; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AbFSbj8H"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac41514a734so192811266b.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 10:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744306255; x=1744911055; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lvtyE0JEERYRxIgahoru2kYgvFfID/Ihnb06JIlXHc=;
        b=AbFSbj8Hmp+qUC34mjKZ3tJbgxFKuPK1ru5cGT8fj6ZEpFyCvSH2TRkdYzxm1imcV4
         LQJ47MXAK6SAYzmyg+14zdq6JhwIcQ6Qgm2Xsu/7oLVgqTDk001EDMzmOO5OYDv+cmAt
         nDMDVIpJh44nMbQ7beqW+R9wRPjXuKPqiOUsjOYuLVvFvevkROr20rBr1CnbdJR+khZf
         W1rXxbu77HtVZNUfBimE7+M8Xcbaym00UTq2pvwLkw9pKDOtE2nEILEERXRIVVRbRIyl
         pkHW6kCYJNWtHaKFCYlxEKi0f7s5qQ5tBW3ScPVwEmjrCmgSjzo9O+bmcQFh9EX8eBYx
         Zmsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744306255; x=1744911055;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4lvtyE0JEERYRxIgahoru2kYgvFfID/Ihnb06JIlXHc=;
        b=NDwTttHvanU6L1cV91LaOWSarSZ4Ttu0/kSAhBFvQZTHnWMd5oG3EMau0zom4AX573
         KXiXMpyawGvdCkD+hOB0YlHSJlS9bw/g8ESAxgKfEAPWMypeX1WOuUu007q8mGddnAuj
         R/1bRYqLsE2fMeQwIWSmBGzGm0XQG9LUK7Rf36+qtjfB7NxZRkjKMYFmezJYyFkZFeDE
         /nonQLVMKjAzVGpmBctohNmimfuhQINbawiPrV1mmXFdxh3tuHLcXH6tKB1M/j8zkG0D
         CxHDjWg85h6IbXy8CjS5+SeBQunIXOrMeTcFBI8qT/ldNKk3qYq1alSh+FMKi/ARCTUj
         vj3A==
X-Gm-Message-State: AOJu0Yy1+hDory5KiqoC/jRnHt4Ncp+3rPfkla8cN4OEwW9JX8eKlRyW
	xhxwWBBGymQs5V7f/eEurMDg0ENyD2o1dZpJkg3t19oS3vneWMHt00MPEhc0mU+JhKOHQfMGqT1
	93xZXCODxhKO+QsNUSkH3K9ED1bL/8NbyXakK
X-Gm-Gg: ASbGncvzFlmQyca1QMVyYTPXq6J8xA+sFPa7THwn0VkehG6yCje8RmUrHO98Rw/VhiI
	ct1uQciu/5mkA92NTtZzmcg/xVmyocCMhEUDhRyOfLIG4gINos49xLDN7FRPlNQs2SaU/OT62aW
	bOynKorhq/RNdIS8Gw3DqoFGcqE3+zFZzd9/Il6mVezFc9YDE90Q==
X-Google-Smtp-Source: AGHT+IGIVRiw+Cv/qQwATtNJTY6pij2JQq0ZJjGjmjWzuhUbZKxnEfXvGQ1xO2Xzfi/rEZHAoJ61M3B4Nw6zY0b2QII=
X-Received: by 2002:a17:907:868f:b0:ac7:cc21:48f9 with SMTP id
 a640c23a62f3a-acabd181216mr355633766b.5.1744306255368; Thu, 10 Apr 2025
 10:30:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410085522.465401-1-tmricht@linux.ibm.com>
In-Reply-To: <20250410085522.465401-1-tmricht@linux.ibm.com>
From: Chun-Tse Shao <ctshao@google.com>
Date: Thu, 10 Apr 2025 10:30:44 -0700
X-Gm-Features: ATxdqUEoTmStIqytg6Rwh_dXa819gL78OYkSyS24dciTaQXPBOWtV4a_1OLJ-TA
Message-ID: <CAJpZYjX=8SXaFU_gTJBhf6CD-CWPPL4kWVL3eFenskdoxB6ZUg@mail.gmail.com>
Subject: Re: [PATCH v3] perf test: Allow tolerance for leader sampling test
To: Thomas Richter <tmricht@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, acme@kernel.org, namhyung@kernel.org, 
	rogers@google.com, agordeev@linux.ibm.com, gor@linux.ibm.com, 
	sumanthk@linux.ibm.com, hca@linux.ibm.com, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2025 at 1:55=E2=80=AFAM Thomas Richter <tmricht@linux.ibm.c=
om> wrote:
>
> V3: Added check for missing samples as suggested by Chun-Tse.
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
Tested-by: Chun-Tse Shao <ctshao@google.com>
> ---
>  tools/perf/tests/shell/record.sh | 33 ++++++++++++++++++++++++++------
>  1 file changed, 27 insertions(+), 6 deletions(-)
>
> diff --git a/tools/perf/tests/shell/record.sh b/tools/perf/tests/shell/re=
cord.sh
> index ba8d873d3ca7..0075ffe783ad 100755
> --- a/tools/perf/tests/shell/record.sh
> +++ b/tools/perf/tests/shell/record.sh
> @@ -238,22 +238,43 @@ test_leader_sampling() {
>      err=3D1
>      return
>    fi
> +  perf script -i "${perfdata}" | grep brstack > $script_output
> +  # Check if the two instruction counts are equal in each record.
> +  # However, the throttling code doesn't consider event grouping. During=
 throttling, only the
> +  # leader is stopped, causing the slave's counts significantly higher. =
To temporarily solve this,
> +  # let's set the tolerance rate to 80%.
> +  # TODO: Revert the code for tolerance once the throttling mechanism is=
 fixed.
>    index=3D0
> -  perf script -i "${perfdata}" > $script_output
> +  valid_counts=3D0
> +  invalid_counts=3D0
> +  tolerance_rate=3D0.8
>    while IFS=3D read -r line
>    do
> -    # Check if the two instruction counts are equal in each record
>      cycles=3D$(echo $line | awk '{for(i=3D1;i<=3DNF;i++) if($i=3D=3D"cyc=
les:") print $(i-1)}')
>      if [ $(($index%2)) -ne 0 ] && [ ${cycles}x !=3D ${prev_cycles}x ]
>      then
> -      echo "Leader sampling [Failed inconsistent cycles count]"
> -      err=3D1
> -      return
> +      invalid_counts=3D$(($invalid_counts+1))
> +    else
> +      valid_counts=3D$(($valid_counts+1))
>      fi
>      index=3D$(($index+1))
>      prev_cycles=3D$cycles
>    done < $script_output
> -  echo "Basic leader sampling test [Success]"
> +  total_counts=3D$(bc <<< "$invalid_counts+$valid_counts")
> +  if (( $(bc <<< "$total_counts <=3D 0") ))
> +  then
> +    echo "Leader sampling [No sample generated]"
> +    err=3D1
> +    return
> +  fi
> +  isok=3D$(bc <<< "scale=3D2; if (($invalid_counts/$total_counts) < (1-$=
tolerance_rate)) { 0 } else { 1 };")
> +  if [ $isok -eq 1 ]
> +  then
> +     echo "Leader sampling [Failed inconsistent cycles count]"
> +     err=3D1
> +  else
> +    echo "Basic leader sampling test [Success]"
> +  fi
>  }
>
>  test_topdown_leader_sampling() {
> --
> 2.49.0
>
