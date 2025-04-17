Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC04579C4
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 05:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744866350; cv=none; b=uq57hD7x6uYwt5UT8T0Us2VbDB/eNwGoxBR1NXuIAqHkQJzqZIdOFSfihhJZFKbWN6/AXgDsop41oFVdkG8hwODMgK/AiZOgL/8CpaqmqSLZrOz+uEG9nllxtVydb9TnMPWT2n5X4xM49hW5c2anJJEDj/GVUbNqpwK/dUFTFdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744866350; c=relaxed/simple;
	bh=GJLzL4W7tGH3HdN0Q5I+YGoEl8Jci+/Z5ADXQz/c/YY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=MO/ZJbUrlbOtniEKgEgpnh75dZt0Zrbft3pweBNBX+aWD2EoSyvqKPXps7TrPF3hD3IpbVcKqtao1hVFzS+nfws3/zNF7n6IWlXpA7tB44u9/vNqpSm1jmwLOu+MT2BwEKK+1hDQHqgLJuVixHVAjoU8bkI6T7wwn4pAyt9aHbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Acg66gBU; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Acg66gBU"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-391324ef4a0so59965f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 22:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744866345; x=1745471145; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eqgFD33s9tERk+XOzZm6KcVao6q/j/zXR+/Lp4rdROg=;
        b=Acg66gBUAr+MQbx/+PFNKOaLUmcAyQUR8kMWblgQ2brVIQ6uQLgg3DYwoixIn3U3i1
         7LUEjRl2Vk26aa/3iOJTby7jF0Tj7g3Ev3ma1hcBzZXxBo5gE9yW1v45Z3TdIjh9xMH/
         Wia1U6ZmC4G5eT8LPyMIianrU0F5bY90f6u3iyP9my/WN0Ef4L+4AaoByvlWEryRCdee
         lN3IjldrOb9hFA7gzpkFYFnF/nZbdO8pVGdb2I0ZezxAu0TTgj9/l4qOhFZNSPoqu19V
         k5UovWT+Ck+4vjDnYKRVZv+9QCxPcETdrbH9GTPNm5gMClqdjQYLs6fbnzpDbIIhfuc1
         hPvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744866345; x=1745471145;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eqgFD33s9tERk+XOzZm6KcVao6q/j/zXR+/Lp4rdROg=;
        b=IlWGqxCVxwtEaX7434o00TO/sCsdNdzSGzm0jOF6KmnF3/IUcgwShysqIupuv4xn/S
         b7aW9d6me40agaXP2TA1WCvVIGAbX4gd3GbG755UjA9e5+JOpFnmqImADd6uqAkB+F9c
         IOoX+l5zMp8IviKs02kNSMJnAYpyRj8hnRvTXilrILDOIEJUUIn6d1FwqnRmdDMUD9iY
         28nztBJKXHN+8Daa0UPVifP+7XCLr7lCtno/JoTA0/l8kpX/fTB6jvds+yT2c9QvVcfV
         AsMgLp5tHoUy6/CWVRJz9776CDUBkvUkms1cFA0hkaErqSnxTh18c9nAPq6pFraTwPEb
         D18A==
X-Forwarded-Encrypted: i=1; AJvYcCU4qZy2K4nfuZUTVO/0ItoCPwLo1KfmZzT9s3aZh7g4Tha7iZIVq21FknhhP4O5ptteBi5Qvi8QalA0Xbs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxuh/W08uKbxPqka6O9+zSHvosId3WBrtACwsiNgXI6ozn1TMr+
	6pZfrrJiPDsjWJgh3XrdZjxwFEY45ne7h8n5245ZHE2XhTd42nKl1rpr+hVmm1o=
X-Gm-Gg: ASbGncvNDIPOnIiaSR8IDOWI8mR5hxWsUFW8On+Bl1rU4wDbLSf6fn/ak2ArM13x6jY
	S87iYsjuqXnJLF+EXXB6xQLn9Gf9iKQSCD7V92NEl3XfA30sy1O/VmxfOKi/q5oKqNBCeFhal87
	wHf+Mtjz7SnMKiJv8YQmdLghCwi/HZBBu0R86bVPUYKj0HcK3+UPxTT6waEzruWQZB/oJNqQFHp
	8ENUit1P6yJYrPdLcYIefZoNzSflPXbte/KsCCDJlEruSiGOI9PrEOiUb4nQlXyvPZbeQEjNZT2
	Gy/YRbu05c1H7vxFw54V9qpAK1ScxcbSJCNiWQPrLzPwFms=
X-Google-Smtp-Source: AGHT+IEIW9jNhRjthZn/BEslNneJQaLVBe+fgLEIl/mEON7+W3b64NCMmO3cDGrOFfpRmmABz1KKgg==
X-Received: by 2002:a5d:5c84:0:b0:39a:c6c4:f855 with SMTP id ffacd0b85a97d-39ee5addad3mr1286873f8f.0.1744866345044;
        Wed, 16 Apr 2025 22:05:45 -0700 (PDT)
Received: from [10.202.112.30] ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30861212fa6sm2650958a91.27.2025.04.16.22.05.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 22:05:44 -0700 (PDT)
Message-ID: <e426eaa2-3c17-42d6-906f-c41443ac48d3@suse.com>
Date: Thu, 17 Apr 2025 13:05:40 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [ocfs2?] possible deadlock in
 ocfs2_finish_quota_recovery
To: syzbot <syzbot+f59a1ae7b7227c859b8f@syzkaller.appspotmail.com>,
 jack@suse.cz, joseph.qi@linux.alibaba.com, linux-kernel@vger.kernel.org,
 m.masimov@mt-integration.ru, ocfs2-devel@lists.linux.dev,
 syzkaller-bugs@googlegroups.com
References: <680081ae.050a0220.d9ef5.0003.GAE@google.com>
From: Heming Zhao <heming.zhao@suse.com>
Content-Language: en-US
In-Reply-To: <680081ae.050a0220.d9ef5.0003.GAE@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/17/25 12:21, syzbot wrote:
> Hello,
> 
> syzbot has tested the proposed patch but the reproducer is still triggering an issue:
> unregister_netdevice: waiting for DEV to become free
> 
> unregister_netdevice: waiting for batadv0 to become free. Usage count = 3

This is another module's issue, and the deadlock issue disappeared.

- Heming
> 
> 
> Tested on:
> 
> commit:         11376431 ocfs2: Stop quota recovery before disabling q..
> git tree:       https://github.com/zhaohem/linux jans_ocfs2
> console output: https://syzkaller.appspot.com/x/log.txt?x=14183a3f980000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=5348e7fd1b89a770
> dashboard link: https://syzkaller.appspot.com/bug?extid=f59a1ae7b7227c859b8f
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
> 
> Note: no patches were applied.

