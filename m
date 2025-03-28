Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0600D1D61B7
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 20:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743192348; cv=none; b=HMtHMeKCfh1dNxZngPCQJXEfy7SsfpZbcLBLjb5qI/uoqPf9qDdHBZCgheYAke+LQrSCfte2OSXFove/wyByRjK9//wODmOo67//WTKO6VT9/nZgMK8fSgS9Zc69Iartz9D5E9ii/9RA3moIEpcUM9VEgJ0S6si/4oEIStGKtLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743192348; c=relaxed/simple;
	bh=d+ng6SS3DMpFYw0JXF3SZ+iri7iewWW6WjynoYKoTGY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IG3g3buE9lttgB/6JqtDAzondKf4Par1srEc/b/M0mJOKfCCofw+I2mBRJwl4qF2Q40u7L0bxJk80uFXMYp/QXkTnMIwqjbgOfcZ5Lhn/VsxUmJyFiqvXrXgSt4wG9GmpKtBFVKvqjRi47Fjsh7fM24jhaEb3zeE9YYA8hfipYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ViI7O1Dn; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ViI7O1Dn"
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-85e73f7ba09so215325439f.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743192346; x=1743797146; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E8Atfv4IVEOUanvfYjqZzwOBPOlf/x7n/JGPGqoqy0w=;
        b=ViI7O1DnHo551fHNMN4ch4TnhhR+EskCsirGJ/22ZOZ2AXEqV89hnyUVMmtiNSj+QO
         iil9qZ6/HScPgZA2L0kPgCiDzMtQ+/PD7R132Rh0EgSD0yf6cXMqp8YhWt8hj7X1aGlC
         zZ7o6s5Zo9TW8vP9jrgg4Ye0qeoCJS3EC9Ofs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743192346; x=1743797146;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E8Atfv4IVEOUanvfYjqZzwOBPOlf/x7n/JGPGqoqy0w=;
        b=QTvcy0FdCamaEkHgVFROOrsIJMkuTfC1fiq4ToktENEk/YGgrE4e0b1Fvtar+/SLyH
         VGiWsz+cHCww8wa9W2ylBc0zuwa08dJq8ZvFDA3Ns6aPtuykOS3kogLOeelK1Pr3DXTK
         uzatXe+fHEtaT9CJ/uJ654toHkCPJaUdBzc2JT9X5hPkptetkXfjY1/WjuF//S2l3oma
         jtrrUxegOp4B1bOt9IAIVHej0KDRmu0PTYoB6YzsJ38L7AOBnPQS9YERS8l6ercyhFBM
         9usjvH8g4ZtpEdXR4jpCojgLdxHE6DxnEh0SOrpcuztwIDJb0YJD8MkkZfsJX9mX82dT
         AHQw==
X-Forwarded-Encrypted: i=1; AJvYcCU/N1YaUlQPpFohFHm8pPeqOH2Dirb/8PnGAvzzwhvOxHLEzo/0EyrHj4EPVFeLSlPYPlx45XgnXakep1c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEzcWy94qjhoSyIWNkdwGn1IpF1uZzGMCDj2u7KSvNQUsG/nvh
	Kh+/wZix3UwVZKaK5hK58mbUXorN1whHNs2iNmv8OMxCI5PMf94ZjsIhtFM9fSk=
X-Gm-Gg: ASbGnct+1O9xXaYIVC0mqwI/J6E6I3GG1+IAtL3anudCiQvLH6fcXhtNXbLL/eRE5QJ
	oSNkgRIxDgXyf62dZNhQ6tou2VHVFV5ud0l35yJFuvwECMnAJ2MEnkc4yr7y8ZwX8vuS09MMFZQ
	68QD9Go2/P1bzK0CBCI5b0CHIwBMB+mC948iwuIAKSB144/7tkqxYygXnY/1cv5+OJ7TGRMFnHa
	g0rBAFhm1N7TQf2uI3oDUrJibB7xfoZlY/1EpJQ8gJu3bymnYlLuzvGX5kEC8mm4RE1/1BZgpWW
	E+3FK3hiKwRiqMvCWdQBRQ2KBw4Ptqf5RyNmVCsrYU72g9NOwYsapJQ=
X-Google-Smtp-Source: AGHT+IFFxZyiA9Ag1U7uneUhl0+Bjjfwis0cJdT3pe/r/icCiPwaGKDp4+SCqYja3aaGf4HhiwadPw==
X-Received: by 2002:a05:6602:c81:b0:85b:4154:7906 with SMTP id ca18e2360f4ac-85e9e86455dmr88526239f.5.1743192345833;
        Fri, 28 Mar 2025 13:05:45 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f464751f0csm595377173.54.2025.03.28.13.05.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 13:05:45 -0700 (PDT)
Message-ID: <4424b86b-b80d-4fdc-ba56-5cea5dc0b9a4@linuxfoundation.org>
Date: Fri, 28 Mar 2025 14:05:43 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/run_kselftest.sh: Use readlink if realpath is
 not available
To: Yosry Ahmed <yosry.ahmed@linux.dev>, Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250318160510.3441646-1-yosry.ahmed@linux.dev>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250318160510.3441646-1-yosry.ahmed@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/18/25 10:05, Yosry Ahmed wrote:
> 'realpath' is not always available,  fallback to 'readlink -f' if is not
> available. They seem to work equally well in this context.

Can you add more specifics on "realpath" is not always available,"

No issues with the patch itself. I would like to know the cases
where "realpath" command is missing.


> 
> Signed-off-by: Yosry Ahmed <yosry.ahmed@linux.dev>
> ---
>   tools/testing/selftests/run_kselftest.sh | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/run_kselftest.sh b/tools/testing/selftests/run_kselftest.sh
> index 50e03eefe7ac7..0443beacf3621 100755
> --- a/tools/testing/selftests/run_kselftest.sh
> +++ b/tools/testing/selftests/run_kselftest.sh
> @@ -3,7 +3,14 @@
>   #
>   # Run installed kselftest tests.
>   #
> -BASE_DIR=$(realpath $(dirname $0))
> +
> +# Fallback to readlink if realpath is not available
> +if which realpath > /dev/null; then
> +        BASE_DIR=$(realpath $(dirname $0))
> +else
> +        BASE_DIR=$(readlink -f $(dirname $0))
> +fi
> +
>   cd $BASE_DIR
>   TESTS="$BASE_DIR"/kselftest-list.txt
>   if [ ! -r "$TESTS" ] ; then

thanks,
-- Shuah

