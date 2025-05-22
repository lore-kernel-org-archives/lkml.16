Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1EB2980C7
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 15:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747927050; cv=none; b=C33DvALSJNRvKWygkE9aZmWRf3lavGCE7HSOZEg7eRzTXfNVI+Pdw97vMx7ZuoUcfatTvWRhsT3jSWXgJTFbXD8rFgjc5ea4I/VpWcH7RFAC6ctdmo2enPoX6lO6Lw8PuCutx1Khb+/GllbPUKSWa2U+FWDE4RUplv5BgKXPYxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747927050; c=relaxed/simple;
	bh=yECD6ZktgTjXDSCFgMyFUoroNATnVYVOCITlOnNEHpc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fI4VgsRE6YezUcIcQh9xxziXlE8BdxLWZmsOGqvXDb47vf9kdsuwyG9OpO8GsBupxs1Y7NZNfTdnGOg/CA+sJ0pXJXWRkRP+nT09goPDhM4Z7EbGLoam1gH3R30sohBzPYUe9HpoUaQxW4UnEv516ME5DPQeypYqAlF0GewoPi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XLPHO6rK; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XLPHO6rK"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3d80bbf3aefso21003825ab.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 08:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747927047; x=1748531847; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IETGeB30Ud5t90dKFtz7PPdKbD88fIhHcL4tZXb4WTs=;
        b=XLPHO6rKWko+sw+IZXc/CqddPJL2u1YVjas/lQyH6No6tywCoJ7tXRSOTQxrtLDOVH
         LNnjbQDtVPx+89YwKtWJQHrYaKnKaB2ScLHuG13vC8AwOKipjeQg3aQt1ryQnI8tvACg
         V3CIVdUvzcmWqoCUHxCjnID5DGrM0g0GvBXRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747927047; x=1748531847;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IETGeB30Ud5t90dKFtz7PPdKbD88fIhHcL4tZXb4WTs=;
        b=hFTsuXK1YP5nmm5quhhtL8VTMEarTNzQatW7U4BOsL8pnr6+stiP1M3zoWaOJcvn7U
         NBYBlLozxZsu2N9eZq9HsXuyijbzn0WGAAxnzNl7cuurAllN4dCuUIN24bwmLhndJfiy
         PbE9etvj4c/mXAGFx0kGsNNGEHMWhQaUbWycdcZh97tk5/KERzYfuAEZ/11izdSiKqts
         5azMy3yt+u2wZ/Wp0OPRlILIN/7UL63PvPmMlt00+PwB0eXnQWzGy80cktDhWEYC9AHw
         s821JjmsitIuA49N7KRZN2r3nNB24zDPRDVxixyZMchL+0lLB3NIvfXl2gC03aX+Bhkx
         kNqw==
X-Forwarded-Encrypted: i=1; AJvYcCUYL6WAtN67qAMM0t7qrQPzYLlaHrhR9mlyEfC1kidU6NPhmELTcy5wmf3lQpun2pONfjAH/ByCzDPXsow=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXjSoEGlQWXNJqLm9Lz8Zh3Xd9M8a/tVsD8gm7XSw6k/15kBdw
	RdEVtOl6ueUpzE8Q/QmqTV59nNQTGbrQkJY3bjcl6RRsEs5cyCo3BPwyHrMVUqmUY24=
X-Gm-Gg: ASbGnctZKrVrGZnEt1qOnBOBFqBpcf5V8nE2ua/JHiIXkaN2/OI1LKWbJClAazMVNs0
	q4OcheMK+OX3Ng9lFMb4nDR+a+6ijZ3FNniCbL4zpEZ1qTo+vZqWbRasBQlfrmYn8ayomk2Qc8s
	3CHktISAWLN6QkpwmveSefU/bBUAVTijn4GgWOJNEgjMyjhJ/L73HFTq36KS8yyrGWChYpTb46n
	o6BwUI72zWNhV5QjdIiaRjERLAv2xwpmEd9m46UOmROY4UFH8Nt5271EFeCh7+BGuuiHP+4dXuS
	ZVhLQZJchNrh2YR7oqQGXvxf8ptsBWAtEGZOrsEEDh4Zx6gf8Inzw58WzlMgzQ==
X-Google-Smtp-Source: AGHT+IE4miy92v8IzzM9z3nzWIqMhYC4PYeZ/1gnpzPA+Nm1GpEEXc0VF3cDp3wCEis+0MsO80e57g==
X-Received: by 2002:a05:6e02:3e06:b0:3d5:893a:93ea with SMTP id e9e14a558f8ab-3db843046c6mr236224255ab.13.1747927047461;
        Thu, 22 May 2025 08:17:27 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3dc8ad89ecfsm5792365ab.26.2025.05.22.08.17.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 08:17:26 -0700 (PDT)
Message-ID: <2b7acb5f-65c7-4787-aac5-ebcec83c8ac0@linuxfoundation.org>
Date: Thu, 22 May 2025 09:17:26 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/cpufreq: Fix cpufreq basic read and update
 testcases
To: Viresh Kumar <viresh.kumar@linaro.org>,
 Swapnil Sapkal <swapnil.sapkal@amd.com>
Cc: rafael@kernel.org, shuah@kernel.org, gautham.shenoy@amd.com,
 narasimhan.v@amd.com, linux-pm@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250430171433.10866-1-swapnil.sapkal@amd.com>
 <20250519075854.opnlhjlbybrkvd2k@vireshk-i7>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250519075854.opnlhjlbybrkvd2k@vireshk-i7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/19/25 01:58, Viresh Kumar wrote:
> On 30-04-25, 17:14, Swapnil Sapkal wrote:
>> In cpufreq basic selftests, one of the testcases is to read all cpufreq
>> sysfs files and print the values. This testcase assumes all the cpufreq
>> sysfs files have read permissions. However certain cpufreq sysfs files
>> (eg. stats/reset) are write only files and this testcase errors out
>> when it is not able to read the file.
>> Similarily, there is one more testcase which reads the cpufreq sysfs
>> file data and write it back to same file. This testcase also errors out
>> for sysfs files without read permission.
>> Fix these testcases by adding proper read permission checks.

Can you share how you ran the test?

>>
>> Reported-by: Narasimhan V <narasimhan.v@amd.com>
>> Signed-off-by: Swapnil Sapkal <swapnil.sapkal@amd.com>
>> ---
>>   tools/testing/selftests/cpufreq/cpufreq.sh | 15 +++++++++++----
>>   1 file changed, 11 insertions(+), 4 deletions(-)
>>
>> diff --git a/tools/testing/selftests/cpufreq/cpufreq.sh b/tools/testing/selftests/cpufreq/cpufreq.sh
>> index e350c521b467..3484fa34e8d8 100755
>> --- a/tools/testing/selftests/cpufreq/cpufreq.sh
>> +++ b/tools/testing/selftests/cpufreq/cpufreq.sh
>> @@ -52,7 +52,14 @@ read_cpufreq_files_in_dir()
>>   	for file in $files; do
>>   		if [ -f $1/$file ]; then
>>   			printf "$file:"
>> -			cat $1/$file
>> +			#file is readable ?
>> +			local rfile=$(ls -l $1/$file | awk '$1 ~ /^.*r.*/ { print $NF; }')
>> +
>> +			if [ ! -z $rfile ]; then
>> +				cat $1/$file
>> +			else
>> +				printf "$file is not readable\n"
>> +			fi
> 
> What about:
> 
> if [ -r $1/$file ]; then
>      cat $1/$file
> else
>      printf "$file is not readable\n"
> fi
> 
> 

thanks,
-- Shuah
