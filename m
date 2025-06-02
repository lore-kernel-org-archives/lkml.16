Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B0F14A627
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 23:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748905301; cv=none; b=mIgyr4P+ZgSV8bANAF7ETg9xmL+qx8hFZZm5k7/Di2AQ457Rkh6+40CVysWDIh2L+/dl+MQ+jsLKF2Gh1QjKaVwL/62pMAiSZp26G0QBzF/R1RFH7ijfN5TCccMl4nVD1ZHJOyq1G7bA8H6DubHlZEukSSWRYgt8igs4UhWL1bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748905301; c=relaxed/simple;
	bh=59eUBlhzOV2ckFatOfYqfREuM/wpDHlCvgZc8i4N5WQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ti+/SfTQwTjEQUUDx4VRVK4ihzy9l+c2vHOwLgBLHPhkHYuJoA8usw/iAIgqpw0JBbezSIN84qLM6HemY0FgDYKeKZVeHS3QcxphQ9yk/Qobh6ws/i3JZmI/+pFcgXRyCVHljPIASPzOC0xisrLXNIsrumBG3/ZbNZVqoAG70bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UpbcH3QQ; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UpbcH3QQ"
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-86d02c3aab0so95020639f.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 16:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748905298; x=1749510098; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+equ+3upmf1renBJmqziOzoGh1hJKKHZ35K0AIOI15U=;
        b=UpbcH3QQBt7xSsPgdsjrTchk3QKjaL7yNRJ1Oe5c3GsFMO5EIGKwNB7uQKrflaKVHS
         52gW/6xS+VbBx0LFHn6nz30qp7MXtt7rOQG8Myo+MqkhZJfWNP6v8cfHRB1haNgUf2ME
         Kih4RLqqetkQH+U1YSNu7UjpGyNWycY9GyZPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748905298; x=1749510098;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+equ+3upmf1renBJmqziOzoGh1hJKKHZ35K0AIOI15U=;
        b=o5TQLsmetg8aW/VPo+k3t7cbMEQHrJwgskdxHkUZNSwE+09xwmdwn/BGI3x+QL5ZI2
         B/oONaXQB45Ra+LHh4fgBJjylDyWn127wlsil8k7flUx3LuF4nkQXgSAm3TLyzAo5Jb7
         MKAxooIqY8W0RPK5loG8qgjwGLy52iUkgXsoiRjImUdDjKB8APy8uUHWkQob2R9Lazi3
         dptLUwXwlMiZ9ooYlPuWcpd2nMtlWtlHECWRxh6ooVHj4bTmTo8xXOQk5qSZ1cZfnuDL
         fH9xhsJUu+yn+2oZDyr206+o2OPaEWyEcBDmiU0Fn7YDlkwFA8ksewJis2l1vG7GPMrg
         Qmzw==
X-Forwarded-Encrypted: i=1; AJvYcCUBAgqiehZrnOQXKd2G2InSVI5qsgydu4GK97GFz7K028zltFK54eBK9UAnqmfu4F2d8NLshxD9OWjaKew=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKjEQLTU+uSLnZobarUCkv4taX9VznRfqRB0KWS51gm12lBEaE
	CauDFSiu56/sZ6kjO4pko/NGOhxzYKwn7O5ebL/xWJ/2Zb1rugo6sGHbvJ2zQxbr1IE=
X-Gm-Gg: ASbGncuDnpOIu2omMdOYWAuzqsXq1KvwI9gIIGtuZu4TBDs4etbG6G/uSH465v4Xer3
	7b1qJqDFSkSifUmYV/YZCYHnnwMqop4wS+Mb8KbOJ4CLjZjQHSVwnFwhVayEuy9FuHghOrtbADT
	tBXCFnIY185L436jdPbMssOEM7OWzVuhTBWyKhwvqDMLInFqEjMbobctsYKcDIpAWYwAf55XVDi
	oywajAJYaczundCGUQ8+idu9KDuqyVdca2AqysjhV6y4fkrhtStLX1hmOx9puz1JWJerfiWoQcg
	JvN2riJEuNEb8aFGhLSquC2TlHCai8/u2axI7Z/qAk1k3HaMStB6Yp+zxpZj1A==
X-Google-Smtp-Source: AGHT+IFrjcDEGLtTKfElBpGXOAhF3tHEPfd2K9yevIZkFCo/MB2Kge7c24XSTv/Nb7Ij2aX1xnrXCw==
X-Received: by 2002:a05:6602:6c12:b0:86f:4d9c:30a0 with SMTP id ca18e2360f4ac-86f4d9c3133mr1002247739f.5.1748905298567;
        Mon, 02 Jun 2025 16:01:38 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fdd7e28daesm1972275173.44.2025.06.02.16.01.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 16:01:38 -0700 (PDT)
Message-ID: <053cab6e-1898-4948-8f82-ac082d85a20d@linuxfoundation.org>
Date: Mon, 2 Jun 2025 17:01:37 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] selftests: Add functional test for the abort file in
 fusectl
To: Chen Linxuan <chenlinxuan@uniontech.com>
Cc: Shuah Khan <shuah@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>,
 zhanjun@uniontech.com, niecheng1@uniontech.com, wentao@uniontech.com,
 Amir Goldstein <amir73il@gmail.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250517012350.10317-2-chenlinxuan@uniontech.com>
 <57f3f9ec-41bf-4a7b-b4b2-a4dd78ad7801@linuxfoundation.org>
 <CAC1kPDOH+QZDjg46KRNmQQpH-_yLbQwMUGsiBk9gW1kqjyy9xw@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CAC1kPDOH+QZDjg46KRNmQQpH-_yLbQwMUGsiBk9gW1kqjyy9xw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/25/25 19:41, Chen Linxuan wrote:
> On Fri, May 23, 2025 at 6:50 AM Shuah Khan <skhan@linuxfoundation.org> wrote:
> 
>> Also if this test requires root previlege, add check for it.
> 
> Currently, this test does not require root privileges.
> 
> Thanks,
> Chen Linxuan

Thanks. Looks good to me.

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
