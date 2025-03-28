Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062291FDA8C
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 23:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743203644; cv=none; b=RHUNSt87jkhnSa0N1Z0N+hu1VTtYZwXbZQyLnRPkgpBB2pVhjIXhddsQ5hON8Hi9V8g+RW9La5xn/CZXZ/CjnjRzRQ7my4fSdmwlXYpeWp5OjSRMWMrfo42jAkAifmbk8gNqeLO08Y14Dy0zTnd7N8p4CvJQ2Er9GOm9okMzAdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743203644; c=relaxed/simple;
	bh=t94ZB/a5qQUmwcFfEIDjBB2U+w06Wmg9G7OaftUk6+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=I2kGJrZMZpzXchtCpqpiiigxyzPXEU86OCD6MTPXJtfdgkeN4PJIlrlTNH5bVO4hgT2oFnYxJYHIIR0DP9px/M2bRP5kVKzRewprHWFbhhi5gX7eZpjxBUCCoa/i5sKiHBrTVRGG4nzOQXz6slrpTDztjSroBRvopayouajcIXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YcPv1t0+; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YcPv1t0+"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3d45875d440so11103835ab.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 16:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743203642; x=1743808442; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Yr92lcwq5x0ZFyCbkIww3KuTV12e93SVlPMAsCMg51Q=;
        b=YcPv1t0+mNWmv3g2d5Of0qd5+ZUd0O2LibiMv34xU/XVep4hJRVk1vzOOmAKq0ua1W
         Xwx3rTHs/Wpt8ZNyyN7T/fw1EmGAe6gC2Nl/4v+raiwOFnu55XSlonlr0Xs7PKRRWleW
         TivksR/IyNbOOm/geiZwG/QodpbEoiw5GDWfk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743203642; x=1743808442;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yr92lcwq5x0ZFyCbkIww3KuTV12e93SVlPMAsCMg51Q=;
        b=WLoGSmyNXFwqNHbMjeDVuhERJVglaTbr1fLT/AQdRb8dmTHHxBx8gn0PCQ8YWHviYY
         BIy7zn45EHx/4kqj/Nn6pknt7ycJnX8stqT7/IokW+FNqFTYYowiOE5ImonBWZ2g6YYY
         MoUW7G9s66fGqRZaeYKdtMKQMldwweSyYRrCx3nt4AQBQohgm1Z58tf89mbtxI1PQhYZ
         fuwvagi3Bwj7xJ7yEAf8lgjqbG0c4yFSXlR+CPelu3J4mi5ifHGWBOvud28PpSrjDiDs
         a5IBl545NYNYcdedbepHD3mgKF/a+BBCXRj9hHj1ZLjsDRePX1TWa5I7S6mixbG9pij0
         n60w==
X-Forwarded-Encrypted: i=1; AJvYcCUnAgxHNatEgvRf9VhBaIXliGeCrHrwWyf9TiIbzxsRiJnhRDJzcx2dizFpTE3CK7lEcdS0DqGRy4h5M7w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyU0j5y5F6WcH7t/j/5+UjcReG0VtTcbtBGM4D6+KYX390jugra
	Vz9mJ/ueIzNfMuTc0NpeTCVSL+h66jCHgf7L/tU1heGTmSSEQ0cPrR8eqOiYMZU=
X-Gm-Gg: ASbGncuVwNuVIeZ3VmxnIDjn7UFpgrNbi5l5LIwrSqlKWaONMVI2hezhDvmc5d3kkYP
	Wd7ync9Dk3hMURazw9W6euWAnlIEUlXiBt7FVk1MBW8bTYeVkCC/eCOfuvmyQhFRkdfmOBwtJIC
	gG/DYwh8aVBL1Lyb/1k97VT/wAh6Sj0kV4pXZ+izAAF8TQ1YH3rO2zCAimqwB6xXfrMoiz7Ndbo
	FafXDlSwnFRktsOZq1FjczviL4dBfC9z1KNoKdEaNXlrgpVYAWRTqFIcV4aRJwnzLsXAtndGcJ5
	MPAw7T3YEIxdX84gX1H2Lh5RDrUYxJxj9qnLwPqBym/7ezHfoIZG7ow=
X-Google-Smtp-Source: AGHT+IH70oQnJuM39SPUEueHTkjRUfH10oglLKDNJ/rt0bF923Ls3rYLJLdj2umTWLyd5RtMW24WAw==
X-Received: by 2002:a92:cda4:0:b0:3d3:fcff:edae with SMTP id e9e14a558f8ab-3d5e08eb18amr15510035ab.3.1743203641817;
        Fri, 28 Mar 2025 16:14:01 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d5d5a6c6b1sm6921945ab.17.2025.03.28.16.14.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 16:14:01 -0700 (PDT)
Message-ID: <341f69ce-2af2-4c13-8144-146f1aa9fb07@linuxfoundation.org>
Date: Fri, 28 Mar 2025 17:14:00 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: bug report for
 linux-6.14/tools/testing/selftests/mm/pagemap_ioctl.c
To: David Binderman <dcb314@hotmail.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "shuah@kernel.org" <shuah@kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <AS8PR02MB10217315060BBFDB21F19643E9CA62@AS8PR02MB10217.eurprd02.prod.outlook.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <AS8PR02MB10217315060BBFDB21F19643E9CA62@AS8PR02MB10217.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/26/25 13:25, David Binderman wrote:
> Hello there,
> 
> Static analyser cppcheck says:
> 
>> linux-6.14/tools/testing/selftests/mm/pagemap_ioctl.c:1061:11: style: int result is assigned to long long variable. If the variable is long long to avoid loss of information, then you have loss of information. [truncLongCastAssignment]
>> linux-6.14/tools/testing/selftests/mm/pagemap_ioctl.c:1510:11: style: int result is assigned to long long variable. If the variable is long long to avoid loss of information, then you have loss of information. [truncLongCastAssignment]
>> linux-6.14/tools/testing/selftests/mm/pagemap_ioctl.c:1523:11: style: int result is assigned to long long variable. If the variable is long long to avoid loss of information, then you have loss of information. [truncLongCastAssignment]
>> linux-6.14/tools/testing/selftests/mm/pagemap_ioctl.c:247:11: style: int result is assigned to long long variable. If the variable is long long to avoid loss of information, then you have loss of information. [truncLongCastAssignment]
>> linux-6.14/tools/testing/selftests/mm/pagemap_ioctl.c:435:11: style: int result is assigned to long long variable. If the variable is long long to avoid loss of information, then you have loss of information. [truncLongCastAssignment]
>> linux-6.14/tools/testing/selftests/mm/pagemap_ioctl.c:490:11: style: int result is assigned to long long variable. If the variable is long long to avoid loss of information, then you have loss of information. [truncLongCastAssignment]
> 
> The source code of the first one is
> 
>      mem_size = 10 * page_size;
> 
> Maybe better code:
> 
>      mem_size = 10ULL * page_size;
> 
> Regards
> 
> David Binderman
> 

Can you send a patch for us to review?

thanks,
-- Shuah
