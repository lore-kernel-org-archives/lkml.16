Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659E923C519
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 23:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747439420; cv=none; b=XcstYsnfYJ0T3yUQqA365Hc1qrY0lO9m/RRP26avZNVAywyBLFbvTTh3zyc93fF4gX9Sul2ZiyyJjzy+euFB9zJdriVnTZ01ptPbdlCURf9RC4OrCIC2hPrq/p2lG99eym37v+E7Fh8as6sMF8x6D/5oa9fvaikrP/Y3X3q4VwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747439420; c=relaxed/simple;
	bh=cIhmKnl9pmbuaLyPa5cnWoEJzgRxP9Xlcly9lzdQf/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sHbwSGmPmfM/7ZEhP+VKr2TN7tPdfT4Npz6YITSiG+rjLHqNGdBlXpcPbFq+s8vSEL0/UsBJBtRZthn9+2VXEmPmUv/9j7ZMRhZ6s6GvAXnMILeMa/7/OhJoiP6YhcD8E1SfyQr3oyNYevrJpTThl0lm7ClmeFjO0XoYZ7CK+Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=NRDZ+kBn; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="NRDZ+kBn"
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-85b3f92c866so78034339f.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 16:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1747439417; x=1748044217; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yQaSoqX0/pIfcIucNOJN6d+T+I/LMA7mQWruzAWhJ4Q=;
        b=NRDZ+kBnlap0QIOrm0gi9FrEwVi4fZ0ULYc2gOvQvzYxe/oJv3u+u6prmNeV570yjL
         HceG7xsqWfmwXPyU6c88nuE7NGp22baFGv2oyck3Cwq2JOImxan60IAeTVlGk7ricAQv
         UuDk/R41xcBskm2cPOSOK9DZ+WTLr4qZhZcaLJc2cyVwA5a04Ilzf1PZJ9pi2/J18B/Y
         sQr2FjJ0H9Dv4Kb7IjICE+4e/Df1IQX0zHFT/zm9tkaGieMT/lKIywPJPCn68ZiZAwyR
         XmpLbdnAB8XqWtrTlsAyYJJzVgk+9F0JnenUQtoK2Ko6aJMsU/4+qf1Ll/olwUAta3cZ
         LbEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747439417; x=1748044217;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yQaSoqX0/pIfcIucNOJN6d+T+I/LMA7mQWruzAWhJ4Q=;
        b=LdkJvRlc11cjcV6VnOPMDTrDUW5YxmxLNL97yJgGwAMbeJDRbNpiZw3pr0Cec9Nsni
         Qx8tDK052aAEEF/+pXKIXKI5iyHTgzHfjDQa9rPbsGTwai8J2G53R+a8Fsyz/138Wg++
         XW7bStalf3fFa2UvMOMpZYdqnKX0yzT8XFjnicBOxGLwT/ejPAOXvZeCyCV7cPZSRZzB
         jIzIN7knhvSNbBzh4gEQ3zOQlu+b1R94xkV9d7Zwc7SVsbshQV4Ire8OdSOHtT+YZJLa
         sI/emd4vTA9P3ZKMqwaxjA66/X7X0+/i6b0K3vz3gVYYFv/aUVxv12DdrxvGxYSIFZcI
         bLrQ==
X-Gm-Message-State: AOJu0YzOoXXi29QWvdYelSIU8yXR3q0W3Jkdbq4qvPbDi1syrydt8ISF
	ioLL1liSp+M7Zasm0w1uMIYiB3JEimfzTBpDNRFGOaRpyGYYhyRKeVtWqyYeVlYAZalGkngfJTj
	Eovpt
X-Gm-Gg: ASbGnct7GGKqJ7Tne/jK1y3a8/hYcMJofj3VjHfQe4HT+rQIUVZ84Nn+Ac4PZJem4TO
	Z+XpWU6kqmW5QJqIuTflYPIX44LuOC/3hSedAtuD7B2fSCcVQ8WFKPGU36YzKvYGEL9hCxON/e8
	4sXRYRSNcVP1MZAbF/mFbfW2N9WiR2QpNxj+Rnbj081dD+6ps/x9tcdZbpEMDJLpdPzKOvMtLeg
	EMD5AbSnVTe0Wqnrn5sBPdvKB+r/CAmbUfDYoVT60iF0lHZXzXut5nvZEiOZbBE8oiQfUZ1utWw
	PzzHaW53c6IZYPfCig+/tN+9xQQc3deIwzOu1f6KML+uOvFO
X-Google-Smtp-Source: AGHT+IHeK6doz8UKwu3B/EEgQoN7WT9omhJzvhnJ+3Tng21s0mYcGBJxnK4SQCBPye1wm4ajNZXaEw==
X-Received: by 2002:a05:6602:b85:b0:864:68b0:60b3 with SMTP id ca18e2360f4ac-86a24cc81e9mr553108539f.12.1747439417331;
        Fri, 16 May 2025 16:50:17 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbcc38a46dsm638985173.16.2025.05.16.16.50.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 16:50:16 -0700 (PDT)
Message-ID: <2bf9e08b-2138-493e-9cb0-df70f0842a8e@kernel.dk>
Date: Fri, 16 May 2025 17:50:15 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kernel: fix acct.c first test openai codex
To: Ozgur Kara <ozgur@goosey.org>, Christian Brauner <brauner@kernel.org>,
 Jeff Layton <jlayton@kernel.org>, Song Liu <song@kernel.org>,
 Joel Granados <joel.granados@kernel.org>
Cc: linux-kernel@vger.kernel.org
References: <01100196db61ea53-3ded88b2-9571-4516-b244-6c970990a627-000000@eu-north-1.amazonses.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <01100196db61ea53-3ded88b2-9571-4516-b244-6c970990a627-000000@eu-north-1.amazonses.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/16/25 5:15 PM, Ozgur Kara wrote:
> From: Ozgur Karatas <ozgur@goosey.org>
> 
> Hello,
> 
> i want to try out the openai codex and it seemed like a logical
> process so with rcu_read_lock() a protection is started but we dont
> call rcu_read_unlock(); it has to be called to end rcu read lock.
> 
> I guess, this means rcu stays open forever and data structures are not
> cleaned which causes performance degradation.

Don't send obviously wrong AI garbage, please...

-- 
Jens Axboe

