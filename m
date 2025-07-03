Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CF63FE7
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 01:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751507339; cv=none; b=c1QLio7sc4IYhKf9mt4p3CNOae2cd0isVLCzn+qps5CILPX+Wy5t27oXcBfYBVflUnvM2tHTK7pxrS7KyCJkEscLvxLx0cqLQNljOgtp9tVa8rFZHd2ZFDxRyYLnrdWgCLCr5z2HgbAhs9h7ydzfeRx8rlEIoxJugK8QRxY7MAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751507339; c=relaxed/simple;
	bh=0d0Bcps9uZh98inKDi3ZM1bepI9UuqSIrMEv1zUubkI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=XCiYbj1M3ZeO1B42MfF8fd1x3Pih56lIFmzFWl7T3flYG+lXVmSMRIDl/kNpKidXAwmyQOxuFu3h+Z3t8+JIqBUw3O31WZ05JIQBejmoNhbrCYXqHTo4SKmJi2cW5t0YVaZ3pIikLbZljLmNDwIBb97zcJ2DpoelrL5DYKNorqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 5631mtPQ031903;
	Thu, 3 Jul 2025 10:48:55 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 5631mtgE031893
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 3 Jul 2025 10:48:55 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <de8af03b-4948-47c4-b9f8-68f7e4112264@I-love.SAKURA.ne.jp>
Date: Thu, 3 Jul 2025 10:48:56 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [usb?] INFO: task hung in hub_activate (3)
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To: Hillf Danton <hdanton@sina.com>, Alan Stern <stern@rowland.harvard.edu>,
        Mark Brown <broonie@kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: syzbot <syzbot+d630bd89141124cc543e@syzkaller.appspotmail.com>,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        Boqun Feng <boqun.feng@gmail.com>, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
References: <68648254.a70a0220.3b7e22.20c4.GAE@google.com>
 <20250702080515.2160-1-hdanton@sina.com>
 <20250703000946.2200-1-hdanton@sina.com>
 <d73e0c09-b71e-40c9-af60-86b0dd6258e8@I-love.SAKURA.ne.jp>
Content-Language: en-US
In-Reply-To: <d73e0c09-b71e-40c9-af60-86b0dd6258e8@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Anti-Virus-Server: fsav401.rs.sakura.ne.jp
X-Virus-Status: clean

On 2025/07/03 10:20, Tetsuo Handa wrote:
> Caused by commit 9bd9c8026341 ("usb: hub: Fix flushing of delayed work
> used for post resume purposes") with cc: stable.
> Shouldn't we revert that commit and seek for a different approach
> than wait for a reproducer?
> 

Sorry, wrong commit.

The line was added by commit a49e1e2e785f ("usb: hub: Fix flushing and
scheduling of delayed work that tunes runtime pm") with cc: stable.

