Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934CE12EBE7
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 01:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745544798; cv=none; b=ulE10VD7KsYGwzOvzP8lvlAlWACCM0+agRzfL9Fe3h1oWKLQFJMcnUeywu/EhG9Gy6YF0Y9qX0gMU+TwF9bQ7g0yQCV2L54aOp1pyWwPGKN2N7Z1Fo3mrNc9pzv349piC3NWzK+bi5KO/MCPnWF8vJLQVJIEJAJ4AnJjxx4X2FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745544798; c=relaxed/simple;
	bh=BbUwCVnE5Tc1gzYszd7fjhvdn+1SNnyFMsCZIyRtbhM=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=YdDGof6gZVXatxp+16bwz6Y6w9XTNEWzmIocQqThH2iml0RpWKEUQ6L6LM8S4MQ4Xvt/o6Su/6PEQmy0eim0C8KQtiO2iMXeIalWGo53V03n2qRla3lqcFOdUp2oY6T7RzDHIcPSnO8IwJuywzWPlyGK0/eWMqLYKqz53BE+9GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S3JFLANa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S3JFLANa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745544794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VcSXw+s5+3IcDt4ycVWOHEvd84hZVwK8heBLaI0+unM=;
	b=S3JFLANaFkm1xHyY8cNtkl/2ZXMj0Q8+r7PdTYZY3GXIYNyFUxYYqme/6/IE6ucYB5Zvw6
	MpmksmH6wqqgGRhzHh90gZbxJDWVRR8fsDAyHiGYIX/Om2eQhkTSiQAMSklxyG9UiY7vB7
	14U5q1pOuwaWM4PysT2BGl6HSh80mXc=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-418-SdDDGt99NJmBkIOWg8VpLw-1; Thu, 24 Apr 2025 21:33:11 -0400
X-MC-Unique: SdDDGt99NJmBkIOWg8VpLw-1
X-Mimecast-MFC-AGG-ID: SdDDGt99NJmBkIOWg8VpLw_1745544790
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8f4367446so19645666d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 18:33:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745544790; x=1746149590;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VcSXw+s5+3IcDt4ycVWOHEvd84hZVwK8heBLaI0+unM=;
        b=N0JryLzCFEwqA0YAayo46nhrZhNnVTF2h0gUPkSyM0Nylqzs9jTo3jveQRYuZFbLLx
         HQOXcTrIPwTvAhFvNGxZX0oZCI/dGj1tdXTsbrNNPHMaYnJlHRNzAM/zO45j+CTzE/sY
         hn+kq2RXiqCbUfqMwJNgqxynHpAUgp3VO4CLEeG3G9L5Zuz0XdtKfYc0phnpfo1Ulo4T
         nSX5zLZIrdMDiCS2lhzsaexlLko+ZX+7oSkVRsCV7HPuP5Uqi/Xug/03A5s6/uUhuG2X
         OP5EfQCiFZN7Nmmtnigz5X7+uiSVehVvTMWDc2JWrR4A3zdlaaWC2y4Hu1kIi9Kh6tqG
         q47Q==
X-Forwarded-Encrypted: i=1; AJvYcCUQ0lrxhZV4D1lcC5lz188XdRqF+2PkfhE/nF6BjwRwRNjA8IdEL5yWbLmzvkw1O99ZzFcwWh7p0BNkRMA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcAlT5kl2ilppw5Zg7+gOBJ8QgQ53CobL5RD1+tmbXp9RhIEgJ
	8m3bzwLCprs0Nu0RxfTxPxpL2dWQeOzcXztojBqNE6iLF/tapPeoEbgyFFbSeRSRDquo/SI2bGS
	K9srcmTf4ATYx/L6k+5aufLu9msQ82KoqkWIpTnV9Iwbb6rCI3SY/HsOzWe7dcA==
