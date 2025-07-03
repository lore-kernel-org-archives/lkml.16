Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F772BEC50
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 22:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751582916; cv=none; b=UOAg9Wy1HDLD3MjAzzpvmEaxVkPL/10YiDiLqgIt9HZfaenwRr1qOdV1paQ9zha4eMJzTz4aBK6eRGIpbSJkJchHoxvZBEtpgH1A3XS+V9iQRymcHMa5q/WWHqvmWG3pn7Vr4jcTHcQtQtJcvQj0winQ0TIXWnMFV8D89y3For0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751582916; c=relaxed/simple;
	bh=85p2LOyc4WCuKDxQym4Pij52oalpUT5w6kgjsTzNLaA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=onn7wWvhwUFeJluLt1jEa/b5SApeQzYlrzgrniqycflMdzjAGkBXJOkD70wvifXf6RMQrUBTDyO6uZYfJVDv5TvvYGsako9B9nXK4RV7KdWL4SXbcBl7+jujupKWaVQ/n0HENKA0KYK4JzG+useYhoivJ++3I01v86CwnQ5FZVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 563MmUkB088454;
	Fri, 4 Jul 2025 07:48:30 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 563MmUfU088450
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 4 Jul 2025 07:48:30 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <738a4a73-584c-4097-ab1b-156810f00c66@I-love.SAKURA.ne.jp>
Date: Fri, 4 Jul 2025 07:48:30 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [usb?] INFO: task hung in hub_activate (3)
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Hillf Danton <hdanton@sina.com>, Mark Brown <broonie@kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        syzbot <syzbot+d630bd89141124cc543e@syzkaller.appspotmail.com>,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        Boqun Feng <boqun.feng@gmail.com>, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
References: <68648254.a70a0220.3b7e22.20c4.GAE@google.com>
 <20250702080515.2160-1-hdanton@sina.com>
 <20250703000946.2200-1-hdanton@sina.com>
 <d73e0c09-b71e-40c9-af60-86b0dd6258e8@I-love.SAKURA.ne.jp>
 <de8af03b-4948-47c4-b9f8-68f7e4112264@I-love.SAKURA.ne.jp>
 <b1657fab-b34f-4f52-94e7-333577cdb450@rowland.harvard.edu>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <b1657fab-b34f-4f52-94e7-333577cdb450@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Anti-Virus-Server: fsav105.rs.sakura.ne.jp
X-Virus-Status: clean

On 2025/07/04 6:27, Alan Stern wrote:
> On Thu, Jul 03, 2025 at 10:48:56AM +0900, Tetsuo Handa wrote:
>> On 2025/07/03 10:20, Tetsuo Handa wrote:
>>> Caused by commit 9bd9c8026341 ("usb: hub: Fix flushing of delayed work
>>> used for post resume purposes") with cc: stable.
>>> Shouldn't we revert that commit and seek for a different approach
>>> than wait for a reproducer?
>>>
>>
>> Sorry, wrong commit.
>>
>> The line was added by commit a49e1e2e785f ("usb: hub: Fix flushing and
>> scheduling of delayed work that tunes runtime pm") with cc: stable.
> 
> Mathias has posted a fix for this problem:
> 
> https://lore.kernel.org/linux-usb/20250627164348.3982628-2-mathias.nyman@linux.intel.com/

OK. No longer reproducing for 18 hours; assume already fixed.

#syz fix: usb: hub: Fix flushing of delayed work used for post resume purposes

> 
> It hasn't gotten into Linus's tree yet.

Since the cause commit is only in linux-next.git , it is no problem that
the fix commit is not yet in linux.git .

> 
> Alan Stern