X-Gm-Gg: ASbGncvg/TDMeOupd5WKrwsUlRGz1C4ZjraY1c4caSzgfcTYOA3zHcuFXaIW2rZ/vbr
	jr/TZ5L8o5IZcfSWhY61NHngRENyCohr2lQiZxhxqiVAMexjBbPMqY8ZkdROUhhRgy8HIiG5Xrc
	Jd5yC+cowgAr5VvmYVwOgKi2xXVYNzBzKAMGRI4DR7GZid7suP+E3F0rNT5J8TvfVI4RcnY1vav
	/xRooA2xqOtM2S6CirgArfbbNnjh5rd6n/iBDBHxXOcIPeo5Fo+gMBD3ixKShqlCEhERwwD/q20
	10+HVSNcBKksDq2RI0P5uv+47HtzD4yn9Du93Jdkp3jIqzWplCM3J0c24w==
X-Received: by 2002:a05:6214:509d:b0:6f4:c21b:cd6a with SMTP id 6a1803df08f44-6f4cb9bf08bmr12494626d6.18.1745544790701;
        Thu, 24 Apr 2025 18:33:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKObHEDSD0uhwvqx0FfjX6CMdc6GExMF71Kip+fcZML4+LupklZTjnnCP6brVsoSZep1xQvQ==
X-Received: by 2002:a05:6214:509d:b0:6f4:c21b:cd6a with SMTP id 6a1803df08f44-6f4cb9bf08bmr12494386d6.18.1745544790425;
        Thu, 24 Apr 2025 18:33:10 -0700 (PDT)
Received: from ?IPV6:2601:408:c101:1d00:6621:a07c:fed4:cbba? ([2601:408:c101:1d00:6621:a07c:fed4:cbba])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4c0938399sm16447456d6.40.2025.04.24.18.33.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 18:33:09 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <623427dc-b555-4e38-a064-c20c26bb2a21@redhat.com>
Date: Thu, 24 Apr 2025 21:33:08 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: cgroup null pointer dereference
To: Kamaljit Singh <Kamaljit.Singh1@wdc.com>, Waiman Long <llong@redhat.com>,
 "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>
Cc: "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <BY5PR04MB68495E9E8A46CA9614D62669BCBB2@BY5PR04MB6849.namprd04.prod.outlook.com>
 <a5eac08e-bdb4-4aa2-bb46-aa89b6eb1871@redhat.com>
 <BY5PR04MB684951591DE83E6FD0CBD364BC842@BY5PR04MB6849.namprd04.prod.outlook.com>
Content-Language: en-US
In-Reply-To: <BY5PR04MB684951591DE83E6FD0CBD364BC842@BY5PR04MB6849.namprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/24/25 8:53 PM, Kamaljit Singh wrote:
> Hi Waiman,
>
>> On 4/23/25 1:30 PM, Kamaljit Singh wrote:
>>> Hello,
>>>
>>> While running IOs to an nvme fabrics target we're hitting this null pointer which causes
>>> CPU hard lockups and NMI. Before the lockups, the Medusa IOs ran successfully for ~23 hours.
>>>
>>> I did not find any panics listing nvme or block driver calls.
>>>
>>> RIP: 0010:cgroup_rstat_flush+0x1d0/0x750
>>> points to rstat.c, cgroup_rstat_push_children(), line 162 under second while() to the following code.
>>>
>>> 160                 /* updated_next is parent cgroup terminated */
>>> 161                 while (child != parent) {
>>> 162                         child->rstat_flush_next = head;
>>> 163                         head = child;
>>> 164                         crstatc = cgroup_rstat_cpu(child, cpu);
>>> 165                         grandchild = crstatc->updated_children;
>>>
>>> In my test env I've added a null check to 'child' and re-running the long-term test.
>>> I'm wondering if this patch is sufficient to address any underlying issue or is just a band-aid.
>>> Please share any known patches or suggestions.
>>>                -          while (child != parent) {
>>>                +         while (child && child != parent) {
>> Child can become NULL only if the updated_next list isn't parent
>> terminated. This should not happen. A warning is needed if it really
>> happens. I will take a further look to see if there is a bug somewhere.
> My test re-ran for 36+ hours without any CPU lockups or NMI. This patch seems to have helped.
>
I now see what is wrong. The cgroup_rstat_push_children() function is 
supposed to be called with cgroup_rstat_lock held, but commit 
093c8812de2d3 ("cgroup: rstat: Cleanup flushing functions and locking") 
changes that. Hence racing can corrupt the list. I will work on a patch 
to fix that regression.

Cheers,
Longman

